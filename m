From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: S3C64XX: Dynamically assign interrupts for CPU
 PMIC on Cragganmore
Date: Tue, 19 Jun 2012 17:50:31 +0900
Message-ID: <019a01cd4df8$954ad530$bfe07f90$%kim@samsung.com>
References: <1338727361-25243-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1338727361-25243-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47077 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753624Ab2FSIud (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jun 2012 04:50:33 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5U00G3XWJF0EB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:50:32 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5U00G2PWK8IRG0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Jun 2012 17:50:32 +0900 (KST)
In-reply-to: <1338727361-25243-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> Now that the WM831x driver uses irq_domain we can happily allow it to
> assign its own IRQs.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/include/mach/crag6410.h |    3 +--
>  arch/arm/mach-s3c64xx/mach-crag6410.c         |    1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/include/mach/crag6410.h
> b/arch/arm/mach-s3c64xx/include/mach/crag6410.h
> index ec97c15..4c3c999 100644
> --- a/arch/arm/mach-s3c64xx/include/mach/crag6410.h
> +++ b/arch/arm/mach-s3c64xx/include/mach/crag6410.h
> @@ -13,8 +13,7 @@
> 
>  #include <linux/gpio.h>
> 
> -#define BANFF_PMIC_IRQ_BASE		IRQ_BOARD_START
> -#define GLENFARCLAS_PMIC_IRQ_BASE	(IRQ_BOARD_START + 64)
> +#define GLENFARCLAS_PMIC_IRQ_BASE	IRQ_BOARD_START
> 
>  #define PCA935X_GPIO_BASE		GPIO_BOARD_START
>  #define CODEC_GPIO_BASE			(GPIO_BOARD_START + 8)
> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-
> s3c64xx/mach-crag6410.c
> index d0c352d..161c3b6 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
> @@ -525,7 +525,6 @@ static struct wm831x_touch_pdata touch_pdata
> __initdata = {
> 
>  static struct wm831x_pdata crag_pmic_pdata __initdata = {
>  	.wm831x_num = 1,
> -	.irq_base = BANFF_PMIC_IRQ_BASE,
>  	.gpio_base = BANFF_PMIC_GPIO_BASE,
>  	.soft_shutdown = true,
> 
> --
> 1.7.10

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
