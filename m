Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F0930DEA6;
	Mon,  5 Jan 2026 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767648546; cv=none; b=pZYjIp1JViOaJxVddREXGp/XaIJwg3DRez8RvnHaMkeflJFESCtZ1OZQ4Oqr2JnpjxXbRlb2EIYwLwelUIY8W9zHgEulDWAJyt7nPPssCbReiVj8WfguOrCqSMJjErt26Oq7yOwWZv3FrCG6QKXuuOlYJYGcjORYf8omeEoSXLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767648546; c=relaxed/simple;
	bh=CiTuVwc7tscmiNNKi7o7qvreD6DS7hi3dLd5+IdW8AE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rnxBtjnwP8iK24YVqTEzWTLJLYRGbcSeEC5KuHecdDuPhFFA3uMXlp3nFHmpeye0VJYvKCvhi6w5geASKkZbfLbXWsydFWwgOMC5jJH2Wts3lSi3B4VyoLeYGxYFqgy7x9D4im13rc/oSh0APGBM4dDaqZviLaaHJNiAA3wsoEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyLU7TVX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyLU7TVX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC31C116D0;
	Mon,  5 Jan 2026 21:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767648545;
	bh=CiTuVwc7tscmiNNKi7o7qvreD6DS7hi3dLd5+IdW8AE=;
	h=From:To:Cc:Subject:Date:From;
	b=MyLU7TVXqWVP5cnxK1llZYdSGPFcHXVDkIaK6cEz0jWGVt6PVc2HuKr65Rf65xa9y
	 HPon11mTgb3MwMvfMSi/ncp2OU0BzqDsoZRanpcE2JEpGJGZeoizBLp7ZtA2iOcHVA
	 RR3p/KNp/l6dZc4NksRlwp5Qsu+gbIJLgv3UyPH1TEL2tcrsrBBt3HA2UKDnyqruI8
	 sCENthzAmZ7kzr0WOqdnum/kEFLuDdKKK6Pc7N3VsFaGM3f0SUtFT6xmD5BaByf3Yt
	 gOpW4SA2gGNR9gTEElaYTmp65QBIgWZRH1r3diBfepk4Ufc/GY16/6CTJ1lOPMrSLT
	 FWVM03VRspHWQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: samsung: exynos-pmu: Drop unnecessary select schema
Date: Mon,  5 Jan 2026 15:28:57 -0600
Message-ID: <20260105212858.3454174-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "select" schema is not necessary because "syscon" compatible is already
excluded from the default select logic.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/soc/samsung/exynos-pmu.yaml      | 22 -------------------
 1 file changed, 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 6de47489ee42..bc2f83aec42b 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -9,28 +9,6 @@ title: Samsung Exynos SoC series Power Management Unit (PMU)
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
-# Custom select to avoid matching all nodes with 'syscon'
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - google,gs101-pmu
-          - samsung,exynos3250-pmu
-          - samsung,exynos4210-pmu
-          - samsung,exynos4212-pmu
-          - samsung,exynos4412-pmu
-          - samsung,exynos5250-pmu
-          - samsung,exynos5260-pmu
-          - samsung,exynos5410-pmu
-          - samsung,exynos5420-pmu
-          - samsung,exynos5433-pmu
-          - samsung,exynos7-pmu
-          - samsung,exynos850-pmu
-          - samsung-s5pv210-pmu
-  required:
-    - compatible
-
 properties:
   compatible:
     oneOf:
-- 
2.51.0

