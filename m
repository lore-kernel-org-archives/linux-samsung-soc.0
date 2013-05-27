From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: dts: Remove combiner IRQ node from exynos4x12.dtsi
Date: Mon, 27 May 2013 17:32:51 +0530
Message-ID: <CAK9yfHxHa=HD6GvZrK2HqW6VsMJUBoUPcbez5XkNU8bEzoMFXg@mail.gmail.com>
References: <1366710888-11059-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:40463 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932065Ab3E0MCv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 May 2013 08:02:51 -0400
Received: by mail-oa0-f53.google.com with SMTP id g12so8743866oah.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 May 2013 05:02:51 -0700 (PDT)
In-Reply-To: <1366710888-11059-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Ping Kukjin...

On 23 April 2013 15:24, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> These nodes have separately been added to 4212 and 4412 dtsi
> files by commit 30269ddff1 ("ARM: exynos: add missing properties
> for combiner IRQs"). The existing node also contained a few
> incorrect entries.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> Patch based on linux-next tree (20130423)
> ---
>  arch/arm/boot/dts/exynos4x12.dtsi |    8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
> index ede3f9b..675c221 100644
> --- a/arch/arm/boot/dts/exynos4x12.dtsi
> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> @@ -28,14 +28,6 @@
>                 pinctrl3 = &pinctrl_3;
>         };
>
> -       combiner:interrupt-controller@10440000 {
> -               interrupts = <0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
> -                            <0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
> -                            <0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
> -                            <0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
> -                            <0 16 0>, <0 17 0>, <0 18 0>, <0 19 0>;
> -       };
> -
>         clock: clock-controller@0x10030000 {
>                 compatible = "samsung,exynos4412-clock";
>                 reg = <0x10030000 0x20000>;
> --
> 1.7.9.5
>



-- 
With warm regards,
Sachin
