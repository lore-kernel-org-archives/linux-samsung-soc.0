Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E7D21FF3B;
	Sun, 28 Sep 2025 16:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759077877; cv=none; b=KOhu8dtVORehdTF8he/C203AcoWWAZ4/jWQM11Ce1sKrVycZmgqfqmyuULyr+4m3G8b+l/zigs9M7Ms6+MLTtQAvauHEFJXNLhMSshV7dnDRJHBtXdn/En1z7/ROEAgJ6CnOCQ5gY4+VwhKh14Y2MkrrSr8QVGGwbZdfiR7fzLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759077877; c=relaxed/simple;
	bh=9kz9dMsV6oTsNdTem4b3h8GxVUiRsET4OUStPQfyat4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tJ0airywxG+n/AYEItVHkt7/BHTQzm2DGU3E8N3SP8w58s291dQIvV/FOWElMqfTmF9kRHYrNMoEvI5i2XKiAbkdw+XV1FK2qisYm69WncUrbN/7sK6wRmqbVK2ozzI9tR7r/bIU7KONhQmwHSQJBlCTR/S09u+C7J3fqvGG/Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=iOpkOiga; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="iOpkOiga"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F297720545;
	Sun, 28 Sep 2025 18:44:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WlNmfzM4vBb3; Sun, 28 Sep 2025 18:44:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759077874; bh=9kz9dMsV6oTsNdTem4b3h8GxVUiRsET4OUStPQfyat4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iOpkOiga+mCUd38B0dutlperEK2+hSwNpno/hexRdxAbt2K3bS5QWugSoMyAdfXze
	 D+f5QeqkxtiEYYzJf69udopJtUaZxnWWlMBuZVOL4hBjU4tujrbS6CsL0z2UaqD/it
	 0Ggan6eQed08NjxzhTNE7XBpCv2gp2OvlFc7TKpr9E0mdh/bffojo4flwmWrB6/VZn
	 k/opnz6fpN7z0cAPBz5eCpOKMa7i8aj+jMJSqbWQBcjiBcmDj/GAgwDDetVlOGvSt5
	 QnQEoZTCLX7HML37ZC+KsvA/ACnLpcD2ZGZxkgf2jJq5TtgAdOjkft1YWhj/sBv5AZ
	 3Cu9bsBnPk4Ug==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 22:13:56 +0530
Subject: [PATCH 5/7] arm64: dts: exynos7870-a2corelte: add bus-width to
 mmc0 node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-dt-fixes-v1-5-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759077839; l=1075;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=9kz9dMsV6oTsNdTem4b3h8GxVUiRsET4OUStPQfyat4=;
 b=TpZn57CPBUNWhNCookdBkAfjZgnpTSTIVzRTVW4sldOljeTMK8X488tDVVrb1STH6GyBmYAae
 /oMhOJrc/RjDI8FoU4ubpWV5lZAni1cfIsyv5qXv1g/z0+L+A+T19sG
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add the bus-width property in &mmc0 node. The Exynos DWMMC driver
assumes bus width to be 8 if not present in devicetree, so at least with
respect to the Linux kernel, this doesn't introduce any functional
changes. But other drivers referring to it may not. Either way, without
the bus-width property the hardware description remains incomplete.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
index f8a7610abeb77cab9f38aaf48d441d99ec61ab5f..1193f0f7dcc171762fefccee23c2c294a41c46c9 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
@@ -447,6 +447,7 @@ &mmc0 {
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
 
+	bus-width = <8>;
 	fifo-depth = <64>;
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;

-- 
2.51.0

