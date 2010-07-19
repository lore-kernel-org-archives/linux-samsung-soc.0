From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH 0/4] ARM: S5PV210: Clock Framework: powerdomain, block-gating,
 flags
Date: Mon, 19 Jul 2010 17:30:32 +0900
Message-ID: <1279528236-6076-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34449 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760186Ab0GSIbp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jul 2010 04:31:45 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5S003BZQB09UD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Jul 2010 17:30:36 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5S0070ZQB07W@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Jul 2010 17:30:36 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

This patches add support for powerdomain, block-gating, and flags in struct clk.

Blockgating re-uses powerdomain support scheme and depends on powerdomain support.

Flags support is independent from powerdomain; however, powerdomain support is NOT stable without flags support. Without flags support, powerdomain may lock up the system with some conditions although they are rare. Thus, when powerdomain or block-gating is used, flags support should be turned on for the system stability. (and that's why I'm sending flags support with powerdomain/block-gating support).

Although powerdomain support is requred for blockgating, blockgating is NOT required for powerdomain. Besides, powerdomain support is observed to reduce power consumption significantly (with 2.6.29 kernel); however, blockgating support didn't show any significant improvement.


MyungJoo Ham (4):
  ARM: SAMSUNG SoC: Powerdomain/Block-gating Support
  ARM: S5PV210: Powerdomain/Clock-gating Support
  ARM: SAMSUNG SoC: Clock Framework: Flag Support for struct clk.
  ARM: S5PV210: Clock Framework: Flag Support for struct clk.

 arch/arm/mach-s5pv210/Kconfig              |   17 +
 arch/arm/mach-s5pv210/clock.c              |  906 ++++++++++++++++++++++------
 arch/arm/plat-samsung/Kconfig              |   19 +
 arch/arm/plat-samsung/clock.c              |  146 +++++-
 arch/arm/plat-samsung/include/plat/clock.h |   44 ++
 5 files changed, 935 insertions(+), 197 deletions(-)
