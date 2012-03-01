From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3] S3C24XX DMA resume regression fix
Date: Thu, 01 Mar 2012 13:26:18 +0900
Message-ID: <076e01ccf763$72eefe30$58ccfa90$%kim@samsung.com>
References: <1330087227-10450-1-git-send-email-dron0gus@gmail.com>
 <201202241417.24652.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40640 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757339Ab2CAE0V convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 23:26:21 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M0600BDQUZVAZA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 13:26:19 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M0600AV1UZUFB60@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 13:26:19 +0900 (KST)
In-reply-to: <201202241417.24652.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Gusakov Andrey' <dron0gus@gmail.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
>=20
> Am Freitag, 24. Februar 2012, 13:40:27 schrieb Gusakov Andrey:
> > s3c2410_dma_suspend suspends channels from 0 to dma_channels.
> > s3c2410_dma_resume resumes channels in reverse order. So
> > pointer should be decremented insted of being incremented.
> > ---
> >  arch/arm/plat-s3c24xx/dma.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/arch/arm/plat-s3c24xx/dma.c b/arch/arm/plat-s3c24xx/dm=
a.c
> > index 57abec9..16510d5 100644
> > --- a/arch/arm/plat-s3c24xx/dma.c
> > +++ b/arch/arm/plat-s3c24xx/dma.c
> > @@ -1249,7 +1249,7 @@ static void s3c2410_dma_resume(void)
> >  	struct s3c2410_dma_chan *cp =3D s3c2410_chans + dma_channels - 1;
> >  	int channel;
> >
> > -	for (channel =3D dma_channels - 1; channel >=3D 0; cp++, channel-=
-)
> > +	for (channel =3D dma_channels - 1; channel >=3D 0; cp--, channel-=
-)
> >  		s3c2410_dma_resume_chan(cp);
> >  }
>=20
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>=20
> it's interesting, that this is broken since april 2011, so I guess it=
's
> time
> to fix it :-)

Yes, absolutely. Will apply and send this with other fixes before 3.3
release.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
