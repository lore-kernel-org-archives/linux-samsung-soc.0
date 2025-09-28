Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF2025524C;
	Sun, 28 Sep 2025 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759082243; cv=none; b=H67rzmyXs2EqKbXf8J5WnAkNh1BlNjDZXR5Yi8kLyC1ir990pATYBqjOVRilTSu5n/GRPqkhiVNJLsf0SN1Fmq7uuJunLWYg/gsoEMTPjzZ8TinRk7QkJX+EGk4QNaga1MdzLH1E+WTcW7DdL8eRsfshlEgQfObxSal4abs+2TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759082243; c=relaxed/simple;
	bh=jfzyGuj16kMxD/o3zPsHJeSPpMjeWRHQN6zNVt1Jkh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lQVPphMpsj570Eutw6+PyB88x61yCHhYgg3ls6aAw2bXbmJ9FJ4zoM/6vMejbgiXYRNszcapVP4zNklfUOKIhJneRM7NdJks3rS7Z9veZhUXWb/iRG947KkwgPfmGntcns/zaCupBHypHOxIUH6EURYh8TIA3j6nkww3rFnUbmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=VgdiktBS; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="VgdiktBS"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7509225E06;
	Sun, 28 Sep 2025 19:57:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvRMZfMFsOge; Sun, 28 Sep 2025 19:57:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759082238; bh=jfzyGuj16kMxD/o3zPsHJeSPpMjeWRHQN6zNVt1Jkh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VgdiktBSl72VFw/IWBtVXrrPsE8MWYSOm2/16wNQTLgTwNVmDYClEv/9oA8yCbf1f
	 H7ETQqo592bSnwrlxLVvN9wT2OUB3sjgtlxLaIFFO5++p28D32iGU5ov7vdU8Sy60L
	 467vRyg0lZjsXD98Rn7W5MLKsrMHNIBYHmGeXfU7qei41I1DLS9+PJYpdG3jcLi1Tk
	 OS11uwVAarlSQwMyjPx05eztTmLiRY/St5dNT7arPkWJaXGzsNBMBiq6H2hI95y2TH
	 ksMJCgtm1+/1CbyFSJLydh0msANjGOwuXeddLHMrgtxE/8bQ84vUtlt0/IyD7+K2Nh
	 rwhmSJvZx8dGw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 23:26:36 +0530
Subject: [PATCH v3 2/6] dt-bindings: soc: samsung: exynos-pmu: allow
 mipi-phy subnode for Exynos7 PMU
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-drm-dts-v3-2-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
In-Reply-To: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759082219; l=1058;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=jfzyGuj16kMxD/o3zPsHJeSPpMjeWRHQN6zNVt1Jkh0=;
 b=eTef1nL0ejalqzBBewnKa6qqmug2JuyYhRuwquEuDfJCZjhroidGH7MKIb8QsYFz3OUuV9T+Q
 mSG3NbGhQ5iDQzSWXU7ICRW+Zb6hsyBDVu5M8B8kyW9ykG3u0Z/dstx
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add Exynos7's PMU compatible to the list of nodes which allow a MIPI
PHY driver. This helps defining the phy node on SoC DTSIs such as
exynos7870's as it has a compatibility fallback on Exynos7's PMU (and
others in future if support is added).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index f0fb24156da9b8980dcfd5339ae75f12a71cf6d6..9293c5eeaaedf1704a48c19226d35d183d34fcd1 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -172,6 +172,7 @@ allOf:
               - samsung,exynos5250-pmu
               - samsung,exynos5420-pmu
               - samsung,exynos5433-pmu
+              - samsung,exynos7-pmu
     then:
       properties:
         mipi-phy: true

-- 
2.51.0

