Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB78431A51
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121984; cv=none; b=bY6pzIUgxPbrTJ1Hd2tmtoXvcgRXrMFb7HBR5/Ahyb1dtITukAK75WcGFcIAtS6eUJGxnDzfmsYIL4izutoh/i4LsLx9WKlRI1Nmz+0H4LEJlg8leCrmubrkPx2aSw9NlgHlGPL8OZCjB8PG7KAgCYOZ+kPVse+7kYy1mgEOCM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121984; c=relaxed/simple;
	bh=eKXb5e/GoIqEqZ5JTps8oPDIwB3lwsZ0TqnBeUjcqI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilTHP+yA3xbnEX21F6d+DetMcNFpeJoO7of3koW19AYfsk4xnaO9lfzyeYR9DmG3m4K8FTpT3szIt8txkgdgSBcvYAGCYcA54GQuBBYjkNFyNR/r8liRitGYmbuVW9a2GQ4ATULL7tgeY6VEMhmwWOpEfxLBCO4OIj6Jfsl54pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jbw5XSjL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQ7t9qaZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jbw5XSjL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQ7t9qaZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B9mX4t3292278
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tFjJDfmrsxdnQqiLVZtefGaveMYN9Z9i/ZNKa5TpjG0=; b=Jbw5XSjLuJRj9l1j
	dPwht7x91STljWFG6UtOo10tv+iwQc4xfYokrTM/hEMZzxzzFa95eCOCo0dsKe6/
	DiVfQlVRkQUz9VA7dsDghlV6+LjsiPBupIjoga6Y+UlBw/cUJxRq7NLAiDSYwHGp
	gNtZBkinibUq40O2PV/nmO5CVzWyvtAzYA5ypRIfoQ/H+3lmDxmtBhexk4c9AfVq
	4iaz+mm4GX9DTG86DqKLkAdeQ8Wsw+VJ7C8EpCkgokhRwa8XNMb2qLB7pHbRTrqx
	/ac8Cwh4OmZm5SErUEt9kcDFDRNBDG4cNB3oPiIvJfeRGsIjhbelq9KuhbKC7FKT
	7UoN7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbg3vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930b571432fso153310385a.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121980; x=1789726780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFjJDfmrsxdnQqiLVZtefGaveMYN9Z9i/ZNKa5TpjG0=;
        b=FQ7t9qaZsVZmP1O7k0z2Ckuz50UKiNiNZOfqMT85qsgtRJ1kxuOlr1H8QLRzbf6en2
         RqRVx4b2BpedofvVfbRs+KhkFPMf6Px14COu/2TB0QVvfLFHmAS+pk/fl5tmnULP9HHY
         1xLqNbQt2Xm5Aw47jbMAhO6mkOmxdIOaAUKjQCqwsEkZFED0HA0VNiA6UeyQgdGoa9Y/
         YxnICdpYc+cjOfpO9oyxHXQTJJh5+oI4HhHMUtolfHMuZMh/yrH2V6WhTR1/BQ/NZG9f
         pBBK68ostwNTnAiRVgPHS2vo0JG3xfEXK2VD6dzwJuPAPFJfRwjcryARq2AO8YxLRIl/
         f6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121980; x=1789726780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFjJDfmrsxdnQqiLVZtefGaveMYN9Z9i/ZNKa5TpjG0=;
        b=a7Mr93+WJBXaF0gk2YDhKl3OLt9Y/rKDO8N9kNDPy2mXZ+vZSa/L5QoDBCYSbgf5a1
         6KlB4f+JaqGF5NWNFZfUGhhM+IPynMcKTAvE+zSIjOsGmcCxblB5k3rE+qFV2lBpUE6J
         QedpyiObQQ9ohW0D3iGb0GdaSplc+bL4CXd5rGW03jWIGotG7J/nio0qAvH1rgHE4HhP
         YTPwLuUs+Oqt+ScanceqnX9EAVaAVbU4c1JHo6WlNTL1opctfq1APWUGW3j3AXLtKkob
         SZFe1Bxvk+u79MropPgArEM0ojOrUX8ORlEYxSNDcjneeqIq1NeBhLbEf9/xYIl3BX/w
         +9mQ==
