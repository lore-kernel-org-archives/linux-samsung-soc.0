From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: Re: [PATCH 2/2] ARM: EXYNOS: Set HDMI platform data in Origen board
Date: Thu, 05 Apr 2012 11:37:30 +0200
Message-ID: <4F7D67DA.2010105@samsung.com>
References: <1333614296-13256-1-git-send-email-tushar.behera@linaro.org>
 <1333614296-13256-3-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:61754 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753093Ab2DEJhh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Apr 2012 05:37:37 -0400
Received: from euspt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M2000N002Q70J40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 Apr 2012 10:37:19 +0100 (BST)
Received: from [106.116.48.223] by spt2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0M2000DT82QKLT@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 Apr 2012 10:37:33 +0100 (BST)
In-reply-to: <1333614296-13256-3-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Hi Tushar Behera,

On 04/05/2012 10:24 AM, Tushar Behera wrote:
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/mach-exynos/mach-origen.c |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
> index 878d4c9..ac6f78f 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -41,6 +41,7 @@
>  #include <plat/pd.h>
>  #include <plat/fb.h>
>  #include <plat/mfc.h>
> +#include <plat/hdmi.h>
>  
>  #include <mach/ohci.h>
>  #include <mach/map.h>
> @@ -671,6 +672,11 @@ static void __init origen_bt_setup(void)
>  	s3c_gpio_setpull(EXYNOS4_GPX2(2), S3C_GPIO_PULL_NONE);
>  }
>  
> +/* I2C module and id for HDMIPHY */
> +static struct i2c_board_info hdmiphy_info = {
> +	I2C_BOARD_INFO("hdmiphy", 0x38),

I warn you :) that the s5p-hdmiphy driver is going to use driver variant
to handle per-platform setup arrays for HDMIPHY. Refer to patch

http://thread.gmane.org/gmane.linux.drivers.video-input-infrastructure/45756/focus=45757

If the mentioned patch gets merged into the mainline then the support
for HDMI will be broken on your machine.

Regards,
Tomasz Stanislawski

> +};
> +
>  static void s5p_tv_setup(void)
>  {
>  	/* Direct HPD to HDMI chip */
> @@ -718,6 +724,7 @@ static void __init origen_machine_init(void)
>  
>  	s5p_tv_setup();
>  	s5p_i2c_hdmiphy_set_platdata(NULL);
> +	s5p_hdmi_set_platdata(&hdmiphy_info, NULL, 0);
>  
>  	s5p_fimd0_set_platdata(&origen_lcd_pdata);
>  
