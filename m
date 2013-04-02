From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: S3C64XX: Slow down mic detection rate for wm5102
Date: Tue, 02 Apr 2013 18:39:43 +0900
Message-ID: <234901ce2f86$01b22ba0$051682e0$%kim@samsung.com>
References: <1364469746-5026-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1364469746-5026-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18721 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760555Ab3DBJjq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 05:39:46 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKM005NKG698MJ0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Apr 2013 18:39:45 +0900 (KST)
In-reply-to: <1364469746-5026-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Charles Keepax' <ckeepax@opensource.wolfsonmicro.com>

Mark Brown wrote:
> 
> From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> 
> A slightly slower rate provides more reliable jack detection during
> slower insertions.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/mach-crag6410-module.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-
> s3c64xx/mach-crag6410-module.c
> index bf3d1c0..a946b75 100644
> --- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> +++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> @@ -210,6 +210,7 @@ static struct arizona_pdata wm5102_reva_pdata = {
>  	.gpio_base = CODEC_GPIO_BASE,
>  	.irq_active_high = true,
>  	.micd_pol_gpio = CODEC_GPIO_BASE + 4,
> +	.micd_rate = 6,
>  	.gpio_defaults = {
>  		[2] = 0x10000, /* AIF3TXLRCLK */
>  		[3] = 0x4,     /* OPCLK */
> --
> 1.7.10.4

Applied, thanks.

- Kukjin
