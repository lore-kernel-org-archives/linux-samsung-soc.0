Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EBB30E0C5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 08:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099051; cv=none; b=DzlIAkSu0pLe+hPWNigx5ZCgrZKUruOa1wHZr7cMlic8qOc7s63lo0e9P/7I9hSRDpWPLyGVyN00h5Wsafk4C3KSevb8BAnNXAtLeQMVSZYa8jPqgI8xGyl4hTy/toxZSE+K19XW7rbICzfXozAKasHgeVFGXUUC4ya1QHrqV1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099051; c=relaxed/simple;
	bh=z5AU+AcaSpgLSAp8iiFns+tzDK4hMZBGOsnJYN4yqjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=U5olwQrvr4YcMrk9QvxUgQBtYC5UbU7gdkpHB+sUf5C5uFz1UQQQGFGVzvya6YXK6Ka97+scifml+PrW0K2sXwRSsicsmdyTKOLj/Y2c2t0TxnsqhtJfLBjPtGplzqNuk8G4acUMNj95ae/CWMgSrkSp8hMN4Xe5TngUPHyg5Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=K1QP+/yt; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="K1QP+/yt"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250917085048epoutp037b7c4ad872a46f158784268a4827615f~mBcURBVNN0619806198epoutp03f
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 08:50:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250917085048epoutp037b7c4ad872a46f158784268a4827615f~mBcURBVNN0619806198epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758099048;
	bh=gQSI2Z6Vaf3GExSLoiurGcbk31x6P0OBsed/AHWLWVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K1QP+/ytx2y8HBCcCiCibm4+/s+FabthX9/sQL0Kc+3vz/9MRvLaRpwpngswBgy8u
	 DLU/ITJNU2DVNqTvn0AUjrtfGrpNpVVRKEuY2AzuTBrUDfp22pVOA2Q8+0B6gyAZM5
	 5SjjZoe/Fe9nij7ylw068arLsqMqSZkAA7nAFjQk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250917085047epcas5p2e115ee7f90ed7893acbbb81969d42a0a~mBcTlOlw60263602636epcas5p25;
	Wed, 17 Sep 2025 08:50:47 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cRXY25GGjz3hhTJ; Wed, 17 Sep
	2025 08:50:46 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250917085045epcas5p2905ed7f307ca892997e14c33ad68f9fa~mBcR1cAXW0743007430epcas5p2T;
	Wed, 17 Sep 2025 08:50:45 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250917085041epsmtip2143cbf9e7da6b24bf6725269cffea700~mBcNd2pqB2767927679epsmtip2c;
	Wed, 17 Sep 2025 08:50:41 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com,
	sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com, kenkim@coasia.com
Subject: [PATCH 5/7] dt-bindings: arm: axis: Add ARTPEC-9 alfred board
Date: Wed, 17 Sep 2025 14:20:02 +0530
Message-ID: <20250917085005.89819-6-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250917085005.89819-1-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250917085045epcas5p2905ed7f307ca892997e14c33ad68f9fa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917085045epcas5p2905ed7f307ca892997e14c33ad68f9fa
References: <20250917085005.89819-1-ravi.patel@samsung.com>
	<CGME20250917085045epcas5p2905ed7f307ca892997e14c33ad68f9fa@epcas5p2.samsung.com>

Document the Axis ARTPEC-9 SoC binding and the alfred board
which uses ARTPEC-9 SoC.

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 Documentation/devicetree/bindings/arm/axis.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axis.yaml b/Documentation/devicetree/bindings/arm/axis.yaml
index 63e9aca85db7..3062901196a6 100644
--- a/Documentation/devicetree/bindings/arm/axis.yaml
+++ b/Documentation/devicetree/bindings/arm/axis.yaml
@@ -31,6 +31,12 @@ properties:
               - axis,artpec8-grizzly
           - const: axis,artpec8
 
+      - description: Axis ARTPEC-9 SoC board
+        items:
+          - enum:
+              - axis,artpec9-alfred
+          - const: axis,artpec9
+
 additionalProperties: true
 
 ...
-- 
2.17.1

