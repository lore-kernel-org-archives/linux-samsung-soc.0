From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/5] ARM: dts: Enable RTC node on Origen boards
Date: Mon, 26 May 2014 08:59:00 +0530
Message-ID: <CAK9yfHzDkYtwdb-ZcfsFTKfborzkuM22ndFrxT4VmqcG0-fGyg@mail.gmail.com>
References: <1400825338-1272-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:60874 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083AbaEZD3B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 May 2014 23:29:01 -0400
Received: by mail-ob0-f173.google.com with SMTP id wm4so7572893obc.32
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2014 20:29:00 -0700 (PDT)
In-Reply-To: <1400825338-1272-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>

On 23 May 2014 11:38, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Enabled RTC node on Origen 4210 and 4412 boards.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4210-origen.dts |    4 ++++
>  arch/arm/boot/dts/exynos4412-origen.dts |    4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
> index 72fb11f7ea21..95efb1189cf0 100644
> --- a/arch/arm/boot/dts/exynos4210-origen.dts
> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
> @@ -48,6 +48,10 @@
>                 };
>         };
>
> +       rtc@10070000 {
> +               status = "okay";
> +       };
> +
>         tmu@100C0000 {
>                 status = "okay";
>         };
> diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
> index e2c0dcab4d81..934fe7ecca7e 100644
> --- a/arch/arm/boot/dts/exynos4412-origen.dts
> +++ b/arch/arm/boot/dts/exynos4412-origen.dts
> @@ -48,6 +48,10 @@
>                 };
>         };
>
> +       rtc@10070000 {
> +               status = "okay";
> +       };
> +
>         pinctrl@11000000 {
>                 keypad_rows: keypad-rows {
>                         samsung,pins = "gpx2-0", "gpx2-1", "gpx2-2";
> --
> 1.7.9.5
>

Kukjin,

The patches in this series are really simple and do not want them to
wait for another
cycle. Please review and send them with your next pull request for
3.16. Also please
look at the 2 patches related to secondary cpu boot sent by Tushar.

-- 
With warm regards,
Sachin
