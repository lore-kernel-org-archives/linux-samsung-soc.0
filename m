From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH RFT] mach-s3c64xx:Fix error handling for certain calls to
 s3c_gpio_cfgpin_range in the file dev-audio.c
Date: Thu, 17 Sep 2015 11:23:19 +0100
Message-ID: <20150917102319.GL21084@n2100.arm.linux.org.uk>
References: <1442458835-25520-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:54923 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751175AbbIQKXd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Sep 2015 06:23:33 -0400
Content-Disposition: inline
In-Reply-To: <1442458835-25520-1-git-send-email-xerofoify@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Cc: kgene@kernel.org, k.kozlowski@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 16, 2015 at 11:00:35PM -0400, Nicholas Krause wrote:
> diff --git a/arch/arm/mach-s3c64xx/dev-audio.c b/arch/arm/mach-s3c64xx/dev-audio.c
> index ff780a8..81fabdb 100644
> --- a/arch/arm/mach-s3c64xx/dev-audio.c
> +++ b/arch/arm/mach-s3c64xx/dev-audio.c
> @@ -27,6 +27,7 @@
>  static int s3c64xx_i2s_cfg_gpio(struct platform_device *pdev)
>  {
>  	unsigned int base;
> +	int ret;
>  
>  	switch (pdev->id) {
>  	case 0:
> @@ -47,9 +48,9 @@ static int s3c64xx_i2s_cfg_gpio(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(3));
> -
> -	return 0;
> +	ret = s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(3));
> +
> +	return ret;

Let's look at the code:

        case 2:
                s3c_gpio_cfgpin(S3C64XX_GPC(4), S3C_GPIO_SFN(5));
                s3c_gpio_cfgpin(S3C64XX_GPC(5), S3C_GPIO_SFN(5));
                s3c_gpio_cfgpin(S3C64XX_GPC(7), S3C_GPIO_SFN(5));
                s3c_gpio_cfgpin_range(S3C64XX_GPH(6), 4, S3C_GPIO_SFN(5));
                return 0;
        default:
                printk(KERN_DEBUG "Invalid I2S Controller number: %d\n",
                        pdev->id);
                return -EINVAL;
        }

        s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(3));

        return 0;

and you're changing it to:

        case 2:
                s3c_gpio_cfgpin(S3C64XX_GPC(4), S3C_GPIO_SFN(5));
                s3c_gpio_cfgpin(S3C64XX_GPC(5), S3C_GPIO_SFN(5));
                s3c_gpio_cfgpin(S3C64XX_GPC(7), S3C_GPIO_SFN(5));
                s3c_gpio_cfgpin_range(S3C64XX_GPH(6), 4, S3C_GPIO_SFN(5));
                return 0;
        default:
                printk(KERN_DEBUG "Invalid I2S Controller number: %d\n",
                        pdev->id);
                return -EINVAL;
        }

        ret = s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(3));

        return ret;

What about all the previous calls to s3c_gpio_cfgpin_range() and
s3c_gpio_cfgpin() ?  Can't they fail as well?

However, _maybe_ the original authors idea was "I don't care if these
calls fail, it's safer to continue if they do" and your changes actually
result in breakage.

Maybe the better solution would be to add WARN_ON() around each of these.

There's a lot of questions here, none of them are a trivial case of "lets
generate a patch to just do some random change to the code and hope it's
right."

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
