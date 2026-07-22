Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829C243C051;
	Wed, 22 Jul 2026 20:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784753063; cv=none; b=VmMVYA2kFajDE4P1NiBGZ9PvEhRfgyYJ0JIsalnc90xAyOgOH0hMilWrgv25/JDVii+AYrNdXiwY7QV3RgYDKXITPHoCADFiBJeUaedbizP2CIS3snYu0OVPJWW0sPfOixfEF3igrLAZWs4/lqQZlw9Puo6D7xam/1fZSXedK28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784753063; c=relaxed/simple;
	bh=nBnT0ILRGS71445iQQ/k8sTjno21gC0qcL7Lqu3ZheI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f6pY7zmqr8Uhia/G9QyvBuxkNlNYJbcH0VALDiwtCjgAWOn0KgPySPNZIkMypqfl1IKRpSuh8cxs+DCHv0SSiAjAOi3UluVpJc67Ca60G+15320G++0iDy4kmIpFAjQmcvnAk9uKQ4Zf/jO4KxZEgd1uPTKjOG3A/NDwejZbJgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=ode5UeJ5; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="ode5UeJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail3; t=1784753053; x=1785012253;
	bh=Qu0m+xAQAt0EQLmRWMyPn4FwJte4pJSptUN/+z4Ekis=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ode5UeJ5HjsK5Rud7ZUu7Qq+7LjrW8uNG86MpYCDNqhw/71dG3ViAN5PL9wePcn6u
	 K/qM8q5XrSsnPVzXjJjei3GPsipDvgtMoWEcPhpQd5PntUEmDhekQj8WaYE1++9m6T
	 QQmbF6mfFpHKB+Jy7akk4NS5X7sAWzZnQyzpPPMGgs5E/PXeGXlXNR697LscA8UKrG
	 E6H6Mz8bBC47CktU5l+23zM2WmDvVQ+xAGsLQrmKjESWGaqRxp8Ot0lfcEUFVEX2py
	 sxqYzBfqbgI9Z0Gd2y+AuddbAzIA+al2vay3nkBrf7OYPxu8oOvIr+1+cNm0OmVaql
	 45R4xE9XAiDxw==
X-Pm-Submission-Id: 4h55p306d7z1DDp7
From: Alexandru Chimac <alex@chimac.ro>
Date: Wed, 22 Jul 2026 23:44:03 +0300
Subject: [PATCH v3 2/5] dt-bindings: soc: exynos-sysreg: Add Exynos9610
 SYSREG bindings
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-exynos9610-clocks-v3-2-c672a2a30889@chimac.ro>
References: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro>
In-Reply-To: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alexandru Chimac <alex@chimac.ro>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784753044; l=2259;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=nBnT0ILRGS71445iQQ/k8sTjno21gC0qcL7Lqu3ZheI=;
 b=KhcjUlCc3EaKNQtUETeJwzjGEcuSogP/LFdwuPO/hcUQlVvT0uMEg7j5ScFX6SbzcUMlFVesD
 D/v6Zbsf6bjD+mtwIojkb7zVkTJeS0el+WlQAktBY0QnOjNEeE90c9G
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=

Add bindings for SYSREG nodes (required for ACG), compatible with the
standard syscon driver.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index fcdb9ffd2644..eb4194cadcd7 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -35,6 +35,16 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos9610-apm-sysreg
+              - samsung,exynos9610-cam-sysreg
+              - samsung,exynos9610-core-sysreg
+              - samsung,exynos9610-cpucl0-sysreg
+              - samsung,exynos9610-dispaud-sysreg
+              - samsung,exynos9610-fsys-sysreg
+              - samsung,exynos9610-g2d-sysreg
+              - samsung,exynos9610-g3d-sysreg
+              - samsung,exynos9610-peri-sysreg
+              - samsung,exynos9610-usb-sysreg
               - samsung,exynos990-peric0-sysreg
               - samsung,exynos990-peric1-sysreg
               - samsung,exynosautov920-hsi0-sysreg
@@ -107,6 +117,16 @@ allOf:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos9610-apm-sysreg
+              - samsung,exynos9610-cam-sysreg
+              - samsung,exynos9610-core-sysreg
+              - samsung,exynos9610-cpucl0-sysreg
+              - samsung,exynos9610-dispaud-sysreg
+              - samsung,exynos9610-fsys-sysreg
+              - samsung,exynos9610-g2d-sysreg
+              - samsung,exynos9610-g3d-sysreg
+              - samsung,exynos9610-peri-sysreg
+              - samsung,exynos9610-usb-sysreg
               - samsung,exynos990-peric0-sysreg
               - samsung,exynos990-peric1-sysreg
     then:

-- 
2.54.0

