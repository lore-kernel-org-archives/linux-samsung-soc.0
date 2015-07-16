From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/3] ARM: multi_v7_defconfig: Enable max77802 regulator
Date: Thu, 16 Jul 2015 09:45:20 +0900
Message-ID: <55A6FEA0.8090202@samsung.com>
References: <1436977965-7078-1-git-send-email-javier@osg.samsung.com>
 <1436977965-7078-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:26120 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752590AbbGPApV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jul 2015 20:45:21 -0400
In-reply-to: <1436977965-7078-2-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On 16.07.2015 01:32, Javier Martinez Canillas wrote:
> The Maxim max77802 Power Management IC has besides other devices, a set of
> regulators. Commit f3caa529c6f5 ("ARM: multi_v7_defconfig: Enable max77802
> regulator, rtc and clock drivers") was supposed to enable the config option
> for the regulator driver as a module but the final version that landed did
> not include this. So this patch enables the needed Kconfig option.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Please describe why do you want to enable it (IOW who will benefit from
enabling it?). This symbol was removed by Kukjin from your commit:
	[kgene@kernel.org: removing useless REGULATOR_MAX77802 config]
so justification would be welcomed.

Beside the commit description I agree with the patch.

Best regards,
Krzysztof

> ---
> 
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 4b93761d58d2..b07493997993 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -402,6 +402,7 @@ CONFIG_REGULATOR_MAX14577=m
>  CONFIG_REGULATOR_MAX8907=y
>  CONFIG_REGULATOR_MAX8973=y
>  CONFIG_REGULATOR_MAX77686=y
> +CONFIG_REGULATOR_MAX77802=m
>  CONFIG_REGULATOR_MAX77693=m
>  CONFIG_REGULATOR_PALMAS=y
>  CONFIG_REGULATOR_S2MPS11=y
> 
