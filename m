From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4210-universal: add fimd polarization settings
Date: Fri, 21 Mar 2014 14:36:09 +0900
Message-ID: <CAAQKjZNsdM_p_bj3VTHGBHQWCwmLv1dj=dXKKBMwBHZkJMBRNQ@mail.gmail.com>
References: <CAAQKjZOh-qFEn3ex7YwCRDwOjpV=s-8JGj68Yx7qOpS+oy2-ww@mail.gmail.com>
	<1395322010-1248-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:62175 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752192AbaCUFgL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Mar 2014 01:36:11 -0400
Received: by mail-wg0-f48.google.com with SMTP id l18so1286730wgh.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Mar 2014 22:36:09 -0700 (PDT)
In-Reply-To: <1395322010-1248-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Denis Carikli <denis@eukrea.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Andrzej,


2014-03-20 22:26 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
> The patch adds polarization flags to fimd node.
> It fixes parallel display support.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
> Hi Inki,
>
> Since polarization patches were not merged, polarization
> settings should be provided to fimd via properties.
> This patch fixes it.
>

Just let me integrate it to old one, 'ARM: dts: exynos4210-universal:
add exynos/fimd node'.

Thanks,
Inki Dae

> Regards
> Andrzej
> ---
>  arch/arm/boot/dts/exynos4210-universal_c210.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
> index 21ca0b978..477208d 100644
> --- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
> +++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
> @@ -351,6 +351,8 @@
>                 pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
>                 pinctrl-names = "default";
>                 status = "okay";
> +               samsung,invert-vden;
> +               samsung,invert-vclk;
>                 display-timings {
>                         timing {
>                                 clock-frequency = <23492370>;
> --
> 1.8.3.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
