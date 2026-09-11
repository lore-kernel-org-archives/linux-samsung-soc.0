Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B074433BB0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121996; cv=none; b=D+HYfZbCDP0ICkovgwdF4MxkHC1o3Cf7RNhVgn2xtO3mPr0WRInonS8ts7ZNgLAR58aF4u4S/qRDxLn6MSH9fWKkq4BhewS7FqzxKfZaEjmUogD4E3Di3D6+kkko4zEEkHUZlFGXAnWUx3XfU7nrUdMaV/0bg99qAvhcEWzHyw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121996; c=relaxed/simple;
	bh=nl0HsDsR4z58RCd3PnCbvBV/vsEQCHxZmJkbD0eCG3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LL/JC+KfeRyIbpulQWvDwHKhL+AfJJPeocSXd+P/ZwWS1h0cmtwvfw+pScRIamHiL6cCr1AVWhqgRG2zMLJ2mUOC7whyAfD5VFhOQsjH4wPah6icQA6QneBol4nHl1h+rIhMXnBAQjy6l9iztegcTLZo3XvVxmADabUawhScBk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQRfEsWU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5eovcCK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQRfEsWU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5eovcCK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kbDC2831840
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zdo5qj4aLwQQz2BSfiH1l2eNd4aaZgSHVI7lc8DSn8Y=; b=KQRfEsWUgCHNb5A6
	3+dFtT5+gkBwTzwe5bwMGNEEKTfhu2JcFYzDKJjZo6IesrdzE+aO0jpPtLAxoFEg
	EJwQ1mOFtRMdyIUM9v1AWqb20e1QF54tvYVK5fqZFdNS6TW/ROzb/8767KD70Gtt
	qBvoREs608Ox1NyJ77x6yQycPFwL2j4gTbqNWDvIrFDRwOOmDB+hHheCIvan5kr+
	nN5WNEKLAzhdWJgBl4xkDHLIxZTkVEYB6wVX0lWKWRyyTYDfMupB2uZhdqVJOWzS
	Iixi4Jde55ERHUyk/mbbxvnEWKC4Kea0FTCIfpARg0EsZVQyGM/hR33B+4XIftLV
	YF9LUg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfgvpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f946461so138294185a.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 03:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121990; x=1789726790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zdo5qj4aLwQQz2BSfiH1l2eNd4aaZgSHVI7lc8DSn8Y=;
        b=P5eovcCKOFWO98AgjS+J8TolqM1gW9vxxOb23PPePLaL2cOJ/ntqh97ckiMUZlTt+T
         SwM61LLfMELgmV5DvZryS79pNeJrA9MvV5Z34olC1at379M4CK3SRVQZvYQNTqTWx4ZZ
         fNht2h8MKE1bE8+/IlGv8FYjSUjfunhhJ1Wyglu0jKoFJL0CQ1jxGg4wB/LvMUJZeXME
         aP6cgQbUns6MPN8h0hrvugjH6BwKrEQnymqfccA5UPVK4/Rk0dAyQGAWRwulL2RTDkDq
         au7cdvEvO1a0pDGyE5Xjiz48dNnjoSAlRyuiDitNc7H4kdV23vNKws07kz01Lc/NV3q+
         2Ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121990; x=1789726790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdo5qj4aLwQQz2BSfiH1l2eNd4aaZgSHVI7lc8DSn8Y=;
        b=AcrhNjAvYxD5bS+JrieYTw0/FISuZmwbk4Fw7n6wmOcpETh+mYXJUl/uv8/YEZW2km
         IrrEAt3HwUtPLPukuCKkOSIXW5rw34bVulg/pKlowga1n2SGV4oUsXQqOjePT2Jp/U9e
         HPofksnrrVrNlB4NWCdDnGQARqgm3eLlFUFVyl3SGgcM/AOeou4Yn/nDVJUind8uMMik
         wK1ausDHcT5i3uB9BkHEPC7VpIX61x0tQzl3flkXOnIyKURxk8G21JJxq+TLs2jhSs+z
         j5NdyBpBF9lepRKOs4Tf8YDw8Kmlas42H0BYEnfBr+JM84+JL7kXcdsI6hZaWxaSt4J/
         TnvA==
