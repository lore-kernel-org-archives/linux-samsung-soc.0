From: Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH 0/3] ARM: dts: add device data for exynos4412-trats2
Date: Wed, 26 Mar 2014 16:08:19 +0900
Message-ID: <53327CE3.8030800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:17197 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750991AbaCZHIY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Mar 2014 03:08:24 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>

This patchset add some device node for exynos4412-trats2.
It is based on v3.15-next/dt-samsung-2 branch.

exynos4412-trats2.dts
- Fix incorrect compatible. Compatible of AK8975 are "ak8975" or "asahi-kasei,ak8975".
- Add cm36651 light/proximity sensor device node.
- Change gpio-key device node. fix incorrect gpio property, and then add "ok-key" node.

Beomho Seo (3):
  ARM: dts: fix incorrect compatible for exynos4412
  ARM: dts: add cm36651 light/proximity sensor node
  ARM: dts: fixed gpio key node for exynos4412

 arch/arm/boot/dts/exynos4412-trats2.dts |   50 ++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 7 deletions(-)

-- 
1.7.9.5
