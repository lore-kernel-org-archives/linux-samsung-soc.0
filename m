Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792687600;
	b=cKSwD31HUZXoFWDHV3skUECIuypm67P/CDTt6IbqUhouyu3hCl3sznHfD2wA8Hy8lo50
	 VLlE3Xd08kXznaM+G4UGY6equqi9hU1iMbRwwkvPJ/n9IYey6IhQNfpur+EA93ofzSQgx
	 yKcn9VLqUhDApY3eXVoMym+OemycyC9XqFSNABo/Sc+LUDl1pSIVCQmLIMXzTw2W5coS2
	 y/CzIPnqadNPzlK340RzEcqVa7Ml2CXZyPud8dfZ2uXkg2QqjfkwREU5Ivvs73egqde72
	 e7sLxk+9w+SOeZjUKhhXD9qvWLYS95hlGeyFEIAzVMuHzJroeuVRxPQrj6CxzCRl6Kg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687600;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xOTUwgjwiqoVK48MuNeiJ5tobUcs3ededaPQ2qfxPUE=;
	b=msQZyUKWMli5MtnnPSKlaHmDwJLu2PFzZuk0sstJRlj28NA9aRSf9OUI+Az5QJEMZxVg
	 TuqkohEFZ+323vyt1xC9uuDHxb7IUUpL0Exm5REQ7Qr58xO2qW80klEG0zFFDetfRIeq6
	 AU1p0vXkAHmvijtlCMD/jcJXk6QG5wpf9b1/56QjSxobd9V/zXQ5cua1Ovv4/0jeA0CVQ
	 LuYde5bv0AjybL2PUa8OF5oyX83KrNSVhzvIadXyODXpq0ARGUXgDlyV+IIIre8Af1vYR
	 V+xyUJHrG4P9h3GPagbOOHmHYZe9gIWOUMe8MhZTkcz+GYmzW2jezH2IqIdcyrIR0ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b7XanTeE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2B5606A31B;
	Thu, 22 Oct 2026 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b7XanTeE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792687599;
	b=wZAPmm3nhigupYSPPZpHXdED63UAVhULqOOIQfGY4UvvA6VpaHDmmJqqMaxJzE+QUWsh
	 0BA5aewg15v0tjbAr2iRcgxHNjHoH74YlyZI5gfdsLzOcLmGS8CFJa6dsgpFT4EcjOLAr
	 UAwvy8qSDnSDqmT0ChsxA+NKCNPkIeedx2YLYMCUeq8JvQFrypOiekf6KPH1PODHreGAu
	 /f/Ht7AiLS0fD9VCBusg4yXB8LJqN/jxeEs7Oj7lZbTATf5zwNFlQrcZ1l2zNJEMd+EVl
	 Oj9C/zkrXPzLRn1PLxrMeU0FdjanCmIAZG9/0aD7/QLXhwE1ocIL0KDbuqEUN3pQbdw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792687599;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xOTUwgjwiqoVK48MuNeiJ5tobUcs3ededaPQ2qfxPUE=;
	b=1Jw8Kcxd3LU9QF+QPzq8v8t4I6XUBjQnkZ0XVjbhP3i7vmWhk42Ig3IFbeudnzU5v7Dx
	 ypeIeSkvltVg1glrpObDymfzZ0gcXN02J+JGdA7kcQ35JhqtGRX5KG+9c3f/ZnVFktzTl
	 tvuK3PKyWn0ufZphjLZbU0y8uSr1GQ8IGit18bX1Yt4UNylD0f2IIw7rrTEO4T81sfPZ/
	 YnMXSHtf0BMoAhkxuF6p74M27f/JSTw5Q30Jlc6Lx/hlpDQCO89j2paptuLQHioIdftUM
	 xstx/XgQg8rDjC6PcQ3MMVnNFTDugpuTFawzPD4jvVBy3r/1FeIKuFEpOrBB1K8Ln8g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A91A1F01828;
	Thu, 22 Oct 2026 16:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792687599;
	bh=xOTUwgjwiqoVK48MuNeiJ5tobUcs3ededaPQ2qfxPUE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=b7XanTeEkgtsXzleqBFNxp3n84XIRmr1QuQV7ky0pDNbu60roJ/sGOq5UZqwdNQEk
	 o9PpxaWNN6Vz/SOOf6yNKY0LE+NROfRmHf+r5wYte2iH1e+9/7+N69NshNCWT0ZdwN
	 34GN/+QkcUDAheguag9vT7r9HcZux5qhZCBdpMV9M4U6V3JK2fOX212ed6iVMcbpue
	 5D2JBjd+REibPM+E+JVdO10NQnYwOckJiAuXbkuhhGandHlH5XMWSSbq89wFWBBlLR
	 t1o8UAB8YCPmaa/6mfZMCyNURpPW/u+Iie1sgBYNE4t4EQt0qDfxDPp+rOq+wwIQLL
	 Nl/bi7pciQH+A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 09FEA41E83;
	Thu, 22 Oct 2026 16:46:38 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Thu, 22 Oct 2026 17:46:37 +0100
