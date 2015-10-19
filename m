From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH 0/7] Switch to generic syscon regmap based drivers
Date: Mon, 19 Oct 2015 14:18:45 -0700
Message-ID: <CAAtXAHfjdNvJtXW6e4Wm4dba9vbzhpMGJvTBXxvmya08EvHenA@mail.gmail.com>
References: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:33580 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750876AbbJSVSq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 17:18:46 -0400
Received: by wijp11 with SMTP id p11so18752378wij.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2015 14:18:45 -0700 (PDT)
In-Reply-To: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene@kernel.org, k.kozlowski@samsung.com, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Sun, Oct 18, 2015 at 11:03 PM, Alim Akhtar <alim.akhtar@samsung.com> wrote:
> Alim Akhtar (7):
>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos3250 SoCs
>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos4
>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos5
>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos5410 SoC
>   ARM: exynos_defconfig: Normalize exynos defconfig
>   ARM: exynos_defconfig: Enable generic syscon-{reboot, poweroff}
>     drivers
>   ARM: EXYNOS: Remove code for restart and poweroff for exynos SoCs
>
>  arch/arm/boot/dts/exynos3250.dtsi |   14 ++++++++++++
>  arch/arm/boot/dts/exynos4.dtsi    |   14 ++++++++++++
>  arch/arm/boot/dts/exynos5.dtsi    |   14 ++++++++++++
>  arch/arm/boot/dts/exynos5410.dtsi |   14 ++++++++++++
>  arch/arm/configs/exynos_defconfig |   11 +++++-----
>  arch/arm/mach-exynos/pmu.c        |   43 -------------------------------------
>  6 files changed, 61 insertions(+), 49 deletions(-)
>
> --
> 1.7.10.4
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Feel free to add Acked-By: Moritz Fischer <moritz.fischer@ettus.com>
to the patches in your series

Moritz
