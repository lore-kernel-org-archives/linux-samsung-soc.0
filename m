Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793392454;
	b=LEqQE6iH9dX0cHVpV5377TCUZrwWbgdQyqf30F52JMrTsES395ygeZV3bd0gZDO8aT26
	 BN3AFyrKlsZQNY3OuX8dW9WQHuYoR5D/tYwoNpnahLXGQZci9ySBJPOfyyZ5tpe6KDHrI
	 Fz7QzLxmymquHg7vniGR6g1dSI27/aThBMccten4mtg7zCae2MAr3WJMLzPWxm4jevFEk
	 CkE5Za4OvhVo6yIoDy1GpIl5teVEVOXXCqJyYGnAhD8+NVymn0jkHJhb8uOXi5HGDCqdj
	 zIg1MfK8yBRFKoxEveTVkQS3fqodQ2Zl4q7P3axr01apEnpaFgBVrg2hanuTgMd3ahA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392454;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Q5W519Vms+cuLU3D3kQ7KbxaNAU0DCKwcBmgsNRSPF4=;
	b=XrfH7m6RqF4U1g46mAFQkSI2ImTiftwZqGhwbRrJrZkWMFGDWC4DccfTvWmGDlwGS6Cw
	 b2ocuU1pwxR3GbJOOTG4QYIO71rlygXMYQlKPG88Zf6XZez7GtssQkLfOLTEWfIJzCgyS
	 LV3AjQRQYoYbLWAU0/kQ5YxXhYEvVjuQX4KNDzPOxfeBAsvOlPsqqLdoT4sdp6lIf19tf
	 1fXDSaTvSyl4igxca3wjd33LHtIdvzxkVv5i6SOnFIH66EDIU5QVqbb12UbZ79jeKDt5m
	 QU3CjRCcjYkP/aRD567HYITdfGEMQ6MT7fw1p8I152dA0pk7Z08NNrNMn6+F/ZBQmJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xmz1SEUL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F88960A260C;
	Fri, 30 Oct 2026 20:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xmz1SEUL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793392454;
	b=0EfzcWNPA9I7mn4NKuY0XAtq0MI2OzxyCzHjHciKGGKiGdWvAFQ+y4394UB977Am0jxp
	 rjpmEVXcmbLmyoD1qwfgP4YN2KiKYE+jxbbaRvi5iV+EP5vhXtwYLRStgURgLgECkXrlc
	 ZTvkAlwe9iVcQkWYk9dZ8hHmSJxjd9aED3EPYVAEeGefx6ef/vw8bHDiKSfwPzgVlF3MB
	 qtExJwyn9ZcRNmSLMNxfhCX8AUCEKfl7BbYaQamRIZldK0QyF2GkDeBulaZxky/vwv/q2
	 RxS+y5FSIffHE9sahq6m0DGNERjVq7Z6Mt4mOhQ7hAT5BPrJw4vzGorjFXY4R/MIDWA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793392454;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Q5W519Vms+cuLU3D3kQ7KbxaNAU0DCKwcBmgsNRSPF4=;
	b=WToorKZWRINJgQ3VvL6zo/LNr6HSuYdLqIGVtcfgtJIiJkRqjprWkdhfEHAkeKL63vzX
	 2tFa84l+VeDk1+OtF3GdvjdyPbq3pjwIEo61ZcxFubG4B3kf664HA/jUBNPFNj2QPZiWN
	 WcUmW3Dgx++3JXKAkrSDC7PRwG2RhfnGjOOd/DGzWjs5644MLwFEqLseEEWb7G+j+yCdf
	 eabCPlvCjYT5In33mSsxBNV7klTtQ7txN2xEEi7GP4bzblTIazXF08b6lHZJkrsKDi2KN
	 9HLsgtYqiQPVs5sSnZen4WdtoZTSV36IneyHY4yeU0X4e3ueHsggvoy6Cjo0pVQ1/mA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 667BF1F0093A;
	Fri, 30 Oct 2026 20:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793392453;
	bh=Q5W519Vms+cuLU3D3kQ7KbxaNAU0DCKwcBmgsNRSPF4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Xmz1SEUL0GLzkOxXEvsmE8F2Z+iWO5ah1qdPUMkWAmVN3Cwb9ALT1AhQygTNuBiy6
	 4zyyby8NOA2yd1UW45vVtO7wf2j7WniutC9WoqJgGENrBmF01kW6Hsle/FqFJ0oy5T
	 iq1VQxR0kVXJ5dQE+UsZ4/DEdWYVbdzfXoD2hafn6ngvZcLMp6WV9FQxiYy3czWOYn
	 TqK8qFJNySSKTD++JvsrIbdms5KdaQRuy+CVamsXglZBl7NSWeQJiZ0we2o7dV9grx
	 a5731JqNQI/FDBR9qUkbE1SWGstYtaYHYBkzbxbiOqbmHKqz8RvRC8u4pT0zHpGiNk
	 vHx2Cp2+eIf2A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D429E4428F;
	Fri, 30 Oct 2026 20:34:11 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Fri, 30 Oct 2026 20:34:00 +0000
