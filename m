Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C7A3B6C16
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Jul 2026 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903465; cv=none; b=cgjNDyPuxylGMNa3WgtUa8sSDPvTFbkowzmIuX4F5BIjXdkwynmNU/HdTwle8BvX7zgv37ZnEBeLkFaRWEaE0o//8bxaJ24NXQv9vfWYAQ92RwbO5ZYe3wd9CBDwaopzSBJmfIimocSxFL1522uu/7ingSquRc3kki9gGN6ay/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903465; c=relaxed/simple;
	bh=nvB5KtefDLzhGr4nr8PZc5L3d0KZFe1ZJDlxsS3K7x0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIyPyUd8nKDRcAGGcFW3IfCk2vSKmxXpRSsDy78oRM26si33BX+WwpX1i1uteTvRlG3icJz9xkTelU6skrK3VRxRdNviGo3Xnas9f/87Zwo+XsvYszRcqJM7R74DJK2NQgkhxpVET5+H08QLreOWC1NWtmUDaufWskdiDzd/Xto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nR7DbFs4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrDbkR0n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nR7DbFs4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrDbkR0n"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8jti683286
	for <linux-samsung-soc@vger.kernel.org>; Wed, 1 Jul 2026 10:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jXHclo5dQ540crOYbfBiFzJOGlNRFUHjEdG
	h+kXSkiI=; b=nR7DbFs4d6K9ViBI8donvO0Pl/D18a9VYh3S+5SlmOYRyLqf0Bt
	Zob/IRQzxPKHg/08xOZGt4oLY8goikgHavGn+7mCfTurL9WBRyeSDOQyoQGLOW6p
	Ezr6VXBeboWcBGb9ZZM/tuulOfBMcEUJuv6biGTi+Q4nafh1d2rAsxI/ma0nL24B
	vLWbfaCa3Wbmt52RyPIrdb8i7KghLdlk551npxurn1gpdtsYtIB6nxdcwvQZEYZp
	G0NZDnvkO/3bPrDIX5S7rDNcuEf9KOtrt88E1gFHX9xK2t45EdY6at7HZvtTHPm+
	wMgE3V1iGaoCrhbmxzEuYEoQ93kZ5wA+82A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqkugw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Jul 2026 10:57:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ac0a54110so66111985a.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Jul 2026 03:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903462; x=1783508262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXHclo5dQ540crOYbfBiFzJOGlNRFUHjEdGh+kXSkiI=;
        b=YrDbkR0nirHjY1Cb6o2wjCT6sPlPpw5/eSV3vhqmm0mq2nag3ZCzlqfNITvnAI/mLa
         f1BaUpLLihUmdTk0HTHAzSAi8CrIBFjQfgZhx2bNVfFotWLdavVmZbG62OKsa2Xo7ZNA
         aET2TNSTNalO9zQF/ZQy3c9TGk4GDQVEkG7hiHJAEJe/KEy8b3rbOwclJj5e0/CrDGGe
         wd5+KfgN0u5THFp/U6pA/GgTRf3pV8WYg7cbQfyIqLBKDg5oP+T6Qaki4hMu5/oekbGS
         3qm6msbeFOen1r+Hu8NOiZNTzg73jFPS8YWwZnYoDQnV37vNAn2MVzZ7vFBOdkw1NJpQ
         BSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903462; x=1783508262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXHclo5dQ540crOYbfBiFzJOGlNRFUHjEdGh+kXSkiI=;
        b=Z6MT7FSosVESynlem9hNpqe8Yeb5o8LWr8oD2pMAjs7Hfuwfu9sk3spQ4+QPQd2/CJ
         Xi2Rw571qnUfVzPhHyqIQ7uo3IZcABREY15w4btX3sAArlsZ8TffZGzclbWmvgYybU5g
         tV9nCQkhV89Uzb4VXsxGA7kXvukmzhxG6BFn52ROtItmOk3ju+jeA0my7G4rkYQa+ug9
         0Ugl6LMrcWDOh0Ldo8D1HcaJnsalRRxPijAs/fw8KONN6POWvoLFhjk1jqx8y8/CchCy
         G3cyJPqBwFrMAJtGhGcSyQ1KZPy+kF+tjLK6ymJd0RaJMfa3RqilFwkMOCVLlTslEn3o
         UyjA==
X-Forwarded-Encrypted: i=1; AFNElJ/k3NgDjxZw8AfObgRKHvpylElXdrEE9S5mM9TctKxAqiHO0GO941I35YoVt9jyaSgR94aDmL4uZ87DiylKgcs/Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2hDEJILLFetMX7QcxwrooRc7pmg2m4Za2iMcZDT4GvuoTCMvl
	I7DKpUdx1ch/Yyrlp9Rn1Eu4wlJwocVIGDlYHVqvtB00QUfhlKcF7rnlv6oL7CK6/uJp/xv+Y0V
	424fP3ModwnruexFcdXjTuiWBxZ8fKg1F8J7JnVj2P6AiUFKE/K4KxGfOqm2osME7JCt5KxiCpQ
	==
X-Gm-Gg: AfdE7ckaUO8THPtwmZRypyHtDawIiISdo9OQO8fA25jFbJv8QFYlyldizvkuYlkYXqz
	NBNfh63aV9KpP0Y51bxYDMQD2FlaVWQPyyRugFF0CwkF6MxuPDuiEIis88hmeeK9ou6TYkfHYOi
	uDKa12I0kGqoECwWgjwQ8YjajxiojnuJBhKnh4qEnmwhzhRYL9eaVZpJfoSMmhhZut4/2Xyvhjl
	BY0/y6Z3I49tgs9+XpLpd1feQPhUajq2GoJQtZkeAfzrQOdDFhGXXrb9mMubPi4LRbxcEsTOJuk
	ygr552Q4umah0N7YvxsUG/3Jwydd0VFlPgPn2WPY+/i3xypvKj1rlZO5SUX8HizZP1hlBsRjRFn
	vTlgm8O4PYFAKOyP/GbwwmLpyY4Y=
