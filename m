Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD4A3E638D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121976; cv=none; b=aqZuRrHeS150Jyu5A8klJO7TtgSzsk4OrLL9pE3AkVjnAhDctAQgS7uwdfNvCU63RagpsW0saIbEuxk+tqjsR1LgqYrB6X661+bOTMJ0LDfqFPG+PBYDmJL5VWImIire9LiFmeKcUHPmfPH3BQDdplcahEOYu9RGs9lbquix7Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121976; c=relaxed/simple;
	bh=/7+9wiOI5IHqlAQwmNyLQEH0oKQcLytjBMp/ZKWGtEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l7x89NNDMOyV7EyyC48RYlGU14oO5XmgP4mZKzFXpAuoOxaOvfDnqtzuGeUoh9IZ4RyJo9KC6it+qpaUIMLuckFz55v2qAhL26ywelz7K7QN5UfUIlHbfYfzPgSvz4w+YsUdAlHWaMry0cZqJLYx/rWaQLtb0qoRPTFEL/Rf3cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owHCw+AZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSgqvUts; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owHCw+AZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSgqvUts"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kn8p143886
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NnYccK3xzr9BQVnInnVflfQ+NjnnOIfuEFeellD6/Po=; b=owHCw+AZw2BYohNM
	sPxCRUNNHLfLg4uqqYHdJecK6IwrSzQl9uJAqQwDZ8F9V3Uf6E0lQ+48lAUuJPzX
	yCmt4WoAVwkgVQtFjDVroZqIER3OTsvZR8sZTNaL6FeRd/94dnHACVJ4CkxMOcXe
	fdfN9l+4jzYT09D5F6Yt4aYr1vRF8ts2UVkdxKAhKa4ZH8vJBNPx7RDMpbRtNZFc
	iENzZ+vu5/Auhv7e5cUNIa4dIIjH0nmjH7LzXPhq+I33pBniKc8T4zpRmEA94vYB
	TudaJYa8p03mYhpKfTpDTw5sO/y1jaOtQgWTzl1oPU5ALMScGioaDcbxcTMQ11Qj
	HOb26w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd395rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 10:19:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903622880so383089685a.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 03:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121973; x=1789726773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NnYccK3xzr9BQVnInnVflfQ+NjnnOIfuEFeellD6/Po=;
        b=RSgqvUtsnc68RcstuION7PdcMNO3FFf96yORSu7kAP0kuZqyhoEABQ7q7IgEs6DOz7
         F0Ppj3PejmQ9iSSCl1S5ce4/aySu0ZztJXUEVvRmMhomtR4ksncx5BbW0uo1cKGtgk6r
         KyfBiHqnJGGg69la9wLsuvJtmT5wXGd+h/LUV9XRfvdYt1BUf2ZshSoUY0l2VYW33T81
         AkXtj7imRxsFXSUlqga/0K3pc/4cdkVqSm240jh9TSKsP6SFKMH1v+KuOd43Vy4JOlCl
         UYQVID9SiZKKFUISZNTp0p3G5HHl5F4WHc5ffWJiwRZKJ95SGMhxiUeH96xxzWqNbqfT
         ZHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121973; x=1789726773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnYccK3xzr9BQVnInnVflfQ+NjnnOIfuEFeellD6/Po=;
        b=Aa99ID9AiLo1MgrMxrS4cKqO/JJLvn8mWngmZNkBzMKU93vJ/gFOaWw70pUn43dbft
         ZgxNCLAEGqC7Eh313lmm8W+MaPslgZHA57TtTj4S6MN1o2liQpK/ObADkk/RpayRCeHa
         Hj37T31zk4mgt8dJya4BnEqMcmBQV+zDLJL4UTRnd4xX80noKmXSaicNQZtXpWCDec0W
         cOYwWdJgHJfSYvQ/6MmO3hsVDR/fDMoxmZHXoO4C54Y7TJlGbmYgEEUwPvYJj1P8sszk
         68BR7nsRAIgFwc+m19HfYxu5yd5QKDPTlF+nLG7oKjtZ7La1+GBQg6SdgBkLFtLFY/UL
         QGPg==
