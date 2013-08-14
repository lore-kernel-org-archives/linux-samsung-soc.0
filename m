From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH V2] ARM: dts: Add RTC DT node to Exynos5420 SoC
Date: Wed, 14 Aug 2013 10:35:57 +0530
Message-ID: <CAGm_ybih7CppG-Ronq=WK0WPK3rb0HxL3zF7aUA1Ub_0EmXDPQ@mail.gmail.com>
References: <1376308293-7766-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:59797 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751135Ab3HNFF6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 01:05:58 -0400
Received: by mail-wi0-f170.google.com with SMTP id hi8so3726005wib.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Aug 2013 22:05:57 -0700 (PDT)
In-Reply-To: <1376308293-7766-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, patches@linaro.org, linaro-kernel@lists.linaro.org

Hi Kukjin,

On Mon, Aug 12, 2013 at 5:21 PM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> Adds RTC DT node to Exynos5420 SoC.
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
> changes since v1:
>         - made DT node status as "okay" in the dtsi file itself.
> ---
>  arch/arm/boot/dts/exynos5.dtsi    |    2 +-
>  arch/arm/boot/dts/exynos5250.dtsi |    3 ++-
>  arch/arm/boot/dts/exynos5420.dtsi |    7 +++++++
>  3 files changed, 10 insertions(+), 2 deletions(-)
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
> index 88589b7..c82137b 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -178,9 +178,10 @@
>                 samsung,power-domain = <&pd_mfc>;
>         };
>
> -       rtc {
> +       rtc@101E0000 {
>                 clocks = <&clock 337>;
>                 clock-names = "rtc";
> +               status = "okay";
>         };
>
>         tmu@10060000 {
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 9e90d1e..8f1bb08 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -145,4 +145,11 @@
>                 clocks = <&clock 260>, <&clock 131>;
>                 clock-names = "uart", "clk_uart_baud0";
>         };
> +
> +       rtc@101E0000 {
> +               clocks = <&clock 317>;
> +               clock-names = "rtc";
> +               status = "okay";
> +       };
> +
>  };

Can you apply this patch.


> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
