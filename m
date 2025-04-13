Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC2739FCE;
	Sun, 13 Apr 2025 18:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744570768; cv=none; b=QlKufyEUiwFvfoADWuXL5dDdKOoadk0QhajHGrzT2V2FLp3v4hFDQtD5mn2N7B+RN307CjoJnpLG9YecLVnhGE04EOmsCxlaDxZjGinq+grNGA3G5GSYsPOegc7fnQKmGgJDYnS3n8SqBHTLjdwMWa61BO0CWxBYtwJDoZrRoTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744570768; c=relaxed/simple;
	bh=uzUwV7MCGPgFoaynlKP/SaT802tNGgqv6rxpk5HZMN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UpKofDZETr6RuniTGwgUcEuNy+X2O/aIb67qUr4Q4QzSrl0rBOHJIXciYJY6k4cj5mVa3KFQsfNAD5Iu07FnohUVSQNiH4wVKj5L9rTJnTqS0jV1aKYgKh+ewsq67CMsvlYnjzMkgVPtzFGgElLjnJp9REspUqhUgHB7cjMpti4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=XIaRF+rj; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="XIaRF+rj"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3FF7025FD8;
	Sun, 13 Apr 2025 20:59:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-NWjSllyoVM; Sun, 13 Apr 2025 20:59:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744570757; bh=uzUwV7MCGPgFoaynlKP/SaT802tNGgqv6rxpk5HZMN0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XIaRF+rjPqhLFJvBZADx0/XI3HXSltDN349oaa3v8Leay3sKCWxePC6orrFrpQ5H7
	 pTrDBfZMdT+DyaYurbj7qp9J6WoghfR8rELx630OvZhxtq6Aqdaj4yegIcUuy8MVdH
	 HNoQrF7b5ppggvNpxD1YfCyzsx5aKVgO6j6QfHo+iYrcl9MrKjWvymaJuH8HhHvSbF
	 HzwpIH8RRuaMK5SCDEPjcAKqkr6Q4L3DFipE2L23/FzphB6Xe7wEPue44u03p+9wt6
	 dtf7B8bpgQuVIWTxbOs/mtHx39m/6s+j0nC1ViyCPPjEDZk5RiYdqOLd8gwOWHtIgK
	 brHY9IkjS7mkQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Mon, 14 Apr 2025 00:28:42 +0530
Subject: [PATCH v6 1/5] dt-bindings: arm: samsung: add compatibles for
 exynos7870 devices
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-exynos7870-v6-1-039bd5385411@disroot.org>
References: <20250414-exynos7870-v6-0-039bd5385411@disroot.org>
In-Reply-To: <20250414-exynos7870-v6-0-039bd5385411@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744570750; l=1470;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=uzUwV7MCGPgFoaynlKP/SaT802tNGgqv6rxpk5HZMN0=;
 b=2uXYGQ0Iw9i3OeG/bso4YtGc83tCQs/5ErfyfrdmenAwwGNYAt4mwX9muze++efq4FO4QEg+u
 mhBtGxx/cJvABDHom4vD+ul1gwi7910L24aYYBqFNbZiB3JTa7egrTO
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Document the compatible string for Exynos7870 - "samsung,exynos7870".

The following devices are also added:
 - Galaxy A2 Core       ("samsung,a2corelte")
 - Galaxy J6            ("samsung,j6lte")
 - Galaxy J7 Prime      ("samsung,on7xelte")

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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