Subject: [PATCH 2/2] phy: exynos5-usbdrd: Add support for the Exynos5515
 usbdrd phy
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261022-for-next-lucky7-usb-phy-v1-2-2e47f8484bf4@member.fsf.org>
References: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org>
In-Reply-To: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2950;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=Kiiu/e8JIBqj1FtLrHXUkttonZWwk3f0gSxzSjnt6Ys=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq2j3tvjE8eTgCSASSGRDwhLex1H6pqWKT0Iw0O
 pESfG41hkSJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCato97RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+sMHhAAsUopH+oG44TXLb0KyNZ1uxDtgyammvw
 MARBRATeyeRUvvyAxR+ENdfAOfQYAoBKDAuo0s2R0jHI8CEzYvzkQ/w8it1CnQjU/j84Ni9j2k5
 o55ZGjUZggmKNDKtjIRG36rtrkQKcu9zWIN6A+55PfCf1c3FMXf78tKycXPO+pngBm9EgsDD5xd
 lAHyTOqxxV9EEjd30IQiq2Riey5A0R/5q37GgGPFhEyTzeIfIILPozVq7cg465VfEhpIxzb+zo4
 ZtYy5tJPU6FicZn1jGewertAY/IfcXQSbdg08kYcgT73zeBL1KXP+Zshiiu5kM+4SZ3Sp9dgoCd
 1wS06y7CeLuyRsZHHUAnh348rqbp93z0cjKqhe9Ywz47kHjKBQGNr5Wp7Ar5DRNHtBs7WA9BEd6
 KH4nChgwGQLetqtmQowuge88XNMiiNmO8TmaQBJynxK5VurmCcWUjt3EL4JE4Kg7kezAWKHecA6
 izygaxwmaDEIzmRkjFFXY8EKbEtrtP2dzsKi6JPy8Ve0PgZ00daJgeo9Ugx5YQpxGMjOJfh30gG
 Cb/r58KUUZKVa0ujhjTyXzitf0CBPS2omURAxka7Z5Zilhcs5/a15xfc+3/dYTy1oH0vrF0sDwX
 iyiBUvLkOJ51XEsg4TRYNw1NlwjQyoDkVMe4V9ASelqVrhbv7u40=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org
Content-Transfer-Encoding: 7bit

From: Aiden Isik <aidenisik@member.fsf.org>

The Exynos5515 USBDRD PHY is a USB PHY which supports USB Super-Speed
and High-Speed. Add support for High-Speed (UTMI+) operation.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 43 ++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index f10cf7b6e0aa..8718e8f01e46 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -2075,6 +2075,46 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static const struct exynos5_usbdrd_phy_tuning exynos5515_tunes_utmi_postinit[] = {
+	PHY_TUNING_ENTRY_PHY(EXYNOS850_DRD_HSPPARACON,
+			     (HSPPARACON_TXVREF | HSPPARACON_TXRISE |
+			      HSPPARACON_TXRES |
+			      HSPPARACON_TXPREEMPPULSE |
+			      HSPPARACON_TXPREEMPAMP |
+			      HSPPARACON_TXHSXV | HSPPARACON_TXFSLS |
+			      HSPPARACON_SQRX | HSPPARACON_OTG |
+			      HSPPARACON_COMPDIS),
+			     (FIELD_PREP_CONST(HSPPARACON_TXVREF, 15) |
+			      FIELD_PREP_CONST(HSPPARACON_TXRISE, 3) |
+			      FIELD_PREP_CONST(HSPPARACON_TXRES, 3) |
+			      FIELD_PREP_CONST(HSPPARACON_TXPREEMPPULSE, 0) |
+			      FIELD_PREP_CONST(HSPPARACON_TXPREEMPAMP, 3) |
+			      FIELD_PREP_CONST(HSPPARACON_TXHSXV, 3) |
+			      FIELD_PREP_CONST(HSPPARACON_TXFSLS, 3) |
+			      FIELD_PREP_CONST(HSPPARACON_SQRX, 7) |
+			      FIELD_PREP_CONST(HSPPARACON_OTG, 2) |
+			      FIELD_PREP_CONST(HSPPARACON_COMPDIS, 7))),
+	PHY_TUNING_ENTRY_LAST
+};
+
+static const struct exynos5_usbdrd_phy_tuning *exynos5515_tunes[PTS_MAX] = {
+	[PTS_UTMI_POSTINIT] = exynos5515_tunes_utmi_postinit,
+};
+
+static const struct exynos5_usbdrd_phy_drvdata exynos5515_usbdrd_phy = {
+	.phy_cfg		= phy_cfg_exynos850,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos850),
+	.phy_ops		= &exynos850_usbdrd_phy_ops,
+	.phy_tunes		= exynos5515_tunes,
+	.pmu_offset_usbdrd0_phy	= EXYNOS990_PHY_CTRL_USB20,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
+};
+
 static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
 	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
@@ -2936,6 +2976,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos5433-usbdrd-phy",
 		.data = &exynos5433_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynos5515-usbdrd-phy",
+		.data = &exynos5515_usbdrd_phy
 	}, {
 		.compatible = "samsung,exynos7-usbdrd-phy",
 		.data = &exynos7_usbdrd_phy

-- 
2.54.0


