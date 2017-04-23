From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 1/2] dmaengine: s3c24xx: Use devm_kcalloc() in
 s3c24xx_dma_probe()
Date: Sun, 23 Apr 2017 11:59:05 +0200
Message-ID: <f1257887-ca14-6415-b1ff-d57190a1810f@math.uni-bielefeld.de>
References: <930f0a6c-bc5c-3d01-6814-563780fc90ef@users.sourceforge.net>
 <9c10b823-f49b-8c73-2bf8-0fd2b0ba0231@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47041 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1044728AbdDWJ7O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Apr 2017 05:59:14 -0400
In-Reply-To: <9c10b823-f49b-8c73-2bf8-0fd2b0ba0231@users.sourceforge.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hello Markus,


SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 22 Apr 2017 23:00:23 +0200
> 
> * A multiplication for the size determination of a memory allocation
>   indicated that an array data structure should be processed.
>   Thus use the corresponding function "devm_kcalloc".
I have trouble parsing that sentences. This looks like the typical
approach of native german speakers to directly transfer sentence
constructions from German to English. Which, in most cases, doesn't work
or is just plain confusing.

With best wishes,
Tobias


> * Replace the specification of a data structure by a pointer dereference
>   to make the corresponding size determination a bit safer according to
>   the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/dma/s3c24xx-dma.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
> index f04c4702d98b..967229829683 100644
> --- a/drivers/dma/s3c24xx-dma.c
> +++ b/drivers/dma/s3c24xx-dma.c
> @@ -1216,10 +1216,10 @@ static int s3c24xx_dma_probe(struct platform_device *pdev)
>  	if (IS_ERR(s3cdma->base))
>  		return PTR_ERR(s3cdma->base);
>  
> -	s3cdma->phy_chans = devm_kzalloc(&pdev->dev,
> -					      sizeof(struct s3c24xx_dma_phy) *
> -							pdata->num_phy_channels,
> -					      GFP_KERNEL);
> +	s3cdma->phy_chans = devm_kcalloc(&pdev->dev,
> +					 pdata->num_phy_channels,
> +					 sizeof(*s3cdma->phy_chans),
> +					 GFP_KERNEL);
>  	if (!s3cdma->phy_chans)
>  		return -ENOMEM;
>  
> 
