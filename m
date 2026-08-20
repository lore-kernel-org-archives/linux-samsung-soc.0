Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD99476688
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787235834; cv=none; b=cIdhzfGPGlTQj+yN8s01IpdMtYlmD5l6vt4mpLlm8Si6+pbiv6QGzcHTWG2ybej1kxs+YcvA6RcmuyC+q5DYUA1QhLjp1PCdtFu8MiAPCQK3woaCdbYjxk/QVYJ21SO585B37kUk6++w6m90cZoAVVW8xgzaCQCjKln0nCHHX20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787235834; c=relaxed/simple;
	bh=7h8yYep2buRwZt/qo9zjRGEeg3X+kwoG0/5M+kERJxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uPTYBG9qIxIs1sWpTustJgVtK5OhXpIQ49wpsKbyZl53+QOGvMewh5xOZI6oJpfItmtjQRtCCQJdtJcR95lCAHjwgrm3enhEPwSaBmcLIkvvuCEPQIlOUvMZ7E8ea6hDrDvuHKnDsK0PK842KFph+7mzXliUqWsmBsH85A6zI0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=N7hEWeQv; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="N7hEWeQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1787235832; bh=pTvmOLf2cnvYtnWCj0T/kHsrS3V5GxEZ8qTiqEwrp6c=;
 b=N7hEWeQvEPE5TkpIGH1t/s1rEK7Tppujj67Z29cWdbYkYbtwX9FqmKbN4XxMxdxvAbhbwGhBz
 +d1kq+W4CZj4NWPGetgZcObyKGgxQRaEEAh0lc7Gq7gsnAQoT8XSnLwMR9wDvxxwELNwOm6oJ6M
 kj+4JpozMwei9J81HzCBCTM=
X-Forward-Email-ID: 6a870df37f958f0d9fc1b839
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: krzysztof.kozlowski@oss.qualcomm.com
Cc: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Turner <tturner@lineageos.org>
Subject: [PATCH v2 2/2] arm64: dts: exynos850: Add GPU/Mali Bifrost node
Date: Thu, 20 Aug 2026 15:23:30 +0100
Message-ID: <20260820142330.84514-3-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820142330.84514-1-tturner@lineageos.org>
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <20260820142330.84514-1-tturner@lineageos.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This can provide basic GPU functionality for the Exynos850 platform.
Tested on the SM-A217F device. Does not provide support for temperature
throttling, DVFS, power domains, governor support, boosting and voltage
control. Once PMIC is properly implemented, support will hopefully
increase. However the panfrost driver probes, the Mali-G52 GPU
initializes and the core clock is set-up.

Signed-off-by: Thomas Turner <tturner@lineageos.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..8ed85c125030 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -296,6 +296,18 @@ cmu_g3d: clock-controller@11400000 {
 			clock-names = "oscclk", "dout_g3d_switch";
 		};
 
+		gpu: gpu@11500000 {
+			compatible = "samsung,exynos850-mali", "arm,mali-bifrost";
+			reg = <0x11500000 0x5000>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			clocks = <&cmu_g3d CLK_GOUT_G3D_GPU_CLK>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
 		cmu_apm: clock-controller@11800000 {
 			compatible = "samsung,exynos850-cmu-apm";
 			reg = <0x11800000 0x8000>;
-- 
2.47.3

