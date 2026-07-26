Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1E73D6CCE
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087843; cv=none; b=Mo1wUWCdzYg2U3kmu1XdNcQj5bN8J6ev9xkM9AFAlP6lJ1Qzu7e/3UmsVpsZD2r3jZncZm/ZHxKM8gKLBZJycc60m4XFpTWE7Y9NQeewgLufT22bZ1xm0oG7ZwZlW0gfS7Aza6lPL5qKef65LJ6w0hV2kk2FNG2Tb3bHCQ7TpjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087843; c=relaxed/simple;
	bh=lMjfncAD5xps6gZ5PQQ5yfgzl8/fcMvBpzIBGa1qZhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t+BnleJt0UO5w3gJdM+EqIHZkF6Emyn9laLD3HPfZmnm4G6m4J4mJPJ4PSTZUWd5nvkFx31aIdotnkNdu0jAt3gfj0xEd3cEalpNg0C1pO9cnsJoS6cL/Zt5JyLOzpCzo6B67WP66owO7igtOk5a2b3AXwyJFbuUblYQHqO6nG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8eKXbT9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUYZxpQi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8eKXbT9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUYZxpQi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH808u1421194
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Tl1RMKFXRngjsk1lk46ZXowjT+dW/iSeICFKGqHUuc=; b=c8eKXbT9Za/a3HLS
	+5SP/18oQWXcjfn1hKe93JMad28eUetFg+zJ3eg8JjX2XLee11hbzkez0yMT9UOZ
	eFqcaCibYHDF7qTe+zrJdSpJtx2oNhL05P9MIHAhXFhYNb4vzgKMIPRA7X7VQQJF
	fVTv/jvjaLR7L8+CJT3hgxjYvoR19QDoqhsKpXW1n/xFVrweawfyPbOsTperb0Sj
	9C5CN0WnPRbUryfDzy5w1NdPargJgFpGEKLO2n7SbIaqhZWFdqbPdkVanK7Eso9g
	VUs3lJPQ74BFXjfSzWF8oL0P2oJv2sy3/8xxH35tkk51vGn3l/PXfT4YEVoGaMnp
	7/aa3Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm573mw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:43:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5283df62d68so23870901cf.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 10:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087839; x=1785692639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Tl1RMKFXRngjsk1lk46ZXowjT+dW/iSeICFKGqHUuc=;
        b=DUYZxpQiNxwPeLb/EQRyNljf8ZJjrPq33k2XVGaJ14RgygQw77s9O/PQ4nEP04k7Et
         io8E71JLS8q4UETrVwUOwSA3VAILvenXrre4OAffz+fAWNnwbe6JjTTr0hu31r2g1lks
         +/u0gDUUz1/LSNftMTENTBN0G0sB8vuK9836LvDtujSTO0etntzNLffhnuIFPnUUlING
         ey93/VZ0u8zX47UK9ajQvzc8vIv3XS7RsJH8FxxStduqRdKusH0SEb6Xaa8w390BQA6N
         XsUEET3aV7MJbPDwX1mAyrN+8QDruSCqx9l941IVy/Uj9AmYu/8pzfodfAK8CXr4XhK9
         qGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087839; x=1785692639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Tl1RMKFXRngjsk1lk46ZXowjT+dW/iSeICFKGqHUuc=;
        b=kHP8aL7Ilu6JjzNO0e98Law/uTKQisWhu6jTXzRDYB/qiWi/EPnnbtwnDtxO4cnp2q
         YUpNk+zKQbuEwBt5U7nLw2urqS+yQovNXr+M8vYl7GNFXvcb7UBKWY77Vl8a2UvgLwrY
         dG0GLH8iHT+vRqM42g8IjOu1uDT3FEJJ02Dc+YL8jpcK88wkVq1ArNIZwFrumwSjYgDW
         C7s75NNWQeMVvbwQbxFkZQKBool8hDvUUkN0bsVZdzPhPmZvpyKL7r5O2Z5sNI0CP89Q
         1NQEYA5ns4JOvChPxoXxkn5//Xn00lgZENGeSSAXS3wV7jJQH6kOAGYG9c+E56yJ8fWZ
         jyEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4oHE3FWaTjHH2yB9VS25jqi+aNPsZdClFCaVlQ0b374ei73FuNf7wab8yT0V6UjQ3HDaFgcCAJmxrUvazngP0DA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw1PJDzu4R3VXb3zNWBEhtvKnZFauTLu6VMJUZqLZxmbWJQk5x
	3QGOE5TriPGprV+99BY2CV94TdF5t0Ry9gQYISeNtXZlRj5tt+inZR6kthr9S7AEZHu/Q+5mf1X
	8JwPQB99XvBGdnXTYRrJJipBVWj8eSNAIxj2HfT/VQTtZrR9MpS/ylai0EFhEfOi1wbRCMSxs3w
	==
