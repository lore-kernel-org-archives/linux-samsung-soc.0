Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FC034CFCE
	for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Jan 2026 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768146350; cv=none; b=J3jq7OvL2uDpqdlYMsC9tMhzlJbyc57neH2VE4Nun9iMIuvu51+LnaXVQmb+pIYC6hfMz+gRFpGTTI7B/Ueireo+2u0TgaT+oSUGO+zCOg618HlPWveYWhjypMtnAmnMLmanDz+AoZALmLGj+PpN5SGLcayPzjRXWV/004wC4SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768146350; c=relaxed/simple;
	bh=3n8ScSa9U5u4J9FORj/r+W2S9YcBhcL6ToUsDlBBb8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OYYj/g1O54iwmxD4oXr/NA1cYvv8v9x7xl+Nr7s1FRCivULPIxkYes90XNGgAJgiQr6MwOG5g3ALhk5ma6SaBAbXpaXIstcqiZjTvhAqyvUOm2804ztw/FYBaF9eYezNBClaNxUREo0XLk9S77ndj9h58kzHxg3U//tOffBfhcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5fp5/fY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IoGiwdLm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5fp5/fY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IoGiwdLm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BBNljT2626875
	for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Jan 2026 15:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWkiFRWGmUEeIfo9pk1+SznEx7y/iiY47QRvAY739P8=; b=h5fp5/fYf8Cp1u+J
	eNTAV/cR0CVaewv9cUKxrGQdU0Seky51/sS8dGfd4k4x1+bpQ/XLZEywiHkajwFp
	fkUtmzXWhF7YzKB53+ZqsjKEjNn67rTZePTQbDuRrC6nok7rADYo7ue0Eq/mWX5j
	fvGW3OuGqdanLEseF445GDBxLCbcG4wia3crPz5T69WuQEcqYm1kzBOUre7ok5Nx
	JuP3ZDU8Bc632si73nPakeDRozNw9pRsZqbUqMc6QchjCBYZq8RyxrCWtu72W+0v
	/MM3TOrhhgeM5DzM3Pif6mwAatw56DvdVbg/ozQ5kF793n3fNzag8DR0+YMMHdNk
	c7YnXQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkeusjd9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Jan 2026 15:45:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b17194d321so854181085a.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Jan 2026 07:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146346; x=1768751146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWkiFRWGmUEeIfo9pk1+SznEx7y/iiY47QRvAY739P8=;
        b=IoGiwdLm5NSZ+UTcRjRFJM7jR8n5QV6N+9xSbvNjTLBS4opdzZrIqZlduULImNsEcN
         pPRAoTlU6g1qp8NE5PBie1Cl+wGpEtOQrKJqF4kFdTWBb5UMjJjYtB0ECk0wDdqFSAzq
         uOlBKdXsI5uyOrCKZv6orMNpYkEzfbeP6SHlyLB8zzkh9dAq8Nlz/brfRL935l91Z8nI
         yGJL+qXmYllg/4bo5c1diLJVZ/cgc6JPNvPQya6Pt+UfwFpKC6zdlwqSDs+ADknIkoqA
         fndRW2Yeme+TU32FgYDyx54pEjwP8KdDch65Xp02zV+Bl1BRVbctWIAmaA0z7bq2krHX
         5M2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146346; x=1768751146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YWkiFRWGmUEeIfo9pk1+SznEx7y/iiY47QRvAY739P8=;
        b=tR1WeuXwyJeluoyhtGpJWNBO3O06gg/sr+IPLODSknCaaPDW4i9Czg6bqDrS3DKOjd
         eixnw0AXcaNBHx5SWVdl0T4/B491rACt5Yc48MEoYak+9ny+3hS49seFUiVIOOTgmSp4
         aaNUuDT33Y+E2XR4grYRbWnSByssWB4Ic51NWM9satkQ3TnwIUP0YE5RljRh5pm67EdL
         nCsJUzVSg75LdRJzIj6yyXJ4qH3Oqc2Sk1qWnUztk0jrRzbxfhrphMR6stNN2V3/fPDn
         VxNNnv5aRroZ1OX9BBWcydNZICWg9gFZmFeHRTQefMh3oKhHZBjhxGOt2yZNm9+WpI8d
         8zUg==
