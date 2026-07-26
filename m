Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E085F3D649C
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087852; cv=none; b=Q5x/31OQv/k9g/hyaH4TjK1r4uZTTmM037WV1oQ4O8TeykuqrvqaBOXuDvugjsIsWh4CE+dNTVNmVutGOgWvTDvRIJmTamiP6Rftc14BPLHUnyUNUk2LPs3ih3X6uvrxCbNcEWXsWMERC7g762SgcaZ0/j7bw1UatjJp5QGqYWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087852; c=relaxed/simple;
	bh=+BnnarzXgrjvsWGAIfKXHLhwNzJRyL+7qFo71+EihXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j1W8mHYgCwGKByYktWNHUz1EIkItGnZnx58wkZa/mXLXB25xn0xZeAbPJ/9H7VQXwVjUIfR/2yt6NbifxxsZ8z7IGV34diVxdFy0H2ztsLg0EA0ANO1cdiFUKfcfg8Gp5azhk89I6VsVbtaVv+Wk9R8DG8iyjzfL4dmP+XtewLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqXhuqEQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMObIfqT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqXhuqEQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMObIfqT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH7UZe1127155
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRPRpR/UEXvdQsqUEO5zDwx48+Dmt+GyHSlx+q/gcro=; b=CqXhuqEQlWxLy5Ia
	/+vkEyIpWGvhqVFgHgsnbrbNvyc+Qw2SX8ro+ldlDeJUnEOzvwbmO+HLgX4W7FeG
	JKt3rS35KvNXxMq00Gg+xWU3UgbqvcFZNY0um+6is+lGNuPDi0eLhyQFd0RiDQlV
	d7VXvg7NuC8AKjkkjnpTiPPtDuI4qwxEVI8AuClSkP+ELDq91NCjLrRE9kaS5GGL
	YvqicXTVJr3ecUZn0XsFQph4lS2RDTSUlrq/Hn4F2fhswxKzRMZf+aHUgC042a2R
	eKjpIjjlFUGRD0t8D4ZR3BIz+rSRvTHcfLiuIgqrOejuGPyvF43Cf/agLKHdUd1g
	6hMShQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnweua9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:44:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so45539561cf.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 10:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087849; x=1785692649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRPRpR/UEXvdQsqUEO5zDwx48+Dmt+GyHSlx+q/gcro=;
        b=XMObIfqTw5TE29KCVBv7Ra4njX9jZgEJUC44J/7N0pvTF1AXqrWgmPJ6fK5NXVdZuF
         5+po8RdZyGh+VYvYu2uzZ3Emw48CUEf15owm20AIMQ2fTSRaH2vt7hoO0mKiJC5J0jP5
         tuwWKzv0wxrpgKzz5jMPTcEUFHebc5SazUzuE5alb/Qa80cZOxjJUVtTIqx4AF2qFRK2
         X1s7hkmazskshwiZooFeZH5Qqr3/u0h3+Y48+7vAW60qIWa58WOgYtKs7OlKBzsS/IBw
         to/gaDvmC9k9fi0EQ2bc4WJ8hAM38AaLRat5JMSZGvalKXVi8lcU6hZlrOgMAq32vKyn
         nC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087849; x=1785692649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wRPRpR/UEXvdQsqUEO5zDwx48+Dmt+GyHSlx+q/gcro=;
        b=AYl1LQ2G1MhzooJrokXrBUWMgM9hCATmDtDT86gSA974FSOXLnlvcU9zkSW0jdNepQ
         xfH2LhwjZ3bM0izFKSgv9FDZx3TAC9R3HJIgsvLtTp2CIjvXyUE54HsWVeD4RMNxDk/5
         t5CnUDTe9lVI685iGxuAinpmjFCDaWdEGgRHzdoNTGPBDTODru2+CbLmbrMlfeI5NBgs
         gvmYB38f7YQK71AIM4/RPlqAFm9YAsMTO8PapsWNiwYZjjmfVkeYAWX7HOZG9XD94QW3
         hKuYzu1dyeK2a+z0ENdzFL8/lPdy/xOHd8xMIIIR+vSIuHMWJOit2dMu8Z2q4BHBWv/B
         zoAA==
