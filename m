From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] ASoC: AC97: S3C: Add controller driver
Date: Tue, 26 Jan 2010 13:00:57 +0000
Message-ID: <20100126130057.GS15759@rakim.wolfsonmicro.main>
References: <1264485101-13782-1-git-send-email-jassisinghbrar@gmail.com>
 <1264485101-13782-2-git-send-email-jassisinghbrar@gmail.com>
 <20100126104723.GF15759@rakim.wolfsonmicro.main>
 <1b68c6791001260317k44893521vc0310ea35bac8ee1@mail.gmail.com>
 <20100126115258.GM15759@rakim.wolfsonmicro.main>
 <1b68c6791001260411u2b39d8actf35a0f3541fda92d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:48500 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751913Ab0AZNA7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2010 08:00:59 -0500
Content-Disposition: inline
In-Reply-To: <1b68c6791001260411u2b39d8actf35a0f3541fda92d@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, lrg@slimlogic.co.uk, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Tue, Jan 26, 2010 at 09:11:55PM +0900, jassi brar wrote:
> On Tue, Jan 26, 2010 at 8:52 PM, Mark Brown

> > That's not addressing the problem, though - the big issue is not
> > bringing up the AC97 link, it's the fact that you're doing an
> > uncontrolled cold reset. =A0If we hit this code path it'll revert t=
he
> > device registers to default which will upset the drivers for the CO=
DEC
> > rather badly. =A0There should be no possibility of that happening, =
if it
> > is happening it's something that callers really should know about.

> It should never be reached after the link is up and running. Only if =
something
> goes wrong at runtime, would the controller state be changed. And
> this is an attempt to recover from that failure. If the upper layer s=
hould
> know of such failure, then maybe we should not do it.
> I have never seen such runtime error though.

Sounds like the code should be changed to log and return an error if
that case is hit?

>=20
> >> >> + =A0 =A0 ac_glbctrl =3D S3C_AC97_GLBCTRL_ACLINKON;
> >> >> + =A0 =A0 writel(ac_glbctrl, s3c_ac97.regs + S3C_AC97_GLBCTRL);
> >> >> + =A0 =A0 msleep(1);

=2E..

> I assume the ALSA definition of cold/warm reset is same as that of
> the AC97 controller. Anything remaining should be done only when nece=
ssary.
> For ex, the ALSA might want to leave controller after just cold/warm
> reset ... as
> the SoC manual says it's in low-power mode without the AC-link on.

A warm reset pretty much means "start the AC-link" - it's what you do t=
o
exit low power mode and start clocking the link (which is mastered by
the CODEC), it doesn't have any other effect.  That's a big part of why
this is confusing, I'd expect a warm reset would also do any setup on
the controller side that was needed to cope with the clock restarting.

Due to the way AC97 is structured this stuff is all shared between the
controller and the CODECs on the bus.  It's not particularly pretty fro=
m
a software point of view at the minute.
