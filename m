Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6945E2C11EB
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 10:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760004635; cv=none; b=S/e8Y+kiHUdK4202StwlTvz4//Z2MogGY/J9o1Et0zF5fqJO4v40tIeKmDOgW7/ncfufzdyXv5HFE7e5sDKyg6OJJnwpIh6ZIPmOr/7IGml/LgHJcKoOl0BGfo347DbinpXoZmuVhBnXEfWEAWNLXLzdOAu/j0hiPsXX1rFkRqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760004635; c=relaxed/simple;
	bh=oo9FJIYOC2dmq1FawGYMMY2Y/H0z6CocagcX0LaUJ+w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=j1Slf/GNtBtI6V14KLMBz4HsXWDvVhNiDCa3aqYwSNv4ZZiMTMWSvtBVhEUpgVNUZFMEay5NQDq6q5ZS6ucF0Eg6H3Rf5fClNuXzE2+GX2c1UvBEcVvGzKZxCi3GzaMfOk5Wtl0oBEGiSbcgZVSloDTZREGgCxHPRroI4T8ru5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IRExiOoj; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IRExiOoj"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251009101025epoutp012b005036128981b3ad7a03794198e5cd~syuHdA3Co0961209612epoutp01m
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 10:10:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251009101025epoutp012b005036128981b3ad7a03794198e5cd~syuHdA3Co0961209612epoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760004625;
	bh=LYRqGdvxiwapa1NYZ4/yM5n99gloT6iDw1ifAfDC6iM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=IRExiOoj/82P5yCCyHuMK2vD5lqbY6/DhHd2Dn7Z0a3W+m5acH6MuonQHbus7Qh68
	 AQiABc+jGFahP4BHhcMjKkJwsdG7tNpXgn+JxnK574WhW8ujBCPUiPLfsp36gYgFjL
	 FIZlWpDCFGYCOxWFAAcoUkv7n+zUYj1nL8/C5nKc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251009101025epcas5p382998bb4e3000dbcb11fd0fffcfc96df~syuG_Nxt42585325853epcas5p3r;
	Thu,  9 Oct 2025 10:10:25 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cj5Gm2Nf1z2SSKf; Thu,  9 Oct
	2025 10:10:24 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251009101023epcas5p2de61d08e2d4a180bbcf2f2708d267336~syuFnsVE83028830288epcas5p2o;
	Thu,  9 Oct 2025 10:10:23 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251009101022epsmtip2431e3890048aa90c77dd88ce92149148~syuD6nTNK0514705147epsmtip2a;
	Thu,  9 Oct 2025 10:10:21 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com,
	Faraz Ata <faraz.ata@samsung.com>
Subject: [RESEND PATCH 1/2] dt-bindings: i2c: exynos5: add
 exynosautov920-hsi2c compatible
Date: Thu,  9 Oct 2025 15:49:10 +0530
Message-Id: <20251009101911.2802433-1-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251009101023epcas5p2de61d08e2d4a180bbcf2f2708d267336
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251009101023epcas5p2de61d08e2d4a180bbcf2f2708d267336
References: <CGME20251009101023epcas5p2de61d08e2d4a180bbcf2f2708d267336@epcas5p2.samsung.com>

Add "samsung,exynosautov920-hsi2c" dedicated compatible for
HSI2C found in ExynosAutov920 SoC.

Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
---
Note: This patch was previously sent separately. Resending now as part of a
two-patch series to avoid dt-binding check error. No functional changes from the earlier submission[1]

- Reference: [1] https://lore.kernel.org/all/5643d3e6-a034-4e2a-babd-d82fb3d58e9d@kernel.org/

 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 32269239bae4..28be44f2f5a7 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -43,6 +43,7 @@ properties:
               - samsung,exynos2200-hsi2c
               - samsung,exynos850-hsi2c
               - samsung,exynos990-hsi2c
+              - samsung,exynosautov920-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true
-- 
2.34.1

