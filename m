From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 2/2] ARM: dts: Add rtc_src clk for s3c-rtc on
 exynos5250-snow
Date: Mon, 22 Sep 2014 21:09:15 +0900
Message-ID: <01d001cfd65e$0790be30$16b23a90$@kernel.org>
References: <1410954633-27025-1-git-send-email-javier.martinez@collabora.co.uk>
 <1410954633-27025-3-git-send-email-javier.martinez@collabora.co.uk>
 <CAD=FV=W7xJ01m2oLtuDnogOmrpwpztbir=59oSWU6oojFYUWKw@mail.gmail.com>
 <5419ADF9.3010509@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26033 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753507AbaIVMJS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 08:09:18 -0400
In-reply-to: <5419ADF9.3010509@suse.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?'Andreas_F=C3=A4rber'?= <afaerber@suse.de>, 'Doug Anderson' <dianders@chromium.org>
Cc: 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Daniel Drake' <drake@endlessm.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Andreas F=C3=A4rber wrote:
>=20
> Am 17.09.2014 um 17:47 schrieb Doug Anderson:
> > Hi,
> >
> > On Wed, Sep 17, 2014 at 4:50 AM, Javier Martinez Canillas
> > <javier.martinez@collabora.co.uk> wrote:
> >> commit 546b117fdf17 ("rtc: s3c: add support for RTC of Exynos3250 =
SoC")
> >> added an "rtc_src" DT property for the Samsung's S3C Real Time Clo=
ck
> >> controller that specifies the 32.768 kHz clock that uses the RTC a=
s its
> >> source clock. In the case of the Exynos5250 based Snow board, the =
Maxim
> >> 77686 32kHz AP clock is used as the source clock.
> >>
> >> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora=
=2Eco.uk>
> >> ---
> >>  arch/arm/boot/dts/exynos5250-snow.dts | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot=
/dts/exynos5250-snow.dts
> >> index e51fcef..56eec56 100644
> >> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> >> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> >> @@ -10,6 +10,7 @@
> >>
> >>  /dts-v1/;
> >>  #include <dt-bindings/gpio/gpio.h>
> >> +#include <dt-bindings/clock/maxim,max77686.h>
> >>  #include "exynos5250.dtsi"
> >>
> >>  / {
> >> @@ -29,6 +30,8 @@
> >>
> >>         rtc@101E0000 {
> >>                 status =3D "okay";
> >> +               clocks =3D <&clock CLK_RTC>, <&max77686 MAX77686_C=
LK_AP>;
> >> +               clock-names =3D "rtc", "rtc_src";
> >
> > Wait, seriously?  Snow is still using the "rtc@101E0000" syntax?
> > Whatever happened to the series that Andreas worked so hard on,
> > including <https://patchwork.kernel.org/patch/4664801/>?
> >
> > Kukjin: Andreas's patch series was Reviewed long ago I think and by
> > now I'd imagine it's got some conflicts due to it not having been
> > applied in a timely fashion.  Perhaps you could fix it up for Andre=
as
> > (since he's already rebased it several times) and land it?
> >
> > If I had to guess, outstanding from Andreas's series (patchwork IDs=
 listed):
> >
> > 4751131 New          [v7] ARM: dts: Prepare node labels for exynos5=
250
> > 4664801 New          [v6,04/10] ARM: dts: Clean up exynos5250-snow
> > 4664771 New          [v6,05/10] ARM: dts: Fill in bootargs for exyn=
os5250-snow
> > 4664731 New          [v6,06/10] ARM: dts: Clean up exynos5250-smdk5=
250
> > 4664751 New          [v6,07/10] ARM: dts: Clean up exynos5250-arnda=
le
> > 4664711 New          [v6,08/10] ARM: dts: Fix apparent GPIO typo in
> > exynos5250-arndale
> > 4664681 New          [v6,09/10] ARM: dts: Simplify USB3503 on exyno=
s5250-arndale
> > 4664691 New          [v6,10/10] ARM: dts: Add exynos5250-spring dev=
ice tree
>=20
> Yes, Kukjin told me not to resend anything, and I haven't heard back
> from him since his Kernel Summit trip.
>=20
Sorry about that and I thought I took them :( I'll sort them out tonigh=
t
including this series together.

- Kukjin
