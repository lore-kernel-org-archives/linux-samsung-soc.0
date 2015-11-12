From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 9/9] drivers: soc: Add support for Exynos PMU driver
Date: Thu, 12 Nov 2015 13:35:18 +0900
Message-ID: <56441706.5070206@samsung.com>
References: <1447155784-12667-1-git-send-email-pankaj.dubey@samsung.com>
 <1447155784-12667-10-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1447155784-12667-10-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com, amitdanielk@gmail.com, olof@lixom.net, khilman@linaro.org, arnd@arndb.de
List-Id: linux-samsung-soc@vger.kernel.org

On 10.11.2015 20:43, Pankaj Dubey wrote:
> This patch moves Exynos PMU driver implementation from "arm/mach-exynos"
> to "drivers/soc/samsung". This driver is mainly used for setting misc
> bits of register from PMU IP of Exynos SoC which will be required to
> configure before Suspend/Resume. Currently all these settings are done
> in "arch/arm/mach-exynos/pmu.c" but moving ahead for ARM64 based SoC
> support, there is a need of this PMU driver in driver/* folder.
> 
> This driver uses existing DT binding information and there should
> be no functionality change in the supported platforms.
> 
> Signed-off-by: Amit Daniel Kachhap <amitdanielk@gmail.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig          |   1 +
>  arch/arm/mach-exynos/Makefile         |   4 +-
>  arch/arm/mach-exynos/exynos-pmu.h     |  45 ------
>  arch/arm/mach-exynos/exynos3250-pmu.c | 175 ---------------------
>  arch/arm/mach-exynos/exynos4-pmu.c    | 223 ---------------------------
>  arch/arm/mach-exynos/exynos5250-pmu.c | 196 ------------------------
>  arch/arm/mach-exynos/exynos5420-pmu.c | 280 ----------------------------------
>  arch/arm/mach-exynos/pmu.c            | 183 ----------------------
>  drivers/soc/samsung/Kconfig           |   4 +
>  drivers/soc/samsung/Makefile          |   4 +
>  drivers/soc/samsung/exynos-pmu.c      | 183 ++++++++++++++++++++++
>  drivers/soc/samsung/exynos-pmu.h      |  45 ++++++
>  drivers/soc/samsung/exynos3250-pmu.c  | 175 +++++++++++++++++++++
>  drivers/soc/samsung/exynos4-pmu.c     | 223 +++++++++++++++++++++++++++
>  drivers/soc/samsung/exynos5250-pmu.c  | 196 ++++++++++++++++++++++++
>  drivers/soc/samsung/exynos5420-pmu.c  | 280 ++++++++++++++++++++++++++++++++++
>  16 files changed, 1112 insertions(+), 1105 deletions(-)
>  delete mode 100644 arch/arm/mach-exynos/exynos-pmu.h
>  delete mode 100644 arch/arm/mach-exynos/exynos3250-pmu.c
>  delete mode 100644 arch/arm/mach-exynos/exynos4-pmu.c
>  delete mode 100644 arch/arm/mach-exynos/exynos5250-pmu.c
>  delete mode 100644 arch/arm/mach-exynos/exynos5420-pmu.c
>  delete mode 100644 arch/arm/mach-exynos/pmu.c
>  create mode 100644 drivers/soc/samsung/exynos-pmu.c
>  create mode 100644 drivers/soc/samsung/exynos-pmu.h
>  create mode 100644 drivers/soc/samsung/exynos3250-pmu.c
>  create mode 100644 drivers/soc/samsung/exynos4-pmu.c
>  create mode 100644 drivers/soc/samsung/exynos5250-pmu.c
>  create mode 100644 drivers/soc/samsung/exynos5420-pmu.c

Again - renames were not detected. This is strange... and actually
unreadable. The previous patch looked much better. What happened?

Please send also entire patchset to linux-pm mailing list. I asked about
it last time and can't see it as recipient here.

Best regards,
Krzysztof
