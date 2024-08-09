Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5302719309E
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Aug 2024 11:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723204513; cv=none; b=ucvUonfiH+Oa58iOXFhhRcqceWyYLKuIYe5OhNGS6UBH0rvh5kTWo5uFUloE2faDCMVhRaP8G5eNylIxn61PKYjftMEtycuGIiNMoJDY+EOt19yH/8FSRDfzkLqWqmW0zG203+926FPdH6t96DO9JceS74cy+W5Q8mvaKgE9JwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723204513; c=relaxed/simple;
	bh=HuB7+0+lduSH9n1aXvH8QNrnF1qWMCAkwysWDaRzhD0=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=JgTlGlYqkGxJqOCwrVboEItZzqjJWfdDjgJuCBBv/bkQb26g+2O3eR+PKUWhwA7tqzCGydft8TmviAxPORRy1pQKvyKe7mmu7VinhwZn7CdLzX3oXHE0R2TuI1oEGG8/kfXM8ByU1Hm0T1D8fyPQQp1Mk3cRF0Z7W89SmMQuQeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ICbuff3e; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ICbuff3e"
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240809115503epoutp030f0a59ef948e99a9963d28b90e23469d~qDV2cyNE-1179211792epoutp03B
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Aug 2024 11:55:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240809115503epoutp030f0a59ef948e99a9963d28b90e23469d~qDV2cyNE-1179211792epoutp03B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1723204503;
	bh=ti7n4jh2Mw4aPtoeVYGdhmFH2buwD7PP1gN8PvkU+dE=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=ICbuff3evaMoD6SzfOPP7flmn7OEYloAtVHmdnlXgFCf2AfB57EcjLB5zlWaNxQWz
	 q6pXWmdYNUle3vF2Ua8UxbAtiYFAxxSxI5KjRQRyFGJYgJqhErfAXoXD3zUrSX+SzI
	 qWpBYOe8CaTUPSrpXuJtHIWzyvzdopI/Lrolmfug=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240809115502epcas1p20f0142917c7ebe3eee2f5ceb0d56816e~qDV1pGtJd2527425274epcas1p26;
	Fri,  9 Aug 2024 11:55:02 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.36.133]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WgMm500JSz4x9Pp; Fri,  9 Aug
	2024 11:55:00 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	B5.64.09623.49306B66; Fri,  9 Aug 2024 20:55:00 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20240809115500epcas1p34ab112e1a0da7247257b9cb8f7eafbe9~qDV0BN07Q1924619246epcas1p3B;
	Fri,  9 Aug 2024 11:55:00 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240809115500epsmtrp286e6eab320d9cc97c0418703f68f4318~qDV0AU9fs2146221462epsmtrp2c;
	Fri,  9 Aug 2024 11:55:00 +0000 (GMT)
