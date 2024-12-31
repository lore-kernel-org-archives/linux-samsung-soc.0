Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3AB165F1E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 06:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735628035; cv=none; b=aUTSm1O0qI5p9XBlleqNWfqbRs+o1rgZMiNebHBKe7UfmkSdQ/dAnp2GK2VcLssUdB/KgB2JtvHcOx10jZ+RPTrkIRL18sw8AQ2mA25cQUK9gJDV6/JFyQgquhNvpbbl6tOEjvkKsF/JFlyqIO9aqPhWeA1kSe392X1EtjFeMwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735628035; c=relaxed/simple;
	bh=DMAxsoVagSldhaiebSP92G1TLjwMIT8pumqA4xLCAK8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=MlU76WOzPgc8Y3t3ZUDwbMxjz9/QyJJ5G2JqMiS5x4mEIw+T6wgd6+dEFsvWUSEgWY3LZ8RPjeuChUHbqlD7Ncwhs3p0a6sOzSms2SlXJCd2UesZt9sfjKFjwa7MAzEgGrA1mn6VQWXdtLo6aHRIMfTvOulh1S+8vkcURfwyhkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=T6MUoXY+; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="T6MUoXY+"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241231065343epoutp029985f6ed97cabb00fd0d6435674568ad~WMH3vunvd2634026340epoutp02h
	for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 06:53:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241231065343epoutp029985f6ed97cabb00fd0d6435674568ad~WMH3vunvd2634026340epoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1735628023;
	bh=QmEegIRzUN94auc1xTuuf1HhdMTYdSCFzKxkBFIAO38=;
	h=From:To:Cc:Subject:Date:References:From;
	b=T6MUoXY+022KQsNRLrLrQVL5bZZwYPpoxcfnssqplhEjKLQmBYc94FVaKv108o/td
	 nLqpg9rNkFPwV/BgUTaKcGA/VWxEdDl0/cyEj7hCOGuFZzzcpBHxNH4jnddsxasxFi
	 Sw4JHpmH6HvNTirFE10EjmG7ZNQ9uYMDF+CPwUfo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20241231065343epcas5p2d7ee2f7d2d04ee1ea7412b2e712e1ca8~WMH3V395Z0763307633epcas5p2a;
	Tue, 31 Dec 2024 06:53:43 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4YMkFx3TNhz4x9Q5; Tue, 31 Dec
	2024 06:53:41 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	C2.51.19956.5F493776; Tue, 31 Dec 2024 15:53:41 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20241231063730epcas5p4137cc2e3d805cb08e1675b056ef186dc~WL5s6LuDy3145231452epcas5p4S;
	Tue, 31 Dec 2024 06:37:30 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241231063730epsmtrp28d4dbc4b0ee97a8cb35e1a4a09d7b555~WL5s5J9rb0347203472epsmtrp2O;
	Tue, 31 Dec 2024 06:37:30 +0000 (GMT)
X-AuditID: b6c32a4b-fd1f170000004df4-c7-677394f565bd
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	6D.80.33707.92193776; Tue, 31 Dec 2024 15:37:29 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241231063728epsmtip240598124c1c8ba626663101efdbad2fc~WL5rjpilp2312923129epsmtip2i;
	Tue, 31 Dec 2024 06:37:28 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: alim.akhtar@samsung.com, dev.tailor@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: add cpu cache information to ExynosAuto-v920
