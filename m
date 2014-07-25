From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] exynos: Support big endian mode in secondary_startup
Date: Fri, 25 Jul 2014 13:45:14 +0900
Message-ID: <073c01cfa7c3$39ec6a10$adc53e30$@samsung.com>
References: <1405958507-8606-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48827 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758AbaGYEpR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 00:45:17 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9900CM83VFV860@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jul 2014 13:45:15 +0900 (KST)
In-reply-to: <1405958507-8606-1-git-send-email-broonie@kernel.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Victor Kamensky' <victor.kamensky@linaro.org>, 'Mark Brown' <broonie@linaro.org>

Mark Brown wrote:
> 
> From: Victor Kamensky <victor.kamensky@linaro.org>
> 
> Exynos processors generally operate in little endian mode so their
> bootloader and ROM will almost always operate in little endian mode.
> This means that if a big endian kernel is run it must switch the CPU
> into big endian mode after gaining control.
> 
> The generic secondary_startup that is called from exynos specific
> secondary startup code will do the switch, but we need it to do earlier
> because exynos specific secondary_startup code which runs first also
> works with data that is big endian when the kernel is compiled for big
> endian.
> 
> [Rewrote commit message. -- broonie]
> 
> Signed-off-by: Victor Kamensky <victor.kamensky@linaro.org>
> Signed-off-by: Mark Brown <broonie@linaro.org>

Hi Mark,

Basically, I have no objection on this, BTW is there any requirement to support
big endian on exynos stuff? Just wondering...

Thanks,
Kukjin

> ---
>  arch/arm/mach-exynos/headsmp.S | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/headsmp.S b/arch/arm/mach-exynos/headsmp.S
> index b54f9701e421..ac8364efb985 100644
> --- a/arch/arm/mach-exynos/headsmp.S
> +++ b/arch/arm/mach-exynos/headsmp.S
> @@ -18,6 +18,11 @@
>   * ready for them to initialise.
>   */
>  ENTRY(exynos4_secondary_startup)
> +	/*
> +	 * ROM code operates in little endian mode, when we get control we
> +	 * need to switch it to big endian mode.
> +	 */
> +ARM_BE8(setend	be)
>  	mrc	p15, 0, r0, c0, c0, 5
>  	and	r0, r0, #15
>  	adr	r4, 1f
> --
> 2.0.1
