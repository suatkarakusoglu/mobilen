;; Load the publishing system
;; https://systemcrafters.net/publishing-websites-with-org-mode/building-the-site/
;; https://simplecss.org/
;; run httpd-server-directory

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
             :base-directory "./content/writings"
             :base-extension "org"
             :publishing-directory "./docs"
             :publishing-function 'org-html-publish-to-html
             :with-author nil           ;; Don't include author name
             :with-creator t            ;; Include Emacs and Org versions in footer
             :with-toc nil                ;; Include a table of contents
             :section-numbers nil
             :time-stamp-file nil
             ;; :html-link-home "https://suatkarakusoglu.github.io/"
             :html-extension "html"
             :auto-sitemap t
             :sitemap-filename "archive.org"
             :sitemap-title "Mobilen İçerikler"
             :sitemap-sort-files 'anti-chronologically
             :sitemap-style 'list
             :recursive t
             :section-numbers nil
             :html-head-include-default-style nil
             :html-head-include-scripts nil
             :html-doctype "html5"
             :html-html5-fancy t
             :html-head-include-scripts nil
             :html-head-include-default-style nil
             :html-preamble "<p><small>Son Güncelleme: %C</small></p>"
             :html-postamble
             "<hr/>
<footer>
  <div class=\"copyright-container\">
    <div class=\"copyright\">
      &copy; 1071-20∞ Mobilen bazı hakları saklıdır.<br/>
    </div>
    </br>
  </div>
</footer>"
             )
       (list "mobilen-statics"
             :base-directory "./content/"
             :base-extension "css\\|js\\|jpg\\|gif\\|png\\|pdf\\|mp3\\|ogg\\|swf"
             :publishing-directory "./docs"
             :publishing-function 'org-publish-attachment
             :recursive t)))

(setq org-html-htmlize-output-type 'css)

(setq org-src-fontify-natively t)

;; Customize the HTML output
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      ;; org-html-head "<link rel=\"stylesheet\" href=\"http://thomasf.github.io/solarized-css/solarized-light.min.css\"/>"
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\"/>"
      ;; org-html-head "<link rel=\"stylesheet\" href=\"https://gongzhitaao.org/orgcss/org.css\"/>"
      )

;; Generate the site output
(org-publish-all t)
