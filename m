From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 0/2] Add device tree support for sdhci-s3c driver
Date: Sun, 17 Jul 2011 10:21:13 +0530
Message-ID: <1310878275-1422-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:27653 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942Ab1GQEjt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jul 2011 00:39:49 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOG00DSGNM95P10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 17 Jul 2011 13:39:48 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOG00EGHNM4T7@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 17 Jul 2011 13:39:48 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: cjb@laptop.org, ben-linux@fluff.org, linux-mmc@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This patchset adds basic device tree support for sdhci-s3c driver.
The changes included in this patchset are

A. A copy of the platform data is kept in the drivers private data and
   that copy is referenced for further access to platform data.
B. Some of the platform data elements are retrived from the device tree
   node. The device tree based probe support using a compatible string
   matching is also added.

Changes since v1:
* Obtain some of the platform data from device tree as suggsted by
  Grant Likely.

Thomas Abraham (2):
  mmc: sdhci-s3c: Keep a copy of platform data and use it.
  mmc: sdhci-s3c: add device tree probe support

Thomas Abraham (2):
  mmc: sdhci-s3c: Keep a copy of platform data and use it
  mmc: sdhci-s3c: add device tree probe support