X-Forwarded-Encrypted: i=1; AHgh+RpuTlx4hJO9t4I1CZTWN+SVjp9b8V7lZzWkDjfwEwlhwhyUe0Pn2Pl5dl0I2rk0RpGwMUPqQRt2HaQPziVnKHrspQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxw4PpFge1uKEHaBBDlsrILU3Cw8ncfOQgBoZ1nL/O7DCO6+qq
	dA7KwmxctKEmi9oWylxjsd+flAJwK1laFiYJNOy5dnocKUDnrItfrD1kSW72H13b9+cAJg07W4G
	ApAo5vje+XgNG3VBjzEZlT29AKYgKmdtR6On7QieCxe9cVsrGcPsnglYB2lA1gc8bnzXNvHTZbw
	==
X-Gm-Gg: AR+sD12MKZlx9sur6/Y4kKR2lQAnodvjBeJhgfGN9PnLSK7pT9b+tJxeLx/f8/ICWPD
	+6R/1dqzZMPN+M5RBkN+4enoQjoMhllQIiyue0V7avCFEhBKCt/XZN9BxL/HBNJZ4xa4nvgOCX3
	lqXHCRS+Zqj7tilBWmf39kJUpSN7EtJ191GJcnR0qhzK7FqnpIH7Hnk0QRbXcJwv9RFL8fLHO/3
	NEhX2TuXlhvEe+bZ3cuFEw/T76UpbTalL1hCtgXnblO58h+nbpg7Ro9hiJUBdF/k+UVWW0titol
	wD5p9+tpkHffBYDRNl08imV6ZeDdCuNwDvaJPYUT8AdKX8o66Rze5eERcg4HFsIAEPCTxm3ezyL
	1Ub61emRfgmh5zsLAwizZm9wt
X-Received: by 2002:ac8:7d05:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-529a8382195mr63709211cf.11.1785087849092;
        Sun, 26 Jul 2026 10:44:09 -0700 (PDT)
X-Received: by 2002:ac8:7d05:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-529a8382195mr63708911cf.11.1785087848671;
        Sun, 26 Jul 2026 10:44:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:44:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 19:43:41 +0200
Subject: [PATCH 8/8] arm64: dts: fsd: Align continued properties and add
 missing blank lines
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-dts-coding-style-strict-v1-8-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7689;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+BnnarzXgrjvsWGAIfKXHLhwNzJRyL+7qFo71+EihXM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdPGk3UP3dnXxfQH0P5ccJD9cIkkCbqGt2zO
 y/Vn1do+42JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHTwAKCRDBN2bmhouD
 1yH9D/0YgFHyXtxGmIX11k3wKs/H6eZFBi/snTzlh8GGh56dC7zO49DUHWd/P7zZwBKUxHe/qhR
 00xo7fLp9VH4NyPmaUqE5Sgjond/tXhbOYWuwsCDix7wH3UAhwgVQRTzsaLJUx3J9IilG6G92Lw
 84G0eZnlOJYRwZJTfrA5amp5IW0uC6QoPnxVjhO9+DKpj8Cz6TrkmGdgLkk7nx2O45lsxfoQoi0
 FK6bB0FoPgfwkJ+qRfdShuEv2SeEbEd6LHPCFKEc86JhBtV+W4TK8NgCavgig+uq8f2ZIUVnwvB
 Pl3JoLvLN6LFyMPwP4E3B0+SrMYc2Jj1znHcOjiRjEMGnllnvirT6FueBtn1F49q6uE9OH4T9ju
 JSbmc6AB2EDRzc3h5a88BZgOQNu5pn4atnKbPqnKkwF62erEMYZCeqVcfO3GjvFb3AdnlQQG/oR
 nqvva6GEiUKWS80Z6LmiQXK/yVPtqwbbinTz8z4yWGwOiSZO/YenVR2ez51qqV8KjAfmfEZGIkX
 ZZiMYXw1KxBKv31n8PBmhLZm0rDERasDe1X+QvsqvOFyz6SAo2HqHNrR0P7+u/HFGwYzIZiu0Gg
 vwb9DnVYP30BwEnVPzRhXxbThopKN6quFpjerAFiAaThrwi7eVxl6d+V4HcVWrPrxCgOsdMq99Q
 syJrQH/O0HCcZwQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX83Am3Cptic3K
 5EZCf0L/5S6o8U6ofKmIjlALM9zMQ36xs4eYS3MbDGZhxPTRVlDrssmlbCZCu9dqVUiaY7DCxXf
 idUyW3euWBUVgfEy9DPv4ufy4UYmlJ468H08/gMqKoDiV8WJyZsjn6HUpzZCVG/sx1ocrtYvbWO
 Vm0nZwO8YmOfWpSI9L+rOsfJEVFZWAZ0PhiTFeBeqccgjDq+XKQpg1nYwvJ+4HV1Y3K8cHcwC0S
 2VixF7VaUczSEAgViBz+aoaDehRQAZ3RWeEYBOlyorOLeuB883+fImF0e2L93QdvwYQ1ETLxHFZ
 WHy7oH5sJtvApB8zW31w1a6h/sQqwMXHhxEPNEDCVwmnIGn2wlw76icRCFTwX4xS/qCHzzvje31
 UrRqF7TLTbcszCdnd1skC9JkuoBvl7aAy/DMdYn/B8LLV90jOoefHcc4FgJUol93lbsgQGQA+mq
 JQ5hTVRKzO7gPlbpY5A==
