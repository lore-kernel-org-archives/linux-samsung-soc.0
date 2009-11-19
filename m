From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 09/19] drivers: serial: add support for Samsung S5PC110
	SoC uart
Date: Thu, 19 Nov 2009 11:38:41 +0000
Message-ID: <20091119113841.GJ13376@n2100.arm.linux.org.uk>
References: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com> <1258551194-16018-10-git-send-email-m.szyprowski@samsung.com> <1b68c6790911180614y355f656fs828177ecc845ec8e@mail.gmail.com> <20091118221345.GB4808@trinity.fluff.org> <1b68c6790911181844p3fb32525h11f79f942afb2d64@mail.gmail.com> <20091119103336.GB15460@sirena.org.uk> <1b68c6790911190305w33e777e3n1ed6b172d67f1639@mail.gmail.com> <20091119110827.GE9763@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:48983 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716AbZKSLiy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2009 06:38:54 -0500
Content-Disposition: inline
In-Reply-To: <20091119110827.GE9763@rakim.wolfsonmicro.main>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: jassi brar <jassisinghbrar@gmail.com>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Thu, Nov 19, 2009 at 11:08:27AM +0000, Mark Brown wrote:
> On Thu, Nov 19, 2009 at 08:05:29PM +0900, jassi brar wrote:
> > On Thu, Nov 19, 2009 at 7:33 PM, Mark Brown
>=20
> > > This is going to set off warnings from a clock API point of view =
-
> > > passing clock names around in platform data is usually a sign tha=
t
> > > something is very wrong. =A0Keeping the mapping inside the clock =
API
> > > (still controlled by the board driver but by telling the clock AP=
I that
> > > device X should use clock Y).
>=20
> > no clock pointer needs to be passed, just a pointer to an array of =
_strings_
> > There is no need to even include any clock header in platform code
> > for the purpose.
>=20
> Yes, that's what I was commenting on - like I say, passing clock name=
s
> tends to set off the same alarm bells as passing a struct clk.  Like =
I
> say, the general model for this has been that the fixups will be done=
 by
> having the machine code talk to the clock API ratehr than bouncing th=
e
> data about the clock to use through the driver.

I'm not sure what you're commenting on precisely, but the Samsung code =
as
a whole doesn't use the clk API very well, and I suspect that is starti=
ng
to cause people to have to pass clock names around.

I've tried to persuade Ben to tidy this up and convert over to clkdev
before it becomes too big a problem, but I've had little success.  I
suspect it's now grown too big to be tackled sanely.
