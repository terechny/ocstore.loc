<?php

class Controllerextensionfeedrestapi extends Controller {


	private $debugIt = false;
	
	private $version = 1.5;
	
	
	public function adminlogin() {

		$this->checkPlugin();
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = $cre_data->admin_user_name;
			$password = $cre_data->admin_password;
		}
		
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			if($data = $this->adminloginapi($user_name,$password)){
				$json['status'] 	= true;
				$json['user'] 	= $data;	
			}else{
				$json['status'] 	= false;
				$json['user'] 	= 'Invalid UserName Password';	
			}
			
		}else{
			$json['status'] 	= false;
			$json['user'] 	= 'Please post user_name and password';	
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}	
	
	public function adminorder() {

		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = $cre_data->admin_user_name;
			$password = $cre_data->admin_password;
		}
		
		
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				require('admin/model/sale/order.php');
				$adminSaleModel = new ModelSaleOrder( $this->registry );
				$results = $adminSaleModel->getOrders($filter_data = array());
				
				
				$json['status'] 	= true;
				$json['response'] 	= $results;	
			}else{
				$json['status'] 	= false;
				$json['response'] 	= 'Invalid UserName Password';	
			}
		}else{		
			$json['status'] 	= false;
			$json['user'] 	= 'Please post username and password';			
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}	
	
	public function orderstatus() {

		$this->checkPlugin();
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = $cre_data->admin_user_name;
			$password = $cre_data->admin_password;
		}
		
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				require('admin/model/localisation/order_status.php');
				$adminlocsaleorderModel = new ModelLocalisationOrderStatus( $this->registry );				
				$data = $adminlocsaleorderModel->getOrderStatuses();
				$json['status'] 	= true;
				$json['orderstatus'] 	= $data;	
			}else{
				$json['status'] 	= false;
				$json['orderstatus'] 	= 'Invalid UserName Password';	
			}
		}else{		
			$json['status'] 	= false;
			$json['orderstatus'] 	= 'Please post username and password';			
		}
		
		

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}	
	
	public function orderstatusupdate() {
		
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = $cre_data->admin_password;
			$order_id = isset($cre_data->order_id)?$cre_data->order_id:0;
			$order_status_id = isset($cre_data->order_status_id)?$cre_data->order_status_id:0;
			$comment = isset($cre_data->comment)?$cre_data->comment:0;
			$notify = isset($cre_data->notify)?$cre_data->notify:0;
		}
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				
				if($order_id != 0 && $order_status_id != 0){
					$this->load->model('checkout/order');
					$order_info = $this->model_checkout_order->getOrder($order_id);
					
					if($order_info){
						$this->model_checkout_order->addOrderHistory($order_id, $order_status_id, $comment, $notify, false);
						
						$json['status'] 	= true;
						$json['order_status'] 	= 'SuccessFully Update Status.';	
					}else{
						$json['status'] 	= false;
						$json['order_status'] 	= 'Order Not Exists.';	
					}
					
				}else{
					$json['status'] 	= false;
					$json['order_status'] 	= 'Please post order_id,order_status_id';	
				}
			}else{
					$json['status'] 	= false;
					$json['order_status'] 	= 'Invalid UserName Password';	
			}
		}else{
			$json['status'] 	= false;
			$json['orderstatus'] 	= 'Please post username and password';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}

	public function multipleorderstatusupdate() {
		//mail('phpscript3@gmail.com','orderstatus',print_r($this->request->post,1));
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = $cre_data->admin_password;
			$order_id = isset($cre_data->order_id)?$cre_data->order_id:'';
			$order_status_id = isset($cre_data->order_status_id)?$cre_data->order_status_id:0;
			$comment = isset($cre_data->comment)?$cre_data->comment:0;
			$notify = isset($cre_data->notify)?$cre_data->notify:0;
		}
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				
				if($order_id != '' && $order_status_id != 0){
					$orde_ids = explode(",",$order_id);
					foreach($orde_ids as $order_id){
						$this->load->model('checkout/order');
						$order_info = $this->model_checkout_order->getOrder($order_id);
						if($order_info){
							$this->model_checkout_order->addOrderHistory($order_id, $order_status_id, $comment, $notify, false);
						}
					}
					
					$json['status'] 	= true;
					$json['order_status'] 	= 'SuccessFully Update Status.';
					
				}else{
					$json['status'] 	= false;
					$json['order_status'] 	= 'Please post order_id,order_status_id';	
				}
			}else{
					$json['status'] 	= false;
					$json['order_status'] 	= 'Invalid UserName Password';	
			}
		}else{
			$json['status'] 	= false;
			$json['orderstatus'] 	= 'Please post username and password';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	
	
	public function adminloginapi($username, $password) {
		$user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE username = '" . $this->db->escape($username) . "' AND (password = SHA1(CONCAT(salt, SHA1(CONCAT(salt, SHA1('" . $this->db->escape(htmlspecialchars($password, ENT_QUOTES)) . "'))))) OR password = '" . $this->db->escape(md5($password)) . "') AND status = '1'");

		if ($user_query->num_rows) {
			return $user_query->row;
			} else {
			return false;
		}
	}
	
	public function addadminuser() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
			
		}
		$cre_data = (array)$cre_data;
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				require('admin/model/user/user.php');
				$adminUserModel = new ModelUserUser( $this->registry );
				unset($cre_data['admin_user_name']);
				unset($cre_data['admin_password']);
				if($adminUserModel->addUser($cre_data)){
					$json['status'] 	= true;
					$json['response'] 	= 'SuccessFully Created Users';
				}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Please Try Again';
				}
			}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Invalid UserName Password';	
			}
		}else{
			$json['status'] 	= false;
			$json['orderstatus'] 	= 'Please post username and password';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	public function listadminuser() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
			
		}
		
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				require('admin/model/user/user.php');
				$adminUserModel = new ModelUserUser( $this->registry );
				
				if($datau = $adminUserModel->getUsers($data = array())){
					$json['status'] 	= true;
					$json['response'] 	= $datau;
				}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Please Try Again';
				}
			}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Invalid UserName Password';	
			}
		}else{
			$json['status'] 	= false;
			$json['orderstatus'] 	= 'Please post username and password';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	
	// working 1.2 (upgrade from OC3 does not work)
	public function listadminproducts() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
			$description = isset($cre_data->description)?$cre_data->description:0;
		}
		
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				require('admin/model/catalog/product.php');
				$adminProductModel = new ModelCatalogProduct( $this->registry );
				
				if($datau = $adminProductModel->getProducts($data = array())){
					$json['status'] 	= true;
					foreach ($datau as $key => $value) {
						if(!$description){
							unset($value['description']);
						}
						$pd[] = $value;
					}
					
					$json['response'] 	= $pd;
				}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Please Try Again';
				}
			}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Invalid UserName Password';	
			}
		}else{
			$json['status'] 	= false;
			$json['orderstatus'] 	= 'Please post username and password';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	
	public function editadminproduct() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
			$product_id = isset($cre_data->product_id)?$cre_data->product_id:'';
			
		}
		
		if(isset($user_name,$password,$product_id) && $user_name != '' && $password != '' && $product_id != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				require('admin/model/catalog/product.php');
				$adminProductModel = new ModelCatalogProduct( $this->registry );
				$data = $this->objToArray($cre_data);
				//echo "<pre>";print_r($data);die();
				unset($data['admin_user_name']);
				unset($data['admin_password']);
				unset($data['product_id']);
				//print_r($data);die();
				
				$reoon_images_folder = DIR_IMAGE . 'catalog/reoon-images';
				if (!is_dir($reoon_images_folder)) {
					@chmod($reoon_images_folder, 0755);
					@mkdir($reoon_images_folder);
				}
				$img_folder = DIR_IMAGE . 'catalog/reoon-images/edited-uploads';
				if (!is_dir($img_folder)) {
					@chmod($img_folder, 0755);
					@mkdir($img_folder);
				}
				
				if(isset($data['image']) && $data['image'] !=''){
					$image = 'catalog/reoon-images/edited-uploads/'.rand().'_image.jpg';
					$path = DIR_IMAGE.$image;
					//$pathlink = HTTP_SERVER.'image/'.$image;
					file_put_contents($path, base64_decode($data['image']));
					$data['image']= $image;
				}
				if(!empty($data['product_image'])){
					foreach($data['product_image'] as $key=>$images){
						if($images['image'] != ''){
						$image = '';
						$image = 'catalog/reoon-images/edited-uploads/'.rand().'_image.jpg';
						$path = DIR_IMAGE.$image;
						file_put_contents($path, base64_decode($images['image']));
						$data['product_image'][$key]['image']= $image;
						}
					}
				}
				$adminProductModel->editProduct($product_id,$data);
				$json['status'] 	= true;
				$json['response'] 	= 'SuccessFully Update';
				
			}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Invalid Username or Password !';	
			}
		}else{
			$json['status'] 	= false;
			$json['orderstatus'] 	= 'Please post username and password and product_id';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}

	
	public function deleteadminproduct() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
			$product_id = isset($cre_data->product_id)?$cre_data->product_id:'';
			
		}
		
		if(isset($user_name,$password,$product_id) && $user_name != '' && $password != '' && $product_id != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				require('admin/model/catalog/product.php');
				$adminProductModel = new ModelcatalogProduct( $this->registry );
				
				$adminProductModel->deleteProduct($product_id);
				$json['status'] 	= true;
				$json['response'] 	= 'Successfully Deleted';
				
			}else{
				$json['status'] 	= false;
				$json['response'] 	= 'Invalid UserName Password';	
			}
		}else{
			$json['status'] 		= false;
			$json['orderstatus'] 	= 'Please post username, password and product_id';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	
	
	
	public function delete_image_folder() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
			$image_folder = isset($cre_data->image_folder)?$cre_data->image_folder:'';
			
		}
		
		if(isset($user_name,$password,$image_folder) && $user_name != '' && $password != '' && $image_folder != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				
				$dir = DIR_IMAGE . 'catalog/reoon-images/' . $image_folder;
				
				if (is_dir($dir)) {
                    $it = new RecursiveDirectoryIterator($dir, RecursiveDirectoryIterator::SKIP_DOTS);
                    $files = new RecursiveIteratorIterator($it,
                                 RecursiveIteratorIterator::CHILD_FIRST);
                    foreach($files as $file) {
                        if ($file->isDir()){
                            rmdir($file->getRealPath());
                        } else {
                            unlink($file->getRealPath());
                        }
                    }
                    rmdir($dir);
    				
    				$json['status'] 	= true;
    				$json['response'] 	= 'Image Folder Successfully Deleted';
    				
				}else{
				    $json['status'] 	= true;   // true because the folder is not available, which supports the final goal.
					$json['response'] 	= 'Image Folder Not Found !';	
				}
				
			}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Invalid Username or Password !';	
			}
		}else{
			$json['status'] 	= false;
			$json['orderstatus'] 	= 'Please post username and password and image_folder';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	
	
	
	
	// working 1.4
	public function getReviewsByProductId() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
			$page = isset($cre_data->page)?$cre_data->page:0;
			$limit = isset($cre_data->limit)?$cre_data->limit:10;
			$product_id = isset($cre_data->product_id)?$cre_data->product_id:0;

			
		}
		$sstatus = false;
		
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				if($product_id > 0){
					$this->load->model('catalog/review');
					$results = $this->model_catalog_review->getReviewsByProductId($product_id,$page,$limit);
					$product_de['reviews'] = array();
					$reviews = array();
					foreach ($results as $result) {
						$reviews[] = array(
							'author'     => $result['author'],
							'text'       => nl2br($result['text']),
							'rating'     => (int)$result['rating'],
							'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
						);
					}	
					$results 	= $reviews;
					$sstatus = true;
				}else{
					$results 	= 'Please Post product_id.';
				}				
			}else{
				$results 	= 'Invalid Username or Password !';
			}
		}else{
			$results 	= 'Please post username and password';
		}
		$json['status'] 	= $sstatus;
		$json['response'] 	= $results;	

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	
	// working 1.5
	public function addimages() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
			
		}
		
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				$data = $this->objToArray($cre_data);
				//echo "<pre>";print_r($data);die();
				unset($data['admin_user_name']);
				unset($data['admin_password']);
				$res = array();
				if(!empty($data['images'])){
				    
				    // $next_product_id = $this->get_next_product_id();
					
					$reoon_images_folder = DIR_IMAGE . 'catalog/reoon-images';
					if (!is_dir($reoon_images_folder)) {
						@chmod($reoon_images_folder, 0755);
						@mkdir($reoon_images_folder);
					}

				    
				    $img_folder = DIR_IMAGE . 'catalog/reoon-images/' . $data['image_folder'];
				    // $img_folder = DIR_IMAGE . 'catalog/reoon-images/' . $next_product_id;

					
					if (!is_dir($img_folder)) {
						@chmod($img_folder, 0755);
						@mkdir($img_folder);
					}
					
					foreach($data['images'] as $key=>$images){
						if($images != ''){
							$image = '';
							$image = 'catalog/reoon-images/'.$data['image_folder'].'/'.rand().'_image.jpg';
				// 			$image = 'catalog/reoon-images/'.$next_product_id.'/'.rand().'_image.jpg';
							$path = DIR_IMAGE .$image;
							file_put_contents($path, base64_decode($images));
							if ($this->request->server['HTTPS']) {
								$base = HTTPS_SERVER;
							} else {
								$base = HTTP_SERVER;
							}
							$res[]= $base.'image/'.$image;
						}
					}
				}				
				$json['status'] 	= true;
				$json['response'] 	= $res;
			}else{
				$json['status'] 	= false;
				$json['response'] 	= 'Invalid Username or Password !';	
			}
		}else{
			$json['status'] 	= false;
			$json['response'] 	= 'Please post username and password';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
    
	
    
    // working 1.4
	private function notEndsWith($string, $endString) 
    { 
        $len = strlen($endString); 
        if ($len == 0) { 
            return false; 
        } 
        return !(substr(strtolower($string), -$len) === $endString); 
    }
	
	
	// working 1.5	
	public function addadminproduct() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
			
		}
		
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				require('admin/model/catalog/product.php');
				$adminProductModel = new ModelCatalogProduct( $this->registry );
				$data = $this->objToArray($cre_data);
				//echo "<pre>";print_r($data);die();
				unset($data['admin_user_name']);
				unset($data['admin_password']);
				//print_r($data);die();
				
				// $next_product_id = $this->get_next_product_id();
				
				$reoon_images_folder = DIR_IMAGE . 'catalog/reoon-images';
				if (!is_dir($reoon_images_folder)) {
					@chmod($reoon_images_folder, 0755);
					@mkdir($reoon_images_folder);
				}
				$img_folder = DIR_IMAGE . 'catalog/reoon-images/' . $data['image_folder'];
				// $img_folder = DIR_IMAGE . 'catalog/reoon-images/' . $next_product_id;
				if (!is_dir($img_folder)) {
					@chmod($img_folder, 0755);
					@mkdir($img_folder);
				}
				
				if(isset($data['image']) && $data['image'] !='' && $this->notEndsWith($data['image'], ".jpg") && $this->notEndsWith($data['image'], ".png")){
					$image = 'catalog/reoon-images/'.$data['image_folder'].'/'.rand().'_image.jpg';
				// 	$image = 'catalog/reoon-images/'.$next_product_id.'/'.rand().'_image.jpg';
					$path = DIR_IMAGE.$image;
					//$pathlink = HTTP_SERVER.'image/'.$image;
					file_put_contents($path, base64_decode($data['image']));
					$data['image']= $image;
				}
				
				if(!empty($data['product_image'])){
					foreach($data['product_image'] as $key=>$images){
                        if($images['image'] != '' && $this->notEndsWith($images['image'], ".jpg") && $this->notEndsWith($images['image'], ".png")){
                            $image = '';
                            $image = 'catalog/reoon-images/'.$data['image_folder'].'/'.rand().'_image.jpg';
                            // $image = 'catalog/reoon-images/'.$next_product_id.'/'.rand().'_image.jpg';
                            $path = DIR_IMAGE.$image;
                            file_put_contents($path, base64_decode($images['image']));
                            $data['product_image'][$key]['image']= $image;
						}
					}
				}
				
				$res = array();
				if($datau = $adminProductModel->addProduct($data)){
					$res['order_id'] = $datau;
					$json['status'] 	= true;
					$json['response'] 	= $res['order_id'];
				// 	$json['image_folder'] 	= $next_product_id;
				}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Please Try Again';
				}
			}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Invalid Username or Password !';	
			}
		}else{
			$json['status'] 	= false;
			$json['orderstatus'] 	= 'Please post username and password';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}


    
    // working 1.4
	public function editsomefieldproduct() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
			$product_id = isset($cre_data->product_id)?$cre_data->product_id:'';
			
		}
		
		if(isset($user_name,$password,$product_id) && $user_name != '' && $password != '' && $product_id != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				
				$data = $this->objToArray($cre_data);
				//echo "<pre>";print_r($data);die();
				unset($data['admin_user_name']);
				unset($data['admin_password']);
				unset($data['product_id']);
				//print_r($data);die();
				
				$reoon_images_folder = DIR_IMAGE . 'catalog/reoon-images';
				if (!is_dir($reoon_images_folder)) {
					@chmod($reoon_images_folder, 0755);
					@mkdir($reoon_images_folder);
				}
				$img_folder = DIR_IMAGE . 'catalog/reoon-images/edited-uploads';
				if (!is_dir($img_folder)) {
					@chmod($img_folder, 0755);
					@mkdir($img_folder);
				}
				
				if(isset($data['image']) && $data['image'] !=''){
					$image = 'catalog/reoon-images/edited-uploads/'.rand().'_image.jpg';
					$path = DIR_IMAGE.$image;
					//$pathlink = HTTP_SERVER.'image/'.$image;
					file_put_contents($path, base64_decode($data['image']));
					$data['image']= $image;
				}
				if(!empty($data['product_image'])){
					foreach($data['product_image'] as $key=>$images){
						if($images['image'] != ''){
						$image = '';
						$image = 'catalog/reoon-images/edited-uploads/'.rand().'_image.jpg';
						$path = DIR_IMAGE.$image;
						file_put_contents($path, base64_decode($images['image']));
						$data['product_image'][$key]['image']= $image;
						}
					}
				}
				if(!empty($data)){
					$updatestring = '';
					foreach ($data as $key => $value) {
						if(is_numeric($value)){
							$updatestring .= $key."=".$value.",";
						}else{
							$updatestring .= $key."='".$this->db->escape($value)."',";	
						}						
					}
					$updatestring = trim($updatestring,',');
					$this->db->query("UPDATE " . DB_PREFIX . "product SET ".$updatestring." WHERE product_id = '" . (int)$product_id . "'");
				}
				$json['status'] 	= true;
				$json['response'] 	= 'SuccessFully Update';
				
			}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Invalid Username or Password !';	
			}
		}else{
			$json['status'] 	= false;
			$json['orderstatus'] 	= 'Please post username and password and product_id';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	// working 1.4
	public function getadminproduct() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		$status = false;
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
			$product_id = isset($cre_data->product_id)?$cre_data->product_id:'';
			
		}
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				if($product_id != ''){
					$this->load->model('catalog/product');
					$datau = $this->model_catalog_product->getProduct($product_id);
					$status = true;
					$results = $datau;	
				}else{
					$results = 'Please Post Product id';	
				}
				
			}else{
				$results = 'Invalid Username or Password !';	
			}
		}else{
			$results = 'Please post username and password';
		}
		$json['status'] 	= $status;
		$json['response'] 	= $results;

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	// working 1.4
	public function listadmincategorys() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
			
		}
		
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				require('admin/model/catalog/category.php');
				$adminCategoryModel = new ModelCatalogCategory( $this->registry );
				
				if($datau = $adminCategoryModel->getCategories($data = array())){
					$json['status'] 	= true;
					$json['response'] 	= $datau;
				}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Please Try Again';
				}
			}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Invalid Username or Password !';	
			}
		}else{
			$json['status'] 	= false;
			$json['orderstatus'] 	= 'Please post username and password';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	// working 1.4
	public function adminaddreview() {
		$this->checkPlugin();
		$sstatus = false;
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';			
		}
		
		$this->load->language('product/product');

		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				$cre_data = (array)$cre_data;
				if(!empty($cre_data) && isset($cre_data['product_id'],$cre_data['name'],$cre_data['text'],$cre_data['product_id'],$cre_data['rating'])){
					
					$flag = true;
					if ((utf8_strlen($cre_data['name']) < 3) || (utf8_strlen($cre_data['name']) > 25)) {
						$results = $this->language->get('error_name');
						$flag = false;
					}
					if ((utf8_strlen($cre_data['text']) < 25) || (utf8_strlen($cre_data['text']) > 1000)) {
						$results = $this->language->get('error_text');
						$flag = false;
					}
					if (empty($cre_data['rating']) || $cre_data['rating'] < 0 || $cre_data['rating'] > 5) {
						$results = $this->language->get('error_rating');
						$flag = false;
					}
					
					if($flag){
						
						$this->apiaddReview($cre_data['product_id'], $cre_data);
						$results = $this->language->get('text_success');	
						$sstatus = true;
					}
				}else{
					$results = 'Please data post name,text,product_id,rating';
				}
			}else{
				$results = 'Invalid Username or Password !';	
			}			
		}else{
			$results = 'Please post username and password';
		}
		$json['success'] 	= $sstatus;
		$json['response'] 	= $results;

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}	//seo
	
	

    // working 1.4
	public function listadminlanguages() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		$status = false;
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
		}
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
			    
			    $adminLangModel = new ModelLocalisationLanguage( $this->registry );
                $datau = $adminLangModel->getLanguages();
            
				$status = true;
				$results = $datau;	
				
			}else{
				$results = 'Invalid Username or Password !';	
			}
		}else{
			$results = 'Please post username and password';
		}
		$json['status'] 	= $status;
		$json['response'] 	= $results;

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	
	// working 1.4
	public function get_api_version() {
		$this->checkPlugin();

		$json['status'] 	= true;
		$json['response'] 	= array('version' => $this->version);

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	
	// working 1.4
	public function list_admin_options() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
			
		}
		
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				require('admin/model/catalog/option.php');
				$adminOptionModel = new ModelCatalogOption( $this->registry );
				
				if($datau = $adminOptionModel->getOptions($data = array())){
					$json['status'] 	= true;
					$json['response'] 	= $datau;
				}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Please Try Again';
				}
			}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Invalid Username or Password !';	
			}
		}else{
			$json['status'] 	= false;
			$json['orderstatus'] 	= 'Please post username and password';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	// working 1.4
	public function list_admin_option_values() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
			$option_id = isset($cre_data->option_id)?$cre_data->option_id:'';
		}
		
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
			    if($option_id != ''){
    				require('admin/model/catalog/option.php');
    				$adminOptionModel = new ModelCatalogOption( $this->registry );
    				$datau = $adminOptionModel->getOptionValues($option_id);
					
					$json['status'] = true;
					$json['response'] = $datau;
				}else{
					$json['response'] = 'Please Post Option id';	
				}

			}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Invalid Username or Password !';	
			}
		}else{
			$json['status'] 	= false;
			$json['orderstatus'] = 'Please post username and password';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	
	// working 1.4
	public function add_admin_option() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
		}
		
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				// $data = (array)$cre_data;
				$data = $this->objToArray($cre_data);
				
				unset($data['admin_user_name']);
				unset($data['admin_password']);
				
				if(!empty($data) && isset($data['type'],$data['sort_order'],$data['option_description'])){
				    
				    require('admin/model/catalog/option.php');
    				$adminOptionModel = new ModelCatalogOption( $this->registry );
    				$datau = $adminOptionModel->addOption($data);
					
					$json['status'] 	= true;
					$json['response'] 	= $datau;	
					
				}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Please include all the required data !';	
				}

			}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Invalid Username or Password !';	
			}
		}else{
			$json['status'] 	= false;
			$json['orderstatus'] 	= 'Please post username and password';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	
	// working 1.4
	public function add_admin_option_values() {
		$this->checkPlugin();
		
		$postdata = file_get_contents("php://input");
		$cre_data = json_decode($postdata);
		
		if(!empty($cre_data)){
			$user_name = isset($cre_data->admin_user_name)?$cre_data->admin_user_name:'';
			$password = isset($cre_data->admin_password)?$cre_data->admin_password:'';
			$option_id = isset($cre_data->option_id)?$cre_data->option_id:'';
		}
		
		if(isset($user_name,$password) && $user_name != '' && $password != ''){
			$logincheck = $this->adminloginapi($user_name,$password);
			
			if($logincheck){
				// $data = (array)$cre_data;
				$data = $this->objToArray($cre_data);
				
				unset($data['admin_user_name']);
				unset($data['admin_password']);
				
				if(!empty($data) && isset($data['option_value'])){
				    
				    // what I did below is ==> just copied the portion from option.php (from the function addOption).
    				
    				if (isset($data['option_value'])) {
            			foreach ($data['option_value'] as $option_value) {
            				$this->db->query("INSERT INTO " . DB_PREFIX . "option_value SET option_id = '" . (int)$option_id . "', image = '" . $this->db->escape(html_entity_decode($option_value['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$option_value['sort_order'] . "'");
            
            				$option_value_id = $this->db->getLastId();
            
            				foreach ($option_value['option_value_description'] as $language_id => $option_value_description) {
            					$this->db->query("INSERT INTO " . DB_PREFIX . "option_value_description SET option_value_id = '" . (int)$option_value_id . "', language_id = '" . (int)$language_id . "', option_id = '" . (int)$option_id . "', name = '" . $this->db->escape($option_value_description['name']) . "'");
            				}
            			}
            		}
    				
					$json['status'] 	= true;
					
					require('admin/model/catalog/option.php');
    				$adminOptionModel = new ModelCatalogOption( $this->registry );
    				$datau = $adminOptionModel->getOptionValues($option_id);
					
					$json['response'] 	= $datau;
					
				}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Please include all the required data !';	
				}

			}else{
					$json['status'] 	= false;
					$json['response'] 	= 'Invalid Username or Password !';	
			}
		}else{
			$json['status'] 	= false;
			$json['orderstatus'] 	= 'Please post username and password';
		}

		if ($this->debugIt) {
			echo '<pre>';
			print_r($json);
			echo '</pre>';
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}
	
	
	
	
	private function checkPlugin() {

		$json = array("success"=>false);

		/*check rest api is enabled*/
		if (!$this->config->get('rest_api_status')) {
			$json["error"] = 'Reoon API (Extension) is disabled. Please enable it on your website !';
		}
		
		/*validate api security key*/
		/*if ($this->config->get('rest_api_key') && (!isset($this->request->get['key']) || $this->request->get['key'] != $this->config->get('rest_api_key'))) {
			$json["error"] = 'Invalid secret key';
		}*/
		
		if(isset($json["error"])){
			$this->response->addHeader('Content-Type: application/json');
			echo(json_encode($json));
			exit;
		}else {
			$this->response->setOutput(json_encode($json));			
		}	
	}	
	
	protected function objToArray($obj)
    {
        // Not an object or array
        if (!is_object($obj) && !is_array($obj)) {
            return $obj;
        }
    
        // Parse array
        foreach ($obj as $key => $value) {
            $arr[$key] = $this->objToArray($value);
        }
    
        // Return parsed array
        return $arr;
    }
    
    public function apiaddReview($product_id, $data) {
		$status = isset($data['status'])?$data['status']:0;
		$this->db->query("INSERT INTO " . DB_PREFIX . "review SET author = '" . $this->db->escape($data['name']) . "', customer_id = '" . (int)$data['customer_id'] . "', product_id = '" . (int)$product_id . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "', date_added = '".$data['date_added']."', status = '".$status."'");

		$review_id = $this->db->getLastId();
		if (in_array('review', (array)$this->config->get('config_mail_alert'))) {
			$this->load->language('mail/review');
			$this->load->model('catalog/product');
			
			$product_info = $this->model_catalog_product->getProduct($product_id);

			$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

			$message  = $this->language->get('text_waiting') . "\n";
			$message .= sprintf($this->language->get('text_product'), html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8')) . "\n";
			$message .= sprintf($this->language->get('text_reviewer'), html_entity_decode($data['name'], ENT_QUOTES, 'UTF-8')) . "\n";
			$message .= sprintf($this->language->get('text_rating'), $data['rating']) . "\n";
			$message .= $this->language->get('text_review') . "\n";
			$message .= html_entity_decode($data['text'], ENT_QUOTES, 'UTF-8') . "\n\n";

			$mail = new Mail($this->config->get('config_mail_engine'));
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject($subject);
			$mail->setText($message);
			$mail->send();

			// Send to additional alert emails
			$emails = explode(',', $this->config->get('config_mail_alert_email'));

			foreach ($emails as $email) {
				if ($email && filter_var($email, FILTER_VALIDATE_EMAIL)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
		}
	}

}
