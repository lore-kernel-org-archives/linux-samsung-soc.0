From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL] ARM: exynos: Late mach/soc for v4.10
Date: Fri, 30 Dec 2016 17:53:12 +0200
Message-ID: <20161230155312.oupgyip7wtqwcuy2@kozik-lap>
References: <1482003132-8844-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34846 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754300AbcL3PxS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Dec 2016 10:53:18 -0500
Content-Disposition: inline
In-Reply-To: <1482003132-8844-1-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

On Sat, Dec 17, 2016 at 09:32:12PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> 
> After our discussions about not-breaking out-of-tree DTB with SCU
> change in DeviceTree, I prepared an updated pull request without
> the questioned changes.
> 
> Ten days ago I prepared a tag, pushed it... and apparently forgot to send pull
> request. At least, I don't have such email in my outbox. Dunno.
> 
> So let's send it now, better late then never. With just few commits (without
> the DT SCU changes). These were sitting in the next for very long.
> 

Any comments on this? I guess it won't come as late-late-4.10, so can
you pull it for v4.11?

Best regards,
Krzysztof


> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:
> 
>   Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-4.10-2
> 
> for you to fetch changes up to da6b21e97e39d42f90ab490ce7b54a0fe2c3fe35:
> 
>   ARM: Drop fixed 200 Hz timer requirement from Samsung platforms (2016-12-07 18:42:11 +0200)
> 
> ----------------------------------------------------------------
> Samsung mach/soc update for v4.10:
> 1. Minor cleanup in smp_operations.
> 2. Another step in switching s3c24xx to new DMA API.
> 3. Drop fixed requirement for HZ=200 on Samsung platforms.
> 
> ----------------------------------------------------------------
> Krzysztof Kozlowski (1):
>       ARM: Drop fixed 200 Hz timer requirement from Samsung platforms
> 
> Pankaj Dubey (1):
>       ARM: EXYNOS: Remove smp_init_cpus hook from platsmp.c
> 
> Sylwester Nawrocki (1):
>       ARM: S3C24XX: Add DMA slave maps for remaining s3c24xx SoCs
> 
>  arch/arm/Kconfig               |  3 +-
>  arch/arm/mach-exynos/platsmp.c | 31 -----------------
>  arch/arm/mach-s3c24xx/common.c | 76 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 77 insertions(+), 33 deletions(-)
