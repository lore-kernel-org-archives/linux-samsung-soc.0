Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D2C277C87
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Aug 2025 10:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754563856; cv=none; b=Kq+V/Z06y6XksZ3VmgOzFblTEPobIlyZCPbRWhvPZitwcJhMkAOfVxGSQGBO+N7hUQtlg9Q/uWOHAhLs8vtQYRYWFti1ytjgAxz/WAG+B5tWHMl3Nv9NfW4F/+IQjcvPOFPGpA5H/7zZEfoROWwUCYxjxAJ9Ojm4pGKyqnIOpMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754563856; c=relaxed/simple;
	bh=wXE91ROm09nMoiUCQ9df38UxUtCuWUpU+EghIvyXKR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=uEmQs3dirtwmdtsblVcNOJ8QJ5R0+hoHgJEgf9kuaic4kBn1P84v227/J7Eq3mFPdvsM6llhp1BgaU43lCLrJHF0Kd439ePUBB7LQbrex74kjU9LXQd5a3+RTq38VLMD7ToXwCdO9uxXHWPiNYWmuoQ1a48SXV63C5nzqLOTXxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LP/OfGQx; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LP/OfGQx"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250807105052epoutp04d42a357f4ee5ba6bbec25f86cdb8ff3e~ZdocTiONO0206902069epoutp04X
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Aug 2025 10:50:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250807105052epoutp04d42a357f4ee5ba6bbec25f86cdb8ff3e~ZdocTiONO0206902069epoutp04X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754563852;
	bh=ioc6BaEAneSnl+Cdv2fwifMYhZKSVyPMsPMvf293bv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LP/OfGQxcXE2D4Qns7gmK8vdu7x64LFH1trgS4uByFWqnsBt7oUCjaX30kJ4YgcCk
	 8eX376fABstAVms/EpvoED2P6OHWA/GLWpHshmRDYhJbZ9BMEGF4TUDwPWhh2mrZRX
	 51ILpTWyZ8tC0N83ZZ8p/eRXuXnjIyGgNXgRQ+Pc=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250807105051epcas5p42b0c95f525547338291284002c134f6c~Zdob1frPR3070930709epcas5p4q;
	Thu,  7 Aug 2025 10:50:51 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4byP8V5RdKz6B9m4; Thu,  7 Aug
	2025 10:50:50 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250807032506epcas5p3a05a916da73778cce6a310bafbe1ebba~ZXjPWFEUQ0696906969epcas5p3B;
	Thu,  7 Aug 2025 03:25:06 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032504epsmtip2ff987802e05ceff0bc5f5af8cdfaa31e~ZXjNXG3TE1491114911epsmtip2V;
	Thu,  7 Aug 2025 03:25:04 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 01/10] ARM: dts: samsung: exynos3250: Use SoC-specific
 compatible string for MFC
Date: Thu,  7 Aug 2025 08:54:40 +0530
Message-ID: <20250807032449.92770-2-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032506epcas5p3a05a916da73778cce6a310bafbe1ebba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032506epcas5p3a05a916da73778cce6a310bafbe1ebba
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032506epcas5p3a05a916da73778cce6a310bafbe1ebba@epcas5p3.samsung.com>

Modify the MFC device tree node to use a SoC-specific
compatible string instead of a generic one.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 arch/arm/boot/dts/samsung/exynos3250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos3250.dtsi b/arch/arm/boot/dts/samsung/exynos3250.dtsi
index b6c3826a9424..1fd99c4ccca8 100644
--- a/arch/arm/boot/dts/samsung/exynos3250.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos3250.dtsi
@@ -657,7 +657,7 @@ gpu: gpu@13000000 {
 		};
 
 		mfc: codec@13400000 {
-			compatible = "samsung,exynos3250-mfc", "samsung,mfc-v7";
+			compatible = "samsung,exynos3250-mfc", "samsung,exynos5420-mfc";
 			reg = <0x13400000 0x10000>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "mfc", "sclk_mfc";
-- 
2.49.0

