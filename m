From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCHv6] ARM: dts: add exynos5422-cpus.dtsi to correct cpu order
Date: Tue, 14 Jul 2015 17:23:21 +0900
Message-ID: <075c01d0be0e$587fe260$097fa720$@kernel.org>
References: <1436833441-8405-1-git-send-email-parkch98@gmail.com>
 <55A45C63.2030907@samsung.com> <06b101d0bdf2$8aad8fb0$a008af10$@kernel.org>
 <CAPTzV15+BWEo6PjJMwHVjqVdUnZuJ=PBAUprF_vZaSRTYiuNXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45924 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751843AbbGNIXX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jul 2015 04:23:23 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NRG00J5VXYXWD90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jul 2015 17:23:21 +0900 (KST)
In-reply-to: <CAPTzV15+BWEo6PjJMwHVjqVdUnZuJ=PBAUprF_vZaSRTYiuNXw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: chanho61.park@samsung.com, 'Kukjin Kim' <kgene@kernel.org>
Cc: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Chanho Park wrote:
>=20
> Hi Kukjin,
>=20
> On Tue, Jul 14, 2015 at 2:04 PM, Kukjin Kim <kgene@kernel.org> wrote:
> > Krzysztof Kozlowski wrote:
> >>
> >> On 14.07.2015 09:24, Chanho Park wrote:
> >> > The odroid-xu3 board which is based on exynos5422 not exynos5800=
 is
> >> > booted from cortex-a7 core unlike exynos5800. The odroid-xu3's c=
pu order
> >> > is quite strange. cpu0 and cpu5-7 are cortex-a7 cores and cpu1-4=
 are
> >> > cortex-a15 cores. To correct this mis-odering, I added exynos542=
2-cpus.dtsi
> >> > and reversing cpu orders from exynos5420. Now, cpu0-3 are cortex=
-a7 and
> >> > cpu4-7 are cortex-a15.
> >> >
> >> > Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >> > Signed-off-by: Chanho Park <parkch98@gmail.com>
> >> > ---

[...]

> >> >
> >> > Secondary cpu booting problem[1] is not resolved yet. Need more =
investigations
> >> > to work booting 8 cores correctly.
> >> >
> >> > [1]: http://www.spinics.net/lists/linux-samsung-soc/msg45525.htm=
l
> >> >
> >> >  arch/arm/boot/dts/exynos5422-cpus.dtsi             | 81 +++++++=
+++++++++++++++
> >> >  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |  1 +
> >> >  2 files changed, 82 insertions(+)
> >> >  create mode 100644 arch/arm/boot/dts/exynos5422-cpus.dtsi
> >>
> >> Thanks, applied to my tree. I'll send it to Kukjin for v4.3 unless=
 he
> >> picks it also.
> >>
> > Well, let me see. I'm thinking we need to sort out the cpu ordering=
 and dtsi
> > inclusions for exynos5420, 5422 and 5800 related to DT files.
> >
> > See,
> >
> > 1) exynos5420 DT (cpu0~3: a15, cpu 4~7: a7)
> > 2) exynos5800 DT is including exynos5420 DT
> > 3) exynos5422 and exynos5800 based boards are including exynos5800 =
DT.
> >
> > Then making exynos5422-cpus DT for exynos5422 based boards?
> > (cpu0~3: a7, cpu4~7: a15)
> >
> > I think, it could cause confusion when new board based on them are =
added
> > because it's not clear and the boot cpu could be selected by bootlo=
ader part.
>=20
> The iROM will check the GPIO pin to select which core is run as cpu0.
> I think no one will change the GPIO pin if a new board which is based
> on exynos5422 :)
>=20
Yes, I know the boot sequence and it means it depends on board configur=
ation
not SoC. That=E2=80=99s why I'm saying it should be handled in board DT=
 file. I think,
most of current exynos big.LITTLE model should do if it could be change=
d
according to board configuration.

> >
> > So how about creating exynos5422-cpus and exynos5420-cpus then incl=
uding the
> > cpus DT file in each board accordingly?
> >
> > Or more clear way to avoid confusion?
>=20
> In this situation, all exynos5422 boards(odroid xu3 series and mobile
> phone) have same cpu configurations. If we move the exynos5420 cpu
> configuration from exynos5420.dtsi, we should change all dts which
> including exynos5420.dtsi.

Maybe same board configuration. Just adding inclusion should be fine at=
 this
moment.

> I think we'd better to defer the change until a new exynos5422 board
> which has different cpu configurations is added.
>=20
I mean, according to current inclusion of exynos5422 based boards' DT f=
ile, it
is including exynos5420 DT via exynos5800 DT and then override differen=
t cpu
ordering (5422-cpu DT) because of different board configuration (just G=
PIO
value) and it is not a good way in this case.

- Kukjin
