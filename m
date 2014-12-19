From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: exynos3250: remove unecessary property of
 gpio-keys node
Date: Fri, 19 Dec 2014 17:41:24 +0900
Message-ID: <5493E4B4.9080403@samsung.com>
References: <1418978370-22542-1-git-send-email-beomho.seo@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51466 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751802AbaLSIl3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Dec 2014 03:41:29 -0500
In-reply-to: <1418978370-22542-1-git-send-email-beomho.seo@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Beomho Seo <beomho.seo@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com, yj44.cho@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, kyungmin.park@samsung.com

Hi Beomho,

On 12/19/2014 05:39 PM, Beomho Seo wrote:
> This patch remove unecessary property of gpio-keys node.
> gpio-keys driver do not uses interrupts and interrupt-parent.
> 
> Cc: Youngjun Cho <yj44.cho@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Beomho Seo <beomho.seo@samsung.com>

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo CHoi

> ---
>  arch/arm/boot/dts/exynos3250-monk.dts   |    2 --
>  arch/arm/boot/dts/exynos3250-rinato.dts |    2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
> index 24822aa..2129ab98 100644
> --- a/arch/arm/boot/dts/exynos3250-monk.dts
> +++ b/arch/arm/boot/dts/exynos3250-monk.dts
> @@ -37,8 +37,6 @@
>  		compatible = "gpio-keys";
>  
>  		power_key {
> -			interrupt-parent = <&gpx2>;
> -			interrupts = <7 0>;
>  			gpios = <&gpx2 7 1>;
>  			linux,code = <KEY_POWER>;
>  			label = "power key";
> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
> index 80aa8b4..c186ac6 100644
> --- a/arch/arm/boot/dts/exynos3250-rinato.dts
> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
> @@ -37,8 +37,6 @@
>  		compatible = "gpio-keys";
>  
>  		power_key {
> -			interrupt-parent = <&gpx2>;
> -			interrupts = <7 0>;
>  			gpios = <&gpx2 7 1>;
>  			linux,code = <KEY_POWER>;
>  			label = "power key";
> 