Subject: [PATCH v3 5/5] arm64: dts: exynos: Add initial support for Samsung
 Galaxy Watch FE
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
Message-Id: <20261030-for-next-lucky7-v3-5-81e02272ce69@member.fsf.org>
References: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org>
In-Reply-To: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5339;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=RZpVw2mu/ob2NzUXW6J8a3tGsl4GrNevFe9W5otRNb4=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq5P9ChsscrqApkPczjms2pUkwA83dp7hHAfLbk
 D65HjHjKySJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCauT/QhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+shKBAAjrPzwYxy5y53+frhlEo1PDBYKpl0a4E
 oq13m9Qs/1h/YMtU9m+cnE6r0+DFYy2L8ejQJYFSBFnUgBAb7AmO/7GiOyAozHyL+M7na8yamCS
 v8QMQdtWeen+OTQ97ikl8Yhzo1TarWlL3v43yov2aOEudJQNUHmKb+IJxw4Tibzr9ay/+3FlLtF
 NYB49BCl07mc3rQFMaFkA6AjHqUltglHXbGNmeg8lGie8RbFKjSZzUOQSFVspuWnRsh3rqW/DxP
 NgQ4IhEm7kqtJs/QZMBHN+8czOmrMiiRnVt1bVClQw2KUsTT6qDsrJToWBZ1v9z6gts6DgzPYIn
 Q/409joSjD0g+IZfZUIJDHqJEwJYF0ZBEDXW/vmonEXJJJfh1xzBmQIaorNAlNTv58Mz18kxI0D
 2E6j7ivf7/kPxKp5zkbFklfHodNgZZ1uzy65grhtDgzIpO2l7i1jQgH/Tw1dTUmTn1KT2smtiWF
 ygHvrs3WU3dkHIbGVq/dI3zOy2yWUGa5/EhfGqW9Gd5efXTFBSe3FOnGhtE4tvWg2DYaetALgNN
 QhVDYILuDeRPxw9G8zEnDuOi7ekDsagzeEemXWg7HMPCJYftXb9hRgqySgvyRQrC62thfuPfYWR
 RP8RGQaPPPIIpOzkQFWmy6v6WDfrGFECvP1nCDuS/PN7VEWScd7g=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org
Content-Transfer-Encoding: 7bit

From: Aiden Isik <aidenisik@member.fsf.org>

The Samsung Galaxy Watch FE (SM-R861/SM-R866), codenamed lucky7, is a
smartwatch developed by Samsung and released in 2024. It has 1.5GiB RAM,
16GiB of eMMC storage, an Exynos5515 (W920) SoC, and a 396x396 display.

Support for the following is added by this device tree:
- Bootloader framebuffer
- Memory

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 arch/arm64/boot/dts/exynos/Makefile              |   1 +
 arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts | 215 +++++++++++++++++++++++
 2 files changed, 216 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 7534b773d28f..3ff3c643fc5c 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos2200-g0s.dtb		\
 	exynos5433-tm2.dtb		\
 	exynos5433-tm2e.dtb		\
+	exynos5515-lucky7.dtb		\
 	exynos7-espresso.dtb		\
 	exynos7870-a2corelte.dtb	\
 	exynos7870-j5y17lte.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts b/arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts
new file mode 100644
index 000000000000..0193a5d99f5c
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Samsung Galaxy Watch FE (lucky7/SM-R861/SM-R866) device tree source
+ *
+ * Copyright (c) 2026 Aiden Isik <aidenisik+git@member.fsf.org>
+ */
+
+/dts-v1/;
+#include "exynos5515.dtsi"
+
+/ {
+	compatible = "samsung,lucky7", "samsung,exynos5515";
+	chassis-type = "watch";
+	model = "Samsung Galaxy Watch FE (SM-R861/SM-R866)";
+
+	chosen {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		framebuffer@9e0cf000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x9e0cf000 (396 * 396 * 4)>;
+			format = "a8r8g8b8";
+			height = <396>;
+			stride = <(396 * 4)>;
+			width = <396>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x3ea00000>,
+		      <0x0 0xc0000000 0x20000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		/*
+		 * Some of these misc-rmem regions belong to memory-mapped
+		 * devices, and will be assigned to drivers as support
+		 * is added.
+		 *
+		 * Other regions belong to the TrustZone firmware and should
+		 * never be touched.
+		 */
+		misc-rmem@87000000 {
+			reg = <0x0 0x87000000 0x200000>;
+			no-map;
+		};
+
+		misc-rmem@87fff000 {
+			reg = <0x0 0x87fff000 0x1000>;
+			no-map;
+		};
+
+		misc-rmem@8a000000 {
+			reg = <0x0 0x8a000000 0x31000>;
+			no-map;
+		};
+
+		misc-rmem@8d800000 {
+			reg = <0x0 0x8d800000 0x180000>;
+			no-map;
+		};
+
+		misc-rmem@8ffff000 {
+			reg = <0x0 0x8ffff000 0x33000>;
+			no-map;
+		};
+
+		misc-rmem@90100000 {
+			reg = <0x0 0x90100000 0x200000>;
+			no-map;
+		};
+
+		misc-rmem@98a00000 {
+			reg = <0x0 0x98a00000 0x600000>;
+			no-map;
+		};
+
+		misc-rmem@9a000000 {
+			reg = <0x0 0x9a000000 0xc00000>;
+			no-map;
+		};
+
+		misc-rmem@9b000000 {
+			reg = <0x0 0x9b000000 0x400000>;
+			no-map;
+		};
+
+		misc-rmem@9bd00000 {
+			reg = <0x0 0x9bd00000 0x208000>;
+			no-map;
+		};
+
+		misc-rmem@9c000000 {
+			reg = <0x0 0x9c000000 0x20000>;
+			no-map;
+		};
+
+		framebuffer@9e0cf000 {
+			/*
+			 * Reserve up to the end of the final page of the
+			 * framebuffer region, to prevent memory aliasing.
+			 *
+			 * size: align((396 * 396 * 4), 0x1000)
+			 */
+			reg = <0x0 0x9e0cf000 0x9a000>;
+			no-map;
+		};
+
+		misc-rmem@a0000000 {
+			reg = <0x0 0xa0000000 0x10000>;
+			no-map;
+		};
+
+		misc-rmem@a0010000 {
+			reg = <0x0 0xa0010000 0x400000>;
+			no-map;
+		};
+
+		misc-rmem@a0510000 {
+			reg = <0x0 0xa0510000 0x1000>;
+			no-map;
+		};
+
+		misc-rmem@a0900000 {
+			reg = <0x0 0xa0900000 0x2000>;
+			no-map;
+		};
+
+		misc-rmem@a0902000 {
+			reg = <0x0 0xa0902000 0x1000>;
+			no-map;
+		};
+
+		misc-rmem@a0910000 {
+			reg = <0x0 0xa0910000 0x3c000>;
+			no-map;
+		};
+
+		misc-rmem@b0000000 {
+			reg = <0x0 0xb0000000 0x200000>;
+			no-map;
+		};
+
+		misc-rmem@b1000000 {
+			reg = <0x0 0xb1000000 0x200000>;
+			no-map;
+		};
+
+		misc-rmem@bbfff000 {
+			reg = <0x0 0xbbfff000 0x1000000>;
+			no-map;
+		};
+
+		misc-rmem@bcfff000 {
+			reg = <0x0 0xbcfff000 0x1000>;
+			no-map;
+		};
+
+		misc-rmem@bd430000 {
+			reg = <0x0 0xbd430000 0x1250000>;
+			no-map;
+		};
+
+		misc-rmem@d0000000 {
+			reg = <0x0 0xd0000000 0x5d00000>;
+			no-map;
+		};
+
+		misc-rmem@dc444000 {
+			reg = <0x0 0xdc444000 0x2bbc000>;
+			no-map;
+		};
+
+		misc-rmem@df005000 {
+			reg = <0x0 0xdf005000 0x1000>;
+			no-map;
+		};
+
+		misc-rmem@df008000 {
+			reg = <0x0 0xdf008000 0x1000>;
+			no-map;
+		};
+
+		misc-rmem@df009000 {
+			reg = <0x0 0xdf009000 0x12000>;
+			no-map;
+		};
+
+		misc-rmem@df01b000 {
+			reg = <0x0 0xdf01b000 0x21000>;
+			no-map;
+		};
+
+		misc-rmem@df03c000 {
+			reg = <0x0 0xdf03c000 0x1000>;
+			no-map;
+		};
+
+		misc-rmem@df03d000 {
+			reg = <0x0 0xdf03d000 0xfc3000>;
+			no-map;
+		};
+	};
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};

-- 
2.54.0


