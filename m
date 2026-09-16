Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1524E3876B2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 17:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578410; cv=none; b=OKPm12SJZcCh5BpZE9xyuE5ithg9lREAI/21ZQZp4utQsQdK+zW95ugPJhQ2aY/qHq2SpdHTyCsf33ULMbca8XhT4zEFi0SkuB1gfEzQ0rizrd3ZIT4KHrCQDnVQP4EVwws/pokTTnQiTOs/4sFJK7yzgTfRml4Y5S2BnLq3tto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578410; c=relaxed/simple;
	bh=mw4ThFBHAruwjTQMv56B3cN/I5YzGUL0nGrXgp7+0mI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RHNEaiX7D/0RELtfIcSZW5onxoIxwtMFdsMYikBxnDny1DTsC4wantWxvTMLoH4v2modo0yLSUJIkijPK3D2W+Z1QjowhD0poVhd5KyhV43Kgj4DlPYdG0eMAvd8lsQl1CPTLAoL14ioMu0ARQBHLd4aE+pdP4lylgUTOg7P9C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mjFon/pe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGiUgHt/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mjFon/pe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGiUgHt/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeKbb2470525
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 17:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DGb+4odsElwUxQLTfKxwlEucSgJZo0pYnDWJGjqyX80=; b=mjFon/pe8uq+AjDe
	vnG7WhRnjj284Tdh5btCoM28S1oTwqoqDAQLM3rJTUHqF091ftFEEFqeXqczREhG
	T5e7mtfIfZlaufmoIXvSZXn8LcpjgdlionLk2NTnQu5HD0XXQ64WrSiQOkiWJ+hf
	gz6Gn4O0ukCMJUkIbBzZCugC/lfd0bOoWQIzlvJTc8WFtSaA+sZNxl+/Yovim5vy
	XeD2NVGrp49g3LUEi8qIXjR3XyiIpVE8r/eHYqVjsyhUdhhGFYaWSb+Dp5qvf6UQ
	rTEn0b/sK6XCpwC5cOEoiGLUF2kmbymAikC0pPzh4fOvVIL/boxEjOLPmkVTY399
	A/gCZA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn51dcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 17:06:29 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7d2076f8aso2005375e0c.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 10:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789578389; x=1790183189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGb+4odsElwUxQLTfKxwlEucSgJZo0pYnDWJGjqyX80=;
        b=CGiUgHt/E8xZXSmBo6sO/YiGWg04Q4elTF7iddDaDHw7GTfdUeQWsieAnJVvgjlRuB
         cYWijyIFCuSLKoRXsLNqxA/gT4KDfPLDBllNZcfRo8O9qukNvdhVMt4uydIGs3G/oEjp
         vMriQ+/RQnZvTC++Idua+MLt8gKO/boXie40DvHbfheXbrcuR6bU4II2TcYE2DVUVXJw
         CYSeCY0hkpjC4P1mdtXRuqoxpWSGVj6jjdqAXle0JSM6WWJaZWEK7OIi9mdXStrUtCSM
         1M6Ezbm0wvEhiENvlR861SRYecCtKG8WjJFFJ9MGTfKLoIwuq+p340WpMIjodBE6airA
         NKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789578389; x=1790183189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGb+4odsElwUxQLTfKxwlEucSgJZo0pYnDWJGjqyX80=;
        b=1iJ09+xLynLNVdyLcDzh14qrVDdlZjC9BvWbuj+nfrwc4uKmA25wXjt9nV9q4vJwfP
         iGgEt2RxWVSyc3oXvkwSaoF1LSKo16Mw9r6ZRnMMUI+84E/vmhynWvCwj75V3JiBgDor
         GIQSYp1X/magJi6rs/RQiUfLXcPKs0BJ8z19fg1mFoUx20Jp/y40Q21eocu456GhwUTx
         hh0zWMZUrYc93ggC4Q1QVEBhoi4/kBgcBo8Pugb/rx+mNLwHxJmAMJQrcMIW8dKC20xr
         J9zCipIMt9/paTJYqff2gyDV7NV5CwaM8inn/ygi4TrmpKOktFIjlUyOoyuGqmtMtCU/
         2MXw==
