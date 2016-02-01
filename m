From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/6] ARM: s3c24xx: don't select EEPROM_AT24
Date: Mon, 01 Feb 2016 09:40:31 +0900
Message-ID: <56AEA97F.80206@samsung.com>
References: <1454079040-3567945-1-git-send-email-arnd@arndb.de>
 <1454079040-3567945-2-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9845 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932824AbcBAAkh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 31 Jan 2016 19:40:37 -0500
In-reply-to: <1454079040-3567945-2-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org

On 29.01.2016 23:50, Arnd Bergmann wrote:
> EEPROM_AT24 depends on both I2C and SYSFS. We have in the past
> added I2C 'select' statements to avoid build problems with the
> first, but we still get a warning because of the second:
> 
> warning: (MACH_DAVINCI_EVM && MACH_SFFSDR && MACH_DAVINCI_DM6467_EVM && MACH_DAVINCI_DM365_EVM && MACH_DAVINCI_DA830_EVM && MACH_MITYOMAPL138 && MACH_MINI2440) selects EEPROM_AT24 which has unmet direct dependencies (I2C && SYSFS)
> 
> This removes the 'select' statements again, and forces users to
> enable the driver in their configuration files, as we do for
> most other drivers.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/configs/mini2440_defconfig | 1 +
>  arch/arm/configs/s3c2410_defconfig  | 1 +
>  arch/arm/mach-s3c24xx/Kconfig       | 1 -
>  3 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
