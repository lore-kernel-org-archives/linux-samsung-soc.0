Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3646270EB7;
	Tue, 18 Feb 2025 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904676; cv=none; b=K+FatA/dofzV1d6TnT59Z7af1eN2MQUrvwi7C6vyf9kgFbVCvna5Sl/A1nBd+WuFHMTk3W8FK+9yvZ33Y0+J+8rCthgPFAPH6ph80Yx86fXYjwCafNQ4uvUeYFq4SlHlzmBsx/XYPRz126yX9KKiEVf7FKJ7Sq9UBTpE8wKIWZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904676; c=relaxed/simple;
	bh=1WS4+GviouC1J7JzCrhTc/LONd41x5XcXEa643Stixo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VWLntQ5WHzLEozO0bbNU+idOOFPEt55hL624bvdXb+/f7BPt27JLxNskSX3mWH0L2qiHb/DtQWy/7x+Pg+CqYA8314Z/CtJbxtbaQVPjwdZuVVDOImFB+r97SJni/KyyHDPgxs05dU93dgNOn8+9kPktpErf1drvs9253L6+JtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Od/hBAAx; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Od/hBAAx"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 72E1E25BD1;
	Tue, 18 Feb 2025 19:51:13 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gd3XAxjpVBLr; Tue, 18 Feb 2025 19:51:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904672; bh=1WS4+GviouC1J7JzCrhTc/LONd41x5XcXEa643Stixo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Od/hBAAx4k3+bWeyIenQkqHS2d9Blp/dFronRqNJg6whhW8w+4LhHyD1C6DMQRUmh
	 lPfha3y5VZx1iLwvfunEFI9k4J6PTK7pZWwFTxMl0mxObw9ClDSs3s7PtzCdrIQJGM
	 1G5OFawG/PPuS8H7J2Oz1FUMuuRIxSy2oW+uOgZY+sb0JLTQLrQJNFGOycfRhvXGA4
	 x1Pr0wzonnQIWqpoRlygSiprD7stjt3OvwO/bbuFH11SfYiDAXXbMVTI9zRiwHxRA/
	 HNCbyrB/gQ9WN+HEbsZTG3KxAYXwisrKi01rbqtZ+InzkMIpdoOY3If8Jk5wCP8V2w
	 Cv2UiY4nYX6Bg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:20:30 +0530
Subject: [PATCH v3 3/5] dt-bindings: soc: samsung: exynos-pmu: add
 exynos7870-pmu compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-pmu-clocks-v3-3-0d1e415e9e3a@disroot.org>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
In-Reply-To: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904648; l=1048;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=1WS4+GviouC1J7JzCrhTc/LONd41x5XcXEa643Stixo=;
 b=0Jk3yZOiVUzbTp40QcwxIwlR+GKr0fq6g/ug6VgxiAlHVH4MpQOQZZ2kz0hZh7Bk1X+aFFRx1
 EybV5mGxaqoBdokWRaVvscbYZNFCMK0n693lzb1CaApYki0przIrEBO
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Document the compatible string for the Exynos7870 PMU. It's compatible
with the Exynos7 PMU design. It handles syscon reboot, syscon reboot mode,
as well as other system control registers (i.e registers for the USB PHY).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 8e6d051d8c97de0c843a91350a5cb9c332b2d6ce..3baee81df54981cb4c6502c1ddf5be3d5e3184c3 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -52,6 +52,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - samsung,exynos7870-pmu
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu

-- 
2.48.1

