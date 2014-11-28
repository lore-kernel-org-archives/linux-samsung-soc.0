From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 3/5] pinctrl: exynos: Fix GPIO setup failure because
 domain clock being gated
Date: Fri, 28 Nov 2014 15:08:44 +0100
Message-ID: <1417183724.18249.36.camel@AMDC1943>
References: <1417011857-10419-1-git-send-email-k.kozlowski@samsung.com>
 <1417011857-10419-4-git-send-email-k.kozlowski@samsung.com>
 <CACRpkdb8F8YcvFeHPvOKHjx_p4HEpimck3XRabB3oHpZTdmRQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:18313 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750976AbaK1OIt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Nov 2014 09:08:49 -0500
In-reply-to: <CACRpkdb8F8YcvFeHPvOKHjx_p4HEpimck3XRabB3oHpZTdmRQQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <thomas.abraham@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Vivek Gautam <gautam.vivek@samsung.com>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On pi=C4=85, 2014-11-28 at 15:04 +0100, Linus Walleij wrote:
> On Wed, Nov 26, 2014 at 3:24 PM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>=20
> > The audio subsystem on Exynos 5420 has separate clocks and GPIO. To
> > operate properly on GPIOs the main block clock 'mau_epll' must be
> > enabled.
> >
> > This was observed on Peach Pi/Pit and Arndale Octa (after enabling =
i2s0)
> > after introducing runtime PM to pl330 DMA driver. After that commit=
 the
> > 'mau_epll' was gated, because the "amba" clock was disabled and the=
re
> > were no more users of mau_epll.
> >
> > The system hang just before probing i2s0 because
> > samsung_pinmux_setup() tried to access memory from audss block whic=
h was
> > gated.
> >
> > Add a clock property to the pinctrl driver and enable the clock dur=
ing
> > GPIO setup. During normal GPIO operations (set, get, set_direction)=
 the
> > clock is not enabled.
> >
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> Waiting for Tomasz to review this.
>=20
> Can this patch be applied in separation from the others?

Yes, it can be picked independently.

The commit message is somehow misleading because issue is actually fixe=
d
by enabling this in DTS. So the next patch (4/5: ARM: dts: exynos5420:
Add clock for audss pinctrl) actually fixes the issue on Arndale Octa
board from pinctrl perspective. Unfortunately I spot that mistake (in
commit msg) later...

Best regards,
Krzysztof
