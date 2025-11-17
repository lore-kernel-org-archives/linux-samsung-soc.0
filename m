Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B004031DD86
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 08:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763369511; cv=none; b=obAGJ0pW4uWszLCOCME91FAPUF86dZ+DMkl7sLN1Y84pbJQ9ReAHK7D1CwCT2mnU6nHGlame6LU63Mj368P4J+bN5c5crVwh3fWw58BXeEzd6/RREyWHKcyO+cA5k3ABnjCeesXWlrJCUVjCNvrZG17HcJmaJ9e7uBZ0uadgOcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763369511; c=relaxed/simple;
	bh=EuiU0uzsHX+9CO/LGpiG3YMXfi+IgosH9tPwyvVPdg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=A/KUi9X1/9nhLTgVpUBOc1kng/xSBe51K17DVZq2RnjAZFepH9HB/x20BV/KmCdpoS6Vd1PXhV8gLmaLSIkDLqVHIFiIsWxcDzPO/gSV7dd5y8M4BROLjexl93XngbhZIgLM6jFpIX+s2WhmcCEV8IZoi70rvjsi7nG8bSJvpqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rOSgZs5a; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rOSgZs5a"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251117085146epoutp04ec98f8a59cc4822709b58bab92e39b73~4vzk4fwGH2535525355epoutp04E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2025 08:51:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251117085146epoutp04ec98f8a59cc4822709b58bab92e39b73~4vzk4fwGH2535525355epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763369506;
	bh=OfzFzVa+Wy5rbSJqdomqofX4xGrzoour6BEhawfdOUA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=rOSgZs5akUysJh+at97jPs29jJLbAiTecyXWSQMi5lHWDgho/k/OoVgqpSlhx+Dme
	 Kb2SVonBTqP2OpVO1IEi4+7drg6uxl5oZKl2L74i7z6/9+fVQbJkzJHJ29xc4YX04v
	 dTBCSoIAVyOK43x9U+EQ1whJM27++Z17426ctiq4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20251117085145epcas2p14cbb841e913c4f59cad52c8171279d94~4vzkRjaFo1420914209epcas2p1j;
	Mon, 17 Nov 2025 08:51:45 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.204]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4d91h14RKxz2SSKb; Mon, 17 Nov
	2025 08:51:45 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20251117085144epcas2p25da059e85e91568711fb1232487159e0~4vzjX9ei41509115091epcas2p2w;
	Mon, 17 Nov 2025 08:51:44 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251117085144epsmtip15b9df02ee98340a21b5af9c57fbca074~4vzjRZLS90643406434epsmtip1w;
	Mon, 17 Nov 2025 08:51:44 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com, Sanghoon Bae <sh86.bae@samsung.com>
Subject: [PATCH 0/1] Add ExynosAutov920 hsi0 support to exynos-sysreg
Date: Mon, 17 Nov 2025 17:51:32 +0900
Message-ID: <20251117085134.289371-1-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251117085144epcas2p25da059e85e91568711fb1232487159e0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251117085144epcas2p25da059e85e91568711fb1232487159e0
References: <CGME20251117085144epcas2p25da059e85e91568711fb1232487159e0@epcas2p2.samsung.com>

The ExynosAutov920 SoC includes a PCIe IP and a hsi0 register block that
is mapped in the exynos-sysreg.

To manage PCIe PHY power, configure the PCIe PLL, and set the device direction,
the hsi0 registers need to be defined in exynos-sysreg.

This patch must be applied before the ExynosAutov920 PCIe PHY is enabled.

Sanghoon Bae (1):
  dt-bindings: soc: samsung: exynos-sysreg: add hsi0 for ExynosAutov920

 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
 1 file changed, 1 insertion(+)

-- 
2.45.2

