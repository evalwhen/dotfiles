(in-package :next-user)
;; (setf (get-default 'proxy-mode 'server-address) "http://localhost:8123")

;; (setf next/proxy-mode:*default-proxy*
;;       (make-instance 'proxy :server-address  "http://127.0.0.1:7890"))

;; (add-to-default-list 'proxy-mode 'buffer 'default-modes)


(defclass my-buffer (buffer)
  ((box-style :initform
              (cl-css:inline-css
               '(:background "#C38A22"
                 :color "black"
                 :border "1px #C38A22 solid"
                 ;; :font-weight "bold"
                 :padding "1px 3px 0px 3px"
                 :padding "1px 3px 0px 3px"
                 :position "absolute"
                 :text-align "center"
                 :text-shadow "0 3px 7px 0px rgba(0,0,0,0.3)")))
   ;; (zoom-ratio-default :initform 1.2)
   (default-modes :initform
                  (cons 'vi-normal-mode (get-default 'buffer 'default-modes)))
   ))

(setf *buffer-class* 'my-buffer)

(defclass my-remote-interface (remote-interface)
  ((search-engines :initform
                   '(("default"
                      "https://duckduckgo.com/?q=~a"
                      "https://duckduckgo.com/")
                     ("yt"
                      "https://www.youtube.com/results?search_query=~a"
                      "https://www.youtube.com/")
                     ("wiki"
                      "https://en.wikipedia.org/w/index.php?search=~a"
                      "https://en.wikipedia.org/")))))

(setf *remote-interface-class* 'my-remote-interface)
