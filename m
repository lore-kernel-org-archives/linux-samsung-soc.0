From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v5 0/7] cpufreq: use cpufreq-cpu0 driver for exynos based
 platforms
Date: Mon, 26 May 2014 07:50:02 +0900
Message-ID: <5382739A.60800@samsung.com>
References: <1400855260-6807-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:37560 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751170AbaEYWuI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 May 2014 18:50:08 -0400
In-Reply-To: <1400855260-6807-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, shawn.guo@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, l.majewski@samsung.com, viresh.kumar@linaro.org, heiko@sntech.de

On 05/23/14 23:27, Thomas Abraham wrote:
> Changes since v4:
> - Various changes in clock code suggested by Tomasz Figa<t.figa@samsung.com>
> - This series depends on mutiple other patches
>    [a] patch that introduces read-only attribute for clock dividers.
>        - http://lists.infradead.org/pipermail/linux-arm-kernel/2014-May/259264.html
>    [b] the series "PM / OPP: move cpufreq specific helpers out of OPP layer"
>        - https://www.mail-archive.com/linux-omap@vger.kernel.org/msg104610.html
>    [c] the series "cpufreq: opp: Add device tree based lookup of boost mode frequency"
>        - http://www.spinics.net/lists/arm-kernel/msg334336.html
>
This series looks good to me after quick loking at but as I replied on 
other thread, I'm not sure above changes are ready for 3.16 or not...

Maybe we can revisit this series for 3.17?...hmm...

- Kukjin

> Changes since v3:
> - Addressed comments from Tomasz Figa<t.figa@samsung.com>
>    [http://www.spinics.net/lists/cpufreq/msg09290.html]
> - Rebased to v3.15-rc4
>
> Changes since v2:
> - Safe operating voltage is not required while switching APLL frequency
>    since the temporary parent's clock is divided down to keep armclk within
>    permissible limits. Thanks to Heiko Stuebner<heiko@sntech.de>  for
>    suggesting this.
> - Rob had suggested to use max frequency for each of the divider clock
>    outputs instead of divider values. But due to certain SoC specific
>    characteristics, the divider values corresponding to the input clock
>    frequency for the CMU_CPU clock blocks have to be used.
>
> Changes since v1:
> - Removes Exynos4x12 and Exynos5250 cpufreq driver also.
> - Device tree based clock configuration lookup as suggested by Lukasz
>    Majewski and Tomasz Figa.
> - safe operating point binding reworked as suggested by Shawn Guo.
>
> The patch series removes the use of Exynos specific cpufreq driver and enables
> the use of cpufreq-cpu0 driver for Exynos4210, Exynos4x12 and Exynos5250 based
> platforms. This is being done for few reasons.
>
> (a) The Exynos cpufreq driver reads/writes clock controller registers
>      bypassing the Exynos CCF driver which is sort of problematic.
> (b) Removes the need for having clock controller register definitions
>      in the cpufreq driver and also removes the need for statically
>      io-remapping clock controller address space (helps in moving towards
>      multiplatform kernel).
>
> Thomas Abraham (7):
>    cpufreq: cpufreq-cpu0: allow use of optional boost mode frequencies
>    clk: samsung: add infrastructure to register cpu clocks
>    Documentation: devicetree: add cpu clock configuration data binding for Exynos4/5
>    clk: exynos: use cpu-clock provider type to represent arm clock
>    ARM: dts: Exynos: add cpu nodes, opp and cpu clock configuration data
>    ARM: Exynos: switch to using generic cpufreq-cpu0 driver
>    cpufreq: exynos: remove all exynos specific cpufreq driver support
>
>   .../devicetree/bindings/clock/exynos4-clock.txt    |   37 ++
>   .../devicetree/bindings/clock/exynos5250-clock.txt |   36 ++
>   .../devicetree/bindings/cpufreq/cpufreq-cpu0.txt   |    2 +
>   arch/arm/boot/dts/exynos4210-origen.dts            |    6 +
>   arch/arm/boot/dts/exynos4210-trats.dts             |    6 +
>   arch/arm/boot/dts/exynos4210-universal_c210.dts    |    6 +
>   arch/arm/boot/dts/exynos4210.dtsi                  |   35 ++
>   arch/arm/boot/dts/exynos4212.dtsi                  |   18 +
>   arch/arm/boot/dts/exynos4412-odroidx.dts           |    6 +
>   arch/arm/boot/dts/exynos4412-origen.dts            |    6 +
>   arch/arm/boot/dts/exynos4412-trats2.dts            |    6 +
>   arch/arm/boot/dts/exynos4412.dtsi                  |   31 ++
>   arch/arm/boot/dts/exynos4x12.dtsi                  |   36 ++
>   arch/arm/boot/dts/exynos5250-arndale.dts           |    6 +
>   arch/arm/boot/dts/exynos5250-cros-common.dtsi      |    6 +
>   arch/arm/boot/dts/exynos5250-smdk5250.dts          |    6 +
>   arch/arm/boot/dts/exynos5250.dtsi                  |   41 ++
>   arch/arm/mach-exynos/exynos.c                      |    4 +-
>   drivers/clk/samsung/Makefile                       |    2 +-
>   drivers/clk/samsung/clk-cpu.c                      |  448 ++++++++++++++++++++
>   drivers/clk/samsung/clk-exynos4.c                  |   25 +-
>   drivers/clk/samsung/clk-exynos5250.c               |   16 +-
>   drivers/clk/samsung/clk.h                          |    4 +
>   drivers/cpufreq/Kconfig                            |    1 +
>   drivers/cpufreq/Kconfig.arm                        |   52 ---
>   drivers/cpufreq/Makefile                           |    4 -
>   drivers/cpufreq/cpufreq-cpu0.c                     |    3 +
>   drivers/cpufreq/exynos-cpufreq.c                   |  218 ----------
>   drivers/cpufreq/exynos-cpufreq.h                   |   99 -----
>   drivers/cpufreq/exynos4210-cpufreq.c               |  157 -------
>   drivers/cpufreq/exynos4x12-cpufreq.c               |  208 ---------
>   drivers/cpufreq/exynos5250-cpufreq.c               |  183 --------
>   include/dt-bindings/clock/exynos5250.h             |    1 +
>   33 files changed, 779 insertions(+), 936 deletions(-)
>   create mode 100644 drivers/clk/samsung/clk-cpu.c
>   delete mode 100644 drivers/cpufreq/exynos-cpufreq.c
>   delete mode 100644 drivers/cpufreq/exynos-cpufreq.h
>   delete mode 100644 drivers/cpufreq/exynos4210-cpufreq.c
>   delete mode 100644 drivers/cpufreq/exynos4x12-cpufreq.c
>   delete mode 100644 drivers/cpufreq/exynos5250-cpufreq.c
