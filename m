From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/3] soc: samsung: Exynos for v5.4
Date: Tue, 3 Sep 2019 19:21:40 +0200
Message-ID: <CAK8P3a1_Qw=OB31yOCrpPs8Ys+=9tt4Pnyd=3+2JGzRXJV1KAw@mail.gmail.com>
References: <20190816163042.6604-1-krzk@kernel.org> <CAJKOXPcgZ2_ofZyAeTSxALkALaP-SFNfvNmNPYSPyLzuhpGZ0w@mail.gmail.com>
 <20190822183519.GA23735@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822183519.GA23735@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Aug 22, 2019 at 8:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Wed, Aug 21, 2019 at 09:51:09AM +0200, Krzysztof Kozlowski wrote:
> > On Fri, 16 Aug 2019 at 18:30, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
> > >
> > >   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.4
> > >
> > > for you to fetch changes up to 40d8aff614f71ab3cab20785b4f213e3802d4e87:
> > >
> > >   soc: samsung: chipid: Convert exynos-chipid driver to use the regmap API (2019-08-15 20:25:25 +0200)
> > >
> > > ----------------------------------------------------------------
> > > Samsung soc drivers changes for v5.4
> > >
> > > Add Exynos Chipid driver for identification of product IDs and SoC
> > > revisions.  The driver also exposes chipid regmap, later to be used by
> > > Exynos Adaptive Supply Voltage driver (adjusting voltages to different
> > > revisions of same SoC).
> >
> > It turns out that it brings troubles (code is executed on every
> > platform polluting logs because it is an initcall, not a driver) so
> > Sylwester (submitter) asked to skip the submission.
> >
> > Please ignore the pull request.
>
> I talked with Sylwester and Bartlomiej who contributed the chipid driver
> and they provided small incremental fixes. The driver is still useful
> and in the future it will be expanded towards AVS. Therefore please pull
> it or optionally wait a week and I will send incremental pull request
> with fixes.

Pulled into arm/drivers for now.

I have drafted a related patch recently, regarding the related
arch/arm/plat-samsung/cpu.c file. This is part of a longer series
I'm working on, see https://pastebin.com/ZqeU3Mth for the
current version of this patch. The observation is that mach-exynos
is almost completely independent of plat-samsung these days, and my
patch removes the last obstacle from separating the two. I have
another set of patches to do the same for mach-s5pv210 (which shares
half of its pm.c with plat-samsung, but nothing else).

       Arnd
