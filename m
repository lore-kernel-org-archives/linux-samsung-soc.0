From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 1/6] clk: samsung: move common plls registration into separate
 function
Date: Fri, 02 Aug 2013 14:35:16 -0700
Message-ID: <20130802213516.6450.7848@quantum>
References: <201307100057.06061.heiko@sntech.de>
 <CAKew6eUPBUZj4TuhNAjp6NitFUaeFBZscr_jqU3Y_wLi1m7Ekg@mail.gmail.com>
 <1874409.iWz7oWBuYA@thinkpad> <201307111052.13618.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:59782 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753659Ab3HBVfU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Aug 2013 17:35:20 -0400
Received: by mail-pb0-f45.google.com with SMTP id mc17so1139870pbc.32
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Aug 2013 14:35:19 -0700 (PDT)
In-Reply-To: <201307111052.13618.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Yadwinder Singh Brar <yadi.brar01@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, Russell King <linux@arm.linux.org.uk>

Quoting Heiko St=C3=BCbner (2013-07-11 01:52:13)
> Am Donnerstag, 11. Juli 2013, 09:46:53 schrieb Tomasz Figa:
> > Hi,
> >=20
> > On Wednesday 10 of July 2013 22:29:13 Yadwinder Singh Brar wrote:
> > > Hi Heiko,
> > >=20
> > > On Wed, Jul 10, 2013 at 4:27 AM, Heiko St=C3=BCbner <heiko@sntech=
=2Ede> wrote:
> > > > All Samsung PLLs use similar code to register the clocks and cl=
kdev
> > > > lookups. Therefore move these into a separate function to reduc=
e code
> > > > duplication.
> > > >=20
> > > > Suggested-by: Russell King <linux@arm.linux.org.uk>
> > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > > ---
> > >=20
> > > I have posted patch for adding common pll registration function
> > > which some how missed to get merged. I hope will get merged after=
 rc1.
> > > Please give a look at that :
> > > http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg=
19543.ht
> > > ml
> >=20
> > Yeah, I was going to post a link to it, but I couldn't find it on a=
ny
> > mailing list archive. I think we should go with the way of registra=
tion
> > introduced by Yadwinder.
>=20
> the linked patch looks nice, thanks for the link. So I'll redo the pl=
ls=20
> against it in the next round.

I just took that series into clk-next, so you can base v2 of this serie=
s
against clk-next.

Regards,
Mike

>=20
>=20
> Heiko
