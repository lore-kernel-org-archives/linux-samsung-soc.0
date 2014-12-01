From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH RFT 2/2] arm: dts: disable CCI on exynos420 based
 arndale-octa
Date: Mon, 01 Dec 2014 10:03:28 +0100
Message-ID: <1417424608.4055.24.camel@AMDC1943>
References: <1417186209-5256-1-git-send-email-a.kesavan@samsung.com>
 <1417186209-5256-2-git-send-email-a.kesavan@samsung.com>
 <1417187977.19247.4.camel@AMDC1943>
 <CAM4voa=aN53CWjTzw-A736xZo3xWr2N4kBpM0vJX5KqfV-ikjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:13959 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752685AbaLAJDc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Dec 2014 04:03:32 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFW00JMDBYG0630@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 01 Dec 2014 09:06:16 +0000 (GMT)
In-reply-to: <CAM4voa=aN53CWjTzw-A736xZo3xWr2N4kBpM0vJX5KqfV-ikjQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kevin Hilman <khilman@kernel.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, punit.agrawal@arm.com, Will Deacon <will.deacon@arm.com>, "mark.rutland" <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Arnd Bergmann <arnd@arndb.de>

On pi=C4=85, 2014-11-28 at 21:09 +0530, Abhilash Kesavan wrote:
> Hello Krzysztof,
>=20
> On Fri, Nov 28, 2014 at 8:49 PM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
> > On pi=C4=85, 2014-11-28 at 20:20 +0530, Abhilash Kesavan wrote:
> >> The arndale-octa board was giving "imprecise external aborts" duri=
ng
> >> boot-up with MCPM enabled. CCI enablement of the boot cluster was =
found
> >> to be the cause of these aborts (possibly because the secure f/w w=
as not
> >> allowing it). Hence, disable CCI for the arndale-octa board.
> >>
> >> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> >> ---
> >>  arch/arm/boot/dts/exynos5420-arndale-octa.dts |    4 ++++
> >>  arch/arm/boot/dts/exynos5420.dtsi             |    2 +-
> >>  2 files changed, 5 insertions(+), 1 deletion(-)
> >
> > I tested these 2 patches on Arndale Octa but there are no improveme=
nts.
> > I still got imprecise aborts (some not fatal and sometimes killing =
init
> > with full backtrace).
>=20
> Thanks for testing. Are you testing this with exynos_defconfig with n=
o
> other changes ? Can you please confirm from the bootlog that MCPM and
> CCI are not being initialized.
>=20
That was exynos_defconfig with disabled DRM and enabled some debug,
next-20141128.

When I tried only exynos_defconfig (with disabled DRM) it worked fine..=
=2E
So the imprecise aborts were caused by one of following debug options:

DEBUG_SECTION_MISMATCH
DYNAMIC_DEBUG
DEBUG_ATOMIC_SLEEP
DEBUG_PREEMPT
PROVE_LOCKING
LOCKUP_DETECTOR
DEBUG_LOCK_ALLOC
PROVE_RCU
DEBUG_RT_MUTEXES
DEBUG_MUTEXES
DEBUG_SPINLOCK
DEBUG_LIST
DEBUG_PAGEALLOC
SPARSE_RCU_POINTER
DEBUG_FS
PM_DEBUG
PM_ADVANCED_DEBUG
GPIO_SYSFS                                                             =
                                                 =20

> Can you remove these 2 patches and on linux-next check if you are
> getting aborts even with 5420_MCPM disabled.

I tried this already and imprecise aborts shown, however with my
debugging options above.

Overall the patches seems to work properly (although the debugging issu=
e
needs to be resolved still), so:

On Arndale Octa (Exynos 5420):
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
