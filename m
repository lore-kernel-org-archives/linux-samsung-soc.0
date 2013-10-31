From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 1/1] dmaengine: s3c24xx-dma: use DMA_COMPLETE for dma
 completion status
Date: Thu, 31 Oct 2013 19:12:27 +0530
Message-ID: <20131031134227.GH18788@intel.com>
References: <1383196690-28307-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:48430 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753658Ab3JaOhE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Oct 2013 10:37:04 -0400
Content-Disposition: inline
In-Reply-To: <1383196690-28307-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dan.j.williams@intel.com, kgene.kim@samsung.com, Heiko Stuebner <heiko@sntech.de>

On Thu, Oct 31, 2013 at 10:48:09AM +0530, Sachin Kamat wrote:
> Use the recently introduced DMA_COMPLETE instead of DMA_SUCCESS.
> Without this patch we get the following build error:
> drivers/dma/s3c24xx-dma.c: In function =E2=80=98s3c24xx_dma_tx_status=
=E2=80=99:
> drivers/dma/s3c24xx-dma.c:798:13: error: =E2=80=98DMA_SUCCESS=E2=80=99=
 undeclared
> (first use in this function)
I missed it because this is not in my tree! This needs to go thru kgene=
's tree
and for that you can merge dma_complete branch from my tree. I will not=
 rebase
that

Acked-by: Vinod Koul <vinod.koul@intel.com>

--
~Vinod
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Vinod Koul <vinod.koul@intel.com>
> ---
>  drivers/dma/s3c24xx-dma.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
> index 4cb127978636..085da4fe6613 100644
> --- a/drivers/dma/s3c24xx-dma.c
> +++ b/drivers/dma/s3c24xx-dma.c
> @@ -795,7 +795,7 @@ static enum dma_status s3c24xx_dma_tx_status(stru=
ct dma_chan *chan,
> =20
>  	spin_lock_irqsave(&s3cchan->vc.lock, flags);
>  	ret =3D dma_cookie_status(chan, cookie, txstate);
> -	if (ret =3D=3D DMA_SUCCESS) {
> +	if (ret =3D=3D DMA_COMPLETE) {
>  		spin_unlock_irqrestore(&s3cchan->vc.lock, flags);
>  		return ret;
>  	}
> --=20
> 1.7.9.5
>=20

--=20
