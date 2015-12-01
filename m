From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 04/10] ARM: s3c64xx: prepare initcalls for multiplatform
Date: Tue, 01 Dec 2015 10:23:48 +0900
Message-ID: <565CF6A4.1030608@samsung.com>
References: <1448467615-447097-1-git-send-email-arnd@arndb.de>
 <1448467615-447097-5-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:12661 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751841AbbLABXy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Nov 2015 20:23:54 -0500
In-reply-to: <1448467615-447097-5-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Mark Brown <broonie@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Tomasz Figa <tfiga@chromium.org>, Ben Dooks <ben.dooks@codethink.co.uk>, linux-samsung-soc@vger.kernel.org

On 26.11.2015 01:06, Arnd Bergmann wrote:
> In a multiplatform kernel, each initcall is run regardless
> of the platform it is meant for, so it must not attempt to
> access SoC-specific registers.
> 
> This adds 'if (soc_is_s3c64xx)' to all initcalls that are
> specific to the s3c64xx platform, to prevent them from breaking
> other platforms once we can build them into a combined kernel.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-s3c64xx/common.c               |  4 ++--
>  arch/arm/mach-s3c64xx/cpuidle.c              |  5 ++++-
>  arch/arm/mach-s3c64xx/irq-pm.c               |  2 +-
>  arch/arm/mach-s3c64xx/mach-crag6410-module.c |  4 ++++
>  arch/arm/mach-s3c64xx/pl080.c                |  4 ++++
>  arch/arm/mach-s3c64xx/pm.c                   |  4 ++++
>  arch/arm/mach-s3c64xx/s3c6400.c              |  2 +-
>  arch/arm/mach-s3c64xx/s3c6410.c              |  2 +-
>  arch/arm/plat-samsung/gpio-samsung.c         | 11 +++++------
>  arch/arm/plat-samsung/init.c                 |  5 +++++
>  10 files changed, 31 insertions(+), 12 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
