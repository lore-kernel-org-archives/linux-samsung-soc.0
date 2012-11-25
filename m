From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] S3C24XX: add clockevent/clocksource support
Date: Sun, 25 Nov 2012 12:09:06 +0100
Message-ID: <193411211.XShBkCTZuh@flatron>
References: <50885608.1030503@openwide.fr> <110b01cdc922$82d683e0$88838ba0$%kim@samsung.com> <50B1887B.1090409@openwide.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:65292 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753061Ab2KYLJH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 Nov 2012 06:09:07 -0500
Received: by mail-ea0-f174.google.com with SMTP id e13so4051842eaa.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Nov 2012 03:09:05 -0800 (PST)
In-Reply-To: <50B1887B.1090409@openwide.fr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Romain Naour <romain.naour@openwide.fr>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Heiko =?ISO-8859-1?Q?St=FCbner=27?= <heiko@sntech.de>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

Hi Romain, Kgene,

On Sunday 25 of November 2012 03:54:51 Romain Naour wrote:
> Le 23/11/2012 03:30, Kukjin Kim a =E9crit :
> > Basically, looks good to me but need to edit commit message :-)
>=20
> I will correct that.
>=20
> > And since this touches many files so would be better if this could =
be
> > applied early -rc not now. It can provide more time to test for man=
y
> > boards. Is it ok to you?
>=20
> I'm ok :-)
>=20
> > Thanks.
> >=20
> > Best regards,
> > Kgene.
> > --
> > Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> > SW Solution Development Team, Samsung Electronics Co., Ltd.
>=20
> This patch was applied to 3.7-rc1 and tested only on s3c2440 (mini244=
0).
> I could re-apply this patch for the next 3.8-rc if you prefer.
>=20
> I proposed this patch because I need to have clockevent / clocksource
> support to use Xenomai or Linux-rt on mini2440.
>=20
> Since API clockevent/clocksource is enabled, we can use High Resoluti=
on
> Timer and Tickless mode. This can be interesting for the Linux side t=
oo.
>=20
> Most of the work is already done in s5p-time.c (renamed samsung-time.=
c).
> I add some #define for s3c24xx case.

I would also suggest splitting this huge patch into a series of several=
=20
smaller, possibly:
1) Rename s5p-time to samsung-time (and correct any platforms using it=20
currently)
2) Add samsung-time support for s3c24xx
3) Add samsung-time support for s3c64xx

What do you think?

Best regards,
Tomasz Figa
