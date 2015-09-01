From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4412-odroid-*: add workaround for
 CPUfreq/reboot issue
Date: Tue, 1 Sep 2015 22:57:37 +0900
Message-ID: <CAJKOXPcgG+vABGk6Kgg-ct8LWGkZwQFmsaECZ-K90dN48N8XQw@mail.gmail.com>
References: <1441112929-6751-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:35304 "EHLO
	mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752462AbbIAN5i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Sep 2015 09:57:38 -0400
Received: by qkcj187 with SMTP id j187so40297420qkc.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Sep 2015 06:57:37 -0700 (PDT)
In-Reply-To: <1441112929-6751-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

2015-09-01 22:08 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> Exynos4412-based Odroid boards (X2, U3, U3+) don't reset PMIC
> configuration during hardware reset. This causes serious issues with
> CPUfreq, when ARM voltage is set below 1.0V. When one resets the board
> when CPUfreq selected one of lower Exynos 4412 operating points (for
> example: 200MHz and 0.9V), the bootloader crashes and it is not possible

s/crashes/hangs/ ? I did not observe a crash but a silent hang.

> to restart the board without turning power off.
>
> This patch provides a workaround for this issue by increasing the start
> of valid range for vdd_arm regulator from 1.0V. After such change,
> CPUfreq can still use lower operating points, but the voltage won't be
> decreased below 1.0V and as a result it will be possible to reset board
> at any time.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Do you plan to send the same fix for Trats2 board? Everything above
applies there as well plus suspend is affected. The board cannot
properly resume.

> ---
> Hello,
>
> This issue was there from the beggining, but I was not able to reproduce
> it. It has been already reported by Tobias in early Feb 2015
> (http://www.spinics.net/lists/linux-samsung-soc/msg42294.html).
> Recently, after CPUfreq changes (conversion to generic cpufreq dt and
> enabling cpufreq in exynos_defconfig) it was much easier to observe this
> issue.
>
> This workaround lets one still use CPUfreq and avoid unexpect board
> crashes during reboot (both 'standard' and emergency).

Work-around looks nice and clean. It still allows to use cpufreq and
reduce the energy consumption. The patch should go along with
cpufreq-dt support for Exynos4412 which hopefully would be for v4.3.
If cpufreq-dt for Exynos4412 won't get to v4.3 we can figure out
proper solution, not a work-around.

Anyway for the time being:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Thanks Marek,
BR

>
> Best regards
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> index db52841..fca8233 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -370,7 +370,7 @@
>
>                         buck2_reg: BUCK2 {
>                                 regulator-name = "vdd_arm";
> -                               regulator-min-microvolt = <900000>;
> +                               regulator-min-microvolt = <1000000>;
>                                 regulator-max-microvolt = <1350000>;
>                                 regulator-always-on;
>                                 regulator-boot-on;
> --
> 1.9.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
