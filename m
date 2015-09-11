From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Disable simplefb support
Date: Fri, 11 Sep 2015 14:01:54 +0900
Message-ID: <55F26042.2080600@samsung.com>
References: <1441892552-13819-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:10031 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751064AbbIKFCA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Sep 2015 01:02:00 -0400
In-reply-to: <1441892552-13819-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Kukjin Kim <kgene@kernel.org>, Thierry Reding <treding@nvidia.com>, Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Lukasz Majewski <l.majewski@samsung.com>, linux-arm-kernel@lists.infradead.org

On 10.09.2015 22:42, Javier Martinez Canillas wrote:
> The simplefb driver allows the kernel to render on a pre-allocated
> buffer that's been initialized by firmware before the kernel boots.
> 
> This option was enabled to have display working on the Exynos5250
> Snow Chromebook by commit da9d0fbf5e9a ("ARM: exynos: defconfig
> update") since proper DRM/KMS support did not exist at that time.
> 
> But now that the Exynos DRM driver has support for this hardware,
> there is no need to have simplefb enabled. In fact, if a user has
> a u-boot that injects the simplefb dev node to the FDT before pass
> it to the kernel, display won't be properly initialized and only a
> blank screen will be shown since there isn't a proper handoff from
> the simplefb driver to the Exynos DRM driver.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
>  arch/arm/configs/exynos_defconfig | 1 -
>  1 file changed, 1 deletion(-)

Seems logical. None of the boards use simple-framebuffer compatible
anyway. I understand that on Snow simplefb was needed along with change
in Uboot like this one:
https://chromium.googlesource.com/chromiumos/third_party/u-boot/+/refs/changes/58/49358/2

and now none of Exynos boards use simplefb anymore?

Best regards,
Krzysztof
