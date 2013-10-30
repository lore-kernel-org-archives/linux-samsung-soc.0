From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Fix sysreg node name in exynos4.dtsi
Date: Wed, 30 Oct 2013 15:44:38 +0100
Message-ID: <1533785.9eqjzOAEYK@amdc1227>
References: <1383127554-13854-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:42910 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754297Ab3J3Oom (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Oct 2013 10:44:42 -0400
In-reply-to: <1383127554-13854-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com

Hi Sachin,

On Wednesday 30 of October 2013 15:35:53 Sachin Kamat wrote:
> Fix the name as per DT node naming convention.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index e262946..68479c3 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -99,7 +99,7 @@
>  		reg = <0x10440000 0x1000>;
>  	};
>  
> -	sys_reg: sysreg {
> +	sys_reg: sysreg@10010000 {

While at changing node name, could you rename it to syscon? Nodes
should have more generic names, while sysreg is an Exynos-specific term.

Best regards.
Tomasz
