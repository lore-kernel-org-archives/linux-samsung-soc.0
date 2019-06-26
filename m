From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 4/4] ARM: exynos: Mach for v5.3
Date: Wed, 26 Jun 2019 11:15:18 +0200
Message-ID: <CAJKOXPejHBKp1fnhqaKwx2vby1_XmP916TyA9Nw8usU5QNadbA@mail.gmail.com>
References: <20190625193451.7696-1-krzk@kernel.org> <20190625193451.7696-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625193451.7696-4-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 25 Jun 2019 at 21:35, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
>
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.3
>
> for you to fetch changes up to a55e040c6f21f55f81c53c56e1d8095df35e1d02:
>
>   ARM: exynos: Cleanup cppcheck shifting warning (2019-06-25 20:45:09 +0200)
>
> ----------------------------------------------------------------
> Samsung mach/soc changes for v5.3
>
> Only cleanups and minor fixes.
>
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       ARM: exynos: Only build MCPM support if used

Hi,

I forgot to mention possible merge conflict (although Stephen Cc-ed
you on mails). Resolution is to accept both sides:

diff --cc arch/arm/mach-exynos/Makefile
index 5ccf9d7e58d4,5abf3db23912..0fd3fcf8bfb0
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@@ -14,5 -14,9 +14,5 @@@ obj-$(CONFIG_PM_SLEEP)                += suspend.

  obj-$(CONFIG_SMP)             += platsmp.o headsmp.o

- obj-$(CONFIG_MCPM)            += mcpm-exynos.o
 -plus_sec := $(call as-instr,.arch_extension sec,+sec)
 -AFLAGS_exynos-smc.o           :=-Wa,-march=armv7-a$(plus_sec)
 -AFLAGS_sleep.o                        :=-Wa,-march=armv7-a$(plus_sec)
 -
+ obj-$(CONFIG_EXYNOS_MCPM)     += mcpm-exynos.o

Best regards,
Krzysztof