X-Forwarded-Encrypted: i=1; AKwUvBzcUZpm+UBKz2Y0VtBk7HlYu6b6P780UW5EI40dIE9X9vYHcm9QuKR8KrLt2cKGBYz6/30346VBj+vFvBZE24PGfA==@vger.kernel.org
X-Gm-Message-State: AFuF++kz5fbcyIXgTfiPUid1SWFud6nDHVDEA2/iEWh+wSY3/Fi3OcRF
	ZvusRTk+3ZKfjDk3sDBjixcWQfMtgMCSzIyHKDiHrXZ85ArFOD7yV4r4Iyzz8nEE4eJXWGzbcGF
	WsOIYBHI0ysgpDqeWRBgbcZTsyV9Zdhye2S80UZmY6oEH1KBO8lPOyVmeXByBHkzMp0YRrNTR6w
	==
X-Gm-Gg: AYBFou2sk/ZqQRsSsopQVGZzLPH8oxrKqIZvYDMoCs0o07tOhZsbuaMJzIRHbcvYD6M
	OVVVi9AZd69ghwbBQFplzY1i0J5zmziCDp77ZFK6nWuliD4JYbTHlBIhHze2CviyzHchzSezXGU
	vG+h4zjNpyuQx5nB/ymFbTZCw2aDrUW0qz70VjxiocZ+Hb6bRwbFuBHzdJ6deq7vjjtKMrTd1yV
	9GX5smFD3KivP6klhJFD10wKUTh/B2sesAai1py2F+SKBvLJnWBQ9hBUTJ6Nki9mfief/5iSZL3
	A1KMD6/hP7juPb8JLJvDwltYA+CX/cKigndSvrexkAXiv6CjFxKvQx9wa3hvu0vFb8JfrgICDVs
	+OsegVtP6kcJTnUDLVGTfbEc=
X-Received: by 2002:a05:620a:628b:b0:939:72cb:bae7 with SMTP id af79cd13be357-939d7f86baemr1019422785a.30.1789121972748;
        Fri, 11 Sep 2026 03:19:32 -0700 (PDT)
X-Received: by 2002:a05:620a:628b:b0:939:72cb:bae7 with SMTP id af79cd13be357-939d7f86baemr1019419485a.30.1789121972317;
        Fri, 11 Sep 2026 03:19:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:09 +0200
Subject: [PATCH 01/10] arm64: dts: exynos: axis: Re-order nodes to match
 coding style
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-1-9aa55051c42b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2959;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/7+9wiOI5IHqlAQwmNyLQEH0oKQcLytjBMp/ZKWGtEU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WncwhGm1lsFzVLd1FEm5BcMS/WzSbUizJeh
 uGDnExUqOaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVpwAKCRDBN2bmhouD
 16YCD/9sqlvyODs311xq2lf4+fkNygfAELWHdXyW1rIYRo1mRWpS8ibpDYHOJcbQP7brjV7c5/T
 2yJpmGDnZVLBDgCmCgjiXCZhK+K10d2fHiMFNh5WGObqZDeU8oQhXazoNHNFakeCnCFEKTL1ox7
 gscO4ijcr7A0spZukxRNRIeI5fdPN84/Mcp6cx8gIdElKRwpetPVwyjf4rxUsoy/fSrw7VL/K+3
 J9AA6hKJ/pLvuOiVL81GN3gzDy+EdgAt1NkP5SKjcC62Mc60xK96b91BGXejCz1wLo4L95LI4Qu
 RVCXyxVMutiLGPH8weA4B/eOPbyqWkMxOzb+w+a6/1K89pwe12hjTI61JiQk7VG6AP7SpNRgLhk
 ncKXFTtqyPc2IHs/muqGMud2+qljhmsHV8QfcaGI6LLv93jQGChqQxx9JjrUQE1iNcxz9nwlwzF
 8SxVpNDIninijaCCu7GbekY1SQd+DH4Kg6JhzZDf+DQjqdOSBa0fNS//obzuZ442EDYqGDDLGP8
 uCe2QsvfH5RoYZRN3KMLsUmENjP6yNqh8HdZDXBRX6uLB23pE43HwzM6WpR5glZqSfmpPc+8pq2
 b2hkteFYjRTTfA9N54t3ZWTf6Dn22iZv0z8XWArG/y43w6v+/opxe8ucagIaW/N8n4rz1NZcT/s
 SPNWEPPbjYIyXiA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa3d5b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=v5i2LZF9WRl65ewKHLMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 9KCByrxV5TIcrr07WuNyMwk-fqqDir81
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX6mf3byCO+e2z
 tyCOB+nUhPEWZNAS1qc936KpPeExyCSGHL+PS1G5Fiup9TgTIMNbpr79nxe54Fqov1yBtaKgLuZ
 dBpibvel6zJ6o9qWzvxZklE55xmq9wY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX8VwEKthaDIbN
 DlpT6G2AJKrxiCBbrxsUBddV2J1gpb/Wgjb6z40Y7LHiW9yMhVMaIZJZ49SmRNO/UNas+UymtGX
 iadH5xSv2g3BEN050BNdM5L3mfDAE2JSUXMBO8cIqASEdyc/PnTpoQoWZ7GYXMAATY7QyHXdCwU
 mudPiiVySeEUK7mnLKCaNz1lmb3QJsz1LigV+fOI6zXSymYE53nKDQSkVsQtvtDT95ba/LZPD3C
 F0kLRwDdL01cGDeAs8TiaNet5g3dP3DeB5OmzK+etY+fid+HeSIvfERG0qsEOsIHFjr+nSJwNJ6
 v7AuLC4cWu7+Jvh2h8p0D+DSA1akmgquO7lx4VNRd0ShdHqIiDhhZC09jPfrhtH+t6//ae+Jcd5
 8awygLrlSVLQvt8pShJghHM7PliTZRkr1walnV9YC7Ce/ZywdbSNaNMrwh5A2UaKi7fBesQeIJ2
 8Mr1Xjudyfpn/ExGPLA==