X-Forwarded-Encrypted: i=1; AKwUvBx5CQfqv1d6F6YeCTqNyqGfMfbFRz6wzRl3N4TPxIWGPg0oO0L4CTX6BdcfDt15O4jOU6cvutfsYOSagXEEccwPJw==@vger.kernel.org
X-Gm-Message-State: AFuF++l3CtL+YwAqx8iCwfhv4ySfiKHMRicgPDWW5WSgQpjDUllCZs8d
	xLmOGkg92KhlQnXgFyHa1bPMQ7NowvjBADcwFsAwH43mvT0ZrT+STfKz8IDdBwYlf/Ne34oCx1C
	3ogrT3yPZQAXRYEcIemjQqTW7dcUfCp74yDzjLvszgMLu1kGXFkjRycOjHvk2U+7oKg6UipkEpw
	==
X-Gm-Gg: AYBFou27vVuoR02pTdRhBg8bf5AJkFKUvIXEVjGAY0Zv7v3wCE9U02I58dzJFpB2x0b
	O1dCMUpha3I7kiuG5ga4EBXaQiaksVElk7LrULBxAJbuXbXs4LXdemP2+JNFsY95EuCMkIZ6cE5
	Tvzj2gHMC6ql/UJhSDfI/a/qCLx44dP09l5T5oTawuQ/Y2FiBVVh/6zx+fP6GgH6W4/qi5iv2Xb
	etCQdkxacewMCzzJqPWQ6aZH6kSYqSsR9YWcb403SPIIEb3r1j1DQ+XXNE2BolIsNvmMktMqYHC
	L5iQdiTWRTi1mWLFSGVML9INLYqy9TXRwM96eZEni5y7Gjy6He9z9OO3/2jScMs2lSdlTDQ+7yV
	RhTmVyNcyTW4/ikrJvDe9MCw=
X-Received: by 2002:a05:6122:c1c2:b0:5c9:a5b6:27ae with SMTP id 71dfb90a1353d-5c9a5b6297cmr79704e0c.11.1789578388865;
        Wed, 16 Sep 2026 10:06:28 -0700 (PDT)
X-Received: by 2002:a05:6122:c1c2:b0:5c9:a5b6:27ae with SMTP id 71dfb90a1353d-5c9a5b6297cmr79643e0c.11.1789578388189;
        Wed, 16 Sep 2026 10:06:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf344bfsm7951293f8f.27.2026.09.16.10.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:06:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 19:06:18 +0200
Subject: [PATCH v2 2/2] arm64: dts: exynos5433: Re-order properties to
 match coding style
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-2-8e9d534ba5b8@oss.qualcomm.com>
References: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
In-Reply-To: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=24085;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mw4ThFBHAruwjTQMv56B3cN/I5YzGUL0nGrXgp7+0mI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqsyMPXSqXqV8H4KKDw2+WPOmZSrHL5YOp+giF
 /rO8O7lKLuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqrMjAAKCRDBN2bmhouD
 1z+rEACGjJ1W2J7TAiUAGA4e6JBRvgAW0Nc7w8plVZjy4MofSRrPZtrIpzu1GR8lT0YhaAYHp2D
 VcgGn7NOG+b82ccKUv9+x/KHWcDsRvaKXbrCjyir86mwuoVzUxlzrZyTvdzuC3JcSTKh+iNo3N9
 +kfTlq5qCzOQKfmzUASZEGLKqLbx9bCzKtV1pokhSnGMPVVqwZ6jgwf/ATOs2NzmNqA26lHknaX
 3M5fyd8LeUy7uhx1kcvHCDIP/hQX4Pb1WcDvRTEnZnaOjuLhzWJ5mVdoJr06NRAidpfeG4PeGk8
 6BdgJ5lKrJ92Yt5choU5yPGsGT8grQLu7p262615azjbTPfElubccBDHfxeVJeJmOR2dZcQhtXY
 vaPLC8RUlHjiwV9ximl0fdE1MrYjS2FMmlk6g0f842/cCoEezcMw581sph9rfQNna45nbJaJIcb
 16veCLoYornyv5JfOvWva+FQ3AdFbGvMlyVnz6WL7f7hYtDFSfogW6laGoOFs/3XZ9sNQhjxfIN
 t7/8ra8xgwvPH5KE3QXHb/BOQ9gcrhb5w3Ulm3RQDo/RSygZ2Sm9seA3YXsb2b65RZVehRrrSxd
 936swHPg2AyyRl7x59Z7cX0vKfRNn9aL/7BJAu35mR9qI2SzRMqrXFdQQj1bj44bKXZ7RsAmBcm
 1FR/nUFT2F27oqg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIzNCBTYWx0ZWRfXwoaKLJEk3W5R
 ESZ6sGC49HByLsvofB8Ic3Zq7qWPLN1xAmfYGt9PWUuH17R7cafIcNGY76ByqGC/BrEVfhbvDyD
 xhtScjmjckqSiIDE+TKr9R1n/a/zJsHSR/NcLRN+ynNjtJjaAA/nQnt+5ziHSZ/HRTTVKQHCA9R
 FTPl5PJWQUIomRbWkW+CRRf+2F2eGGNnIVXoYcr0wvolg5v72cVWFwoYyKI7gQAeN8b+wQKlLCg
 dJ2XP01IWlBoN2y12x/AKqIR7JjEkYgerkD9oZSkwzMo+YWEdBiKyOnkwAl+cl6t+FZjBEV+wMW
 M05U5/ieamLAKBQckTozWGhF9OIXMl+3WhcTA2dkViAevbQH/IUEOhIsytsGAch37n2YDmd+++Q
 oOqf6tAPj9Irfy3F/ND+8nigdoq5Aikj1i8jqEEiVKt7d0/J1QXL3KjJa+rTPsEWwk2J8S4g0RK
 FzVW0580h03c0aJ2G0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIzNCBTYWx0ZWRfX9NzhNjAhIoK/
 FOezTJd2kQ8f/AT4eKbfp/w25qSdTWVWyx88lgz8lPv2eAI3JaOkt7HzhQPl/haYIyerbEW+1wK
 32Vjb/ndMBxKaaLhGSpd+E1HnlbjSac=
