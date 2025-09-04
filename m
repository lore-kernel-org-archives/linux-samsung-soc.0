Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863D823B605
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Sep 2025 06:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756966264; cv=none; b=fvjr7VdjMu7GAYi1GKCPP5V5iZliBRWbZCI9V86DdrS7CSQiNfdap8X141hHhAqNMXjj+7AOtM5r95ULOdKc3PxUsRs7Sq6oey3Nz1cbSPeiIkGM85gOe01p+GrHHrkvi1rHQiOo5MG1Kh1PHZKfcRf2fsGGAtUy3DYikTtxoCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756966264; c=relaxed/simple;
	bh=ir2qmCvH74cacCIrvhFK4guQLrEvJc9S7CzK+TAuWVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Job8M6LmitISv31bDjTrUQ1jdyCgI1wNJxhJR1cVdw+NfbOGnmSnAqJ8IkXeo+e+mqNulyzt9uLGqXjm49fnP3FbIq/VwTLtpEsJphZMhAdymdru9ABIJ0LdjJpg3WqTPDeorWadFt63c2ssBRj4Sh+/AEV7feVbKetf7lzhXs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=ODaKcErZ; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="ODaKcErZ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1756966258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R51FL+FEjza6kviNeTzo1OTiMEBuQRcbHF0rg5NWkts=;
	b=ODaKcErZY8U2cqBwsLDIk/cJELBiBMwT++4RDEBZV6XOJIZiXGWCnLE/xtB4SpzvL2xSic
	lb7pPCV5VynncYjMEyxmXj3thooLnQqw/DnqUIsMpTcZBOwT3JejQTgCdsbvbMW6igImri
	f+INeYq0OPqnSyAO4fMSc0YvReX8hc0=
From: Henrik Grimler <henrik@grimler.se>
Date: Thu, 04 Sep 2025 08:10:10 +0200
Subject: [PATCH 1/2] ARM: dts: samsung: exynos5250: describe sromc bank
 memory map
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-smdk5250-sromc-v1-1-b360c6ab01c6@grimler.se>
References: <20250904-smdk5250-sromc-v1-0-b360c6ab01c6@grimler.se>
In-Reply-To: <20250904-smdk5250-sromc-v1-0-b360c6ab01c6@grimler.se>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=henrik@grimler.se;
 h=from:subject:message-id; bh=ir2qmCvH74cacCIrvhFK4guQLrEvJc9S7CzK+TAuWVM=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBouS1oPU0CfmJH0qrTFDm6qZbLUGFDT+iW+wg+g
 ZPamgW8O6iJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaLktaAAKCRCwB25JC3Fh
 a7+MB/97jIwRSIXU7ih35JuLJnurra1zl/xSt/DcDLWhSry6KIiTzRlQtJFWkJ43D8I196D9/uB
 mHO0fwpdQoiwUJsEY2RDTItoWmlbPg1GY/JVEISKc53ec67Iq4EUIY7eXZZBhUAo1J3MZhlTzV1
 JDkne6JcVhJRyqNDlX010Y35ydrHLNpxHpIwKODaRyiFQAe5yFjnQNsRXjzehOVM8rf5Fxrg9ZE
 EqG6mzuyTcRp0xkBKKNXNOrd5OdPF2yVLL0A0wHuF6+rD8ffkl/Jh283Mflcac7ALXmrVmNtRl7
 LwaJgZ9MyZPGDLZwo3thJuYPUErNz/c16ZQxlU+TDm1Uf9pP
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT

According to public user manual for Exynos 5250 [1], the SROM
controller has 4 banks, at same addresses as for example Exynos
5410. Describe the bank memory map of the SoC.

[1] https://web.archive.org/web/20130921194458/http://www.samsung.com/global/business/semiconductor/file/product/Exynos_5_Dual_User_Manaul_Public_REV100-0.pdf

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
 arch/arm/boot/dts/samsung/exynos5250.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250.dtsi b/arch/arm/boot/dts/samsung/exynos5250.dtsi
index b9e7c493881804647534b1d7395f6eb62a07fb92..741cc693f5d8f6b33772d7819c965c590571f305 100644
--- a/arch/arm/boot/dts/samsung/exynos5250.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5250.dtsi
@@ -1214,6 +1214,15 @@ &serial_3 {
 	dma-names = "rx", "tx";
 };
 
+&sromc {
+	#address-cells = <2>;
+	#size-cells = <1>;
+	ranges = <0 0 0x04000000 0x20000
+		  1 0 0x05000000 0x20000
+		  2 0 0x06000000 0x20000
+		  3 0 0x07000000 0x20000>;
+};
+
 &sss {
 	clocks = <&clock CLK_SSS>;
 	clock-names = "secss";

-- 
2.51.0

