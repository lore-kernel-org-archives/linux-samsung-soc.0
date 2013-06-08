From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: dts: Update vdd_arm regulator
Date: Sat, 08 Jun 2013 13:52:04 +0200
Message-ID: <1975506.ECnduUFuut@flatron>
References: <1370516572-313-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f54.google.com ([209.85.214.54]:47552 "EHLO
	mail-bk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752367Ab3FHLwJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Jun 2013 07:52:09 -0400
Received: by mail-bk0-f54.google.com with SMTP id it16so658073bkc.27
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 Jun 2013 04:52:08 -0700 (PDT)
In-Reply-To: <1370516572-313-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, broonie@kernel.org, swarren@wwwdotorg.org, grant.likely@linaro.org, rob.herring@calxeda.com, l.majewski@samsung.com, s.nawrocki@samsung.com, devicetree-discuss@lists.ozlabs.org

Hi Tushar,

On Thursday 06 of June 2013 16:32:52 Tushar Behera wrote:
> Cpufreq driver for EXYNOS4210 is not a platform driver, hence it is not
> possible to provide the regulator supply name through DT bindings.
> Since the cpufreq driver requires the regulator to be named as
> 'vdd_arm', the related regulator name should be kept same.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4210-origen.dts |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts
> b/arch/arm/boot/dts/exynos4210-origen.dts index bcf8079..bd5f589 100644
> --- a/arch/arm/boot/dts/exynos4210-origen.dts
> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
> @@ -192,7 +192,7 @@
>  				};
> 
>  				buck1_reg: BUCK1 {
> -					regulator-name = "VDD_ARM_1.2V";
> +					regulator-name = "vdd_arm";

Yes, this is the hack I mentioned in my review of
[PATCH 0/2] Clock update for EXYNOS4210-CPUFREQ driver

Best regards,
Tomasz

>  					regulator-min-microvolt = 
<950000>;
>  					regulator-max-microvolt	= 
<1350000>;
>  					regulator-always-on;