X-Proofpoint-ORIG-GUID: XH6OnVmawPFB303vLWSPtij3QPqGZywJ
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aaacc95 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=fvZ5AdJGPHL8t48OCYAA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XH6OnVmawPFB303vLWSPtij3QPqGZywJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160234

Re-order a few properties to match coding style, as pointed out by
dt-check-style, e.g.:

  exynos5433.dtsi:1008: [property-order] property 'interrupt-names' must be placed after 'interrupts'
  exynos5433.dtsi:1013: [property-order] property 'iommus' out of canonical order (should sort before 'samsung,disp-sysreg')

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  65 +++++++------
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 108 ++++++++++-----------
 2 files changed, 88 insertions(+), 85 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index a85afdde9c41..a17a7d063212 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -65,23 +65,23 @@ homepage-key {
 
 		power-key {
 			gpios = <&gpa2 7 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_POWER>;
 			label = "power key";
 			debounce-interval = <10>;
+			linux,code = <KEY_POWER>;
 		};
 
 		volume-up-key {
 			gpios = <&gpa2 0 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_VOLUMEUP>;
 			label = "volume-up key";
 			debounce-interval = <10>;
+			linux,code = <KEY_VOLUMEUP>;
 		};
 
 		volume-down-key {
 			gpios = <&gpa2 1 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_VOLUMEDOWN>;
 			label = "volume-down key";
 			debounce-interval = <10>;
+			linux,code = <KEY_VOLUMEDOWN>;
 		};
 	};
 
