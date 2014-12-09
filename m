From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: samsung: Fix Exynos 5420 pinctrl setup and clock
 disable failure due to domain being gated
Date: Tue, 09 Dec 2014 14:18:19 +0100
Message-ID: <5486F69B.6020005@samsung.com>
References: <1417788934-23447-1-git-send-email-k.kozlowski@samsung.com>
 <1418129982.19339.6.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:9163 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756669AbaLINSj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Dec 2014 08:18:39 -0500
In-reply-to: <1418129982.19339.6.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mike Turquette <mturquette@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 09/12/14 13:59, Krzysztof Kozlowski wrote:
> On pi=C4=85, 2014-12-05 at 15:15 +0100, Krzysztof Kozlowski wrote:
>> > Audio subsystem clocks are located in separate block. On Exynos 54=
20 if
>> > clock for this block (from main clock domain) 'mau_epll' is gated =
then
>> > any read or write to audss registers will block.
>> >=20
>> > This kind of boot hang was observed on Arndale Octa and Peach Pi/P=
it
>> > after introducing runtime PM to pl330 DMA driver. After that commi=
t the
>> > 'mau_epll' was gated, because the "amba" clock was disabled and th=
ere
>> > were no more users of mau_epll.
>> >=20
>> > The system hang on one of steps:
>> > 1. Disabling unused clocks from audss block.
>> > 2. During audss GPIO setup (just before probing i2s0 because
>> >    samsung_pinmux_setup() tried to access memory from audss block =
which was
>> >    gated.
>> >=20
>> > Add a workaround for this by enabling the 'mau_epll' clock in prob=
e.
>> >=20
>> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> > ---
>> >  drivers/clk/samsung/clk-exynos-audss.c | 29 +++++++++++++++++++++=
+++++++-
>> >  1 file changed, 28 insertions(+), 1 deletion(-)
>
> Sorry for pinging so quick but merge window is open and it looks like
> booting Exynos542x boards will be broken (because pl330 will no longe=
r
> hold adma clock enabled so whole audss domain will be gated).
>=20
> This is a non-intrusive workaround for that issue, as wanted by
> Sylwester:
> https://lkml.org/lkml/2014/12/5/223
>=20
> Any comments on this?

The patch looks OK to me, it would be good though if someone else
has confirmed it fixes the bug. I don't have any clock patches queued
at the moment. Perhaps you could apply it directly, Mike ?

=46rom my side:

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

--=20
Thanks,
Sylwester
