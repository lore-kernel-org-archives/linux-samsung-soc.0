From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v9 2/4] ARM: dts: Add lcd pinctrl node entries for
 EXYNOS4412 SoC
Date: Mon, 25 Mar 2013 16:30:03 +0530
Message-ID: <CAJuYYwT3SiKxg4CX1Gimmr+OT-oV=2UZ07xSbvoJ5kgdNEy0fQ@mail.gmail.com>
References: <1363960608-23825-1-git-send-email-vikas.sajjan@linaro.org>
	<1363960608-23825-3-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:50819 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756116Ab3CYLAE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Mar 2013 07:00:04 -0400
Received: by mail-ie0-f180.google.com with SMTP id a11so7047490iee.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2013 04:00:03 -0700 (PDT)
In-Reply-To: <1363960608-23825-3-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, linaro-kernel@lists.linaro.org

On 22 March 2013 19:26, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> From: Sachin Kamat <sachin.kamat@linaro.org>
>
> Adds the lcd panel related picntrl nodes for Exynos4412 SoC
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> index 099cec7..a59d69c 100644
> --- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> @@ -354,6 +354,20 @@
>                         samsung,pin-drv = <0>;
>                 };
>
> +               lcd_sync: lcd-sync {
> +                       samsung,pins = "gpf0-0", "gpf0-1";
> +                       samsung,pin-function = <2>;
> +                       samsung,pin-pud = <0>;
> +                       samsung,pin-drv = <0>;
> +               };
> +
> +               lcd_en: lcd-en {
> +                       samsung,pins = "gpf0-3";
> +                       samsung,pin-function = <2>;
> +                       samsung,pin-pud = <0>;
> +                       samsung,pin-drv = <0>;
> +               };
> +

Is lcd_en a board specific configuration. If so, this has to be moved
into board specfic dts file. Same with lcd_sync.

Thanks,
Thomas.


>                 lcd_clk: lcd-clk {
>                         samsung,pins = "gpf0-0", "gpf0-1", "gpf0-2", "gpf0-3";
>                         samsung,pin-function = <2>;
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
