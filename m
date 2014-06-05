From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [alsa-devel] [PATCH 1/2] [RFC] ASoC: samsung: move s3c24xx over
 to dmaengine
Date: Thu, 05 Jun 2014 15:29:21 +0200
Message-ID: <539070B1.8070404@metafoo.de>
References: <6123933.aGtaUr149J@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp-out-087.synserver.de ([212.40.185.87]:1121 "EHLO
	smtp-out-087.synserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751000AbaFEN31 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jun 2014 09:29:27 -0400
In-Reply-To: <6123933.aGtaUr149J@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Sangbeom Kim <sbkim73@samsung.com>, lgirdwood@gmail.com, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, Vasily Khoruzhick <anarsoul@gmail.com>

On 06/05/2014 03:20 PM, Arnd Bergmann wrote:
> The s3c24xx sound support keeps giving randconfig build errors, this
> is a new attempt to solve it by moving the driver over to use dmaengine
> exclusively.
>
> The removal of the legacy DMA support and the addition of the
> s3c24xx_dma_filter pointer are fairly obvious here. The part I'm not
> completely sure about is the removal of the s3c2410_dma_ctrl(...,
> S3C2410_DMAOP_STARTED) and dma_data->ops->started() calls. My understanding
> is that these are only required for drivers that do not support cyclic
> transfers, which the new dma engine driver now does, so we can simply
> remove them. This would also fix at least one bug in the ac97 driver
> on newer machines, which currently gives us a NULL pointer dereference
> from trying to call dma_data->ops->started().
>
> Any insights about this, or testing would be very welcome.
>

There is already a very similar patch for this, see:
http://mailman.alsa-project.org/pipermail/alsa-devel/2014-June/077327.html

I think that one is scheduled to be merged.

- Lars
