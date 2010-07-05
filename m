From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v3] Add support HSMMC on Samsung SMDKV210
Date: Mon,  5 Jul 2010 21:17:48 +0900
Message-ID: <1278332270-25178-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:59102 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750956Ab0GEMXx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jul 2010 08:23:53 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch adds support hsmmc on SMDKV210.

Changes since v2:

- Moved some codes for support hsmmc3 on smdkv210 to second patch

Changes since v1:

- Fixed wrong pin name in comments
- Adding missed call s5pv210_default_sdhci3() in s5pv210_map_io()
- Minor coding style fixes

[PATCH v3 1/2] ARM: SAMSUNG: Add device definition for HSMMC3
[PATCH v3 2/2] ARM: S5PV210: Add support HSMMC on SMDKV210
