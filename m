From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 1/2] ARM: exynos_defconfig: Enable SECCOMP
Date: Fri, 12 Aug 2016 09:02:21 -0400
Message-ID: <54720ab1-3983-1a40-9998-e1a7b4b26db6@osg.samsung.com>
References: <1471005243-6409-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:46677
	"EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752175AbcHLNCu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2016 09:02:50 -0400
In-Reply-To: <1471005243-6409-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kevin Hilman <khilman@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Krzysztof,

On 08/12/2016 08:34 AM, Krzysztof Kozlowski wrote:
> Systemd already supports seccomp.  It seems some distros are building
> systemd with seccomp, e.g. Arch on ARM, thus leading to boot errors:
> 
> systemd-logind.service: Failed at step SECCOMP spawning /usr/lib/systemd/systemd-logind: Invalid argument
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 81862a77dddf..5476be3be686 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -17,6 +17,7 @@ CONFIG_PREEMPT=y
>  CONFIG_AEABI=y
>  CONFIG_HIGHMEM=y
>  CONFIG_CMA=y
> +CONFIG_SECCOMP=y
>  CONFIG_ZBOOT_ROM_TEXT=0x0
>  CONFIG_ZBOOT_ROM_BSS=0x0
>  CONFIG_ARM_APPENDED_DTB=y
> 

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
