From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2 1/3] i2c: s3c2410: Keep a copy of platform data and
 use it.
Date: Sat, 30 Jul 2011 21:51:05 -0600
Message-ID: <20110731035105.GG24334@ponder.secretlab.ca>
References: <1311329918-8105-1-git-send-email-thomas.abraham@linaro.org>
 <1311329918-8105-2-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:41660 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750859Ab1GaO0Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 31 Jul 2011 10:26:24 -0400
Content-Disposition: inline
In-Reply-To: <1311329918-8105-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

On Fri, Jul 22, 2011 at 03:48:36PM +0530, Thomas Abraham wrote:
> The platform data is copied into driver's private data and the copy is
> used for all access to the platform data. This simpifies the addition
> of device tree support for the i2c-s3c2410 driver.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index 6c00c10..e132168 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -78,6 +78,7 @@ struct s3c24xx_i2c {
>  	struct resource		*ioarea;
>  	struct i2c_adapter	adap;
>  
> +	struct s3c2410_platform_i2c	pdata;

After looking at a bunch of patches, there is another way do do this
I think.  Instead of copying pdata into the private data structure, it
can remain as a pointer if the DT code uses devm_kzmalloc to allocate
a s3c2410_platform_i2c structure when needed.

I leave it up to you (and Ben) though as to which you prefer.  I'm
okay either way, and you can add:

Acked-by: Grant Likely <grant.likely@secretlab.ca>


>  #ifdef CONFIG_CPU_FREQ
>  	struct notifier_block	freq_transition;
>  #endif
> @@ -626,7 +627,7 @@ static int s3c24xx_i2c_calcdivisor(unsigned long clkin, unsigned int wanted,
>  
>  static int s3c24xx_i2c_clockrate(struct s3c24xx_i2c *i2c, unsigned int *got)
>  {
> -	struct s3c2410_platform_i2c *pdata = i2c->dev->platform_data;
> +	struct s3c2410_platform_i2c *pdata = &i2c->pdata;
>  	unsigned long clkin = clk_get_rate(i2c->clk);
>  	unsigned int divs, div1;
>  	unsigned long target_frequency;
> @@ -755,7 +756,7 @@ static int s3c24xx_i2c_init(struct s3c24xx_i2c *i2c)
>  
>  	/* get the plafrom data */
>  
> -	pdata = i2c->dev->platform_data;
> +	pdata = &i2c->pdata;
>  
>  	/* inititalise the gpio */
>  
> @@ -810,6 +811,8 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>  
> +	memcpy(&i2c->pdata, pdata, sizeof(*pdata));
> +
>  	strlcpy(i2c->adap.name, "s3c2410-i2c", sizeof(i2c->adap.name));
>  	i2c->adap.owner   = THIS_MODULE;
>  	i2c->adap.algo    = &s3c24xx_i2c_algorithm;
> -- 
> 1.6.6.rc2
> 
