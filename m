Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3138B1F6693;
	Tue,  3 Dec 2024 21:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733260565; cv=none; b=O1P49w6LmPpLN0bEi3oljkJFYdKSxJ/X6oDdoGSC+E+BvBDzwF3DlItplntRu3Tvgrwkx7T6cPyFZaK6ut7SXzaVtSWnMSAZhd8gbWsEZ/P8Rzq2UYRFOtRzQqpP+Aq5l+pMdPyY0K4RNcjZGz4o2KJpVcVQIontS5HIf0mXTlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733260565; c=relaxed/simple;
	bh=BOopPzcToEprpdw2LIS55Y82go8hBPaS/MvQht0hXKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UObRP9ofQ8nV/W05AivI/Sacg7hbdKQW8U7AhuW0DHZi+3Eu2shaEpaRzCuqyCfZ9eakiPBa/0oRRoSxcED/z+UC/zZ3sBmzlP5ocamrg+Dnegk8CMdEQziK1LMnAMpEojlcsTkQaDeHuSaEOfa9w25050pmeXMqcuVkuRPbVMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=QfzRP0W2; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="QfzRP0W2"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y2tjk64zzzGp9W;
	Tue, 03 Dec 2024 21:15:54 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y2tjb4hMTz2x99;
	Tue,  3 Dec 2024 21:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733260549;
	bh=BOopPzcToEprpdw2LIS55Y82go8hBPaS/MvQht0hXKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QfzRP0W2T4Rp6Z8+zzdY/1ueAkstrlVjNE+c1I0F4pM+4oSTRiFyZOeNymQ/StDtH
	 wXv+sn60rYhiV4s8QZse92CEVg2zfzfZ1z5cJdkM1w+6smoutjqTm7qx49t3tk928V
	 yL5rQc7F3KKfHytttjG1cNt3Kg1XO5B1JX7f48oJZBFeJB7CMpv2z0frrvmRXbByv7
	 GtX6GS4iDNFiOdVYZvF4yZHoh9YgZaBrzYzkgw6H9PmxdyCN/IS8PiHVIeh7r5JtjG
	 vTt2TrsmmdeGk5jtvpXeUAUj15WFOLvlttaC8mM/xAV0rDD7kwi+Z4pjpxfjG8rpSc
	 o1YcGNxTVwUQw==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: exynos990: Add pmu and syscon-reboot nodes
Date: Tue,  3 Dec 2024 22:13:44 +0100
Message-ID: <20241203211344.515431-3-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203211344.515431-1-igor.belwon@mentallysanemainliners.org>
References: <20241203211344.515431-1-igor.belwon@mentallysanemainliners.org>
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

