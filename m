From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: exynos_defconfig: Enable Samsung media platform
 drivers as modules
Date: Thu, 24 Mar 2016 10:00:54 +0900
Message-ID: <56F33C46.8060501@samsung.com>
References: <1458779208-6144-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1458779208-6144-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 24.03.2016 09:26, Javier Martinez Canillas wrote:
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
> 
> ---
> 
> Changes in v2:
> - Remove S5P G2D and GSC symbols since overlaps with Exynos DRM functionality.
>   Suggested by Tobias Jakobi
> 
>  arch/arm/configs/exynos_defconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Looks good.
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>


How about doing the same for multi_v7?


Best regards,

Krzysztof
