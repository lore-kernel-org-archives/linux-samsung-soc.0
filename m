From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S3C64XX: Dynamically allocate the IRQ range for
 WM8994 on Cragganmore
Date: Tue, 19 Jun 2012 17:50:28 +0900
Message-ID: <019901cd4df8$934b5bb0$b9e21310$%kim@samsung.com>
References: <1338727361-25243-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:8624 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753624Ab2FSIu3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jun 2012 04:50:29 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5U004DNWELQO60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:50:28 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5U00F9RWK4J7K0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:50:28 +0900 (KST)
In-reply-to: <1338727361-25243-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> Use the new irqdomain support in the WM8994 driver to dynamically allocate
> the interrupt range for the WM8994 rather than doing it explicitly. This
> is more idiomatic for modern interrupt usage.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/include/mach/crag6410.h |    1 -
>  arch/arm/mach-s3c64xx/mach-crag6410-module.c  |    1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/include/mach/crag6410.h
> b/arch/arm/mach-s3c64xx/include/mach/crag6410.h
> index 4cb2f951..ec97c15 100644
> --- a/arch/arm/mach-s3c64xx/include/mach/crag6410.h
> +++ b/arch/arm/mach-s3c64xx/include/mach/crag6410.h
> @@ -15,7 +15,6 @@
> 
>  #define BANFF_PMIC_IRQ_BASE		IRQ_BOARD_START
>  #define GLENFARCLAS_PMIC_IRQ_BASE	(IRQ_BOARD_START + 64)
> -#define CODEC_IRQ_BASE			(IRQ_BOARD_START + 128)
> 
>  #define PCA935X_GPIO_BASE		GPIO_BOARD_START
>  #define CODEC_GPIO_BASE			(GPIO_BOARD_START + 8)
> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-
> s3c64xx/mach-crag6410-module.c
> index 4979372..4a83b4e 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> @@ -168,7 +168,6 @@ static struct wm8994_pdata wm8994_pdata = {
>  	.gpio_defaults = {
>  		0x3,          /* IRQ out, active high, CMOS */
>  	},
> -	.irq_base = CODEC_IRQ_BASE,
>  	.ldo = {
>  		 { .init_data = &wm8994_ldo1, },
>  		 { .init_data = &wm8994_ldo2, },
> --
> 1.7.10

Yeah, I agree with your comments. Will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
