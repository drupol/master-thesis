(use-modules (guix)
             (guix build-system gnu))

(define-public datetime
  (package
    (name "datetime")
    (version "1.0")
	(source (local-file "./src" #:recursive? #t))
    (build-system gnu-build-system)
    (arguments
     '(
        #:tests? #f
        #:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'build
           (lambda _ (invoke "gcc" "datetime.c" "-o" "datetime")))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (install-file "datetime" (string-append out "/bin"))))))))
    (synopsis "DateTime Program")
    (description "This package contains a simple program that shows the current date and time.")
    (home-page #f)
    (license #f)))

datetime
