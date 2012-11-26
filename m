From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/2] ARM: S3C2443: Workaround for 2443 EXTINT error
Date: Mon, 26 Nov 2012 10:35:24 +0100
Message-ID: <201211261035.24976.heiko@sntech.de>
References: <1353919481-26074-1-git-send-email-fenixk19@mail.ru> <201211261012.58938.heiko@sntech.de> <50B33505.5070509@mail.ru>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:59095 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754585Ab2KZJf1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 04:35:27 -0500
In-Reply-To: <50B33505.5070509@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Varnin <fenixk19@mail.ru>
Cc: linux-samsung-soc@vger.kernel.org

Am Montag, 26. November 2012, 10:23:17 schrieb Alexander Varnin:
> Is it ok, to send only one last patch after changes, without the one,
> who make macro?

I'd think so, as this series isn't this big. Just include a version int=
o the=20
patch subject, i.e.

	[PATCH v2 2/2] ARM: S3C2443: Workaround for 2443 EXTINT error

to denote the most recent version and include a short summary of the ch=
anges=20
_after_ the "---" of the main commit message.


> 26.11.2012 13:12, Heiko St=C3=BCbner =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hi Alexander,
> >=20
> > I think this patch needs a bit more love :-) .
> >=20
> > Please run scripts/checkpatch.pl on it and fix all the reported pro=
blems.
> >=20
> > And I'd change the comment to something like:
> >=20
> > /*
> >=20
> >   * S3C2443 CPU has a problem with EXTINTn registers.
> >   * Essentially register-reads return transformed data, but the wri=
te
> >   * is done according to the datasheet.
> >   *
> >   * Fix this by transforming the read data to the correct format.
> >   *
> >   * For details refer to the document "S3C2443 GUIDE TO EXTRA GPIO"
> >   */
> >=20
> > Especially the mail address does not need to be in the code - the g=
it
> > history preserves the committer identity quite well.
> >=20
> >=20
> > Heiko
> >=20
> > Am Montag, 26. November 2012, 09:44:41 schrieb Alexander Varnin:
> >> S3C2443 CPU has a problem with incorrect reading from EXTINTn
> >> registers. So s3c_irqext_type function wrongly modifies them.
> >> So add special check to s3c_irqext_type, to handle this case.
> >>=20
> >> Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
> >> ---
> >>=20
> >>   arch/arm/plat-s3c24xx/irq.c |   26 ++++++++++++++++++++++++++
> >>   1 files changed, 26 insertions(+), 0 deletions(-)
> >>=20
> >> diff --git a/arch/arm/plat-s3c24xx/irq.c b/arch/arm/plat-s3c24xx/i=
rq.c
> >> index fe57bbb..ed19996 100644
> >> --- a/arch/arm/plat-s3c24xx/irq.c
> >> +++ b/arch/arm/plat-s3c24xx/irq.c
> >> @@ -219,6 +219,32 @@ s3c_irqext_type(struct irq_data *data, unsign=
ed int
> >> type) }
> >>=20
> >>   	value =3D __raw_readl(extint_reg);
> >>=20
> >> +
> >> +	/*
> >> +	* S3C2443 CPU has a problem with EXTINTn registers.
> >> +	* Essentially register-reads returned transformed data, but the =
write
> >> +	* is done according to the datasheet.
> >> +	*
> >> +	* There is hack introduced for 2443 error workaround.
> >> +	*
> >> +	* For detais refer to the document "S3C2443 GUIDE TO EXTRA GPIO"=
=20
found
> >> on the web. +	*
> >> +	* A. Varnin <fenixk19@mail.ru>
> >> +	*/
> >> +	if(soc_is_s3c2443())
> >> +	{
> >> +	    	int i;
> >> +		int fixed =3D 0;
> >> +		if(extint_reg =3D=3D S3C24XX_EXTINT1 || extint_reg =3D=3D=20
S3C24XX_EXTINT2)
> >> +			for(i=3D0; i<7;i++)
> >> +		    		fixed |=3D (((value >> ((7-i)*4+1)) & 7) | ((value >> ((7=
-
> >=20
> > i)*4-3)) &
> >=20
> >> 8)) << i*4; +		else
> >> +			for(i=3D0; i<7;i++)
> >> +		    		fixed |=3D ( (value >> (7-i)*4) & 0xf )  << i*4;
> >> +		fixed |=3D (((value>>1) & 7) | ((value<<3) & 8)) << 27;
> >> +		value =3D fixed;
> >> +	}
> >> +
> >>=20
> >>   	value =3D (value & ~(7 << extint_offset)) | (newvalue <<
> >>   	extint_offset); __raw_writel(value, extint_reg);
