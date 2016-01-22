From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v2 10/10] ARM: multi_v7_defconfig: Remove MAX77802 RTC
 Kconfig symbol
Date: Fri, 22 Jan 2016 15:27:57 +0530
Message-ID: <56A1FD25.7020008@nvidia.com>
References: <1453407813-14646-1-git-send-email-javier@osg.samsung.com> <1453407813-14646-11-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453407813-14646-11-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


On Friday 22 January 2016 01:53 AM, Javier Martinez Canillas wrote:
> The driver has been removed so the Kconfig symbol is not valid anymore.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
>
> ---
>
> Changes in v2:
> - Add Krzysztof Kozlowski's Reviewed-by tag to patch #10.
>
>   arch/arm/configs/multi_v7_defconfig | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 314f6be2dca2..bdb42c09332c 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -664,7 +664,6 @@ CONFIG_RTC_DRV_MAX8907=y
>   CONFIG_RTC_DRV_MAX8997=m
>   CONFIG_RTC_DRV_MAX77686=y
>   CONFIG_RTC_DRV_RK808=m
> -CONFIG_RTC_DRV_MAX77802=m

Do you need to make

CONFIG_RTC_DRV_MAX77686=m
