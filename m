Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8732566E2;
	Sun, 28 Sep 2025 17:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759082236; cv=none; b=kRr6PnOjG7RPbtYvPYwlG/UCuR8uRRoRcn0lukIpEPjqypqFDyY3YRaVjNO2/zjj9VrtYacYiNvrVAZRd8KVytNdz05tlTCKXM0Z6dZ7Y6bMoRHRKXD4sT8K1KO8lHkJq0BK88vMOdhY4RhaSZw8lAFQ3ApJX9HsuSmBEENv8yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759082236; c=relaxed/simple;
	bh=N2KuE8IJLYc1CcM2YMaHWJDojNGvdBHAkkmTUKtgYiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5uL1wBD4/UoqKLzlUZVB0Nwzulto6eT2EPY5gby8udZBt+NDNr6hadtr0IbPCGG33wxVmH0vEka7WOx29KokACEhnUAOD0XTkXcgY+t/u+vVKBuuuc+M6lQsKCRqHav0GWEB7saLd0ZvgkZwBoh4I06FnPdMimmnzGi58FmxJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=VsEY9pZ9; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="VsEY9pZ9"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E3A3B25E06;
	Sun, 28 Sep 2025 19:57:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MewRaZEVq18p; Sun, 28 Sep 2025 19:57:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759082232; bh=N2KuE8IJLYc1CcM2YMaHWJDojNGvdBHAkkmTUKtgYiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VsEY9pZ9v+qdJP4FUxXvSiJ+nh7qLfxRHWL8I4ZCX+FCZ3bsqo/iT3aBLNa5PVk+f
	 x1D1xIgzgp8RYjt3rGAPjydBrTKfj9zpXfaFG6BRxA6ZOv0SSCSLJyI3de/A8w8kCw
	 AspRszAe/JivLKgbbR19HEGZCAqf4b81Rcu0YavVnkN3dcwbACOKPDPfsF1IFgUzL5
	 3blZgKUM3Nm+t1IF2kSvg3xJCHWgwHKAI3tLVOP0bnSM4/QqyQO15xo/yKbVOQ1lGl
	 dhVEbgUVDtVQHyApvTobFiKxtQcmRJ8vH04rB6jHsiYAQS8oLjIXcIi7T2f9CHe0yE
	 LICj0QzNSOB7w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 23:26:35 +0530
Subject: [PATCH v3 1/6] dt-bindings: samsung: exynos-sysreg: add exynos7870
 sysregs
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-drm-dts-v3-1-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
In-Reply-To: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759082219; l=1199;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=N2KuE8IJLYc1CcM2YMaHWJDojNGvdBHAkkmTUKtgYiA=;
 b=b/0m/d5eGFNSuXWC0fmefe6j6ak8+P9wVRNEwC0z7BsTBtah+0Ri6dg/wUPaPlYwlFNcLcfnH
 LyEbjTADMWdDNGDy5UkmpgI8mk3XxHqjNhLLmZ49goCJaJB0dobG/uT
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs are
added, used for the SoC MIPI PHY's CSIS and DSIM blocks.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..dd88f40a032c1e4e492dacf34a1eed27ee79976b 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -26,6 +26,8 @@ properties:
               - samsung,exynos3-sysreg
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
+              - samsung,exynos7870-cam0-sysreg
+              - samsung,exynos7870-disp-sysreg
               - samsung,exynos8895-fsys0-sysreg
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg

-- 
2.51.0

