From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: SAMSUNG: remove obsolete tick.h
Date: Wed, 12 Feb 2014 01:21:38 +0100
Message-ID: <1570984.izKrWRrZLR@phil>
References: <1907750.XQ1uIOEDlS@phil> <093801cf0ddc$6f8fe060$4eafa120$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:54810 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750978AbaBLAWb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 19:22:31 -0500
In-Reply-To: <093801cf0ddc$6f8fe060$4eafa120$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Freitag, 10. Januar 2014, 17:17:43 schrieb kgene@kernel.org:
> Heiko St=FCbner wrote:
> > Commit 48cf83dc12f2 (ARM: samsung: remove unused tick.h) removed so=
me
> > occurences of tick.h. tick.h itself and s3c24xx_ostimer_pending was=
 only
> > used by the old timer driver and is not used anymore.
> >=20
> > Therefore remove the last 3 occurences.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >=20
> >  arch/arm/mach-s3c24xx/include/mach/tick.h |   15 --------------
> >  arch/arm/mach-s3c64xx/include/mach/tick.h |   31
>=20
> -------------------------
>=20
> > ----
> >=20
> >  arch/arm/mach-s5pc100/include/mach/tick.h |   31
>=20
> -------------------------
>=20
> > ----
> >=20
> >  3 files changed, 77 deletions(-)
> >  delete mode 100644 arch/arm/mach-s3c24xx/include/mach/tick.h
> >  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/tick.h
> >  delete mode 100644 arch/arm/mach-s5pc100/include/mach/tick.h
>=20
> Nice cleanup :-)
>=20
> Applied, thanks,

did this make its way into your tree? Because as of now I can't see it =
in the=20
linux-samsung.git.


Thanks
Heiko
