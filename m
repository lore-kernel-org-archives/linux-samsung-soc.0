Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40C084D0E
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Nov 2024 04:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730952924; cv=none; b=Njl8dXsQCUJeuidZRF1idXA16d1wR8yh4uyChFPK3cFHMmn4my1Ukgps5n3E25VNybp+BZcKM9MGVA55R/2vP2mtt47Y7IJjhadMy95nLMlaijjW4IBlG/JbzxWcYIw8idk9giePgiebW+JgbVwiJcEQBDnpYIIELDPQ5Q7MZOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730952924; c=relaxed/simple;
	bh=QABnyB8t+mbVYTcrOswPKfJYqmTUQ3Cu656Yo1uCteo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=CsqRAZjl/WZ3OJfq+9TeWH403zKgywqRvnzLTGsHvbLdicjb/QsE7cg/1m2CqFaLI7SXMi20WZvU8xClKb7FMPU9fScmy+TJhFZoBZs91G7fEXmel/6M3pZ572tppxvv6GQ/+u1WNafTVZsVvCsQFgoWCSOqPKxz8w/aZ8PTJto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dDQwc9FW; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dDQwc9FW"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241107041512epoutp02231c6b706b66e2df5d859fe912c96770~FlIDJt6511131811318epoutp02Y
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Nov 2024 04:15:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241107041512epoutp02231c6b706b66e2df5d859fe912c96770~FlIDJt6511131811318epoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1730952912;
	bh=ukknsEvSKS0z9N9R800ie8XJb8IbzjMM+uty81RzwcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dDQwc9FW7LMv7giFvrvSLFCo0xV63d7AUqEe6Vo4neDYmMX5ipj8snsfC6fJ8l3lJ
	 f6zk8qpAB1y/rytQ1ADDt6QHSwp23+saGy80wGup4o7rm5V06lC26G5u81ouGCNMwT
	 dsNzYBPtq8+FSGopthXKShb9ZLfOSyilfah4gEoQ=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20241107041512epcas2p45cbe2eea0868a323e667c1222e9c8f4f~FlIC3Qr6I2962829628epcas2p4a;
	Thu,  7 Nov 2024 04:15:12 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4XkTHz3gQkz4x9QJ; Thu,  7 Nov
	2024 04:15:11 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	10.60.09770.FCE3C276; Thu,  7 Nov 2024 13:15:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20241107041511epcas2p2aab4dd983341ecc193252cd21135da96~FlIBwq9ls2218122181epcas2p2i;
	Thu,  7 Nov 2024 04:15:11 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241107041511epsmtrp1f7919bbea45eb98748129264dc03882a~FlIBvuBnR2424024240epsmtrp1c;
	Thu,  7 Nov 2024 04:15:11 +0000 (GMT)
X-AuditID: b6c32a46-00dfa7000000262a-40-672c3ecfca21
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	64.DF.35203.FCE3C276; Thu,  7 Nov 2024 13:15:11 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241107041510epsmtip2906c77d8ffd733eb1614da97622eaf05~FlIBig7MX1190811908epsmtip2d;
	Thu,  7 Nov 2024 04:15:10 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH 3/3] arm64: dts: exynosautov920: add ufs phy for
 exynosautov920 SoC
