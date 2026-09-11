Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7BD43DEC8
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122005; cv=none; b=sfiRLvzGDa9tFRdlkfvs3Aje6uum6lMsBueondrzjxsCJjyW/Gn3XUWjam23flU4cz60MvEEOSpLVEzAdfOEP+3X/wf8kZggncKex7aKLZNM87y3N6QG1bUKEMm3z9cn6oaHocDqKLucQqHQR0Ru7zRvckgsotkGPda4xqG/Ufg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122005; c=relaxed/simple;
	bh=aIfMAQJD7thnunKYxlie5pZAb+toYXs7/7Daz6Z8Dhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q7qSaJgi3wgNJqaQGm1x3MjRgn0BBlv1DkkGdqEq9tAVIi6PumSMQdO7LI8Rvy5qgQ0lVEBC/zR0A3RqlEQ+tnlk9MGSbDnxo0Y15fSwKqtxx599/SdcAuRskJAHfXlEugkrrxM1kaFoKi1UlzoA69PBDw63mvB55F/5eT1OEO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Co+Kbmy0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfGuRZQF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Co+Kbmy0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SfGuRZQF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7l51c2311747
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mnJFaReIYirgc2urMIRRaNdgBw87cBXu9qrWM1YqU6M=; b=Co+Kbmy0UY1tGbva
	8e7pjYpEVJvfZvkNw3UaJr+8C2BkAqJN0hAY2d+XJuFDX2sVvDgdDLiLBJAAqFXU
	J2mQ/Xx14s6CjOmfuF4KtCadeJ0/AfSUEVcM2SbdLRhf5WcB3+XhHOZZh4xL6WvQ
	/YQePgxMJAqRTtr2B42lLp4uLhQc1Mf7hifMYD94DjN4p0LFtWarAjGdhvPW8L/Q
	ajLyomVuKpL7DMO4+scowF9DjSmkJDc2oTZarcU5EmNezRzPGEdFiNOtai4caqrW
	N2l1DSTOZbdPSCLc19KEmaMc7n8YcqFJoxjwAgNqCgrJmFuJtldje00gR2bz8Zt8
	OBN/2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uchxne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so153873085a.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 03:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121995; x=1789726795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mnJFaReIYirgc2urMIRRaNdgBw87cBXu9qrWM1YqU6M=;
        b=SfGuRZQF0kCDHwI3/78UEQtzGi2Zg6Kp2fb64eZ/7TymxQe5N4lJ9/L2syxbRq/lky
         mKcDbFe1qGOUrSjZms0YNo2RPdH4IpGaMa66AfJtR3QYcbpFpLCgIr1DdNXx4YcO0oYZ
         t93hn45dq291kwdN+X7kHzIrNf7EAAfPOkoPt2ECUay4KSBCkPJghpvElrGmzuHbjBmm
         sDbUVpTrEJH+dl2/iA//5VAmqGcnENBtwU1Z7NmXZWdMcl3qzHh7L/qDuKO3Jr2DoWq2
         m/z4EESU9q73dokAzxqX9GcymX+ujucJhVrK1e8VRqJ5LxkiufAqH2Y2yYAPbtTB5CJG
         Bw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121995; x=1789726795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mnJFaReIYirgc2urMIRRaNdgBw87cBXu9qrWM1YqU6M=;
        b=LjjV0dcG/eoT46nkkEHVp2W4Y/2YEe7gcN0q8UnKjBmQDWmM/7v9rqiSbcE9TCQFYH
         7hss4TAmD4Gf5XnmMlBNiTNydepmFpOaM/Tht85PpcYuzwT7puR6Buv/2bhtGjkZcUoa
         2i29jiGjlSv1S+9TZljWs2ggB0b2EETEYVfh2IMiHiEPobzxO8apLCQqxs0wp6O9ddxH
         ReG3H6UxQfvUA+qmO0X+fGma+LzJIYaMHHoYE7SD+OoODNuMEIoLHnGSreu+a9pZ0SUE
         LvU82thqy0V8vR75H8HFpTAqLM3HJcN7aQDDdmhc0P40HGLMrJ63otwM756YG1ipWAJp
         yPyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzlDkW3ZKRUhG9dl7zBipkhacURnqSE/HS7LjsY/frvQhYGcoQwQvD+Vva7eXPII44Q2L9HZxjHSkgDFFfvWTqDA==@vger.kernel.org
X-Gm-Message-State: AFuF++mJKfA9DuvBJwnWukiSjgLVL4tP07BwJamDfB3TYZCsXj6XZhLE
	dnVdyHtEhLD1ONTAlcGGNhO2tP9sf17ZBNw4SQLL8bLLY3fR1Pdi98TzO/otOCzNBGGdR1c5hVu
	TQh2vOhMINrQMN9rZJmzmVgFRO+bRPh6xCrl53lWqL/GsD/2TtlJYM2UqTKmnP7WRj/Fvy/gWlQ
	==
