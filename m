From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 2nd 5/5] Samsung SoC update for v3.14
Date: Sat, 04 Jan 2014 11:12:16 +0900
Message-ID: <22f501cf08f2$63fbade0$2bf309a0$@samsung.com>
References: <52B5DCBD.5020202@samsung.com>
 <20131228231735.GC22753@quad.lixom.net>
 <CAK9yfHx=tVFN3zR9LGf44tV1A8vb52XhTu02895sZNLgWMJS3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40916 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754258AbaADCMS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jan 2014 21:12:18 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYU00EVFU4GQB80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 04 Jan 2014 11:12:16 +0900 (KST)
In-reply-to: <CAK9yfHx=tVFN3zR9LGf44tV1A8vb52XhTu02895sZNLgWMJS3g@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Sachin Kamat wrote:
> 
> Hi Olof,
> 
> On 29 December 2013 04:47, Olof Johansson <olof@lixom.net> wrote:
> > On Sun, Dec 22, 2013 at 03:23:57AM +0900, Kukjin Kim wrote:
> >> The following changes since commit
> 538cfbb4c40ab59688236484138133b8e3e89220:
> >>
> >>   ARM: dts: Add initial support for Arndale Octa board (2013-12-16
> >> 05:05:43 +0900)
> >>
> >> are available in the git repository at:
> >>
> >
> >> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> >> tags/samsung-soc-2
> >>
> >> for you to fetch changes up to
7a28f198735d040f4d318511827d913d4b53f355:
> >>
> >>   ARM: dts: add board dts file for EXYNOS4412 based TINY4412 board
> >> (2013-12-19 05:34:26 +0900)
> >>
> >> ----------------------------------------------------------------
> >> Samsung SoC 2nd update for v3.14
> >> - add exynos4412-tiny4412 board dt
> >>   for FriendlyARM's TINY4412 board
> >>
> >> ----------------------------------------------------------------
> >> Alex Ling (1):
> >>       ARM: dts: add board dts file for EXYNOS4412 based TINY4412 board
> >>
> >>  arch/arm/boot/dts/Makefile                |  1 +
> >>  arch/arm/boot/dts/exynos4412-tiny4412.dts | 93
> >> +++++++++++++++++++++++++++++++
> >>  2 files changed, 94 insertions(+)
> >>  create mode 100644 arch/arm/boot/dts/exynos4412-tiny4412.dts
> >
> > Hi,
> >
> > This is really just a DT patch, and given that I didn't take the base
> patch it
> > makes sense to take this in a DT branch instead. Please resend on top of
> dt-2.
> 
> 
> The Arndale octa support patch ("ARM: dts: Add initial support for
> Arndale Octa board") is also
> just a DT patch and does not add any new platform support. It is based
> on the existing 5420
> SoC platform. Please consider pulling in that too.
> 
Sachin, in my understanding, adding 'Arndale Octa DT' is a support for new
hardware platform, so I've applied it into -soc branch. The -soc branch is
for new platform support including new SoC, new hardware, so if arm-soc
maintainers don't want to pull 'new platform' before supporting
multiplatform for exynos, we need to hold on at this moment. But I think, we
could support multiplatform for exynos soon ;-)

Thanks,
Kukjin
