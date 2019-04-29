From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 3/3] ARM: samsung: Changes for v5.2
Date: Mon, 29 Apr 2019 08:53:09 +0200
Message-ID: <CAJKOXPfzV0wn0a-4xvy1B0fR=X4VvpqNmtqwRGFhFdCMH3OpHA@mail.gmail.com>
References: <20190414154805.10188-1-krzk@kernel.org> <20190414154805.10188-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414154805.10188-3-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, 14 Apr 2019 at 17:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
>
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
>
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.2
>
> for you to fetch changes up to 7676e667c841375b41d9438b559756141aa93d0e:
>
>   ARM: s3c64xx: Tidy up handling of regulator GPIO lookups (2019-04-14 12:53:03 +0200)
>
> ----------------------------------------------------------------
> Samsung mach/soc changes for v5.2
>
> 1. Cleanup in mach code.
> 2. Add necessary fixes for Suspend to RAM on Exynos5422 boards (tested
>    with Odroid XU3/XU4/HC1 family).  Finally this brings a working S2R
>    on these Odroid boards (still other drivers might have some issues
>    but mach code seems to be finished).
> 3. Require MCPM for Exynos542x boards because otherwise not all of cores
>    will come online.
> 4. GPIO regulator cleanup on S3C6410 Craig.

Hi Olof and Arnd,

I see you pulled in DTS and DTS64 pull request. I think this one here
is still pending.

Best regards,
Krzysztof

>
> ----------------------------------------------------------------
> Charles Keepax (1):
>       ARM: s3c64xx: Tidy up handling of regulator GPIO lookups
>
> Joonyoung Shim (1):
>       ARM: exynos: Add CPU state management for Exynos542x under secure firmware
>
> Marek Szyprowski (5):
>       ARM: exynos: Move Exynos542x CPU state reset to pm_prepare()
>       ARM: exynos: Add Exynos SMC values for secure memory write
>       ARM: exynos: Fix undefined instruction during Exynos5422 resume
>       ARM: exynos: Fix infinite loops on CPU powerup failure
>       ARM: exynos: Set MCPM as mandatory for Exynos542x/5800 SoCs
>
> Wen Yang (1):
>       ARM: exynos: Fix a leaked reference by adding missing of_node_put
>
>  arch/arm/configs/exynos_defconfig            |  1 -
>  arch/arm/configs/multi_v7_defconfig          |  1 -
>  arch/arm/mach-exynos/Kconfig                 | 12 ++-----
>  arch/arm/mach-exynos/Makefile                |  2 +-
>  arch/arm/mach-exynos/common.h                |  1 +
>  arch/arm/mach-exynos/exynos.c                |  3 ++
>  arch/arm/mach-exynos/firmware.c              |  1 +
>  arch/arm/mach-exynos/mcpm-exynos.c           | 13 +++++++-
>  arch/arm/mach-exynos/platsmp.c               |  9 ++++-
>  arch/arm/mach-exynos/smc.h                   |  7 ++++
>  arch/arm/mach-exynos/suspend.c               | 49 ++++++++++++++++++++++++----
>  arch/arm/mach-s3c64xx/mach-crag6410-module.c | 14 ++++++--
>  12 files changed, 89 insertions(+), 24 deletions(-)
