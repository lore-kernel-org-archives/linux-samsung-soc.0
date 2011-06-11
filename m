From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [RE-SEND] [PATCH 3/4] s3c-fb: Add support EXYNOS4 FIMD
Date: Sat, 11 Jun 2011 18:40:50 +0200
Message-ID: <4DF39A92.5050609@gmail.com>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com> <1307693723-14971-4-git-send-email-anand.kn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:50618 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751032Ab1FKQk6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 11 Jun 2011 12:40:58 -0400
Received: by ewy4 with SMTP id 4so1212373ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Jun 2011 09:40:57 -0700 (PDT)
In-Reply-To: <1307693723-14971-4-git-send-email-anand.kn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Kumar N <anand.kn@samsung.com>
Cc: lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux@arm.linux.org.uk

Hello,

On 06/10/2011 10:15 AM, Anand Kumar N wrote:
> From: Jonghun Han<jonghun.han@samsung.com>
> 
> This patch adds struct s3c_fb_driverdata s3c_fb_data_exynos4 for EXYNOS4.
> The clk_type is added to distinguish clock type in it and lcd_clk is added
> in structure s3c_fb to calculate divider for lcd panel.
> 
> Please refer to below diagrams about clocks of FIMD IP. FIMD driver needs

these ascii diagrams are quite bulky, how about moving them to the cover
letter message ?

> two clocks for FIMD IP and LCD pixel clock. Actually, the LCD pixel clock
> can be selected from 1.clk 'lcd' and 2.SCLK_FIMD before EXYNOS4. But from
> EXYNOS4, the 2.SCLK_FIMD can be used only for source of LCD pixel clock.
> 
> FIMD_CLK_TYPE0:
>             ------------------------------------
>                        dsys bus
>             ----------------+-------------------
>                             |
>                             |1.clk 'lcd'
>                             |
>                             | FIMD block
>                         +---+-----------+
> 4.mout_mpll |\         |   |           |
>      --------|m|        | +-+-+ +----+  |
>              |u|-+      | |   +-+core|  |
>              |x| |      | |     +----+  |
>              |/  |      | | |\          |
>                  |      | +-|m|  +---+  |
>                  |      |   |u|--+div|  |
>                  +------+---|x|  +---+  |
>             2.SCLK_FIMD |   |/     |    |
>                         |          |    |
>                         +----------+----+
>                                    |
>             inside of SoC          |
>             -----------------------+--------------------------
>             outside of SoC         |
>                                    | 3.LCD pixel clock
>                                    |
>                            +--------------+
>                            | LCD module   |
>                            +--------------+
> 
> FIMD_CLK_TYPE1:
>             ------------------------------------
>                        dsys bus
>             ----------------+-------------------
>                             |
>                             |1.clk 'fimd'
>                             |
>                             | FIMD block
>                         +---+-----------+
> 4.mout_mpll |\         |   |           |
>      --------|m|        | +-+-+ +----+  |
>              |u|-+      | |   +-+core|  |
>              |x| |      | |     +----+  |
>              |/  |      | | |\          |
>                  |      | +-|m|  +---+  |
>                  |      |   |u|--+div|  |
>                  +------+---|x|  +---+  |
>             2.SCLK_FIMD |   |/     |    |
>                         |          |    |
>                         +----------+----+
>                                    |
>             inside of SoC          |
>             -----------------------+--------------------------
>             outside of SoC         |
>                                    | 3.LCD pixel clock
>                                    |
>                            +--------------+
>                            | LCD module   |
>                            +--------------+
> 
> FIMD_CLK_TYPE1:
>             ------------------------------------
>                        dsys bus
>             ----------------+-------------------
>                             |
>                             |1.clk 'fimd'
>                             |
>                             | FIMD block
>                         +---+-----------+
> 4.mout_mpll |\         |   |           |
>      --------|m|        |   |   +----+  |
>              |u|-+      |   +---+core|  |
>              |x| |      |       +----+  |
>              |/  |      |               |
>                  |      |        +---+  |
>                  |      |     +--+div|  |
>                  +------+-----+  +---+  |
>             2.SCLK_FIMD |          |    |
>                         |          |    |
>                         +----------+----+
>                                    |
>             inside of SoC          |
>             -----------------------+--------------------------
>             -----------------------+--------------------------
>             outside of SoC         |
>                                    | 3.LCD pixel clock
>                                    |
>                            +--------------+
>                            | LCD module   |
>                            +--------------+
> 
> FIMD_CLK_TYPE1:
>             ------------------------------------
>                        dsys bus
>             ----------------+-------------------
>                             |
>                             |1.clk 'fimd'
>                             |
>                             | FIMD block
>                         +---+-----------+
> 4.mout_mpll |\         |   |           |
>      --------|m|        |   |   +----+  |
>              |u|-+      |   +---+core|  |
>              |x| |      |       +----+  |
>              |/  |      |               |
>                  |      |        +---+  |
>                  |      |     +--+div|  |
>                  +------+-----+  +---+  |
>             2.SCLK_FIMD |          |    |
>                         |          |    |
>                         +----------+----+
>                                    |
>             inside of SoC          |
>             -----------------------+--------------------------
>             outside of SoC         |
>                                    | 3.LCD pixel clock
>                                    |
>                            +--------------+
>                            | LCD module   |
>                            +--------------+