X-Forwarded-Encrypted: i=1; AJvYcCVDuxXoYgXlw66ShRCBrlwWshmqbaLJv9nXTpq9133HD9GKKTHdY/bAZleub27Tlgh/l9CAdMOeneNZg6ydu9K2tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzREyXVBhBarriqvpFipkVDP6qBG+GExq0ZtciO12m6ex67Sxaq
	XOg4dAXcHWxz6QCDpgBmFxL1hATRi0rO4XE9uwgsNujcKucKeOW3DwGi8JxC3alKj/UzHr8nlfM
	UpMeeNBz3/wIrt0ZuC6Hzo2yBYA7ZVEaDceiFoby3YBpzBkEMfcLfzUmZLO9+UkPBxjQ5LoHFzg
	==
X-Gm-Gg: AY/fxX51jDXrZfjtxhLuLja4oI4XM7GtGdoepJ8BckXtgqGBR5nnYuFJINmkotH2k+Q
	1/m+nOlOj1BWt5q2NIl/6ZcCb1Udbb9T+xaoGtPGVNbvbjWTETBw7jkh0kcSwtLzgHejk2NM68k
	G8Oyyf3Y2684zhFQXCY7TSy0Afj4kIdLUuWumEAaSEhucbi0CstBb9kc+zZVJkGws0iX2zByglq
	nnVkJ+0ayvBsK/nD3sbIOFa9b2MWSYTLTRTSEQc+7miCkWUyeMzFV9KCAtGcgmZ5WjZovcDjgzc
	w/R4AHjrM+7VO6a/L6yiwmsT01mLErhLEWCmv0bfA9jIjV1TK2SiCnfQpDGxoWurLrh2oiom0i/
	Wgsao1AYtlHFflF5h5VksxGtEcnCveDeCow==
X-Received: by 2002:a05:620a:3714:b0:8c3:7e51:94c6 with SMTP id af79cd13be357-8c3893de845mr2022081985a.60.1768146345896;
        Sun, 11 Jan 2026 07:45:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGKCvt3hBx24DOeWZG5DTt6M06psOg3clXXiYCgTQKo6WJrNjb3r8dXi6KuFzWcDmgDp9+yw==
X-Received: by 2002:a05:620a:3714:b0:8c3:7e51:94c6 with SMTP id af79cd13be357-8c3893de845mr2022078285a.60.1768146345392;
        Sun, 11 Jan 2026 07:45:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1636605566b.57.2026.01.11.07.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:45:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 11 Jan 2026 16:45:33 +0100
Subject: [PATCH RESEND v2 4/4] dt-bindings: watchdog: samsung-wdt: Split
 if:then: and constrain more
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-watchdog-s3c-cleanup-v2-4-fab2d21a2048@oss.qualcomm.com>
References: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
In-Reply-To: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3929;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3n8ScSa9U5u4J9FORj/r+W2S9YcBhcL6ToUsDlBBb8w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8WhdFP5yqpjM3ZPjrwLVRO3GL56PVsbsEIff
 KyB3+gLX3GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPFoQAKCRDBN2bmhouD
 1/KgD/41ajtitwvCnpMd6WTsG/peGerhYrdHSWLTNBE88YKohzQug76g2yb2FEezfpBDGmBCSex
 lbTw35oqqX5Q4G/NrQfaEoauXl1v4txxnODhunRRpHbA4aakwYdR6l0A9xkZ1SaxaBqrr14vPhn
 IiKoYHhQfWS36aQ2GC1bkSVkHWn+P/GMfdpqfgzDhVFrF44eFTRkvoqkqpZ00FSskZhQ9GtoV6U
 CXemanWg85tCLKDeiqUsyUlyQ7sjI7Xyw81ojW248XQkBf4Du+tUSVtcqtkEDTp0VTGaMrnnXZp
 SlRjQENldY3e6FR0DpkMQ805ImLmtEIT39PXyoWqAj2+BZ3TBdX0AB5M6QDOZfzXLzUArNv5NFq
 x6rt5a/iYoGutMAMiNMoNgDOjKRvFpGCrewzO0YYGZrBgn2ID7T7TvJLmDhPBH0XrNcwFfqkuvq
 eT3i6oG0kDSJa/Jd9OQqe5NkuJxvfWWEjFN61zoN2qWs6Di2egLKDTfb7uWI/vh3lNGZbG94kkL
 m6CGpbUI6k3yiuG/JOS6wgDDeJ49VArLfFy4zBWGU4AfsUazBlbN6uK0eAMP/zrHuiLZ8+AAVwu
 zD4JyeqGb0SKokpTfp1PF5gWKuptqd2g0SG1+wxnBOCFcStZiZv7V8MoBAwFVeW2kSgqiM8gItA
 TIUAaj5Mgl8upOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: MlM5U7vJs-8dB0zUzbw7FNMOdR2DpPd4
