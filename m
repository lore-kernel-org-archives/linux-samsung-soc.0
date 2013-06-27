From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: Broken IRQ handling for S3C2416
Date: Thu, 27 Jun 2013 16:51:45 +0200
Message-ID: <201306271651.45522.heiko@sntech.de>
References: <51CC290B.5080701@inov.pt> <201306271626.42419.heiko@sntech.de> <51CC50B0.2090308@inov.pt>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:55131 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751869Ab3F0Ovt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Jun 2013 10:51:49 -0400
In-Reply-To: <51CC50B0.2090308@inov.pt>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?q?Jos=E9_Miguel_Gon=E7alves?= <jose.goncalves@inov.pt>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

Am Donnerstag, 27. Juni 2013, 16:48:16 schrieb Jos=E9 Miguel Gon=E7alve=
s:
> Hi Heiko,
>=20
> On 27-06-2013 15:26, Heiko St=FCbner wrote:
> > Hi Jose,
> >=20
> > Am Donnerstag, 27. Juni 2013, 13:59:07 schrieb Jos=E9 Miguel Gon=E7=
alves:
> >> Hi,
> >>=20
> >> While migrating from kernel 3.8 to kernel 3.9 I've detected a prob=
lem on
> >> my S3C2416 based board. I'm using UART 3 as console and with kerne=
l 3.9
> >> I'm unable to have a getty working on that port and see a lot of t=
hese
> >> on dmesg:
> >>=20
> >> samsung-uart s3c2440-uart.3: cannot get irq 94
> >>=20
> >> Also WDT is not correctly initialized in 3.8, I see in dmesg:
> >>=20
> >> s3c2410-wdt s3c2410-wdt: watchdog inactive, reset disabled, irq di=
sabled
> >>=20
> >> while in 3.9 I see:
> >>=20
> >> s3c2410-wdt s3c2410-wdt: tmr_margin value out of range, default 15=
 used
> >> s3c2410-wdt s3c2410-wdt: failed to install irq (-38)
> >> s3c2410-wdt: probe of s3c2410-wdt failed with error -38
> >>=20
> >> So I guess something is broken in 3.9 kernel's IRQ handling for S3=
C2416.
> >=20
> > when I checked two days ago, the irqs where working fine on my s3c2=
416
> > board.
> >=20
> > Basic questions, did you change the init_irq callback to the correc=
t new
> > function (s3c2416_init_irq) in your board file, can you provide a m=
ore
> > complete log and of course and is your board-file available somewhe=
re?
>=20
> My bad! I missed that change on the init_irq callback. Everything is
> working fine now. Thank you and sorry for the inconvenience.

no problem, glad I could help :-)


Heiko
