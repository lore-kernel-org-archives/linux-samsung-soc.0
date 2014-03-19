From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 2/2] ARM: dts: Keep some essential LDOs enabled for Arndale-Octa
Date: Wed, 19 Mar 2014 14:09:25 +0530
Message-ID: <CAHbNUh3C4+ahD=FiKhQeg-wu6ob-gomCpmUXCyQxN==cC3Wswg@mail.gmail.com>
References: <1394006947-26126-1-git-send-email-tushar.behera@linaro.org>
	<1394006947-26126-2-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:51755 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755680AbaCSIj0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Mar 2014 04:39:26 -0400
Received: by mail-oa0-f50.google.com with SMTP id i7so8113946oag.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2014 01:39:25 -0700 (PDT)
In-Reply-To: <1394006947-26126-2-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>

On 5 March 2014 13:39, Tushar Behera <tushar.behera@linaro.org> wrote:
> LDO3 and LDO23 need to be enabled in order for soft-reset to work.
>
> Additionally LDO9 needs to be enabled for USB operations.
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5420-arndale-octa.dts |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> index 810ec73..df975b5 100644
> --- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> +++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> @@ -113,6 +113,7 @@
>                                         regulator-name = "PVDD_APIO_MMCON_1V8";
>                                         regulator-min-microvolt = <1800000>;
>                                         regulator-max-microvolt = <1800000>;
> +                                       regulator-always-on;
>                                 };
>
>                                 ldo4_reg: LDO4 {
> @@ -150,6 +151,7 @@
>                                         regulator-name = "PVDD_USB_3V3";
>                                         regulator-min-microvolt = <3000000>;
>                                         regulator-max-microvolt = <3000000>;
> +                                       regulator-always-on;
>                                 };
>
>                                 ldo10_reg: LDO10 {
> @@ -218,6 +220,7 @@
>                                         regulator-name = "PVDD_MIFS_1V1";
>                                         regulator-min-microvolt = <1200000>;
>                                         regulator-max-microvolt = <1200000>;
> +                                       regulator-always-on;
>                                 };
>
>                                 ldo24_reg: LDO24 {
> --
> 1.7.9.5
>

Kukjin,

Would you please apply this?

-- 
Tushar Behera
