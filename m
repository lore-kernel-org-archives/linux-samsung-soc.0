Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA798285CA9
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099048; cv=none; b=KTGy1Yf2FzGPJuWPhf7dD066lyfS7D1f2+fxihuRtcNNsvFl8o+EGvYZo7RV2E8dWa9CvCebfTQ8O8wrjm7clnCjIuQ5UcQRelIXydnZYcdOmLUy8ackd5m3zd1iF9stNOxQrAK3f3kWtZUeU5W5XQHVVT9RkvuXNEZdAa8OJco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099048; c=relaxed/simple;
	bh=mfEuoL1g8LEZxPD8kw7ICHqRWnI/VaUX4xR8n2/mUO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=TFfKiJ5zwo7uzaWCSjkNe6PtTXUG9SYEF+1AtITxy0z9KMt2dsjM3+Ob1mTF5tCWiSHFoPQjYIYZnAKdEXG48PooYmoxqdnvBZPcg7RpAUWM3mbQEEDhdAISOcwG1k9CjRr+lHv6GB1dsFdh6XXaGjY/BuCRTFurAs9jE2YePC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cl5MtlS/; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cl5MtlS/"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250917085044epoutp017c82f3eb9144e80df49a2ded72fa16fa~mBcQ537dA3050130501epoutp01Y
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 08:50:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250917085044epoutp017c82f3eb9144e80df49a2ded72fa16fa~mBcQ537dA3050130501epoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758099044;
	bh=HPdbfHLstu1wPrB2mB8d1zMqEAd1MofjdrEMAsiJOLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cl5MtlS/HMXB1n3Vmk7psVwfm4S1+dxaa70KoWv/hLSNBvJeg+4/Rg5CtTI5/RgG1
	 RBudsSJ0s00zZC92lnZ6smONX+RTIXI9ox4Mb1Bk3p/Js43QQ8nMg1bqkQOdN1t0Do
	 AZOLTYJAA2qK+KVpCMdZUND5W2ZF4Sil/uV+4r80=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250917085042epcas5p3e2c46b53121fba38a4f1ca75dda7746a~mBcOv4_sq1728417284epcas5p3r;
	Wed, 17 Sep 2025 08:50:42 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cRXXx3g06z2SSKg; Wed, 17 Sep
	2025 08:50:41 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250917085040epcas5p1fa7cba6f9425f534c9eca976c4bcd4c6~mBcNKkhMD0803108031epcas5p1D;
	Wed, 17 Sep 2025 08:50:40 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250917085036epsmtip2d6ff89267ee087a89fc1d5cf2e5b184c~mBcJCANie2767927679epsmtip2a;
	Wed, 17 Sep 2025 08:50:36 +0000 (GMT)
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
Subject: [PATCH 4/7] dt-bindings: samsung: exynos-pmu: Add compatible for
 ARTPEC-9 SoC
Date: Wed, 17 Sep 2025 14:20:01 +0530
Message-ID: <20250917085005.89819-5-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250917085005.89819-1-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250917085040epcas5p1fa7cba6f9425f534c9eca976c4bcd4c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917085040epcas5p1fa7cba6f9425f534c9eca976c4bcd4c6
References: <20250917085005.89819-1-ravi.patel@samsung.com>
	<CGME20250917085040epcas5p1fa7cba6f9425f534c9eca976c4bcd4c6@epcas5p1.samsung.com>

From: SungMin Park <smn1196@coasia.com>

Add Axis ARTPEC-9 pmu compatible to the bindings documentation.
It reuses the older samsung,exynos7-pmu design.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index f0fb24156da9..0d24a7ffa001 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -52,6 +52,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - axis,artpec9-pmu
               - samsung,exynos2200-pmu
               - samsung,exynos7870-pmu
               - samsung,exynos7885-pmu
-- 
2.17.1

