From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/2] ARM: multi_v7_defconfig: Switch max77693 to module
Date: Tue, 5 Apr 2016 10:02:57 -0400
Message-ID: <5703C591.5040100@osg.samsung.com>
References: <1459756459-22061-1-git-send-email-k.kozlowski@samsung.com>
 <1459756459-22061-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:33591 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753681AbcDEODH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Apr 2016 10:03:07 -0400
In-Reply-To: <1459756459-22061-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kevin Hilman <khilman@kernel.org>

Hello Krzysztof,

On 04/04/2016 03:54 AM, Krzysztof Kozlowski wrote:
> The driver can be built as a module, so use this possibility.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> ---
> 
> This patch depends on previous one "mfd: max77693: Allow building as a
> module". Please pick-up everything or provide a tag for me (so I could
> pick up this one to samsung-soc tree).
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 4eb10f5ea493..d92f6bfbba0e 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -453,7 +453,7 @@ CONFIG_MFD_CROS_EC_SPI=m
>  CONFIG_MFD_DA9063=m
>  CONFIG_MFD_MAX14577=y
>  CONFIG_MFD_MAX77686=y
> -CONFIG_MFD_MAX77693=y
> +CONFIG_MFD_MAX77693=m
>  CONFIG_MFD_MAX8907=y
>  CONFIG_MFD_MAX8997=y
>  CONFIG_MFD_RK808=y
> 

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
