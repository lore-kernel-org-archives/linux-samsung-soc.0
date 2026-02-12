Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174ED1D61BC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 08:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884484; cv=none; b=HydKaq6QtmaTLyfb7uf89UGSNvu4ftcR9GTr8Wn0ay7tKRr//zgTHc1XJTwrwudMwFdw7H+q4es/WSgD6QSXAT/Lrtu/U4qtELBMtTr+2h45AqCea8/ypWfp0skDtge/QZgxfKdDDMM3p6O++3NdOH5GBvK5N9TLl1z2gVxV6ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884484; c=relaxed/simple;
	bh=uaJz70a5HtpppJM1uDpvpzaIVatBBzKVXuSZYDb9J2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=VLd45+SAYCweng/NZv3ym5BWoZYwxK5cKr/uIATSCO7gWWg4aqVn2QYeQz6Et2W5Dcrl7Olm4VVLvVmPt8GQ5Hf+aww8nZ5SRi07kgWQoxSWGwASQlv5NIAXMnWUM/aWTj/zFvT+fpseo4jw3jZMIp+CMSeMNHJl0RPBtWBGTPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Ctjt6IWF; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Ctjt6IWF"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260212082121epoutp03e7766509ef9822676c72f09be4c45654~Tcg2O8mTm1454014540epoutp03J
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 08:21:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260212082121epoutp03e7766509ef9822676c72f09be4c45654~Tcg2O8mTm1454014540epoutp03J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770884481;
	bh=cM6jiX6EpRpGNIZhWV8C294Ozzp8GFh0duU7R9QGvtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ctjt6IWFCQjdwnLRAoVI/R9mWgFK+5UkAg45RENO/8Vq3LkMsClD8I97j+hXzTKH1
	 zmTCZ88FMRVCliqwsEqSKTRdAmgcgdgw/EGYYIo7G2cnnFdcd2rGr5SFnKLfZNo5NK
	 iILXsQ8/WkB3QWL3JykqvO60OMM/KNc6LTd6PL2Y=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20260212082120epcas2p221c7a836f88231f14b31bd950a29f7cc~Tcg1yu5AO1461014610epcas2p2g;
	Thu, 12 Feb 2026 08:21:20 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.203]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4fBStm0vfHz3hhTG; Thu, 12 Feb
	2026 08:21:20 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20260212082119epcas2p34791b0d7ad5ea3b50c6bcfe03cf0f16a~Tcg06DkER2195121951epcas2p3s;
	Thu, 12 Feb 2026 08:21:19 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260212082119epsmtip12073e4db08141947793fb95030e49f75~Tcg0zcZTC2298622986epsmtip1Z;
	Thu, 12 Feb 2026 08:21:19 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com, Sanghoon Bae <sh86.bae@samsung.com>
Subject: [PATCH v2 1/2] dt-bindings: soc: samsung: exynos-sysreg: Add hsi0
 for ExynosAutov920
Date: Thu, 12 Feb 2026 17:21:03 +0900
Message-ID: <20260212082105.1878720-2-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260212082105.1878720-1-sh86.bae@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260212082119epcas2p34791b0d7ad5ea3b50c6bcfe03cf0f16a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260212082119epcas2p34791b0d7ad5ea3b50c6bcfe03cf0f16a
References: <20260212082105.1878720-1-sh86.bae@samsung.com>
	<CGME20260212082119epcas2p34791b0d7ad5ea3b50c6bcfe03cf0f16a@epcas2p3.samsung.com>

Add hsi0 compatible on samsung,exynos-sysreg
To support ExynosAutov920 PCIe settings:
- PCIe PHY power control
- PLL settings for PCIe
- PCIe device direction (RC/EP)

Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d27ed6c9d61e..a44fd24ed0ea 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -30,6 +30,7 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynosautov920-hsi0-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
               - tesla,fsd-cam-sysreg
-- 
2.45.2

