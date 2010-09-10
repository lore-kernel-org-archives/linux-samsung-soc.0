From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/2] ARM: Update number of VIC
Date: Fri, 10 Sep 2010 21:03:11 +0900
Message-ID: <1284120193-23291-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:33730 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752243Ab0IJMR0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Sep 2010 08:17:26 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patches update number of VIC.
The S5PV210 has 4 VICs, and the S5P6442 and S5PC100 have 3 ViCs.
So need to update ARM_VIC_NR for them.

Russell,

How do you think this?
If another better way, please let me know.

Thanks.

[PATCH 1/2] ARM: Update number of VIC for S5PV210
[PATCH 2/2] ARM: Update number of VIC for S5P6442 and S5PC100
