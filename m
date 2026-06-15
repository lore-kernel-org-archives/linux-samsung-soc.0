Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661583D45F2
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512497; cv=none; b=XcqvNH3tO16lPTsMChVu0iygS74XKPf/NfJIyYpRcAhc/tfxZ1NhENTKcNLUW0xYSmsvip5WlNVdvmwNbFY2dZtu5U3y6rK2dqbZLaksoAOhSJyuACz3Rgd+N1iSfpdCnB7b6TP/hbtjkIR++I47uzPnkiN37wKQUAERE1jhKm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512497; c=relaxed/simple;
	bh=hqIZNEJ+ngwlZ761oj7BZgDyKDMxvbazfKsfFaHaPBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=dk7IQhmnljgr2MsEBChayn/qggGwRXEz93BNQddWdw9A6zVTfgjVawOC+G6wf765Ljl3aNKDT2jy1DtSqpP2LeskDxVmi/hHe5is0Pb9L7Z3KckOTu2A//mpl6S9RCDcRGmjr0CUK9HQC0mte/oMmKAIvVMGJaX7rb8fcPdc7fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=FT3xaMYp; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FT3xaMYp"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260615083447epoutp0104dd61e2043201d4d2b8c202e4fbd8c9~5NCsUxMFg2622626226epoutp01E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:34:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260615083447epoutp0104dd61e2043201d4d2b8c202e4fbd8c9~5NCsUxMFg2622626226epoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781512487;
	bh=yaYCowk7JVZ5hc+4haO2BGnTeTwQ73DyggnqwLDb2as=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FT3xaMYpyHOYOK41NqHaW7zTgTnoRRAtJ9+K54AgskJ7eAqlz6h3q2IIzzQbJX134
	 4IH2jm1+79Zq5K2Cuxvg/HvZGczXbq7VSnGa0JXgY3FpfDAZ8DguMBAflbFDy5gJra
	 B+R7ekmfwO7lUazaEpVMmOvOVvFFQxszXSFdzANg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260615083446epcas5p3b6461a5cc0bb909b7e5c9cc81aa5376a~5NCr5rqgb0986209862epcas5p3g;
	Mon, 15 Jun 2026 08:34:46 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gf3MG12sYz6B9mD; Mon, 15 Jun
	2026 08:34:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260615083433epcas5p24e9fda698154eccaf43d044d140fdb21~5NCfg_9pC1271812718epcas5p2J;
	Mon, 15 Jun 2026 08:34:33 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260615083431epsmtip1a608860123cab7350a47dc125efa3565~5NCdSlZ5m0236002360epsmtip1h;
	Mon, 15 Jun 2026 08:34:30 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 5/5] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
Date: Mon, 15 Jun 2026 14:22:52 +0530
Message-Id: <20260615085252.1964423-6-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615085252.1964423-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260615083433epcas5p24e9fda698154eccaf43d044d140fdb21
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260615083433epcas5p24e9fda698154eccaf43d044d140fdb21
References: <20260615085252.1964423-1-alim.akhtar@samsung.com>
	<CGME20260615083433epcas5p24e9fda698154eccaf43d044d140fdb21@epcas5p2.samsung.com>

Add maintainers entry for the Samsung Exynos8855 SoC based platforms

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 49a10f0ceb07..fb9b24220258 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23914,6 +23914,13 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS8855 SoC SUPPORT
+M:	Alim Akhtar <alim.akhtar@samsung.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	arch/arm64/boot/dts/exynos/exynos8855*
+
 SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org
-- 
2.34.1

