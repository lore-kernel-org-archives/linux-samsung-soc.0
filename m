From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv2 3/3] ASoC: samsung: pass filter function as pointer
Date: Wed, 18 Nov 2015 11:13:18 +0900
Message-ID: <564BDEBE.2080706@samsung.com>
References: <6346833.MfUC71I3uD@wuerfel> <6346833.dgFksO4fT8@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41722 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750969AbbKRCN0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Nov 2015 21:13:26 -0500
In-reply-to: <6346833.dgFksO4fT8@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org

On 18.11.2015 00:55, Arnd Bergmann wrote:
> As we are now passing the filter data as pointers to the drivers,
> we can take the final step and also pass the filter function the
> same way. I'm keeping this change separate, as there it's less
> obvious that this is a net win.
> 
> Upsides of this are:
> 
> - The ASoC drivers are completely independent from the DMA engine
>   implementation, which simplifies the Kconfig logic and in theory
>   allows the same sound drivers to be built in a kernel that supports
>   different kinds of dmaengine drivers.
> 
> - Consistency with other subsystems and drivers
> 
> On the other hand, we have a few downsides:
> 
> - The s3c24xx-dma driver now needs to be built-in for the ac97 platform
>   device to be instantiated on s3c2440.
> 
> - samsung_dmaengine_pcm_config cannot be marked 'const' any more
>   because the filter function pointer needs to be set at runtime.
>   This is safe as long we don't have multiple different DMA engines
>   in thet same system at runtime, but is nonetheless ugly.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: avoid possibly NULL pdata
> 

Looks good.

I also tested entire patchset on Exynos4412/Trats2 board (custom kernel
with audio working) for regressions and it worked fine. However, since
this was not a S3C24xx/S3C64xx board, I don't find that testing
sufficient for a tag. So only:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
