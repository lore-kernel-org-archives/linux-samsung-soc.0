From: Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH v2 0/3] ARM: dts: add device data for exynos4412-trats2
Date: Fri, 02 May 2014 15:37:38 +0900
Message-ID: <53633D32.8000809@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:8853 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751501AbaEBGhl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 02:37:41 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Myungjoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>

This patchset add some device node for exynos4412-trats2.
It is based on v3.15-next/dt-samsung-2 branch.

exynos4412-trats2.dts
- Fix incorrect compatible. Compatible of AK8975 are "ak8975" or "asahi-kasei,ak8975".
- Add cm36651 light/proximity sensor device node.
- Change gpio-key device node. fix incorrect gpio property, and then add "ok-key" node.

Changes in v2:
- Change ak8975 magnetic sensor compatible according to binding document.
- Change cm36651 light/proximity sensor compatible according to binding document and driver.

Beomho Seo (3):
  ARM: dts: fix incorrect compatible for exynos4412
  ARM: dts: add cm36651 light/proximity sensor node
  ARM: dts: fixed gpio key node for exynos4412

 arch/arm/boot/dts/exynos4412-trats2.dts |   50 ++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 7 deletions(-)

-- 
1.7.9.5