X-Proofpoint-ORIG-GUID: 9KCByrxV5TIcrr07WuNyMwk-fqqDir81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143

Re-order top-level nodes to match coding style - ordering by the name,
as pointed out by dt-check-style, e.g.:

  artpec8.dtsi:77: [child-name-order] child node 'clock-finpll' out of name order

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi | 32 ++++++++++++++--------------
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi | 32 ++++++++++++++--------------
 2 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
index db9833297982..853b2fafc8d1 100644
--- a/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
+++ b/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
@@ -22,6 +22,22 @@ aliases {
 		pinctrl1 = &pinctrl_peric;
 	};
 
+	fin_pll: clock-finpll {
+		compatible = "fixed-factor-clock";
+		clocks = <&osc_clk>;
+		#clock-cells = <0>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "fin_pll";
+	};
+
+	osc_clk: clock-osc {
+		/* XXTI */
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "osc_clk";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -74,22 +90,6 @@ cpu_sleep: cpu-sleep {
 		};
 	};
 
-	fin_pll: clock-finpll {
-		compatible = "fixed-factor-clock";
-		clocks = <&osc_clk>;
-		#clock-cells = <0>;
-		clock-div = <2>;
-		clock-mult = <1>;
-		clock-output-names = "fin_pll";
-	};
-
-	osc_clk: clock-osc {
-		/* XXTI */
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-output-names = "osc_clk";
-	};
-
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
index cd46aaf05628..310cafa14f5c 100644
--- a/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
+++ b/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
@@ -23,6 +23,22 @@ aliases {
 		pinctrl2 = &pinctrl_peric;
 	};
 
+	fin_pll: clock-finpll {
+		compatible = "fixed-factor-clock";
+		clocks = <&osc_clk>;
+		#clock-cells = <0>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "fin_pll";
+	};
+
+	osc_clk: clock-osc {
+		/* XXTI */
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "osc_clk";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -91,22 +107,6 @@ cpu_sleep: cpu-sleep {
 		};
 	};
 
-	fin_pll: clock-finpll {
-		compatible = "fixed-factor-clock";
-		clocks = <&osc_clk>;
-		#clock-cells = <0>;
-		clock-div = <2>;
-		clock-mult = <1>;
-		clock-output-names = "fin_pll";
-	};
-
-	osc_clk: clock-osc {
-		/* XXTI */
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-output-names = "osc_clk";
-	};
-
 	pmu {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;

-- 
2.53.0

