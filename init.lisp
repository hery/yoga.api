; https://www.darkchestnut.com/2016/quicklisp-load-personal-projects-from-arbitrary-locations/
(pushnew (truename "./") ql:*local-project-directories*)

(ql:quickload :yoga.api)
; (yoga.api:start :server :woo :port 5000)
