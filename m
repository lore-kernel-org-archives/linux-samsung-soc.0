From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/2] ARM: Update number of VIC for S5P SoCs
Date: Fri, 18 Feb 2011 11:05:51 +0900
Message-ID: <1297994753-22246-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:52155 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751871Ab1BRCfV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Feb 2011 21:35:21 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

The S5PV210 has 4 VICs and S5P6442 and S5PC100 have 3 VICs.
However, default VIC number is defined 2 in arch/arm/common.
So can be happened some problem on above SoCs.

I know, another better patch which has been submitted for it,
but I couldn't find any its progress, right now, need this
for esp., PM and so on.

And if required, can be improved for it later.

[PATCH RE-SEND 1/2] ARM: Update number of VIC for S5PV210
[PATCH RE-SEND 2/2] ARM: Update number of VIC for S5P6442 and S5PC100
