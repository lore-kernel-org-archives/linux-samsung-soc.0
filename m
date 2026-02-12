Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8E12BE647
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884484; cv=none; b=nnLbrKGJE8Lev8fqo8DNbIDC7RH0z61RnKBCJWgGwIasF0GqChOH9TNHnjCPGKBF2MCnsa8uHGv3Z5V6MghnOm6LfuUtlYptwiQcoYDQBfC5ybIpviKdU6VWmmhjjIH5lteQFzGCT7muU3ugogteegne08DP+X807SKyg8X5gVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884484; c=relaxed/simple;
	bh=i2C4QG32uqinxmG+92zNMFriCWwEXJhhsJXYSYJnB+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=uaba9kUxSP89eWyoDghd9U1ELWE1fSeKWw1gTB4tZYLXz1F97aGP1UOByZfxlesrqetU6HnT09hag+AjLEHb9oV9HIia0JYGw/azI54qLcNT7gSmRkbvo1MLXUriBEDlCN+ZfGdiHBPFldc0MRv3fgwI7b+KTJZ43uNxtGukYSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vJWWlKJb; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vJWWlKJb"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260212082121epoutp0227f99c90596fd0463e14b10fb68b55e1~Tcg2-0p7j0600906009epoutp02K
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 08:21:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260212082121epoutp0227f99c90596fd0463e14b10fb68b55e1~Tcg2-0p7j0600906009epoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770884481;
	bh=QJr6ZwYHC77eHqB4PbJ9qOH8wUGggnjBluftMUJoltU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vJWWlKJbZ1ojOdZgX/IsfkhowEfRyjI7tLe5WeETiH6aph4j4bhNRJa/JqAbJdqee
	 YiB1omGg+WwWD7AnxAuUnIdP8ZfV6ctIdI+PlX1fpMoHgmdBsoyAHEoi6gUd8T4yMX
	 cHy7Cl7JsF6YpGM0fggtM20ZZC3yKDpgPv+ngPv4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20260212082121epcas2p2c521dc6014dc4ae082f1391593640d73~Tcg2jSnMa1450514505epcas2p2x;
	Thu, 12 Feb 2026 08:21:21 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.204]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4fBStn15pfz6B9mL; Thu, 12 Feb
	2026 08:21:21 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20260212082120epcas2p4c6d8af1b07e82baded76eb356c9b87ee~Tcg13PRPb1340313403epcas2p4G;
	Thu, 12 Feb 2026 08:21:20 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260212082120epsmtip13610ddac2922bc1f19dbba658114bc75~Tcg1wg_pT2276322763epsmtip10;
	Thu, 12 Feb 2026 08:21:20 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com, Sanghoon Bae <sh86.bae@samsung.com>
Subject: [PATCH v2 2/2] arm64: dts: exynosautov920: Add hsi0 syscon node for
 PCIe PHY
Date: Thu, 12 Feb 2026 17:21:04 +0900
Message-ID: <20260212082105.1878720-3-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260212082105.1878720-1-sh86.bae@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260212082120epcas2p4c6d8af1b07e82baded76eb356c9b87ee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260212082120epcas2p4c6d8af1b07e82baded76eb356c9b87ee
References: <20260212082105.1878720-1-sh86.bae@samsung.com>
	<CGME20260212082120epcas2p4c6d8af1b07e82baded76eb356c9b87ee@epcas2p4.samsung.com>

Add the syscon-hsi0 node to control PCIe PHY power, PLL settings,
and device direction (RC/EP mode) on ExynosAutov920.

Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 2cb8041c8a9f..d21f8e008a00 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1021,6 +1021,12 @@ cmu_hsi0: clock-controller@16000000 {
 				      "noc";
 		};
 
+		syscon_hsi0: syscon@16030000 {
+			compatible = "samsung,exynosautov920-hsi0-sysreg",
+				     "syscon";
+			reg = <0x16030000 0x1000>;
+		};
+
 		pinctrl_hsi0: pinctrl@16040000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x16040000 0x10000>;
-- 
2.45.2

