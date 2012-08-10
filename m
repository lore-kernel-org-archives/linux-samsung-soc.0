From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S3C64XX: Update configuration for WM5102 module
 on Cragganmore
Date: Fri, 10 Aug 2012 13:56:23 +0900
Message-ID: <0db901cd76b4$7daf1730$790d4590$%kim@samsung.com>
References: <1344535549-4371-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:41304 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751544Ab2HJE4k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Aug 2012 00:56:40 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8I00FC3WDPC560@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Aug 2012 13:56:24 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8I00BDFWDZTB20@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Aug 2012 13:56:23 +0900 (KST)
In-reply-to: <1344535549-4371-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Mark Brown wrote:
> 
> SPI is also connected on the board, use that instead of I2C as it's much
> faster. Also define platform data now the core driver is in mainline.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/mach-crag6410-module.c |   35
> ++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-
> s3c64xx/mach-crag6410-module.c
> index f81f089..22dd77b 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> @@ -192,9 +192,33 @@ static const struct i2c_board_info wm1277_devs[] = {
>  	},
>  };
> 
> -static const struct i2c_board_info wm5102_devs[] = {
> -	{ I2C_BOARD_INFO("wm5102", 0x1a),
> -	  .irq = GLENFARCLAS_PMIC_IRQ_BASE + WM831X_IRQ_GPIO_2, },
> +static struct arizona_pdata wm5102_pdata = {
> +	.ldoena = S3C64XX_GPN(7),
> +	.gpio_base = CODEC_GPIO_BASE,
> +	.irq_active_high = true,
> +	.micd_pol_gpio = CODEC_GPIO_BASE + 4,
> +	.gpio_defaults = {
> +		[2] = 0x10000, /* AIF3TXLRCLK */
> +		[3] = 0x4,     /* OPCLK */
> +	},
> +};

Mark, happens error.

arch/arm/mach-s3c64xx/mach-crag6410-module.c:184: error: variable
'wm5102_pdata' has initializer but incomplete type
arch/arm/mach-s3c64xx/mach-crag6410-module.c:185: error: unknown field
'ldoena' specified in initializer
arch/arm/mach-s3c64xx/mach-crag6410-module.c:185: warning: excess elements
in struct initializer
arch/arm/mach-s3c64xx/mach-crag6410-module.c:185: warning: (near
initialization for 'wm5102_pdata')
arch/arm/mach-s3c64xx/mach-crag6410-module.c:186: error: unknown field
'gpio_base' specified in initializer
arch/arm/mach-s3c64xx/mach-crag6410-module.c:186: warning: excess elements
in struct initializer
arch/arm/mach-s3c64xx/mach-crag6410-module.c:186: warning: (near
initialization for 'wm5102_pdata')
arch/arm/mach-s3c64xx/mach-crag6410-module.c:187: error: unknown field
'irq_active_high' specified in initializer
arch/arm/mach-s3c64xx/mach-crag6410-module.c:187: warning: excess elements
in struct initializer
arch/arm/mach-s3c64xx/mach-crag6410-module.c:187: warning: (near
initialization for 'wm5102_pdata')
arch/arm/mach-s3c64xx/mach-crag6410-module.c:188: error: unknown field
'micd_pol_gpio' specified in initializer
arch/arm/mach-s3c64xx/mach-crag6410-module.c:188: warning: excess elements
in struct initializer
arch/arm/mach-s3c64xx/mach-crag6410-module.c:188: warning: (near
initialization for 'wm5102_pdata')
arch/arm/mach-s3c64xx/mach-crag6410-module.c:189: error: unknown field
'gpio_defaults' specified in initializer
arch/arm/mach-s3c64xx/mach-crag6410-module.c:189: error: extra brace group
at end of initializer
arch/arm/mach-s3c64xx/mach-crag6410-module.c:189: error: (near
initialization for 'wm5102_pdata')
arch/arm/mach-s3c64xx/mach-crag6410-module.c:192: warning: excess elements
in struct initializer
arch/arm/mach-s3c64xx/mach-crag6410-module.c:192: warning: (near
initialization for 'wm5102_pdata')
make[1]: *** [arch/arm/mach-s3c64xx/mach-crag6410-module.o] Error 1
make: *** [arch/arm/mach-s3c64xx] Error 2
make: *** Waiting for unfinished jobs....

Probably, this patch needs following?

--
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
index c148384..7f4f9eb 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
@@ -16,6 +16,7 @@
 #include <linux/mfd/wm831x/irq.h>
 #include <linux/mfd/wm831x/gpio.h>
 #include <linux/mfd/wm8994/pdata.h>
+#include <linux/mfd/arizona/pdata.h>

 #include <linux/regulator/machine.h>
--

If you're ok, I will fix build error by above when I apply.

[...]

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
