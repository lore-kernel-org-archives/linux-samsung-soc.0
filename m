Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1083E2D1920;
	Thu, 12 Jun 2025 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741852; cv=none; b=RBsTWA5EBoy6IrgGF1QRtYaMkMf82HTQWQtWKdFrNgvVCBMLbvbRwJu66rzW5JsWvcM/iAGPdI2LPbeTOQPImvXlEzr9WWhgDjx5+ywogIQ4zV4ecEQJtfzGTzx7ga7r8sVg8AKwGv3+J8DtfR7BQ50brw6kxdccxZoPoxRzOgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741852; c=relaxed/simple;
	bh=vZFKzYhN2DrVkkIle6hsFg4Z4nvKKm9w3O+sgcHdcAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EkhTv5v+r3UqElibggVhiCASheM6SA963+qjBa9ipZ7IeBigUUOzhwiH6/njCFVnb6ckqUtQF3WVg6u7B4iZ6h8fTRKr3cz9Sx0Zg02qyyv5emaCo0A1SrDtM6hPILclTf1rtWVXjqN5zJyNffTX4IZ0v7PO0juKe6NS565mgpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=gpuPRYKs; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="gpuPRYKs"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8998C20E0F;
	Thu, 12 Jun 2025 17:24:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSAyWYVMuSkv; Thu, 12 Jun 2025 17:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741847; bh=vZFKzYhN2DrVkkIle6hsFg4Z4nvKKm9w3O+sgcHdcAg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gpuPRYKsMeh35gmSCTygaKqoXBaMM6VLCJP5vEOhPTswarxsD9kA2zvVdFJm/y7Iw
	 y7JGQpdBVm/kUkvClA0kkPYKWz33sidRi1KmDhs7SblKXGH7otBxfv2CuHkInXekaM
	 q1Kp+RRKYsvaDGt6bfpJpDw4WsqKFUDbjjMczHJs67HHpUUKKiHWD1qNxjPtTQJH+Q
	 7w5Vf+yE7jyXbgIQel5q17B2mYDmKBOT5fTBTCpoJ/Vdwvgm6zOtMopQ5gVXuJqTkO
	 UL19R2Sg+2lkI3W5c2pFv3gNdL3NKiXjoDU+fAq7St4i0vUUw/5JOmnI5W1YogjpCw
	 y/elZEvNx++Mg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:53:37 +0530
Subject: [PATCH 1/5] dt-bindings: samsung: exynos-sysreg: add exynos7870
 sysregs
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-drm-dts-v1-1-88c0779af6cb@disroot.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
In-Reply-To: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741830; l=1176;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=vZFKzYhN2DrVkkIle6hsFg4Z4nvKKm9w3O+sgcHdcAg=;
 b=+jdfMpMZAaml03kl+O9oxwB4hvxqVIwWj/a3gYQQyXavGQtwZ74FOFZFlIOoaEWgtgPj/7x+2
 bDMz1ewKhI+Bt5zsU2fYptUJR1dhut8s/H1TNurHKL+9YP+lCUrxpZm
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs are
added, used for the SoC MIPI PHY's CSIS and DSIM blocks.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d27ed6c9d61ea9db77229eca60b6b9a0abc5d305..174bdb8ee932ff965de6fc17aef004a3cedffeb3 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -52,6 +52,12 @@ properties:
               - samsung,exynosautov9-sysreg
           - const: syscon
         deprecated: true
+      - items:
+          - enum:
+              - samsung,exynos7870-cam-sysreg
+              - samsung,exynos7870-disp-sysreg
+          - const: samsung,exynos7870-sysreg
+          - const: syscon
       - items:
           - enum:
               - samsung,exynos850-cmgp-sysreg

-- 
2.49.0

