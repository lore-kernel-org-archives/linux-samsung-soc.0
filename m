From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2] dmaengine: s3c24xx: Add dma_slave_map for s3c2440
 devices
Date: Fri, 16 Sep 2016 13:00:12 +0200
Message-ID: <b8d6e8a9-4807-0dc0-95c8-a4aca89f18e7@samsung.com>
References: <CGME20160915194202eucas1p2fa3c4d1c9713e3713f956e1b114e1525@eucas1p2.samsung.com>
 <1473968506-4150-1-git-send-email-sam.van.den.berge@telenet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:45743 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932447AbcIPLAS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 07:00:18 -0400
In-reply-to: <1473968506-4150-1-git-send-email-sam.van.den.berge@telenet.be>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sam Van Den Berge <sam.van.den.berge@telenet.be>
Cc: vinod.koul@intel.com, dmaengine@vger.kernel.org, k.kozlowski@samsung.com, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/15/2016 09:41 PM, Sam Van Den Berge wrote:
> @@ -445,10 +446,44 @@ static struct s3c24xx_dma_channel s3c2440_dma_channels[DMACH_MAX] = {
>  	[DMACH_USB_EP4] = { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(4, 3), },
>  };
>  
> +static const struct dma_slave_map s3c2440_dma_slave_map[] = {
> +	/* TODO: DMACH_XD0 */
> +	/* TODO: DMACH_XD1 */
> +	{ "3c2440-sdi", "rx-tx", (void *)DMACH_SDI },

Thanks for the patch, still device name needs to be changed here
to "s3c2440-sdi".

--
Regards,
Sylwester
