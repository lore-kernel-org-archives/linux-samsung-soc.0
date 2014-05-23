From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: Add clock property for mfc_pd in 5420
Date: Fri, 23 May 2014 23:54:10 +0200
Message-ID: <537FC382.8060602@gmail.com>
References: <1400821692-22370-1-git-send-email-arun.kk@samsung.com> <1400821692-22370-4-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:43222 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750995AbaEWVyR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 17:54:17 -0400
In-Reply-To: <1400821692-22370-4-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: t.figa@samsung.com, kgene.kim@samsung.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, prathyush.k@samsung.com, abrestic@chromium.org, arunkk.samsung@gmail.com

On 23.05.2014 07:08, Arun Kumar K wrote:
> Adding the optional clock property for the mfc_pd for
> handling the re-parenting while pd on/off.
> 
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 5a85896..890bdac 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -260,6 +260,9 @@
>  	mfc_pd: power-domain@10044060 {
>  		compatible = "samsung,exynos4210-pd";
>  		reg = <0x10044060 0x20>;
> +		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MOUT_SW_ACLK333>,
> +			<&clock CLK_MOUT_USER_ACLK333>,;
> +		clock-names = "oscclk", "pclk0", "clk0";
>  	};
>  
>  	disp_pd: power-domain@100440C0 {
> 

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
