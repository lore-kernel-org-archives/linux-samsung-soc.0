Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF854248DC;
	Tue, 22 Sep 2026 12:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081192; cv=none; b=NulFQ5HquWsUHj0xkWyGU3s3BwX2H8WRPMiQwORpMshdorx7kb4KOZLwCaBJURweYS3oI0oT0OSoV3taEmPo70DLBniguXVl6D03PyJ2sIKLAQ//PhBAmqMczaU+FGYOqETbh/7yjrFpEYgrkCRkkipc4mH7+F/4XPIubNeHpGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081192; c=relaxed/simple;
	bh=FIDOhx16bKTnLhDsEzKck56HBIFnn9qu9WN0aTyG/g8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HepwoCkIQcfTw2fyZngjcbkH7B9B+uIyKGP+caBVX8Crj7TGllVsEn38FcL1WfiLqU1RAQFHpINKqpCn6pCTDJSMF7R0gfL/HZyKHKSwxYudJ4HQ/vKkO7YAhzZ4G1CM0rx1TRJAbCA9WteI5NATP0RZ5nEoDECwRjF/orZ8B+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=qeLr9vST; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="qeLr9vST"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4hpzQQ3JV3z7t9l;
	Tue, 22 Sep 2026 14:08:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro; s=MBO0001;
	t=1790078910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TWtGuJsSnA6q09a1WdY7USh/zxzDAqnc0W6q2GxteG0=;
	b=qeLr9vST+26kAoPTEP3kbkxBxnqAFhZH3M/tRa70BmsdR63LGw3Wfcw4AoIaDFrAD3BUy7
	tpWq4W0GdjNlznLL/monasWQxiXXVLX/oQxdQ+XVa3E5wf3/zx020ElKaZE4//QX12XTHa
	N5BNX3GWzMRkabVbhcbmQkM81XBj6hvSLI085HkwG2FFrypczl+jCPWnmbSE2TRJA4pxsR
	vGoicRgWNFmNsIf4NUmS2HJv/uR6k+JzQnKT7PSwIUw3XKOZ7xNmGKKhb5bLOE+bV6GPs0
	dn1n3DZT/3kv3Cy5HjQszhMNLKYRbJ/0MrOwPHFHXvAs9ZQmyoU4wPK3+Yzbrg==
From: Alexandru Chimac <alex@chimac.ro>
Date: Tue, 22 Sep 2026 15:07:35 +0300
Subject: [PATCH] dt-bindings: pinctrl: samsung: Require clocks for
 Exynos9610 pinctrl nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-exynos9610-pinctrl-patch-v1-1-26d8108c1802@chimac.ro>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0Jm7Zi2JCBcxbAowyhjpGBbCIZwd
 6u4fMn7728Q2AsHqLMNPC8SZHQJ9CkD6q27M0qXGIwyhaqMQV7fbgxVoRVO4ij6J042Uo+siEq
 tLx1VJaT55Pkm6y99bQ4Oc/tgit/e3/D8mtNnPDRobWCkcRgk1tlSnnP0lEOz7x87AquXqAAAA
 A==
X-Change-ID: 20260922-exynos9610-pinctrl-patch-e0cc7118dc97
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790078856; l=1196;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=FIDOhx16bKTnLhDsEzKck56HBIFnn9qu9WN0aTyG/g8=;
 b=kNSA6azedja79SBfwuu7Nch0yZTKElj/5HKy+Z3akWBe/0WYHt4q3hkj0KzayGzzCW65urG7b
 S31h8FfDFf/BQwxGLk6Pk5YDpZKaB3oLpsL1FebkBV/RXJd70IBy+3W
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=

All Exynos9610 pin controllers (except PINCTRL_TOP) have clocks assigned
to them, so force the nodes to have clocks assigned to them.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
Most Samsung Exynos9610 pin controllers (except TOP) have clocks
designated for them, so allow the device tree node to include clock
information for the driver.
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 1feb6a6fc690..e4fdedb29631 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -140,6 +140,7 @@ allOf:
             enum:
               - google,gs101-pinctrl
               - samsung,exynos8890-pinctrl
+              - samsung,exynos9610-pinctrl
     then:
       required:
         - clocks

---
base-commit: c2cd463d6ee7d55a3ec0719d93c49ff99022d58f
change-id: 20260922-exynos9610-pinctrl-patch-e0cc7118dc97

Best regards,
--  
Alexandru Chimac <alex@chimac.ro>