X-Proofpoint-GUID: fQtJhSTKQKeOmiojIZmwWWVwx9tNo7T-
X-Authority-Analysis: v=2.4 cv=S77pBosP c=1 sm=1 tr=0 ts=6a66476a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dn6OTeshHBKSxJNNhkUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: fQtJhSTKQKeOmiojIZmwWWVwx9tNo7T-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX+F5lSQ5WBIbI
 eQnqk/ksQfg+F8a7MS6Q5ed5m9GepxP7cBOfDcpor2dwFchlUeFSM9RIHcAtsviBMcoAb/ofNL6
 BlnXgGBwXa8gyvVVwaQHyQdxmzAg/+A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179

Trivial white-space only changes to adjust to DTS coding style and fix
dt-check-style strict warnings like:

  [required-blank-lines] child node must be preceded by a blank line
  [continuation-alignment] continuation should align to column 39 (under < or ")

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts |  2 +
 arch/arm64/boot/dts/tesla/fsd.dtsi    | 97 +++++++++++++++++++----------------
 2 files changed, 55 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 73b6a25e0e4d..503abe52a81c 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -53,9 +53,11 @@ simple-audio-card,dai-link@0 {
 			cpu-0 {
 				sound-dai = <&i2s_0 0>;
 			};
+
 			cpu-1 {
 				sound-dai = <&i2s_0 1>;
 			};
+
 			codec {
 				sound-dai = <&tlv320aic3x>;
 				system-clock-frequency = <33000000>;
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 214d33ca7177..6766c78243a3 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -43,12 +43,15 @@ cluster0 {
 				core0 {
 					cpu = <&cpucl0_0>;
 				};
+
 				core1 {
 					cpu = <&cpucl0_1>;
 				};
+
 				core2 {
 					cpu = <&cpucl0_2>;
 				};
+
 				core3 {
 					cpu = <&cpucl0_3>;
 				};
@@ -58,12 +61,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpucl1_0>;
 				};
+
 				core1 {
 					cpu = <&cpucl1_1>;
 				};
+
 				core2 {
 					cpu = <&cpucl1_2>;
 				};
+
 				core3 {
 					cpu = <&cpucl1_3>;
 				};
@@ -73,12 +79,15 @@ cluster2 {
 				core0 {
 					cpu = <&cpucl2_0>;
 				};
+
 				core1 {
 					cpu = <&cpucl2_1>;
 				};
+
 				core2 {
 					cpu = <&cpucl2_2>;
 				};
+
 				core3 {
 					cpu = <&cpucl2_3>;
 				};
@@ -456,13 +465,13 @@ clock_imem: clock-controller@10010000 {
 			reg = <0x0 0x10010000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
-				<&clock_cmu DOUT_CMU_IMEM_ACLK>,
-				<&clock_cmu DOUT_CMU_IMEM_DMACLK>;
+				 <&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
+				 <&clock_cmu DOUT_CMU_IMEM_ACLK>,
+				 <&clock_cmu DOUT_CMU_IMEM_DMACLK>;
 			clock-names = "fin_pll",
-				"dout_cmu_imem_tcuclk",
-				"dout_cmu_imem_aclk",
-				"dout_cmu_imem_dmaclk";
+				      "dout_cmu_imem_tcuclk",
+				      "dout_cmu_imem_aclk",
+				      "dout_cmu_imem_dmaclk";
 		};
 
 		clock_cmu: clock-controller@11c10000 {
@@ -499,17 +508,17 @@ clock_peric: clock-controller@14010000 {
 			reg = <0x0 0x14010000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_TBUCLK>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED1DIV4_DMACLK>;
+				 <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_TBUCLK>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV4_DMACLK>;
 			clock-names = "fin_pll",
-				"dout_cmu_pll_shared0_div4",
-				"dout_cmu_peric_shared1div36",
-				"dout_cmu_peric_shared0div3_tbuclk",
-				"dout_cmu_peric_shared0div20",
-				"dout_cmu_peric_shared1div4_dmaclk";
+				      "dout_cmu_pll_shared0_div4",
+				      "dout_cmu_peric_shared1div36",
+				      "dout_cmu_peric_shared0div3_tbuclk",
+				      "dout_cmu_peric_shared0div20",
+				      "dout_cmu_peric_shared1div4_dmaclk";
 		};
 
 		sysreg_peric: system-controller@14030000 {
@@ -522,13 +531,13 @@ clock_fsys0: clock-controller@15010000 {
 			reg = <0x0 0x15010000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
-				<&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
-				<&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
+				 <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
+				 <&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
+				 <&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
 			clock-names = "fin_pll",
-				"dout_cmu_pll_shared0_div6",
-				"dout_cmu_fsys0_shared1div4",
-				"dout_cmu_fsys0_shared0div4";
+				      "dout_cmu_pll_shared0_div6",
+				      "dout_cmu_fsys0_shared1div4",
+				      "dout_cmu_fsys0_shared0div4";
 		};
 
 		sysreg_fsys0: system-controller@15030000 {
@@ -541,11 +550,11 @@ clock_fsys1: clock-controller@16810000 {
 			reg = <0x0 0x16810000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
-				<&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
+				 <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
+				 <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
 			clock-names = "fin_pll",
-				"dout_cmu_fsys1_shared0div8",
-				"dout_cmu_fsys1_shared0div4";
+				      "dout_cmu_fsys1_shared0div8",
+				      "dout_cmu_fsys1_shared0div4";
 		};
 
 		sysreg_fsys1: system-controller@16830000 {
@@ -921,7 +930,7 @@ spi_0: spi@14140000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clock_peric PERIC_PCLK_SPI0>,
-				<&clock_peric PERIC_SCLK_SPI0>;
+				 <&clock_peric PERIC_SCLK_SPI0>;
 			clock-names = "spi", "spi_busclk0";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -940,7 +949,7 @@ spi_1: spi@14150000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clock_peric PERIC_PCLK_SPI1>,
-				<&clock_peric PERIC_SCLK_SPI1>;
+				 <&clock_peric PERIC_SCLK_SPI1>;
 			clock-names = "spi", "spi_busclk0";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -959,7 +968,7 @@ spi_2: spi@14160000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clock_peric PERIC_PCLK_SPI2>,
-				<&clock_peric PERIC_SCLK_SPI2>;
+				 <&clock_peric PERIC_SCLK_SPI2>;
 			clock-names = "spi", "spi_busclk0";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -973,21 +982,21 @@ timer@10040000 {
 			compatible = "tesla,fsd-mct", "samsung,exynos4210-mct";
 			reg = <0x0 0x10040000 0x0 0x800>;
 			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&fin_pll>, <&clock_imem IMEM_MCT_PCLK>;
 			clock-names = "fin_pll", "mct";
 		};

-- 
2.53.0