X-Received: by 2002:a05:620a:4587:b0:915:9a39:1d68 with SMTP id af79cd13be357-92e781f1acfmr143338285a.5.1782903461592;
        Wed, 01 Jul 2026 03:57:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4587:b0:915:9a39:1d68 with SMTP id af79cd13be357-92e781f1acfmr143335585a.5.1782903461099;
        Wed, 01 Jul 2026 03:57:41 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf1asm17497188f8f.18.2026.07.01.03.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:57:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: samsung: exynos-pmu: Restrict children with unevaluatedProperties
Date: Wed,  1 Jul 2026 12:57:32 +0200
Message-ID: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=nvB5KtefDLzhGr4nr8PZc5L3d0KZFe1ZJDlxsS3K7x0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqRPKbRUdQOwIDyfyaqWgK6R82z+GIgTQdCcFMg
 WauwIeUnlGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakTymwAKCRDBN2bmhouD
 12X0D/wNn40TkXCRuOnNGT6ZJw2wZckXeRfoRB1t+2ktYzZFh+lVfWUKVuX48KkrCPPgOiG8aSp
 aeH6EKKJbHZZJhDiT8air+5RnLqBztu2MQzYXSe/kHtH/gOtRp6WsDCcxR5P7ox751ykBzIb2Gq
 T7HvXzINZtJAOn6qkX14xii9yPvH+S8ArFdvai+mqdMn2DIbJhKEaJtbmVcgeKBl4SDJdKxxiUT
 n7td248voGqiCaCHIqKvRZHfV9z7ONa2C8ySUfbohzTZri8pTm1A2tCmi1sSrqeiaogcXqJIpgC
 17nJGcRU2zs9eTOUWc6xP260h4L3YCnqXu9658nqr3Tp2Mr31YZbFhDZmYN+9akb2mplGbYxsCg
 0NwexnFrvnI+OtKP+85A/exJ3pwkDacXejpZtU7IN5JR5OiB/nkuB3PreP0mw55fczYKN+2L6MT
 m3ypiUIzsOs310hhZD1V1WNtdKaNQwCcxsB94DarD+Pzv7OVanv++zeQeHWdv34tCHf+ZBZwNUS
 xapkIaf6uuaeULsw//raOs5DlunQHM6Snn7gURxxUwGFHVznuzklIfkzPsTsHANDoLD/FmyNE2j
 z7lnksiXxbjcgSNSi1TTRr6iawIV8pMZcJ0t61rrd9+YcF7yKJjRRntqDV4L4jvlpb5VfA2fse5 vG015S/FlpPI8Wg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lM5JpvUrkPcs-HLpXxgzF_lq7AFoLZcH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfXzu3YBNHpNmES
 GBnzdhRegu45WMhschIbp/an+Kn47duuiNBbG8rT8rZCFGox9ut46VeYi/M8cWrGw0/CsMrn7PZ
 x1QOLIWOXJz7EwNaBOhLlQAAABbQr9TMsayAfwxoHmBJIsSwyZ2PofcFgmxLovIC/mWtAbfuEUU
 ejUruSbMpM1qK5SV8YjP65gUsp+Zc4dEY3iFFcv1a9cFCG/ewUcxhQV+ftmthhzH9EZQgvxW/l+
 1RsBgdIvTqaFKatQbIBhCmBHR4GzEVofRlheN8E2/Rg7+sTprwRJjEbV70hUBrs03ddHQ8THuXn
 ExLXb2iFWS2UihiBebuiJHn3kbY6sK9X+YXvVOrQWHbmY1Zn4gMsDpPYBsEk+DPfjoFPLfybFI+
 xIIjhG4ZxqwEebgdOl3OzeYmtS9JQXUVBDvXRYJSbI7Yi5d7IKgKgvmtYdSEndAxdaJTsKQRtbW
 dxOaAPR0wrRuykA+g0A==
X-Proofpoint-GUID: lM5JpvUrkPcs-HLpXxgzF_lq7AFoLZcH
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44f2a6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Hh4MFFtu-RRkeg1_9cEA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfXyJVS7wRpK420
 d7C1rwC6NQb/YZFWwBiR1NC9KfDzft2MlhoWqpQHtMjEgWnf51u2mFlZpvfM0zhpfGrqhT9BLfV
 MaClRQohdWTwCMFTPCrhXehUCCv288w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010115

Each schema for a child node should end with either additionalProperties
or unevaluatedProperties, so add missing one making the schema tighter.
Defining 'type: object' is on the other hand not necessary when other
schema is referenced.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 76ce7e98c10f..d124f3ae9fbd 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -94,19 +94,19 @@ properties:
 
   reboot-mode:
     $ref: /schemas/power/reset/syscon-reboot-mode.yaml
-    type: object
+    unevaluatedProperties: false
     description:
       Reboot mode to alter bootloader behavior for the next boot
 
   syscon-poweroff:
     $ref: /schemas/power/reset/syscon-poweroff.yaml#
-    type: object
+    unevaluatedProperties: false
     description:
       Node for power off method
 
   syscon-reboot:
     $ref: /schemas/power/reset/syscon-reboot.yaml#
-    type: object
+    unevaluatedProperties: false
     description:
       Node for reboot method
 
-- 
2.53.0

