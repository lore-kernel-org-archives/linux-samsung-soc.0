From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3] S3C24XX DMA resume regression fix
Date: Thu, 01 Mar 2012 13:55:12 +0900
Message-ID: <077201ccf767$7c6d1ec0$75475c40$%kim@samsung.com>
References: <1330087227-10450-1-git-send-email-dron0gus@gmail.com>
 <201202241417.24652.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44801 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752255Ab2CAEzR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 23:55:17 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M06002YDWBUYF80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 13:55:13 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M060016DWC0V040@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 13:55:13 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Gusakov Andrey' <dron0gus@gmail.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Kukjin Kim wrote:
>=20
> Heiko St=FCbner wrote:
> >
> > Am Freitag, 24. Februar 2012, 13:40:27 schrieb Gusakov Andrey:

It's preferred that "ARM: S3C24XX: ..." in title.

> > > s3c2410_dma_suspend suspends channels from 0 to dma_channels.
> > > s3c2410_dma_resume resumes channels in reverse order. So
> > > pointer should be decremented insted of being incremented.

=2E..decremented instead of...?

BTW, where is sign? Since it's very important, needs Gusakov's reply or
re-sending with his sign.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


> > > ---
> > >  arch/arm/plat-s3c24xx/dma.c |    2 +-
> > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > >
> > > diff --git a/arch/arm/plat-s3c24xx/dma.c b/arch/arm/plat-s3c24xx/=
dma.c
> > > index 57abec9..16510d5 100644
> > > --- a/arch/arm/plat-s3c24xx/dma.c
> > > +++ b/arch/arm/plat-s3c24xx/dma.c
> > > @@ -1249,7 +1249,7 @@ static void s3c2410_dma_resume(void)
> > >  	struct s3c2410_dma_chan *cp =3D s3c2410_chans + dma_channels - =
1;
> > >  	int channel;
> > >
> > > -	for (channel =3D dma_channels - 1; channel >=3D 0; cp++, channe=
l--)
> > > +	for (channel =3D dma_channels - 1; channel >=3D 0; cp--, channe=
l--)
> > >  		s3c2410_dma_resume_chan(cp);
> > >  }
> >
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> >
> > it's interesting, that this is broken since april 2011, so I guess =
it's
> > time
> > to fix it :-)
>=20
> Yes, absolutely. Will apply and send this with other fixes before 3.3
> release.
>=20
> Thanks.
>=20
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
