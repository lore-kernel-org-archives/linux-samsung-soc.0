Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9D73D3D19
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087839; cv=none; b=RXqPmvu1pRFCRkMHdHw1VYYOaPjHMjJ9xURNf9jloeEn4MvUd+dC5WdUVUJ60lnwqIz391k+6m/SvOYgoTCEbQEdjj5Y3VuXt0YeP4xVfQkVQPx5ILRt8i0rGiNQwTRQKtaiqGhV8OlH1HNvNkQPnVmB3Gc9b47UJIhkUztwOsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087839; c=relaxed/simple;
	bh=Ghw91m7o5lac5kyAa00WLFIkcbvR+gCx52YsoII8VDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c5tJwrUpok6i/yxeSo8Ih0JGBl7o3MS59gBTo9fZCuHJDS5k9lovr00qZV7ALV3fYBny3Kc2JFL3YfV7CkQ218Yn/tKDMi9h/L3lQNAabez1dQdYxy9Ieq/1pNdUgkiT8Om0WMJQJ9ALh9LX9hk4ipdWah52k+j91uWH0VVGA+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2ZSoLAC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5It3qwX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2ZSoLAC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5It3qwX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH7FEt1366188
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Wn8q67I1I+LsL5SEV+INoURgvYfG27MLgLrvdaN+UA=; b=E2ZSoLAC6kXdzRJv
	XbUUiw6TJmWeEoU2TVdnAGJqWeMKLYF4jZ6m8d4zkORKoqsPyzi1oZojJSSJrl5V
	v8wkI7tTxyb4JNtzm+x+IHDV2ogiWisbrStmzvB+FvxNNCqooVSTSewwaeClPKak
	CTHkRqpTo+vDjt52Fwb1yE+qHKqpT2TZ4BmMjrAmbLkXmGwnxdCzl75njYpd+HR5
	r736lqE+dJwv1ZV5UrZWwQ624IysaS9UluTer74SXo/DVCXxWZjMk5XoFJ4T1I4I
	suPCsffoxL7MaaCUAnn81Vog294U6sks/dO9AhJ8Yd37wB3m3BQRhpAZNDJVDO6g
	vLfsig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmqybgav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:43:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ebdfceddcso27695491cf.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087836; x=1785692636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Wn8q67I1I+LsL5SEV+INoURgvYfG27MLgLrvdaN+UA=;
        b=h5It3qwXl5itq1GDN1NZuzGeWyct1mql0JL2SxZ0HIIUQtW5nEZ/LbFRXlD7iOO/TA
         VGI9+0tpwsIdiJB0fIPlLNJfTYwYLo4XBSv/eyn/z3VL1TV50+ExYtirKDZliZ2Gx9T3
         VeY4LNml06vi2XpZkRRh5mMIPoOSFsNeKwru0Zal/NrHcEkJmJ4MHR5nP6U2AJB40H9M
         7M9V4T71+m94VuPU2z0iUoW++XI50Ilxo/fjaCnhVizIIg8NMYrzUl8TD/OHHTtEiHMn
         pLCQBfZRZX1D24hOHgZArW/chnzNjF5iUpxMMBRWvBSuUIBjKKCqu2D5iOUUbSgNGi10
         Kdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087836; x=1785692636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Wn8q67I1I+LsL5SEV+INoURgvYfG27MLgLrvdaN+UA=;
        b=noLfPHB4Gy3JNULtLOCsMhJEryXERnM22FHUkV7L0P7VwrIrvcdJjJtloe9juw3N4r
         eaEd+BYQjQB9BBsDQ3a9XJYmtoZj/CuvRZlxf7wf96NPmmdTo+UNtVADTOA8TznKt+lX
         ieIQFWEryOYRcIamR9QWkGp5wW3SJ+emLkZQk06gUEh3dR3rZ20Vtl8QAlBxZkgN6S6A
         ZUT0dzpdeIa3wDePSNE9uBccHSvRF+AiZ+0T3jEWB+Al9eBk2se6OixGnQzKyTgeBsK/
         NTRVOd/jJy8duFd6m7ATwjnO34EfgRjlh9iXAZ6mJoY0FZP33ghA7edMo1Tw2vover5I
         H9Yg==
X-Forwarded-Encrypted: i=1; AHgh+RoyMZSjERE6hsNL3V0YeKJ7FRxlOG57HmWwfjl1RY1Wa7ygCnGhKNKTeilQcmKulSRSRAhRu2xVctTYO4fEdpoHLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ2i4XwHS56fEoUJY2loZLsH9kufB2x9J2+N47beQLNFxbgXN1
	nj09sdkQM5OMeZ9YETgp7aKKUBRflj6FtF21cKpIT6Ht0v9Lo+2P8inq2SR8+aU28aJfQ4oJ7GM
	sLQTT4qTq4qOtR6Svat3rbuDpigDrjt9LqtIwmHGazZrxFshikEloJEO77c3mMdjh6JTyyZ9Ryw
	==
X-Gm-Gg: AR+sD10MP80B5njqcA6OWTTU6QxGHyhYWE8X97GZIpKATdL00m3oyp/VStYiGUWsvNx
	kVrBD15Yab564yzRSFWi1qyE4rT2T4hGaYp8/tLlOgEDrBsQvmofL4l1F+fBiGRBW4J4NGWZYkt
	F4DurgkAqZm2VJII4CT0NPQECfEtPUScXfcjYGAS97a9orKrlon7rxUJEpa2+HvpNqCtucDM/KA
	P5YQobteCqVu0RlGuI2qbSjo20LKWOda3sEnbjSlI59O7m7/xOvkwMgz135PMEsKJ4Qm0NHS5Sp
	K0t5CH+RZYyJw/J0CJEssuOQa0cAsoyjAf/9AWxW1NweycwDrESyD/rWCzrkuajWwK5Mb/h8vkh
	8NMqGP3R1/JImlne9Lnq84wgk
