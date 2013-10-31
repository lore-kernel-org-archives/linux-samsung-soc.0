From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/1] dmaengine: s3c24xx-dma: use DMA_COMPLETE for dma completion status
Date: Thu, 31 Oct 2013 16:00:54 +0100
Message-ID: <201310311600.54556.heiko@sntech.de>
References: <1383196690-28307-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:44112 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755109Ab3JaPA7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Oct 2013 11:00:59 -0400
In-Reply-To: <1383196690-28307-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dan.j.williams@intel.com, kgene.kim@samsung.com, Vinod Koul <vinod.koul@intel.com>

Am Donnerstag, 31. Oktober 2013, 06:18:09 schrieb Sachin Kamat:
> Use the recently introduced DMA_COMPLETE instead of DMA_SUCCESS.
> Without this patch we get the following build error:
> drivers/dma/s3c24xx-dma.c: In function =E2=80=98s3c24xx_dma_tx_status=
=E2=80=99:
> drivers/dma/s3c24xx-dma.c:798:13: error: =E2=80=98DMA_SUCCESS=E2=80=99=
 undeclared
> (first use in this function)
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

thanks for the catch!

Acked-by: Heiko Stuebner <heiko@sntech.de>


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
ct
> dma_chan *chan,
>=20
>  	spin_lock_irqsave(&s3cchan->vc.lock, flags);
>  	ret =3D dma_cookie_status(chan, cookie, txstate);
> -	if (ret =3D=3D DMA_SUCCESS) {
> +	if (ret =3D=3D DMA_COMPLETE) {
>  		spin_unlock_irqrestore(&s3cchan->vc.lock, flags);
>  		return ret;
>  	}
