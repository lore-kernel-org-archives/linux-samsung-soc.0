From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 0/3] ARM: S5P: Add platform helpers for MIPI-CSIS/DSIM
 DPHY
Date: Thu, 10 Mar 2011 22:09:30 +0900
Message-ID: <009b01cbdf24$67587c20$36097460$%kim@samsung.com>
References: <1299762193-7791-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36669 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751852Ab1CJNJi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Mar 2011 08:09:38 -0500
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHU0098GF7Z2230@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 22:09:35 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHU00M90F7ZDV@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 22:09:35 +0900 (KST)
In-reply-to: <1299762193-7791-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com

Sylwester Nawrocki wrote:
> 
> Hello,
> 
Hi :)

Thanks for your re-submitting.

> the following is a fourth version of a change set adding platform helpers
> for the MIPI-CSIS and MIPI-DSIM PHYs control on S5PV210 and Exynos4.
> 
> Changes since v3:
>  - further copyright change (ptach 1/3)
>  - fixed_phy_vdd type changed to bool (p. 2/3);
> 
> Changes since v2:
>  - renamed setup-mipi.c/setup-mipidphy.c
>  - regs-pmu.h header included in regs-clock.s in mach-exynos4 to get
>    rid of CONFIG_ARCH_EXYNOS4 in setup-mipiphy.c
> 
> Changes since v1:
>  - updated the platform data structure with an additional flag indicating
>    whether the driver should attempt to control the external mipi-csis
>    (VDD18_MIPI) voltage regulator or not. This might be needed on systems
>    where MIPI VDD power supply cannot be separately switched on/off.
> 
> 
> The patch series contains:
>  [PATCH v4 1/3] ARM: S5P: Rename MIPI-CSIS driver header and update
Copyright
>  [PATCH v4 2/3] ARM: S5P: Extend MIPI-CSIS platform_data with the PHY
control
> callback
>  [PATCH v4 3/3] ARM: S5P: Add support for common MIPI CSIS/DSIM D-PHY
control
> 
> Created against for-next branch at:
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> 
Looks ok to me, will apply.
Thanks again.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