X-Forwarded-Encrypted: i=1; AKwUvBxXtqbUQ7OTI1aeLAI2grgcVFsKkwvbelwlKMncTFYdLKMFvvt8m8tfpcWownUOV7CdGRBa7sWQxiKcr/kja4oxMw==@vger.kernel.org
X-Gm-Message-State: AFuF++n4JYkD0CBCjHNUBiUhvF//aEpxlVuwX0MI2SGSZrWNOXPQjpPN
	12lMUG/sjbx5HyjpjiYi5J5pCf+cIzBTL25IPDyN3IyhUAGe5wENnYMi5T5ZOc+6vOg/iKgXTcG
	cs14lJqOg1LmOlicmIuGmMtim6pA7Lc9PTArD+T9oZc5VkzlWVW3HinZECUEkSiIxB/mYDEmH8w
	==
X-Gm-Gg: AYBFou19I/hINZ1fI9FUUEcLexLJqI19GsLgA8nxH8UjX0zib/NEXwjvQZtGSFJyXCs
	9HxgD3+ZcdLYhej1Zy39Q38gL7bmc+5qrUHkTd3qVJtWjgGnbrpj82U4+VlCfdxD5hCvC1scOhQ
	FEb93peDh7A6ImG6vOx4Q7iCAUuOkpMnNCRWhsmYmKcPF/C1oaQoKa9gO6B33+8N2zeZSXLFm0G
	PU/1ekfX2MNV6OLXtWP2BilhkyYBewNvoYRl61YNKyCAjYyqtHRH/MVp2K+mkI7+pxQAQTN4d7Q
	4Qi5+Zg9XJklQts8JwjkPXegMptiwt+HpAGTSGkdDK6MpMp2RpFYIm1zGF7bEywgTTKgTe3oNE0
	PIAIPscrJHay6uLEjY3nLaFM=
X-Received: by 2002:a05:620a:28d4:b0:936:8840:427f with SMTP id af79cd13be357-939ea037c44mr407784085a.4.1789121990293;
        Fri, 11 Sep 2026 03:19:50 -0700 (PDT)
X-Received: by 2002:a05:620a:28d4:b0:936:8840:427f with SMTP id af79cd13be357-939ea037c44mr407780285a.4.1789121989805;
        Fri, 11 Sep 2026 03:19:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:16 +0200
