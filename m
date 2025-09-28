Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBF721FF3B;
	Sun, 28 Sep 2025 16:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759077882; cv=none; b=shBVNkQ6+8THRh2A0KOAGWnLujxzXQrfQNGe++JzrON40mR3ROnQq588fZa2M4czYUL58E6SFiK+Y2YhAre1I6BGUHZ/raEK1Ksijkic6EY2ggVLwNfPneZR/yWDOMiuqE1m7CYYvLdlZ6Vma7LwMuEYPTKDoIQZOQKv/fzyXPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759077882; c=relaxed/simple;
	bh=ksoTUkd6e56IfHNaydxIqPi7FDPhrc+WNf3R95tILQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rm2Zd/fQyPjPFGN0R1GlUUzOkIHu2DjovTjnDYGqjYigXVgeQUAqpRZk+f5PiG3Wmor/cY/AbZLUq+O3n/oVw7WmxQlNFAW0c6j2Eii7ewnlcBpRsvCcf8ouXVigf+37Osn7+T9zDitktPbTLqxZtsOSXyXBSGjRHY1ymsdjVlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=b+3c+N47; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="b+3c+N47"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EC646209E1;
	Sun, 28 Sep 2025 18:44:39 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-bgODHrDlbP; Sun, 28 Sep 2025 18:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759077878; bh=ksoTUkd6e56IfHNaydxIqPi7FDPhrc+WNf3R95tILQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=b+3c+N47kxW5mkMUiwDOJtWtkH/9CUql9yPk7yLn0xiTud7jUqu2PafGm2AxJMLRq
	 2ljrUowR5meoW/l68rCUMsoUxh6ytpmV8T7c3htDK7iS+gti6gghry5alVuhQIdPmg
	 QvGIni5DXdWZB4V1Rh6WvwwnMWEi5FTT0hPbCWN6BlFIkK2vXgu9NPWxQB0NMuGluI
	 LSRol3AxI91FKG6K1Sgz2ejNdfakavGaIbRBSOddqUN2hnH2TUrOYLNHC2bjotyG/I
	 l19Ey3gWZr7Pmjp9xK11rU9P0MRqxyMu6gPgk+EnwiQ69GuAzJ4Gru74besk4DbF0a
	 55Q+z/7fGIfvQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 22:13:57 +0530
Subject: [PATCH 6/7] arm64: dts: exynos7870-j6lte: add bus-width to mmc0
 node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-dt-fixes-v1-6-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759077839; l=1055;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=ksoTUkd6e56IfHNaydxIqPi7FDPhrc+WNf3R95tILQY=;
 b=siBZbTKsPqnPyE5bdSEYk4L2JwO/0vWzC4Fg0i5oGGrY+qdBzCX5qrnOv04KPbJLHtmZqQVFy
 I7g/Nj3Uep6A3mnP4gv2NlR2pE/+iurU1ng5V8mb0dnCeWQI22lcQbT
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add the bus-width property in &mmc0 node. The Exynos DWMMC driver
assumes bus width to be 8 if not present in devicetree, so at least with
respect to the Linux kernel, this doesn't introduce any functional
changes. But other drivers referring to it may not. Either way, without
the bus-width property the hardware description remains incomplete.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index b2990b5466c949c18a61d1b1c4427986b19804ba..4aa80ea3a1cc94e69d88a5e5a135eb7ac5510fdf 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
@@ -430,6 +430,7 @@ &mmc0 {
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
 
+	bus-width = <8>;
 	fifo-depth = <64>;
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;

-- 
2.51.0

