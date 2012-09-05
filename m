From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 2/5] ARM: Exynos4: dts: Specify address and size cells
 for i2c controllers
Date: Wed, 5 Sep 2012 09:28:29 +0530
Message-ID: <CAJuYYwSDcVTi=4dmgQ_FrN7hiWxoPiEy4_dUFRe9JYrcBx9BgA@mail.gmail.com>
References: <1346748609-11115-1-git-send-email-t.figa@samsung.com>
	<1346748609-11115-3-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:62851 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751768Ab2IED6a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Sep 2012 23:58:30 -0400
Received: by lbbgj3 with SMTP id gj3so85679lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Sep 2012 20:58:29 -0700 (PDT)
In-Reply-To: <1346748609-11115-3-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, jy0922.shim@samsung.com, kgene.kim@samsung.com

On 4 September 2012 14:20, Tomasz Figa <t.figa@samsung.com> wrote:
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Acked-by: Thomas Abraham <thomas.abraham@linaro.org>

>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 9b71b61..718e3d2 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -122,6 +122,8 @@
>         };
>
>         i2c@13860000 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
>                 compatible = "samsung,s3c2440-i2c";
>                 reg = <0x13860000 0x100>;
>                 interrupts = <0 58 0>;
> @@ -129,6 +131,8 @@
>         };
>
>         i2c@13870000 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
>                 compatible = "samsung,s3c2440-i2c";
>                 reg = <0x13870000 0x100>;
>                 interrupts = <0 59 0>;
> @@ -136,6 +140,8 @@
>         };
>
>         i2c@13880000 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
>                 compatible = "samsung,s3c2440-i2c";
>                 reg = <0x13880000 0x100>;
>                 interrupts = <0 60 0>;
> @@ -143,6 +149,8 @@
>         };
>
>         i2c@13890000 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
>                 compatible = "samsung,s3c2440-i2c";
>                 reg = <0x13890000 0x100>;
>                 interrupts = <0 61 0>;
> @@ -150,6 +158,8 @@
>         };
>
>         i2c@138A0000 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
>                 compatible = "samsung,s3c2440-i2c";
>                 reg = <0x138A0000 0x100>;
>                 interrupts = <0 62 0>;
> @@ -157,6 +167,8 @@
>         };
>
>         i2c@138B0000 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
>                 compatible = "samsung,s3c2440-i2c";
>                 reg = <0x138B0000 0x100>;
>                 interrupts = <0 63 0>;
> @@ -164,6 +176,8 @@
>         };
>
>         i2c@138C0000 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
>                 compatible = "samsung,s3c2440-i2c";
>                 reg = <0x138C0000 0x100>;
>                 interrupts = <0 64 0>;
> @@ -171,6 +185,8 @@
>         };
>
>         i2c@138D0000 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
>                 compatible = "samsung,s3c2440-i2c";
>                 reg = <0x138D0000 0x100>;
>                 interrupts = <0 65 0>;
> --
> 1.7.12
>
