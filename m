Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3A91114
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757878474; cv=none; b=KWKTtPFKFqEVIHzvHUHKb0Uy5okva11Zxjc9PHtOOPGcZtSqZrUjSpHZ9C8Di1M2JKrbQ7VEZF8PZAJju1ymkA5bbFG9GV+E7LngeGuDquMp2aqsYeLuOuH0CUicVaLGnWvj75jAuTGYVU3g+WDETZHtWF11tUqChbM4InzXYv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757878474; c=relaxed/simple;
	bh=XyJr1Et83VSZI4TiOdi7NfvvgURQCYI5SyEeqwKJn9c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lMX0GCDO3ztHiyZkEalaJp5qRqP8pSGXoAq1e8jyfyLnUpvhqXuugIzideLDzZfFc5tug6REG4i6RrwMwe3+iOQQJPHPZW3+7Nuh9eSirKSt8aEESqP/kOVPlQZuYLwwDXLwZihRQIhYW+K+ifpyZ4YNbNqyOUZLLBjut4FUSY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=iYkeJ7ox; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="iYkeJ7ox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757878471; x=1758137671;
	bh=7lpOnihuzgN8aXgYGmo1vFZZPGJlskHF0+CRgoIdYsg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iYkeJ7oxFPeF0Ogfj0g+m4tDHNF5R4qLTuXc13KtuJfY6tNvzutx6m/Kr+3ssKMlR
	 YJ4PDNBJsWBved463O2SI2fTo3nlDQGJ0su5gpVUMUXTV5MGY2QUcL5yq7dNfXBXDO
	 wcQ/jeoGACuYYU6wDoQWLmNTgAHPJ8I9dql4ewIh97NeeVQAa3a4agVtIFkrCBwh8u
	 uSlQAvnIznj1zOKnqMJReXCpCgIYa/QOPCCMeGtFLeBn3JZaQE6AuV371Sw6KE8zBU
	 EgBIiwbzY88hXMJLUsbq4JkUg2kxQ+UEMKJWI8i7SK2pMayRfmMmqn5ZQJ/dcDtFh6
	 jqWxcg2weinsw==
Date: Sun, 14 Sep 2025 19:34:26 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 1/3] dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
Message-ID: <20250914-exynos9610-pinctrl-v1-1-90eda0c8fa03@chimac.ro>
In-Reply-To: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chimac.ro>
References: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: e3fd850e34ca0b8637da029291435a099c697aac
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document pin controller support on Exynos9610-series SoCs.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml=
 b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index de846085614166087ef9046cf5d154fb9dad8309..2ebe9353d3bff9f708118a249b5=
e969aa5fc393f 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -56,6 +56,7 @@ properties:
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl
+      - samsung,exynos9610-pinctrl
       - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
       - samsung,exynosautov9-pinctrl

--=20
2.47.3


