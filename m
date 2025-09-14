Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707652DCF70;
	Sun, 14 Sep 2025 19:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757878491; cv=none; b=gZygVUzS+ksrGphrn3zDESWBy9rcgCNqNdMdsL7+bkZp5lnxcSzZiWvnIW3nthLUAwOH7+7FtIAZvdwhfn7jPGmu4cmwavKVpQ82uGK6w3V+2nkhfBm6ELeDOOGHH533pApgJetKK3SeHzZrVifRXWL5bfUq5h28Zdsp2YlNbsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757878491; c=relaxed/simple;
	bh=F//VEGGKQ4dySAaUx/MMsnPS7gqkPc0NM8iIn0Frh7c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PrwCctEgcLBDxvB7AMX9/TuVptkhg9ksePN5hcWwUbv9Z5/51MbLRNBNmJMuHsi4mEC5xePy4TffW+NBlsMTC15KmD8fUY3F2Lgd949hl65yvqsOiDqEl6o4dsnN4M4uwpIIhqHwk3iiPbJ5p/P0tyHsYFxs3xvA9ZE1XFSJ/zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=XZN50oF8; arc=none smtp.client-ip=109.224.244.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="XZN50oF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757878481; x=1758137681;
	bh=E+xJKNk5JY17fob/Z1mGipjlu1Tw15TGNfmIUUFMZBc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XZN50oF8Qh12FYWKXsXrL1uoywEBL24DVU8/X/BPINIvJe4Lk+x9aM2GrpD+Efqag
	 A+jW9jPemMx3yzWUtaNdRWq6doD9DII1t6XUbwtK/8D4WBOXxb2m1mE7aj463b+0B2
	 SzI/TpkdegotG9aB/YS9PSFep1rZeIah+SapcJ38B0SthBRqudCvbJZ521dDlYKcTg
	 2s3rBoX9yUi7LS8TrftiN4SCDMclS1OWhjUw8tsCL0qAZu0FTU53RKvbhxws5Dowcr
	 ghjiKWtbPocHyhtS9QxPWvcj6TaxQ7+fCtv4Mik4/Q2+qySm4BOORddn3HoIbu6Z8+
	 2lQvt7aVeQ72g==
Date: Sun, 14 Sep 2025 19:34:37 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 2/3] dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
Message-ID: <20250914-exynos9610-pinctrl-v1-2-90eda0c8fa03@chimac.ro>
In-Reply-To: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chimac.ro>
References: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 3c75b62b02e9849df976c000fd5158f746a985f1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a dedicated compatible for the exynos9610-wakeup-eint node,
which is compatbile with Exynos850's implementation (and the
Exynos7 fallback).

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml   | =
2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wake=
up-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinct=
rl-wakeup-interrupt.yaml
index 0da6d69f599171b6946992c036f23c5dea17bd0d..fe06c0d2734960d3fe57783c1c5=
28f58fa297c57 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-inte=
rrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-inte=
rrupt.yaml
@@ -49,6 +49,7 @@ properties:
           - enum:
               - google,gs101-wakeup-eint
               - samsung,exynos2200-wakeup-eint
+              - samsung,exynos9610-wakeup-eint
               - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
@@ -123,6 +124,7 @@ allOf:
           contains:
             enum:
               - samsung,exynos850-wakeup-eint
+              - samsung,exynos9610-wakeup-eint
               - samsung,exynosautov920-wakeup-eint
     then:
       properties:

--=20
2.47.3


