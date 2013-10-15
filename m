From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 0/2] Add G-Scaler device nodes to dt file
Date: Tue, 15 Oct 2013 16:50:52 +0530
Message-ID: <1381836054-6590-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:16673 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756771Ab3JOLAQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 07:00:16 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree@vger.kernel.org, khw0178.kim@samsung.com, prathyush.k@samsung.com, cpgs@samsung.com

This patchset adds clock entries to gsc power domain and gsc device
nodes to DT file

Note: This pathcset is rebased and tested on Kgene's for-next branch.

Leela Krishna Amudala (2):
  ARM: dts: Exynos5420: add clock entries to gsc power domain
  ARM: dts: Exynos5420: Add dt support for gscaler

 arch/arm/boot/dts/exynos5420.dtsi |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

-- 
1.7.9.5
