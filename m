From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/3] ARM: exynos5420: dt: add clock entries to watchdog node
Date: Wed, 24 Jul 2013 15:18:26 +0530
Message-ID: <CAK9yfHwFZunKudPLQsukLt0w4SNSovTWYzy8jRD+u040Pk48dw@mail.gmail.com>
References: <1374658699-3961-1-git-send-email-l.krishna@samsung.com>
	<1374658699-3961-3-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:58308 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751539Ab3GXJs1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 05:48:27 -0400
Received: by mail-oa0-f42.google.com with SMTP id j6so435895oag.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jul 2013 02:48:26 -0700 (PDT)
In-Reply-To: <1374658699-3961-3-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org, jg1.han@samsung.com, t.figa@samsung.com

Hi Leela,

On 24 July 2013 15:08, Leela Krishna Amudala <l.krishna@samsung.com> wrote:
> This patch adds clock entries to watchdog node for exynos5420
> as per the common clock framework of exynos5420
>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 8c54c4b..e1d2d20 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -145,4 +145,10 @@
>                 clocks = <&clock 260>, <&clock 131>;
>                 clock-names = "uart", "clk_uart_baud0";
>         };
> +
> +       watchdog {
> +               clocks = <&clock 316>;
> +               clock-names = "watchdog";
> +               status = "okay";

Generally you do "okay" in specific board dts files.

-- 
With warm regards,
Sachin
