(ns causemap-parse.handler
  (:require [compojure.core :refer :all]
            [compojure.handler :as handler]
            [compojure.route :as route]
            [ring.util.response :refer [resource-response response]]
            [ring.middleware.json :as middleware]
            [duckling.core :as p]))

(p/load!) ;; Load default configuration

(defroutes app-routes
  (POST "/" [request] (response (p/parse :en$core ;; core configuration for English ; see also :fr$core, :es$core, :cn$core
         (get-in request [:body "period"])
         [:time])))
  (route/resources "/")
  (route/not-found "Not Found"))

(def app
  (-> (handler/site app-routes)
      (middleware/wrap-json-body)
      (middleware/wrap-json-response)))
