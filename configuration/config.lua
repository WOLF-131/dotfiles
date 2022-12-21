return {
	widget = {
		email  = {
			-- Email address
			address = 'janik.rupar@roche.com',
			-- App password
			app_password = '',
			-- Imap server
			imap_server = 'imap.gmail.com',
			-- Port
			port = '993'
		},

		weather = {
			-- API Key
			key = 'f25ddf6270000c2756b895cdf8a9df28',
			-- City ID
			city_id = '2658954',
			-- Units
			units = 'metric',
			-- Update in N seconds
			update_interval = 1200
		},

		network = {
			-- Wired interface
			wired_interface = 'enp0s31f6',
			-- Wireless interface
			wireless_interface = 'wlp58s0'
		},

		clock = {
			-- Clock widget format
			military_mode = false
		},

		screen_recorder = {
			-- Default record dimension
			resolution = '1366x768',
			-- X,Y coordinate
			offset = '0,0',
			-- Enable audio by default
			audio = false,
			-- Recordings directory
			save_directory = '$(xdg-user-dir VIDEOS)/Recordings/',
			-- Mic level
			mic_level = '20',
			-- FPS
			fps = '30'
		}
	},

	module = {
		auto_start = {
			-- Will create notification if true
			debug_mode = false
		},

		lockscreen = {
			-- Clock format
			military_clock = true,
			-- Default password if there's no PAM integration
			fallback_password = 'toor',
			-- Capture intruder using webcam
			capture_intruder = true,
			-- Intruder image save location (Will create directory if it doesn't exist)
			face_capture_dir = '$(xdg-user-dir PICTURES)/Intruders/',
			-- Background directory - Defaults to 'awesome/config/theme/wallpapers/' if null
			bg_dir = nil,
			-- Will look for this image file under 'bg_dir'
			bg_image = 'wallpaper.jpg',
			-- Blur lockscreen background
			blur_background = false,
			-- Blurred/filtered background image path (No reason to change this)
			tmp_wall_dir = '/tmp/awesomewm/' .. os.getenv('USER') .. '/'
		}
	}
}
