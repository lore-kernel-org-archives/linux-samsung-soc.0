From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] clk: let mxs specific clk-div clock type be a generic
 clock type
Date: Mon, 18 Mar 2013 11:34:05 +0100
Message-ID: <20130318103405.GA20530@pengutronix.de>
References: <1363438201-24938-1-git-send-email-thomas.abraham@linaro.org>
 <20130318084220.GB12462@S2101-09.ap.freescale.net>
 <CAJuYYwQ9nALy5T9-3m2q46ifHmUuHTsXHTL2VDUOMMFAeB36vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:33357 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750913Ab3CRKeN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Mar 2013 06:34:13 -0400
Content-Disposition: inline
In-Reply-To: <CAJuYYwQ9nALy5T9-3m2q46ifHmUuHTsXHTL2VDUOMMFAeB36vQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Shawn Guo <shawn.guo@linaro.org>, kgene.kim@samsung.com, mturquette@linaro.org, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, sylvester.nawrocki@gmail.com, linux-arm-kernel@lists.infradead.org

Hello,

On Mon, Mar 18, 2013 at 03:48:24PM +0530, Thomas Abraham wrote:
> On 18 March 2013 14:12, Shawn Guo <shawn.guo@linaro.org> wrote:
> > On Sat, Mar 16, 2013 at 06:20:01PM +0530, Thomas Abraham wrote:
> >> The mxs platform specific clk-div clock is an extended version of =
the
> >> basic integer divider clock type that supports checking the stabil=
ity
> >> status of the divider clock output. This type of clock is found on
> >> some of the Samsung platforms as well. So let the mxs specfic clk-=
div
> >> clock type be a generic clock type that all platforms can utilize.
> >>
> >> Cc: Shawn Guo <shawn.guo@linaro.org>
> >> Cc: Mike Turquette <mturquette@linaro.org>
> >> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> >> ---
> >>  drivers/clk/Makefile             |    1 +
> >>  drivers/clk/clk-divider-status.c |  119 +++++++++++++++++++++++++=
+++++++++++++
> >>  drivers/clk/mxs/Makefile         |    2 +-
> >>  drivers/clk/mxs/clk-div.c        |  110 -------------------------=
----------
> >>  drivers/clk/mxs/clk.h            |   12 +++-
> >>  include/linux/clk-provider.h     |   21 +++++++
> >>  6 files changed, 151 insertions(+), 114 deletions(-)
> >>  create mode 100644 drivers/clk/clk-divider-status.c
> >>  delete mode 100644 drivers/clk/mxs/clk-div.c
> >
> > From my quick testing, it seems working for mxs platform.  But it's=
 hard
> > to review the changes.  Making it two steps might be helpful for
> > reviewer:
> >
> > 1) git mv drivers/clk/mxs/clk-div.c drivers/clk/clk-divider-status.=
c
> > 2) make changes on drivers/clk/clk-divider-status.c
>=20
> Thanks Shawn for your comments. I will split this patch as you
> suggested and post again.
I didn't try to look at your patch, but maybe format-patch -M is enough
to make the patch easier to parse (for humans).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
