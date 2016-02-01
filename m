From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/6] ARM: s3c24xx: allow selecting S3C2440_XTAL_16934400
 for s3c2442
Date: Mon, 01 Feb 2016 09:46:11 +0900
Message-ID: <56AEAAD3.1060501@samsung.com>
References: <1454079040-3567945-1-git-send-email-arnd@arndb.de>
 <1454079040-3567945-3-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9867 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932824AbcBAAqR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 31 Jan 2016 19:46:17 -0500
In-reply-to: <1454079040-3567945-3-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org

On 29.01.2016 23:50, Arnd Bergmann wrote:
> The S3C2440_XTAL_16934400 and S3C2440_XTAL_12000000 symbols are used
> for both s3c2442 and s3c2440, but Kconfig only allows it to be selected
> if CPU_S3C2440 is enabled, which can lead to a warning otherwise:
> 
> warning: (MACH_RX1950) selects S3C2440_XTAL_16934400 which has unmet direct dependencies (ARCH_S3C24XX && CPU_S3C2440)
> 
> This changes the dependencies to make it possible also for CPU_S3C2442-only
> configurations.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-s3c24xx/Kconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)


Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
