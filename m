From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2 2/3] i2c: s3c2410: Add device tree support
Date: Sat, 30 Jul 2011 21:53:36 -0600
Message-ID: <20110731035336.GH24334@ponder.secretlab.ca>
References: <1311329918-8105-1-git-send-email-thomas.abraham@linaro.org>
 <1311329918-8105-2-git-send-email-thomas.abraham@linaro.org>
 <1311329918-8105-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:45704 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751818Ab1GaO0g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 31 Jul 2011 10:26:36 -0400
Content-Disposition: inline
In-Reply-To: <1311329918-8105-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

On Fri, Jul 22, 2011 at 03:48:37PM +0530, Thomas Abraham wrote:
> Add device tree probe support for Samsung's s3c2410 i2c driver.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  .../devicetree/bindings/i2c/samsung-i2c.txt        |   44 +++++++++++++++++
>  drivers/i2c/busses/i2c-s3c2410.c                   |   51 +++++++++++++++++++-
>  2 files changed, 94 insertions(+), 1 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/samsung-i2c.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/samsung-i2c.txt b/Documentation/devicetree/bindings/i2c/samsung-i2c.txt
> new file mode 100644
> index 0000000..4e1a2ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/samsung-i2c.txt
> @@ -0,0 +1,44 @@
> +* Samsung's I2C controller
> +
> +The Samsung's I2C controller is used to interface with I2C devices.
> +
> +Required properties:
> +  - compatible: value should be either of the following.
> +      (a) "samsung, s3c2410-i2c", for i2c compatible with s3c2410 i2c.
> +      (b) "samsung, s3c2440-i2c", for i2c compatible with s3c2440 i2c.
> +
> +  - reg: physical base address of the controller and length of memory mapped
> +    region.
> +
> +  - interrupts: interrupt number to the cpu.
> +
> +  - samsung,i2c-sda-delay: Delay (in ns) applied to data line (SDA) edges.
> +
> +  - gpios: The order of the gpios should be in the following order.
> +       <SDA, SCL>
> +
> +Optional properties:
> +  - samsung,i2c-slave-addr: Slave address in multi-master enviroment. If not
> +    specified, default value is 0.
> +
> +  - samsung,i2c-max-bus-freq: Desired frequency in Hz of the bus. If not
> +    specified, the default value in Hz is 100000.
> +
> +Example:
> +
> +	i2c@13870000 {
> +		compatible = "samsung,s3c2440-i2c";
> +		reg = <0x13870000 0x100>;
> +		interrupts = <345>;
> +		samsung,i2c-sda-delay = <100>;
> +		samsung,i2c-max-bus-freq = <100000>;
> +		gpios = <&gpd1 2 0 /* SDA */
> +			 &gpd1 3 0 /* SCL */>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		wm8994@1a {
> +			compatible = "wlf,wm8994";
> +			reg = <0x1a>;
> +		};
> +	};
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index e132168..40264b0 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -35,6 +35,7 @@
>  #include <linux/cpufreq.h>
>  #include <linux/slab.h>
>  #include <linux/io.h>
> +#include <linux/of_i2c.h>
>  
>  #include <asm/irq.h>
>  
> @@ -96,6 +97,10 @@ static inline int s3c24xx_i2c_is2440(struct s3c24xx_i2c *i2c)
>  	struct platform_device *pdev = to_platform_device(i2c->dev);
>  	enum s3c24xx_i2c_type type;
>  
> +	if (i2c->dev->of_node)
> +		return of_device_is_compatible(i2c->dev->of_node,
> +						"samsung,s3c2440-i2c");
> +
>  	type = platform_get_device_id(pdev)->driver_data;
>  	return type == TYPE_S3C2440;
>  }
> @@ -787,6 +792,34 @@ static int s3c24xx_i2c_init(struct s3c24xx_i2c *i2c)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_OF
> +
> +/* s3c24xx_i2c_parse_dt
> + *
> + * Parse the device tree node and retreive the platform data.
> +*/
> +
> +static void
> +s3c24xx_i2c_parse_dt(struct device_node *np, struct s3c24xx_i2c *i2c)
> +{
> +	struct s3c2410_platform_i2c *pdata = &i2c->pdata;
> +
> +	if (!np)
> +		return;
> +
> +	of_property_read_u32(np, "samsung,i2c-sda-delay", &pdata->sda_delay);
> +	of_property_read_u32(np, "samsung,i2c-slave-addr", &pdata->slave_addr);
> +	of_property_read_u32(np, "samsung,i2c-max-bus-freq",
> +				(u32 *)&pdata->frequency);
> +}
> +#else
> +static void
> +s3c24xx_i2c_parse_dt(struct device_node *np, struct s3c24xx_i2c *i2c)
> +{
> +	return;
> +}
> +#endif
> +
>  /* s3c24xx_i2c_probe
>   *
>   * called by the bus driver when a suitable device is found
> @@ -812,6 +845,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>  	}
>  
>  	memcpy(&i2c->pdata, pdata, sizeof(*pdata));
> +	s3c24xx_i2c_parse_dt(pdev->dev.of_node, i2c);
>  
>  	strlcpy(i2c->adap.name, "s3c2410-i2c", sizeof(i2c->adap.name));
>  	i2c->adap.owner   = THIS_MODULE;
> @@ -908,13 +942,16 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>  	 */
>  
>  	i2c->adap.nr = pdata->bus_num;
> +	i2c->adap.dev.of_node = pdev->dev.of_node;
>  
> -	ret = i2c_add_numbered_adapter(&i2c->adap);
> +	ret = (pdev->dev.of_node) ? i2c_add_adapter(&i2c->adap) :
> +					i2c_add_numbered_adapter(&i2c->adap);

i2c_add_numbered_adapter will do the right thing now if i2c->adap.nr
is set to -1 when a bus number needs to be dynamically allocated.  You can simplify this.

>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "failed to add bus to i2c core\n");
>  		goto err_cpufreq;
>  	}
>  
> +	of_i2c_register_devices(&i2c->adap);
>  	platform_set_drvdata(pdev, i2c);
>  
>  	dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&i2c->adap.dev));
> @@ -1016,6 +1053,17 @@ static struct platform_device_id s3c24xx_driver_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(platform, s3c24xx_driver_ids);
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id s3c24xx_i2c_match[] = {
> +	{ .compatible = "samsung,s3c2410-i2c" },
> +	{ .compatible = "samsung,s3c2440-i2c" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, s3c24xx_i2c_match);
> +#else
> +#define s3c24xx_i2c_match NULL
> +#endif
> +
>  static struct platform_driver s3c24xx_i2c_driver = {
>  	.probe		= s3c24xx_i2c_probe,
>  	.remove		= s3c24xx_i2c_remove,
> @@ -1024,6 +1072,7 @@ static struct platform_driver s3c24xx_i2c_driver = {
>  		.owner	= THIS_MODULE,
>  		.name	= "s3c-i2c",
>  		.pm	= S3C24XX_DEV_PM_OPS,
> +		.of_match_table	= s3c24xx_i2c_match,
>  	},

Looks pretty good.  After fixing the above comment, feel free to add
my:

Acked-by: Grant Likely <grant.likely@secretlab.ca>

>  };
>  
> -- 
> 1.6.6.rc2
> 
