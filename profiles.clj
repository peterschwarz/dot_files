{:user
  {:plugins [[lein-try "0.4.3"]
             [lein-exec "0.3.4"]
             [lein-ancient "0.6.1"]
             [jonase/eastwood "0.2.1"]
             [lein-plz "0.3.1" :exclusions [[rewrite-clj] [ancient-clj]]]
             [slamhound "1.5.5"]
             [venantius/ultra "0.3.2"]]
   :ultra {:color-scheme :solarized_dark}
   :repl-options {:port 0}}}