@@ -358,11 +358,12 @@ tv_to_hdmi: endpoint {
 &dsi {
 	vddcore-supply = <&ldo6_reg>;
 	vddio-supply = <&ldo7_reg>;
+	pinctrl-0 = <&te_irq>;
+	pinctrl-names = "default";
+
 	samsung,burst-clock-frequency = <512000000>;
 	samsung,esc-clock-frequency = <16000000>;
 	samsung,pll-clock-frequency = <24000000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&te_irq>;
 
 	status = "okay";
 };
@@ -410,11 +411,11 @@ &hsi2c_0 {
 
 	pmic@66 {
 		compatible = "samsung,s2mps13-pmic";
+		reg = <0x66>;
 		interrupt-parent = <&gpa0>;
 		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
-		reg = <0x66>;
-		samsung,s2mps11-wrstbi-ground;
 		wakeup-source;
+		samsung,s2mps11-wrstbi-ground;
 
 		s2mps13_osc: clocks {
 			compatible = "samsung,s2mps13-clk";
@@ -859,8 +860,8 @@ &hsi2c_7 {
 	status = "okay";
 
 	bridge@39 {
-		reg = <0x39>;
 		compatible = "sil,sii8620";
+		reg = <0x39>;
 		cvcc10-supply = <&ldo36_reg>;
 		iovcc18-supply = <&ldo34_reg>;
 		interrupt-parent = <&gpf0>;
@@ -897,9 +898,9 @@ &hsi2c_8 {
 
 	pmic@66 {
 		compatible = "maxim,max77843";
+		reg = <0x66>;
 		interrupt-parent = <&gpa1>;
 		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
-		reg = <0x66>;
 
 		muic: extcon {
 			compatible = "maxim,max77843-muic";
@@ -997,18 +998,19 @@ &mshc_0 {
 	cap-mmc-highspeed;
 	non-removable;
 	card-detect-delay = <200>;
+	fifo-depth = <0x80>;
+	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_qrdy &sd0_bus1 &sd0_bus4
+		     &sd0_bus8 &sd0_rdqs>;
+	pinctrl-names = "default";
+	bus-width = <8>;
+	assigned-clocks = <&cmu_top CLK_SCLK_MMC0_FSYS>;
+	assigned-clock-rates = <800000000>;
+
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;
 	samsung,dw-mshc-ddr-timing = <0 2>;
 	samsung,dw-mshc-hs400-timing = <0 3>;
 	samsung,read-strobe-delay = <90>;
-	fifo-depth = <0x80>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_qrdy &sd0_bus1 &sd0_bus4
-		     &sd0_bus8 &sd0_rdqs>;
-	bus-width = <8>;
-	assigned-clocks = <&cmu_top CLK_SCLK_MMC0_FSYS>;
-	assigned-clock-rates = <800000000>;
 
 	status = "okay";
 };
@@ -1018,20 +1020,21 @@ &mshc_2 {
 	disable-wp;
 	cd-gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
 	card-detect-delay = <200>;
+	fifo-depth = <0x80>;
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4>;
+	pinctrl-names = "default";
+	bus-width = <4>;
+
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;
 	samsung,dw-mshc-ddr-timing = <0 2>;
-	fifo-depth = <0x80>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4>;
-	bus-width = <4>;
 
 	status = "okay";
 };
 
 &pcie {
-	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_bus &pcie_wlanen>;
+	pinctrl-names = "default";
 	vdd10-supply = <&ldo6_reg>;
 	vdd18-supply = <&ldo7_reg>;
 	assigned-clocks = <&cmu_fsys CLK_MOUT_SCLK_PCIE_100_USER>,
@@ -1064,14 +1067,14 @@ &ppmu_d1_general {
 
 	events {
 		ppmu_event0_d1_general: ppmu-event0-d1-general {
-		       event-name = "ppmu-event0-d1-general";
-	       };
+			event-name = "ppmu-event0-d1-general";
+		};
 	};
 };
 
 &pinctrl_alive {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_alive>;
+	pinctrl-names = "default";
 
 	initial_alive: initial-state {
 		PIN_IN(gpa0-0, DOWN, FAST_SR1);
@@ -1154,8 +1157,8 @@ te_irq: te-irq-pins {
 };
 
 &pinctrl_cpif {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_cpif>;
+	pinctrl-names = "default";
 
 	initial_cpif: initial-state {
 		PIN_IN(gpv6-0, DOWN, FAST_SR1);
@@ -1164,8 +1167,8 @@ initial_cpif: initial-state {
 };
 
 &pinctrl_ese {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_ese>;
+	pinctrl-names = "default";
 
 	pcie_wlanen: pcie-wlanen-pins {
 		samsung,pins = "gpj2-0";
@@ -1181,8 +1184,8 @@ initial_ese: initial-state {
 };
 
 &pinctrl_fsys {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_fsys>;
+	pinctrl-names = "default";
 
 	initial_fsys: initial-state {
 		PIN_IN(gpr3-0, NONE, FAST_SR1);
@@ -1194,8 +1197,8 @@ initial_fsys: initial-state {
 };
 
 &pinctrl_imem {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_imem>;
+	pinctrl-names = "default";
 
 	initial_imem: initial-state {
 		PIN_IN(gpf0-0, UP, FAST_SR1);
@@ -1210,8 +1213,8 @@ initial_imem: initial-state {
 };
 
 &pinctrl_nfc {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_nfc>;
+	pinctrl-names = "default";
 
 	initial_nfc: initial-state {
 		PIN_IN(gpj0-2, DOWN, FAST_SR1);
@@ -1219,8 +1222,8 @@ initial_nfc: initial-state {
 };
 
 &pinctrl_peric {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_peric>;
+	pinctrl-names = "default";
 
 	initial_peric: initial-state {
 		PIN_IN(gpv7-0, DOWN, FAST_SR1);
@@ -1274,8 +1277,8 @@ initial_peric: initial-state {
 };
 
 &pinctrl_touch {
-	pinctrl-names = "default";
 	pinctrl-0 = <&initial_touch>;
+	pinctrl-names = "default";
 
 	initial_touch: initial-state {
 		PIN_IN(gpj1-2, DOWN, FAST_SR1);
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index d318c87effaa..a6352c015e16 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -93,8 +93,8 @@ core3 {
 		cpu0: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
-			enable-method = "psci";
 			reg = <0x100>;
+			enable-method = "psci";
 			clocks = <&cmu_apollo CLK_SCLK_APOLLO>;
 			clock-names = "apolloclk";
 			operating-points-v2 = <&cluster_a53_opp_table>;
@@ -111,8 +111,8 @@ cpu0: cpu@100 {
 		cpu1: cpu@101 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
-			enable-method = "psci";
 			reg = <0x101>;
+			enable-method = "psci";
 			operating-points-v2 = <&cluster_a53_opp_table>;
 			#cooling-cells = <2>;
 			i-cache-size = <0x8000>;
@@ -127,8 +127,8 @@ cpu1: cpu@101 {
 		cpu2: cpu@102 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
-			enable-method = "psci";
 			reg = <0x102>;
+			enable-method = "psci";
 			operating-points-v2 = <&cluster_a53_opp_table>;
 			#cooling-cells = <2>;
 			i-cache-size = <0x8000>;
@@ -143,8 +143,8 @@ cpu2: cpu@102 {
 		cpu3: cpu@103 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
-			enable-method = "psci";
 			reg = <0x103>;
+			enable-method = "psci";
 			operating-points-v2 = <&cluster_a53_opp_table>;
 			#cooling-cells = <2>;
 			i-cache-size = <0x8000>;
@@ -159,8 +159,8 @@ cpu3: cpu@103 {
 		cpu4: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
-			enable-method = "psci";
 			reg = <0x0>;
+			enable-method = "psci";
 			clocks = <&cmu_atlas CLK_SCLK_ATLAS>;
 			clock-names = "atlasclk";
 			operating-points-v2 = <&cluster_a57_opp_table>;
@@ -177,8 +177,8 @@ cpu4: cpu@0 {
 		cpu5: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
-			enable-method = "psci";
 			reg = <0x1>;
+			enable-method = "psci";
 			operating-points-v2 = <&cluster_a57_opp_table>;
 			#cooling-cells = <2>;
 			i-cache-size = <0xc000>;
@@ -193,8 +193,8 @@ cpu5: cpu@1 {
 		cpu6: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
-			enable-method = "psci";
 			reg = <0x2>;
+			enable-method = "psci";
 			operating-points-v2 = <&cluster_a57_opp_table>;
 			#cooling-cells = <2>;
 			i-cache-size = <0xc000>;
@@ -209,8 +209,8 @@ cpu6: cpu@2 {
 		cpu7: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
-			enable-method = "psci";
 			reg = <0x3>;
+			enable-method = "psci";
 			operating-points-v2 = <&cluster_a57_opp_table>;
 			#cooling-cells = <2>;
 			i-cache-size = <0xc000>;
@@ -385,9 +385,9 @@ psci {
 
 	soc: soc@0 {
 		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x18000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0x0 0x0 0x0 0x18000000>;
 
 		chipid@10000000 {
 			compatible = "samsung,exynos5433-chipid",
@@ -1005,13 +1005,13 @@ decon: decon@13800000 {
 				      "pclk_smmu_decon1x", "sclk_decon_vclk",
 				      "sclk_decon_eclk", "dsd";
 			power-domains = <&pd_disp>;
-			interrupt-names = "fifo", "vsync", "lcd_sys";
 			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
-			samsung,disp-sysreg = <&syscon_disp>;
+			interrupt-names = "fifo", "vsync", "lcd_sys";
 			iommus = <&sysmmu_decon0x>, <&sysmmu_decon1x>;
 			iommu-names = "m0", "m1";
+			samsung,disp-sysreg = <&syscon_disp>;
 
 			status = "disabled";
 
@@ -1049,14 +1049,14 @@ decon_tv: decon@13880000 {
 				      "aclk_smmu_decon1x", "aclk_xiu_decon1x",
 				      "pclk_smmu_decon1x", "sclk_decon_vclk",
 				      "sclk_decon_eclk", "dsd";
-			samsung,disp-sysreg = <&syscon_disp>;
 			power-domains = <&pd_disp>;
-			interrupt-names = "fifo", "vsync", "lcd_sys";
 			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "fifo", "vsync", "lcd_sys";
 			iommus = <&sysmmu_tv0x>, <&sysmmu_tv1x>;
 			iommu-names = "m0", "m1";
+			samsung,disp-sysreg = <&syscon_disp>;
 
 			status = "disabled";
 		};
@@ -1151,9 +1151,9 @@ hdmi: hdmi@13970000 {
 				      "oscclk", "i_spdif_clk";
 			phy = <&hdmiphy>;
 			ddc = <&hsi2c_11>;
+			#sound-dai-cells = <0>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
 			samsung,sysreg-phandle = <&syscon_disp>;
-			#sound-dai-cells = <0>;
 
 			status = "disabled";
 		};
@@ -1479,8 +1479,8 @@ serial_0: serial@14c10000 {
 			clocks = <&cmu_peric CLK_PCLK_UART0>,
 				 <&cmu_peric CLK_SCLK_UART0>;
 			clock-names = "uart", "clk_uart_baud0";
-			pinctrl-names = "default";
 			pinctrl-0 = <&uart0_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -1492,8 +1492,8 @@ serial_1: serial@14c20000 {
 			clocks = <&cmu_peric CLK_PCLK_UART1>,
 				 <&cmu_peric CLK_SCLK_UART1>;
 			clock-names = "uart", "clk_uart_baud0";
-			pinctrl-names = "default";
 			pinctrl-0 = <&uart1_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -1505,8 +1505,8 @@ serial_2: serial@14c30000 {
 			clocks = <&cmu_peric CLK_PCLK_UART2>,
 				 <&cmu_peric CLK_SCLK_UART2>;
 			clock-names = "uart", "clk_uart_baud0";
-			pinctrl-names = "default";
 			pinctrl-0 = <&uart2_bus>;
+			pinctrl-names = "default";
 
 			status = "disabled";
 		};
@@ -1523,11 +1523,11 @@ spi_0: spi@14d20000 {
 				 <&cmu_peric CLK_SCLK_SPI0>,
 				 <&cmu_peric CLK_SCLK_IOCLK_SPI0>;
 			clock-names = "spi", "spi_busclk0", "spi_ioclk";
-			samsung,spi-src-clk = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi0_bus>;
+			pinctrl-names = "default";
 			num-cs = <1>;
 			fifo-depth = <256>;
+			samsung,spi-src-clk = <0>;
 
 			status = "disabled";
 		};
@@ -1544,11 +1544,11 @@ spi_1: spi@14d30000 {
 				 <&cmu_peric CLK_SCLK_SPI1>,
 				 <&cmu_peric CLK_SCLK_IOCLK_SPI1>;
 			clock-names = "spi", "spi_busclk0", "spi_ioclk";
-			samsung,spi-src-clk = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi1_bus>;
+			pinctrl-names = "default";
 			num-cs = <1>;
 			fifo-depth = <64>;
+			samsung,spi-src-clk = <0>;
 
 			status = "disabled";
 		};
@@ -1565,11 +1565,11 @@ spi_2: spi@14d40000 {
 				 <&cmu_peric CLK_SCLK_SPI2>,
 				 <&cmu_peric CLK_SCLK_IOCLK_SPI2>;
 			clock-names = "spi", "spi_busclk0", "spi_ioclk";
-			samsung,spi-src-clk = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi2_bus>;
+			pinctrl-names = "default";
 			num-cs = <1>;
 			fifo-depth = <64>;
+			samsung,spi-src-clk = <0>;
 
 			status = "disabled";
 		};
@@ -1586,11 +1586,11 @@ spi_3: spi@14d50000 {
 				 <&cmu_peric CLK_SCLK_SPI3>,
 				 <&cmu_peric CLK_SCLK_IOCLK_SPI3>;
 			clock-names = "spi", "spi_busclk0", "spi_ioclk";
-			samsung,spi-src-clk = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi3_bus>;
+			pinctrl-names = "default";
 			num-cs = <1>;
 			fifo-depth = <64>;
+			samsung,spi-src-clk = <0>;
 
 			status = "disabled";
 		};
@@ -1607,11 +1607,11 @@ spi_4: spi@14d00000 {
 				 <&cmu_peric CLK_SCLK_SPI4>,
 				 <&cmu_peric CLK_SCLK_IOCLK_SPI4>;
 			clock-names = "spi", "spi_busclk0", "spi_ioclk";
-			samsung,spi-src-clk = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&spi4_bus>;
+			pinctrl-names = "default";
 			num-cs = <1>;
 			fifo-depth = <64>;
+			samsung,spi-src-clk = <0>;
 
 			status = "disabled";
 		};
@@ -1651,10 +1651,10 @@ pwm: pwm@14dd0000 {
 				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>;
-			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 			clocks = <&cmu_peric CLK_PCLK_PWM>;
 			clock-names = "timers";
 			#pwm-cells = <3>;
+			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 
 			status = "disabled";
 		};
@@ -1666,8 +1666,8 @@ hsi2c_0: i2c@14e40000 {
 			interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c0_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C0>;
 			clock-names = "hsi2c";
 
@@ -1681,8 +1681,8 @@ hsi2c_1: i2c@14e50000 {
 			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c1_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C1>;
 			clock-names = "hsi2c";
 
@@ -1696,8 +1696,8 @@ hsi2c_2: i2c@14e60000 {
 			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c2_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C2>;
 			clock-names = "hsi2c";
 
@@ -1711,8 +1711,8 @@ hsi2c_3: i2c@14e70000 {
 			interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c3_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C3>;
 			clock-names = "hsi2c";
 
@@ -1726,8 +1726,8 @@ hsi2c_4: i2c@14ec0000 {
 			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c4_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C4>;
 			clock-names = "hsi2c";
 
@@ -1741,8 +1741,8 @@ hsi2c_5: i2c@14ed0000 {
 			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c5_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C5>;
 			clock-names = "hsi2c";
 
@@ -1756,8 +1756,8 @@ hsi2c_6: i2c@14ee0000 {
 			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c6_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C6>;
 			clock-names = "hsi2c";
 
@@ -1771,8 +1771,8 @@ hsi2c_7: i2c@14ef0000 {
 			interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c7_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C7>;
 			clock-names = "hsi2c";
 
@@ -1786,8 +1786,8 @@ hsi2c_8: i2c@14d90000 {
 			interrupts = <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c8_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C8>;
 			clock-names = "hsi2c";
 
@@ -1801,8 +1801,8 @@ hsi2c_9: i2c@14da0000 {
 			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c9_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C9>;
 			clock-names = "hsi2c";
 
@@ -1816,8 +1816,8 @@ hsi2c_10: i2c@14de0000 {
 			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c10_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C10>;
 			clock-names = "hsi2c";
 
@@ -1831,8 +1831,8 @@ hsi2c_11: i2c@14df0000 {
 			interrupts = <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c11_bus>;
+			pinctrl-names = "default";
 			clocks = <&cmu_peric CLK_PCLK_HSI2C11>;
 			clock-names = "hsi2c";
 
@@ -1841,6 +1841,7 @@ hsi2c_11: i2c@14df0000 {
 
 		usbdrd30: usb@15400000 {
 			compatible = "samsung,exynos5433-dwusb3";
+			ranges = <0x0 0x15400000 0x10000>;
 			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>,
 				 <&cmu_fsys CLK_SCLK_USBDRD30>,
 				 <&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK>,
@@ -1848,17 +1849,16 @@ usbdrd30: usb@15400000 {
 			clock-names = "aclk", "susp_clk", "phyclk", "pipe_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0x0 0x15400000 0x10000>;
 
 			status = "disabled";
 
 			usbdrd_dwc3: usb@0 {
 				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
 				clocks = <&cmu_fsys CLK_SCLK_USBDRD30>,
 					 <&cmu_fsys CLK_ACLK_USBDRD30>,
 					 <&cmu_fsys CLK_SCLK_USBDRD30>;
 				clock-names = "ref", "bus_early", "suspend";
-				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbdrd30_phy 0>, <&usbdrd30_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
@@ -1895,6 +1895,7 @@ usbhost30_phy: phy@15580000 {
 
 		usbhost30: usb@15a00000 {
 			compatible = "samsung,exynos5433-dwusb3";
+			ranges = <0x0 0x15a00000 0x10000>;
 			clocks = <&cmu_fsys CLK_ACLK_USBHOST30>,
 				 <&cmu_fsys CLK_SCLK_USBHOST30>,
 				 <&cmu_fsys CLK_PHYCLK_USBHOST30_UHOST30_PHYCLOCK>,
@@ -1902,17 +1903,16 @@ usbhost30: usb@15a00000 {
 			clock-names = "aclk", "susp_clk", "phyclk", "pipe_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0x0 0x15a00000 0x10000>;
 
 			status = "disabled";
 
 			usbhost_dwc3: usb@0 {
 				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
 				clocks = <&cmu_fsys CLK_SCLK_USBHOST30>,
 					 <&cmu_fsys CLK_ACLK_USBHOST30>,
 					 <&cmu_fsys CLK_SCLK_USBHOST30>;
 				clock-names = "ref", "bus_early", "suspend";
-				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usbhost30_phy 0>, <&usbhost30_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
@@ -1922,10 +1922,10 @@ usbhost_dwc3: usb@0 {
 		mshc_0: mmc@15540000 {
 			compatible = "samsung,exynos5433-dw-mshc-smu",
 				     "samsung,exynos7-dw-mshc-smu";
+			reg = <0x15540000 0x2000>;
 			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0x15540000 0x2000>;
 			clocks = <&cmu_fsys CLK_ACLK_MMC0>,
 				 <&cmu_fsys CLK_SCLK_MMC0>;
 			clock-names = "biu", "ciu";
@@ -1937,10 +1937,10 @@ mshc_0: mmc@15540000 {
 		mshc_1: mmc@15550000 {
 			compatible = "samsung,exynos5433-dw-mshc-smu",
 				     "samsung,exynos7-dw-mshc-smu";
+			reg = <0x15550000 0x2000>;
 			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0x15550000 0x2000>;
 			clocks = <&cmu_fsys CLK_ACLK_MMC1>,
 				 <&cmu_fsys CLK_SCLK_MMC1>;
 			clock-names = "biu", "ciu";
@@ -1952,10 +1952,10 @@ mshc_1: mmc@15550000 {
 		mshc_2: mmc@15560000 {
 			compatible = "samsung,exynos5433-dw-mshc-smu",
 				     "samsung,exynos7-dw-mshc-smu";
+			reg = <0x15560000 0x2000>;
 			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0x15560000 0x2000>;
 			clocks = <&cmu_fsys CLK_ACLK_MMC2>,
 				 <&cmu_fsys CLK_SCLK_MMC2>;
 			clock-names = "biu", "ciu";
@@ -1985,12 +1985,12 @@ pdma1: dma-controller@15600000 {
 		audio-subsystem@11400000 {
 			compatible = "samsung,exynos5433-lpass";
 			reg = <0x11400000 0x100>, <0x11500000 0x08>;
+			ranges;
 			clocks = <&cmu_aud CLK_PCLK_SFR0_CTRL>;
 			clock-names = "sfr0_ctrl";
 			power-domains = <&pd_aud>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
 
 			adma: dma-controller@11420000 {
 				compatible = "arm,pl330", "arm,primecell";
@@ -2016,8 +2016,8 @@ i2s0: i2s@11440000 {
 					 <&cmu_aud CLK_SCLK_I2S_BCLK>;
 				clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 				#clock-cells = <1>;
-				pinctrl-names = "default";
 				pinctrl-0 = <&i2s0_bus>;
+				pinctrl-names = "default";
 				power-domains = <&pd_aud>;
 				#sound-dai-cells = <1>;
 
@@ -2031,8 +2031,8 @@ serial_3: serial@11460000 {
 				clocks = <&cmu_aud CLK_PCLK_AUD_UART>,
 					 <&cmu_aud CLK_SCLK_AUD_UART>;
 				clock-names = "uart", "clk_uart_baud0";
-				pinctrl-names = "default";
 				pinctrl-0 = <&uart_aud_bus>;
+				pinctrl-names = "default";
 				power-domains = <&pd_aud>;
 
 				status = "disabled";
@@ -2042,22 +2042,24 @@ serial_3: serial@11460000 {
 		pcie_phy: pcie-phy@15680000 {
 			compatible = "samsung,exynos5433-pcie-phy";
 			reg = <0x15680000 0x1000>;
+			#phy-cells = <0>;
 			samsung,pmu-syscon = <&pmu_system_controller>;
 			samsung,fsys-sysreg = <&syscon_fsys>;
-			#phy-cells = <0>;
 
 			status = "disabled";
 		};
 
 		pcie: pcie@15700000 {
+			device_type = "pci";
 			compatible = "samsung,exynos5433-pcie";
 			reg = <0x15700000 0x1000>, <0x156b0000 0x1000>,
 			      <0x0c000000 0x1000>;
 			reg-names = "dbi", "elbi", "config";
+			ranges = <0x81000000 0 0	  0x0c001000 0 0x00010000>,
+				 <0x82000000 0 0x0c011000 0x0c011000 0 0x03feefff>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			#interrupt-cells = <1>;
-			device_type = "pci";
 			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_fsys CLK_PCIE>,
 				 <&cmu_fsys CLK_PCLK_PCIE_PHY>;
@@ -2066,8 +2068,6 @@ pcie: pcie@15700000 {
 			num-viewport = <3>;
 			bus-range = <0x00 0xff>;
 			phys = <&pcie_phy>;
-			ranges = <0x81000000 0 0	  0x0c001000 0 0x00010000>,
-				 <0x82000000 0 0x0c011000 0x0c011000 0 0x03feefff>;
 
 			status = "disabled";
 		};

-- 
2.53.0

