From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: Add secure-firmware boot support for OrigenQaud board
Date: Mon, 12 Aug 2013 10:46:30 +0530
Message-ID: <CAHbNUh0Bzk7+MnQaCtEaL2_K3PQgTsueAJY84Y0T4jiFL_E-KA@mail.gmail.com>
References: <1374560579-25084-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:46869 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755009Ab3HLFQc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 01:16:32 -0400
Received: by mail-oa0-f49.google.com with SMTP id n10so9049975oag.22
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Aug 2013 22:16:32 -0700 (PDT)
In-Reply-To: <1374560579-25084-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>

On 23 July 2013 11:52, Tushar Behera <tushar.behera@linaro.org> wrote:
> OrigenQuad board boots with secure firmware support. Enable support for
> reading smc commands.
>
> The binding has been updated as per the documentation provided in
> Documentation/devicetree/bindings/arm/samsung-boards.txt.
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4412-origen.dts |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
> index 7993641..8768b03 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -27,6 +27,11 @@
>                 bootargs ="console=ttySAC2,115200";
>         };
>
> +       firmware@0203F000 {
> +               compatible = "samsung,secure-firmware";
> +               reg = <0x0203F000 0x1000>;
> +       };
> +
>         mmc_reg: voltage-regulator {
>                 compatible = "regulator-fixed";
>                 regulator-name = "VMEM_VDD_2.8V";
> --
> 1.7.9.5
>

Any comments on this?


-- 
Tushar Behera
