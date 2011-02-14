From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 0/11] ARM: EXYNOS4: Change ARCH name, ARCH_EXYNOS4 from ARCH_S5PV310
Date: Mon, 14 Feb 2011 20:16:06 +0900
Message-ID: <AANLkTim49dpC_r4BcK7tqo9wmu8W=qMDZE5szDUja6Wo@mail.gmail.com>
References: <1297671787-10571-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:40785 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752710Ab1BNLQI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Feb 2011 06:16:08 -0500
Received: by wyb28 with SMTP id 28so4586501wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Feb 2011 03:16:06 -0800 (PST)
In-Reply-To: <1297671787-10571-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Marek Szyprowski <m.szyprowski@samsung.com>

Hi,

Wow, fast move, but need to more explanation.
what's the exact meaning of exynos4210?
Exynos4 is prefix and remaining are variants?
Now you changed all s5pv310 to exynos4. if new exynos4xxx chip are
comes then how to handle this one?
e.g., exynos4220 or later.
it's also conflict with mach-exynos4. do you handle all exynos4 series
at this mach directory?
historically there's no rules of the base RAM address at least samsung chips.

Thank you,
Kyungmin Park

On Mon, Feb 14, 2011 at 5:22 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> This patch set changes to ARCH_EXYNOS4 from ARCH_S5PV310 for supporting Samsung's
> new brand name EXYNOS. Samsung officially announced about the brand name of EXYNOS
> at MWC 2011 and The EXYNOS4 integrates a ARM Cortex A9 microporcessor with several
> other peripherals to support features such as multimedai, storage, graphics and gaming.
> Especially, the EXYNOS4210 CPU which is one of EXYNOS4 SoC series can be used in
> products such as Mobile devices.
>
> This patch set consists of the following patches.
>
> [PATCH 01/11] ARM: EXYNOS4: Add EXYNOS4 CPU initialization support
> [PATCH 02/11] ARM: EXYNOS4: Update Clock part
> [PATCH 03/11] ARM: EXYNOS4: Update IRQ part
> [PATCH 04/11] ARM: EXYNOS4: Update Timer part
> [PATCH 05/11] ARM: EXYNOS4: Update device support
> [PATCH 06/11] ARM: EXYNOS4: Moved board support files
> [PATCH 07/11] ARM: EXYNOS4: Update Kconfig and Makefile for the new ARCH_EXYNOS4
> [PATCH 08/11] ARM: exynos4_defconfig: Add defconfig for EXYNOS4
> [PATCH 09/11] mtd: OneNAND: Change dependency of ARCH_EXYNOS4
> [PATCH 10/11] ASoC: Change dependency of ARCH_EXYNOS4
> [PATCH 11/11] tty: Change dependency of ARCH_EXYNOS4
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
