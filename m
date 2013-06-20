From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH 1/5] ARM: dts: exynos5420: add i2c device nodes
Date: Thu, 20 Jun 2013 11:43:42 +0530
Message-ID: <CANuQgHGqkoB0U=7dm5+Xwo5j=xMt6ycSuSTMC55z1EMB5OwtfQ@mail.gmail.com>
References: <1371706911-27016-1-git-send-email-rahul.sharma@samsung.com>
	<1371706911-27016-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:45181 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751790Ab3FTGNn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 02:13:43 -0400
Received: by mail-ob0-f169.google.com with SMTP id up14so6786552obb.28
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2013 23:13:42 -0700 (PDT)
In-Reply-To: <1371706911-27016-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <rob.herring@calxeda.com>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, Grant Likely <grant.likely@linaro.org>, joshi@samsung.com, r.sh.open@gmail.com, Andrew Bresticker <abrestic@chromium.org>

On 20 June 2013 11:11, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> From: Andrew Bresticker <abrestic@chromium.org>
>
> This adds device-tree nodes for the i2c busses on Exynos
> 5420 platforms.
>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |   56 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 8c54c4b..b0ec047 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -24,6 +24,10 @@
>                 pinctrl2 = &pinctrl_2;
>                 pinctrl3 = &pinctrl_3;
>                 pinctrl4 = &pinctrl_4;
> +               i2c0 = &i2c_0;
> +               i2c1 = &i2c_1;
> +               i2c2 = &i2c_2;
> +               i2c3 = &i2c_3;
>         };
>
>         cpus {
> @@ -145,4 +149,56 @@
>                 clocks = <&clock 260>, <&clock 131>;
>                 clock-names = "uart", "clk_uart_baud0";
>         };
> +
> +       i2c_0: i2c@12C60000 {
> +               compatible = "samsung,s3c2440-i2c";
> +               reg = <0x12C60000 0x100>;
> +               interrupts = <0 56 0>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&i2c0_bus>;
> +               clocks = <&clock 261>;
> +               clock-names = "i2c";
> +               status = "disabled";
> +       };
Please move the common properties of exynos5250 and exynos5420 to exynos5.dtsi.
> +
> +       i2c_1: i2c@12C70000 {
> +               compatible = "samsung,s3c2440-i2c";
> +               reg = <0x12C70000 0x100>;
> +               interrupts = <0 57 0>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&i2c1_bus>;
> +               clocks = <&clock 262>;
> +               clock-names = "i2c";
> +               status = "disabled";
> +       };
> +
> +       i2c_2: i2c@12C80000 {
> +               compatible = "samsung,s3c2440-i2c";
> +               reg = <0x12C80000 0x100>;
> +               interrupts = <0 58 0>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&i2c2_bus>;
> +               clocks = <&clock 263>;
> +               clock-names = "i2c";
> +               status = "disabled";
> +       };
> +
> +       i2c_3: i2c@12C90000 {
> +               compatible = "samsung,s3c2440-i2c";
> +               reg = <0x12C90000 0x100>;
> +               interrupts = <0 59 0>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&i2c3_bus>;
> +               clocks = <&clock 264>;
> +               clock-names = "i2c";
> +               status = "disabled";
> +       };
>  };
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--
with warm regards,
Chander Kashyap
