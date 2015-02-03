From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: dts: Fix CLK_UART_ISP_SCLK clock assignment in
 exynos4x12.dtsi
Date: Tue, 03 Feb 2015 13:12:13 +0900
Message-ID: <06d501d03f67$96bc2b40$c43481c0$@kernel.org>
References: <1421329871-18819-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:17556 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965100AbbBCEMP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 23:12:15 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJ6002MZH0E2Q90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Feb 2015 13:12:14 +0900 (KST)
In-reply-to: <1421329871-18819-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, kgene@kernel.org
Cc: olof@lixom.net, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de

Sylwester Nawrocki wrote:
> 
> Assign proper FIMC-IS UART gate clock in the device DT node and not
> use the SRC_MASK gate. This fixes regression introduced in commit
> a37c82a3b3c0910019abfd22a97be1f ("clk: samsung: exynos4: Remove
> SRC_MASK_ISP gates").
> 
> Without this change exynos4 fimc-is driver fails to probe with an
> error log:
> 
> [    1.842447] ERROR: could not get clock /camera/fimc-is@12000000:uart(13)
> [    1.848529] exynos4-fimc-is 12000000.fimc-is: failed to get clock: uart
> [    1.855275] exynos4-fimc-is: probe of 12000000.fimc-is failed with error -2
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> 
> Kukjin, could you take this patch into your tree ? I have been applying it
> for several kernel releases now to get the Exynos4 FIMC driver even passing
> probing.
> 
> Thanks,
> Sylwester
>  arch/arm/boot/dts/exynos4x12.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
> index 93b7040..86e1800 100644
> --- a/arch/arm/boot/dts/exynos4x12.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> @@ -225,7 +225,7 @@
>  				 <&clock CLK_DIV_ISP0>,<&clock CLK_DIV_ISP1>,
>  				 <&clock CLK_DIV_MCUISP0>,
>  				 <&clock CLK_DIV_MCUISP1>,
> -				 <&clock CLK_SCLK_UART_ISP>,
> +				 <&clock CLK_UART_ISP_SCLK>,
>  				 <&clock CLK_ACLK200>, <&clock CLK_DIV_ACLK200>,
>  				 <&clock CLK_ACLK400_MCUISP>,
>  				 <&clock CLK_DIV_ACLK400_MCUISP>;
> --

Applied, thanks.

- Kukjin
