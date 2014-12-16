From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] clk: samsung: Fix Exynos 5420 pinctrl setup and clock
 disable failure due to domain being gated
Date: Tue, 16 Dec 2014 09:20:15 +0100
Message-ID: <1418718015.28527.4.camel@AMDC1943>
References: <1417788934-23447-1-git-send-email-k.kozlowski@samsung.com>
 <1418129982.19339.6.camel@AMDC1943> <5486F69B.6020005@samsung.com>
 <7hlhmfo1b0.fsf@deeprootsystems.com> <7h8ui8h7n9.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47278 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750914AbaLPIUU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Dec 2014 03:20:20 -0500
In-reply-to: <7h8ui8h7n9.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>, Mike Turquette <mturquette@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On pon, 2014-12-15 at 14:26 -0800, Kevin Hilman wrote:
> Kevin Hilman <khilman@kernel.org> writes:
>=20
> > Sylwester Nawrocki <s.nawrocki@samsung.com> writes:
> >
> >> On 09/12/14 13:59, Krzysztof Kozlowski wrote:
> >>> On pi=C4=85, 2014-12-05 at 15:15 +0100, Krzysztof Kozlowski wrote=
:
> >>>> > Audio subsystem clocks are located in separate block. On Exyno=
s 5420 if
> >>>> > clock for this block (from main clock domain) 'mau_epll' is ga=
ted then
> >>>> > any read or write to audss registers will block.
> >>>> >=20
> >>>> > This kind of boot hang was observed on Arndale Octa and Peach =
Pi/Pit
> >>>> > after introducing runtime PM to pl330 DMA driver. After that c=
ommit the
> >>>> > 'mau_epll' was gated, because the "amba" clock was disabled an=
d there
> >>>> > were no more users of mau_epll.
> >>>> >=20
> >>>> > The system hang on one of steps:
> >>>> > 1. Disabling unused clocks from audss block.
> >>>> > 2. During audss GPIO setup (just before probing i2s0 because
> >>>> >    samsung_pinmux_setup() tried to access memory from audss bl=
ock which was
> >>>> >    gated.
> >>>> >=20
> >>>> > Add a workaround for this by enabling the 'mau_epll' clock in =
probe.
> >>>> >=20
> >>>> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >>>> > ---
> >>>> >  drivers/clk/samsung/clk-exynos-audss.c | 29 +++++++++++++++++=
+++++++++++-
> >>>> >  1 file changed, 28 insertions(+), 1 deletion(-)
> >>>
> >>> Sorry for pinging so quick but merge window is open and it looks =
like
> >>> booting Exynos542x boards will be broken (because pl330 will no l=
onger
> >>> hold adma clock enabled so whole audss domain will be gated).
> >>>=20
> >>> This is a non-intrusive workaround for that issue, as wanted by
> >>> Sylwester:
> >>> https://lkml.org/lkml/2014/12/5/223
> >>>=20
> >>> Any comments on this?
> >>
> >> The patch looks OK to me, it would be good though if someone else
> >> has confirmed it fixes the bug. I don't have any clock patches que=
ued
> >> at the moment. Perhaps you could apply it directly, Mike ?
> >
> > I confirm it fixes the boot hang in linux-next (next-20141210) on m=
y
> > exynos5800-peach-pi and exynos5420-arndale-octa.  Tested both
> > exynos_defconfig and multi_v7_defconfig.
> >
> > Tested-by: Kevin Hilman <khilman@linaro.org>
>=20
> What's the status of this patch?  linux-next is still broken for seve=
ral
> Exynos5 platforms without this fix.

I believe not only next is broken but also current mainline because
runtime PM for pl330 was merged yesterday...

The patch received two tested-bys (Kevin's and Javier's) and Sylwester'=
s
ack.

Mike, could you pick the patch and send it to Linus after rc1?

Best regards,
Krzysztof