X-Gm-Gg: AYBFou2hQRSrtk25LHyuD5LivLvXg4hPLkBdNdDR5aNwKr+uQ6/7KLmz5FOZbtGqvya
	YLNsB8bvErMCBTsBk3blN45D5yYPv4uznm3d+WCgcNKhp01gCdJyG5GOgh4trux6LPpWBoD7XDc
	xie8UqSTndghRGoRkAh58g/jnSDKdcvUjItrbhv90XHipZRXwjoU2/PGImOzYDd1Vx59eA8PFZh
	TjePgJVXWZgU3beMqn5DD5cQ1G06/iRHCL4kKSZ4/XfvZX3RL1dw1z/vdQc4pqfrHMcitRF/TG4
	T3/WIPPRuLVCXfrjR212tpJPcFZuxSqu4cpMC5bQAeY484dVXqSE/GWSZ7QxoDqv1rPdVODrkzj
	sWGBqtPEYSQG2AtQlKxjIRxc=
X-Received: by 2002:a05:620a:2705:b0:939:72cb:baf5 with SMTP id af79cd13be357-939d8002941mr1027557285a.44.1789121994604;
        Fri, 11 Sep 2026 03:19:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2705:b0:939:72cb:baf5 with SMTP id af79cd13be357-939d8002941mr1027551985a.44.1789121993952;
        Fri, 11 Sep 2026 03:19:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:18 +0200
Subject: [PATCH 10/10] arm64: dts: exynos7870: Re-order properties to match
 coding style
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-10-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=33143;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aIfMAQJD7thnunKYxlie5pZAb+toYXs7/7Daz6Z8Dhg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9Wvh/21hR4g8uCDiArn6l/Gk7xKGoJRrE4xD
 zKbklN4tQ6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVrwAKCRDBN2bmhouD
 19lKD/9Cwf+M981CE1XneADTZR4OCexyz6hN2PeEAJgHTZ/JAw1dNxjdXmFpJvT0NdWYun9Xjvz
 67xR6JXKzJpAq616WhupcQh99JM6+KOJfW+stpxk2j++d3ev0PUy8ehqh5WdM1V4yUOKxx3NXEV
 laOP17Vpv/IavODGx06YXTwVKNldToBlF8mnV7V7WcUUXBGNL6xQFwxMJWvYo2H+0Cs79iwRnpf
 2JOfmEG3thHHEt6+gI1AZtFnn96EjqHCKiBg/1t/Ynwzvf3045z01SNNaXSoSpIv5hKn6KEWt0I
 RIum/2YPoxcPQVFsGaGlJ4rtG7lS+qTs8COtTbnr2pyFXI8CznPm2yhrfsp+54ov5LMRckqvSoy
 /XWxbaiGSNHg+A22CVlO1EUYLy3CFKV/+79HDo5qCiOE5XzbKn9aMl6B53eGFAjl7vWTDvU3/lV
 Lsgo04LF56kkiYgM72jyTKQb6KwBEqWj8LQf6vOjI8nJxSATlXenY9320RCEiWmDUvSRY91wndS
 q9Yl7JYmeqnHnNJtC0nJZnEtXdJJ7Xla3s+1CDKSAdv6SP+kGP2alJoUlZmzJKsF2ewgprgsBw2
 HUl0vbOrvq8socA7s29mx2qVpFsZtvSwbSQ73ZZw8I0g/rxNWaPH23A113aspX9GMx9xyE4Bn43
 /923WC8lrxCu7fw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3d5cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6wWLrLUpIfCQMcXz48EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX5kXQdk6h+UbJ
 eOvE/kl6S5M+gQLZV6Z+nymAG6E//onxUXqyTgwZe36+FjJrMXmMfZ5Ihw2iBEXn+vj3T3Ox37G
 XjMye2cWVqmcDivseWwuBYVQW1mqjpKJteZF520L/jSzJY3U8SIoWe8kzWxkwsdJd2w6YfWTl7a
 s2zMOSv0uIMxODOmgWI/woaG0bQOclcYvBdK1/fXns4QRFssvMba/AELMLb2S/TfTXmrxE+MDaX
 9wHjLCT8ulNc2tO6Hp6GaEMHPeSPTlQf7R7MkPjbSxxXMRPFflBkWVL4sHKkna+d6ijX5Qy8u3x
 C20qcTiI+S9SN8zQ6pxM5QKctGl6ZdDFKB20qYDDg6KpdBbkbLd64ujBSuidbRDwUxmGPl98v1u
 m0ccrw87s45WAu0pOxqZY+VoZyKzKtsxsaEH1bpmgZvRWzhyPFSExgmgEjaiCS/uhEPtUOD2ySj
 yFl4hp03UWJ1REnGOOg==
