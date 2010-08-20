From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/3] ARM: S5PV310: Add support HSMMC on SMDKC210 and SMDKV310
Date: Fri, 20 Aug 2010 21:33:45 +0900
Message-ID: <1282307628-5254-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:42702 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751304Ab0HTMrs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Aug 2010 08:47:48 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch changes HSMMC interrupt name and adds initial map for GPIO2 and GPIO3
so that can support 4 HSMMC on SMDKC210 and SMDKV310.

NOTE: depends on Kyungmin's 'Fix on GPIO base addresses'

[PATCH 1/3] ARM: SAMSUNG: Change the 3rd HSMMC interrupt name for compatibility
[PATCH 2/3] ARM: S5P: Add initial map for GPIO2 and GPIO3
[PATCH 3/3] ARM: S5PV310: Add support HSMMC on SMDKC210 and SMDKV310
