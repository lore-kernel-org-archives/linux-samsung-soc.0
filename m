From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2 2/9] ARM: SAMSUNG: Move mach/ts.h to plat/ts.h
Date: Tue, 18 May 2010 20:47:15 +0900
Message-ID: <007c01caf67f$e096f730$a1c4e590$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63189 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752059Ab0ERLrV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 May 2010 07:47:21 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2M00CCM62WYW@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 20:47:20 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2M0035G62WDI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 20:47:20 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'arm-linux' <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org
Cc: 'Ben Dooks' <ben-linux@fluff.org>


This patch has been merged into Ben Dooks' tree, for-2635/s3c64xx-ts.
So need to rebase this commit.

(http://lists.infradead.org/pipermail/linux-arm-kernel/2010-May/014148.html)
---
commit 34b01740be6e010976a2f5aa8f343d3b5dd6d278
Author: Maurus Cuelenaere <mcuelenaere@gmail.com>
Date:   Tue May 4 13:12:41 2010 +0200

    ARM: SAMSUNG: Move mach/ts.h to plat/ts.h

    This moves mach-s3c2410/include/mach/ts.h to
plat-samsung/include/plat/ts.h in
    order to prepare for s3c64xx support in the touchscreen driver.

    Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
    Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
