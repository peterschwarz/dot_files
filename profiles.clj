{:user
  {:plugins [[lein-try "0.4.3"]
             [lein-exec "0.3.4"]
             [lein-ancient "0.6.1"]
             [lein-cljfmt "0.1.10"]
;             [jonase/eastwood "0.2.1"]
             [lein-plz "0.3.1" :exclusions [[rewrite-clj] [ancient-clj]]]
             [slamhound "1.5.5"]
             [cider/cider-nrepl "0.8.2"]
            ; [venantius/ultra "0.3.2"]
             
             ]
   :dependencies [[jonase/eastwood "0.2.1" :exclusions [org.clojure/clojure]]
                  [cljfmt "0.1.10"]]
   :ultra {:color-scheme :solarized_dark}
   :repl-options {:port 0}}}
