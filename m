Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8262E0934;
	Sun, 14 Sep 2025 19:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757879436; cv=none; b=tuATUEq24vypqZisZZRlmxlltywEfRxGnfhp4iAuVXenFb9G7pyxLP4xcXsv5577mDDxUn+3r7ppbCFecH8i79T5hmhhr30JdsoadRH6N8x0Mpf1nqTRcTUxr178rzqMaxvDgIOSyzHSGbxvN6LDWAxDPYTyTPgzCjB43LWmYTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757879436; c=relaxed/simple;
	bh=zy9CImG+fjv3VT3D52nNRuwdOAURTPxAUlUFaT/ZLqo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KMuJGmMpHfW9H/yjAJBIhYnYpQ3VFAqEybb9r+wTjNEQ6LMAwNiW1pzxVIzyxehkGu9TgEKQz38SNOMeOeZLM8amcHPdqC8mJVnOgc/gB1XuhbELxY365fBmGd+VHRcFhP/qXNQUDk1WD9v3n6uF/miTH8wvICDnHxFJoekQT2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=qYJyRm39; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="qYJyRm39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757879433; x=1758138633;
	bh=YmWciJum1d8Cm20+rwLBib6VGIcB8DEUjk7c5Wgsxvg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qYJyRm39IK5nfZS/weMGruyH31R36VJnYAUzTq1wuEjJydtxs1b+ZHLGWuoiBNwkx
	 La93ojPel7QGy5fxEY+6Pn3mbRmRB6UZn44+AgUyNOn5b8m3ezTvJ4/FKOh7lGWuOD
	 MuQYqkrwDdAogVhwZiF6ZUeGqQbNSM/9URGCCyRfdjyn6hfdz8GrXze+LR0wiGVXB0
	 i5dJUeuj5Ju+uG/gWRqrWiEEWhO17Zjx9OBWAR15n9fnmdnMUDWzhjCYp+cy49k772
	 dUmbN7HYeg1p9R3OZ3rvNdIS7BHs73R2GlkVkAfYY+ZBSNaAv3L3S7UMu/ec2n5QDq
	 ds2DJfSVYCY4A==
Date: Sun, 14 Sep 2025 19:50:28 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos9610 compatible
Message-ID: <20250914-exynos9610-chipid-v1-1-ade99e09a23c@chimac.ro>
In-Reply-To: <20250914-exynos9610-chipid-v1-0-ade99e09a23c@chimac.ro>
References: <20250914-exynos9610-chipid-v1-0-ade99e09a23c@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: de8a89961de6cc79e2bc0de5d62b937bc3f0f78b
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a compatible for the "samsung,exynos9610-chipid" node, used by
Exynos9610 platforms.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid=
.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 383020450d780cab1f3a137dbb8286ef8ba21b31..55fd1cd59e4ea149b82d6d970e2=
ebc11064455ab 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -26,6 +26,7 @@ properties:
               - samsung,exynos2200-chipid
               - samsung,exynos7885-chipid
               - samsung,exynos8895-chipid
+              - samsung,exynos9610-chipid
               - samsung,exynos9810-chipid
               - samsung,exynos990-chipid
               - samsung,exynosautov9-chipid

--=20
2.47.3


