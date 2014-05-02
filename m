From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: dts: Add pwmX_out pinctrl nodes to Exynos5420
Date: Fri, 2 May 2014 08:44:43 -0700
Message-ID: <CAD=FV=V30qfsRfFZ7LXnF9VmMo5dGJx6FfOaKwGrLtS5_r7PGQ@mail.gmail.com>
References: <1399034937-24683-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:56097 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753704AbaEBPoo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 11:44:44 -0400
Received: by mail-oa0-f42.google.com with SMTP id j17so975623oag.29
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 May 2014 08:44:43 -0700 (PDT)
In-Reply-To: <1399034937-24683-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Arun Kumar <arunkk.samsung@gmail.com>

Arun,

On Fri, May 2, 2014 at 5:48 AM, Arun Kumar K <arun.kk@samsung.com> wrote:
> Adds the PWM nodes to 5420 pinctrl dtsi file.
>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi |   28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> index e62c8eb..ba686e4 100644
> --- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
> @@ -624,6 +624,34 @@
>                         samsung,pin-drv = <0>;
>                 };
>
> +               pwm0_out: pwm0-out {
> +                       samsung,pins = "gpb2-0";
> +                       samsung,pin-function = <2>;
> +                       samsung,pin-pud = <0>;
> +                       samsung,pin-drv = <0>;
> +               };
> +
> +               pwm1_out: pwm1-out {
> +                       samsung,pins = "gpb2-1";
> +                       samsung,pin-function = <2>;
> +                       samsung,pin-pud = <0>;
> +                       samsung,pin-drv = <0>;
> +               };
> +
> +               pwm2_out: pwm2-out {
> +                       samsung,pins = "gpb2-2";
> +                       samsung,pin-function = <2>;
> +                       samsung,pin-pud = <0>;
> +                       samsung,pin-drv = <0>;
> +               };
> +
> +               pwm3_out: pwm3-out {
> +                       samsung,pins = "gpb2-3";
> +                       samsung,pin-function = <2>;
> +                       samsung,pin-pud = <0>;
> +                       samsung,pin-drv = <0>;
> +               };
> +
>                 i2c7_hs_bus: i2c7-hs-bus {
>                         samsung,pins = "gpb2-2", "gpb2-3";
>                         samsung,pin-function = <3>;

Possibly pwm3-out belongs below this one (since the start pin is
"larger" than the start pin of i2c7-hs-bus).  Tomasz probably has a
definite opinion on this.

Otherwise, this looks great to me.  Perhaps you could send up the 5250 one, too?

Reviewed-by: Doug Anderson <dianders@chromium.org>
