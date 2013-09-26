From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: exynos4210-origen: Add fixed voltage
 regulator to simple bus
Date: Thu, 26 Sep 2013 10:32:01 +0530
Message-ID: <CAK9yfHy_3aun5D5FitGPdABjfo_pBhNvTq9vLL00bwhWDU97oA@mail.gmail.com>
References: <1374834657-29088-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:60387 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751142Ab3IZFCC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Sep 2013 01:02:02 -0400
Received: by mail-ob0-f177.google.com with SMTP id wp18so1294015obc.22
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Sep 2013 22:02:01 -0700 (PDT)
In-Reply-To: <1374834657-29088-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Patch Tracking <patches@linaro.org>, Kukjin Kim <kgene@kernel.org>

Hi Kukjin,

On 26 July 2013 16:00, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> This has been done for Arndale board vide commit aa3edb65
> ("ARM: dts: Put Arndale fixed voltage regulators on a simple-bus").
> Replicate here for consistency and correctness.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4210-origen.dts |   20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
> index 5537af8..ae2653e 100644
> --- a/arch/arm/boot/dts/exynos4210-origen.dts
> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
> @@ -32,13 +32,19 @@
>                 bootargs ="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";
>         };
>
> -       mmc_reg: voltage-regulator {
> -               compatible = "regulator-fixed";
> -               regulator-name = "VMEM_VDD_2.8V";
> -               regulator-min-microvolt = <2800000>;
> -               regulator-max-microvolt = <2800000>;
> -               gpio = <&gpx1 1 0>;
> -               enable-active-high;
> +       regulators {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               mmc_reg: voltage-regulator {
> +                       compatible = "regulator-fixed";
> +                       regulator-name = "VMEM_VDD_2.8V";
> +                       regulator-min-microvolt = <2800000>;
> +                       regulator-max-microvolt = <2800000>;
> +                       gpio = <&gpx1 1 0>;
> +                       enable-active-high;
> +               };
>         };
>
>         tmu@100C0000 {
> --
> 1.7.9.5
>

These 2 patches pending since long time. Can you please check.

-- 
With warm regards,
Sachin
