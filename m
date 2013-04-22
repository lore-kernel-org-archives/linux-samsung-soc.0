From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 0/3] ARM: EXYNOS: DT-enabled support for Universal
 C210
Date: Tue, 23 Apr 2013 02:40:45 +0900
Message-ID: <5175761D.9030906@samsung.com>
References: <1366036922-4103-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:50885 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753214Ab3DVRku (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 13:40:50 -0400
Received: by mail-pd0-f175.google.com with SMTP id g10so3733256pdj.34
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Apr 2013 10:40:50 -0700 (PDT)
In-Reply-To: <1366036922-4103-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, arnd@arndb.de, devicetree-discuss@lists.ozlabs.org, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, m.szyprowski@samsung.com

On 04/15/13 23:41, Tomasz Figa wrote:
> This series intends to add support for Universal C210 board using Device
> Tree. Main difference from other boards based on Exynos 4210 is that
> hardware revision of the SoC used on Universal C210 does not support MCT
> timers and legacy PWM timers must be used instead.
>
> First patch adds device tree node for PWM block available on Exynos4 SoCs,
> second patch adds support for Exynos4210 rev0 SoC in exynos_init_time()
> and third patch introduces initial device tree for Universal C210 board.
>
> Depends on my series for PWM timers rework:
> [PATCH v5 00/14] ARM: samsung-time: Prepare for multiplatform support
> (http://thread.gmane.org/gmane.linux.kernel.samsung-soc/17864)
>
> On Universal C210 board:
>
> Tested-by: Tomasz Figa<t.figa@samsung.com>
>
> Tomasz Figa (3):
>    ARM: dts: exynos4: Add node for PWM device
>    ARM: EXYNOS: Fix support of Exynos4210 rev0 SoC
>    ARM: dts: exynos4210: Add basic dts file for universal_c210 board
>
>   arch/arm/boot/dts/Makefile                      |   1 +
>   arch/arm/boot/dts/exynos4.dtsi                  |   8 +
>   arch/arm/boot/dts/exynos4210-universal_c210.dts | 352 ++++++++++++++++++++++++
>   arch/arm/mach-exynos/common.c                   |   6 +-
>   arch/arm/mach-exynos/mach-universal_c210.c      |   2 +-
>   5 files changed, 367 insertions(+), 2 deletions(-)
>   create mode 100644 arch/arm/boot/dts/exynos4210-universal_c210.dts
>

Applied, thanks.

- Kukjin
