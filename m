From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: S5PV210: Add GONI board setup for CIF camera support
Date: Fri, 07 Jan 2011 17:57:45 +0100
Message-ID: <1294419468-13700-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58369 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754316Ab1AGQ5y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Jan 2011 11:57:54 -0500
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LEN007PXWGFVJ@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Jan 2011 16:57:51 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LEN002WQWGEBD@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Jan 2011 16:57:51 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

Hello,

the following patch series introduces changes in GONI board setup file
required for the CIF camera sensor driver.
The first patch adds the I2C0 bus driver, the second one adds the regulator
supply definitions and the third one just increases virtual size
of the framebuffer window 0 for preview double buffering.


The patch series contains:

[PATCH 1/3] ARM: S5PV210: Enable I2C0 bus on GONI board
[PATCH 2/3] ARM: S5PV210: Add supplies for CIF camera on GONI board
[PATCH 3/3] ARM: S5PV210: Change framebuffer window 0 size on GONI

Created against kgene-for-next branch at:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 


Regards,
Sylwester


--
Sylwester Nawrocki
Samsung Poland R&D Center
