From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RESEND PATCH v3 1/2] ARM: exynos_defconfig: Enable Samsung media
 platform drivers as modules
Date: Tue, 26 Apr 2016 07:47:59 +0200
Message-ID: <571F010F.7040209@samsung.com>
References: <1461603086-21288-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:57799 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082AbcDZFsG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Apr 2016 01:48:06 -0400
In-reply-to: <1461603086-21288-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Kukjin Kim <kgene@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kevin Hilman <khilman@baylibre.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

On 04/25/2016 06:51 PM, Javier Martinez Canillas wrote:
> There are a bunch of media platform drivers under drivers/media/platform/
> that are for Samsung SoCs but are not being built with exynos_defconfig.
> 
> This patch enables them as a module to improve build coverage for these
> drivers and also to allow people use them with proper hardware if modules
> are installed. The S5P MFC driver wasn't enabled since it fails to probe.
> 
> Only the boolean Kconfig symbols are enabled as built-in, since drivers
> are not critical and also to keep the kernel binary image size as small
> as possible.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> ---
> 
> Changes in v3:
> - Added Krzysztof Kozlowski's reviewed by tag.
> 
> Changes in v2:
> - Remove S5P G2D and GSC symbols since overlaps with Exynos DRM functionality.
>   Suggested by Tobias Jakobi
> 
>  arch/arm/configs/exynos_defconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Still nothing... did not reach any of the mailing lists... I think you
need to check your setup or check for any bounces.

Best regards,
Krzysztof
