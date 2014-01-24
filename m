From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 4/5] ARM: S3C24XX: convert boards to use common restart function
Date: Fri, 24 Jan 2014 09:03:37 +0100
Message-ID: <1873916.c2IkPH5hCW@phil>
References: <3105326.uFdOVLyXH8@phil> <3955130.WSqWacB8SI@phil> <52E19931.80803@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:56587 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751147AbaAXIEM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jan 2014 03:04:12 -0500
In-Reply-To: <52E19931.80803@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

On Thursday 23 January 2014 23:35:29 Tomasz Figa wrote:
> On 23.01.2014 20:02, Heiko St=FCbner wrote:
> > Am Donnerstag, 23. Januar 2014, 19:51:34 schrieb Tomasz Figa:
> >> On 23.01.2014 19:36, Heiko St=FCbner wrote:
> > In general, I want to try establishing some sort of general restart=
 way,
> > as in the future one dt-board should hopefully be enough to cover a=
ll
> > s3c24xx soc variants.
>=20
> If you make SAMSUNG_WDT_RESET always selected on S3C24XX then I guess
> it's fine.
>=20
> >> Note that you can make the restart field NULL in mach_desc in boar=
d
> >> files.
> >=20
> > As I said above, this is mainly meant for the dt-case. The legacy-b=
oard
> > files are more or less only secondary, and the affected boards can =
of
> > course then have a NULL restart handle :-) .
> >=20
> > So for this the dt-board could simply use the wdt-reset, which then=
 gets
> > replaced by the ccf-based reset if appropriate.
>=20
> OK. By the way, are there any benefits of using this software reset o=
ver
> watchdog reset? Maybe all S3C24xx could simply use watchdog reset and=
 no
> special handling of those with swrst would be needed.

According to the manuals I looked at, all S3C24XX SoCs seem to support =
the=20
watchdog reset - I'm not sure why the swrst variant was choosen for the=
 newer=20
ones when they were added initially. So yes in theory all of them seem =
to be=20
able to use the watchdog reset.

But in any case the s3c2412 will need its own handling, due to the appa=
rent=20
clock problem during resets (mentioned in the code and the manuals of=20
s3c2412/s3c2413).


Heiko
