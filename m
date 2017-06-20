From: Dongwoo Lee <dwoo08.lee@samsung.com>
Subject: [PATCH 0/2] Enable USB dual-role operation for TM2 and TM2E
Date: Tue, 20 Jun 2017 16:12:22 +0900
Message-ID: <1497942745-8607-1-git-send-email-dwoo08.lee__21525.4557937898$1497944654$gmane$org@samsung.com>
References: <CGME20170620071229epcas1p4076c72c941527ef3073e4036a7421cfb@epcas1p4.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15543 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750957AbdFTHoN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Jun 2017 03:44:13 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20170620074411epoutp02e1ecfc56fc3705aa3595235ca9f4b3ae~JxLlKB5vD0752807528epoutp02H
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Jun 2017 07:44:11 +0000 (GMT)
Received: from epsmgms2p2.samsung.com (unknown [182.195.42.80]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTP id
        20170620074410epcas5p43a7172b8f292f077ae94cc720c7b07ba~JxLksRMWi0916609166epcas5p4_
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Jun 2017 07:44:10 +0000
        (GMT)
Received: from gangnam.samsung ([10.113.62.47]) by mmp2.samsung.com (Oracle
        Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014)) with
        ESMTPA id <0ORU006I85HMWN60@mmp2.samsung.com> for
        linux-samsung-soc@vger.kernel.org; Tue, 20 Jun 2017 16:44:10 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: cw00.choi@samsung.com, andi.shyti@samsung.com, Dongwoo Lee <dwoo08.lee@samsung.com>

Since commit 9840354ff429 ("usb: dwc3: Add dual-role support") USB
dual-role operation on TM2 and TM2E can be enabled by simply adding
extcon property. However, exynos5433 dt has the mislabeled dwc3 node,
and thus we should resolve it first to apply the property.

This patchset fixes up the device tree fault and adds extcon property
to activate dual-role operation.

Dongwoo Lee (2):
  arm64: dts: exynos: Fix wrong label for USB 3.0 controller node
  arm64: dts: exynos: Add extcon property for TM2 and TM2E

 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 3 ++-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi            | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
1.9.1
