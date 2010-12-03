From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/4] ARM: S5P: Add platform support for MIPI-CSI2 devices
Date: Fri, 03 Dec 2010 13:11:42 +0900
Message-ID: <012201cb92a0$3644eae0$a2cec0a0$%kim@samsung.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:64342 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758431Ab0LCELw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 23:11:52 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LCU00AXL3NRQX30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 13:11:51 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LCU00GUT3NREL@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 13:11:51 +0900 (KST)
In-reply-to: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com

Sylwester Nawrocki wrote:
> 
> Hello,
> 
Hi :-)

> the following patch series adds S5P platform support for MIPI-CSI2
devices.
> It has been rebased onto next-samsung branch at:
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

It would be more helpful to me to use the 'for-next' next time.
> 
> [PATCH 1/4] mach-s5pv210: Add platform definitions for mipi-csis
> [PATCH 2/4] mach-s5pv310: Add resource definitions for mipi-csis
> [PATCH 3/4] plat-s5p: Add platform support for MIPI-CSI2 devices
> [PATCH 4/4] mach-s5pv210: Add MIPI-CSI DPHY clock definition
> 

And used following commit title in others...

ARM: S5PV210: xxx
ARM: S5P: xxx

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
