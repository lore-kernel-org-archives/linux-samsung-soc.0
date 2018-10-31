From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH 1/8] clk: clkdev/of_clk - add managed lookup and provider
 registrations
Date: Wed, 31 Oct 2018 15:48:47 +0200
Message-ID: <20181031134847.GA29664@localhost.localdomain>
References: <cover.1540970653.git.matti.vaittinen@fi.rohmeurope.com>
 <b3954431df109827c71d25d390adf22f6991a6df.1540970653.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b3954431df109827c71d25d390adf22f6991a6df.1540970653.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Russell King <linux@armlinux.org.uk>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Sebastian Reichel <sre@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Huang Shijie <sjhuang@iluvatar.ai>, Akshu Agrawal <Akshu.Agrawal@amd.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Danie
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Oct 31, 2018 at 10:30:34AM +0200, Matti Vaittinen wrote:
> With MFD devices the clk properties may be contained in MFD (parent) DT
> node. Current devm_of_clk_add_hw_provider assumes the clk is bound to MFD
> subdevice not to MFD device (parent). Add
> devm_of_clk_add_hw_provider_parent to tackle this issue.
> 
> Also clkdev registration lacks of managed registration functions and it
> seems few drivers do not drop clkdev lookups at exit. Add
> devm_clk_hw_register_clkdev and devm_clk_release_clkdev to ease lookup
> releasing at exit.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

//snip

> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 60c51871b04b..94c7bf471c31 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -916,6 +916,10 @@ int devm_of_clk_add_hw_provider(struct device *dev,
>  			   struct clk_hw *(*get)(struct of_phandle_args *clkspec,
>  						 void *data),
>  			   void *data);
> +int devm_of_clk_add_parent_hw_provider(struct device *dev,
> +			   struct clk_hw *(*get)(struct of_phandle_args *clkspec,
> +						 void *data),
> +			   void *data);
>  void of_clk_del_provider(struct device_node *np);
>  void devm_of_clk_del_provider(struct device *dev);
>  struct clk *of_clk_src_simple_get(struct of_phandle_args *clkspec,

Right. Didn't spot the 
#ifdef CONFIG_OF
in clk-provider.h. So patch lacks of stub functions for non OF
architectures. The 0-Day test system spot this. Tomorrow I'll send v2
where the inlined stub functions for non OF architectures are added.

Br,
	Matti Vaittinen

-- 
Matti Vaittinen
ROHM Semiconductors

~~~ "I don't think so," said Rene Descartes.  Just then, he vanished ~~~