X-Forwarded-Encrypted: i=1; AKwUvBx43O6SuQ1JLya8a8hBuMlthcxCqlv3aBnv1i6LRjEeNsj8O7IFPVWmHi9n05m/iASZrEt7YV+TQXx/2Kci42oXmg==@vger.kernel.org
X-Gm-Message-State: AFuF++k0MS63b6Xx5fF+inPYvvZNf7U7UL6RBgI/jlbMnvVu963jwlEo
	XKXKoZMNF+yG2F776C55ynYiH+MhquQYM+L/Y91SGRO6aX0Enw1qqB/ViKFtRfRK4gCi+fNA3YQ
	ENHVMivmo1mQRkEXONbBeJUWXiWKCnEDI6IGL2kE02F/6QyH8bx5jksnOF6Yn4O2ex7n1FhnNxA
	==
X-Gm-Gg: AYBFou0KhwVD/RNg50xNEZUf3zg1OYJiDsREax85LqXIYjGN9JY5Gv9Rmo6o14CHQao
	ifDvV3+q2Ip45BjMf1qqg4OqN36YmQNDG0FEekhiUTz5tYG37KqvlhV+8nWVC5wHhomN91vVLIz
	I7fZPuzI1hb7u3uXKZuzzQiHVV7nm1kB0jyRIP8uMvDGBjqxg8AiQiHoNHcDqpXQZVeKLzmeYCG
	Dwd3L+C3lLVl0ailm4qguMhKXzOORJiLDAF55XpzCi1huw4PXhTW33DF+Y0zchH07ziZdTAYAIa
	j6f5nFo4Du3Ahi62VIsp99xoW6C3M9TuBOXNjqGRPFCVLzBXLFdT20CNatEiJMlRYBJZHCtxPwU
	gFvmEZTRa/8hkmOUo+BSV8Xo=
X-Received: by 2002:a05:620a:27cb:b0:939:a5a0:4a08 with SMTP id af79cd13be357-939d7e415e5mr995559485a.8.1789121979648;
        Fri, 11 Sep 2026 03:19:39 -0700 (PDT)
X-Received: by 2002:a05:620a:27cb:b0:939:a5a0:4a08 with SMTP id af79cd13be357-939d7e415e5mr995555685a.8.1789121979155;
        Fri, 11 Sep 2026 03:19:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:11 +0200
