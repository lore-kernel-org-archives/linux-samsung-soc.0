From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/3] ARM: S5P64X0: Add SDMMC support
Date: Sat, 05 Nov 2011 12:39:32 +0900
Message-ID: <02ec01cc9b6c$87f8bb20$97ea3160$%kim@samsung.com>
References: <1320415020-7439-1-git-send-email-rajeshwari.s@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39265 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752604Ab1KEDjd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Nov 2011 23:39:33 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LU60077V4TU7FD0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 05 Nov 2011 12:39:32 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LU600BG14TWNG00@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 05 Nov 2011 12:39:32 +0900 (KST)
In-reply-to: <1320415020-7439-1-git-send-email-rajeshwari.s@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rajeshwari Shinde' <rajeshwari.s@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Rajeshwari Shinde wrote:
> 
> This patchset adds support for sdhci controller on S5P6440 and S5P6450.
> 
> Since this patchset is based on "mmc: sdhci-s3c: Rework platform data
> and add device tree support" clk_type member has been removed from
> platform data.
> 
> This patchset depends on the patchs:
> ARM: S5P64X0: Modified files for SPI consolidation work.
> mmc: sdhci-s3c: Rework platform data and add device tree support.
> 
> Rajeshwari Shinde (3):
>   ARM: S5P64X0: Add HSMMC setup for host Controller
>   ARM: S5P64X0: Add lookup of sdhci-s3c clocks using generic names
>   ARM: S5P64X0: Enable SDHCI support
> 
>  arch/arm/mach-s5p64x0/Kconfig              |   24 +++++++
>  arch/arm/mach-s5p64x0/Makefile             |    1 +
>  arch/arm/mach-s5p64x0/clock-s5p6440.c      |   72 +++++++++++--------
>  arch/arm/mach-s5p64x0/clock-s5p6450.c      |   72 +++++++++++--------
>  arch/arm/mach-s5p64x0/cpu.c                |    9 +++
>  arch/arm/mach-s5p64x0/mach-smdk6440.c      |   25 +++++++
>  arch/arm/mach-s5p64x0/mach-smdk6450.c      |   26 +++++++-
>  arch/arm/mach-s5p64x0/setup-sdhci-gpio.c   |  104
> ++++++++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/sdhci.h |   42 +++++++++++
>  9 files changed, 314 insertions(+), 61 deletions(-)
>  create mode 100644 arch/arm/mach-s5p64x0/setup-sdhci-gpio.c
> 
> --
> 1.7.4.4

Hi Rajeshwari,

I need to sort out your this patches and Thomas' sdhci dt patches.
And it's merge window, so will be back on this after that.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
