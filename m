Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C452F2365;
	Thu, 26 Jun 2025 20:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968847; cv=none; b=hBn5nyruSlCbqcied/N93aFKD0/eMB5hd/SXHK/WBP1Qf/yOviCY42+ZrySfY4cl1IwJ7Ndo6Sk2ImEjFFyVjix9f+J1SzZAfsSkl+w7wXXZokfGVtfLP/X9pZ4rze3QzL35ElYiSn7ujSzMcYRuQGufToPpMuVnjIRrWFbY2B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968847; c=relaxed/simple;
	bh=epoP2UuyIL+Me+yxNnO2B9jQoJUegkUB4XN42F/6FoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qmdUOkd9TvCqAU70pDYgHs8jxEVeGrsA5hayJbitSo6eygAFQWxbZF2ufZVjzEzaWAmnrWtWfzYu2b3Eq2hMDKBiUmdeGZiJNUrG5++QXqLP8DKcuHwflO6biuFLunRiw81OIxc+xBUwFv/2TRh7bnDvAo/VyDr2z0I7baAd8zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=X9EEXz7F; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="X9EEXz7F"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0C64D25EFA;
	Thu, 26 Jun 2025 22:14:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-6oKX8-5Vox; Thu, 26 Jun 2025 22:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968844; bh=epoP2UuyIL+Me+yxNnO2B9jQoJUegkUB4XN42F/6FoQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=X9EEXz7Fd35wNnRobFsiF69crl0b5+vG4zbAb0JyesGxmHRgbKuN4FomFCR9eW6d7
	 gwgAr7YiPwXj/o6ZMaN+lRrtf5yvgHWpudZRMzsKYxipfpjt95hxFSuHGW/y5P20jh
	 aTNRe/FUi8l5nH0IX2jbooy9M53IsLS/ttpM9bR2BThD3tOfgOy82lGCC6+BQ+13Cl
	 6J7DEydQHg89y4VImXxkDlKbkVfa7nPQ/Xv+5YWO2DpL5WxismqW+hl9LyB10S5wN5
	 6Pn4uPjCE+Ul8HBkANIidSFvxGmP9qc2W740YeYUauMzKHJKeY9BYleGOzE/Rvafkq
	 tXEIi1dz5hB7g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:43:25 +0530
Subject: [PATCH v2 2/6] dt-bindings: soc: samsung: exynos-pmu: allow
 mipi-phy subnode
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-drm-dts-v2-2-d4a59207390d@disroot.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
In-Reply-To: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968815; l=899;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=epoP2UuyIL+Me+yxNnO2B9jQoJUegkUB4XN42F/6FoQ=;
 b=6a5UtVFoI+EulxnSYOrC5pd7WAo8VV5EgAn2gaNg1xW/L+QrbcqZibFBUWNAdV4woiBmbUWHP
 dWFu4ApWhW2AjFu0P/fIqb9XtG009qnGVm534tD7+Lyf4PHoQrwRwgc
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add Exynos7870's PMU compatible to the list of nodes which allow a MIPI
PHY driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index f0fb24156da9b8980dcfd5339ae75f12a71cf6d6..45acd6a03d761a833cec435302e5190fb50f7a23 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -172,6 +172,7 @@ allOf:
               - samsung,exynos5250-pmu
               - samsung,exynos5420-pmu
               - samsung,exynos5433-pmu
+              - samsung,exynos7870-pmu
     then:
       properties:
         mipi-phy: true

-- 
2.49.0

