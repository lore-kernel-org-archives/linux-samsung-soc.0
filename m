From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V2 12/12] ASoC: Samsung: Update DMA interface
Date: Thu, 14 Jul 2011 08:57:11 +0900
Message-ID: <20110713235709.GE9770@opensource.wolfsonmicro.com>
References: <1310546857-6304-1-git-send-email-kgene.kim@samsung.com>
 <1310546857-6304-13-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:46929 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752536Ab1GMX5S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Jul 2011 19:57:18 -0400
Content-Disposition: inline
In-Reply-To: <1310546857-6304-13-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lrg@ti.com>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, Boojin Kim <boojin.kim@samsung.com>

On Wed, Jul 13, 2011 at 05:47:37PM +0900, Kukjin Kim wrote:

> -static inline bool s3c_dma_has_circular(void)
> +static inline bool dma_has_circular(void)
>  {
>  	return false;
>  }

The namespacing here doesn't look great, this is still a Samsung
specific internal API.

Otherwise this looks good.
