Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AC827E7DD
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 13:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230766; cv=none; b=KjnH456K9qdoeSCJgVphqMFpu6k19ebcElCS1omUzJ8KkfT4AHN5MmJFbdRPvbYuL817fwUg9cN+ZbqhLtNiAS3xN+O4jROD70YQ/J1c1tdTSsGFgDZXD9lfMG88HM5a1CSmjP/mX7i3I0CKH/hROFcqNRZpydbl58Kl4IpJI70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230766; c=relaxed/simple;
	bh=yBKN8id0e8i0mID56sBX04JKOMEpNFcKtfCE5gt4YyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=kY+28LRPUu1c63UlF5RLVWdorna41Xz09K2xswrq5x2um0GSJYS3pNleGkVCd72+nWJl8t1bXCz8kocWNc3UCTOeD3CvzWKx5pGUBJt4VbNXwpmjGoWU52FA9VgR2iNij4PwNy7gU78APlM031bpNBhylG6kd2vTrvinTU8Ro9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PWHXu7GU; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PWHXu7GU"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250514135242epoutp04da8772437c8112a1221cf2551260cfbb~-aR8DUZSY1329913299epoutp04U
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 13:52:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250514135242epoutp04da8772437c8112a1221cf2551260cfbb~-aR8DUZSY1329913299epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747230762;
	bh=gCzfbZekv4htNUijIC+SbkqBGyLEFOMaleFjXJEgatk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PWHXu7GU4DodhpP21c0owWh81IqdK3akqHsSTo555BlTK6RSln4LIHHSVH0bVf+FJ
	 0b+/niCp/EE4DH/Nslvd0KkURVvHgenmh3kfh5NIywxvPsmHACnlF+nfYTAl1I+aL4
	 DtyVhBBhJ+QoUc4L1LJC3fBMg7CyNtAhLWvO1kLg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250514135241epcas5p1c532029629ae732c7dd6c2ed2db26353~-aR7f6P0V0362903629epcas5p13;
	Wed, 14 May 2025 13:52:41 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.178]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZyFCW6JtDz6B9m5; Wed, 14 May
	2025 13:52:39 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250514095242epcas5p43aab99ca456684f1689d3e37a44b0c88~-XAZkOEZN1927219272epcas5p4H;
	Wed, 14 May 2025 09:52:42 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514095242epsmtrp1cf1ae3b2305367497a64be3bf5ea5ed6~-XAZi_ipV1927519275epsmtrp1a;
	Wed, 14 May 2025 09:52:42 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-73-682467eac1b0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	11.9B.08766.AE764286; Wed, 14 May 2025 18:52:42 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514095239epsmtip24e9d87979a0f3e94d227111f61c1db9a~-XAWwEijB1817318173epsmtip2M;
	Wed, 14 May 2025 09:52:39 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	sunyeal.hong@samsung.com, shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	dev.tailor@samsung.com, chandan.vn@samsung.com, karthik.sun@samsung.com,
	Raghav Sharma <raghav.s@samsung.com>
Subject: [PATCH v2 3/3] arm64: dts: exynosautov920: add CMU_HSI2 clock DT
 nodes
Date: Wed, 14 May 2025 15:32:14 +0530
Message-Id: <20250514100214.2479552-4-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514100214.2479552-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJXvdVukqGQet/E4sH87axWUz4EmGx
	Zu85JovrX56zWtzbsYzdYv6Rc6wWjTPeMFmcP7+B3WLT42usFh977rFaXN41h81ixvl9TBYX
	T7laHFsgZvF95R1GiyNnXjBb/N+zg93i8Jt2Vot/1zayWEw+vpbVomnZeiYHUY/3N1rZPXbO
	usvusWlVJ5vH5iX1Hn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJWxf3InW8EDzoqrvVvYGxjf
	sncxcnJICJhI3Nk9jbGLkYtDSGA3o8T2PU+ZIRISEvv+/2aEsIUlVv57DtYgJPCWUWLFixwQ
	m01AS+LK9ndsIM0iAl1MEuf+vWIBSTAL7GSSWLleAsQWFvCX2Lj8MFicRUBVYt32PlYQm1fA
	WmL9zC8sEAvkJfYfPAu2mFPARuLri8vMEMusJVpezWGCqBeUODnzCdR8eYnmrbOZJzAKzEKS
	moUktYCRaRWjZGpBcW56brFhgWFearlecWJucWleul5yfu4mRnCUaWnuYNy+6oPeIUYmDsZD
	jBIczEoivNezlDOEeFMSK6tSi/Lji0pzUosPMUpzsCiJ84q/6E0REkhPLEnNTk0tSC2CyTJx
	cEo1MK3b/HpX2G6R0pszorWnbry2MKH1zKIbQQ9WiE7tsorvD/4puyXq89sc/wtdNiHThDel
	Wu1++33dg0XKsU7LNWRWdkrft9meu/oo+z+rllnXFwQ/P9+7dOW7mVz8tzZJZ+Ye8BNebPaw
	/qO4nUT+vGuSfwRiZiuozcgzUz5XJN/vtvFp3WGh+eK/ru2XS0+YtuKb7Xcd05ZnzE9/aTlv
	Fbi2bWpJq8oiRq7983rkWxWzOd5G/Tntbt33zsvzuETqbq4e89vAuCp++6eRz/f3g5hF9aLt
	QtY3Gn9vFKheONP6Eee77+8+nQv7s4J1yS+1XS8m972YJHvnpZy9x8PuzVuv1VuFfdZcvusN
	41sPvTlKLMUZiYZazEXFiQD/aOo/IQMAAA==
X-CMS-MailID: 20250514095242epcas5p43aab99ca456684f1689d3e37a44b0c88
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095242epcas5p43aab99ca456684f1689d3e37a44b0c88
References: <20250514100214.2479552-1-raghav.s@samsung.com>
	<CGME20250514095242epcas5p43aab99ca456684f1689d3e37a44b0c88@epcas5p4.samsung.com>

Add required dt node for CMU_HSI2 block, which
provides clocks to ufs and ethernet IPs

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 2cb8041c8a9f..7890373f5da0 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1048,6 +1048,23 @@ pinctrl_hsi1: pinctrl@16450000 {
 			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi2: clock-controller@16b00000 {
+			compatible = "samsung,exynosautov920-cmu-hsi2";
+			reg = <0x16b00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_NOC>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_NOC_UFS>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_UFS_EMBD>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_ETHERNET>;
+			clock-names = "oscclk",
+				      "noc",
+				      "ufs",
+				      "embd",
+				      "ethernet";
+		};
+
 		pinctrl_hsi2: pinctrl@16c10000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x16c10000 0x10000>;
-- 
2.34.1

