From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V3 1/2] ARM: dts: Add nodes for i2s controllers for
 Samsung Exynos5 platforms
Date: Fri, 23 Nov 2012 16:44:15 +0530
Message-ID: <CAAgF-Be=m2ZrupCWV-iTGCT=AkMzxZOQGhJ-2fF3L_YeqS_FaQ@mail.gmail.com>
References: <1352177084-16339-1-git-send-email-padma.v@samsung.com>
	<1352177084-16339-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:65430 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755948Ab2KWLOR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 06:14:17 -0500
Received: by mail-la0-f46.google.com with SMTP id p5so4245393lag.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Nov 2012 03:14:16 -0800 (PST)
In-Reply-To: <1352177084-16339-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

cc'ing Mark Brown.

On Tue, Nov 6, 2012 at 10:14 AM, Padmavathi Venna <padma.v@samsung.com> wrote:
> Add device nodes for the three instances of i2s controllers in Exynos5
> platforms. Enable instance i2s 0 for exynos5250 board and disable all
> other i2s instances.
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |   14 ++++++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi         |   29 +++++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> index 405009c..3b2a3c9 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -193,4 +193,18 @@
>         hdmi {
>                 hpd-gpio = <&gpx3 7 0xf 1 3>;
>         };
> +
> +       i2s_0: i2s@03830000 {
> +               gpios = <&gpz 0 2 0 0>, <&gpz 1 2 0 0>, <&gpz 2 2 0 0>,
> +                       <&gpz 3 2 0 0>, <&gpz 4 2 0 0>, <&gpz 5 2 0 0>,
> +                       <&gpz 6 2 0 0>;
> +       };
> +
> +       i2s_1: i2s@12D60000 {
> +               status = "disabled";
> +       };
> +
> +       i2s_2: i2s@12D70000 {
> +               status = "disabled";
> +       };
>  };
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index cf6a02d..a168e98 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -31,6 +31,9 @@
>                 gsc1 = &gsc_1;
>                 gsc2 = &gsc_2;
>                 gsc3 = &gsc_3;
> +               i2s0 = &i2s_0;
> +               i2s1 = &i2s_1;
> +               i2s2 = &i2s_2;
>         };
>
>         gic:interrupt-controller@10481000 {
> @@ -238,6 +241,32 @@
>                 #size-cells = <0>;
>         };
>
> +       i2s_0: i2s@03830000 {
> +               compatible = "samsung,samsung-i2s";
> +               reg = <0x03830000 0x100>;
> +               tx-dma-channel-secondary = <&pdma0 8>; /* preliminary */
> +               tx-dma-channel = <&pdma0 10>; /* preliminary */
> +               rx-dma-channel = <&pdma0 9>; /* preliminary */
> +               samsung,supports-6ch;
> +               samsung,supports-rstclr;
> +               samsung,supports-secdai;
> +               samsung,idma-addr = <0x03000000>;
> +       };
> +
> +       i2s_1: i2s@12D60000 {
> +               compatible = "samsung,samsung-i2s";
> +               reg = <0x12D60000 0x100>;
> +               tx-dma-channel = <&pdma1 12>; /* preliminary */
> +               rx-dma-channel = <&pdma1 11>; /* preliminary */
> +       };
> +
> +       i2s_2: i2s@12D70000 {
> +               compatible = "samsung,samsung-i2s";
> +               reg = <0x12D70000 0x100>;
> +               tx-dma-channel = <&pdma0 12>; /* preliminary */
> +               rx-dma-channel = <&pdma0 11>; /* preliminary */
> +       };
> +
>         amba {
>                 #address-cells = <1>;
>                 #size-cells = <1>;
> --
> 1.7.4.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
