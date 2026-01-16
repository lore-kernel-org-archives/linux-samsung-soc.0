Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC460225760
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 17:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768585867; cv=none; b=l/3B+Iql1EQw38oMQAdDM30ZLh/n0FLLC1KDwU24tJGVD/Ugi5G8iuHLJ5SmIq7BoksGmFGELXlkx4WAsks/jwcv6phB1De81t95g0Tl9wYxt3b2OG76U8sSm6vv51JVkL9YRZClnbJqFp4cEMo62HQcpOLJzIIVlnHMzGJ0v3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768585867; c=relaxed/simple;
	bh=4DJWl8W8ASFpjdQCqErUWQZ/MzCeNgejUmTGf48Zp70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TpoOM/OFRwTk38GkjGjxDYbtcjx4Y2dGx/DXrccS4+PPfS7UUQlqJk3oSxMD5CQux2rnOADCrM13MCq7H6sxT5x7dF+oibYWTPDzzAyWgQze8ijCtHP5OQzxHwvJnCsaDE4xUbPdym0EaRmnxARk/548ed/B4ETFBv1Z92frCHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aG//osyV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIAkP+S8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aG//osyV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIAkP+S8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GFkotX3714147
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 17:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vJMMKhzHqoaxfe29q+4typ
	NBQ73O1HQ4GGuQ8xYtxBw=; b=aG//osyVPal8ctDATx+uFqGDVg0rn82c68wzxB
	fLwWjEKVuw19Pgfxzq86DYJul1X73rO0PMKoHlUDROl5IFD/LqGEtIqu8R2ZXlT6
	NLChGWU8fTdhu4RzPzOckpxVxupL1bTeokWolf6TNqxVP5k8ByvjN5e9k2zTOGOQ
	Sx2MRQLPV2QCROhAast+oT7+kSZDylDjW6VKH6okO7R7Rem9pW80Ob85jf+W//XU
	TtWBI1pVfEiLGaPD4KpjAvEg59/yFLl6l5DY7NcEGmq60EWGOhZYQ2v4uK9ScjfV
	+9MpNjpeZijv6kD/zKJN+yBF2I1okbGyd/BSIF153/0bsgbQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96pb4qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 17:51:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52c67f65cso822831085a.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 09:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768585864; x=1769190664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJMMKhzHqoaxfe29q+4typNBQ73O1HQ4GGuQ8xYtxBw=;
        b=jIAkP+S8GVir+7Fv2KXUkuBYAZKhiw3iRKFbZapmFIBRlTnr7fb+xx2IxN1iiWfqCw
         oPkFGPTMENp0hX8Ci22lvBjW/Oj1WbjKDB3gZM9oa6pt0HuP3oE/7K+VWMSqX8dq9wT8
         MwJLLBYlGBEd3iHJcw5Ou1w8JS54VMhvO3PRmqQ/uOckshcNfMS7TWixZP5liPzzMYP9
         wYzdrsBPaf7xoUJcjZ317aIUluXC33nXJHVU1yHG3TLdsN8gRHT75ou5PCoUME47PC8B
         AIWq7BujF9pdh2OTZlKSI/tyyMHnutyDxnvsakIs2KtXF8eBaPwE5Ne9Z8Mn3E0zgcEo
         IMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768585864; x=1769190664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJMMKhzHqoaxfe29q+4typNBQ73O1HQ4GGuQ8xYtxBw=;
        b=Gcn/o9TtBqPTUqkxxGXgILppEev1CVAirKwj1Gt2/fUjyhO2Y/6/EvdCqeUZlynkOt
         3pftagUgaQdbEuV4Sj88E4RjAlklhxRNK/y6Fqma0cHlUsVAjeCFiIFO6v27pljVFM0j
         bC76TOUCi3rJ4FISZ1H5lJ36lEbOCtkwvA6jLsrwVMhFGQY3u/11fDAvNUbKy/sVJGmw
         sPirvCav/v5TYRcBoBx8x9ROcMGEyQoY0C/tpXD48tEgbUxKtNJGIVM9bH9U9QWT5vX6
         pz/hpsvi8HACGktdXgmjsLF08sFOREbV9mD0K66qzlHOCjTnNmYMSi6JkdKBrmVG2BQb
         FC8g==
X-Forwarded-Encrypted: i=1; AJvYcCWTe0LtWt28E44EdMHEtA8v+CYUhkrIQWhOCj8DfZH1EpzBjgBQyCSoruiRAw954CGbY70xfziIzLiN5JL6FlJokg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzPx5omOjndaqGz/zGln+09Gilnb1/B83uML4PU4MWSr/aLIkI
	JWeG/g/WrSxwOJZnzfYmGgzGyJqpYSNgzfADLrwhnpGzH1lxLVPV64cr7OU7uBDKm2+sCxgmPuy
	cSnRhJJXTAGcIoqGL5EdtsHZ+Fw2vCorWSNd3IIqXox1RrFhZOnkhPUDaTy+Bv+OvT/5gdtu2bQ
	==
