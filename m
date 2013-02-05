From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH v3 2/5] ARM: dts: Adds lcd pinctrl node entries for
 SAMSUNG EXYNOS4412 SoC
Date: Tue, 5 Feb 2013 11:34:03 +0530
Message-ID: <CAGm_ybiX7_LwXePBjLFRJK8=ZSZVbbDe9KY0AA1jat3+S+jEHg@mail.gmail.com>
References: <1359718376-21947-1-git-send-email-vikas.sajjan@linaro.org>
	<1359718376-21947-3-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:42188 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751070Ab3BEGEF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 01:04:05 -0500
Received: by mail-wg0-f43.google.com with SMTP id e12so5221812wge.34
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Feb 2013 22:04:03 -0800 (PST)
In-Reply-To: <1359718376-21947-3-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org

any more comments for the below patch?

On Fri, Feb 1, 2013 at 5:02 PM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> From: Sachin Kamat <sachin.kamat@linaro.org>
>
> This patch adds the lcd panel related picntrl nodes for Exynos4412 SoC
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
> index 8e6115a..332fc33 100644
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