X-Authority-Analysis: v=2.4 cv=GNMF0+NK c=1 sm=1 tr=0 ts=6963c5aa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=l-N3HDM6Fn6Kim4WiOwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: MlM5U7vJs-8dB0zUzbw7FNMOdR2DpPd4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfX29MnR4Ec/esA
 cFe4vvEYjOTeXwsyWD8UV1+Kch0Aydhe2+mKzssAOKcucHET/wKVlWQWJXyIsU+A9HaTYlGu/iz
 T+WHat14zK7sG68BdkBXXtRQRAyTwyYVgXRu0IzU24q4Ew3HLhpelMkOXzKckXA0zNTynQuv2Ta
 SHCAFd3JlkKZHb1lwTE55iSNPLuse5eBg2FEDJiWLPolWSmZUKUTi/Jio6r1fp+XeaHUZqWHp0q
 G4q36pGysc5ukMeURrq6qOLIFFEZLfOKwp0Xm/uYD7dPVonr9FRxSvWqQBYZLlUqnttBDtfFwuL
 23WQi5URjiabXWN8WFgloVQBGTbv7vpjaUZ2bWNm3t/lRfdo16ZBflqrhvrhFped7o882XMP9ay
 VGfqO/CT0wE9R3oQNaxVWzrFDD3inxe3JROk0QXzZV3vKfGJyuCsq3+F9+X6lEHkGIoP7LDYIvZ
 PKhTz+WQbqKKvJEQpzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601110146

Binding defined two if:then: blocks covering different conditions but
not fully constraining the properties per each variant:
1. "if:" to require samsung,syscon-phandle,
2. "if:" with "else:" to narrow number of clocks and require or disallow
   samsung,cluster-index.

This still did not cover following cases:
1. Disallow samsung,syscon-phandle when not applicable,
2. Narrow samsung,cluster-index to [0, 1], for SoCs with only two
   clusters.

Solving this in current format would lead to spaghetti code, so re-write
entire "if:then:" approach into mutually exclusive cases so each SoC
appears only in one "if:" block.  This allows to forbid
samsung,syscon-phandle for S3C6410, and narrow samsung,cluster-index
to [0, 1].

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 70 ++++++++++++++++------
 1 file changed, 52 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 51e597ba7db2..41aee1655b0c 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -74,24 +74,7 @@ allOf:
           contains:
             enum:
               - google,gs101-wdt
-              - samsung,exynos5250-wdt
-              - samsung,exynos5420-wdt
-              - samsung,exynos7-wdt
               - samsung,exynos850-wdt
-              - samsung,exynos990-wdt
-              - samsung,exynosautov9-wdt
-              - samsung,exynosautov920-wdt
-    then:
-      required:
-        - samsung,syscon-phandle
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - google,gs101-wdt
-              - samsung,exynos850-wdt
-              - samsung,exynos990-wdt
               - samsung,exynosautov9-wdt
               - samsung,exynosautov920-wdt
     then:
@@ -104,9 +87,41 @@ allOf:
           items:
             - const: watchdog
             - const: watchdog_src
+        samsung,cluster-index:
+          enum: [0, 1]
       required:
         - samsung,cluster-index
-    else:
+        - samsung,syscon-phandle
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos990-wdt
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock, used for register interface
+            - description: Source clock (driving watchdog counter)
+        clock-names:
+          items:
+            - const: watchdog
+            - const: watchdog_src
+      required:
+        - samsung,cluster-index
+        - samsung,syscon-phandle
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos5250-wdt
+              - samsung,exynos5420-wdt
+              - samsung,exynos7-wdt
+    then:
       properties:
         clocks:
           items:
@@ -115,6 +130,25 @@ allOf:
           items:
             - const: watchdog
         samsung,cluster-index: false
+      required:
+        - samsung,syscon-phandle
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,s3c6410-wdt
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock, which is also a source clock
+        clock-names:
+          items:
+            - const: watchdog
+        samsung,cluster-index: false
+        samsung,syscon-phandle: false
 
 unevaluatedProperties: false
 

-- 
2.51.0

