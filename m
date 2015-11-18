From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv2 2/3] ASoC: s3c24xx-i2s: pass DMA channels as platform data
Date: Wed, 18 Nov 2015 10:53:23 +0900
Message-ID: <564BDA13.3040907@samsung.com>
References: <6346833.MfUC71I3uD@wuerfel> <4020501.kQLt6nnIEv@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:24980 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752856AbbKRBxb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Nov 2015 20:53:31 -0500
In-reply-to: <4020501.kQLt6nnIEv@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org

On 18.11.2015 00:54, Arnd Bergmann wrote:
> This is a minor cleanup to make the s3c2412-i2s and s3c24xx-i2s
> drivers independent of the mach/dma.h header file and to allow
> removing the dependency on the specific dmaengine driver in the
> next patch.
> 
> As a side not, only the s3c24xx-i2s driver seems to still be
> used, while the definition of the s3c2412-i2s platform device was
> removed in commit 6d259a25b56d ("ARM: SAMSUNG: use static
> declaration when it is not used in other files") after it had
> never been referenced since its introduction in f0fba2ad1b6b
> ("ASoC: multi-component - ASoC Multi-Component Support").
> 
> Apparently it should have been used by mach-jive.c, but that
> never happened. My patch at this point leaves the current state
> unchanged, we can decide whether to fix or delete the jive
> driver and s3c2412-i2s another time.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: check for NULL pdata
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
