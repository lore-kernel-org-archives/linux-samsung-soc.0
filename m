From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH/RFC 0/3] ARM: S5P: Add common DPHY control code for
	MIPI-CSIS/MIPI-DSIM devices
Date: Thu, 03 Mar 2011 13:43:02 +0900
Message-ID: <01a701cbd95d$9873c160$c95b4420$%kim@samsung.com>
References: <1299087289-29926-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:15791 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932144Ab1CCEnz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Mar 2011 23:43:55 -0500
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHG003FCT54S8D0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 13:43:52 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHG007MYT549R@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 13:43:52 +0900 (KST)
In-reply-to: <1299087289-29926-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com

Sylwester Nawrocki wrote:
> 
> Hello,
> 
> the following patch series adds a common platform code to enable control
> of MIPI-CSI receiver's DPHY from within it's V4L2 subdev driver. The
driver
> is supposed to support possibly all S5P SoCs variants and the PHY handling
> details need to be hidden in the platform code. The functionality behind
> "dphy_csis" clocks is not exact a functionality of the clock, but they
have
> common features. If the clock API rules are to strict to accept this kind
> of usage then I'm willing to create some intermediate layer that will
finally
> solve PHY handling for MIPI-CSI, MIPI-DSIM, USB, SATA.. devices, without
> issues
> on a common kernel binary for multiple boards.
> 
> 
> The patch series contains:
> [PATCH 1/3] ARM: S5P: Rename MIPI-CSIS header and update Copyright
> [PATCH 2/3] ARM: S5PV210: Add clock entries for MIPI DPHY control
> [PATCH 3/3] ARM: EXYNOS4: Add clock entries for MIPI DPHY control
> 
> Rebased onto kgene-for-next branch at:
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> 

Maybe we discussed about this ago.
I remember, we agree that to control phy cannot be handled in clock part.

And didn't say to make some kind of common s5p phy setup/control function?
http://lists.infradead.org/pipermail/linux-arm-kernel/2011-January/038038.ht
ml

I thought it is possible to make it even though some registers is in
different place.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
