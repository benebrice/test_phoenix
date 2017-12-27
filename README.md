# GfpActivity

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Creation
  * mix phx.new gfp_activity 
  * cd gfp_activity
  * mix ecto.create
  * mix test (install dependencies)
  * [iex -S] mix phx.server # Debug

## Used libraries
  * Bootstrap 4
  
    ```
    # On assets/
    npm install --save-dev sass-brunch
  npm install --save bootstrap@4.0.0-alpha.6
  ```
  update `brunch-config.js` by adding
  
  ```
  npm: {
    enabled: true,
      globals: {
       $: 'jquery',
       jQuery: 'jquery',
       bootstrap: 'bootstrap'
    }
  }
  ```
  * [JA serializer](https://github.com/vt-elixir/ja_serializer)
  
## Basic install

### V1 namespace

1. Routing
	
	```
	# lib/gfp_activity_web/router.ex
	scope "/api", GfpActivity do
	  pipe_through :api
	  scope "/v1", V1, as: :v1 do
	    resources "/categories", CategoryController
	    resources "/activities", ActivityController
	  end
	end
	```

2. v1 folders

	* Create
	
		```
		mkdir web/controllers/v1
		mkdir web/views/v1
		mkdir test/controllers/v1
		```
		
	* Move files + rename 
	
		`defmodule GfpActivity` -> `defmodule GfpActivity.V1`
		
		`..._path` -> `v1_..._path`
		
		`render_many` and `render_one` on `web/views/v1`
	
		

  [http://adanselm.github.io/programming/distributed/system/elixir/json/phoenix/api/2015/06/16/obese-bird-json.html](http://adanselm.github.io/programming/distributed/system/elixir/json/phoenix/api/2015/06/16/obese-bird-json.html)

  