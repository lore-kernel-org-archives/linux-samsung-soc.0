From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 1/1] dmaengine: s3c24xx-dma: use DMA_COMPLETE for dma
 completion status
Date: Tue, 12 Nov 2013 19:28:10 +0900
Message-ID: <086101cedf91$e2a1ce70$a7e56b50$@org>
References: <1383196690-28307-1-git-send-email-sachin.kamat@linaro.org>
 <20131031134227.GH18788@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16754 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751946Ab3KLK2M convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 05:28:12 -0500
In-reply-to: <20131031134227.GH18788@intel.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vinod Koul' <vinod.koul@intel.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dan.j.williams@intel.com, 'Heiko Stuebner' <heiko@sntech.de>

Vinod Koul wrote:
>=20
> On Thu, Oct 31, 2013 at 10:48:09AM +0530, Sachin Kamat wrote:
> > Use the recently introduced DMA_COMPLETE instead of DMA_SUCCESS.
> > Without this patch we get the following build error:
> > drivers/dma/s3c24xx-dma.c: In function =E2=80=98s3c24xx_dma_tx_stat=
us=E2=80=99:
> > drivers/dma/s3c24xx-dma.c:798:13: error: =E2=80=98DMA_SUCCESS=E2=80=
=99 undeclared
> > (first use in this function)
> I missed it because this is not in my tree! This needs to go thru kge=
ne's
> tree
> and for that you can merge dma_complete branch from my tree. I will n=
ot
> rebase
> that
>=20
> Acked-by: Vinod Koul <vinod.koul@intel.com>
>=20

Oops, I missed :(

Vinod, since the s3c24xx-dma is in Linus' tree now, you can go ahead wi=
th my ack into your fixes.

If you want me to take this into samsung tree, let me know :-)

Thanks,
Kukjin

> --
> ~Vinod
> >
> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Cc: Vinod Koul <vinod.koul@intel.com>
> > ---
> >  drivers/dma/s3c24xx-dma.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
> > index 4cb127978636..085da4fe6613 100644
> > --- a/drivers/dma/s3c24xx-dma.c
> > +++ b/drivers/dma/s3c24xx-dma.c
> > @@ -795,7 +795,7 @@ static enum dma_status s3c24xx_dma_tx_status(st=
ruct
> dma_chan *chan,
> >
> >  	spin_lock_irqsave(&s3cchan->vc.lock, flags);
> >  	ret =3D dma_cookie_status(chan, cookie, txstate);
> > -	if (ret =3D=3D DMA_SUCCESS) {
> > +	if (ret =3D=3D DMA_COMPLETE) {
> >  		spin_unlock_irqrestore(&s3cchan->vc.lock, flags);
> >  		return ret;
> >  	}
> > --
> > 1.7.9.5
> >
>=20
> --
