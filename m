From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 0/8] cpufreq: use cpufreq-cpu0 driver for exynos based
 platforms
Date: Sat, 17 May 2014 02:14:17 +0200
Message-ID: <5376A9D9.3070702@gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, shawn.guo@linaro.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, l.majewski@samsung.com, viresh.kumar@linaro.org, heiko@sntech.de, thomas.ab@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Thomas,

In general the design already looks good, but I commented on several
implementation issues I found in particular patches (and some minor
nitpicks while at it).

Please let me know whether you have time to work on addressing them.
Otherwise we can just let me, Lukasz or someone else address remaining
issues.

Best regards,
Tomasz

On 14.05.2014 03:11, Thomas Abraham wrote:
> Changes since v3:
> - Addressed comments from Tomasz Figa <t.figa@samsung.com>
>   [http://www.spinics.net/lists/cpufreq/msg09290.html]
> - Rebased to v3.15-rc4
>=20
> Changes since v2:
> - Safe operating voltage is not required while switching APLL frequen=
cy
>   since the temporary parent's clock is divided down to keep armclk w=
ithin
>   permissible limits. Thanks to Heiko St=C3=BCbner <heiko@sntech.de> =
for this
>   suggesting this.
> - Rob had suggested to use max frequency for each of the divider cloc=
k
>   outputs instead of divider values. But due to certain SoC specific
>   characteristics, the divider values corresponding to the input cloc=
k
>   frequency for the CMU_CPU clock blocks have to be used.
>=20
> Changes since v1:
> - Removes Exynos4x12 and Exynos5250 cpufreq driver also.
> - Device tree based clock configuration lookup as suggested by Lukasz
>   Majewski and Tomasz Figa.
> - safe operating point binding reworked as suggested by Shawn Guo.
>=20
> The patch series removes the use of Exynos specific cpufreq driver an=
d enables
> the use of cpufreq-cpu0 driver for Exynos4210, Exynos4x12 and Exynos5=
250 based
> platforms. This is being done for few reasons.
>=20
> (a) The Exynos cpufreq driver reads/writes clock controller registers
>     bypassing the Exynos CCF driver which is sort of problematic.
> (b) Removes the need for having clock controller register definitions
>     in the cpufreq driver and also removes the need for statically
>     io-remapping clock controller address space (helps in moving towa=
rds
>     multiplatform kernel).
>=20
> Thomas Abraham (8):
>   cpufreq: cpufreq-cpu0: allow use of optional boost mode frequencies
>   clk: samsung: change scope of samsung clock lock to global
>   clk: samsung: add infrastructure to register cpu clocks
>   Documentation: devicetree: add cpu clock configuration data binding=
 for Exynos4/5
>   clk: exynos: use cpu-clock provider type to represent arm clock
>   ARM: dts: Exynos: add cpu nodes, opp and cpu clock configuration da=
ta
>   ARM: Exynos: switch to using generic cpufreq-cpu0 driver
>   cpufreq: exynos: remove all exynos specific cpufreq driver support
>=20
>=20
>  .../devicetree/bindings/clock/exynos4-clock.txt    |   37 ++
>  .../devicetree/bindings/clock/exynos5250-clock.txt |   36 ++
>  .../devicetree/bindings/cpufreq/cpufreq-cpu0.txt   |    2 +
>  arch/arm/boot/dts/exynos4210-origen.dts            |    6 +
>  arch/arm/boot/dts/exynos4210-trats.dts             |    6 +
>  arch/arm/boot/dts/exynos4210-universal_c210.dts    |    6 +
>  arch/arm/boot/dts/exynos4210.dtsi                  |   35 ++
>  arch/arm/boot/dts/exynos4212.dtsi                  |   18 +
>  arch/arm/boot/dts/exynos4412-odroidx.dts           |    6 +
>  arch/arm/boot/dts/exynos4412-origen.dts            |    6 +
>  arch/arm/boot/dts/exynos4412-trats2.dts            |    6 +
>  arch/arm/boot/dts/exynos4412.dtsi                  |   31 ++
>  arch/arm/boot/dts/exynos4x12.dtsi                  |   36 ++
>  arch/arm/boot/dts/exynos5250-arndale.dts           |    6 +
>  arch/arm/boot/dts/exynos5250-cros-common.dtsi      |    6 +
>  arch/arm/boot/dts/exynos5250-smdk5250.dts          |    6 +
>  arch/arm/boot/dts/exynos5250.dtsi                  |   41 ++
>  arch/arm/mach-exynos/exynos.c                      |    4 +-
>  drivers/clk/samsung/Makefile                       |    2 +-
>  drivers/clk/samsung/clk-cpu.c                      |  458 ++++++++++=
++++++++++
>  drivers/clk/samsung/clk-exynos4.c                  |   25 +-
>  drivers/clk/samsung/clk-exynos5250.c               |   12 +-
>  drivers/clk/samsung/clk.c                          |   13 +-
>  drivers/clk/samsung/clk.h                          |    7 +
>  drivers/cpufreq/Kconfig                            |   11 +
>  drivers/cpufreq/Kconfig.arm                        |   52 ---
>  drivers/cpufreq/Makefile                           |    4 -
>  drivers/cpufreq/cpufreq-cpu0.c                     |    5 +
>  drivers/cpufreq/exynos-cpufreq.c                   |  209 ---------
>  drivers/cpufreq/exynos-cpufreq.h                   |   91 ----
>  drivers/cpufreq/exynos4210-cpufreq.c               |  157 -------
>  drivers/cpufreq/exynos4x12-cpufreq.c               |  211 ---------
>  drivers/cpufreq/exynos5250-cpufreq.c               |  183 --------
>  include/dt-bindings/clock/exynos5250.h             |    1 +
>  34 files changed, 799 insertions(+), 936 deletions(-)
>  create mode 100644 drivers/clk/samsung/clk-cpu.c
>  delete mode 100644 drivers/cpufreq/exynos-cpufreq.c
>  delete mode 100644 drivers/cpufreq/exynos-cpufreq.h
>  delete mode 100644 drivers/cpufreq/exynos4210-cpufreq.c
>  delete mode 100644 drivers/cpufreq/exynos4x12-cpufreq.c
>  delete mode 100644 drivers/cpufreq/exynos5250-cpufreq.c
>=20
