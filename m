From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V3 0/3] ARM: S5PV310: Move and Update L2 cache init code
Date: Thu, 21 Oct 2010 15:44:40 +0900
Message-ID: <1287643483-16046-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:49171 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753790Ab0JUGwt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Oct 2010 02:52:49 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch moves L2X0 cache init code from each machine to ARCH_S5PV310's cpu.c
for common usage and updates its feature such as L2X0 Prefetch and Power control
configuration.

Changes since v1 and v2:
- updated L2 cache init function's features.

[PATCH V3 1/3] ARM: Add L2X0 PREFETCH and POWER control register
[PATCH V3 2/3] ARM: S5PV310: Remove L2 cache init in machine
[PATCH V3 3/3] ARM: S5PV310: Add L2 cache init function in cpu.c
