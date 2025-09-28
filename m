Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193C2241114;
	Sun, 28 Sep 2025 16:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759077890; cv=none; b=W0ezBf6BZspv3c0vPmZ15RZ169S3EY8AjwaugdiLhoKpA4Aen3qXGKSHoATYD1ZxJu4gLG8hvz+BiqMcNxUa/yKQQjWr69hYw80BuZTybx6jzolA3qaYB6fXqAZzYnKu85oZWkD2K7/X2L4/7UNTK6CMIRe5IGU/zOhlYQpFl3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759077890; c=relaxed/simple;
	bh=10YDFCmqhSIaFGh36KjtmIevVf+bR4XnXIxhpQUM1O0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TcfVb+beJHSkgXdRc5SHxaaBDOpyUgo4LI1pjP6UNttSuKC9M1AhXxJSZ7g36QerwEcCDjAVLNM6xsdOJZUshPy8fcg6ZRTaVhRlv0ZwXQBcTMM87xZLNEg56fjL2eXJuYs3i5tjXZ5jr0ljYSf1t/55z/X7cosFUrha0DLJuQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=fnSQTksZ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="fnSQTksZ"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BD41925E97;
	Sun, 28 Sep 2025 18:44:47 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFitsIsOZg1D; Sun, 28 Sep 2025 18:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759077887; bh=10YDFCmqhSIaFGh36KjtmIevVf+bR4XnXIxhpQUM1O0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fnSQTksZen4L2feUOOQehH6Vr/eKqGVTLv3GSh8M8kk9jkiYIUFtx9t2i6+6VCBOJ
	 mPF1KKGBhvykd5XagwcxKnlJtR6PTkR6hHnZgo5wcSe5/4TzhuEJa0Usu5YpgrMNc3
	 UAmHbxyK4MnK72TefzOpOqZgNIL3ag8a9C2lrb6jHF+1UVwDIOAWdkSkYSOph2kkso
	 Fd5h75+joCz2GCK+jhDtw93LcIrWvcjOf36can2f45iI8u3JujHnUU5N1Bw0dyjrWO
	 EPL8cIayJJjaIGWQiZ2UosDHZqCRh8YaBCYxX0Yuu0ucfuP8daUIKHPTSHgXN93CQ3
	 Cu4qvONpxKE+Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 22:13:58 +0530
Subject: [PATCH 7/7] arm64: dts: exynos7870-on7xelte: add bus-width to mmc0
 node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-dt-fixes-v1-7-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759077839; l=1070;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=10YDFCmqhSIaFGh36KjtmIevVf+bR4XnXIxhpQUM1O0=;
 b=dYfyEMZutPlSnaBwITCzjzkqCBfcxWuIh8aG6HaCf3O6etZGvhshaT11+qmo01N2DbO9/yV8J
 aVpO5QJ4hYvCFTbLuwVPQKYjAfVQRtEtxOGAYDRZvYzp30kyRTKsqCh
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add the bus-width property in &mmc0 node. The Exynos DWMMC driver
assumes bus width to be 8 if not present in devicetree, so at least with
respect to the Linux kernel, this doesn't introduce any functional
changes. But other drivers referring to it may not. Either way, without
the bus-width property the hardware description remains incomplete.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
index 66413a9506276cca8925e644c0e857fb5c48112d..87549e9560643cd0692ce4a9b2c5cdff80b21173 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
@@ -463,6 +463,7 @@ &mmc0 {
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
 
+	bus-width = <8>;
 	fifo-depth = <64>;
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;

-- 
2.51.0

