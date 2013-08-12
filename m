From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: dts: Add RTC DT node to Exynos5420 SoC
Date: Mon, 12 Aug 2013 13:34:03 +0530
Message-ID: <CAK9yfHxfGro5Z7Fyb1gBTEnd9smHopxEC4LEevei2RZo+2Nyxw@mail.gmail.com>
References: <1376293046-28430-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:50849 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752716Ab3HLIEE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 04:04:04 -0400
Received: by mail-ob0-f170.google.com with SMTP id eh20so8813939obb.29
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2013 01:04:03 -0700 (PDT)
In-Reply-To: <1376293046-28430-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Hi Vikas,

On 12 August 2013 13:07, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> Adds RTC DT node to Exynos5420 SoC.
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5.dtsi    |    2 +-
>  arch/arm/boot/dts/exynos5250.dtsi |    2 +-
>  arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
>  3 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
> index f65e124..4a8e223 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -95,7 +95,7 @@
>                 interrupts = <0 54 0>;
>         };
>
> -       rtc {
> +       rtc@101E0000 {
>                 compatible = "samsung,s3c6410-rtc";
>                 reg = <0x101E0000 0x100>;
>                 interrupts = <0 43 0>, <0 44 0>;
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 88589b7..f426ce6 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -178,7 +178,7 @@
>                 samsung,power-domain = <&pd_mfc>;
>         };
>
> -       rtc {
> +       rtc@101E0000 {
>                 clocks = <&clock 337>;
>                 clock-names = "rtc";
>         };

Since with this binding the h/w is depicted completely (for
functioning), IMO you should change the status to "okay" here.

> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 9e90d1e..b48d62c 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -145,4 +145,10 @@
>                 clocks = <&clock 260>, <&clock 131>;
>                 clock-names = "uart", "clk_uart_baud0";
>         };
> +
> +       rtc@101E0000 {
> +               clocks = <&clock 317>;
> +               clock-names = "rtc";
> +       };
> +

ditto.

-- 
With warm regards,
Sachin
