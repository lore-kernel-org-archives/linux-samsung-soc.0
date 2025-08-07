Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CA6226D18
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Aug 2025 10:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754563850; cv=none; b=KWjz/2bpDEbLrMhvOMlA/p5w6lmHU2fz/XhK9lLbM8bi9CqwCr1SIcAYvmTcKBkvAKIJUMf8KoAIaROWNfRcPuOCgd6+AZYSdcRm0uEu4KMGYaQcNRy3cxdB283TniL9Ai0IL1cNrO0Ro3vVHLx8PhAvmxPejAGh7ezEn3rSOdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754563850; c=relaxed/simple;
	bh=5N0sCYf2Cs1KmNgBKMto4VeDsYyl1/Ny7xhHxwxRX48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=cd+kaIL+PVXgPSlbWrgHxCxbccWVwkLZs//O/dFeJz7o/Kwap7pF9ZKQW0iVCrNuzMB7+UEtTel6ha0Bs5KGHN5onCTSFW6yEIRQNKSYyRRkKO+nmAga5zdn7Un8c97eyyQB5CmFxeSOfoWDF/wypVBa1FQvFf+u3shle/d3A6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ppYXl6BU; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ppYXl6BU"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250807105046epoutp0405c002f420261354b24f5222494d6afd~ZdoWtJjOD0349703497epoutp04Z
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Aug 2025 10:50:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250807105046epoutp0405c002f420261354b24f5222494d6afd~ZdoWtJjOD0349703497epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754563846;
	bh=9EFIJet6GwguCOgHXt373HO19RdNPt1XWJDM2bajplk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ppYXl6BUAVAeVZr16oTAuTzCiqe7yhCZS+FFgZzvF4nkidEBipqlnZylkV4VUzezu
	 CB2MBnBBTia4sRLvv5W4Z5g3ZJs3fIBqTRcepasnE5PQZyLIRAwSA7oHHnQdsqBTIM
	 W4HRgZNEHXl+bbwWKiLK/xzlWe3vfYCA3lEUb/6E=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250807105045epcas5p200483d0bdac63cb3b323ff857f67fdc1~ZdoWNaOIH1874618746epcas5p2P;
	Thu,  7 Aug 2025 10:50:45 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4byP8P11ymz2SSKf; Thu,  7 Aug
	2025 10:50:45 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250807032459epcas5p1d6bd796f5b654c92372bdcc8a7926c22~ZXjJEevMZ2629026290epcas5p1A;
	Thu,  7 Aug 2025 03:24:59 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032457epsmtip217c0a672ffd1a22f97b647b84be6597d~ZXjHGrzJG1346113461epsmtip29;
	Thu,  7 Aug 2025 03:24:57 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 00/10] Use SoC-specific compatible string for Samsung MFC
Date: Thu,  7 Aug 2025 08:54:39 +0530
Message-ID: <20250807032449.92770-1-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032459epcas5p1d6bd796f5b654c92372bdcc8a7926c22
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032459epcas5p1d6bd796f5b654c92372bdcc8a7926c22
References: <CGME20250807032459epcas5p1d6bd796f5b654c92372bdcc8a7926c22@epcas5p1.samsung.com>

This patch series modifies the samsung MFC version compatible to
SoC-specific compatible.

Aakarsh Jain (10):
  ARM: dts: samsung: exynos3250: Use SoC-specific compatible string for
    MFC
  ARM: dts: samsung: exynos4: Use SoC-specific compatible string for MFC
  ARM: dts: samsung: exynos5250: Use SoC-specific compatible string for
    MFC
  ARM: dts: samsung: exynos5420: Use SoC-specific compatible string for
    MFC
  ARM: dts: samsung: exynos5800: Use SoC-specific compatible string for
    MFC
  ARM: dts: samsung: s5pv210: Use SoC-specific compatible string for MFC
  media: s5p-mfc: Modify compatible string check for SoC-specific
    support
  media: s5p-mfc: Add new compatible string corresponding to S5pv210 SoC
  dt-bindings: media: s5p-mfc: Modify compatible string check for
    SoC-specific support
  dt-bindings: media: s5p-mfc: Add SoC-specific compatible for
    'samsung,mfc-v5'

 .../bindings/media/samsung,s5p-mfc.yaml       | 24 ++++++++++---------
 arch/arm/boot/dts/samsung/exynos3250.dtsi     |  2 +-
 arch/arm/boot/dts/samsung/exynos4.dtsi        |  2 +-
 arch/arm/boot/dts/samsung/exynos5250.dtsi     |  2 +-
 arch/arm/boot/dts/samsung/exynos5420.dtsi     |  2 +-
 arch/arm/boot/dts/samsung/exynos5800.dtsi     |  2 +-
 arch/arm/boot/dts/samsung/s5pv210.dtsi        |  2 +-
 .../media/platform/samsung/s5p-mfc/s5p_mfc.c  | 13 ++++++----
 8 files changed, 27 insertions(+), 22 deletions(-)

-- 
2.49.0

