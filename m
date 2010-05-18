From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/0] Adds Touchscreen & ADC Support for Samsung SoCs.
Date: Tue, 18 May 2010 20:46:47 +0900
Message-ID: <007b01caf67f$cee9d1b0$6cbd7510$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63123 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750895Ab0ERLqw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 May 2010 07:46:52 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2M00NSX6222X@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 20:46:50 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2M00GAQ6225S@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 20:46:50 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'arm-linux' <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org
Cc: 'Ben Dooks' <ben-linux@fluff.org>


This patch series moves generic code to common place, 
Implements GPIO configuration function for touchscreen and 
Adds support for S3C64XX, S5PV210/C110 & S5P6440 Boards.

This patch set includes:

[PATCH v3 1/9] ARM: SAMSUNG: Moving ADC device definitions to plat-samsung
ARM: SAMSUNG: Move mach/ts.h to plat/ts.h - already merged to Ben's tree
[PATCH v3 3/9] ARM: SAMSUNG: Implements cfg_gpio function for Samsung
touchscreen
[PATCH v3 4/9] Input: s3c24xx_ts - Implements generic GPIO configuration
function
[PATCH v2 5/9] Input: s3c24xx_ts - Adds FEAT for Samsung touchscreen support
[PATCH v3 6/9] ARM: S3C64XX: Adds Touchscreen support for S3C64XX
[PATCH v2 7/9] ARM: S5P6440: Adds Touchscreen support for S5P6440
[PATCH v3 8/9] ARM: S5PV210: Adds Touchscreen support for S5PV210
[PATCH v3 9/9] Input: s3c24xx_ts - Modify touchscreen Kconfig for Support
Samsung SoCs



Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
