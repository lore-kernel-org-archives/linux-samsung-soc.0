From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [GIT PULL] Samsung fixes-4 for v3.16
Date: Sat, 19 Jul 2014 15:15:13 +0200
Message-ID: <53CA6F61.1020709@gmail.com>
References: <53C9AF23.6030007@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:56725 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751975AbaGSNPc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Jul 2014 09:15:32 -0400
Received: by mail-we0-f171.google.com with SMTP id p10so5750112wes.16
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Jul 2014 06:15:31 -0700 (PDT)
In-Reply-To: <53C9AF23.6030007@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: Tomasz Figa <t.figa@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Kukjin,

On 19.07.2014 01:34, Kukjin Kim wrote:
> Hi,
> 
> This is a regression for v3.16 so please take this in -rc.
> 
> Thanks,
> Kukjin
> 
> The following changes since commit
> 1795cd9b3a91d4b5473c97f491d63892442212ab:
> 
>   Linux 3.16-rc5 (2014-07-13 14:04:33 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-fixes-4
> 
> for you to fetch changes up to 4e3a498d6fc438d8c203c51aadc6ca8fb47b0577:
> 
>   ARM: EXYNOS: Fix core ID used by platsmp and hotplug code (2014-07-16
> 02:59:18 +0900)
> 
> ----------------------------------------------------------------
> Samsung fixes-4 for v3.16
> - Fix core ID for platsmp and hotplug
>   This fixes existing calculation of PMU register offsets on
>   exynos SoCs and this also fixes CPU hotplug with more than
>   2 cores, because it removes incorrect condition check in
>   platform_do_lowpower().
> 
> ----------------------------------------------------------------
> Tomasz Figa (1):
>       ARM: EXYNOS: Fix core ID used by platsmp and hotplug code
> 
>  arch/arm/mach-exynos/hotplug.c | 10 ++++++----
>  arch/arm/mach-exynos/platsmp.c | 34 +++++++++++++++++++---------------
>  2 files changed, 25 insertions(+), 19 deletions(-)

Could you also merge this branch to your for-next so we can base other
patches for 3.17 on this fix?

Best regards,
Tomasz
