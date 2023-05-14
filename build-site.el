;; Load the publishing system
;; https://systemcrafters.net/publishing-websites-with-org-mode/building-the-site/
;; https://simplecss.org/
;; run command: httpd-server-directory

(require 'ox-publish)
(require 'package)

(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "mobilen-site"
             :recursive t
             :base-directory "./content/"
             :publishing-directory "./public"
             :publishing-function 'org-html-publish-to-html
             :with-author nil           ;; Don't include author name
             :with-creator t            ;; Include Emacs and Org versions in footer
             :with-toc t                ;; Include a table of contents
             :section-numbers nil
             :time-stamp-file nil)))

;; Customize the HTML output
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"http://thomasf.github.io/solarized-css/solarized-light.min.css\" />")
;; Generate the site output
(org-publish-all t)
