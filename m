Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B3126F440;
	Tue, 18 Feb 2025 19:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905441; cv=none; b=MKppzcE5lO1VN4frJ9AwxuIqOG90a8wfySZAx0y06QmCRJlbP9O3qbHT2Wnaeldr2aFse6wjsQ5mBuLsPW6JwyUjaHfd5Wr6mVLfIFWj7RI2jafwezUHThQOSd3/3N5kJd9fXKYCk9xXPdaB8s+wVzByaK+VJqQy5R7hFi1QXOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905441; c=relaxed/simple;
	bh=cKeb4Q3zjzoX1lV2p6fkcHZ42nUiiWSUSr5T6FY95yI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GM5Qm5JcDTwtELkgdyEtJfx3CVJcDYZ5ad930FGbOznOSskiLywMkT+AKsIpCv0OdPiKHI7CimFf4Hel2dFhYKIhUHFdp8fSjXE0e55zyIjQIzugKs4nbn3rdy1rnLDcu7WALMTaNpxMjxjKeQM3s5j+efGM03Orr+TjyE1C4e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=k01g4yoQ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="k01g4yoQ"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3151725F0C;
	Tue, 18 Feb 2025 20:03:58 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FH0AztNAEVIX; Tue, 18 Feb 2025 20:03:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739905432; bh=cKeb4Q3zjzoX1lV2p6fkcHZ42nUiiWSUSr5T6FY95yI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=k01g4yoQ4hYZVvxqE/vfYpcVpJ+Plk1iKI7hHz/gD3wbUlU43AfQXlOT5LXPzqUck
	 faYhsAEWj0YitGoa3cT8UFQ34IZ2Y/BbNMLdslktxA3mw7kNH1qHg7IFa/VxR1sMG7
	 NtZAmChqrHLqIRYM4UMjB02fD3EwsAhd/jvrUgFV0cKcGr5xryJ77OGS/hiA/kmpaw
	 kHFvG485BR3oPajS0dmjIaBbYLtOp2/uYAUmFNdwja2sKumdqxhX8xV40cXce8ps9c
	 ifihKIIEacg1Yd172NE9179/3uZLXDBOIh9n3TtwGs5hduRLHTlFeFVLhe7jyX6+iX
	 9WAAQjzAwtADg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:33:12 +0530
Subject: [PATCH v3 2/7] dt-bindings: arm: samsung: add compatibles for
 exynos7870 devices
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-v3-2-e384fb610cad@disroot.org>
References: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
In-Reply-To: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739905418; l=1423;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=cKeb4Q3zjzoX1lV2p6fkcHZ42nUiiWSUSr5T6FY95yI=;
 b=ZomranXZKYALnG6J/QaNVuGlIwaT3myYXLshEsI3IljEC082ErbTPZTuB4633rSeGNKgL/Bih
 Pi9Gqu0lvLqD03KpgC0/cZZ462rJJC9VliU6JTT3hvVpkm60491PtDK
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
2.48.1

