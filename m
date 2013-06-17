From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V2] Documentation: Add examples to samsung-pinctrl device
 tree bindings documentation
Date: Mon, 17 Jun 2013 14:51:57 +0200
Message-ID: <3675498.NzHRglH7SX@amdc1227>
References: <1371473826-2595-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47941 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752397Ab3FQMwF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 08:52:05 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOJ00JHAFNPKQ20@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 13:52:04 +0100 (BST)
In-reply-to: <1371473826-2595-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, dianders@chromium.org, linus.walleij@linaro.org

On Monday 17 of June 2013 18:27:06 Leela Krishna Amudala wrote:
> This patch adds examples to samsung-pinctrl.txt documentaion file
> on how to make gpio binding and gpio request
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> ---
>  .../bindings/pinctrl/samsung-pinctrl.txt           |   44
> +++++++++++++++++++- 1 file changed, 42 insertions(+), 2 deletions(-)

Looks good.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz

> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt index
> b2bc219..72e9cd1 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> @@ -25,8 +25,18 @@ Required Properties:
> 
>    - gpio-controller: identifies the node as a gpio controller and pin bank.
> - #gpio-cells: number of cells in GPIO specifier. Since the generic GPIO - 
>   binding is used, the amount of cells must be specified as 2. See generic
> -    GPIO binding documentation for description of particular cells. +   
> binding is used, the amount of cells must be specified as 2. See the below
> +    mentioned gpio binding representation for description of particular
> cells. +
> +	Eg: <&gpx2 6 0>
> +	<[phandle of the gpio controller node]
> +	[pin number within the gpio controller]
> +	[flags]>
> +
> +	Values for gpio specifier:
> +	- Pin number: is a value between 0 to 7.
> +	- Flags: 0 - Active High
> +		 1 - Active Low
> 
>  - Pin mux/config groups as child nodes: The pin mux (selecting pin function
> mode) and pin config (pull up/down, driver strength) settings are
> represented @@ -274,3 +284,33 @@ Example 4: Set up the default pin state
> for uart controller.
> 
>  		pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
>  	}
> +
> +Example 5: A display port client node that supports 'default' pinctrl state
> +	   and gpio binding.
> +
> +	display-port-controller {
> +		/* ... */
> +
> +		samsung,hpd-gpio = <&gpx2 6 0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dp_hpd>;
> +	};
> +
> +Example 6: Request the gpio for display port controller
> +
> +	static int exynos_dp_probe(struct platform_device *pdev)
> +	{
> +		int hpd_gpio, ret;
> +		struct device *dev = &pdev->dev;
> +		struct device_node *dp_node = dev->of_node;
> +
> +		/* ... */
> +
> +		hpd_gpio = of_get_named_gpio(dp_node, "samsung,hpd-gpio", 0);
> +
> +		/* ... */
> +
> +		ret = devm_gpio_request_one(&pdev->dev, hpd_gpio, GPIOF_IN,
> +					    "hpd_gpio");
> +		/* ... */
> +	}
