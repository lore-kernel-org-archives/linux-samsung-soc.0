From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 1/6] clk: samsung: move common plls registration into separate function
Date: Thu, 11 Jul 2013 10:52:13 +0200
Message-ID: <201307111052.13618.heiko@sntech.de>
References: <201307100057.06061.heiko@sntech.de> <CAKew6eUPBUZj4TuhNAjp6NitFUaeFBZscr_jqU3Y_wLi1m7Ekg@mail.gmail.com> <1874409.iWz7oWBuYA@thinkpad>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:33509 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755850Ab3GKIwU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jul 2013 04:52:20 -0400
In-Reply-To: <1874409.iWz7oWBuYA@thinkpad>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Yadwinder Singh Brar <yadi.brar01@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, Russell King <linux@arm.linux.org.uk>

Am Donnerstag, 11. Juli 2013, 09:46:53 schrieb Tomasz Figa:
> Hi,
>=20
> On Wednesday 10 of July 2013 22:29:13 Yadwinder Singh Brar wrote:
> > Hi Heiko,
> >=20
> > On Wed, Jul 10, 2013 at 4:27 AM, Heiko St=FCbner <heiko@sntech.de> =
wrote:
> > > All Samsung PLLs use similar code to register the clocks and clkd=
ev
> > > lookups. Therefore move these into a separate function to reduce =
code
> > > duplication.
> > >=20
> > > Suggested-by: Russell King <linux@arm.linux.org.uk>
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > ---
> >=20
> > I have posted patch for adding common pll registration function
> > which some how missed to get merged. I hope will get merged after r=
c1.
> > Please give a look at that :
> > http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg19=
543.ht
> > ml
>=20
> Yeah, I was going to post a link to it, but I couldn't find it on any
> mailing list archive. I think we should go with the way of registrati=
on
> introduced by Yadwinder.

the linked patch looks nice, thanks for the link. So I'll redo the plls=
=20
against it in the next round.


Heiko
