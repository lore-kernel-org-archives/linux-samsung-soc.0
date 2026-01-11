Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A73C318BAF
	for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Jan 2026 15:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768146344; cv=none; b=SkeKZT13jRWsGXNbcTqQixqV/Ti882SA4LaB/404sjylDNW6KrSdbJZwvQmTwhfF5xPRLBJVstsJyP3LxFZzt0vBMmt03uRt/WPwv21zbfDsnFSOAOMlp1mgrh+ZICShrJBsU5oEoaAtLXeJZ83MV5fX0tS1qxGTP68d0HX4Z4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768146344; c=relaxed/simple;
	bh=SX21PhGZicijazZ9aMiqBXstGUcTFn/+qwMSgUuCSYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f/uSY0+Jf+iJcsv6ODVXYkqUuODfQYTis8HNjBe4x6DvfOAyr6Htqk9PyRnbY8xneMrbsb6w6WipbAkG24gqVkn8PI2G7LuixcyBicKvkjMjh/Prl1M+kyHHGNUwyh3AcnfDJ50UQqTT0PUWVSmg68bNZrjzwq7J1GoXK1FquJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOHR5KQ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KISrNzNk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOHR5KQ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KISrNzNk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60B9c3YS2597035
	for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Jan 2026 15:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=; b=AOHR5KQ6vk69cq0F
	Oisz2VcBT/2zKDiOrXp9JQJiF2Rd1YMqFY7n6wbDqOgpZujq3C/+YUY/0/k9d3x5
	fLXxbQaviuEwFK9/7BfOSj/T+EU4iu4wVO71taAkhKgWY7jf3W0JiJf/EJzfr2vx
	ma5rziSx1RCzuZQM678M/vx5lXDWlK9lCTQSE13Hwhmwy6Ndx3w5HyvB/M8sEVZV
	N9qu/nYXdnWYSjwCpQIkKfSq19hrOFuSYprtLveP7BaBGO+YKexYppUKHQqlVGGk
	o2hoxwYnyknR8JVIV/HAqynQITrRERXUeuDcpIJvTDGycK1FaGePL741z+VVskGx
	6X1kNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu2e67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Jan 2026 15:45:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b51db8ebd9so1902195685a.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Jan 2026 07:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146341; x=1768751141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=;
        b=KISrNzNkXThqG9M0A8ZEHMZJ+jy212/z0it4u7aKjV6eKk9TeJYBxTIzuqmVD/kJMf
         1acyijVZAMWd1iyU+0ac1iXhYpFH9h2zhk7QYLMGqkXz2Uz1hbX9hEWD4XI8GAtvgvUy
         GIYjRxSX3DXafEBRZnQqKejWO1cURwhofV0JcCOeLG5s/pdGnKuChBDE0vfsl1FMUFFr
         RdD29OwaKKQhGN4fpmrcWW09+sh6Bin3d+2yPpYggfKvx6KnBZJSx3Qra4eC2tVRq9Lt
         M6ktV63kkjqAfRGksk6sJegw5U7M7oZAGRvjCEYT/4CnZPkUNllr8eeb2TpDcWVZ4SXs
         DJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146341; x=1768751141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=;
        b=gfaJLEmiqQo4z+MBpws0noWYpSiStfifM+vGRDLu3g7oFRysUB4wB526fhyQZkXcO0
         9YVdkVDo8C0uKby5ILFBKK7pTlCmcrVkBx0k+zKEVmkdbjvPdwiTBbErbA5J7CWYOM6K
         ah7aNS6W2SStBHHcx2W1+tHlRp0JqfGO6lae5U350xfW0MraBTvEiIutIZdUZa+g+R5G
         t32oYBR5O0upeLQdLI10gsIHhg3RVL6BFtaAt1R8qPeGsE4/SI5KIP4xv+uiRvvyzLPn
         oWEpimShE1Ab4iB0XMHwkkHwSWra6kV5qA43F5k1J1exF/JABmwr3ks7IhUCjLJh04/g
         OJQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW2IN0njY4CQwFHkZBT42B4z4yFyTWRelpdoTWLoFg+u8+n4muzb0UvfS6xTCtELt+L7iGBRlOEvo5fn2BJSZzWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhZuhGyfx4mpCgW6c4X46TsVXouvPjWFr2T3rJGK4iaCxT+vMD
	rjChkydMt01lrCLRZUedSKIhhAYn7aGb1SRnOSO6uoIQgtXFnbqEt5vVlfgEYUranrRW1ZYa5uc
	QWNzb4Xv3gDwhdEDA5+uc0lxfxzCFNZC3+j93EOwcOf6i4Xf0PpRgcVCvXloFL36tXk+Emv0zjw
	==
X-Gm-Gg: AY/fxX5JCc5oGJvY+7tIIF5W+OSp1z+6jw1Z3eMoT4Sw5TegX6PdHsvkS1LPEniOLy+
	ZPAFYxNrUDwge31EYf/2XeO/QZaJ5tCTN119XKqZUUHYWbC8E0hBatWLFXmDKtbxdSo6QTWz4iN
	spVmXXITsI1NNoNZby+tJaFOuZtklvlI7CqD76k9VLi75mcVZcYkTPD3CQ2wj+tp5Vue4XdENct
	WqI6ZQbmmLU1x2eS4l5UEors/hPtzHBN0wYhMY10+V+Q4DaBQ1RMt1FYO30yhouEFVCDciLH4w6
	z7UBT5HSgrO0ljGsOrzWG9sbTIEmAIKP1/YJWZtyjrdtnVnhAv6mX1jWH9LIE0spezzgnL7/fwp
	9ZOsu/jawKvcgKHVUSTX/yyIipQDjPN+RgQ==
