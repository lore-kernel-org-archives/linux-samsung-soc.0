Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4A12F0E2A;
	Thu, 26 Jun 2025 20:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968842; cv=none; b=nj+DdjJOXKkHzUFrBfmmYFDRFQGiWwU5NkXFrExzfx+wxX40hhPnzQpCR6RjztqUsBHZjxd+0iTdCwCooleDo5MtJTH9+hejkMIXXuY1MtLGC+89GoqwH3gzl7+dTSoVefQIYMXUCTalhP9/k4BJFuby2DsiZkCTu3C2JHwz9FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968842; c=relaxed/simple;
	bh=gjEFaLNCD4Q/uxrCQrUhVRAihTFl2wmUByUbpt+ZPn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u3XLewyc8qncNmVHrvuJETaBiHrSb2r18kq9hPDU1wMFYSFbSCM2fc6+spgStMNqmTCxB8TlbA+HmKY8s1D8e2tw2OMcydIXUy6JCDUoiii3uIHaxU///P7W0DYL9zznFzmRh85VNi/WrPI9y6jux5iZOXHKVkW62596gi36LtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=F+duhJkG; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="F+duhJkG"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4DF6F25EA4;
	Thu, 26 Jun 2025 22:13:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNnH-FmTAf7Y; Thu, 26 Jun 2025 22:13:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968836; bh=gjEFaLNCD4Q/uxrCQrUhVRAihTFl2wmUByUbpt+ZPn4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=F+duhJkGxECvHlUORxgFZV01C4v5hXH0YXlqFXf28/l7ejzf+ETGCltrQzskNCrSn
	 8jvVkX4RPrROESwDoNKOHJBhWBjm0vubqKvotOReRXYHCTznc2qo1CXUi4PAOUspQQ
	 N06tWIDRRRzQMoPitG2xytLAS3GC6XIU8yUZ96CvzZNQstpalil0s/PSoL7uvlFP4i
	 CtzA/ca3E17f2LBdKtWmiMP4JaDztYLJaLhH2iUbrzXV+hd5EMyIH01Bzl53xfq76/
	 14P/MS+geMDVk17ODHSeW3cgjxcMQI9cGsSPpMdZPHauL/JecMUWK/XxR0fOBnCOd0
	 fNH6EUebynH/A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:43:24 +0530
Subject: [PATCH v2 1/6] dt-bindings: samsung: exynos-sysreg: add exynos7870
 sysregs
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-drm-dts-v2-1-d4a59207390d@disroot.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
In-Reply-To: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968815; l=1152;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=gjEFaLNCD4Q/uxrCQrUhVRAihTFl2wmUByUbpt+ZPn4=;
 b=IByNO/8Qpqp/KSOFZB9ZAbFhx/C/12GSTLV5bpcMNyxRRfVDvL0fsev7+KY123njNzwxxyvNP
 Gao+iT5Sr7rAtqJkU3gViWphuhgKUVu4OsfI58Ci39UF2FuZZpjccQl
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs are
added, used for the SoC MIPI PHY's CSIS and DSIM blocks.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d27ed6c9d61ea9db77229eca60b6b9a0abc5d305..546b450dc3e10a642b289f4b152bcd299ae65b22 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -26,6 +26,8 @@ properties:
               - samsung,exynos3-sysreg
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
+              - samsung,exynos7870-cam0-sysreg
+              - samsung,exynos7870-disp-sysreg
               - samsung,exynos8895-fsys0-sysreg
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg

-- 
2.49.0

