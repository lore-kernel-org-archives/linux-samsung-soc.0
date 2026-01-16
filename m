Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E68335067
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 17:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768586218; cv=none; b=PolqpdgzWcPF4MT8WMrkln2TrHEUpeebrFYaZKjpDBHtjP6rtogiS3e730JrtIiKmt8bv8RGamINHQkf34DjsigL2Ps5L6xAKoRcp+px1wCSprpLiChD/WL320A7DaalQDo4J4lwkDIPjkBS+/cirkfRWVfsw3tIK4HkjNyb0kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768586218; c=relaxed/simple;
	bh=DVV45J1cY5nF4nL7uWGznQcGGq3aUv41+PxU/m2Hx48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rvwd32+H8ftxwJ/RHCdrDVp34F1krA0CdJozBUhzMQxJG6mqGeA/msPibPNnqeN2ncywRlZ/OOQn4RAfEkBCkzjyevu+D/VHLgmhm9V0nYJZLWkrrNqozc9ULUUAIiONrMHIXo2NEN05shevqDePNDUceRV5NscqMI2tk+6S51g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffwubh/T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwMrf0yF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffwubh/T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwMrf0yF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GGQull1240876
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 17:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TcRl1K8Zou/0SnwCBD+PO+
	EZnTQodFRhU30vSdiASZs=; b=ffwubh/TjLRVfcRWAAnCsP0af4dUt2YGVeaorb
	ZRCFSKMBq0KYHJ3rr/as0WJhaGKa4fp3drHr3hC5kbEHgfkgUglek+4wpOrR+smW
	R5GUeTl2tlkBb83SBBCSvzs9+YGjm1Uyjg2DTL5Nf15XDIp7oIKQm7MrmmGAkxOE
	pdXdtdfJ7kksIdjxwZJDVbUI7a7RyOaYFAU2Qh2gD8tk4reooy+DoBew84d9laFz
	gIoH26t2sD7f5B6kxyuzCUV4Y6M+Z4ukyRbnEbyOcfKT0GYAOEL635yNfUknhtBX
	RW6DIL5ROymra6ze85WMQWc/DNpkNcj/tMiUwq9eWJE5njRA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96su3vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 17:56:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a87029b6so227110485a.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 09:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768586215; x=1769191015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TcRl1K8Zou/0SnwCBD+PO+EZnTQodFRhU30vSdiASZs=;
        b=FwMrf0yFf1T1cgjEGWfkkiqbGGDoZwpVNPoTGW6zUZmGSuu2VnfV+uE+mlTpzVHvde
         D2K5d+V0VQFQgpaxZiCeh2eL38dmpqG8AFkbb3nVUMnB8GBLr17wKSgdvuGGuDnlbj8t
         RNzReWnxw0lQZiifkR/YMm4ZhkMJLidS+a3j23AcgKwur+866dpOCiST9CPyMrPaTh03
         eYJdRwWEBK45GaeyDQ/s6V+Dhe4SNTydwTPpP2NcHSqcudU7G8TwxRaIsCsebhPiZaq9
         ySy1gVdrqnbHir0w/dyiQCZUQ7dbPtX2Sf2mgXDuGY7LRQbiEYzddMXeWyKsMMQsocxh
         sUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768586215; x=1769191015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcRl1K8Zou/0SnwCBD+PO+EZnTQodFRhU30vSdiASZs=;
        b=V2VMJjHEe/tQ52mIaq6FUZfDcN7LaqSo13IICMQbhlll7Q+sNikFQhZcuHMJDEzsrN
         OPYTMsY0P4WSkwuzuW/n1asjEmAuTPBJ9N5EkeX7owxocP3zeRPuvMkQiGH/ECxejAqB
         5pckjDk5j6XW+Jxm8IL+jYjlutJ/am4F6XCgDtbCVBb7Bu3tB952mePTZXbvqbk99nxM
         dkf90LnSDhr/AEteVm1q4ECOCy6xef9w3FKzv42TqNQCD/rFcJPDgPNwCCIe96hxiV6y
         c4h8HSe3TRsiUeAB0KfvVsPMzW3f3G8STjWI0js1LeWi+I04OT6G2tLFtfJQ8rTdltn2
         gDgw==
X-Forwarded-Encrypted: i=1; AJvYcCX5eP7F+prx7Mcr/hkIhvVECvMfz9fF1q91WsbYt0oQM4p51OvFZJPekMRHBjRmaMLditY6ZBTCY8Jcnz2aYB3Cgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLh1CeudiwFQ60oGzAv6zZIbEhrCfD3Ts1PV4LLWcUrH7IdOeG
	QDMfqE9xnBZw9TTjP3Hlfq/yWTtR480XLUJeHqjxLOzV0yOgVSYzn44Qa57VWSP2gmhlbLHn/3c
	JI31UJLVzVmeiWpACZTQwyClb4dS/6uYj2fjXkg03wpNK68aFZVzsXb9f+0buOFl6352WIOZ3GA
	==
X-Gm-Gg: AY/fxX6HLy/568YpYGClvIA6Ih21c/hKFU9p/d5cqN/YhiYAZF1r18FnmPvxHhcoIRf
	pop6kjqdVAzD/Z7Ut94U9kLWdwAAWusVWqysFrqZYCQVqg5+B/taRqHTXJU8jmrrixvZff6aScq
	re+ZDHm+K5R23HdrCKVoLIL/8dyVN+o/hgvhlOTRkgx+Uc8ACTm5mv8WE8hRXYMC0IBezGwhPhI
	uXZU0Xb54fNfzzHx+kvISyaoGHPMEiqRsuNQuDXy/KMkwu5vhOSJ5EU8DXQvS3K0ixatRHVZ33S
	Wh957qfLZKPKQB1pOiKZJ9VXs4pL0jv2OI5St9WBuvjEF1GV+mRcB9QD6YXAo5SADpIUL/o0X+3
	cN9JuwQ+bv9Tbpm/eD63posSYcQ==
