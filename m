From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/3]  ARM:exynos5:power-domain: Save and restore
 CLK_TOP_SRC3 via clock framework.
Date: Mon, 28 Jan 2013 21:24:35 -0800
Message-ID: <05ba01cdfde0$ee4e6870$caeb3950$@samsung.com>
References: <1357736081-19390-1-git-send-email-prasanna.ps@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47502 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752911Ab3A2FYk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 00:24:40 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHD00960GBNZKL0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 14:24:39 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHD0073BGD1Y710@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 14:24:39 +0900 (KST)
In-reply-to: <1357736081-19390-1-git-send-email-prasanna.ps@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Prasanna Kumar' <prasanna.ps@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, jhbird.choi@samsung.com

Prasanna Kumar wrote:
> 
> After Suspend-Resume operation of exynos5, CLK_TOP_SRC3 register
> modified
> while power gating G-scaler and MFC power domains.This is seen only after
> suspend and resume.
> 
> The solution to this problem is to save CLK_SRC_TOP3 register and restore
> it while powergating. But CLK_SRC_TOP3 register cannot accessed directly
> by power domain code.
> Please refer below URL to know the background of this issue.
> http://www.mail-archive.com/linux-samsung-
> soc@vger.kernel.org/msg14347.html.
> 
> This patch set adds clock framework support for save and restore
> clock register (CLK_SRC_TOP3)  for G-scaler and MFC power domains.
> 
> This patch set depends on
> http://www.mail-archive.com/linux-samsung-
> soc@vger.kernel.org/msg14648.html
> 
> Prasanna Kumar (3):
>   ARM: dts: exynos5: Add power domain clocks to pd node of Gscaler and
> MFC
>   ARM:exynos5:dts: Bindings for clock definitions are added.
>   ARM: exynos5: Add clock save and restore operation(CLK_SRC_TOP3) using
> clock framework.
> 
>  .../bindings/arm/exynos/power_domain.txt           |   14 ++
>  arch/arm/boot/dts/exynos5250.dtsi                  |    2 +
>  arch/arm/mach-exynos/pm_domains.c                  |  125
> ++++++++++++++++++++
>  3 files changed, 141 insertions(+), 0 deletions(-)
> 
> --
> 1.7.5.4

I think, you need to re-submit this after addressing comments from some
guys.

Thanks.

- Kukjin
