Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBD841F7D4;
	Thu, 16 Jul 2026 17:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222105; cv=none; b=u64RJoJncssSkSNO+9upjgJlvZ5S8dqlQ7P98Q3uDcItGZy8qt7gOEiHKtCRD/8BkbXX43TKMRm2IYvGSanviJ4A1s+gTISoA00OqbADPFs85aJAV298/lZODwCqg27o5X7Ua2Qc6HASBMaVy2Js1n6bCwzSE1OmKxBjCWvO9Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222105; c=relaxed/simple;
	bh=xgTRU9NV8KIK7EesLO8Tv+TyYxZkVzU2UTJ6xlZVF6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RSxsjNDujgTxhoLkKeMz9ZlhZWm9OjkmLuruGvROavLJ+sCzd/6WgFvA4ZuHy2fmbONi5KhAw8L0fCsG/m8Si1ZSTpCyZfCtIkn9e6nXt1uTLjPEt67/7VNXIsmP8dJxFJgz3UtT4u8T2oMVLBBYecVhDPcT2J+Fc2z8jf/+8LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLHDdwfg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLHDdwfg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2E81C2BCB9;
	Thu, 16 Jul 2026 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784222104;
	bh=xgTRU9NV8KIK7EesLO8Tv+TyYxZkVzU2UTJ6xlZVF6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eLHDdwfgr5dknIUm1yMt+S08IKZ0HA5mxHIR6WakAvgCHB5Z+hqVMHmxx4n7um/4B
	 w327w3AQonOg2oXjYowClacTtE5DGvQp+3JfnBJjDJWpCHEI7q/KimEDyZ8+8GbOMv
	 9iDFynGsSC2UfCGOGl7pK9zxqveZNJILrjAuDzSoQ2UeAQSB9Prf7Uu3iNK8+oOkas
	 mtwniDw1eTFz9eqPL1qPAH9yfRsLrlSjiqrtsUORBnWZ2+xTl/W8JOrT33zQzLHlDF
	 50Y0jQFkubpLedkEv/oclvrzYB6zeryj3/+RWOVbsphcD2GqLn/EtUH7dxnUr9GYZ0
	 mAevjdJJ8FEGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5373C44511;
	Thu, 16 Jul 2026 17:15:04 +0000 (UTC)
From: Alexandru Chimac via B4 Relay <devnull+alex.chimac.ro@kernel.org>
Date: Thu, 16 Jul 2026 20:14:56 +0300
Subject: [PATCH v2 2/5] dt-bindings: soc: exynos-sysreg: Add Exynos9610
 SYSREG bindings
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-exynos9610-clocks-v2-2-c13ce8ef1861@chimac.ro>
References: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro>
In-Reply-To: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784222102; l=2259;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=nBnT0ILRGS71445iQQ/k8sTjno21gC0qcL7Lqu3ZheI=;
 b=eyJL+lvCIrT580llncY2lwuOiTuof9OLLqoKgpcwuIhWUyYPMVEpNiQeXWhVgcCQ5ZEtKHO3Y
 bCDkkfALh/vDE1+A8ws2ga5PCimKgrlxi8lO0hU6xOz9WMyTVG7W4Pn
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=
X-Endpoint-Received: by B4 Relay for alex@chimac.ro/20250914 with
 auth_id=877
X-Original-From: Alexandru Chimac <alex@chimac.ro>
Reply-To: alex@chimac.ro

From: Alexandru Chimac <alex@chimac.ro>

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


