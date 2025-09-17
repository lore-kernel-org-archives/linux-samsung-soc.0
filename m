Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331352DF6F5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 07:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758093208; cv=none; b=Biub6/3GyQ9yqa38OBC720LByK5v/lGOjz3mJ/TC5lDa9AP8ch/o6RsuHuY/Xf+cuQBgufuRjgonwBtxzzeIm+FQAXelui2i9RzLDNc6MLa4DYQbyysBD79YLdhCodyJps+0t0YywpPpg/hTAcNJzIlQtBJ8cXMC9a3SP/G+6uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758093208; c=relaxed/simple;
	bh=UsGkB1AQz2LiEC8IF3nZOMH69omRwaWpBkHX0BRNEfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=Fhp3M4FOFwG4mzUFe6MVMYCOL4y6eF8v3QZgJiiY7M53toXkoQFObfwsZlZFREDOSQvLdKX07RdQk1ZOtFjly4tyICD9AkIbf7sSfr9gibzgeblIQiu1banZ615iBWd8e3f3Tg0dlH3wqK8Bgl43USeb+B6f+KifhbrTi8INVSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Xykv6jaj; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Xykv6jaj"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250917071324epoutp03e5e0575e1cbe16d07d9f1e007c6a4982~mAHRhg4ry0232102321epoutp03j
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 07:13:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250917071324epoutp03e5e0575e1cbe16d07d9f1e007c6a4982~mAHRhg4ry0232102321epoutp03j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758093204;
	bh=i/pN2d16gN/aOiyBlIWmhnSKwC/rb7+GOnUl5obF2Jc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Xykv6jajixf7eQQ/VvuNMThZgMxenMfG2p8egUqJeyaTfwlhG5jw+t7pWQ1mj9OlV
	 mXEvwCD7kmO4SQFmXMquenAQek3zC3fgzCAE+mKh0j2dMaqYsaMuIXUM4nRl25eC+0
	 gJ/ruKwhFhFDezcav4ipstQjr/oynK55XU4GFnzQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250917071323epcas5p1ad55db6b7f1c81762373e30093eb8b29~mAHQ-S9Rf3046930469epcas5p1b;
	Wed, 17 Sep 2025 07:13:23 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cRVNf4y3Nz3hhT9; Wed, 17 Sep
	2025 07:13:22 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250917071322epcas5p3b25ff15ee16f58aa3101f2fc44b554cc~mAHPbtPBs2147421474epcas5p3T;
	Wed, 17 Sep 2025 07:13:22 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250917071318epsmtip197b5a7d162ae47ea3d9d1223e43d5864~mAHMMaGiw0529705297epsmtip1C;
	Wed, 17 Sep 2025 07:13:18 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	krzk@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	ksk4725@coasia.com, pjsin865@coasia.com, gwk1013@coasia.com,
	bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
	lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, shradha.t@samsung.com, swathi.ks@samsung.com,
	kenkim@coasia.com, Ravi Patel <ravi.patel@samsung.com>
Subject: [PATCH] dt-bindings: timer: exynos4210-mct: Add compatible for
 ARTPEC-9 SoC
Date: Wed, 17 Sep 2025 12:43:11 +0530
Message-ID: <20250917071311.1404-1-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250917071322epcas5p3b25ff15ee16f58aa3101f2fc44b554cc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917071322epcas5p3b25ff15ee16f58aa3101f2fc44b554cc
References: <CGME20250917071322epcas5p3b25ff15ee16f58aa3101f2fc44b554cc@epcas5p3.samsung.com>

From: SungMin Park <smn1196@coasia.com>

Add Axis ARTPEC-9 mct compatible to the bindings documentation.
The design for the timer is reused from previous Samsung SoCs
like exynos4210 and ARTPEC-8.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
index 10578f544581..a4b229e0e78a 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - axis,artpec8-mct
+              - axis,artpec9-mct
               - google,gs101-mct
               - samsung,exynos2200-mct-peris
               - samsung,exynos3250-mct
@@ -131,6 +132,7 @@ allOf:
           contains:
             enum:
               - axis,artpec8-mct
+              - axis,artpec9-mct
               - google,gs101-mct
               - samsung,exynos2200-mct-peris
               - samsung,exynos5260-mct
--
2.17.1