Subject: [PATCH 03/10] arm64: dts: exynos: gs101: Re-order properties to
 match coding style
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-3-9aa55051c42b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5157;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eKXb5e/GoIqEqZ5JTps8oPDIwB3lwsZ0TqnBeUjcqI8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WpU6xEGkGCHXzLtJ2sNR7TqoDM9Fdc1vC/6
 e9p1l+YipCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVqQAKCRDBN2bmhouD
 11KlD/9WSUIupc21oazuvJnXtwPtUaJy4mckG5dc0xZxZC7cA2tYmTEmUFu7mtP0E0z4WZQ/u6Q
 Oz2THHY5nIvRlPX0TijCJL1fGuzeSQ7p4IO0xwFUlnSiY5d8JiBvFwwtC2+vqPji5W89AkRzncx
 f0gpySSnFhXhJ5SchywRJ6cbsbAAq4TBUXkt9rctEKGmxKJToO43DfflrK2qsjq2OK+QV9WWV1C
 2RC0PN4sq9Bhzxz2SqLNzYvVcVKmQdjeoO27sCyVrsmhwgqqGc8qzmafko9lSPB/dv6l5KTu0Ks
 W0IT5B3Dl3WhelLhcSwdOKRldI3MCNRpyBJPMQc5k10JFZZ2DVZfP3GCp8e/WuOORRYcgXYKIXt
 ZL/QMmqmPqc1TEzR9qxH56hy2fqXgVizjC6V6DY+d1phYyxP5rxYgaYWUytLajqOVnXZknF3MJT
 5veoAnyI5F63y+76IgOqHh9q1euCqsRP7vMkTNaoc/Sprz32OpLCXL6i4iPwBu11+1HEEPMYQiS
 ZuEcuGJw5MnqSN6RVj2EvPMzbrD89KTYasuD0Kn4LCCq8iwKg8Wq5KTcuyvwj/4v88zDxtCZG4S
 Sav41v4TkKckGHBqg7uMGAeSluGol2ciKkZwJJR/wYyBDjeH0zeXFwa1TPXPzL6RCUOFgexs6CJ
 cT8o7CaeIm5DdHw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 61erTvwieX7Dp2-Vr99n0RS1juiZ3Z3b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX1J48jTj+JnOF
 Ohyd5RWCx4ETe7Vlddj/RUGo0j+GgPUL2FLsfkFEvUFl1WW21Ormxbztz0PASg6VaMwaXcYrCJJ
 o+D8qZBTN2k/2ub7cE1bOt/dH3mr4psg1hTCbE497+0k0odpVfGk31r9Zhf843HzuAQuVWDRZH5
 JyFp9mp6q3rH2Km9cupvpyydQvRZ1cqMeze+SeXVDtLjefryIW/9MxxMDpyzQHkiLJ2b3DKGJIu
 FsuTklTNIgDWGM4xAnR8+FM+IzjuN65GkKmQ+oZrK+RUxTwhrCJo46QE8edH5JuQh98w1nxAw6Q
 qHf2FkUu+/5tIKWn9I28iTtzqrg0ZCxbw+kYU7CiTiBWdWiicO4l6czguIRGm9wDFCjqeHgyp7C
 HpxxBGNEgv9kwYzm8qBIUANxqTGbl4GdNila0p5AMeNBkz3kpuLiAYYpghlu0RwAVF3Ki486QJf
 zg8C80DcGcHRvm0s/WA==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa3d5bc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=psW9Pzx8GEe-sCMrYW0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX/LOi9zn+3Hi+
 zYwh6/L/8bHqTuFjxiZz/5r9/92MTtzjwg4iHSlLfQOQUsnMSf1sTjliSywECcgkP6qSxIxZTpi
 xSEhwXXWcaUy+ElCzAo2qI9VKmQb+6A=
X-Proofpoint-ORIG-GUID: 61erTvwieX7Dp2-Vr99n0RS1juiZ3Z3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143