Date: Thu,  7 Nov 2024 13:15:05 +0900
Message-ID: <20241107041509.824457-5-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107041509.824457-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmhe55O510g3tHJC0ezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLf4/fMQk8XOOyeYHbg9Nq3q
	ZPPo27KK0ePzJrkA5qhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRb
	JRefAF23zBygg5QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BeYFesWJucWleel6
	eaklVoYGBkamQIUJ2RkLF65gK3jLUXGrYzpjA+My9i5GDg4JAROJX/9Cuxi5OIQEdjBKvFjY
	zAbhfGKUeHL+LjOE841RYmrzb6YuRk6wjg1fpkNV7QWq2t7LCOH8YpR4dGwHC8hcNgFViWsN
	VSCmiEClxNxlziAlzAK9jBL9d9aygAwSFgiVmHPxISuIzQJUPv3lfHYQm1fASqL75DFmiGXy
	EhfXPGcDsTkFrCVmXXsKVSMocXLmE7A5zEA1zVtng10qIfCTXWL36pmMEM0uQINmsULYwhKv
	jm9hh7ClJF72t0HZ+RLrH95lg7ArJO4e+s8CYdtLLDrzExxGzAKaEut36UOCS1niyC2otXwS
	HYf/QkORV6KjTQiiUUmi4/wcaFBJSKx6MRlquIfEgxdzweJCAn2MEivn1kxgVJiF5JlZSJ6Z
	hbB3ASPzKkax1ILi3PTUYqMCI3j0JufnbmIEp04ttx2MU95+0DvEyMTBeIhRgoNZSYTXP0o7
	XYg3JbGyKrUoP76oNCe1+BCjKTCoJzJLiSbnA5N3Xkm8oYmlgYmZmaG5kamBuZI4773WuSlC
	AumJJanZqakFqUUwfUwcnFINTOsDli2UXZryr2r/zGPb5c250qvOJsWY8Yln/RFyP/nxwuek
	nvXhLv9qDPknHjrDfeph8/t6s2M9m4Pllp2y22bPoOZ3/fb56a93rop3rYv5+W13+Z0pTTkV
	DYcvmsWu9Lj39snnjMuHWM/NyvkjJJfHf4ozIb/VK2JNkcTnrQ/bkiuTBQyfas7tYqwRcqpn
	OKN2/LmJ9pmLq6sN3MwY+uaKlHfNrea1+jshUFN42+GX94SYomJvrw9uNPx385N/0d/X7iZB
	++/OrtE6mP6vP1PG1mGN+H++rdaMUSLfFcW/9LV/6TFIipXhfZIy64fgtKacZ3k3Pa/OvNRx
	UKm97tjkc9enzfIxbRfiFko+psRSnJFoqMVcVJwIACZV95MmBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWy7bCSvO55O510g+alLBYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLS7vmsNmMeP8PiaL/3t2sFv8/nmIyWLnnRPMDtwem1Z1
	snn0bVnF6PF5k1wAcxSXTUpqTmZZapG+XQJXxsKFK9gK3nJU3OqYztjAuIy9i5GTQ0LARGLD
	l+lsILaQwG5GiVlrdSHiEhLf3uxhgrCFJe63HGHtYuQCqvnBKLHh7iWgBAcHm4CqxLWGKpC4
	iEAjo8TzD5OZQRxmgYmMEufnHQHbICwQLLHgbBMriM0C1DD95XywOK+AlUT3yWPMEBvkJS6u
	eQ52BaeAtcSsa0/ZIS6ykni6dSFUvaDEyZlPWEBsZqD65q2zmScwCsxCkpqFJLWAkWkVo2Rq
	QXFuem6xYYFhXmq5XnFibnFpXrpecn7uJkZwqGtp7mDcvuqD3iFGJg7GQ4wSHMxKIrz+Udrp
	QrwpiZVVqUX58UWlOanFhxilOViUxHnFX/SmCAmkJ5akZqemFqQWwWSZODilGpiWNrLMWPQm
	YJ1sru+3x2+kbD8GSG6SurZ08tb373LFJi/Is/XcffUir9SWRO69eTNM84Wiyn3u3nviZFlk
	Y150xyfp7sZXP7d6/5NwrlN6zVLbwb97e9ObbpFLYkfs3X0PKK2/ExHLlHSp6fiThHO5TFvW
	WQv9aqn8tSn9lf/NJ9fuTBU/ECjhsX7qjOOTWYtDgmM406ar15XFF/0wNY7XnswQ+J1v0/ZQ
	mZ4SQ618w25OHvH9ojumLli4d8uMrEn/Fn9b/vbWH5Obq6YbhuvHhxSvXSN6gGOnuYjy3VXn
	3s7//ZX7iNcutZeOfcY9ubJXfYySsrYXpKxJvHhYUPH0U6kbP5p0OzTsvX84nbutxFKckWio
	xVxUnAgAqagXNeQCAAA=
X-CMS-MailID: 20241107041511epcas2p2aab4dd983341ecc193252cd21135da96
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241107041511epcas2p2aab4dd983341ecc193252cd21135da96
References: <20241107041509.824457-1-sowon.na@samsung.com>
	<CGME20241107041511epcas2p2aab4dd983341ecc193252cd21135da96@epcas2p2.samsung.com>

Add UFS Phy for exynosautov920

Like exynosautov9, this also uses fixed-rate clock nodes until clock driver
has been supported. The clock nodes are initialized on bootloader stage
thus we don't need to control them so far.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index c759134c909e..505ba04722de 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -361,6 +361,17 @@ pinctrl_aud: pinctrl@1a460000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x1a460000 0x10000>;
 		};
+
+		ufs_0_phy: phy@16e04000 {
+			compatible = "samsung,exynosautov920-ufs-phy";
+			reg = <0x16e04000 0x4000>;
+			reg-names = "phy-pma";
+			clocks = <&xtcxo>;
+			clock-names = "ref_clk";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.45.2

