Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD52824168D
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Sep 2025 05:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756705367; cv=none; b=fbdSIhLgz+2g99W4ArcTtIbqlUJjtZTa6rxvwYl2nw9qpixhBKMyobA/PvFmDLYoNd7fTKorx+Z/6EiadoZm8yewTzMtv0M5jH+UOd17cyiPfOe0uGH7eEuK/Ehm9oBUH+S+mgKBNyIs4bvoOmiJxn75nEF4CU+j8BrzLTAubZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756705367; c=relaxed/simple;
	bh=5ov5tOM2f7JTriND+ZAz+gHIj2TtJK6qNLvF7LFmP7M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=oEBY/TbVqNtbIeAz8DBf7tCc53z6AinJZ1/LmX9xXbw39urie2VnmwhjOlYyk4WtSAjLodEayS8+H2rQ5ry197+fjO7Fg2jQPGsxWQ1GQSFh+XZiVix7aTmsC7we+i/zQKg1aiT+n1yvC5o3+AkbH+O8CgLtrlHHCNnSyBv/9k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=i/CwxSKh; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="i/CwxSKh"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250901054243epoutp01773d4de6ec931c440795217b78b2564c~hEjiQE8u51846518465epoutp01p
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Sep 2025 05:42:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250901054243epoutp01773d4de6ec931c440795217b78b2564c~hEjiQE8u51846518465epoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756705363;
	bh=GV9RpIexSuF3/gygvngB8sYZsg71i9JN65/BnbiCf1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i/CwxSKh1EGEk3YKlASG+3X71o/BfXqFkyai++8ojq2DPcRGlXFrgN+LkTPIXSEon
	 6OZ0zCLl+iCjEjUr2YbCt1nPr/6tzOvrXUemttgOJz18u9moZRHn23rPMVCueXSOqe
	 yldD45aO0r2iidxM6ZZLr036NPtZNhsmT8W/m1rQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250901054242epcas5p159d9214ba1e2f31e9f73194e947ebbe6~hEjhZfsRj2209922099epcas5p1J;
	Mon,  1 Sep 2025 05:42:42 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cFd7N37Ngz2SSKg; Mon,  1 Sep
	2025 05:42:40 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250901054239epcas5p214f3d0a29b87eda7f9b671fe05ba4bf9~hEjelPBYF2209022090epcas5p2F;
	Mon,  1 Sep 2025 05:42:39 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250901054235epsmtip27f16f19754b507b37b56600691808528~hEjaKgOYR0762407624epsmtip25;
	Mon,  1 Sep 2025 05:42:34 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, shradha.t@samsung.com, ravi.patel@samsung.com,
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com,
	dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v4 1/6] dt-bindings: pinctrl: samsung: Add compatible for
 ARTPEC-8 SoC
Date: Mon,  1 Sep 2025 10:49:21 +0530
Message-Id: <20250901051926.59970-2-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250901051926.59970-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250901054239epcas5p214f3d0a29b87eda7f9b671fe05ba4bf9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250901054239epcas5p214f3d0a29b87eda7f9b671fe05ba4bf9
References: <20250901051926.59970-1-ravi.patel@samsung.com>
	<CGME20250901054239epcas5p214f3d0a29b87eda7f9b671fe05ba4bf9@epcas5p2.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

From: SeonGu Kang <ksk4725@coasia.com>

Document the compatible string for ARTPEC-8 SoC pinctrl block,
which is similar to other Samsung SoC pinctrl blocks.

Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index de8460856141..9386dcd418c2 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -35,6 +35,7 @@ properties:

   compatible:
     enum:
+      - axis,artpec8-pinctrl
       - google,gs101-pinctrl
       - samsung,s3c2412-pinctrl
       - samsung,s3c2416-pinctrl
--
2.49.0

