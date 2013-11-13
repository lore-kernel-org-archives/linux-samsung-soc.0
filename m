From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 1/1] dmaengine: s3c24xx-dma: use DMA_COMPLETE for dma
 completion status
Date: Wed, 13 Nov 2013 14:28:58 +0530
Message-ID: <20131113085858.GS8834@intel.com>
References: <1383196690-28307-1-git-send-email-sachin.kamat@linaro.org>
 <20131031134227.GH18788@intel.com>
 <086101cedf91$e2a1ce70$a7e56b50$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:62200 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759211Ab3KMJyk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Nov 2013 04:54:40 -0500
Content-Disposition: inline
In-Reply-To: <086101cedf91$e2a1ce70$a7e56b50$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, dmaengine@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dan.j.williams@intel.com, 'Heiko Stuebner' <heiko@sntech.de>

On Tue, Nov 12, 2013 at 07:28:10PM +0900, Kukjin Kim wrote:
> Vinod Koul wrote:
> >=20
> > On Thu, Oct 31, 2013 at 10:48:09AM +0530, Sachin Kamat wrote:
> > > Use the recently introduced DMA_COMPLETE instead of DMA_SUCCESS.
> > > Without this patch we get the following build error:
> > > drivers/dma/s3c24xx-dma.c: In function =E2=80=98s3c24xx_dma_tx_st=
atus=E2=80=99:
> > > drivers/dma/s3c24xx-dma.c:798:13: error: =E2=80=98DMA_SUCCESS=E2=80=
=99 undeclared
> > > (first use in this function)
> > I missed it because this is not in my tree! This needs to go thru k=
gene's
> > tree
> > and for that you can merge dma_complete branch from my tree. I will=
 not
> > rebase
> > that
> >=20
> > Acked-by: Vinod Koul <vinod.koul@intel.com>
> >=20
>=20
> Oops, I missed :(
>=20
> Vinod, since the s3c24xx-dma is in Linus' tree now, you can go ahead =
with my ack into your fixes.
>=20
> If you want me to take this into samsung tree, let me know :-)
Okay, I will apply this after merge window

--
~Vinod
>=20
> Thanks,
> Kukjin
>=20
> > --
> > ~Vinod
> > >
> > > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> > > Cc: Heiko Stuebner <heiko@sntech.de>
> > > Cc: Vinod Koul <vinod.koul@intel.com>
> > > ---
> > >  drivers/dma/s3c24xx-dma.c |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.=
c
> > > index 4cb127978636..085da4fe6613 100644
> > > --- a/drivers/dma/s3c24xx-dma.c
> > > +++ b/drivers/dma/s3c24xx-dma.c
> > > @@ -795,7 +795,7 @@ static enum dma_status s3c24xx_dma_tx_status(=
struct
> > dma_chan *chan,
> > >
> > >  	spin_lock_irqsave(&s3cchan->vc.lock, flags);
> > >  	ret =3D dma_cookie_status(chan, cookie, txstate);
> > > -	if (ret =3D=3D DMA_SUCCESS) {
> > > +	if (ret =3D=3D DMA_COMPLETE) {
> > >  		spin_unlock_irqrestore(&s3cchan->vc.lock, flags);
> > >  		return ret;
> > >  	}
> > > --
> > > 1.7.9.5
> > >
> >=20
> > --
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