Subject: [PATCH 08/10] arm64: dts: exynos5433: Re-order nodes to match
 coding style
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-8-9aa55051c42b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6620;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nl0HsDsR4z58RCd3PnCbvBV/vsEQCHxZmJkbD0eCG3I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WtWR/YT6ut7t8VgTBvB6pfMZIiGK3gB7JX3
 kTN6OuAVfSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVrQAKCRDBN2bmhouD
 10uZD/4+lZ4UcI+YR1b9Lj/AVFmQwwkozDm4YW6iVy0Ucu7IFDVb6wCspf8Zld1q1N8Z+ZNPxxh
 B9T7jVP030GDR7qRhENnyUjmGXIQS19T64n9iRHjsejedaU+UONjnASpbX2RTV8qQip3GJ6kxpQ
 QKSoKheWYTMhQgNepo5ayaN9W6cnOK8xwB2Uzh9AhktqeM13omB0rCh7pswg2a/+8Z8MtReOjxp
 nl033mLFM+bYuB6JLTc540aj7rquf4upWgBMxKZukN6EtA2lOw97zScX/Ba5QYR0BBwiMcSg3Aw
 bvzJPbD922v+XPCYmkoptKFKKHavfwHDN/Hrdgkeclbv10rLD6fVJeAM/RnFMn/GEMoyTI+a0H0
 il2zcSErjHG4vWt3Hpgn56xFzni0FHGamh0yGwTno54ed1OPRDWPuLVJnGcnKqhb1RmDTlIxHcK
 I0Py6xekmAkOIanRRgeFAIj9BG67nTW99ZiuuTOnm8OyF++rgzp1TkYRMxhIIj6SUjFr0+XPjfY
 iyBx4DcxsxRfafCdkDyAOHX/IGQ7GNigdImes1wu7e4C8v7FTK7pZ9zhucVB2lQtc6ucTvL3/yV
 NnB7nTm2islI4n1k4OyNXcp9RDgGbhpSiZTxUEIRvSjNV2JTe6e44xLC0MMchXqZj8K5EL7rsy3
 ZJUAqfeAF8KbjRg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXy+jyGhkfZ09o
 kFGyvkRJyi0BsNLI71XKx81s7m4TZvySG8vkmPzs7QSEDBJ2IwnJLBvecAI5D6Lw0RmpTLq7sni
 BCjz3JyRi3BMFho6i+PsHrvDbxzqyfSd7DlcS56XmXHLdsNQKCeyAS/HIXcne1igbmQNpBxpj4B
 eCIvo3w56mzIUMold4k5bvE8u+O+twYAPi4iR19soDvYg7TVz8H7RVP4PHTojcKyKw0xSRIyrSC
 iwc4XyI05FmVT82nRzKXwK+obUTNJDLDL7hqegOb9QANp6VWmOJEpAHHhkfc1Zd0wgrdZdYjKMn
 DF6Je2hwAjuqMNy9dNDUwGLpcUAmzWbaTf8F27tZMLdVpGT//+k1v+g1rxpOmI8PkM4Nb93jaZe
 jCgCtt34Nn/QEUzM8np5FqhA8jv8sUgAHGJQyWWyV9drd9N35R/mWgKG7UrJjh9ar+fDDc68Gj1
 50QWT58+H2/G1NTUbeA==
X-Proofpoint-GUID: AlWtXk4AZ9TVmI5i37sVfmf4uhvdGJD3
X-Proofpoint-ORIG-GUID: AlWtXk4AZ9TVmI5i37sVfmf4uhvdGJD3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXxABOdilsnLTC
 +ApGHPCzb4PKIGruH3V8Uh+LLJN2zmh2R5XEdUjTcizQkfj5ShKl4J9ycCa3lU+yv7Xlcfa1J0n
 dPwOFaP49/r/ruWmNexctHBBmOBUo7g=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa3d5c6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ycHTqKVFhA26NmRza4AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143

Re-order a few nodes to match coding style - ordering by the name, as
pointed out by dt-check-style, e.g.:

  gs101.dtsi:476: [child-name-order] child node 'ect' out of name order
  gs101.dtsi:479: [child-name-order] child node 'clock-1' out of name order

While moving the lines, move also linux,code to the end to follow convention.

This is not complete re-ordering of all nodes and children of "soc" node
are left as is.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  28 ++---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 132 ++++++++++-----------
 2 files changed, 80 insertions(+), 80 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 0ad02a098765..a85afdde9c41 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -56,6 +56,13 @@ memory@20000000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
+		homepage-key {
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+			label = "homepage key";
+			debounce-interval = <10>;
+			linux,code = <KEY_MENU>;
+		};
+
 		power-key {
 			gpios = <&gpa2 7 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
@@ -76,13 +83,6 @@ volume-down-key {
 			label = "volume-down key";
 			debounce-interval = <10>;
 		};
-
-		homepage-key {
-			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_MENU>;
-			label = "homepage key";
-			debounce-interval = <10>;
-		};
 	};
 
 	i2c_max98504: i2c-13 {
@@ -103,13 +103,6 @@ max98504: amplifier@31 {
 		};
 	};
 