X-Received: by 2002:ac8:7d0b:0:b0:51c:94f:8ce with SMTP id d75a77b69052e-529a83825ecmr59892481cf.34.1785087836217;
        Sun, 26 Jul 2026 10:43:56 -0700 (PDT)
X-Received: by 2002:ac8:7d0b:0:b0:51c:94f:8ce with SMTP id d75a77b69052e-529a83825ecmr59892281cf.34.1785087835761;
        Sun, 26 Jul 2026 10:43:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:43:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 19:43:36 +0200
Subject: [PATCH 3/8] arm64: dts: exynos5433: Override thermal zones by
 phandle
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-dts-coding-style-strict-v1-3-e9e3e9879d05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1436;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ghw91m7o5lac5kyAa00WLFIkcbvR+gCx52YsoII8VDE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdKJCrdw5RgOhae3V+ZlW5LCBfKyf23m97JO
 pCCxCEw8sWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHSgAKCRDBN2bmhouD
 1xkMD/0W2GI0NFCSIEjzr6yCzZmhPQHA3qouhz+h2L2NyfikPRGziQerqdXYV3h0RJN6dPOKokb
 eb4fE4EK4iilh16Pstx2+B6M4YcRLimx/kqU1jvlDj9vi7GPHGM6sk4Ee3idwXJZvRUbWwqB5WU
 nOXhBsjR679vhj+T+kJIXX+tDEGXFf60nQV1fA65s5Obtc6AbL3rWVtGyu+5/uTaSRAyjthuIyu
 uiCJMARRY+BprocLsizmVxKgDCQpDu55L15WKsq3anglWXLb/Q6rQiQPYfqN8xNsFDpJPoA7/gz
 kWzY2vIqE/htQCpJ7Z0tVNpf74MDlgnifn6gUDORUHXSwD3pjt4hxri4TkSJ/u+Gl6MMQQz4iXC
 94m/e4wghDVyLT/pix+XgV4rj/1oDI2jwyHj27yRGYy5p5RBLn0a1ywcBrtH7brvsevqqlDm203
 7lag6n8g90x9wLGDQx4SCAgZ0+JAHwcv3bpLJGV7t/4Yqzemkc3MVimJylQ/OnO6aprp6YoxLvD
 sYQabpFJa55ckYAC+9rwccy9o+niyu81eARkfmwHyKu54hxJikwVRa3szYCrjzZFT9ml9fZzD+i
 rBeeVdcX5NBpYNcUbRLfNC2lr5EYzJb9ka3Q/vVjXmkHkiBWZJVICYU0+GSyMp13GS5jzGYGsFa
 5cYPgsgYxIMhG6Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: a5nRCQSNVwmhWd6PXv1HOSl5AzIDAEQA
X-Authority-Analysis: v=2.4 cv=drbrzVg4 c=1 sm=1 tr=0 ts=6a66475c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=51BPPbBw82Ww1msbaCIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: a5nRCQSNVwmhWd6PXv1HOSl5AzIDAEQA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX9hlStGQRKZq5
 Kts5SZ7yB8hiXMHaNlA8u1HRnZh6L8bQneLPLQavfwkNFv9Bo3MMNj9HvhX6sBZ8YkDxKj8egHB
 Cw+11UglnXf3G2biVN1yE3fvlic0PgUeSDVEM8itVZJJTrLamZgnVLvxUjVxOx012k2G9YcD1dp
 7CjGAeEcaQQ3pkls5G7f6HCnsGvFt6bf+BdWvoW9ZUhkvfDijkrMxfBPmGvLWOvldh8ZV+8+7sy
 WZnCW5Sx1piBPTi/1wqdtrYBxsagdoYqdo5rY1GiXHQfjpMv3njy6f1Gkk3tIw+UyuKzaHTSdlN
 t+G192k2kipVFt9NjUgtkMB1M0D3PCq6ykhSIuLBJMtbs7QJD/t3GpnBHT4Ba65O3ZDIFekOMcH
 evfbJ9J+2AWwq30NZsDWWQ2Y4txk5OP/uDPucWDKp9hFI7gHPm/rCgJVMZpWk/esJOg2ZLV9gjP
 NH3UTc6G+XxL4P+iW5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX+5PX4EGo183E
 bAJUlVEsj2JjhnQRAHzTLnBEvSkL25UlvJK/QCb1VkbuIE+Y3FpMjPjOeKpkGpoTuRj/vQNbTcR
 CCECyGLxhMZLg+FxZz40+npdh0M6Hlo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607260179

Fix indentation of DTSI file with thermal zones (two opening { brackets,
but only one indent) by using a safer choice of phandle/label override.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi | 4 +---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi     | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
index 57b335f579d8..a3ebc49fcd36 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
@@ -7,8 +7,7 @@
 
 #include <dt-bindings/thermal/thermal.h>
 
-/ {
-thermal-zones {
+&thermal_zones {
 	atlas0_thermal: atlas0-thermal {
 		thermal-sensors = <&tmu_atlas0>;
 		polling-delay-passive = <0>;
@@ -347,4 +346,3 @@ isp_alert_6: isp-alert-6 {
 		};
 	};
 };
-};
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index aa7539d92e8e..875e75759f20 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -2074,6 +2074,9 @@ pcie: pcie@15700000 {
 		};
 	};
 
+	thermal_zones: thermal-zones {
+	};
+
 	timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,

-- 
2.53.0

