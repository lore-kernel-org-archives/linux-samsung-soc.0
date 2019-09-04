From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/3] soc: samsung: Exynos for v5.4
Date: Wed, 4 Sep 2019 11:31:53 +0200
Message-ID: <CAK8P3a35Cm5=QOz3O3hhczRzkT54vyeka3iJBcknFB4cVgN5-A@mail.gmail.com>
References: <20190816163042.6604-1-krzk@kernel.org> <CAJKOXPcgZ2_ofZyAeTSxALkALaP-SFNfvNmNPYSPyLzuhpGZ0w@mail.gmail.com>
 <20190822183519.GA23735@kozik-lap> <CAK8P3a1_Qw=OB31yOCrpPs8Ys+=9tt4Pnyd=3+2JGzRXJV1KAw@mail.gmail.com>
 <CAJKOXPfRMXkm_pT560Ry5k-zFWpkRDmFHSs2Fb3RL7d4h=ka9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPfRMXkm_pT560Ry5k-zFWpkRDmFHSs2Fb3RL7d4h=ka9g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 4, 2019 at 10:37 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, 3 Sep 2019 at 19:21, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Thu, Aug 22, 2019 at 8:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > I have drafted a related patch recently, regarding the related
> > arch/arm/plat-samsung/cpu.c file. This is part of a longer series
> > I'm working on, see https://pastebin.com/ZqeU3Mth for the
> > current version of this patch.
>
> You can then also adjust the include path in arch/arm/mach-exynos/Makefile.

Yes, that is part of the following patch, along with replacing all the
'depends on PLAT_SAMSUNG' in Kconfig with 'depends on PLAT_SAMSUNG ||
ARCH_EXYNOS'.

> > The observation is that mach-exynos
> > is almost completely independent of plat-samsung these days, and my
> > patch removes the last obstacle from separating the two. I have
> > another set of patches to do the same for mach-s5pv210 (which shares
> > half of its pm.c with plat-samsung, but nothing else).
>
> Great!

FYI, the other parts of the series include:

- Changing all s3c24xx drivers to no longer use mach/*.h or plat/*.h header
  files, as preparation for multiplatform support. This is work in progress,
  but mostly done, with cpufreq and ASoC as the notable exceptions.
- Merging mach-s3c24xx, mach-s3c64xx and plat-samsung into a common
  mach-s3c directory. This seems to work fine and looks nicer than having
  three tightly connected directories, but the downside is that all path
  names change and the directory becomes fairly large.
  I think we can actually do the same thing for all remaining plat-*
directories.
- eventually making all ARMv5 platforms link into a single kernel, like we do
  with ARMv6 and ARMv7 (more to be done there, but s3c24xx and pxa are
  the harder bits here).

      Arnd
