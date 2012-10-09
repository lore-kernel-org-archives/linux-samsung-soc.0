From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V4 0/2] video: exynos_dp: Add device tree support to DP driver
Date: Wed, 10 Oct 2012 04:38:19 +0530
Message-ID: <1349824101-32574-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52232 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752262Ab2JIOEW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Oct 2012 10:04:22 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, jg1.han@samsung.com, devicetree-discuss@lists.ozlabs.org
Cc: FlorianSchandinat@gmx.de, sylvester.nawrocki@gmail.com, tomasz.figa@gmail.com, thomas.ab@samsung.com

Changes from V3:
	--Fix typos in the documentation file "exynos_dp.txt".
	--Use variable name enable_mask instead of enable_bit.
	--Use property name samsung,dp_phy instead of dp-phy.

To linux-fbdev:
  [PATCH V4 1/2] video: exynos_dp: Add device tree support to DP driver

To devicetree discussion list:
  [PATCH V4 2/2] video: exynos_dp: device tree documentation

 .../devicetree/bindings/video/exynos_dp.txt        |   81 ++++++++++
 drivers/video/exynos/exynos_dp_core.c              |  168 ++++++++++++++++++--
 drivers/video/exynos/exynos_dp_core.h              |    2 +
 3 files changed, 239 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/video/exynos_dp.txt
