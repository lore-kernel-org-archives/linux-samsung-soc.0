From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/2] regulator: max8952: Add support for Device Tree
Date: Thu, 04 Apr 2013 18:17:18 +0200
Message-ID: <1365092240-8956-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54232 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762887Ab3DDQRa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 12:17:30 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, lrg@ti.com, broonie@opensource.wolfsonmicro.com, myungjoo.ham@samsung.com, kgene.kim@samsung.com, Tomasz Figa <t.figa@samsung.com>

This series adds Device Tree support to max8952 voltage regulator driver.
First patch prepares platform data structure to be generated at runtime
from data parsed from device tree. Second patch implements Device Tree
binding and adds necessary documentation.

Tested on Universal C210 board.

Tomasz Figa (2):
  regulator: max8952: Separate constraints from platform data struct
  regulator: max8952: Add Device Tree support

 .../devicetree/bindings/regulator/max8952.txt      | 52 +++++++++++++++
 arch/arm/mach-exynos/mach-universal_c210.c         | 27 ++++----
 drivers/regulator/max8952.c                        | 74 +++++++++++++++++++++-
 include/linux/regulator/max8952.h                  | 10 +--
 4 files changed, 143 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/max8952.txt

-- 
1.8.1.5