Sorry, the 2 above diagrams look almost identical to me.
Is there really any difference between them (except double line 
above)?

> 
> Change-Id: I52b69285151dc4d67bc0be5d0020ca49ba58f911

What is this (gerrit?) change ID here for ?

> Signed-off-by: Jonghun Han<jonghun.han@samsung.com>
> Signed-off-by: Jingoo Han<jg1.han@samsung.com>
> ---
>   drivers/video/Kconfig  |    2 +-
>   drivers/video/s3c-fb.c |  131 ++++++++++++++++++++++++++++++++++++++++++------
>   2 files changed, 117 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index 549b960..963b8b7 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -2027,7 +2027,7 @@ config FB_TMIO_ACCELL
> 
>   config FB_S3C
>   	tristate "Samsung S3C framebuffer support"
> -	depends on FB&&  S3C_DEV_FB
> +	depends on FB&&  (S3C_DEV_FB || S5P_DEV_FIMD0)
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
> index 0352afa..7445740 100644
> --- a/drivers/video/s3c-fb.c
> +++ b/drivers/video/s3c-fb.c
> @@ -66,6 +66,9 @@ struct s3c_fb;
>   #define VIDOSD_C(win, variant) (OSD_BASE(win, variant) + 0x08)
>   #define VIDOSD_D(win, variant) (OSD_BASE(win, variant) + 0x0C)
> 
> +#define FIMD_CLK_TYPE0 0
> +#define FIMD_CLK_TYPE1 1
> +
>   /**
>    * struct s3c_fb_variant - fb variant information
>    * @is_2443: Set if S3C2443/S3C2416 style hardware.
> @@ -98,6 +101,7 @@ struct s3c_fb_variant {
> 
>   	unsigned int	has_prtcon:1;
>   	unsigned int	has_shadowcon:1;
> +	unsigned int	clk_type:1;

Would "has_pixclk_mux" instead of clk_type make more sense ?
If so then you could get rid of the above FIMD_CLK_TYPE* definitions.

>   };
> 
>   /**
> @@ -185,7 +189,8 @@ struct s3c_fb_vsync {
>    * @slock: The spinlock protection for this data sturcture.
>    * @dev: The device that we bound to, for printing, etc.
>    * @regs_res: The resource we claimed for the IO registers.
> - * @bus_clk: The clk (hclk) feeding our interface and possibly pixclk.
> + * @bus_clk: The clk (hclk) feeding FIMD IP core.
> + * @lcd_clk: The clk (sclk) feeding our interface and possibly pixclk.
>    * @regs: The mapped hardware registers.
>    * @variant: Variant information for this hardware.
>    * @enabled: A bitmask of enabled hardware windows.
> @@ -200,6 +205,7 @@ struct s3c_fb {
>   	struct device		*dev;
>   	struct resource		*regs_res;
>   	struct clk		*bus_clk;
> +	struct clk		*lcd_clk;
>   	void __iomem		*regs;
>   	struct s3c_fb_variant	 variant;
> 
> @@ -337,7 +343,7 @@ static int s3c_fb_check_var(struct fb_var_screeninfo *var,
>    */
>   static int s3c_fb_calc_pixclk(struct s3c_fb *sfb, unsigned int pixclk)
>   {
> -	unsigned long clk = clk_get_rate(sfb->bus_clk);
> +	unsigned long clk = clk_get_rate(sfb->lcd_clk);
>   	unsigned long long tmp;
>   	unsigned int result;
> 
> @@ -1315,8 +1321,10 @@ static int __devinit s3c_fb_probe(struct platform_device *pdev)
>   	struct s3c_fb_platdata *pd;
>   	struct s3c_fb *sfb;
>   	struct resource *res;
> +	struct clk *mout_mpll = NULL;
>   	int win;
>   	int ret = 0;
> +	u32 rate = 134000000;

How about making this the variant property ? Or is it same for all SoCs?

> 
>   	platid = platform_get_device_id(pdev);
>   	fbdrv = (struct s3c_fb_driverdata *)platid->driver_data;
> @@ -1346,22 +1354,62 @@ static int __devinit s3c_fb_probe(struct platform_device *pdev)
> 
>   	spin_lock_init(&sfb->slock);
> 
> -	sfb->bus_clk = clk_get(dev, "lcd");
> -	if (IS_ERR(sfb->bus_clk)) {
> -		dev_err(dev, "failed to get bus clock\n");
> -		ret = PTR_ERR(sfb->bus_clk);
> +	switch (sfb->variant.clk_type) {
> +	case FIMD_CLK_TYPE0:
> +		sfb->bus_clk = clk_get(dev, "lcd");
> +		if (IS_ERR(sfb->bus_clk)) {
> +			dev_err(dev, "failed to get bus clock\n");
> +			ret = PTR_ERR(sfb->bus_clk);
> +			goto err_sfb;
> +		}
> +
> +		clk_enable(sfb->bus_clk);
> +
> +		sfb->lcd_clk = sfb->bus_clk;
> +		break;
> +
> +	case FIMD_CLK_TYPE1:
> +		sfb->bus_clk = clk_get(&pdev->dev, "fimd");
> +		if (IS_ERR(sfb->bus_clk)) {
> +			dev_err(&pdev->dev, "failed to get clock for fimd\n");
> +			ret = PTR_ERR(sfb->bus_clk);
> +			goto err_sfb;
> +		}
> +		clk_enable(sfb->bus_clk);
> +
> +		sfb->lcd_clk = clk_get(&pdev->dev, "sclk_fimd");
> +		if (IS_ERR(sfb->lcd_clk)) {
> +			dev_err(&pdev->dev, "failed to get sclk for fimd\n");
> +			ret = PTR_ERR(sfb->lcd_clk);
> +			goto err_bus_clk;
> +		}
> +
> +		mout_mpll = clk_get(&pdev->dev, "mout_mpll");
> +		if (IS_ERR(mout_mpll)) {
> +			dev_err(&pdev->dev, "failed to get mout_mpll\n");
> +			ret = PTR_ERR(mout_mpll);
> +			goto err_lcd_clk;
> +		}
> +		clk_set_parent(sfb->lcd_clk, mout_mpll);
> +		clk_put(mout_mpll);
> +
> +		clk_set_rate(sfb->lcd_clk, rate);
> +		clk_enable(sfb->lcd_clk);

Please, do not hard code parent clocks in the driver.

> +		dev_dbg(&pdev->dev, "set fimd sclk rate to %d\n", rate);
> +		break;
> +
> +	default:
> +		dev_err(dev, "failed to enable clock for FIMD\n");
>   		goto err_sfb;
>   	}

I'm not really a clock expert, but IMHO there is an issue in Thomas'
migration to clkdev proposal [1] that the device clock connection ids
(con_id) and clock names related to them are identical. Mostly it works
but in situation like this one it is not possible to remap two clocks
of different names onto a single connection id.

For instance, looking at arch/arm/mach-omap2/clock3xxx_data.c:

static struct clk i2c3_fck = {
	.name		= "i2c3_fck",
                           ^^^^^^^^^^
	.ops		= &clkops_omap2_dflt_wait,
	.parent		= &core_96m_fck,
        ...
};
static struct clk i2c2_fck = {
	.name		= "i2c2_fck",
                          ^^^^^^^^^^^
	.ops		= &clkops_omap2_dflt_wait,
	...
};

static struct omap_clk omap3xxx_clks[] = {
	...
	CLK("omap_i2c.3", "fck", &i2c3_fck, CK_3XXX),
                          ^^^^^^^^^^^^^^^^^ 
	CLK("omap_i2c.2", "fck", &i2c2_fck, CK_3XXX),
                          ^^^^^^^^^^^^^^^^^ 
	...

Different clock names (i2c3_fck, i2c3_fck,..) are mapped to single
unified id (fck), which the driver only needs to care about.
The name is common across H/W instances and also SoC variants. 
So it doesn't have to be driver's business to resolve clock differences.

The same (con_id) name can be used on distinct SoC versionproviding similar/same peripheral device IP.
It's aeasy to figure out by just comparing omap3xxx_clks[] and
omap44xx_clks arrays.

That said I wouldn't go for a "devname" in struct clk, just create
an additional table matching device names, con_id and struct clk and
use it while registering clk_lookup items into clkdev.

> 
> -	clk_enable(sfb->bus_clk);
> -
>   	pm_runtime_enable(sfb->dev);
> 
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	if (!res) {
>   		dev_err(dev, "failed to find registers\n");
>   		ret = -ENOENT;
> -		goto err_clk;
> +		goto err_lcd_clk;
>   	}
> 
>   	sfb->regs_res = request_mem_region(res->start, resource_size(res),
> @@ -1369,7 +1417,7 @@ static int __devinit s3c_fb_probe(struct platform_device *pdev)
>   	if (!sfb->regs_res) {
>   		dev_err(dev, "failed to claim register region\n");
>   		ret = -ENOENT;
> -		goto err_clk;
> +		goto err_lcd_clk;
>   	}
> 
>   	sfb->regs = ioremap(res->start, resource_size(res));
> @@ -1451,9 +1499,15 @@ err_ioremap:
>   err_req_region:
>   	release_mem_region(sfb->regs_res->start, resource_size(sfb->regs_res));
> 
> -err_clk:
> -	clk_disable(sfb->bus_clk);
> -	clk_put(sfb->bus_clk);
> +err_lcd_clk:
> +	clk_disable(sfb->lcd_clk);
> +	clk_put(sfb->lcd_clk);
> +
> +err_bus_clk:
> +	if (sfb->variant.clk_type != FIMD_CLK_TYPE0) {
> +		clk_disable(sfb->bus_clk);
> +		clk_put(sfb->bus_clk);
> +	}
> 
>   err_sfb:
>   	kfree(sfb);
> @@ -1482,8 +1536,20 @@ static int __devexit s3c_fb_remove(struct platform_device *pdev)
> 
>   	iounmap(sfb->regs);
> 
> -	clk_disable(sfb->bus_clk);
> -	clk_put(sfb->bus_clk);
> +	switch (sfb->variant.clk_type) {
> +	case FIMD_CLK_TYPE1:
> +		clk_disable(sfb->lcd_clk);
> +		clk_put(sfb->lcd_clk);
> +		/* fall through to default case */
> +	case FIMD_CLK_TYPE0:
> +		clk_disable(sfb->bus_clk);
> +		clk_put(sfb->bus_clk);
> +		break;
> +	default:
	
Considering clk_type data type this is unreachable code.

> +		dev_err(sfb->dev, "invalid clock type(%d)\n",
> +				sfb->variant.clk_type);
> +		break;
> +	}
...

--
Regards,
Sylwester

[1] http://www.spinics.net/lists/arm-kernel/msg127901.html
    http://www.spinics.net/lists/arm-kernel/msg127907.html
