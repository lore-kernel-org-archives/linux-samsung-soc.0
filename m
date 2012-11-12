From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v7 0/5] usb: phy: samsung: Introducing usb phy driver for
 samsung SoCs
Date: Mon, 12 Nov 2012 13:41:24 +0900
Message-ID: <004201cdc08f$fa0fd3d0$ee2f7b70$%kim@samsung.com>
References: <1351573057-22249-1-git-send-email-p.paneri@samsung.com>
 <20121109115440.GC8078@arwen.pp.htv.fi>
 <CAH9JG2X1a8MqBpnk8uHRjsGnaD7uob5GBhUh_aS5iCprEvi2XQ@mail.gmail.com>
 <CAD6zSYN6xpHt54d-w=6veb6AErTq6ERQcneo7ewC-qsBoMuThQ@mail.gmail.com>
 <20121109135441.GC8567@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:61422 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752114Ab2KLEl3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Nov 2012 23:41:29 -0500
In-reply-to: <20121109135441.GC8567@arwen.pp.htv.fi>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com, 'Praveen Paneri' <p.paneri@samsung.com>
Cc: 'Kyungmin Park' <kmpark@infradead.org>, 'Lukasz Majewski' <l.majewski@samsung.com>, linux-samsung-soc@vger.kernel.org, =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, gregkh@linuxfoundation.org, devicetree-discuss@lists.ozlabs.org, linux-usb@vger.kernel.org, 'Grant Likely' <grant.likely@secretlab.ca>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Vivek Gautam' <gautam.vivek@samsung.com>, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, t.figa@samsung.com, linux-arm-kernel@lists.infradead.org

Felipe Balbi wrote:
> 
> Hi,
> 
Hi :-)

[...]

> Sure, but I still need Kukjin's 'say-so' for the arch/arm/plat-samsung
> and arch/arm/mach-exynos part.
> 
Basically, this approach looks OK to me.

BTW, I have some comments and need to update...

>From 4th patch...

> diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-
> s3c64xx/mach-smdk6410.c

[...]

> @@ -72,6 +73,8 @@
>  #include <linux/platform_data/touchscreen-s3c2410.h>
>  #include <plat/keypad.h>
>  #include <plat/backlight.h>
> +#include <plat/regs-fb-v4.h>

Why? In addition, this causes build error with s3c6400_defconfig.

[...]

> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index 03f654d..9cdb666 100644

[...]

> @@ -1370,6 +1371,30 @@ struct platform_device s5p_device_mixer = {
> 
>  /* USB */
> 
> +#ifdef CONFIG_S3C_DEV_USB_HSOTG
> +/* USB PHY*/
> +static struct resource samsung_usbphy_resource[] = {
> +	[0] = {
> +		.start = S3C_PA_USB_PHY,
> +		.end   = S3C_PA_USB_PHY + SZ_16 - 1,
> +		.flags = IORESOURCE_MEM,
> +	},
> +};

+static struct resource samsung_usbphy_resource[] = {
+	[0] = DEFINED_RES_MEM(S3C_PA_USB_PHY, SZ_16),
+};

[...]

Happens build error with s5pv210_defconfig

arch/arm/plat-samsung/devs.c:1375: error: 'S3C_PA_USB_PHY' undeclared here
(not in a function)
make[2]: *** [arch/arm/plat-samsung/devs.o] Error 1
make[1]: *** [arch/arm/plat-samsung] Error 2
make[1]: *** Waiting for unfinished jobs....

And another build error with exynos_defconfig...

arch/arm/mach-exynos/built-in.o: In function `.LANCHOR1':
setup-i2c0.c:(.data+0x8080): undefined reference to
`s5p_usb_phy_pmu_isolation'

>From 5th patch....

If possible, please to use 'ARM: [sub-arch dir name]: [subject]' format.
So I preferred to use 'ARM: EXYNOS: Enabling samsung-usbphy driver for
EXYNOS4210' on that.

Please make sure your patch has no problem for kernel compilation before
submitting...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
