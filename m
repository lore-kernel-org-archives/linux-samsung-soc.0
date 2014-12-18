From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: samsung: Fix Exynos 5420 pinctrl setup and clock disable
 failure due to domain being gated
Date: Wed, 17 Dec 2014 22:58:48 -0800
Message-ID: <20141218065848.29014.24886@quantum>
References: <1417788934-23447-1-git-send-email-k.kozlowski@samsung.com>
 <1418129982.19339.6.camel@AMDC1943> <5486F69B.6020005@samsung.com>
 <7hlhmfo1b0.fsf@deeprootsystems.com> <7h8ui8h7n9.fsf@deeprootsystems.com>
 <1418718015.28527.4.camel@AMDC1943> <20141217152322.29014.7739@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:64535 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751944AbaLRG64 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 01:58:56 -0500
Received: by mail-pd0-f171.google.com with SMTP id y13so822858pdi.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2014 22:58:55 -0800 (PST)
In-Reply-To: <20141217152322.29014.7739@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Quoting Mike Turquette (2014-12-17 07:23:22)
> Quoting Krzysztof Kozlowski (2014-12-16 00:20:15)
> > On pon, 2014-12-15 at 14:26 -0800, Kevin Hilman wrote:
> > > Kevin Hilman <khilman@kernel.org> writes:
> > >=20
> > > > Sylwester Nawrocki <s.nawrocki@samsung.com> writes:
> > > >
> > > >> On 09/12/14 13:59, Krzysztof Kozlowski wrote:
> > > >>> On pi=C4=85, 2014-12-05 at 15:15 +0100, Krzysztof Kozlowski w=
rote:
> > > >>>> > Audio subsystem clocks are located in separate block. On E=
xynos 5420 if
> > > >>>> > clock for this block (from main clock domain) 'mau_epll' i=
s gated then
> > > >>>> > any read or write to audss registers will block.
> > > >>>> >=20
> > > >>>> > This kind of boot hang was observed on Arndale Octa and Pe=
ach Pi/Pit
> > > >>>> > after introducing runtime PM to pl330 DMA driver. After th=
at commit the
> > > >>>> > 'mau_epll' was gated, because the "amba" clock was disable=
d and there
> > > >>>> > were no more users of mau_epll.
> > > >>>> >=20
> > > >>>> > The system hang on one of steps:
> > > >>>> > 1. Disabling unused clocks from audss block.
> > > >>>> > 2. During audss GPIO setup (just before probing i2s0 becau=
se
> > > >>>> >    samsung_pinmux_setup() tried to access memory from auds=
s block which was
> > > >>>> >    gated.
> > > >>>> >=20
> > > >>>> > Add a workaround for this by enabling the 'mau_epll' clock=
 in probe.
> > > >>>> >=20
> > > >>>> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.co=
m>
> > > >>>> > ---
> > > >>>> >  drivers/clk/samsung/clk-exynos-audss.c | 29 +++++++++++++=
+++++++++++++++-
> > > >>>> >  1 file changed, 28 insertions(+), 1 deletion(-)
> > > >>>
> > > >>> Sorry for pinging so quick but merge window is open and it lo=
oks like
> > > >>> booting Exynos542x boards will be broken (because pl330 will =
no longer
> > > >>> hold adma clock enabled so whole audss domain will be gated).
> > > >>>=20
> > > >>> This is a non-intrusive workaround for that issue, as wanted =
by
> > > >>> Sylwester:
> > > >>> https://lkml.org/lkml/2014/12/5/223
> > > >>>=20
> > > >>> Any comments on this?
> > > >>
> > > >> The patch looks OK to me, it would be good though if someone e=
lse
> > > >> has confirmed it fixes the bug. I don't have any clock patches=
 queued
> > > >> at the moment. Perhaps you could apply it directly, Mike ?
> > > >
> > > > I confirm it fixes the boot hang in linux-next (next-20141210) =
on my
> > > > exynos5800-peach-pi and exynos5420-arndale-octa.  Tested both
> > > > exynos_defconfig and multi_v7_defconfig.
> > > >
> > > > Tested-by: Kevin Hilman <khilman@linaro.org>
> > >=20
> > > What's the status of this patch?  linux-next is still broken for =
several
> > > Exynos5 platforms without this fix.
> >=20
> > I believe not only next is broken but also current mainline because
> > runtime PM for pl330 was merged yesterday...
> >=20
> > The patch received two tested-bys (Kevin's and Javier's) and Sylwes=
ter's
> > ack.
> >=20
> > Mike, could you pick the patch and send it to Linus after rc1?
>=20
> Will do.

To be clear, I pulled this into clk-next towards -rc1, so it won't need
to go through as an -rc fix.

Regards,
Mike

>=20
> Regards,
> Mike
>=20
> >=20
> > Best regards,
> > Krzysztof
> >=20
