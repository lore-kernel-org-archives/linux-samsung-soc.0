From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/4 v2] ARM: S5P: Add platform support for MIPI-CSI slave
 devices
Date: Fri, 03 Dec 2010 20:52:41 +0100
Message-ID: <1291405965-19482-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:18964 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753459Ab0LCTw7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Dec 2010 14:52:59 -0500
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LCV00JXGB89TJ@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 19:52:57 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LCV002SUB88I6@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 19:52:56 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

Hello,

the following is a second version of patch series adding S5P platform support
for MIPI-CSIS devices. Hopefully all the comments have been addressed, 
if not please let me know.

[PATCH 1/4 v2] ARM: S5PV210: Add resource definitions for MIPI CSIS
[PATCH 2/4 v2] ARM: S5PV310: Add resource definitions for MIPI CSIS
[PATCH 3/4 v2] ARM: S5P: Add platform support for MIPI CSIS devices
[PATCH 4/4 v2] ARM: S5PV210: Add clock definition for MIPI-CSIS DPHY

Rebased onto for-next branch at:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 


Regards,
Sylwester


--
Sylwester Nawrocki
Samsung Poland R&D Center
