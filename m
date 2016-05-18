From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: samsung: improve static dma_mask definition
Date: Wed, 18 May 2016 17:01:22 +0200
Message-ID: <573C83C2.5090203@samsung.com>
References: <1463042333-281444-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:64702 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751120AbcERPB1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 May 2016 11:01:27 -0400
In-reply-to: <1463042333-281444-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene@kernel.org>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/12/2016 10:38 AM, Arnd Bergmann wrote:
> When no DMA master devices are part of the kernel configuration,
> we get a warning about the unused dma mask definition:
> 
> arch/arm/plat-samsung/devs.c:71:12: error: 'samsung_device_dma_mask' defined but not used [-Werror=unused-variable]
>  static u64 samsung_device_dma_mask = DMA_BIT_MASK(32);
> 
> We could simply mark this as __maybe_unused to shut up that warning,
> but a nicer solution seems to be to have a separate mask for each
> device. The advantage is that a driver that happens to call
> dma_set_mask() on one device doesn't implicitly change the mask
> for the other devices as well. This is more of a theoretical
> problem, as obviously nothing does it for the devices in this
> file (or they would have always been broken), but it feels
> cleaner that way.
> 
> The definition works by creating an array in place so we can take
> the address of it and let the compiler generate a hidden symbol
> for it at compile time.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/plat-samsung/devs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, although does not look as critical fix but less warnings makes
spotting right issues faster so applied for v4.7.

Best regards,
Krzysztof
