From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: exynos: TM2 - remove unused UART3 and set
 clocks directly on CMU
Date: Thu, 17 Nov 2016 01:51:49 +0900
Message-ID: <CAGTfZH2yNRG1uoszq1OBpZ8wHLbOpcQh1StAJ9vovFPH8=Poww@mail.gmail.com>
References: <CGME20161116130709eucas1p1fcf3fbb43f313d53bef47616a789dac4@eucas1p1.samsung.com>
 <1479301615-11240-1-git-send-email-m.szyprowski@samsung.com> <1479301615-11240-6-git-send-email-m.szyprowski@samsung.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:35016 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752278AbcKPQwK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 11:52:10 -0500
Received: by mail-qk0-f194.google.com with SMTP id n204so22101991qke.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2016 08:52:10 -0800 (PST)
In-Reply-To: <1479301615-11240-6-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Marek,

2016-11-16 22:06 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> UART3 device is not really needed for enabling audio block on TM2.
> Enabling it made it working by enabling some common parent clocks,
> what is now handled by improved exynos5433 clocks driver. Thus the UART3
> device node can be safetly disabled. The assigned-clocks entries are
> however still needed, so move them under the respective CMU node.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> index 506f8ab..5ab1028 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
> @@ -891,10 +891,9 @@
>         status = "okay";
>  };
>
> -&serial_3 {
> +&cmu_aud {
>         assigned-clocks = <&cmu_aud CLK_MOUT_AUD_PLL_USER>;
>         assigned-clock-parents = <&cmu_top CLK_FOUT_AUD_PLL>;
> -       status = "okay";
>  };


Looks good to me.

The UART3 of TM2 was used for bluetooth device. CLK_MOUT_AUD_PLL_USER
clock is the parent clock of CLK_SCLK_AUD_UART of uart3 for bluetooth.
So, in the legacy, we assigned the parent clock in the uart3
Device-tree node.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Best Regards,
Chanwoo Choi
