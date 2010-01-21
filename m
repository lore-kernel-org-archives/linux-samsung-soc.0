From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] ARM: S3C64XX: Fix typo in s3c-hsotg platform data
Date: Thu, 21 Jan 2010 01:43:58 +0000
Message-ID: <20100121014358.GX10014@trinity.fluff.org>
References: <b2e8f9f71001201637ua278aa2v56c313d605aa7d13@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:49725 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751547Ab0AUBn7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2010 20:43:59 -0500
Content-Disposition: inline
In-Reply-To: <b2e8f9f71001201637ua278aa2v56c313d605aa7d13@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>

On Thu, Jan 21, 2010 at 01:37:28AM +0100, Maurus Cuelenaere wrote:
> ARM: S3C64XX: Fix typo in s3c-hsotg platform data

applied to next-samsung-s3c64xx2, will merge into next-samsung.
 
> Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
> ---
>  arch/arm/plat-s3c/include/plat/udc-hs.h |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/plat-s3c/include/plat/udc-hs.h
> b/arch/arm/plat-s3c/include/plat/udc-hs.h
> index dd04db0..a22a4f2 100644
> --- a/arch/arm/plat-s3c/include/plat/udc-hs.h
> +++ b/arch/arm/plat-s3c/include/plat/udc-hs.h
> @@ -12,7 +12,7 @@
>   * published by the Free Software Foundation.
>  */
> 
> -enum s3c_hostg_dmamode {
> +enum s3c_hsotg_dmamode {
>  	S3C_HSOTG_DMA_NONE,	/* do not use DMA at-all */
>  	S3C_HSOTG_DMA_ONLY,	/* always use DMA */
>  	S3C_HSOTG_DMA_DRV,	/* DMA is chosen by driver */
> @@ -24,6 +24,6 @@ enum s3c_hostg_dmamode {
>   * @is_osc: The clock source is an oscillator, not a crystal
>   */
>  struct s3c_hsotg_plat {
> -	enum s3c_hostg_dmamode	dma;
> +	enum s3c_hsotg_dmamode	dma;
>  	unsigned int		is_osc : 1;
>  };
> -- 
> 1.6.6

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
