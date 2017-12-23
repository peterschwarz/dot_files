{:user
  {:plugins [[lein-try "0.4.3"]
             [lein-ancient "0.6.15"]
             [lein-cljfmt "0.5.7"]
             [cider/cider-nrepl "0.15.1"]
             [venantius/ultra "0.5.2"]]
   :dependencies [[cljfmt "0.5.7"]]
   :ultra {:color-scheme :solarized_dark}
   :repl-options {:port 0
                  :init (require 'cljfmt.core)}}}
