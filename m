From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/3] arm64: add new support Samsung GH7 SoC and SSDK board
Date: Tue, 11 Feb 2014 11:59:40 +0530
Message-ID: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60855 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758AbaBKG2Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 01:28:16 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0T0085RJB2RWD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Feb 2014 15:28:14 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>

This adds support for Samsung ARMv8 core based GH7 SoC and its evaluation SSDK board.

[PATCH 1/3] arm64: dts: add initial dts for Samsung GH7 SoC and SSDK-GH7 board
[PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC family
[PATCH 3/3] Documentation: DT: add new entry for Samsung GH7 SoC and SSDK board
