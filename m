Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C254722D78A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Aug 2025 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754564005; cv=none; b=V6OwrDovgHX/xzPqMZ43YuPM1XsmmBPVDrw/lQm/sqUr7CGOaqUJUu9dAbzrGXw68L6T7kBuiDvkdFY/uJzClZTyhG+moAmxjZddkVL7jr5r8Vqe5tyVYBgZPbfVzFUBvp8DeqNQfghuqjQuXztXbTl5doU5BiyWVuSQ6O2IcqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754564005; c=relaxed/simple;
	bh=bDc/gVJY2hnTBzD2UdxuQAZGeo6dOIRDVvep5JEl724=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ZGZpVum/l5lx4Xf9IuLd6UiE9wAMHJb9MH/yqeS2Ws0salSyMZ/3bWhwMjLxM6XaF1du/elhJbvlCLr+eZ6AuzJLo5DvTvFWMaMBQC6eplJKSdonyMNk+/zViuOo3WbemXqZsCcg7SCUs2xaeqTET+WCYXUgaMvoedeqSCYTcP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PtHOQbOg; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PtHOQbOg"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250807105322epoutp02efbdf4d500809f4058324da415abd798~ZdqnxtLFs1997619976epoutp02X
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Aug 2025 10:53:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250807105322epoutp02efbdf4d500809f4058324da415abd798~ZdqnxtLFs1997619976epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754564002;
	bh=+GwPUR26iklzPWT6ODiapbWvC4FwmQLsc6pho+4ru+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PtHOQbOgR688rw+V96AF1JJMsexEuw2+2czn3x6QszxHLcP1O08/l1f07uQYvQQKc
	 aE1iRmL15sQ6wDt1nvjXcfIcvL5Vdo3mhw1YHmb9VeihMKrUEJy2rP+XMneC9VqZow
	 jOilcgutdxdJLEnUFYlmZ8Z+URsJUp5hoA+yexhk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250807105321epcas5p3bdc86d2f45040914aff49fd1d5743f4b~ZdqnSfM9V3110331103epcas5p35;
	Thu,  7 Aug 2025 10:53:21 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4byPCN3tYJz3hhT7; Thu,  7 Aug
	2025 10:53:20 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032515epcas5p294e3bb229552cdcff28fa24691c3534a~ZXjYIN0Lg0047300473epcas5p2a;
	Thu,  7 Aug 2025 03:25:15 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032513epsmtip2c47251e3e4770eea99704a4f9001deb1~ZXjWHi5Lv1491114911epsmtip2Y;
	Thu,  7 Aug 2025 03:25:13 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 05/10] ARM: dts: samsung: exynos5800: Use SoC-specific
 compatible string for MFC
Date: Thu,  7 Aug 2025 08:54:44 +0530
Message-ID: <20250807032449.92770-6-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032515epcas5p294e3bb229552cdcff28fa24691c3534a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032515epcas5p294e3bb229552cdcff28fa24691c3534a
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032515epcas5p294e3bb229552cdcff28fa24691c3534a@epcas5p2.samsung.com>

Modify the MFC device tree node to use a SoC-specific
compatible string instead of a generic one.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 arch/arm/boot/dts/samsung/exynos5800.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos5800.dtsi b/arch/arm/boot/dts/samsung/exynos5800.dtsi
index 72d3a3535a7a..8abaf79165a6 100644
--- a/arch/arm/boot/dts/samsung/exynos5800.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5800.dtsi
@@ -153,7 +153,7 @@ &dsi {
 };
 
 &mfc {
-	compatible = "samsung,mfc-v8";
+	compatible = "samsung,exynos5800-mfc";
 };
 
 &soc {
-- 
2.49.0

