From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: Exynos5420: add clock entries to gsc power domain
Date: Tue, 15 Oct 2013 20:49:38 +0200
Message-ID: <3629005.VyZGZ4FEyV@flatron>
References: <1381836054-6590-1-git-send-email-l.krishna@samsung.com> <1381836054-6590-2-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:42088 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933521Ab3JOStm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 14:49:42 -0400
In-Reply-To: <1381836054-6590-2-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree@vger.kernel.org, khw0178.kim@samsung.com, prathyush.k@samsung.com, cpgs@samsung.com

Hi Leela,

On Tuesday 15 of October 2013 16:50:53 Leela Krishna Amudala wrote:
> Add clock nodes for oscillator clock, input clocks and parents of input
> clocks to gsc power domain so that we can set/restore the input
> clocks while powering on and powering off a domain.
> 
> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> b/arch/arm/boot/dts/exynos5420.dtsi index 09aa06c..7f0296c 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -116,6 +116,9 @@
>  	gsc_pd: power-domain@10044000 {
>  		compatible = "samsung,exynos4210-pd";
>  		reg = <0x10044000 0x20>;
> +		clocks = <&clock 1>, <&clock 1032>, <&clock 1033>,
> +			 <&clock 1034>, <&clock 1035>;
> +		clock-names = "oscclk", "pclk0", "clk0", "pclk1", "clk1";

This does not seem right. Do you have any actual code that uses this?

Best regards,
Tomasz
