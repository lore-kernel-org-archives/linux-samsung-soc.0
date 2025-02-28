Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978BB230BEC;
	Fri, 28 Feb 2025 19:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740772061; cv=none; b=BObippJ+8DUigdBlCg6QLcZQT7wq6drOlju4W72zyuccnrs+de1hp9z/w5K23OgR2REN49enTRWOARlrR8gR7oQb82srgRcjdclzLrqdNK/0C7f59BVpds0/u7JdAqMartOznjmA58BrpVTukQGqSQgseMw3JjMfga9mh9B/1pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740772061; c=relaxed/simple;
	bh=cKeb4Q3zjzoX1lV2p6fkcHZ42nUiiWSUSr5T6FY95yI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XfWrAlR3VdBuZUr3k0FJLLsYMbRx03Y6X8zOjyCTlFEgb0ouMF/jgnqM7NNOhTo4GjFQ/dNTfWzw84AFJqlQTTs3wENXEdYz5ux1PfVKSICnX1xxL6VKoj4AWGfthBUiEFXBknps/yuv6BvSW+/UFmCYbTrax9vhjcwiD0n7Ens=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=OokqQUC2; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="OokqQUC2"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5DCF920536;
	Fri, 28 Feb 2025 20:47:38 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJqjuzxH-eBm; Fri, 28 Feb 2025 20:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740772057; bh=cKeb4Q3zjzoX1lV2p6fkcHZ42nUiiWSUSr5T6FY95yI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OokqQUC20julIOWcrpxXlgPDqS0bHMhfRq5Dd56LKexoDQokyi/IFjFIRXCtKUZYk
	 EmFdH4ldtAJU5hl2pmvJWWv2bfiCRS/0bTyjaiKPDZVRWI4xfwbdOUID9bXWZQHA00
	 fW3g1RhDYcpT89hnWHIwSXcftbChxnXzpnuN7B0EyeN6L4cucLwkV7Zfb7GdEL7YSL
	 ibBpwl1EtKl4ppjGuZuzMPuNmfhhKvCeRoBbYFD7z6/I3gQ8UNlyHoGGUtn4bwXVA0
	 Zn/l60wk5KzQB//e5OFaeXTzAJ4HUKcW7RodYxFnRWfwfrOpaGmTRLE0fokPrtc6I4
	 eQxtCm6/NFcxg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 01 Mar 2025 01:16:50 +0530
Subject: [PATCH v4 2/7] dt-bindings: arm: samsung: add compatibles for
 exynos7870 devices
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-exynos7870-v4-2-2925537f9b2a@disroot.org>
References: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
In-Reply-To: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740772038; l=1423;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=cKeb4Q3zjzoX1lV2p6fkcHZ42nUiiWSUSr5T6FY95yI=;
 b=OHf4N3gu8lWVV+zgKRW0nPRacN6B+yh9jVQVtZNMQHjI9krN0seU2vZOfV+qvpgk25Rq/fu78
 lwU/mRupXkSBVYoXHxIjItMonNTQPc/xO/V6jJgtuC/hGv6/MqbEnag
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

