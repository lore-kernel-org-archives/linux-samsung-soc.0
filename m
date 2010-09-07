From: Ben Dooks <ben@simtec.co.uk>
Subject: Re: [PATCH 2/2] s3cmci: minor fixups
Date: Wed, 08 Sep 2010 00:15:40 +0100
Message-ID: <4C86C79C.1010205@simtec.co.uk>
References: <1283872143-32492-1-git-send-email-anarsoul@gmail.com> <1283872596-687-1-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hull.simtec.co.uk ([78.105.113.97]:33743 "EHLO
	preston.local.simtec.co.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750828Ab0IGXP7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Sep 2010 19:15:59 -0400
In-Reply-To: <1283872596-687-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Kleffel <tk@maintech.de>

On 07/09/10 16:16, Vasily Khoruzhick wrote:
> - It's not necessary to start DMA op manually, as we have
> autostart feature enabled
> - Restore prescaler before DMA operation, otherwise it
> takes ages to complete DMA op.
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/mmc/host/s3cmci.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/s3cmci.c b/drivers/mmc/host/s3cmci.c
> index 2e16e0a..5d1a8ed 100644
> --- a/drivers/mmc/host/s3cmci.c
> +++ b/drivers/mmc/host/s3cmci.c
> @@ -1106,6 +1106,8 @@ static int s3cmci_prepare_dma(struct s3cmci_host *host, struct mmc_data *data)
>  		    sg_dma_address(&data->sg[i]),
>  		    sg_dma_len(&data->sg[i]));
>  
> +		/* Restore prescaler value */
> +		writel(host->prescaler, host->base + S3C2410_SDIPRE);
>  		res = s3c2410_dma_enqueue(host->dma, host,
>  					  sg_dma_address(&data->sg[i]),
>  					  sg_dma_len(&data->sg[i]));
> @@ -1116,8 +1118,6 @@ static int s3cmci_prepare_dma(struct s3cmci_host *host, struct mmc_data *data)
>  		}
>  	}
>  
> -	s3c2410_dma_ctrl(host->dma, S3C2410_DMAOP_START);
> -
>  	return 0;
>  }

looks ok to me.
Acked-By: Ben Dooks <ben-linux@fluff.org>
