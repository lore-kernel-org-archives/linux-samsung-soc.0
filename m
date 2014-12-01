From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH RFT 2/2] arm: dts: disable CCI on exynos420 based
 arndale-octa
Date: Mon, 01 Dec 2014 12:19:21 +0100
Message-ID: <1417432761.4055.27.camel@AMDC1943>
References: <1417186209-5256-1-git-send-email-a.kesavan@samsung.com>
 <1417186209-5256-2-git-send-email-a.kesavan@samsung.com>
 <1417187977.19247.4.camel@AMDC1943>
 <CAM4voa=aN53CWjTzw-A736xZo3xWr2N4kBpM0vJX5KqfV-ikjQ@mail.gmail.com>
 <1417424608.4055.24.camel@AMDC1943>
 <20141201110948.GB3836@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:65103 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752779AbaLALT0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Dec 2014 06:19:26 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFW00E8WI94NE70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 01 Dec 2014 11:22:16 +0000 (GMT)
In-reply-to: <20141201110948.GB3836@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Abhilash Kesavan <kesavan.abhilash@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, "mark.rutland" <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, punit.agrawal@arm.com, Will Deacon <will.deacon@arm.com>, Douglas Anderson <dianders@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On pon, 2014-12-01 at 11:09 +0000, Russell King - ARM Linux wrote:
> On Mon, Dec 01, 2014 at 10:03:28AM +0100, Krzysztof Kozlowski wrote:
> > On pi=C4=85, 2014-11-28 at 21:09 +0530, Abhilash Kesavan wrote:
> > > Hello Krzysztof,
> > >=20
> > > On Fri, Nov 28, 2014 at 8:49 PM, Krzysztof Kozlowski
> > > <k.kozlowski@samsung.com> wrote:
> > > > On pi=C4=85, 2014-11-28 at 20:20 +0530, Abhilash Kesavan wrote:
> > > >> The arndale-octa board was giving "imprecise external aborts" =
during
> > > >> boot-up with MCPM enabled. CCI enablement of the boot cluster =
was found
> > > >> to be the cause of these aborts (possibly because the secure f=
/w was not
> > > >> allowing it). Hence, disable CCI for the arndale-octa board.
> > > >>
> > > >> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> > > >> ---
> > > >>  arch/arm/boot/dts/exynos5420-arndale-octa.dts |    4 ++++
> > > >>  arch/arm/boot/dts/exynos5420.dtsi             |    2 +-
> > > >>  2 files changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > I tested these 2 patches on Arndale Octa but there are no impro=
vements.
> > > > I still got imprecise aborts (some not fatal and sometimes kill=
ing init
> > > > with full backtrace).
> > >=20
> > > Thanks for testing. Are you testing this with exynos_defconfig wi=
th no
> > > other changes ? Can you please confirm from the bootlog that MCPM=
 and
> > > CCI are not being initialized.
> > >=20
> > That was exynos_defconfig with disabled DRM and enabled some debug,
> > next-20141128.
> >=20
> > When I tried only exynos_defconfig (with disabled DRM) it worked fi=
ne...
> > So the imprecise aborts were caused by one of following debug optio=
ns:
> >=20
> > DEBUG_SECTION_MISMATCH
> > DYNAMIC_DEBUG
> > DEBUG_ATOMIC_SLEEP
> > DEBUG_PREEMPT
> > PROVE_LOCKING
> > LOCKUP_DETECTOR
> > DEBUG_LOCK_ALLOC
> > PROVE_RCU
> > DEBUG_RT_MUTEXES
> > DEBUG_MUTEXES
> > DEBUG_SPINLOCK
> > DEBUG_LIST
> > DEBUG_PAGEALLOC
> > SPARSE_RCU_POINTER
> > DEBUG_FS
> > PM_DEBUG
> > PM_ADVANCED_DEBUG
> > GPIO_SYSFS
> >=20
> > > Can you remove these 2 patches and on linux-next check if you are
> > > getting aborts even with 5420_MCPM disabled.
> >=20
> > I tried this already and imprecise aborts shown, however with my
> > debugging options above.
> >=20
> > Overall the patches seems to work properly (although the debugging =
issue
> > needs to be resolved still), so:
> >=20
> > On Arndale Octa (Exynos 5420):
> > Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> Reading this message, it seems that this should *not* be given a test=
ed-by,
> because it seems from what you've reported above, they don't work cor=
rectly.
>=20
> If you have to turn debugging options off in order to get the kernel =
to
> apparently run correctly after applying some patches, it means those
> patches themselves are probably buggy, rather than the debug itself
> being buggy.
>=20
> I'd suggest that you have some further work to do (a manual bisect of=
 the
> config options you've disabled) to discover which is the cause of the
> problem.
>=20
> It could be that the code introduces something like a use-after-free =
bug.

Maybe I was to eager to add Tested-by but (without debugging options)
one imprecise-abort disappears with the patchset. Other issues seem not
to be fixed.

Best regards,
Krzysztof
