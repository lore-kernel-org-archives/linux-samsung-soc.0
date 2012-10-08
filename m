From: Sangsu Park <sangsu4u.park@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Remove wrong I2S0 clock from peril clock
Date: Mon, 08 Oct 2012 10:31:09 +0900
Message-ID: <004c01cda4f4$98a8d7b0$c9fa8710$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33002 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750994Ab2JHBbM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Oct 2012 21:31:12 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBJ00ANVW7U1Y80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 10:31:10 +0900 (KST)
Received: from DOSANGSU4UP02 ([12.23.118.226])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBJ00IYQW7Y3G30@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 10:31:10 +0900 (KST)
References: 
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, sbkim73@samsung.com

ping

On 5 October 2012 4:37 PM, Sangsu Park < sangsu4u.park@samsung.com> wrote:
> Remove I2S0 clk from peril since peril clock doesn't have I2S0 clk for
EXYNOS4.
> Audio Subsystem block has I2S0 clk.
> 
> Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>
> ---
>  arch/arm/mach-exynos/clock-exynos4.c |    5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-
> exynos/clock-exynos4.c
> index 6a45c9a..fa8a134 100644
> --- a/arch/arm/mach-exynos/clock-exynos4.c
> +++ b/arch/arm/mach-exynos/clock-exynos4.c
> @@ -613,11 +613,6 @@ static struct clk exynos4_init_clocks_off[] = {
>  		.ctrlbit	= (1 << 18),
>  	}, {
>  		.name		= "iis",
> -		.devname	= "samsung-i2s.0",
> -		.enable		= exynos4_clk_ip_peril_ctrl,
> -		.ctrlbit	= (1 << 19),
> -	}, {
> -		.name		= "iis",
>  		.devname	= "samsung-i2s.1",
>  		.enable		= exynos4_clk_ip_peril_ctrl,
>  		.ctrlbit	= (1 << 20),
> --
> 1.7.9.5

Best regards,
Sangsu Park.