Date: Tue, 31 Dec 2024 12:13:50 +0530
Message-Id: <20241231064350.523713-1-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnk+LIzCtJLcpLzFFi42LZdlhTU/frlOJ0g/enxS0ezNvGZrFm7zkm
	i3s7lrFbzD9yjtXi5ax7bBabHl9jtbi8aw6bxYzz+5gs/u/Zwe7A6bFpVSebx+Yl9R59W1Yx
	enzeJBfAEpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuW
	mQN0ipJCWWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwKRArzgxt7g0L10vL7XEytDA
	wMgUqDAhO2PW88lsBbuVK86u2MDWwPhOqouRk0NCwETi8vOrrF2MXBxCArsZJfauf8MG4Xxi
	lDh/ewoLnPPw/EcWmJa3374zg9hCAjsZJQ6uToUoes8ocXnjFUaQBJuAjsSzo7eZQGwRgXyJ
	6yd2gU1iFmhnlDg15wY7SEJYwFNi2u51bCA2i4CqxNqzb8DivAI2Es8P32KH2CYvsf/gWWaI
	uKDEyZlPwK5gBoo3b53NDDJUQuASu8T/vs9QDS4Sp16chbKFJV4d3wJlS0l8freXDcLOl/hy
	aBczhJ0jsf7VDKgae4nVC84AQ4MDaIGmxPpd+hBhWYmpp9YxQezlk+j9/YQJIs4rsWMeiM0B
	ZKtIvP9uCbPpxb09UCUeEosfz2SCBFasxOqWZcwTGOVnIflmFpJvZiEsXsDIvIpRMrWgODc9
	tdi0wDgvtRwescn5uZsYwSlSy3sH46MHH/QOMTJxMB5ilOBgVhLhPZdUkC7Em5JYWZValB9f
	VJqTWnyI0RQYxBOZpUST84FJOq8k3tDE0sDEzMzMxNLYzFBJnPd169wUIYH0xJLU7NTUgtQi
	mD4mDk6pBqY5i87d/t2Q9tfDWl+3m4+/d+kT98/bzPmdbGbZe87Pua6a7yRx5Y61wUENd4GD
	T5OYbkScCFzo9fTD83337U+tZzhS17KPYTpr55Fay4Jv6UcErlww2JcRI3K/JdivxHPx0oW/
	vX6ImXf1vfWtKu7pFNskvX1pTFOoU0eBW9jJafoGa4LS7BWybu6Mvx4jMjdqt8HWT0WrdjeG
	znmQGcy2aUqGX20837twq/9V2nGh7Yf0BM7NNv9XPWPr4YXz5r/3eV0XfC7J5m/Qof0Jd49O
	1Am5w2fHGLom5/ua5d9VV1+KuTZhi/5diXnhG+52flB5vFnrYvgNwbnZ279vC/Ti/7vu86a7
	9UETlsY9UpurxFKckWioxVxUnAgAOdJWixoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHLMWRmVeSWpSXmKPExsWy7bCSvK7WxOJ0g822Fg/mbWOzWLP3HJPF
	vR3L2C3mHznHavFy1j02i02Pr7FaXN41h81ixvl9TBb/9+xgd+D02LSqk81j85J6j74tqxg9
	Pm+SC2CJ4rJJSc3JLEst0rdL4MqY9XwyW8Fu5YqzKzawNTC+k+pi5OSQEDCRePvtO3MXIxeH
	kMB2Ron7xzuYIBJSEh0tG6BsYYmV/56zQxS9ZZTYs/8jM0iCTUBH4tnR20BFHBwiAqUS5x8m
	gtQwC3QzSkzv2sMGUiMs4Ckxbfc6MJtFQFVi7dk37CA2r4CNxPPDt9ghFshL7D94lhkiLihx
	cuYTFhCbGSjevHU28wRGvllIUrOQpBYwMq1iFE0tKM5Nz00uMNQrTswtLs1L10vOz93ECA5S
	raAdjMvW/9U7xMjEwXiIUYKDWUmE91xSQboQb0piZVVqUX58UWlOavEhRmkOFiVxXuWczhQh
	gfTEktTs1NSC1CKYLBMHp1QDEy+j+RIPbudbdY5rvKUOS6802ftfp3XL2TfOq3m+7/5gy7vd
	UePAbnmj5hX3jxme0+KI/PT00g6/7e2Hu4OYpQrl9j9NSZ39gOd/S/TS7XvscmM29ual9CRy
	7tPj2it85+FcriNdnQt+HjTwr1z8Rjz8l8PtKxJcAgUXTyowpPWEHhPoP3332pIdGrXWy65f
	Djp5+eHlTLvgz1+Nkq8IZ/Q/mr01oPN2ota/jUv3fDK+I7Ml7Oehr+oC4mUzYza/XR00ef32
	aPMbU031trXJvzD9sfhTxhKdL4ZOs1eHSer8TL3wYl/L5LNvDisxxe5cq38jxOf1nYVWq1XZ
	l2Q1/fNuvZ3RUXz50lnLGUz3pPcpsRRnJBpqMRcVJwIANZx0S8ECAAA=
X-CMS-MailID: 20241231063730epcas5p4137cc2e3d805cb08e1675b056ef186dc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241231063730epcas5p4137cc2e3d805cb08e1675b056ef186dc
References: <CGME20241231063730epcas5p4137cc2e3d805cb08e1675b056ef186dc@epcas5p4.samsung.com>

Add CPU caches information to its dt nodes so that the same is
available to userspace via sysfs. This SoC has 64/64 KB I/D cache
for each cores and 256KB of L2 cache.

Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index eb446cdc4ab6..3ca4c8902aa1 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -89,6 +89,13 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu1: cpu@100 {
@@ -96,6 +103,13 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu2: cpu@200 {
@@ -103,6 +117,13 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu3: cpu@300 {
@@ -110,6 +131,13 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu4: cpu@10000 {
@@ -117,6 +145,13 @@ cpu4: cpu@10000 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu5: cpu@10100 {
@@ -124,6 +159,13 @@ cpu5: cpu@10100 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu6: cpu@10200 {
@@ -131,6 +173,13 @@ cpu6: cpu@10200 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x10200>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu7: cpu@10300 {
@@ -138,6 +187,13 @@ cpu7: cpu@10300 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x10300>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu8: cpu@20000 {
@@ -145,6 +201,13 @@ cpu8: cpu@20000 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x20000>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu9: cpu@20100 {
@@ -152,6 +215,22 @@ cpu9: cpu@20100 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x20100>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
+		};
+
+		cpu_l2: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x40000>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 
-- 
2.34.1

