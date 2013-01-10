From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/5 v3]  S3C / S5PC100: add clockevent/clocksource support
Date: Wed, 09 Jan 2013 16:48:22 -0800
Message-ID: <00b901cdeecc$3255b830$97012890$@samsung.com>
References: <50885608.1030503@openwide.fr> <6825637.7rn5o5FT8e@flatron>
 <50EDF297.4020908@openwide.fr> <201301100137.13695.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:13420 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932487Ab3AJAsg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 19:48:36 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGD00FAFWW3C8D0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Jan 2013 09:48:34 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGD003QMWWWDP00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Jan 2013 09:48:34 +0900 (KST)
In-reply-to: <201301100137.13695.heiko@sntech.de>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Romain Naour' <romain.naour@openwide.fr>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

Heiko St=FCbner wrote:
>=20
> Am Mittwoch, 9. Januar 2013, 23:43:35 schrieb Romain Naour:
> > This series of patches converts the s3c and s5pc100 timer driver to=
 the
> > clocksource/clockevent API. I made some test on a mini2440 board an=
d I
> had
> > to reduce timers frequency to 1MHz in order to produce a timer's
overflow
> > every 64ms. Initial timer's frequency (8,45MHz) provide only 7ms be=
tween
> > each overflow. It is not enough. As timers were previously used to
produce
> > an IRQ at 200Hz, some board (Osiris, Anubis board) use an external =
12MHz
> > signal to clock the timers (tclk1). So, I changed their configurati=
on to
> > select internal pclk clock instead, but I can't test it.
> >
> > Since clockevent/clocksource API becomes available, we can use High
> > Resolution Timer and Tickless mode.
> >
> > Most of the work is already done in s5p-time.c (renamed samsung-tim=
e.c).
> > I added some #define for s3c24xx and s5pc100 case.
>=20
> not sure, if the ack I added to the previous patches will carry thru,=
 so:
>=20
> The whole series
>=20
> Acked-by: Heiko Stuebner <heiko@sntech.de>
>=20
> and tested on a s3c2416 based machine, so
>=20
> Tested-by: Heiko Stuebner <heiko@sntech.de>
>=20
Thanks for your review and test on s3c2416 board :-)

- Kukjin
