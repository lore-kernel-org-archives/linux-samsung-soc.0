Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B56622B8CB;
	Fri, 11 Apr 2025 17:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744390961; cv=none; b=qNwtJunb16OUPKGhBbe0QxfH974gstHsbXEOOP4JQtb+7L3C1VQoa6KlRRctLCinkT17EE9iakv+BgQlwG+vfDiePnIZSN8DN4eC4hDNFHARQmh0IOZRC+Yp+6Uz1uUVxpl5zI6xXjX25cIAsimmgAJdewM/V3EbbXANN/IfVdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744390961; c=relaxed/simple;
	bh=FReu7ujzly8pZap8rq/c03boQMmt8+KCe6FrmfH2yCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=edwyI/9Nc1G3BBzmPmmUzg+Gb2eQE7kW0SMmYmgBvllw6Py0ZlgVXrDzBXN5uHb0US7bSJXRszB08RsRgxjCePBR2ekbctd8A+F7a0nV+pByk16hTbGWwd/ImEKykGjENKkr7YYqqG+Df+3Ocqptl1aS+UXogwmS7ZZCQ2GoQZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=F5vPahNg; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="F5vPahNg"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EDF6B25EF5;
	Fri, 11 Apr 2025 19:02:36 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uj5Ld-3HANVK; Fri, 11 Apr 2025 19:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744390956; bh=FReu7ujzly8pZap8rq/c03boQMmt8+KCe6FrmfH2yCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=F5vPahNg/nAYYi1lVowWzm4EjJ0fnt0pPdSfACZCfyOZ74ZjHqF+ZmA/cdi2m4Qtf
	 Kp1ih0QCLg5cRmbJz5/QSPpXqs19k/9Mi3Vc9kFtyvnJvj1QD4OAi+X9aADtiArdqb
	 OlgUWQtlnhC9YV+qM3oCeeW7bGNY+64VfYQF5C+eA0YZ4d79TKde06oex5/eL4cQke
	 xzfRfOtmrciuYJ4wMNQSiSn0oYpkFTYVb2NCiOgksMdormhBQmSxy/uX2GapZ1NxyU
	 uBn8DVyLKUthP9q5lS6+MaT2MUi9SmYWMtqItZtSxUGHvBBLyHNKfcJiVa+hnfcZrb
	 2XnWb4x0XA9fA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 11 Apr 2025 22:32:15 +0530
Subject: [PATCH RESEND v5 1/5] dt-bindings: arm: samsung: add compatibles
 for exynos7870 devices
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-exynos7870-v5-1-fa297a7ce41a@disroot.org>
References: <20250411-exynos7870-v5-0-fa297a7ce41a@disroot.org>
In-Reply-To: <20250411-exynos7870-v5-0-fa297a7ce41a@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744390944; l=1423;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=FReu7ujzly8pZap8rq/c03boQMmt8+KCe6FrmfH2yCE=;
 b=n3DVVdTxLcOTPgeGPZDGzqWPHizT6+up66cJ7p48g5MmqPz0kcKuLTLB3I73LdCZdUkcJpJJG
 4Nok1mGLQREBXL4/Bznaj7+k9zj+a73SoqMiXtJvPmR8atgTJpj+QK0
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Document the compatible string for Exynos7870 - "samsung,exynos7870".

The following devices are also added:
 - Galaxy A2 Core       ("samsung,a2corelte")
 - Galaxy J6            ("samsung,j6lte")
 - Galaxy J7 Prime      ("samsung,on7xelte")

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index fab29f95d8e62f5ea75bb0819a9d514e54f88d3c..b3be184c7e563478aa37eb16a69c08ff7f70af29 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -212,6 +212,14 @@ properties:
               - samsung,exynos7-espresso        # Samsung Exynos7 Espresso
           - const: samsung,exynos7
 
+      - description: Exynos7870 based boards
+        items:
+          - enum:
+              - samsung,a2corelte               # Samsung Galaxy A2 Core
+              - samsung,j6lte                   # Samsung Galaxy J6
+              - samsung,on7xelte                # Samsung Galaxy J7 Prime
+          - const: samsung,exynos7870
+
       - description: Exynos7885 based boards
         items:
           - enum:

-- 
2.49.0

