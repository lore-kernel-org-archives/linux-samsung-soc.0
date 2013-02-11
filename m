From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4x12-pinctrl: Correct pin configuration of
 SD 4
Date: Mon, 11 Feb 2013 11:26:09 +0100
Message-ID: <2881673.R8geCWDSpT@amdc1227>
References: <1360578073-16207-1-git-send-email-s.shirish@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34353 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755053Ab3BKK0P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Feb 2013 05:26:15 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI100AX3WZGTK50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Feb 2013 19:26:14 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MI1004NFWZO2Q10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Feb 2013 19:26:14 +0900 (KST)
In-reply-to: <1360578073-16207-1-git-send-email-s.shirish@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shirish S <s.shirish@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Monday 11 of February 2013 05:21:13 Shirish S wrote:
> This patch corrects the pin function value of sd4_bus8 from 3
> to 4.
> This is verified on origen board for testing eMMC on
> dw_mci controller.
> 
> Signed-off-by: Shirish S <s.shirish@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi index 8e6115a..099cec7
> 100644
> --- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> @@ -661,7 +661,7 @@
> 
>  		sd4_bus8: sd4-bus-width8 {
>  			samsung,pins = "gpk1-3", "gpk1-4", "gpk1-5", "gpk1-6";
> -			samsung,pin-function = <3>;
> +			samsung,pin-function = <4>;
>  			samsung,pin-pud = <4>;
>  			samsung,pin-drv = <3>;
>  		};

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
