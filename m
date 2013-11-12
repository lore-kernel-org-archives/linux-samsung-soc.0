From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v3 1/2] ARM: dts: Fix sysreg node name in exynos4.dtsi
Date: Tue, 12 Nov 2013 19:40:54 +0900
Message-ID: <086301cedf93$a9f6bf70$fde43e50$@org>
References: <1383632302-23535-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44686 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751807Ab3KLKk4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 05:40:56 -0500
In-reply-to: <1383632302-23535-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, t.figa@samsung.com

Sachin Kamat wrote:
> 
> Fix the name as per DT node naming convention.
> - rename the node to syscon which is a more generic name.
> - append the register value to the node name.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> ---
> Changes since v2:
> None.
> ---
>  arch/arm/boot/dts/exynos4.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi
> b/arch/arm/boot/dts/exynos4.dtsi
> index cb0f70cc552b..b7378154c0a1 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -99,7 +99,7 @@
>  		reg = <0x10440000 0x1000>;
>  	};
> 
> -	sys_reg: sysreg {
> +	sys_reg: syscon@10010000 {
>  		compatible = "samsung,exynos4-sysreg", "syscon";
>  		reg = <0x10010000 0x400>;
>  	};
> --
> 1.7.9.5

Looks good to me, thanks for this patch and reviews from Sylwester and
Tomasz.

Applied.
- Kukjin
