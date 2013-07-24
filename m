From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 3/3] ARM: dts: exynos: add PMU registers addresses and
 mask bit to watchdog node
Date: Wed, 24 Jul 2013 15:16:32 +0530
Message-ID: <CAK9yfHyUjWvAt0Ron+shk0b5DuTkKO5dyPcBxF6zJn93b+OTHQ@mail.gmail.com>
References: <1374658699-3961-1-git-send-email-l.krishna@samsung.com>
	<1374658699-3961-4-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:55294 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751251Ab3GXJqc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 05:46:32 -0400
Received: by mail-ob0-f181.google.com with SMTP id 16so12262344obc.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jul 2013 02:46:32 -0700 (PDT)
In-Reply-To: <1374658699-3961-4-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org, jg1.han@samsung.com, t.figa@samsung.com

Hi Leela,

On 24 July 2013 15:08, Leela Krishna Amudala <l.krishna@samsung.com> wrote:
> This patch adds support for specifying the pmu registers and masking bit
> for watchdog to enable/disable and mask/unmask the watchdog reset request.
>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5.dtsi    |    2 +-
>  arch/arm/boot/dts/exynos5420.dtsi |    1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
> index f65e124..4d63b74 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -104,7 +104,7 @@
>
>         watchdog {
>                 compatible = "samsung,s3c2410-wdt";
> -               reg = <0x101D0000 0x100>;
> +               reg = <0x101D0000 0x100>, <0x10040408 0x4>, <0x1004040c 0x4>;
>                 interrupts = <0 42 0>;
>                 status = "disabled";
>         };
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index e1d2d20..ea5b49f 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -150,5 +150,6 @@
>                 clocks = <&clock 316>;
>                 clock-names = "watchdog";
>                 status = "okay";
> +               reset-mask-bit = <0>;

Why not add this hunk to the previous patch itself?

-- 
With warm regards,
Sachin