X-Gm-Gg: AR+sD123Jb0tBnNf2xAGk6UV/Jr3hJnl0EUI3MsQkMoBScJKg/nyAiBa7M88oABBsOw
	K+NWoUYonDNICLhdd8bFnr4pq4MG4q4K3PWzi+HKnUBx5OBZnZBtBEMI5drot3sTPJ0eidGiT+8
	blgaJFaVwnchElpbn1/kfytLXS81MtUs6MKZvc5wqHpRqdX3lpeva19We/jKD7w3qC0TYJ/QKjE
	77Rilxf5uqEKWY6hVKzAkYqpf+FKvTwmajDhRUG4ilHFRal6xCHVMaME8c4bg1o0jbHwxja0dx9
	YtuNt5+Sydqo2ysHkawkyazlfXlfNe1atxHrmCW+RuuXM2Pgg6M7zeLi6sr1iKIyFzlod/vEfIb
	viWhyyXvlSI+jHotIbwoZU6Os
X-Received: by 2002:a05:622a:5291:b0:517:580c:bcd3 with SMTP id d75a77b69052e-529a83a6b54mr54594001cf.19.1785087838946;
        Sun, 26 Jul 2026 10:43:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5291:b0:517:580c:bcd3 with SMTP id d75a77b69052e-529a83a6b54mr54593741cf.19.1785087838330;
        Sun, 26 Jul 2026 10:43:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:43:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 19:43:37 +0200
Subject: [PATCH 4/8] arm64: dts: exynos: Re-order clocks and align
 continued properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-dts-coding-style-strict-v1-4-e9e3e9879d05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=22644;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lMjfncAD5xps6gZ5PQQ5yfgzl8/fcMvBpzIBGa1qZhc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdL52M529bjeqkBG4MUVb0QYuS+H0NWR9z0G
 EdxS1iG2RGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHSwAKCRDBN2bmhouD
 16TUD/0Y8KSPS+BNfhaHL8vhkdqCCSIca1fuNhtIHOWi4TkO2p/LhMs+LIvS6fjabeTmRU01DVE
 u99tYx+b4edq2O3+F1kHOQfo7NyUylldzgiFSA7N/5pNs77Md5DwTDpASubGbu3SCCWcR8mcsxh
 m++uvd818lk0InIFZfKrR+kLep/76os9Ym8i2FeAvDlGlSOHvkOb3pLbF6p90YxPXfNf72GocQn
 vdGixr/1ha2OJSp9inAAEYpQM8VIqoPi3gE6BQNRTeT2eG7478PAwZWBulxF6N9d2CS4ZdUpsUY
 kNjR57FQfbYuFULEQsgrvhklCdkDJCICuX9mXhnLIJLp53PpZUefEmD3ItM4XwpNnMQKpP4Sk9y
 yyQMLeE4G4ZIHdWF28Og9hLBpUh8ybUfin7vprIrdkvJIgRMEA1D3RRNHDidK0i1nuVjvPXb/LV
 5l5Ta11p9tu39xpEfKvvERc0f48EUuwWFdvMBQUzIt0ryK9qQrHwGopsj7YoWBbJJ+f09hzZuAh
 k0NzJbg4t+T/VwkSzO0QTC8TxRsljKVbxah/KAMSxshpKwH5ReCLtDsrgADD7T6HQEz31nWO4kC
 0A7mQmxyn0WEhCVvhuIoh95HR/NSBVXTSQkgjgFmzoYd9LhG4D/S2LYMDKi5HGQb+jGMvkKk+4e
 vslShKkyvcd/UGA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX/3l+bpLMIRhT
 PO2/GnTOxXjG1vFKO4eyB4NuaokdWIqCOI4DXQmGobfsbFgMNnZrHH5FZUsD75o0lx0qOYpTsCm
 ApQ/xot5+8XGu99uratIkqBZNbgUcWs=
X-Proofpoint-GUID: pm0pIRui65w3NHj9yf-hWAtRbpuHPNsz
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a66475f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-PZSCOsnEXypsARMe6sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: pm0pIRui65w3NHj9yf-hWAtRbpuHPNsz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX5uxKH8NVW9yC
 tAUcFE2gSpQbdrHZfSEm8s0evdi58x6f2dKD8Rg4Qp2+n0U6E13TVTpKhScTTJGxBn5GSQxQysI
 0sX2sSAnm+5QfI6cAH1QlkXy3PeB7OZNbcEN1RjNSvxiihAEDgTKmM0gb/spPZlEAXpit0c5rDU
 XGrz8atK5pn0OHKff/ZUJTigZY/T9Ac1cjej8OTVngTAud/wPCEN1UQx4IB0bnVsVI4EhooHILz
 6Ariz6JoHuyl9t1wRyQkq1+/4uorawNIGEz1vaK4ChRWyGjvpYlZ7985kASmBX0K8Z2kJoeMZvI
 jM5ZXDoH8MUVvOx2cV8PiZT4fM25YVEhV+BSSjfRKfXNi+WRmCmYfGRyzmHo3SCgHCylp+j/RQr
 11WRZO9W4IUYhE6iTarEnQ+Z/GNrp6Dwmc6HOkxA3w0WiCHxVkkwoSo7nfHxe21DLZnwPUcY5An
 93+HoeIHbD8yhnwXmpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179

