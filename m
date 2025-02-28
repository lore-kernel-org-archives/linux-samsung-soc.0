Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B202230BEC;
	Fri, 28 Feb 2025 19:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740772055; cv=none; b=kGH1O+tirAGDOQzdMQU1RBypokk+NZylvppTG3It5sg0DZL7h67zOpzYZ1C9ZZLPvsUllCsOa1Yub32qrudYgDB9TuNQCYp0hNTsB/cR/fw8Yy9H66D0hsDuj3iORZobE36uA+PGV32H4wHhAiCNgNXr43BAVBbQCM2SyaqHunU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740772055; c=relaxed/simple;
	bh=beBhUlHl0wuFADBGaftFUBbt7Uwjjv/r71KtaFB8z1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJYeXDVciNBMvtyXXF2q79sErbX3pMIjglY7N8qL6WVKU9IN+CxOnzvcT2hnDeUe5tRmDF5qBfF0PRon4mSzxn9ug3DXlnCMx1wJ7so9GOk6RrpMiwEO081o12bUnb6RDzL0nLwM+XBNYvIKycEmOx1aB8kpy4UGiGQdGtulmgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=MAkmFfjb; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="MAkmFfjb"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C28CD20536;
	Fri, 28 Feb 2025 20:47:32 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGyQIZGVotQp; Fri, 28 Feb 2025 20:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740772052; bh=beBhUlHl0wuFADBGaftFUBbt7Uwjjv/r71KtaFB8z1g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MAkmFfjbk83jjlVfaV5y43T+h3YaZJrN4Of+CEUF7dx2PZd5lXr5ctGNq994+eHrQ
	 hhCaqf6b074O/VvEIOUUrdGf8tcD/ZjgnQkeTZeOIeYMMrlp1mzHmd9IUGbYHQymW+
	 BnYAd5yjSnWO1AEO3WrFq0M9zc8gOqjhn+jyObKIyv7sNxcuev6iIIB4aUzNYK67Cp
	 HBKTY9oevyCjdMkERrkzo8/YyzM47XnxGYcQAgsIal9MWzTlIXuTMM8wHk/9tndFrN
	 JGpBmTJaSoagWANiXZxIUwJdcE5rmzgGphx4uyo/WdT1FfwC+S9V/52ZcjcNMDUl2N
	 0+NsrNtsns/Og==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 01 Mar 2025 01:16:49 +0530
Subject: [PATCH v4 1/7] dt-bindings: soc: samsung: exynos-pmu: add
 exynos7870-pmu compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-exynos7870-v4-1-2925537f9b2a@disroot.org>
References: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
In-Reply-To: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740772038; l=1061;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=beBhUlHl0wuFADBGaftFUBbt7Uwjjv/r71KtaFB8z1g=;
 b=eNJrUrkiBb3wTtdij4IU6MnmCdHl1zoHgp3a/nriNvNKRtZoG8qTR0dbwf9ODhjSkIKTivOu3
 Z0h5atWPFy8DCPXuLMpcF909lz+hNyXTkD4BDck7Z/KJagmndDXcZed
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
index 26bdbc3e2cb1c52a5efbc64b18dcc20fdfa6256f..204da6fe458d2d4bfeee1471ebc5c38247477ae2 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -53,6 +53,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos2200-pmu
+              - samsung,exynos7870-pmu
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu

-- 
2.48.1