-	vph_pwr_regulator: regulator-vph-pwr {
-		compatible = "regulator-fixed";
-		regulator-name = "VPH_PWR";
-		regulator-min-microvolt = <4200000>;
-		regulator-max-microvolt = <4200000>;
-	};
-
 	irda_regulator: regulator-irda {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -117,6 +110,13 @@ irda_regulator: regulator-irda {
 		regulator-name = "irda_regulator";
 	};
 
+	vph_pwr_regulator: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VPH_PWR";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+	};
+
 	sound {
 		compatible = "samsung,tm2-audio";
 		audio-codec = <&wm5110>, <&hdmi>;
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index d318c87effaa..3e67d9091a19 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -90,72 +90,6 @@ core3 {
 			};
 		};
 
-		cpu0: cpu@100 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			enable-method = "psci";
-			reg = <0x100>;
-			clocks = <&cmu_apollo CLK_SCLK_APOLLO>;
-			clock-names = "apolloclk";
-			operating-points-v2 = <&cluster_a53_opp_table>;
-			#cooling-cells = <2>;
-			i-cache-size = <0x8000>;
-			i-cache-line-size = <64>;
-			i-cache-sets = <256>;
-			d-cache-size = <0x8000>;
-			d-cache-line-size = <64>;
-			d-cache-sets = <128>;
-			next-level-cache = <&cluster_a53_l2>;
-		};
-
-		cpu1: cpu@101 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			enable-method = "psci";
-			reg = <0x101>;
-			operating-points-v2 = <&cluster_a53_opp_table>;
-			#cooling-cells = <2>;
-			i-cache-size = <0x8000>;
-			i-cache-line-size = <64>;
-			i-cache-sets = <256>;
-			d-cache-size = <0x8000>;
-			d-cache-line-size = <64>;
-			d-cache-sets = <128>;
-			next-level-cache = <&cluster_a53_l2>;
-		};
-
-		cpu2: cpu@102 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			enable-method = "psci";
-			reg = <0x102>;
-			operating-points-v2 = <&cluster_a53_opp_table>;
-			#cooling-cells = <2>;
-			i-cache-size = <0x8000>;
-			i-cache-line-size = <64>;
-			i-cache-sets = <256>;
-			d-cache-size = <0x8000>;
-			d-cache-line-size = <64>;
-			d-cache-sets = <128>;
-			next-level-cache = <&cluster_a53_l2>;
-		};
-
-		cpu3: cpu@103 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53";
-			enable-method = "psci";
-			reg = <0x103>;
-			operating-points-v2 = <&cluster_a53_opp_table>;
-			#cooling-cells = <2>;
-			i-cache-size = <0x8000>;
-			i-cache-line-size = <64>;
-			i-cache-sets = <256>;
-			d-cache-size = <0x8000>;
-			d-cache-line-size = <64>;
-			d-cache-sets = <128>;
-			next-level-cache = <&cluster_a53_l2>;
-		};
-
 		cpu4: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
@@ -222,6 +156,72 @@ cpu7: cpu@3 {
 			next-level-cache = <&cluster_a57_l2>;
 		};
 
+		cpu0: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x100>;
+			enable-method = "psci";
+			clocks = <&cmu_apollo CLK_SCLK_APOLLO>;
+			clock-names = "apolloclk";
+			operating-points-v2 = <&cluster_a53_opp_table>;
+			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&cluster_a53_l2>;
+		};
+
+		cpu1: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x101>;
+			enable-method = "psci";
+			operating-points-v2 = <&cluster_a53_opp_table>;
+			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&cluster_a53_l2>;
+		};
+
+		cpu2: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x102>;
+			enable-method = "psci";
+			operating-points-v2 = <&cluster_a53_opp_table>;
+			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&cluster_a53_l2>;
+		};
+
+		cpu3: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x103>;
+			enable-method = "psci";
+			operating-points-v2 = <&cluster_a53_opp_table>;
+			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&cluster_a53_l2>;
+		};
+
 		cluster_a57_l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;

-- 
2.53.0

