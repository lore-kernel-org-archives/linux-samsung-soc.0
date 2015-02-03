From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: dts: Fix CLK_MOUT_CAMn parent clocks assignment for
 Trats2
Date: Tue, 03 Feb 2015 13:14:24 +0900
Message-ID: <06fa01d03f67$e5044cb0$af0ce610$@kernel.org>
References: <1421430016-32248-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59452 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965100AbbBCEO0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 23:14:26 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJ600A16H418J80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Feb 2015 13:14:25 +0900 (KST)
In-reply-to: <1421430016-32248-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, kgene@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Sylwester Nawrocki wrote:
> 
> In order to get exact 24MHz clock frequency value for the camera
> sensor and avoid rounding errors the parent clock must be CLK_XUSBXTI,
> not CLK_MOUT_MPLL_USER_T.  Currently the sensor's master clock
> frequency is too high and the sensor doesn't work properly.
> 
> This fixes commit 0357a4438d531ef3cf529e80ffcd208eb8e35f55
> ("ARM: dts: Specify default clocks for Exynos4 camera devices").
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-trats2.dts |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
> index 29231b4..9ae62c2 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> @@ -721,8 +721,8 @@
>  		status = "okay";
>  		assigned-clocks = <&clock CLK_MOUT_CAM0>,
>  				  <&clock CLK_MOUT_CAM1>;
> -		assigned-clock-parents = <&clock CLK_MOUT_MPLL_USER_T>,
> -					 <&clock CLK_MOUT_MPLL_USER_T>;
> +		assigned-clock-parents = <&clock CLK_XUSBXTI>,
> +					 <&clock CLK_XUSBXTI>;
> 
>  		fimc_0: fimc@11800000 {
>  			status = "okay";
> --

Applied, thanks.

- Kukjin
