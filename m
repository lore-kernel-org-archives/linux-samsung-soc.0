Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B051B4124;
	Wed,  4 Dec 2024 14:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324392; cv=none; b=exuo/sg1kpPGM36dlUERFMuZuDNds50nho1ok5zECYT7unOBHY0uI0lw3lJSK+tg/q4l6cLoBwrhCTlb1aA4q12CYV2btjwQD9oSKUTikIlKCeA0GdJ+UGHkvDkIlT3Ft8y2YchPkOGHejIOFDPoxZT4FrkqEQ3SB92LlFUro3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324392; c=relaxed/simple;
	bh=BOopPzcToEprpdw2LIS55Y82go8hBPaS/MvQht0hXKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNMN+VwE4MUpY5TFKEbrmeWerVJxPIk173+MURfiXhBqbfdqjkOQ5dQf0GgTuK3qIcbBVM/HYbrKP1DwXFWHG9dLjg72ZoJ0rw/sBPqBw/zfiD/mD+d5o9CF6VqGweors6CoHIcNoB5gJjM4R1cwgx9gc6yBg8BADB/2gKmGyAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=CXJSZNLB; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="CXJSZNLB"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y3LKG0FvQz4wVY;
	Wed, 04 Dec 2024 14:59:46 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y3LK710qhz8sWX;
	Wed,  4 Dec 2024 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733324380;
	bh=BOopPzcToEprpdw2LIS55Y82go8hBPaS/MvQht0hXKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CXJSZNLBlXP7xJOKeyw91iiFtUVza9hZIAr2xPPcF3+PDekLkrwDiNJa+LY1c54vl
	 D/noGHbrxvO2Oels2LpVvzzqJw0/xZAfWvMz9cxODtccoCeoEbiXlxgN7RUUClfui4
	 GLeXHMCp5BWVF8wfq1VrswtdR7pjzPoEAmuwkzqBrGkTAQMU93fj3bJgfWGtHlk7R7
	 lSuaIcVQJ8Q6hn65uOxoSXtr1AoRL+3NvVOYMp84JbogPuoC0F9ebPok8FOblq3j8P
	 Oy9RlbJ8uQfSTJxk3ILitflezCUYLKi6LW78yLJFNZzSwN9QIx2wTBs8kQiSU4Fp/f
	 ikjpsNqC3IkQg==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: exynos990: Add pmu and syscon-reboot nodes
Date: Wed,  4 Dec 2024 15:55:59 +0100
Message-ID: <20241204145559.524932-3-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
References: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PMU syscon, and syscon-reboot nodes to the Exynos990 dtsi.

Reboot of the Exynos990 SoC is handled by setting bit(SWRESET_TRIGGER[1])
of SWRESET register (PMU + 0x3a00).

Tested using the "reboot" command.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index c1986f00e443..2619f821bc7c 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -227,6 +227,20 @@ wakeup-interrupt-controller {
 			};
 		};
 
+		pmu_system_controller: system-controller@15860000 {
+			compatible = "samsung,exynos990-pmu",
+				     "samsung,exynos7-pmu", "syscon";
+			reg = <0x15860000 0x10000>;
+
+			reboot: syscon-reboot {
+				compatible = "syscon-reboot";
+				regmap = <&pmu_system_controller>;
+				offset = <0x3a00>; /* SWRESET */
+				mask = <0x2>; /* SWRESET_TRIGGER */
+				value = <0x2>;
+			};
+		};
+
 		pinctrl_cmgp: pinctrl@15c30000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x15c30000 0x1000>;
-- 
2.45.2