X-Proofpoint-GUID: 4RvBvI7NxKRmDfIO5dxxywao7FIAbb5V
X-Proofpoint-ORIG-GUID: 4RvBvI7NxKRmDfIO5dxxywao7FIAbb5V
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXzMhE03B+63Ih
 V4JMGOzzinKW4Vhn/kyT6pkABJ/1b81dpJ3uY0s+41uUfjmNBH8RnayTf34Hpi+hQ12WpRi0KNc
 JgokOtYGZS5Gm5Lu3HI+1ikmKLYSoW0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143

Re-order a few properties to match coding style, as pointed out by
dt-check-style, e.g.:

  exynos7870-j5y17lte.dts:31: [property-order] property 'ranges' out of canonical order (should sort before '#size-cells')
  exynos7870-j5y17lte.dts:47: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  39 ++++----
 arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts |  34 ++++---
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  34 ++++---
 arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  |  35 ++++---
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  39 ++++----
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 108 ++++++++++-----------
 6 files changed, 151 insertions(+), 138 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
index 0888cd2faca4..67f317afd85e 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
@@ -34,8 +34,8 @@ gpio-keys {
 		compatible = "gpio-keys";
 		label = "GPIO Keys";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&key_power &key_voldown &key_volup>;
+		pinctrl-names = "default";
 
 		key-power {
 			label = "Power Key";
@@ -86,9 +86,9 @@ vdd_fixed_proxled: regulator-fixed-proxled {
 	};
 
 	reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges;
 
 		ramoops@46800000 {
 			compatible = "ramoops";
@@ -166,8 +166,8 @@ pmic@66 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_irq>;
+		pinctrl-names = "default";
 
 		regulators {
 			vdd_buck1: buck1 {
@@ -402,8 +402,8 @@ accelerometer@1d {
 		interrupt-parent = <&gpa2>;
 		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&accel_irq>;
+		pinctrl-names = "default";
 
 		st,drdy-int-pin = <1>;
 	};
@@ -414,8 +414,8 @@ proximity@48 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <5 IRQ_TYPE_EDGE_BOTH>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&proxm_irq>;
+		pinctrl-names = "default";
 
 		proximity-near-level = <25>;
 	};
@@ -435,8 +435,8 @@ touchscreen@4b {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&touch_irq>;
+		pinctrl-names = "default";
 
 		vdd-supply = <&vdd_ldo35>;
 
@@ -461,18 +461,19 @@ rmi4-f12@12 {
 };
 
 &mmc0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
 
 	bus-width = <8>;
 	fifo-depth = <64>;
+	non-removable;
+
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;
 	samsung,dw-mshc-ddr-timing = <2 4>;
-	non-removable;
 
 	status = "okay";
 };
@@ -481,36 +482,37 @@ &mmc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_bus1 &sd1_bus4>;
+	pinctrl-names = "default";
 
 	mmc-pwrseq = <&pwrseq_mmc1>;
 
 	bus-width = <4>;
 	fifo-depth = <64>;
-	samsung,dw-mshc-ciu-div = <3>;
-	samsung,dw-mshc-sdr-timing = <0 3>;
-	samsung,dw-mshc-ddr-timing = <1 2>;
 	non-removable;
 	cap-sd-highspeed;
 	cap-sdio-irq;
 
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+
 	status = "okay";
 
 	wifi@1 {
 		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac";
 		reg = <0x1>;
-		interrupt-names = "host-wake";
 		interrupt-parent = <&gpa2>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "host-wake";
 
 		reset-gpios = <&gpd3 6 GPIO_ACTIVE_LOW>;
 	};
 };
 
 &mmc2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4 &dwmmc2_irq>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_fixed_mmc2>;
 	vqmmc-supply = <&vdd_ldo2>;
@@ -518,14 +520,15 @@ &mmc2 {
 	bus-width = <4>;
 	card-detect-delay = <200>;
 	fifo-depth = <64>;
-	samsung,dw-mshc-ciu-div = <3>;
-	samsung,dw-mshc-sdr-timing = <0 3>;
-	samsung,dw-mshc-ddr-timing = <1 2>;
 	sd-uhs-sdr50;
 	sd-uhs-sdr104;
 	broken-cd;
 	disable-wp;
 
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+
 	status = "okay";
 };
 
@@ -629,8 +632,8 @@ &serial1 {
 	bluetooth {
 		compatible = "brcm,bcm43430a1-bt";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&bt_btwake &bt_hostwake &bt_enable>;
+		pinctrl-names = "default";
 
 		device-wakeup-gpios = <&gpa1 2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpa1 6 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts
index 36c327668db5..84421a3d47ca 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts
@@ -26,9 +26,9 @@ aliases {
 	};
 
 	chosen {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges;
 
 		stdout-path = &serial2;
 
@@ -44,35 +44,35 @@ framebuffer@67000000 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		pinctrl-names = "default";
 		pinctrl-0 = <&key_power &key_voldown &key_volup>;
+		pinctrl-names = "default";
 
 		key-home {
 			interrupt-parent = <&gpa1>;
-			linux,code = <KEY_HOMEPAGE>;
 			label = "gpio-keys: KEY_HOMEPAGE";
 			gpios = <&gpa1 7 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
 		};
 
 		key-power {
 			interrupt-parent = <&gpa0>;
-			linux,code = <KEY_POWER>;
 			label = "gpio-keys: KEY_POWER";
 			gpios = <&gpa0 0 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
 		};
 
 		key-voldown {
 			interrupt-parent = <&gpa2>;
-			linux,code = <KEY_VOLUMEDOWN>;
 			label = "gpio-keys: KEY_VOLUMEDOWN";
 			gpios = <&gpa2 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
 		key-volup {
 			interrupt-parent = <&gpa2>;
-			linux,code = <KEY_VOLUMEUP>;
 			label = "gpio-keys: KEY_VOLUMEUP";
 			gpios = <&gpa2 0 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
 
@@ -98,9 +98,9 @@ vdd_fixed_mmc2: regulator-fixed-mmc2 {
 	};
 
 	reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges;
 
 		ramoops@46e00000 {
 			compatible = "ramoops";
@@ -137,8 +137,8 @@ pmic@66 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_irq>;
+		pinctrl-names = "default";
 
 		regulators {
 			vdd_buck1: buck1 {
@@ -368,8 +368,8 @@ touchscreen@50 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&touch_irq>;
+		pinctrl-names = "default";
 
 		touchscreen-size-x = <720>;
 		touchscreen-size-y = <1280>;
@@ -379,17 +379,18 @@ touchscreen@50 {
 };
 
 &mmc0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
 
 	fifo-depth = <64>;
+	non-removable;
+
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;
 	samsung,dw-mshc-ddr-timing = <2 4>;
-	non-removable;
 
 	status = "okay";
 };
@@ -398,29 +399,30 @@ &mmc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_bus1 &sd1_bus4>;
+	pinctrl-names = "default";
 
 	mmc-pwrseq = <&pwrseq_mmc1>;
 
 	bus-width = <4>;
 	fifo-depth = <64>;
-	samsung,dw-mshc-ciu-div = <3>;
-	samsung,dw-mshc-sdr-timing = <0 3>;
-	samsung,dw-mshc-ddr-timing = <1 2>;
 	non-removable;
 	cap-sd-highspeed;
 	cap-sdio-irq;
 
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+
 	status = "okay";
 
 	wifi@0 {
 		compatible = "brcm,bcm43455-fmac", "brcm,bcm4329-fmac";
 		reg = <0x0>;
 
-		interrupt-names = "host-wake";
 		interrupt-parent = <&gpa2>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "host-wake";
 
 		reset-gpios = <&gpd3 6 GPIO_ACTIVE_LOW>;
 	};
diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index 02bab3ab2711..8bd6892ae796 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
@@ -34,16 +34,16 @@ gpio-hall-effect-sensor {
 		compatible = "gpio-keys";
 		label = "GPIO Hall Effect Sensor";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&hall_irq>;
+		pinctrl-names = "default";
 
 		event-hall-effect-sensor {
 			label = "Hall Effect Sensor";
 			gpios = <&gpa1 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
 			linux,input-type = <EV_SW>;
 			linux,code = <SW_LID>;
 			linux,can-disable;
-			wakeup-source;
 		};
 	};
 
@@ -51,8 +51,8 @@ gpio-keys {
 		compatible = "gpio-keys";
 		label = "GPIO Keys";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&key_power &key_voldown &key_volup>;
+		pinctrl-names = "default";
 
 		key-power {
 			label = "Power Key";
@@ -95,9 +95,9 @@ vdd_fixed_mmc2: regulator-fixed-mmc2 {
 	};
 
 	reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges;
 
 		ramoops@46e00000 {
 			compatible = "ramoops";
@@ -159,8 +159,8 @@ pmic@66 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_irq>;
+		pinctrl-names = "default";
 
 		regulators {
 			vdd_buck1: buck1 {
@@ -394,8 +394,8 @@ accelerometer@1d {
 		interrupt-parent = <&gpa2>;
 		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&accel_irq>;
+		pinctrl-names = "default";
 
 		mount-matrix = "-1", "0",  "0",
 			       "0", "1",  "0",
@@ -417,8 +417,8 @@ touchscreen@20 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&touch_irq>;
+		pinctrl-names = "default";
 
 		touchscreen-size-x = <720>;
 		touchscreen-size-y = <1480>;
@@ -428,18 +428,19 @@ touchscreen@20 {
 };
 
 &mmc0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
 
 	bus-width = <8>;
 	fifo-depth = <64>;
+	non-removable;
+
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;
 	samsung,dw-mshc-ddr-timing = <2 4>;
-	non-removable;
 
 	status = "okay";
 };
@@ -448,36 +449,37 @@ &mmc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_bus1 &sd1_bus4>;
+	pinctrl-names = "default";
 
 	mmc-pwrseq = <&pwrseq_mmc1>;
 
 	bus-width = <4>;
 	fifo-depth = <64>;
-	samsung,dw-mshc-ciu-div = <3>;
-	samsung,dw-mshc-sdr-timing = <0 3>;
-	samsung,dw-mshc-ddr-timing = <1 2>;
 	non-removable;
 	cap-sd-highspeed;
 	cap-sdio-irq;
 
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+
 	status = "okay";
 
 	wifi@1 {
 		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac";
 		reg = <0x1>;
-		interrupt-names = "host-wake";
 		interrupt-parent = <&gpa2>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "host-wake";
 
 		reset-gpios = <&gpd3 6 GPIO_ACTIVE_LOW>;
 	};
 };
 
 &mmc2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4 &dwmmc2_irq>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_fixed_mmc2>;
 	vqmmc-supply = <&vdd_ldo2>;
@@ -596,8 +598,8 @@ &serial1 {
 	bluetooth {
 		compatible = "brcm,bcm43430a1-bt";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&bt_btwake &bt_hostwake &bt_enable>;
+		pinctrl-names = "default";
 
 		device-wakeup-gpios = <&gpa1 2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpa1 6 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts
index 079b2b581307..d258eecfbf42 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts
@@ -26,9 +26,9 @@ aliases {
 	};
 
 	chosen {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges;
 
 		stdout-path = &serial2;
 
@@ -46,8 +46,8 @@ gpio-keys {
 		compatible = "gpio-keys";
 		label = "GPIO Keys";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&key_home &key_power &key_voldown &key_volup>;
+		pinctrl-names = "default";
 
 		key-home {
 			label = "Home Key";
@@ -86,9 +86,9 @@ pwrseq_mmc1: pwrseq-mmc1 {
 	};
 
 	reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges;
 
 		ramoops@46e00000 {
 			compatible = "ramoops";
@@ -136,8 +136,8 @@ pmic@66 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_irq>;
+		pinctrl-names = "default";
 
 		regulators {
 			vdd_buck1: buck1 {
@@ -346,23 +346,24 @@ touchscreen@48 {
 		interrupt-parent = <&gpc3>;
 		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&touch_irq>;
+		pinctrl-names = "default";
 	};
 };
 
 &mmc0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
 
 	fifo-depth = <64>;
+	non-removable;
+
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;
 	samsung,dw-mshc-ddr-timing = <2 4>;
-	non-removable;
 
 	status = "okay";
 };
@@ -371,37 +372,38 @@ &mmc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_bus1 &sd1_bus4>;
+	pinctrl-names = "default";
 
 	mmc-pwrseq = <&pwrseq_mmc1>;
 
 	bus-width = <4>;
 	fifo-depth = <64>;
-	samsung,dw-mshc-ciu-div = <3>;
-	samsung,dw-mshc-sdr-timing = <0 3>;
-	samsung,dw-mshc-ddr-timing = <1 2>;
 	non-removable;
 	cap-sd-highspeed;
 	cap-sdio-irq;
 
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+
 	status = "okay";
 
 	wifi@1 {
 		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac";
 		reg = <0x1>;
 
-		interrupt-names = "host-wake";
 		interrupt-parent = <&gpa2>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "host-wake";
 
 		reset-gpios = <&gpd3 6 GPIO_ACTIVE_LOW>;
 	};
 };
 
 &mmc2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4 &dwmmc2_irq>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_fixed_mmc2>;
 	vqmmc-supply = <&vdd_ldo2>;
@@ -409,14 +411,15 @@ &mmc2 {
 	bus-width = <4>;
 	card-detect-delay = <200>;
 	fifo-depth = <64>;
-	samsung,dw-mshc-ciu-div = <3>;
-	samsung,dw-mshc-sdr-timing = <0 3>;
-	samsung,dw-mshc-ddr-timing = <1 2>;
 	sd-uhs-sdr50;
 	sd-uhs-sdr104;
 	broken-cd;
 	disable-wp;
 
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
index 29be4764f84d..5bb95aab75b2 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
@@ -34,8 +34,8 @@ gpio-keys {
 		compatible = "gpio-keys";
 		label = "GPIO Keys";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&key_home &key_power &key_voldown &key_volup>;
+		pinctrl-names = "default";
 
 		key-home {
 			label = "Home Key";
@@ -84,9 +84,9 @@ vdd_fixed_mmc2: regulator-fixed-mmc2 {
 	};
 
 	reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges;
 
 		ramoops@46e00000 {
 			compatible = "ramoops";
@@ -168,8 +168,8 @@ pmic@66 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_irq>;
+		pinctrl-names = "default";
 
 		regulators {
 			vdd_buck1: buck1 {
@@ -411,8 +411,8 @@ touchscreen@70 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&touch_irq>;
+		pinctrl-names = "default";
 
 		syna,reset-delay-ms = <200>;
 		syna,startup-delay-ms = <200>;
@@ -446,8 +446,8 @@ accelerometer@1d {
 		interrupt-parent = <&gpa2>;
 		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&accel_irq>;
+		pinctrl-names = "default";
 
 		mount-matrix = "1",  "0",  "0",
 			       "0", "-1",  "0",
@@ -469,26 +469,27 @@ proximity@48 {
 		interrupt-parent = <&gpa0>;
 		interrupts = <5 IRQ_TYPE_EDGE_BOTH>;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&proxm_irq>;
+		pinctrl-names = "default";
 
 		proximity-near-level = <25>;
 	};
 };
 
 &mmc0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
 
 	bus-width = <8>;
 	fifo-depth = <64>;
+	non-removable;
+
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;
 	samsung,dw-mshc-ddr-timing = <2 4>;
-	non-removable;
 
 	status = "okay";
 };
@@ -497,36 +498,37 @@ &mmc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_bus1 &sd1_bus4>;
+	pinctrl-names = "default";
 
 	mmc-pwrseq = <&pwrseq_mmc1>;
 
 	bus-width = <4>;
 	fifo-depth = <64>;
-	samsung,dw-mshc-ciu-div = <3>;
-	samsung,dw-mshc-sdr-timing = <0 3>;
-	samsung,dw-mshc-ddr-timing = <1 2>;
 	non-removable;
 	cap-sd-highspeed;
 	cap-sdio-irq;
 
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+
 	status = "okay";
 
 	wifi@1 {
 		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac";
 		reg = <0x1>;
-		interrupt-names = "host-wake";
 		interrupt-parent = <&gpa2>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "host-wake";
 
 		reset-gpios = <&gpd3 6 GPIO_ACTIVE_LOW>;
 	};
 };
 
 &mmc2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4 &dwmmc2_irq>;
+	pinctrl-names = "default";
 
 	vmmc-supply = <&vdd_fixed_mmc2>;
 	vqmmc-supply = <&vdd_ldo2>;
@@ -534,14 +536,15 @@ &mmc2 {
 	bus-width = <4>;
 	card-detect-delay = <200>;
 	fifo-depth = <64>;
-	samsung,dw-mshc-ciu-div = <3>;
-	samsung,dw-mshc-sdr-timing = <0 3>;
-	samsung,dw-mshc-ddr-timing = <1 2>;
 	sd-uhs-sdr50;
 	sd-uhs-sdr104;
 	broken-cd;
 	disable-wp;
 
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+
 	status = "okay";
 };
 
@@ -661,8 +664,8 @@ &serial1 {
 	bluetooth {
 		compatible = "brcm,bcm43430a1-bt";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&bt_btwake &bt_hostwake &bt_enable>;
+		pinctrl-names = "default";
 
 		device-wakeup-gpios = <&gpa1 2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpa1 6 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/exynos/exynos7870.dtsi b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
index 9e3ec6c952f0..c397f577d065 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
@@ -156,8 +156,6 @@ cmu_peri: clock-controller@101f0000 {
 			reg = <0x101f0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "bus", "spi0", "spi1", "spi2",
-				      "spi3", "spi4", "uart0", "uart1", "uart2";
 			clocks = <&oscclk>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_BUS>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI0>,
@@ -168,6 +166,8 @@ cmu_peri: clock-controller@101f0000 {
 				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART0>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART1>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART2>;
+			clock-names = "oscclk", "bus", "spi0", "spi1", "spi2",
+				      "spi3", "spi4", "uart0", "uart1", "uart2";
 		};
 
 		cmu_mif: clock-controller@10460000 {
@@ -175,8 +175,8 @@ cmu_mif: clock-controller@10460000 {
 			reg = <0x10460000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk";
 			clocks = <&oscclk>;
+			clock-names = "oscclk";
 		};
 
 		pmu_system_controller: system-controller@10480000 {
@@ -219,11 +219,11 @@ hsi2c0: i2c@10510000 {
 			reg = <0x10510000 0x2000>;
 			interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&hsi2c0_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "hsi2c";
 			clocks = <&cmu_mif CLK_GOUT_MIF_HSI2C_IPCLK>;
+			clock-names = "hsi2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -240,14 +240,14 @@ pinctrl_mif: pinctrl@10530000 {
 		gpu: gpu@11400000 {
 			compatible = "samsung,exynos7870-mali", "arm,mali-t830";
 			reg = <0x11400000 0x5000>;
-			interrupt-names = "job", "mmu", "gpu";
 			interrupts = <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
 
-			clock-names = "core", "bus";
 			clocks = <&cmu_g3d CLK_GOUT_G3D_CLK>,
 				 <&cmu_g3d CLK_GOUT_G3D_ASYNCS_D0_CLK>;
+			clock-names = "core", "bus";
 
 			status = "disabled";
 		};
@@ -257,9 +257,9 @@ cmu_g3d: clock-controller@11460000 {
 			reg = <0x11460000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "switch";
 			clocks = <&oscclk>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_G3D_SWITCH>;
+			clock-names = "oscclk", "switch";
 		};
 
 		cmu_mfcmscl: clock-controller@12cb0000 {
@@ -267,10 +267,10 @@ cmu_mfcmscl: clock-controller@12cb0000 {
 			reg = <0x12cb0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "mfc", "mscl";
 			clocks = <&oscclk>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_MFCMSCL_MFC>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_MFCMSCL_MSCL>;
+			clock-names = "oscclk", "mfc", "mscl";
 		};
 
 		mmc0: mmc@13540000 {
@@ -278,9 +278,9 @@ mmc0: mmc@13540000 {
 			reg = <0x13540000 0x2000>;
 			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
 
-			clock-names = "biu", "ciu";
 			clocks = <&cmu_fsys CLK_GOUT_FSYS_MMC0_ACLK>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_MMC0>;
+			clock-names = "biu", "ciu";
 
 			status = "disabled";
 		};
@@ -290,9 +290,9 @@ mmc1: mmc@13550000 {
 			reg = <0x13550000 0x2000>;
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 
-			clock-names = "biu", "ciu";
 			clocks = <&cmu_fsys CLK_GOUT_FSYS_MMC1_ACLK>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_MMC1>;
+			clock-names = "biu", "ciu";
 
 			status = "disabled";
 		};
@@ -302,9 +302,9 @@ mmc2: mmc@13560000 {
 			reg = <0x13560000 0x2000>;
 			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
 
-			clock-names = "biu", "ciu";
 			clocks = <&cmu_fsys CLK_GOUT_FSYS_MMC2_ACLK>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_MMC2>;
+			clock-names = "biu", "ciu";
 
 			status = "disabled";
 		};
@@ -314,9 +314,9 @@ usbdrd_phy: phy@135c0000 {
 			reg = <0x135c0000 0x100>;
 			#phy-cells = <1>;
 
-			clock-names = "phy", "ref";
 			clocks = <&cmu_fsys CLK_GOUT_FSYS_MUX_USB20DRD_PHYCLOCK_USER>,
 				 <&cmu_fsys CLK_GOUT_FSYS_MUX_USB_PLL>;
+			clock-names = "phy", "ref";
 
 			samsung,pmu-syscon = <&pmu_system_controller>;
 		};
@@ -327,10 +327,10 @@ usbdrd: usb@13600000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			clock-names = "bus_early", "ref", "ctrl";
 			clocks = <&cmu_fsys CLK_GOUT_FSYS_USB20DRD_ACLK_HSDRD>,
 				 <&cmu_fsys CLK_GOUT_FSYS_USB20DRD_HSDRD_REF_CLK>,
 				 <&cmu_fsys CLK_GOUT_FSYS_USB20DRD_HCLK_USB20_CTRL>;
+			clock-names = "bus_early", "ref", "ctrl";
 
 			status = "disabled";
 
@@ -339,8 +339,8 @@ usb@0 {
 				reg = <0x0 0x10000>;
 				interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
 
-				phy-names = "usb2-phy";
 				phys = <&usbdrd_phy 0>;
+				phy-names = "usb2-phy";
 
 				usb-role-switch;
 				snps,usb2-gadget-lpm-disable;
@@ -352,10 +352,10 @@ cmu_fsys: clock-controller@13730000 {
 			reg = <0x13730000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "bus", "usb20drd";
 			clocks = <&oscclk>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_BUS>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_FSYS_USB20DRD_REFCLK>;
+			clock-names = "oscclk", "bus", "usb20drd";
 		};
 
 		pinctrl_fsys: pinctrl@13750000 {
@@ -370,12 +370,12 @@ serial0: serial@13800000 {
 			reg = <0x13800000 0x100>;
 			interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&uart0_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "uart", "clk_uart_baud0";
 			clocks = <&cmu_peri CLK_GOUT_PERI_UART0_PCLK>,
 				 <&cmu_peri CLK_GOUT_PERI_UART0_EXT_UCLK>;
+			clock-names = "uart", "clk_uart_baud0";
 
 			samsung,uart-fifosize = <16>;
 
@@ -388,12 +388,12 @@ serial1: serial@13810000 {
 			reg = <0x13810000 0x100>;
 			interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&uart1_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "uart", "clk_uart_baud0";
 			clocks = <&cmu_peri CLK_GOUT_PERI_UART1_PCLK>,
 				 <&cmu_peri CLK_GOUT_PERI_UART1_EXT_UCLK>;
+			clock-names = "uart", "clk_uart_baud0";
 
 			samsung,uart-fifosize = <256>;
 
@@ -406,12 +406,12 @@ serial2: serial@13820000 {
 			reg = <0x13820000 0x100>;
 			interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&uart2_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "uart", "clk_uart_baud0";
 			clocks = <&cmu_peri CLK_GOUT_PERI_UART2_PCLK>,
 				 <&cmu_peri CLK_GOUT_PERI_UART2_EXT_UCLK>;
+			clock-names = "uart", "clk_uart_baud0";
 
 			samsung,uart-fifosize = <256>;
 
@@ -424,11 +424,11 @@ i2c0: i2c@13830000 {
 			reg = <0x13830000 0x100>;
 			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c0_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C0_PCLK>;
+			clock-names = "i2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -442,11 +442,11 @@ i2c1: i2c@13840000 {
 			reg = <0x13840000 0x100>;
 			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c1_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C1_PCLK>;
+			clock-names = "i2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -460,11 +460,11 @@ i2c2: i2c@13850000 {
 			reg = <0x13850000 0x100>;
 			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c2_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C2_PCLK>;
+			clock-names = "i2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -478,11 +478,11 @@ i2c3: i2c@13860000 {
 			reg = <0x13860000 0x100>;
 			interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c3_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C3_PCLK>;
+			clock-names = "i2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -496,11 +496,11 @@ i2c4: i2c@13870000 {
 			reg = <0x13870000 0x100>;
 			interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c4_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C4_PCLK>;
+			clock-names = "i2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -514,11 +514,11 @@ i2c5: i2c@13880000 {
 			reg = <0x13880000 0x100>;
 			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c5_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C5_PCLK>;
+			clock-names = "i2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -532,11 +532,11 @@ i2c6: i2c@13890000 {
 			reg = <0x13890000 0x100>;
 			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c6_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C6_PCLK>;
+			clock-names = "i2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -550,11 +550,11 @@ hsi2c1: i2c@138a0000 {
 			reg = <0x138a0000 0x1000>;
 			interrupts = <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&hsi2c1_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C1_IPCLK>;
+			clock-names = "hsi2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -568,11 +568,11 @@ hsi2c2: i2c@138b0000 {
 			reg = <0x138b0000 0x1000>;
 			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&hsi2c2_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C2_IPCLK>;
+			clock-names = "hsi2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -586,11 +586,11 @@ hsi2c3: i2c@138c0000 {
 			reg = <0x138c0000 0x1000>;
 			interrupts = <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&hsi2c3_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C3_IPCLK>;
+			clock-names = "hsi2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -604,11 +604,11 @@ i2c7: i2c@138d0000 {
 			reg = <0x138d0000 0x100>;
 			interrupts = <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c7_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C7_PCLK>;
+			clock-names = "i2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -622,11 +622,11 @@ i2c8: i2c@138e0000 {
 			reg = <0x138e0000 0x100>;
 			interrupts = <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&i2c8_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C8_PCLK>;
+			clock-names = "i2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -640,11 +640,11 @@ hsi2c4: i2c@138f0000 {
 			reg = <0x138f0000 0x1000>;
 			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&hsi2c4_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C4_IPCLK>;
+			clock-names = "hsi2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -658,11 +658,11 @@ hsi2c5: i2c@13950000 {
 			reg = <0x13950000 0x1000>;
 			interrupts = <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&hsi2c5_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C5_IPCLK>;
+			clock-names = "hsi2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -676,11 +676,11 @@ hsi2c6: i2c@13960000 {
 			reg = <0x13960000 0x1000>;
 			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
 
-			pinctrl-names = "default";
 			pinctrl-0 = <&hsi2c6_bus>;
+			pinctrl-names = "default";
 
-			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C6_IPCLK>;
+			clock-names = "hsi2c";
 
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -729,11 +729,11 @@ cmu_isp: clock-controller@144d0000 {
 			reg = <0x144d0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "cam", "isp", "vra";
 			clocks = <&oscclk>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_CAM>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_ISP>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_VRA>;
+			clock-names = "oscclk", "cam", "isp", "vra";
 		};
 
 		syscon_cam0: system-controller@144f1040 {
@@ -818,11 +818,11 @@ cmu_dispaud: clock-controller@148d0000 {
 			reg = <0x148d0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "bus", "decon_eclk", "decon_vclk";
 			clocks = <&oscclk>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_BUS>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_ECLK>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_VCLK>;
+			clock-names = "oscclk", "bus", "decon_eclk", "decon_vclk";
 		};
 
 		syscon_disp: system-controller@148f100c {

-- 
2.53.0