X-Received: by 2002:a05:620a:29ce:b0:8b2:d791:3d25 with SMTP id af79cd13be357-8c389379d70mr2236622685a.18.1768146341379;
        Sun, 11 Jan 2026 07:45:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHg4gxtJOYaXuSmuP0DZ68cvwexTmAhTOZDXnjdFWUYJSLhByLTbBVAtxG0UuMcfZJUIs3ExQ==
X-Received: by 2002:a05:620a:29ce:b0:8b2:d791:3d25 with SMTP id af79cd13be357-8c389379d70mr2236619585a.18.1768146340967;
        Sun, 11 Jan 2026 07:45:40 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1636605566b.57.2026.01.11.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:45:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 11 Jan 2026 16:45:30 +0100
Subject: [PATCH RESEND v2 1/4] dt-bindings: watchdog: samsung-wdt: Define
 cluster constraints top-level
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-watchdog-s3c-cleanup-v2-1-fab2d21a2048@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SX21PhGZicijazZ9aMiqBXstGUcTFn/+qwMSgUuCSYs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8WecilDnF+xz/UDkEdS6+upqb5/SbrTxKgVt
 HUxynBTRdqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPFngAKCRDBN2bmhouD
 1yjiD/9rFks+Jd5fvoffAqWTEPjywYcIXmgt1FoS7GLxbxowMs6OHtEojkAwn89FUNSGIIsqKVz
 yGan5zpfFfhzSIQBXcpIMrRFZtvidwywmPsMdx7YkvpceIR83L0tFIILNi0NzFMhzQ/MTgJv3Es
 fQlQ988K5gJEmryRzMKCEd8ylkZKtzjGlGkwcMJDjtgciRMkYPYpBuT0z8eqWW6LgwfRfoyKbr+
 61NlUAMfVTq9MJH8iQIYj+yi5P/35PhA0BkPkbeyYLHLgKGr8oWe4/eYYAlV8Q0GyPAxaPKhIRo
 eDGiauC2ZLUQ41PdQz1YofB3GFcnY1red7Wqf3o7x0gekxW8gOJaGqOTri3xypweyzu1FzqvXtE
 FMnUuJWKmzeH0QCYYwudIBbTMbHMWtSwxoRSiBcMl37YjIZi0z3YqUOBAYQwQOViyRv5JPFb147
 w85ESzmeCodtNGFI9I3t7bRX0cy/NgSt6CPI3gfESYJsXpft5xO3MwIhchgLCIhsb3EoikT85R7
 3ru9L/MWItx1j7MbFLlNSbjwdIgeqh3IDxf//arS0Qy4HNhoa4OLnSSsWXEbSExiH6qeNcyyOJP
 rnciTWI1Xn0TQx8Jqxdr9RE+TA2WjSSlyyRmp7/dmdlXiqZX3X2wluRk46+A0hdl05Y/7d15j/3
 fA3dwUn1+p3W8tw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: vkmVOLzdfGDyVNw38vXBXtJ2vGIfFW93
X-Proofpoint-ORIG-GUID: vkmVOLzdfGDyVNw38vXBXtJ2vGIfFW93
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=6963c5a6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RUZyBBiHXQlI0l-aNaAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfXy9TTvQimKeJ2
 NCiZxpvWaONGs+miauRE8OvHIltyfPk35ZJwPI+Hr4qw6fQaPvpQwbig9KvDz2wynXlBqZewaF4
 x6juRaFcpLYuI5LPRrLihNqEQkaK/s+/KdpkaJPihRM440gqJUsYqi96SLVEEau2MGwNusmTXyY
 vhmTIM8+dO1wyyCex8xIaSaeKQC4RoxbQfTy2EWFMWgAbk0p4rGoUKwhzYGVIjc9m5Anh1V4Cdn
 HPqUphhXRrIHoe9B3XMwTgMRgGOgVNTPB9gPdUMMkC1dySFWgWsIcaOUfcD03FRq7MMpU8OLd16
 r5+QXd9UojVEjDXtUQFVDDdIMUqFSE0cComYWR+5yqjA8ljRMrwyj/D2z5rwMiW84WBYBH3jSwG
 EAmozbkD7oZ4saHy47MpAMQS5uKW6uvc8uIOS8OB52WpKBtPHmza2+R+9x3xwUNsjRx38KNqI/4
 flY0BKjlj69z52rZziw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110146

Properties should be always constrained in top-level part of the
bindings, so move the samsung,cluster-index constrain from if: block.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 53fc64f5b56d..445c5271879f 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -49,6 +49,7 @@ properties:
 
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
     description:
       Index of CPU cluster on which watchdog is running (in case of Exynos850,
       Exynos990 or Google gs101).
@@ -104,8 +105,6 @@ allOf:
           items:
             - const: watchdog
             - const: watchdog_src
-        samsung,cluster-index:
-          enum: [0, 1, 2]
       required:
         - samsung,cluster-index
     else:

-- 
2.51.0