Re-order a few properties to match coding style, as pointed out by
dt-check-style, e.g.:

  gs101.dtsi:178: [property-order] property 'compatible' out of canonical order (should sort before 'idle-state-name')
  gs101.dtsi:530: [property-order] property 'ranges' out of canonical order (should sort before '#size-cells')
  gs101.dtsi:1782: [property-order] property '#phy-cells' out of canonical order (should sort before 'samsung,pmu-syscon')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  8 ++++----
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 24 +++++++++++-----------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index a12f2b88d72d..f14c62c8fec8 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -44,16 +44,16 @@ gpio-keys {
 
 		button-vol-down {
 			label = "KEY_VOLUMEDOWN";
-			linux,code = <KEY_VOLUMEDOWN>;
 			gpios = <&gpa7 3 GPIO_ACTIVE_LOW>;
 			wakeup-source;
+			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
 		button-vol-up {
 			label = "KEY_VOLUMEUP";
-			linux,code = <KEY_VOLUMEUP>;
 			gpios = <&gpa8 1 GPIO_ACTIVE_LOW>;
 			wakeup-source;
+			linux,code = <KEY_VOLUMEUP>;
 		};
 
 		button-power {
@@ -109,8 +109,8 @@ &acpm_ipc {
 	pmic-1 {
 		compatible = "samsung,s2mpg10-pmic";
 		interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int>;
+		pinctrl-names = "default";
 		system-power-controller;
 		wakeup-source;
 
@@ -429,8 +429,8 @@ ldo27m {
 	pmic-2 {
 		compatible = "samsung,s2mpg11-pmic";
 		interrupts-extended = <&gpa0 7 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&sub_pmic_int>;
+		pinctrl-names = "default";
 		wakeup-source;
 
 		vinl1s-supply = <&s2mpg10_buck8m>;
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index bfceea5486f4..1bf59eae9360 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -174,33 +174,33 @@ idle-states {
 			entry-method = "psci";
 
 			ananke_cpu_sleep: cpu-ananke-sleep {
-				idle-state-name = "c2";
 				compatible = "arm,idle-state";
-				arm,psci-suspend-param = <0x0010000>;
+				idle-state-name = "c2";
 				local-timer-stop;
 				entry-latency-us = <70>;
 				exit-latency-us = <160>;
 				min-residency-us = <2000>;
+				arm,psci-suspend-param = <0x0010000>;
 			};
 
 			enyo_cpu_sleep: cpu-enyo-sleep {
-				idle-state-name = "c2";
 				compatible = "arm,idle-state";
-				arm,psci-suspend-param = <0x0010000>;
+				idle-state-name = "c2";
 				local-timer-stop;
 				entry-latency-us = <150>;
 				exit-latency-us = <190>;
 				min-residency-us = <2500>;
+				arm,psci-suspend-param = <0x0010000>;
 			};
 
 			hera_cpu_sleep: cpu-hera-sleep {
-				idle-state-name = "c2";
 				compatible = "arm,idle-state";
-				arm,psci-suspend-param = <0x0010000>;
+				idle-state-name = "c2";
 				local-timer-stop;
 				entry-latency-us = <235>;
 				exit-latency-us = <220>;
 				min-residency-us = <3500>;
+				arm,psci-suspend-param = <0x0010000>;
 			};
 		};
 	};
@@ -525,9 +525,9 @@ psci {
 	};
 
 	reserved_memory: reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges;
 
 		gsa_reserved_protected: gsa@90200000 {
 			reg = <0x0 0x90200000 0x400000>;
@@ -572,9 +572,9 @@ bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
 
 	soc: soc@0 {
 		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x40000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0x0 0x0 0x0 0x40000000>;
 
 		efuse@10000000 {
 			compatible = "google,gs101-otp";
@@ -657,11 +657,11 @@ trng: rng@10141400 {
 
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
+			reg = <0x10400000 0x10000>, /* GICD */
+			      <0x10440000 0x100000>;/* GICR * 8 */
 			#address-cells = <0>;
 			#interrupt-cells = <4>;
 			interrupt-controller;
-			reg = <0x10400000 0x10000>, /* GICD */
-			      <0x10440000 0x100000>;/* GICR * 8 */
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
 
 			ppi-partitions {
@@ -1778,10 +1778,10 @@ ufs_0_phy: phy@14704000 {
 			compatible = "google,gs101-ufs-phy";
 			reg = <0x14704000 0x3000>;
 			reg-names = "phy-pma";
-			samsung,pmu-syscon = <&pmu_system_controller>;
 			#phy-cells = <0>;
 			clocks = <&ext_24_5m>;
 			clock-names = "ref_clk";
+			samsung,pmu-syscon = <&pmu_system_controller>;
 
 			status = "disabled";
 		};
@@ -1920,9 +1920,9 @@ cmu_top: clock-controller@1e080000 {
 	apm_sram: sram@2039000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2039000 0x40000>;
+		ranges = <0x0 0x0 0x2039000 0x40000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0x0 0x0 0x2039000 0x40000>;
 	};
 
 	timer {

-- 
2.53.0