X-Gm-Gg: AY/fxX7nKu1wt+2yUU1c9aij19V+cK1mtkNxX9Edxfabn7uRJxgnlqrMf7qf04Wt60u
	bUfPZ6lEfgaL7WsOdZNa7ZJtdLmtYCtQsm3XGW0l6agHBcO6mNeKST4n/AIsu2HgKshPk105Egn
	e/qNkd4p2ky23FM+CGEJuQ69AwoVhqjNSJH2TvPiTlvieWijjGGfi8m9y1RTk6103GQNtcuzVVZ
	20KheeXTSbyWBaucgIMkcn3EjhZDRwvarhQGJN6wvILcuJYCrO7Iwb1vydkVtCvdMRR1PxC7VoB
	GoG20aC9NZFSEGGh+p0qLI1p1CGvRkC185EqaQx/t4Gc/dOreXGaoEepKyd0HMtRZE3w7ioDLAY
	L2U8ho3ZE1KGR4wS14RhMtrjBtA==
X-Received: by 2002:a05:620a:a20f:b0:8c6:ac43:5c01 with SMTP id af79cd13be357-8c6ac435fd1mr208512985a.40.1768585863991;
        Fri, 16 Jan 2026 09:51:03 -0800 (PST)
X-Received: by 2002:a05:620a:a20f:b0:8c6:ac43:5c01 with SMTP id af79cd13be357-8c6ac435fd1mr208510685a.40.1768585863548;
        Fri, 16 Jan 2026 09:51:03 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927163sm6154500f8f.12.2026.01.16.09.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 09:51:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
        Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] mfd: MAINTAINERS: Remove Krzysztof from Samsung PMIC drivers
Date: Fri, 16 Jan 2026 18:50:56 +0100
Message-ID: <20260116175055.102993-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=4DJWl8W8ASFpjdQCqErUWQZ/MzCeNgejUmTGf48Zp70=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpanp/DGRp0v2YInR2wy8XK4dGBL4ucHVUJXR2I
 Gi8KqcvV/CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWp6fwAKCRDBN2bmhouD
 10fsEACEqEBdysbkndLS5bzFkPzW2vE7VXa7MEk6P/zjjJwl5bmc9M7k/fALEFalHeEny8SlvEp
 COdGJArnX0EN3hFYUNr9R4dIa0b3rPwv7L9dZLuUn64OXDU6R6j08BIZl4Ugm9hjt6c55emxvTm
 eWC/eupyJZfYuF5BGcp0PqIHGSZEbkQtLQXn3RiJETlZoeAw2x1VZCucj44Hjx8ZTJ8oMQf6gWQ
 3advfSP8Ha4XuvnkwTZBZnrrcqtWKj6nka3XF1+SB6N8jEO5vdN0Jg6tKV59yjfZ5Mo/PJi8KKY
 IrxPvqcGCjHIhc0mPZrjJCRmgekM2ZMlVa/hz3YH/qk0ivLSvGOg8umgusLnKgc1LMCu07dl9pr
 iV2xEsKm+/3vVjXkWGsaUBpEyKetMCkylZ1tsHEfsEmaLIjdCXEWEdQdMsrDQcoD/3IL7hngzEg
 qZxO2ElM3D8KGSh875HEZoXRPrv+yo4hFYMdiHKZSg7EbeJaXtlvB1MsyplP8drOnpsQr3dTpt8
 ppmXhTczUzZ7CVN0IDwsjZJmkFU5S9q3QPPyjykAob7gODxVAimb3SbwXbFEsmrCKPTwCVSS3hZ
 rpWdND70uAsP/sAi28ppWyMd/ayPYRNl+9EALNu+WLwwh0ASjDKTtvlomajoAwANE9OM21YI4A+ F4IZ+scwkHUj0Aw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEzMSBTYWx0ZWRfXwTIB7/N2hYu+
 M/wTcKri38DDN6nWLno5Ank9CPAH6BA3EQztsIV3AxF3zQ/FuFoy0Euvaft5NVq2hIxt3Yo4Z5m
 NyyHU7p7NpBwLyYe0mpE+MyGZQFT8s7EZcRLd5PlXjm9ckTbwuXJu5MeMpYfUhJ0azjk2vfzmkn
 ZhppGr+tHyilUUNxY5fUArSf/sA6Mo/HBWF11Wx6zMSnDfLVYpzjtky6m9F8RCQfgDz8PEO+PIv
 Wk++NK7GX3Pzk31m5dTd0/IlsswKGj3wEpH5fhLq9XcvrTa6tvxVj4r82gIkDqzpbM2FOfG4So0
 xQhWtrYDGiqhlOkGBGZm4KBnkMoHYIUrFGhwgQ0WqIp7Eh9vuKqUjGjZIjKUaOshpPRMtpqtddn
 LtNsR6mS0drHpNXfz0m2xHnq4T6IS0n7bv0LhDvHD/X5g6DJvPW4phxrAIMc07ArexFOhSOwesc
 Glk7qqAaWE4q8ps7bTg==
X-Authority-Analysis: v=2.4 cv=M7ZA6iws c=1 sm=1 tr=0 ts=696a7a89 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UA6_GPJISWn7HxH5klEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -dfQVuKj_3B_CkTHxSZUxsexqcWgeU0o
X-Proofpoint-ORIG-GUID: -dfQVuKj_3B_CkTHxSZUxsexqcWgeU0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160131

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
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

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