Trivial white-space only changes to adjust to DTS coding style
(clocks-names should follow clocks) and fix dt-check-style strict
warnings like:

  [property-order] property 'clocks' out of canonical order (should sort before 'clock-names')
  [continuation-alignment] continuation should align to column 39 (under < or ")

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 282 ++++++++++++++---------------
 1 file changed, 141 insertions(+), 141 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 875e75759f20..4d035c805aa6 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -400,14 +400,14 @@ cmu_top: clock-controller@10030000 {
 			reg = <0x10030000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"sclk_mphy_pll",
-				"sclk_mfc_pll",
-				"sclk_bus_pll";
 			clocks = <&xxti>,
-				<&cmu_cpif CLK_SCLK_MPHY_PLL>,
-				<&cmu_mif CLK_SCLK_MFC_PLL>,
-				<&cmu_mif CLK_SCLK_BUS_PLL>;
+				 <&cmu_cpif CLK_SCLK_MPHY_PLL>,
+				 <&cmu_mif CLK_SCLK_MFC_PLL>,
+				 <&cmu_mif CLK_SCLK_BUS_PLL>;
+			clock-names = "oscclk",
+				      "sclk_mphy_pll",
+				      "sclk_mfc_pll",
+				      "sclk_bus_pll";
 		};
 
 		cmu_cpif: clock-controller@10fc0000 {
@@ -415,8 +415,8 @@ cmu_cpif: clock-controller@10fc0000 {
 			reg = <0x10fc0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk";
 			clocks = <&xxti>;
+			clock-names = "oscclk";
 		};
 
 		cmu_mif: clock-controller@105b0000 {
@@ -424,10 +424,10 @@ cmu_mif: clock-controller@105b0000 {
 			reg = <0x105b0000 0x2000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"sclk_mphy_pll";
 			clocks = <&xxti>,
-				<&cmu_cpif CLK_SCLK_MPHY_PLL>;
+				 <&cmu_cpif CLK_SCLK_MPHY_PLL>;
+			clock-names = "oscclk",
+				      "sclk_mphy_pll";
 		};
 
 		cmu_peric: clock-controller@14c80000 {
@@ -447,26 +447,26 @@ cmu_fsys: clock-controller@156e0000 {
 			reg = <0x156e0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"sclk_ufs_mphy",
-				"aclk_fsys_200",
-				"sclk_pcie_100_fsys",
-				"sclk_ufsunipro_fsys",
-				"sclk_mmc2_fsys",
-				"sclk_mmc1_fsys",
-				"sclk_mmc0_fsys",
-				"sclk_usbhost30_fsys",
-				"sclk_usbdrd30_fsys";
 			clocks = <&xxti>,
-				<&cmu_cpif CLK_SCLK_UFS_MPHY>,
-				<&cmu_top CLK_ACLK_FSYS_200>,
-				<&cmu_top CLK_SCLK_PCIE_100_FSYS>,
-				<&cmu_top CLK_SCLK_UFSUNIPRO_FSYS>,
-				<&cmu_top CLK_SCLK_MMC2_FSYS>,
-				<&cmu_top CLK_SCLK_MMC1_FSYS>,
-				<&cmu_top CLK_SCLK_MMC0_FSYS>,
-				<&cmu_top CLK_SCLK_USBHOST30_FSYS>,
-				<&cmu_top CLK_SCLK_USBDRD30_FSYS>;
+				 <&cmu_cpif CLK_SCLK_UFS_MPHY>,
+				 <&cmu_top CLK_ACLK_FSYS_200>,
+				 <&cmu_top CLK_SCLK_PCIE_100_FSYS>,
+				 <&cmu_top CLK_SCLK_UFSUNIPRO_FSYS>,
+				 <&cmu_top CLK_SCLK_MMC2_FSYS>,
+				 <&cmu_top CLK_SCLK_MMC1_FSYS>,
+				 <&cmu_top CLK_SCLK_MMC0_FSYS>,
+				 <&cmu_top CLK_SCLK_USBHOST30_FSYS>,
+				 <&cmu_top CLK_SCLK_USBDRD30_FSYS>;
+			clock-names = "oscclk",
+				      "sclk_ufs_mphy",
+				      "aclk_fsys_200",
+				      "sclk_pcie_100_fsys",
+				      "sclk_ufsunipro_fsys",
+				      "sclk_mmc2_fsys",
+				      "sclk_mmc1_fsys",
+				      "sclk_mmc0_fsys",
+				      "sclk_usbhost30_fsys",
+				      "sclk_usbdrd30_fsys";
 		};
 
 		cmu_g2d: clock-controller@12460000 {
@@ -474,12 +474,12 @@ cmu_g2d: clock-controller@12460000 {
 			reg = <0x12460000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"aclk_g2d_266",
-				"aclk_g2d_400";
 			clocks = <&xxti>,
-				<&cmu_top CLK_ACLK_G2D_266>,
-				<&cmu_top CLK_ACLK_G2D_400>;
+				 <&cmu_top CLK_ACLK_G2D_266>,
+				 <&cmu_top CLK_ACLK_G2D_400>;
+			clock-names = "oscclk",
+				      "aclk_g2d_266",
+				      "aclk_g2d_400";
 			power-domains = <&pd_g2d>;
 		};
 
@@ -488,24 +488,24 @@ cmu_disp: clock-controller@13b90000 {
 			reg = <0x13b90000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"sclk_dsim1_disp",
-				"sclk_dsim0_disp",
-				"sclk_dsd_disp",
-				"sclk_decon_tv_eclk_disp",
-				"sclk_decon_vclk_disp",
-				"sclk_decon_eclk_disp",
-				"sclk_decon_tv_vclk_disp",
-				"aclk_disp_333";
 			clocks = <&xxti>,
-				<&cmu_mif CLK_SCLK_DSIM1_DISP>,
-				<&cmu_mif CLK_SCLK_DSIM0_DISP>,
-				<&cmu_mif CLK_SCLK_DSD_DISP>,
-				<&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
-				<&cmu_mif CLK_SCLK_DECON_VCLK_DISP>,
-				<&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
-				<&cmu_mif CLK_SCLK_DECON_TV_VCLK_DISP>,
-				<&cmu_mif CLK_ACLK_DISP_333>;
+				 <&cmu_mif CLK_SCLK_DSIM1_DISP>,
+				 <&cmu_mif CLK_SCLK_DSIM0_DISP>,
+				 <&cmu_mif CLK_SCLK_DSD_DISP>,
+				 <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
+				 <&cmu_mif CLK_SCLK_DECON_VCLK_DISP>,
+				 <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
+				 <&cmu_mif CLK_SCLK_DECON_TV_VCLK_DISP>,
+				 <&cmu_mif CLK_ACLK_DISP_333>;
+			clock-names = "oscclk",
+				      "sclk_dsim1_disp",
+				      "sclk_dsim0_disp",
+				      "sclk_dsd_disp",
+				      "sclk_decon_tv_eclk_disp",
+				      "sclk_decon_vclk_disp",
+				      "sclk_decon_eclk_disp",
+				      "sclk_decon_tv_vclk_disp",
+				      "aclk_disp_333";
 			power-domains = <&pd_disp>;
 		};
 
@@ -513,8 +513,8 @@ cmu_aud: clock-controller@114c0000 {
 			compatible = "samsung,exynos5433-cmu-aud";
 			reg = <0x114c0000 0x1000>;
 			#clock-cells = <1>;
-			clock-names = "oscclk", "fout_aud_pll";
 			clocks = <&xxti>, <&cmu_top CLK_FOUT_AUD_PLL>;
+			clock-names = "oscclk", "fout_aud_pll";
 			power-domains = <&pd_aud>;
 		};
 
@@ -523,8 +523,8 @@ cmu_bus0: clock-controller@13600000 {
 			reg = <0x13600000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "aclk_bus0_400";
 			clocks = <&cmu_top CLK_ACLK_BUS0_400>;
+			clock-names = "aclk_bus0_400";
 		};
 
 		cmu_bus1: clock-controller@14800000 {
@@ -532,8 +532,8 @@ cmu_bus1: clock-controller@14800000 {
 			reg = <0x14800000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "aclk_bus1_400";
 			clocks = <&cmu_top CLK_ACLK_BUS1_400>;
+			clock-names = "aclk_bus1_400";
 		};
 
 		cmu_bus2: clock-controller@13400000 {
@@ -541,8 +541,8 @@ cmu_bus2: clock-controller@13400000 {
 			reg = <0x13400000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "aclk_bus2_400";
 			clocks = <&xxti>, <&cmu_mif CLK_ACLK_BUS2_400>;
+			clock-names = "oscclk", "aclk_bus2_400";
 		};
 
 		cmu_g3d: clock-controller@14aa0000 {
@@ -550,8 +550,8 @@ cmu_g3d: clock-controller@14aa0000 {
 			reg = <0x14aa0000 0x2000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "aclk_g3d_400";
 			clocks = <&xxti>, <&cmu_top CLK_ACLK_G3D_400>;
+			clock-names = "oscclk", "aclk_g3d_400";
 			power-domains = <&pd_g3d>;
 		};
 
@@ -560,12 +560,12 @@ cmu_gscl: clock-controller@13cf0000 {
 			reg = <0x13cf0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"aclk_gscl_111",
-				"aclk_gscl_333";
 			clocks = <&xxti>,
-				<&cmu_top CLK_ACLK_GSCL_111>,
-				<&cmu_top CLK_ACLK_GSCL_333>;
+				 <&cmu_top CLK_ACLK_GSCL_111>,
+				 <&cmu_top CLK_ACLK_GSCL_333>;
+			clock-names = "oscclk",
+				      "aclk_gscl_111",
+				      "aclk_gscl_333";
 			power-domains = <&pd_gscl>;
 		};
 
@@ -574,8 +574,8 @@ cmu_apollo: clock-controller@11900000 {
 			reg = <0x11900000 0x2000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "sclk_bus_pll_apollo";
 			clocks = <&xxti>, <&cmu_mif CLK_SCLK_BUS_PLL_APOLLO>;
+			clock-names = "oscclk", "sclk_bus_pll_apollo";
 		};
 
 		cmu_atlas: clock-controller@11800000 {
@@ -583,8 +583,8 @@ cmu_atlas: clock-controller@11800000 {
 			reg = <0x11800000 0x2000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "sclk_bus_pll_atlas";
 			clocks = <&xxti>, <&cmu_mif CLK_SCLK_BUS_PLL_ATLAS>;
+			clock-names = "oscclk", "sclk_bus_pll_atlas";
 		};
 
 		cmu_mscl: clock-controller@150d0000 {
@@ -592,12 +592,12 @@ cmu_mscl: clock-controller@150d0000 {
 			reg = <0x150d0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"sclk_jpeg_mscl",
-				"aclk_mscl_400";
 			clocks = <&xxti>,
-				<&cmu_top CLK_SCLK_JPEG_MSCL>,
-				<&cmu_top CLK_ACLK_MSCL_400>;
+				 <&cmu_top CLK_SCLK_JPEG_MSCL>,
+				 <&cmu_top CLK_ACLK_MSCL_400>;
+			clock-names = "oscclk",
+				      "sclk_jpeg_mscl",
+				      "aclk_mscl_400";
 			power-domains = <&pd_mscl>;
 		};
 
@@ -606,8 +606,8 @@ cmu_mfc: clock-controller@15280000 {
 			reg = <0x15280000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "aclk_mfc_400";
 			clocks = <&xxti>, <&cmu_top CLK_ACLK_MFC_400>;
+			clock-names = "oscclk", "aclk_mfc_400";
 			power-domains = <&pd_mfc>;
 		};
 
@@ -616,8 +616,8 @@ cmu_hevc: clock-controller@14f80000 {
 			reg = <0x14f80000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk", "aclk_hevc_400";
 			clocks = <&xxti>, <&cmu_top CLK_ACLK_HEVC_400>;
+			clock-names = "oscclk", "aclk_hevc_400";
 			power-domains = <&pd_hevc>;
 		};
 
@@ -626,12 +626,12 @@ cmu_isp: clock-controller@146d0000 {
 			reg = <0x146d0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"aclk_isp_dis_400",
-				"aclk_isp_400";
 			clocks = <&xxti>,
-				<&cmu_top CLK_ACLK_ISP_DIS_400>,
-				<&cmu_top CLK_ACLK_ISP_400>;
+				 <&cmu_top CLK_ACLK_ISP_DIS_400>,
+				 <&cmu_top CLK_ACLK_ISP_400>;
+			clock-names = "oscclk",
+				      "aclk_isp_dis_400",
+				      "aclk_isp_400";
 			power-domains = <&pd_isp>;
 		};
 
@@ -640,14 +640,14 @@ cmu_cam0: clock-controller@120d0000 {
 			reg = <0x120d0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"aclk_cam0_333",
-				"aclk_cam0_400",
-				"aclk_cam0_552";
 			clocks = <&xxti>,
-				<&cmu_top CLK_ACLK_CAM0_333>,
-				<&cmu_top CLK_ACLK_CAM0_400>,
-				<&cmu_top CLK_ACLK_CAM0_552>;
+				 <&cmu_top CLK_ACLK_CAM0_333>,
+				 <&cmu_top CLK_ACLK_CAM0_400>,
+				 <&cmu_top CLK_ACLK_CAM0_552>;
+			clock-names = "oscclk",
+				      "aclk_cam0_333",
+				      "aclk_cam0_400",
+				      "aclk_cam0_552";
 			power-domains = <&pd_cam0>;
 		};
 
@@ -656,20 +656,20 @@ cmu_cam1: clock-controller@145d0000 {
 			reg = <0x145d0000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"sclk_isp_uart_cam1",
-				"sclk_isp_spi1_cam1",
-				"sclk_isp_spi0_cam1",
-				"aclk_cam1_333",
-				"aclk_cam1_400",
-				"aclk_cam1_552";
 			clocks = <&xxti>,
-				<&cmu_top CLK_SCLK_ISP_UART_CAM1>,
-				<&cmu_top CLK_SCLK_ISP_SPI1_CAM1>,
-				<&cmu_top CLK_SCLK_ISP_SPI0_CAM1>,
-				<&cmu_top CLK_ACLK_CAM1_333>,
-				<&cmu_top CLK_ACLK_CAM1_400>,
-				<&cmu_top CLK_ACLK_CAM1_552>;
+				 <&cmu_top CLK_SCLK_ISP_UART_CAM1>,
+				 <&cmu_top CLK_SCLK_ISP_SPI1_CAM1>,
+				 <&cmu_top CLK_SCLK_ISP_SPI0_CAM1>,
+				 <&cmu_top CLK_ACLK_CAM1_333>,
+				 <&cmu_top CLK_ACLK_CAM1_400>,
+				 <&cmu_top CLK_ACLK_CAM1_552>;
+			clock-names = "oscclk",
+				      "sclk_isp_uart_cam1",
+				      "sclk_isp_spi1_cam1",
+				      "sclk_isp_spi0_cam1",
+				      "aclk_cam1_333",
+				      "aclk_cam1_400",
+				      "aclk_cam1_552";
 			power-domains = <&pd_cam1>;
 		};
 
@@ -678,23 +678,23 @@ cmu_imem: clock-controller@11060000 {
 			reg = <0x11060000 0x1000>;
 			#clock-cells = <1>;
 
-			clock-names = "oscclk",
-				"aclk_imem_sssx_266",
-				"aclk_imem_266",
-				"aclk_imem_200";
 			clocks = <&xxti>,
-				<&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
-				<&cmu_top CLK_DIV_ACLK_IMEM_266>,
-				<&cmu_top CLK_DIV_ACLK_IMEM_200>;
+				 <&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
+				 <&cmu_top CLK_DIV_ACLK_IMEM_266>,
+				 <&cmu_top CLK_DIV_ACLK_IMEM_200>;
+			clock-names = "oscclk",
+				      "aclk_imem_sssx_266",
+				      "aclk_imem_266",
+				      "aclk_imem_200";
 		};
 
 		slim_sss: slim-sss@11140000 {
 			compatible = "samsung,exynos5433-slim-sss";
 			reg = <0x11140000 0x1000>;
 			interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk";
 			clocks = <&cmu_imem CLK_PCLK_SLIMSSS>,
 				 <&cmu_imem CLK_ACLK_SLIMSSS>;
+			clock-names = "pclk", "aclk";
 		};
 
 		pd_gscl: power-domain@105c4000 {
@@ -955,8 +955,8 @@ pmu_system_controller: system-controller@105c0000 {
 			compatible = "samsung,exynos5433-pmu", "simple-mfd", "syscon";
 			reg = <0x105c0000 0x5008>;
 			#clock-cells = <1>;
-			clock-names = "clkout16";
 			clocks = <&xxti>;
+			clock-names = "clkout16";
 
 			mipi_phy: mipi-phy {
 				compatible = "samsung,exynos5433-mipi-video-phy";
@@ -976,13 +976,13 @@ reboot: syscon-reboot {
 
 		gic: interrupt-controller@11001000 {
 			compatible = "arm,gic-400";
+			reg = <0x11001000 0x1000>,
+			      <0x11002000 0x2000>,
+			      <0x11004000 0x2000>,
+			      <0x11006000 0x2000>;
 			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
-			reg = <0x11001000 0x1000>,
-				<0x11002000 0x2000>,
-				<0x11004000 0x2000>,
-				<0x11006000 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 
@@ -1191,13 +1191,13 @@ gsc_0: video-scaler@13c00000 {
 			compatible = "samsung,exynos5433-gsc";
 			reg = <0x13c00000 0x1000>;
 			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk", "aclk_xiu",
-				      "aclk_gsclbend", "gsd";
 			clocks = <&cmu_gscl CLK_PCLK_GSCL0>,
 				 <&cmu_gscl CLK_ACLK_GSCL0>,
 				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
 				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>,
 				 <&cmu_gscl CLK_ACLK_GSD>;
+			clock-names = "pclk", "aclk", "aclk_xiu",
+				      "aclk_gsclbend", "gsd";
 			iommus = <&sysmmu_gscl0>;
 			power-domains = <&pd_gscl>;
 		};
@@ -1206,13 +1206,13 @@ gsc_1: video-scaler@13c10000 {
 			compatible = "samsung,exynos5433-gsc";
 			reg = <0x13c10000 0x1000>;
 			interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk", "aclk_xiu",
-				      "aclk_gsclbend", "gsd";
 			clocks = <&cmu_gscl CLK_PCLK_GSCL1>,
 				 <&cmu_gscl CLK_ACLK_GSCL1>,
 				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
 				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>,
 				 <&cmu_gscl CLK_ACLK_GSD>;
+			clock-names = "pclk", "aclk", "aclk_xiu",
+				      "aclk_gsclbend", "gsd";
 			iommus = <&sysmmu_gscl1>;
 			power-domains = <&pd_gscl>;
 		};
@@ -1221,13 +1221,13 @@ gsc_2: video-scaler@13c20000 {
 			compatible = "samsung,exynos5433-gsc";
 			reg = <0x13c20000 0x1000>;
 			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk", "aclk_xiu",
-				      "aclk_gsclbend", "gsd";
 			clocks = <&cmu_gscl CLK_PCLK_GSCL2>,
 				 <&cmu_gscl CLK_ACLK_GSCL2>,
 				 <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
 				 <&cmu_gscl CLK_ACLK_GSCLBEND_333>,
 				 <&cmu_gscl CLK_ACLK_GSD>;
+			clock-names = "pclk", "aclk", "aclk_xiu",
+				      "aclk_gsclbend", "gsd";
 			iommus = <&sysmmu_gscl2>;
 			power-domains = <&pd_gscl>;
 		};
@@ -1295,10 +1295,10 @@ scaler_0: scaler@15000000 {
 			compatible = "samsung,exynos5433-scaler";
 			reg = <0x15000000 0x1294>;
 			interrupts = <0 402 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk", "aclk_xiu";
 			clocks = <&cmu_mscl CLK_PCLK_M2MSCALER0>,
 				 <&cmu_mscl CLK_ACLK_M2MSCALER0>,
 				 <&cmu_mscl CLK_ACLK_XIU_MSCLX>;
+			clock-names = "pclk", "aclk", "aclk_xiu";
 			iommus = <&sysmmu_scaler_0>;
 			power-domains = <&pd_mscl>;
 		};
@@ -1307,10 +1307,10 @@ scaler_1: scaler@15010000 {
 			compatible = "samsung,exynos5433-scaler";
 			reg = <0x15010000 0x1294>;
 			interrupts = <0 403 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk", "aclk_xiu";
 			clocks = <&cmu_mscl CLK_PCLK_M2MSCALER1>,
 				 <&cmu_mscl CLK_ACLK_M2MSCALER1>,
 				 <&cmu_mscl CLK_ACLK_XIU_MSCLX>;
+			clock-names = "pclk", "aclk", "aclk_xiu";
 			iommus = <&sysmmu_scaler_1>;
 			power-domains = <&pd_mscl>;
 		};
@@ -1319,11 +1319,11 @@ jpeg: codec@15020000 {
 			compatible = "samsung,exynos5433-jpeg";
 			reg = <0x15020000 0x10000>;
 			interrupts = <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk", "aclk_xiu", "sclk";
 			clocks = <&cmu_mscl CLK_PCLK_JPEG>,
 				 <&cmu_mscl CLK_ACLK_JPEG>,
 				 <&cmu_mscl CLK_ACLK_XIU_MSCLX>,
 				 <&cmu_mscl CLK_SCLK_JPEG>;
+			clock-names = "pclk", "aclk", "aclk_xiu", "sclk";
 			iommus = <&sysmmu_jpeg>;
 			power-domains = <&pd_mscl>;
 		};
@@ -1332,10 +1332,10 @@ mfc: codec@152e0000 {
 			compatible = "samsung,exynos5433-mfc";
 			reg = <0x152e0000 0x10000>;
 			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "pclk", "aclk", "aclk_xiu";
 			clocks = <&cmu_mfc CLK_PCLK_MFC>,
 				 <&cmu_mfc CLK_ACLK_MFC>,
 				 <&cmu_mfc CLK_ACLK_XIU_MFCX>;
+			clock-names = "pclk", "aclk", "aclk_xiu";
 			iommus = <&sysmmu_mfc_0>, <&sysmmu_mfc_1>;
 			iommu-names = "left", "right";
 			power-domains = <&pd_mfc>;
@@ -1345,9 +1345,9 @@ sysmmu_decon0x: sysmmu@13a00000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a00000 0x1000>;
 			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_disp CLK_ACLK_SMMU_DECON0X>,
-				<&cmu_disp CLK_PCLK_SMMU_DECON0X>;
+				 <&cmu_disp CLK_PCLK_SMMU_DECON0X>;
+			clock-names = "aclk", "pclk";
 			power-domains = <&pd_disp>;
 			#iommu-cells = <0>;
 		};
@@ -1356,9 +1356,9 @@ sysmmu_decon1x: sysmmu@13a10000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a10000 0x1000>;
 			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_disp CLK_ACLK_SMMU_DECON1X>,
-				<&cmu_disp CLK_PCLK_SMMU_DECON1X>;
+				 <&cmu_disp CLK_PCLK_SMMU_DECON1X>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_disp>;
 		};
@@ -1367,9 +1367,9 @@ sysmmu_tv0x: sysmmu@13a20000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a20000 0x1000>;
 			interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_disp CLK_ACLK_SMMU_TV0X>,
-				<&cmu_disp CLK_PCLK_SMMU_TV0X>;
+				 <&cmu_disp CLK_PCLK_SMMU_TV0X>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_disp>;
 		};
@@ -1378,9 +1378,9 @@ sysmmu_tv1x: sysmmu@13a30000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13a30000 0x1000>;
 			interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_disp CLK_ACLK_SMMU_TV1X>,
-				<&cmu_disp CLK_PCLK_SMMU_TV1X>;
+				 <&cmu_disp CLK_PCLK_SMMU_TV1X>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_disp>;
 		};
@@ -1389,9 +1389,9 @@ sysmmu_gscl0: sysmmu@13c80000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13c80000 0x1000>;
 			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL0>,
 				 <&cmu_gscl CLK_PCLK_SMMU_GSCL0>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_gscl>;
 		};
@@ -1400,9 +1400,9 @@ sysmmu_gscl1: sysmmu@13c90000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13c90000 0x1000>;
 			interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL1>,
 				 <&cmu_gscl CLK_PCLK_SMMU_GSCL1>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_gscl>;
 		};
@@ -1411,9 +1411,9 @@ sysmmu_gscl2: sysmmu@13ca0000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13ca0000 0x1000>;
 			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_gscl CLK_ACLK_SMMU_GSCL2>,
 				 <&cmu_gscl CLK_PCLK_SMMU_GSCL2>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_gscl>;
 		};
@@ -1422,9 +1422,9 @@ sysmmu_scaler_0: sysmmu@15040000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15040000 0x1000>;
 			interrupts = <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_mscl CLK_ACLK_SMMU_M2MSCALER0>,
-				<&cmu_mscl CLK_PCLK_SMMU_M2MSCALER0>;
+				 <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER0>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_mscl>;
 		};
@@ -1433,9 +1433,9 @@ sysmmu_scaler_1: sysmmu@15050000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15050000 0x1000>;
 			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_mscl CLK_ACLK_SMMU_M2MSCALER1>,
-				<&cmu_mscl CLK_PCLK_SMMU_M2MSCALER1>;
+				 <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER1>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_mscl>;
 		};
@@ -1444,9 +1444,9 @@ sysmmu_jpeg: sysmmu@15060000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15060000 0x1000>;
 			interrupts = <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_mscl CLK_ACLK_SMMU_JPEG>,
-				<&cmu_mscl CLK_PCLK_SMMU_JPEG>;
+				 <&cmu_mscl CLK_PCLK_SMMU_JPEG>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_mscl>;
 		};
@@ -1455,9 +1455,9 @@ sysmmu_mfc_0: sysmmu@15200000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15200000 0x1000>;
 			interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_mfc CLK_ACLK_SMMU_MFC_0>,
-				<&cmu_mfc CLK_PCLK_SMMU_MFC_0>;
+				 <&cmu_mfc CLK_PCLK_SMMU_MFC_0>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_mfc>;
 		};
@@ -1466,9 +1466,9 @@ sysmmu_mfc_1: sysmmu@15210000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x15210000 0x1000>;
 			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
 			clocks = <&cmu_mfc CLK_ACLK_SMMU_MFC_1>,
-				<&cmu_mfc CLK_PCLK_SMMU_MFC_1>;
+				 <&cmu_mfc CLK_PCLK_SMMU_MFC_1>;
+			clock-names = "aclk", "pclk";
 			#iommu-cells = <0>;
 			power-domains = <&pd_mfc>;
 		};
@@ -1621,8 +1621,8 @@ adc: adc@14d10000 {
 			compatible = "samsung,exynos5433-adc", "samsung,exynos7-adc";
 			reg = <0x14d10000 0x100>;
 			interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "adc";
 			clocks = <&cmu_peric CLK_PCLK_ADCIF>;
+			clock-names = "adc";
 			#io-channel-cells = <1>;
 
 			status = "disabled";

-- 
2.53.0