X-Received: by 2002:a05:620a:7014:b0:8b2:ea2b:923c with SMTP id af79cd13be357-8c6a66e90afmr522551585a.14.1768586215073;
        Fri, 16 Jan 2026 09:56:55 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:8b2:ea2b:923c with SMTP id af79cd13be357-8c6a66e90afmr522548585a.14.1768586214579;
        Fri, 16 Jan 2026 09:56:54 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428b954esm108057985e9.7.2026.01.16.09.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 09:56:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2] mfd: MAINTAINERS: Remove Krzysztof from Samsung PMIC drivers
Date: Fri, 16 Jan 2026 18:56:47 +0100
Message-ID: <20260116175646.104445-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=DVV45J1cY5nF4nL7uWGznQcGGq3aUv41+PxU/m2Hx48=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpanveDeKkCoe+4k615oL524WkxDQSJkEyNtbVe
 8Z7K8qyPrOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWp73gAKCRDBN2bmhouD
 1wqqEACU5xs0sGN9M6BhAVKn/JOVlQ9fcyNg6O3PW5RYNpGEbhNivHnfi9aYUGEa006Gs56wwCi
 14dDNx4GFZqefKG7uk+oQrbqOiMfLUn9d/Exzj95c2nppmTy+OSkKkimqvTEx4aPYlVPBPTvU4O
 8LK7P1fLkJM4t+Z+mly291R3Wm0krgTDa+1NGd1oV05xoqMYJdLlsuNlmOSpQc2ts+a5r1dHvtl
 hRYnro5Gkr2J5FYpc1bVkBo148sS/tzcaGOB0qA0/QrBO86DL/3DB3geSscrltV+B7bGO5uH3BF
 Dnftyr2twmUR1+Ma6lJmuEW0U7cyP64OTwelyePr/5ZP7JrcXf98etgcsSwtqaf8g/uBJZwPRCd
 rZNYla9utIbwgTnZCmvBqpEbH4UnTtnk6w9lsjdPeBCUJsd2tDkZp585YPiS30wF++nhox2F04E
 ZLIZNiIU6gKq9Tp4hIZSQvrt/a+oorYLf9whCJtDqEoatNxTG7oY7X5toZ4VwYNRg2zTX5NMEpE
 GT8uE7btEH71rS43/3ulBhE6pQzz4R4KkgbDbB53qlQQq7Jmd/rHSCdbiKyUpUYv/2Vka1DXafm
 YoLxZxKcfMSua1KYFFo0Q8T1Iv+i84xOx4qNkDjBZ+tiYoV5ka/briOQCot7a3ocxj0ZqWSkB1j rWEu8cxJcH2oIFQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uZeSNo1o8Ju7PFXAoVCQj4Vz012rEjwV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEzMiBTYWx0ZWRfX1vImtEUKh/Iu
 Ho4D0qkKKs+rCxaQDvgG70DH9259fXmNgb9bjYC/713tSTM0GaGbKzC/wZm1rWaAKbOJBse+aKo
 9k1HCNaEr7KCZNp+eR1bXYkZpUNEbxzejLdZZnNzMpWDiTlqDdfvxJIOPBNaorWR1/s+aZNkwfE
 gI1C0fksQDSpPCJBnsMJTeCO364VdNw0GeOFwW+hsnUjJLFcutp1ZukKxW4yLQ+WaB+cJb2yQ9P
 kRlZSUS5zpFfcSNXvxeHtrwG1FQb1VcPoiTc6eEjXv5CloN2qD/+RV69acid5E2OxlJocrvfima
 HsOGrfju8KEO1oIM6w0ccasNDQqYl19LmhXEXzPPMjuWWE2QoIfbRoBxLJ+pux0AxTJiCGlSVU2
 M5zrr3Y6KGMjCoZc8iMapgABAX7mbZBD0VtzSGxw1n+DQZ/BhT+a6D6wOJOno9kaDRt+ESZeJj3
 wox24Mnlw5ET9zktD8Q==
X-Proofpoint-GUID: uZeSNo1o8Ju7PFXAoVCQj4Vz012rEjwV
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=696a7be8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UA6_GPJISWn7HxH5klEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160132

Due to lack of time I did not perform reviews of patches for Samsung
PMIC drivers last year, at least not in timely manner.  I still can
perform limited testing of the code on hardware, but that does not
warrant having "M" here.

Maintainer should be responsive, so drop my name and shift these drivers
maintenance to André Draszik (from previous reviewer role).

Cc: André Draszik <andre.draszik@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add CREDITS entry
---
 CREDITS     | 4 ++++
 MAINTAINERS | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index 7a2a2e1ed806..b7de4ec44d22 100644
--- a/CREDITS
+++ b/CREDITS
@@ -2231,6 +2231,10 @@ S: Markham, Ontario
 S: L3R 8B2
 S: Canada
 
+N: Krzysztof Kozlowski
+E: krzk@kernel.org
+D: Samsung S2M/S5M Multifunction PMIC device drivers for Exynos platforms
+
 N: Christian Krafft
 D: PowerPC Cell support
 
diff --git a/MAINTAINERS b/MAINTAINERS
index a671e3d4e8be..883886cbe503 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23384,8 +23384,7 @@ S:	Maintained
 F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
-M:	Krzysztof Kozlowski <krzk@kernel.org>
-R:	André Draszik <andre.draszik@linaro.org>
+M:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
-- 
2.51.0

