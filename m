Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A392F002C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 16:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752166270; cv=none; b=OVq5DLPpxXf9a2CgT5Eq5nqWIyt99CrozAq0+KUZe6T/id3Z+gxz3QAoY4WBnuNBcgzjwGJpNeMX/DvpdXqsEW3vjMyNbdXg9oUm+amcolChEKvgozEfDKhT9KTxEpFmSa3TgtUKzi0YUKqdo/NEf3duVKerl0Pb1/i28U0qd3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752166270; c=relaxed/simple;
	bh=qgDOk7ldMzPb3j2kj6nz6o9DIKmpFktmmEBU5U0AflM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HfAyb+ziPC8gu3rQb1+LeiYVCkrEEyKrW0gfMGMPCm31f8UtudvQdVxy3e0cxeW2adx+6DbCN2/wI/hyK0tu2HHbODwdb7ZkYK5vB/9XzPiKx9gJBCA9N7/YgpGTSbO0+xMRuYMQMR6ZDvjLZIaYS5yDmgb25Uzy9ufC/nGWAGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=yr1VZsHW; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="yr1VZsHW"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=yr1VZsHW5SQCQIIlRD1O/QABdYfwUduqWaeNDoXHCtUPn3jNua3EZ2A1G0q+q7T2xGV7sIqZ8Vyr3WacaJb2ypMEyb3TvmP+LQdlYMzpMieWizKCVtABMsGrS7nj4oqagzkhg/TeduHxiXV5wUpz9wwg5F+5cOZqviL0CvGLLX/qgAPYe9vYj2ljpe/CybKEZk1vYzhMRYlzQLCOi/4NdrCPOifnHv9BSEcXSnMQwKhZrbPMw3740/dyscbzQjxR1xgs8E6730UJSxfZ834nSpJgld1HI4j+EaAbOumz+pVwvqQfJd3ATlviYuTaM0vLi9akwFW0/aIJ9/y1sR/CCw==; s=purelymail3; d=purelymail.com; v=1; bh=qgDOk7ldMzPb3j2kj6nz6o9DIKmpFktmmEBU5U0AflM=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1992400030;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 10 Jul 2025 16:50:38 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Thu, 10 Jul 2025 18:50:05 +0200
Subject: [PATCH v2 1/5] arm64: dts: exynos990: Enable watchdog timer
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-resends-july-exynos990-dt-v2-1-55033f73d1b0@mentallysanemainliners.org>
References: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
In-Reply-To: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752166235; l=1586;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=qgDOk7ldMzPb3j2kj6nz6o9DIKmpFktmmEBU5U0AflM=;
 b=9qFXpEjI+WZVRilJjhfPmfCZjpMfpoLtD75VFJKNM0oiOQEvFSCenhkoQQn8JIJ64HAbswOBF
 m6SH9JcQNL+AhCaILDvgxnI86mOLokQ6Dbl6s2QlcYjWehE/3l69qGL
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Enable the two watchdog timer clusters (cl0, cl2) present
on the Exynos990 SoC.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index dd7f99f51a75412f5c3b91c3425a63652546fa5e..4446a1a54ba2de56879353c9c4a898b1d697fc13 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -211,6 +211,30 @@ timer@10040000 {
 				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		watchdog_cl0: watchdog@10050000 {
+			compatible = "samsung,exynos990-wdt";
+			reg = <0x10050000 0x100>;
+			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_peris CLK_GOUT_PERIS_WDT_CLUSTER0_PCLK>,
+				 <&oscclk>;
+			clock-names = "watchdog",
+				      "watchdog_src";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			samsung,cluster-index = <0>;
+		};
+
+		watchdog_cl2: watchdog@10060000 {
+			compatible = "samsung,exynos990-wdt";
+			reg = <0x10060000 0x100>;
+			interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_peris CLK_GOUT_PERIS_WDT_CLUSTER2_PCLK>,
+				 <&oscclk>;
+			clock-names = "watchdog",
+				      "watchdog_src";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			samsung,cluster-index = <2>;
+		};
+
 		gic: interrupt-controller@10101000 {
 			compatible = "arm,gic-400";
 			reg = <0x10101000 0x1000>,

-- 
2.47.2