X-AuditID: b6c32a36-ef9ff70000002597-19-66b603949296
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	03.17.07567.49306B66; Fri,  9 Aug 2024 20:55:00 +0900 (KST)
Received: from [127.0.1.1] (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240809115500epsmtip1722a39cd18b3a29652fac75e15101e29~qDVzswwKm0525105251epsmtip1J;
	Fri,  9 Aug 2024 11:55:00 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
Date: Fri, 09 Aug 2024 20:54:13 +0900
Subject: [PATCH v3 2/3] arm64: dts: exynosautov9: add dpum clock DT nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-clk_dpum-v3-2-359decc30fe2@samsung.com>
In-Reply-To: <20240809-clk_dpum-v3-0-359decc30fe2@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,  Sylwester Nawrocki
	<s.nawrocki@samsung.com>,  Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>, Chanho Park <chanho61.park@samsung.com>, 
	Tomasz Figa <tomasz.figa@gmail.com>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Kwanghoon Son <k.son@samsung.com>
X-Mailer: b4 0.14.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGJsWRmVeSWpSXmKPExsWy7bCmvu4U5m1pBg0HzSwezNvGZnF5v7bF
	mr3nmCyuf3nOajH/yDlWi941V5ksXs66x2Zx/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlc
	POVq8X/PDnaLw2/aWS3+XdvIYrFq1x9GB0GP9zda2T12zrrL7rFpVSebx+Yl9R59W1Yxenze
	JBfAFpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0
	upJCWWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLRArzgxt7g0L10vL7XEytDAwMgU
	qDAhO2NGzzfGgv3sFXtn7mVrYJzB1sXIySEhYCLx7+5lIJuLQ0hgB6PE7Mb/jBDOJ0aJKW+X
	MUE43xglWs+dYoJpeX6kgxkisZdR4sfu2VAtrxgl+h7eYQGpYhNQl1jStpYdxGYRUJVYsnkV
	mC0s4CmxfP4BRhCbV0BQ4uTMJ2D1zALyEtvfzmGGiNtKHLy5FszmFLCTOHbsFCvIAhGB/cwS
	px4+B7uWWeAEo8Sv2wsYIW4Slvi8ew1YQkLgAofEyem32CESLhJr1i+EK3p1fAtUXEri87u9
	0DDIljj6EcYukbg+axErhG0ssX/pZKCnOYC2aUqs36UPcSmfxLuvPawgYQkBXomONiEIU17i
	Vmc5RKOoxJmnH6EGekgsPfaNFRJAExkluiYsZ5zAKD8Lyf+zkPw/C2HZAkbmVYxiqQXFuemp
	xYYFRvB4Tc7P3cQITsBaZjsYJ739oHeIkYmD8RCjBAezkghvc/imNCHelMTKqtSi/Pii0pzU
	4kOMpsBYmMgsJZqcD8wBeSXxhiaWBiZmRsYmFoZmhkrivGeulKUKCaQnlqRmp6YWpBbB9DFx
	cEo1ME1vTe38+IexdE1L3IPGeauXzLwid4Hdb5qGMJeKyfyctzPvmLza9rBWtvdg5Vb9OZOv
	mt+M6FWUe2Jz6U5Tr+PRirIby95fZKt6/WWvsu+0LYzH9WZYf65J3mDn72thF/1NQqzxVYja
	BqZ5T1wmKW2cGe8n6L0zpDz51U7DkONsctxhf5zbF6SqNk9ft1lwWnGaT2Z/p8Trno5zNjVb
	eaY5pcy99Ld52p253ZdnCG/afjt2ib3MJbnwWWvXG4QcP7J2usWpU8kH1Cb/kj2o0H9Z94Re
	uc62iscNojwLmmon1monb1+/tUZs36y1ByXD4/ycX9rXCn5ocXwkt2vx/elKMp8TPh31eeKc
	+lywjluJpTgj0VCLuag4EQBvynJUSQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsWy7bCSnO4U5m1pBsePiVs8mLeNzeLyfm2L
	NXvPMVlc//Kc1WL+kXOsFr1rrjJZvJx1j83i/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4
	eMrV4v+eHewWh9+0s1r8u7aRxWLVrj+MDoIe72+0snvsnHWX3WPTqk42j81L6j36tqxi9Pi8
	SS6ALYrLJiU1J7MstUjfLoErY0bPN8aC/ewVe2fuZWtgnMHWxcjJISFgIvH8SAdzFyMXh5DA
	bkaJBUfOM0MkRCU6LjcydjFyANnCEocPF0PUvGCUWHvyHStIDZuAusSStrXsIDaLgKrEks2r
	wGxhAU+J5fMPMILYvAKCEidnPmEBmcMsoCmxfpc+SJhZQF5i+9s5zBAlthIHb65lBikRArLP
	PwE7jVPATuLYsVOsIGtFBA4yS/x+840dxGEWOMkoMXHBdnaIO4UlPu9ewzaBUXAWknWzENbN
	QrJuASPzKkbJ1ILi3PTcZMMCw7zUcr3ixNzi0rx0veT83E2M4FjT0tjBeG/+P71DjEwcjIcY
	JTiYlUR4m8M3pQnxpiRWVqUW5ccXleakFh9ilOZgURLnNZwxO0VIID2xJDU7NbUgtQgmy8TB
	KdXA5B/xmyvlU57uxRn9B2rETlpN57Cfdj58sm721E9i74/tPaqQ8XvtfFvGnGnrHzRcerpv
	Sj2zy4qvd5JP3bnxy7NRXkj1gHxYt7T/5Iqn3HMmWPDN6mTwUKrs+7bDR2fDWpk6z0+2mz7a
	BRrfFOdoWde7eNckzzTG5YtSApZ+qlc6YRLykcm4cuqJsv3Cvs9FEqcbCYrsl1t6efvqqzIz
	nmefmDFDOrSSkdXh4tdVRaVHTrPdsy0WTQmbrprU4BCYvn7K77nateJ1E5La/3wv2dG5ZL52
	IoO3LN/twpd/ldmVby+/mx6c8vO3kqm59htxZ/cS/vfKuov0Ld4sDZDu2M//2Ob31q8JfsF/
	nMynKLEUZyQaajEXFScCAPs2wREkAwAA
X-CMS-MailID: 20240809115500epcas1p34ab112e1a0da7247257b9cb8f7eafbe9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240809115500epcas1p34ab112e1a0da7247257b9cb8f7eafbe9
References: <20240809-clk_dpum-v3-0-359decc30fe2@samsung.com>
	<CGME20240809115500epcas1p34ab112e1a0da7247257b9cb8f7eafbe9@epcas1p3.samsung.com>

Add dpum clock for sysmmu, dpu.

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 0248329da49a..599e72824875 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -251,6 +251,16 @@ cmu_fsys2: clock-controller@17c00000 {
 				      "dout_fsys2_clkcmu_ethernet";
 		};
 
+		cmu_dpum: clock-controller@18c00000 {
+			compatible = "samsung,exynosautov9-cmu-dpum";
+			reg = <0x18c00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_DPUM_BUS>;
+			clock-names = "oscclk", "bus";
+		};
+
 		cmu_core: clock-controller@1b030000 {
 			compatible = "samsung,exynosautov9-cmu-core";
 			reg = <0x1b030000 0x8000>;

-- 
2.39.2

