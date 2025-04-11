Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E1521D3E8;
	Fri, 11 Apr 2025 16:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744389953; cv=none; b=K4lrHZJzgaBY2L9nEvEOtHNyX+ScWmSVSQuQ+MWmUd0nXDKM/vJ8SRdD1PngZPHS1f0tRDUNuQAn1ekXF3kgsjZCA2W3CgyxVtGhQJKN5cDEwhMWCHYBECeWeEaQ71G2QVl7o3BSTjVoUBE/quODgz5ukw/gf1D/fmTYyCJK+g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744389953; c=relaxed/simple;
	bh=FReu7ujzly8pZap8rq/c03boQMmt8+KCe6FrmfH2yCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pAnRbNhQvSmaWCNKsDjIWMDKJMZXCYFqrNNBQHoN9o+aeMZYtqAUhh8mI6u9KQZ/mANIb+4u2nfHEYXaR+dDNaPfO5WyzQBiPiY3nHEDaSXmI2YxrpF5wv9M5OJAa95xfXNQ3qisdTgBbQGGiPr4w8bv0nGYBRaVJoGgjv8+fMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=apRdzapp; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="apRdzapp"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9C49B25F0B;
	Fri, 11 Apr 2025 18:45:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5yNZHi-ciocG; Fri, 11 Apr 2025 18:45:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744389947; bh=FReu7ujzly8pZap8rq/c03boQMmt8+KCe6FrmfH2yCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=apRdzappuSD49zp/c8cUCIaxLXjUZzTLuQuHDgA3xO/9JdspzAemEucN35tvbdo//
	 L9nkGgctgEjBOeHFyrYTZiOW99ku2p3NVHOS+Dp4cabkbBZyB5lbKu4Z5NzGp+o6DB
	 d/y6fGP/WQ8SFGBhFVHWwE4uUW6FuCj5/DpaONwtrcuQrF5CHVapjQdrV/Ary5aXge
	 6l8Hcewr0SaOxKmyetrThMuslXyTzqhqWuhJIBMQbAY46BHLXRfg7AQAIwIIY7W6Lx
	 TS+dUDm30LUdFEG2mMNq1fDui/Tz3qLBXY9HcQG+HTzYpvw0MQ/fls4X+JJx46S0Ty
	 /aGTIIyqi5PVg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 11 Apr 2025 22:15:27 +0530
Subject: [PATCH v5 1/5] dt-bindings: arm: samsung: add compatibles for
 exynos7870 devices
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-exynos7870-v5-1-6b319ae36c36@disroot.org>
References: <20250411-exynos7870-v5-0-6b319ae36c36@disroot.org>
In-Reply-To: <20250411-exynos7870-v5-0-6b319ae36c36@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744389935; l=1423;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=FReu7ujzly8pZap8rq/c03boQMmt8+KCe6FrmfH2yCE=;
 b=CMR6Gu0sdI7dK3mhb1BomzExVt5a/C8GNsl8xIayXh1wcOc2ijItEXD495eq6Z4ogXYEbAXoQ
 q6GACmjH5DdDDpcZI9b/ZTXC48kk3BQzPNjwy4heLTn2YHiO3NoIpgI
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

