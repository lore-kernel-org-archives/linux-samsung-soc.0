Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936062D0C8B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884486; cv=none; b=FAWEGIhzFOHeaz8dIu6K3lYxdy++sEd9H1bperNQ7mi1CzoDlP/ySQ2ywsULmU6gwY0S1QhuahcUJWfot1ftf7uL9MyN7z159LlPUQiF4X1brjhSa7S437s69pYH4UsdJVSK9WJPGk4ccJNSc2euchyUOBJkHdEaUI+hcC9JDIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884486; c=relaxed/simple;
	bh=7gcQw7FbIiJo3iJ+fuHTuQo7HyMAPDNUNBl/8HU+sbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=QYNLnyxqIygmg3ysu0MrV+VY5docNyUFCQYBtExCMw5VWDsmjLUHpHJJL5FOUuQmzU/pp8t/CH389xv8HSc/c8wiLbL1qbtTRKIgDXckMu/utW185fwtgJAI9AXy/XVt/sjMDKAwf1s0MNEOFUKir7L+LlnfMoF+ZIk7myr4Pdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=JLlQT7/n; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JLlQT7/n"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260212082122epoutp0242f41e956b6a140b7b05768e2016fc2e~Tcg3ufnQM0749907499epoutp02t
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 08:21:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260212082122epoutp0242f41e956b6a140b7b05768e2016fc2e~Tcg3ufnQM0749907499epoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770884482;
	bh=jq+7d+WH907G/sC72dBql4EeICkftJSTEn0lJUay7qs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JLlQT7/n8CpjN/SFjrK24gJ0CmpRi0DyUlmQGp0R9NwvyCUtCqnfULO1YgMiL9q2q
	 bx/tnK57cDlM0XH004/+DwxseRcyAg7jzhLUsQhfagcT8Z5nAo0Fp9nC+e4+FpRvE2
	 3Aikux8yIy2RyRTo2icHUYItvj+fC/gUxLj+qWjQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20260212082122epcas2p3c5f2ab74825781264abeb75589396d26~Tcg3WeWyl2198121981epcas2p3s;
	Thu, 12 Feb 2026 08:21:22 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.211]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4fBStn6Py6z6B9mG; Thu, 12 Feb
	2026 08:21:21 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20260212082121epcas2p23411797366815b497a70833acaf1a2aa~Tcg2hZ0ax1906619066epcas2p26;
	Thu, 12 Feb 2026 08:21:21 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260212082121epsmtip17949632b44ebe8353f67291179d22e39~Tcg2a1BrO2268222682epsmtip1m;
	Thu, 12 Feb 2026 08:21:21 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com, Sanghoon Bae <sh86.bae@samsung.com>
Subject: [PATCH v2 0/2] Add ExynosAutov920 hsi0 support to exynos-sysreg
Date: Thu, 12 Feb 2026 17:21:05 +0900
Message-ID: <20260212082105.1878720-4-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260212082105.1878720-1-sh86.bae@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260212082121epcas2p23411797366815b497a70833acaf1a2aa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260212082121epcas2p23411797366815b497a70833acaf1a2aa
References: <20260212082105.1878720-1-sh86.bae@samsung.com>
	<CGME20260212082121epcas2p23411797366815b497a70833acaf1a2aa@epcas2p2.samsung.com>

The ExynosAutov920 SoC includes a PCIe IP and a hsi0 register block that
is mapped in the exynos-sysreg.

To manage PCIe PHY power, configure the PCIe PLL, and set the device direction,
the hsi0 registers need to be defined in exynos-sysreg.

This patch must be applied before the ExynosAutov920 PCIe PHY is enabled.

Sanghoon Bae (2):
  dt-bindings: soc: samsung: exynos-sysreg: Add hsi0 for ExynosAutov920
  arm64: dts: exynosautov920: Add hsi0 syscon node for PCIe PHY

 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 1 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi              | 6 ++++++
 2 files changed, 7 insertions(+)

-- 
2.45.2

