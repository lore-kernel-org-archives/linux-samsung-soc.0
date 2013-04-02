From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V4 0/2] Add FIMD DT support for Exynos5 DT Machines
Date: Tue, 02 Apr 2013 17:16:03 +0900
Message-ID: <22c801ce2f7a$5181f4f0$f485ded0$%kim@samsung.com>
References: <1363936479-4905-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60020 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757878Ab3DBIQF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 04:16:05 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKM005KTCAQ8MF0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Apr 2013 17:16:04 +0900 (KST)
In-reply-to: <1363936479-4905-1-git-send-email-l.krishna@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, s.nawrocki@samsung.com

Leela Krishna Amudala wrote:
> 
> This patch series adds support for FIMD DT for Exynos5 DT Machines
> Adds display timing node for smdk5250 board.
> 
> changes since V3:
> 	- changed the clock names "sclk_fimd1" and "fimd1" to "sclk_fimd"
> and "fimd"
> 	  in the exynos5250.dtsi file
> 
> changes since V2:
> 	- added interrupt-names = "fifo", "vsync", "lcd_sys"
> 	- removed the patch "ARM: Exynos5: add FIMD AUXDATA entry for
> exynos5 DT",
>           as migration to Common Clock Framework will NOT need this.
> 
> changes since v1:
>         - modified compatible string for exynos5 fimd as "exynos5250-fimd"
> 
> This series is rebased on branch
> http://git.kernel.org/?p=linux/kernel/git/kgene/linux-
> samsung.git;a=shortlog;h=refs/heads/for-next
> 
> This series depends on
> https://patchwork.kernel.org/patch/2306391/
> 
> Leela Krishna Amudala (2):
>   ARM: dts: Add FIMD node to exynos5
>   ARM: dts: Add display timing node to exynos5250-smdk5250.dts
> 
>  arch/arm/boot/dts/exynos5250-smdk5250.dts | 16 ++++++++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi         | 10 ++++++++++
>  2 files changed, 26 insertions(+)
> 
> --
> 1.8.0

OK, applied this series.

Thanks.

- Kukjin
