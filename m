From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: Add support HSMMC on Samsung SMDKV210
Date: Thu, 10 Jun 2010 18:21:49 +0900
Message-ID: <1276161711-17523-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:37540 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754982Ab0FJJ2U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jun 2010 05:28:20 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patches add support HSMMC for S5PV210.

[PATCH 1/2] ARM: SAMSUNG: Add device definition for HSMMC3
[PATCH 2/2] ARM: S5PV210: Add support HSMMC on Samsung SMDKV210
