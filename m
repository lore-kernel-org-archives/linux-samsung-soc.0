From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 0/2] ARM: Samsung: I2C code cleanup
Date: Fri, 01 Jul 2011 17:03:10 +0530
Message-ID: <1309519992-3026-1-git-send-email-ch.naveen@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11116 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755104Ab1GALi6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Jul 2011 07:38:58 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNN00LUMKCW4I40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Jul 2011 20:38:56 +0900 (KST)
Received: from Hawshines.sisodomain.com ([107.108.83.161])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNN00375KCRUH@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Jul 2011 20:38:56 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, sbkim73@samsung.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Does the same job, while saving few lines of code.

 o To Kukjin Kim, Sangbeom Kim and Ben Dooks

Naveen Krishna Chatradhi (2):
  ARM: Samsung: Use generic set_plat_data function
  ARM: Samsung: Cleanup I2C code in plat-samsung

 arch/arm/plat-samsung/dev-i2c0.c         |   14 ++++++--------
 arch/arm/plat-samsung/dev-i2c1.c         |   24 ++++++++----------------
 arch/arm/plat-samsung/dev-i2c2.c         |   24 ++++++++----------------
 arch/arm/plat-samsung/dev-i2c3.c         |   24 ++++++++----------------
 arch/arm/plat-samsung/dev-i2c4.c         |   24 ++++++++----------------
 arch/arm/plat-samsung/dev-i2c5.c         |   24 ++++++++----------------
 arch/arm/plat-samsung/dev-i2c6.c         |   24 ++++++++----------------
 arch/arm/plat-samsung/dev-i2c7.c         |   24 ++++++++----------------
 arch/arm/plat-samsung/include/plat/iic.h |    2 ++
 9 files changed, 64 insertions(+), 120 deletions(-)

-- 
1.7.2.3
