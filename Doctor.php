<?php
    
    defined('BASEPATH') OR exit('No direct script access allowed');
    
    class doctor extends CI_Controller {
    
        public function viewdoctor()
	    {
		    $this->load->model('Common_model');
		    $data['docArray'] = $this->Common_model->return_doctor();
		    $this->load->view('doctorpanel/viewdoc', $data);
        }
        
        public function viewschedule()
        {
            $this->load->model('Common_model');
            $data['scheArray'] = $this->Common_model->view_schedule();
            $this->load->view('doctorpanel/viewschedule', $data);
        }

        public function viewpatient()
        {
            $this->load->model('Common_model');
		    $data['paArray'] = $this->Common_model->return_patient();
		    $this->load->view('doctorpanel/viewpatient', $data);
        }
    
    }
    
    /* End of file Controllername.php */
    
?>