(require '[clojure.tools.nrepl.server :as nrepl-server]
         '[cider.nrepl :refer (cider-nrepl-handler)]
         '[reply.main :as reply])

(let [port (+ 5000 (rand-int 4999))]
  (spit ".nrepl-port" port)
  (println "Repl-ed on" port)
  (let [nrepl (future (nrepl-server/start-server :port port :handler cider-nrepl-handler))]
    (reply/-main)
    (nrepl-server/stop-server @nrepl)))
