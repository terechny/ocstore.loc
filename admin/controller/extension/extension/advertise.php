<?php
class Controllerextensionextensionadvertise extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('extension/extension/advertise');

        $this->load->model('extension/extension');

        $this->getList();
    }

    public function install() {
        $this->load->language('extension/extension/advertise');

        $this->load->model('extension/extension');

        if ($this->validate()) {
            $this->model_extension_extension->install('advertise', $this->request->get['extension']);

            $this->load->model('user/user_group');

            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'extension/advertise/' . $this->request->get['extension']);
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'extension/advertise/' . $this->request->get['extension']);
            
            // Compatibility
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'advertise/' . $this->request->get['extension']);
            $this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'advertise/' . $this->request->get['extension']);

            // Call install method if it exsits
            $this->load->controller('extension/advertise/' . $this->request->get['extension'] . '/install');

            $this->session->data['success'] = $this->language->get('text_success');
        }

        $this->getList();
    }

    public function uninstall() {
        $this->load->language('extension/extension/advertise');

        $this->load->model('extension/extension');

        if ($this->validate()) {
            $this->model_extension_extension->uninstall('advertise', $this->request->get['extension']);

            // Call uninstall method if it exsits
            $this->load->controller('extension/advertise/' . $this->request->get['extension'] . '/uninstall');

            $this->session->data['success'] = $this->language->get('text_success');
        }

        $this->getList();
    }

    protected function getList() {        
        $this->load->language('extension/extension/advertise');
        
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        $extensions = $this->model_extension_extension->getInstalled('advertise');

        foreach ($extensions as $key => $value) {
            if (!is_file(DIR_APPLICATION . 'controller/extension/advertise/' . $value . '.php') && !is_file(DIR_APPLICATION . 'controller/advertise/' . $value . '.php')) {
                $this->model_extension_extension->uninstall('advertise', $value);

                unset($extensions[$key]);
            }
        }
        
        $this->load->model('setting/store');
        $this->load->model('setting/setting');

        $stores = $this->model_setting_store->getStores();
        
        $data['extensions'] = array();

        // Compatibility code for old extension folders
        $files = glob(DIR_APPLICATION . 'controller/extension/advertise/*.php');

        if ($files) {
            foreach ($files as $file) {
                $extension = basename($file, '.php');
                
                // Compatibility code for old extension folders
                $this->load->language('extension/advertise/' . $extension, 'extension');
                
                $store_data = array();

                $store_data[] = array(
                    'name'   => $this->config->get('config_name'),
                    'edit'   => $this->url->link('extension/advertise/' . $extension, 'token=' . $this->session->data['token'] . '&store_id=0', true),
                    'status' => $this->config->get('advertise_' . $extension . '_status') ? $this->language->get('text_enabled') : $this->language->get('text_disabled')
                );
                
                foreach ($stores as $store) {
                    $store_data[] = array(
                        'name'   => $store['name'],
                        'edit'   => $this->url->link('extension/advertise/' . $extension, 'token=' . $this->session->data['token'] . '&store_id=' . $store['store_id'], true),
                        'status' => $this->model_setting_setting->getSettingValue('advertise_' . $extension . '_status', $store['store_id']) ? $this->language->get('text_enabled') : $this->language->get('text_disabled')
                    );
                }

                $data['extensions'][] = array(
                    'name'      => $this->language->get('heading_title'),
                    'install'   => $this->url->link('extension/extension/advertise/install', 'token=' . $this->session->data['token'] . '&extension=' . $extension, true),
                    'uninstall' => $this->url->link('extension/extension/advertise/uninstall', 'token=' . $this->session->data['token'] . '&extension=' . $extension, true),
                    'installed' => in_array($extension, $extensions),
                    'store'     => $store_data
                );
            }
        }
        
        $data['heading_title'] = $this->language->get('heading_title');
        $data['column_name'] = $this->language->get('column_name');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_action'] = $this->language->get('column_action');
        $data['button_install'] = $this->language->get('button_install');
        $data['button_uninstall'] = $this->language->get('button_uninstall');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['error_adblock'] = $this->language->get('error_adblock');

        $this->response->setOutput($this->load->view('extension/extension/advertise', $data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'extension/extension/advertise')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }
}
