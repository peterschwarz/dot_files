{:user
  {:plugins [[lein-try "0.4.3"]
             [lein-exec "0.3.6"]
             [lein-ancient "0.6.10"]
             [lein-cljfmt "0.5.0"]
             [jonase/eastwood "0.2.3"]
             [cider/cider-nrepl "0.11.0"]
             [venantius/ultra "0.4.1"]]
   :dependencies [[cljfmt "0.3.0"]
                  [com.cemerick/pomegranate "0.3.1"]]
   :ultra {:color-scheme :solarized_dark}
   :repl-options {:port 0
                  :init (do
                          (require 'cljfmt.core)
                          (defn current-classpath []
                            (->> (ClassLoader/getSystemClassLoader) (.getURLs) seq (map #(.getFile %))))
                          )}}}
