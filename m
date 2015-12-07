From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL] ARM: Exynos fixes for v4.4
Date: Mon, 07 Dec 2015 13:28:42 +0900
Message-ID: <56650AFA.7010906@samsung.com>
References: <1448587563-31346-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:56614 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755284AbbLGE2u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 6 Dec 2015 23:28:50 -0500
In-reply-to: <1448587563-31346-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 27.11.2015 10:26, Krzysztof Kozlowski wrote:
> Hi Kukjin,
> 
> 
> Two fixes for v4.4 cycle. Rafael wanted the cpufreq fix to go through
> arm-soc tree.
> 
> Please note that location of repository has changed to kernel.org.

Hi Arnd, Kevin and Olof,

Could you pull this directly for current RC-cycle? Kukjin mentioned that
he does not have any patches in his queue for fixes.

Best regards,
Krzysztof


> 
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:
> 
>   Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-4.4
> 
> for you to fetch changes up to 62f49ee26f14753bd7fa634f51d537a79061bf0f:
> 
>   cpufreq: s3c24xx: Do not mark s3c2410_plls_add as __init (2015-11-27 10:10:32 +0900)
> 
> ----------------------------------------------------------------
> Fixes for Exynos:
> 1. Fix potential NULL pointer dereference in Exynos PMU driver.
> 2. Remove incorrect __init annotation from s3c24xx cpufreq driver
>    structures.
> 
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       cpufreq: s3c24xx: Do not mark s3c2410_plls_add as __init
> 
> Pankaj Dubey (1):
>       ARM: EXYNOS: Fix potential NULL pointer access in exynos_sys_powerdown_conf
> 
>  arch/arm/mach-exynos/pmu.c                   | 6 +++++-
>  arch/arm/mach-s3c24xx/pll-s3c2440-12000000.c | 2 +-
>  arch/arm/mach-s3c24xx/pll-s3c2440-16934400.c | 2 +-
>  drivers/cpufreq/s3c24xx-cpufreq.c            | 2 +-
>  4 files changed, 8 insertions(+), 4 deletions(-)
> 
