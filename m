Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8F5346A11
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965125; cv=none; b=Ecgbn6Ba+sFHNsPCEUGJhPjC09594Oqi059UqXixXgCrBVNG/O/LWIiiSKyd804+FIua1W65iXSPiw8ZQq+ZdaPBwlBecbxHpXdkbhjRZ4CDOaRCQnxsij439WENvDlaHoCvO9S9Syyud48EiIoBjT/8Hpu4WbkxSOYD66vnEwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965125; c=relaxed/simple;
	bh=I0XGlhNlBBsl9vkByyjMxMD0C1qFTDvEIM47UaNKPiM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ky2mWXNhAmicyF/vfMIXKHBIzRhNX+1MdVePha6bLjvUQqblA/s+deGmYMWkbbQB7O1RFfhDpkz7iIyMNO2pkirisrcsTIT687kk39YCZs5nh6DAlVTVc1n/LnaICq33KVDIIaSQELRvens1O9YfTatooFBiBuZCn3nzf1Ogr54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b3QdQmDq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TszgohMG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3QdQmDq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TszgohMG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH9pLLS008982
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 09:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dOceBZo7Lige2wxbRvG1+Y
	Ee9PMsaKngRhKApDOgGS8=; b=b3QdQmDqNVBReu0yiptEhsaXofZdp1fsuHWoK3
	ge0g9/+8iBWhA0rzl0RmCweG2k1oBtbdH3oeGKe3HoWbsmVmec/sE3OqDNbJZGTY
	gtlj3Stf8VZtvXd1p29jXaeuzSOBCKCImdg9KOUMla0z+Hu3YCMVwTlyrIqSC6Th
	RC5Ve9CJYCN6U3RfRfbD8oi2tjihDjwBEC8P9G0VvkrKFVZFsd6Yx6Et7vwNmwCa
	+fVvJ34rK0WG8HEFxaIyq4I321IEIcHgRNnp1Ea92Y77xD4Zs02vDfxWMYXhq48x
	b6HnIE+e1ASEYvCPdGq2G/EdIHtsDuJraEFKvG/Gpi7wLLkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e0036-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 09:52:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d2aa793fso127514801cf.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 01:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965121; x=1766569921; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dOceBZo7Lige2wxbRvG1+YEe9PMsaKngRhKApDOgGS8=;
        b=TszgohMGJHikZYoKYCzi3T9TbnVGo5NAds10zYnThJAjL1B/RF/0BQI8hmQrauoZAl
         KP1NdRpNSJm5vMI8vUv6Tqlo0qwyGzn8KAN2JfkjU+FKCfZqAWA1NE27zwmRaNzbMWZI
         427Cr4wfb1S7wYuIOsnXahRaJxx2JXWtwtxk9tsefkCJDcT/iBVOFSGy6eOhWceb4ieH
         9ARjv0hn2gqqba9FYnvrXm1O3YkGiveYIXYrgioONTDdduGczUhd48heKVvcvXD681zc
         OC+6fGsHqAF5Fidm4OVdyksX5Sn2ItlYpJZGCL4mgzrycYfNTO+2DuebEOp7tHRAkZaW
         nFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965121; x=1766569921;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOceBZo7Lige2wxbRvG1+YEe9PMsaKngRhKApDOgGS8=;
        b=VbQkFhHfysq4Tz2qzCvm+DfoLQjcuUcLHSTewQP7ocVAsboMlg6/fRe4uo7VBylgTs
         DiQ53pScSg39DxI7KCubJ+Cwmy9+3a38aZ6C8YZgPIelVnz+NLDoyPfXA9mksHot605i
         WEK2zZla6CXgx8nUjG+IIRUieI5+pTwoK9D6eSCCScvwzSRM0dExQeOBuhOM5ke06SEO
         vXVqZyKJ+dkgQ4JB7Agx7gaOwrLyC3B2qw1Uphu9WnPBbA7rV/Xz1J/nrySDWpio1GuA
         iXZcguGoPwKVxqEhyjoqB+dKFWbh+xuGK/tvHN4x/H+Z6f195Cn140qlXYYW98l3t+OP
         q9Pw==
X-Forwarded-Encrypted: i=1; AJvYcCW8wR4JSw9311EMd1VmuIQ+El5eB+wFrmO1hAzfpnFJtLu8M8RgOvk/1JfG6cFD/RX+H1SU5qq2OidjMYlfNudCoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykBGm1Pnq4aD7bqglJHY1PltCJfFkRZd+thmVgcS6bW3AbX34D
	qvgEm6YKah4i0BvAU/fQf+2Rph/MJGk9C+hmq+T3/C8LJshgSu3DT8OV6PSVDM95dWxJYS7Ve/R
	O2OFAdTAGBU6xQRWirk1LqpRSupHyEn+7T/ptlyL6Js+nVJ3zhQ7X3vQamQKI0PCAs1xaoOQAqA
	==
X-Gm-Gg: AY/fxX74faaSCM96ofQHwfvEHZNo5UKocZSUweLaMGKnus060K9JNFZh5kJt1DLboPx
	UQGyZuxlcjbigvarN5IfyXHZW50KWNogqVW/Z/mmRMsxl7wr8VgC60geIREXRWS3pHYpKYc4mRc
	fC+3RCTTVgRaE6rL0Xxb4UnIJmm6GayXH/ISsOWt96y3MSCDCVbHFV+3pSAtkNCcZUmnAxuLTCz
	lUMI/OhTp5UgsBzFNCBEglFsZVpJSbAq5qNjXxaQRTsNeWYRhaVAEkOiqMRf8jnHVMEP3NiMZv3
	alMXtLRjD/v5m5r8GhtcpsrWbSsiWi6keTWZo9Q5C4bgn26qKg97to2x4advHEeSNXSbkbkHYp2
	K+GRDBEoxw3jjbvD3L+TcB3kqImL4DDA6
X-Received: by 2002:a05:622a:4a89:b0:4ee:1962:dd46 with SMTP id d75a77b69052e-4f1d06320b4mr257582311cf.79.1765965121379;
        Wed, 17 Dec 2025 01:52:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW5O1g8WvltuNum/M7cEnhFa1EcdU8QfUbnfhuoRsT0cINIuTq7Qu/PNM30t8RgEV9cpZJVQ==
X-Received: by 2002:a05:622a:4a89:b0:4ee:1962:dd46 with SMTP id d75a77b69052e-4f1d06320b4mr257582131cf.79.1765965120963;
        Wed, 17 Dec 2025 01:52:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f5630easm1981969a12.22.2025.12.17.01.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:52:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] watchdog: s3c2410_wdt: Simplify, cleanup and drop
 S3C2410
Date: Wed, 17 Dec 2025 10:51:53 +0100
Message-Id: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADl9QmkC/4WNQQ6CMBBFr0Jm7ZhSJFZX3MOwmJYBJiEtaRE1h
 LtbuYDL95L//gaJo3CCe7FB5FWSBJ9BnwpwI/mBUbrMoJWulakUvmhxYxcGTJVDNzH554yuJ21
 sb6zVDvJ0jtzL+8g+2syjpCXEz/Gylj/7J7iWqNBUV+LbhXRp62YSTzGcQxyg3ff9Cydzti25A
 AAA
X-Change-ID: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=I0XGlhNlBBsl9vkByyjMxMD0C1qFTDvEIM47UaNKPiM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQn07tdxZryfaFCLlY7XrK6B6l9O/jW0GBoliO
 i3wC47HGDiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ9OwAKCRDBN2bmhouD
 18R8D/9Rb9xm3GmEye3zHH1mOMF/5S+DhZ+qU7E++Q8fo5BUovLldcY0Q/NEjh5unr8MB6CwLno
 P5Tcat0GRosyayr9qk5blbuuD2Xbgl4fXT8R43K9oTMEQckYPzJi5cfUiURGMfElnVQ1NrYvS74
 el9gHlk8TW44x9h8WZvLg1I7xzei6mDKd5692aWdEfvMHJmTBzbOsNTGRepEhipyDD/0guLr5Jg
 xANui0I6Q0M8f5t8WtL0hbLoIjQ2Ss7lDuK6RJH0P6Q6usDwKuLhjCJn9YYteA/0LUcvOJP/hvy
 C+FUP2ycAIqetuf9rc/36nYUflFWzrMUtDINcBC1qJsYOvPvfHe8GZX+ET8mPWG2uGUenluo1wl
 VoDOTY12cl32oEH7VJZeq72y4lYeHpUhoPySSwglulaTnYXDtY5hah4uzSQB1by94FOpsjMPrir
 k2OEn4w5qPuVMmd67xoAl6CYGDnLL6HE0ii42XGnjvqxgzOOpFEXs7grjupjGoSV5WayztaMjsw
 W9pZ8eEma4N8mBcvOmD2ivip48x0fdmlzRp4DtzO/Hz31WahIssF9WhFFrmwHiVZryRrcEt8KKl
 Ug5+1LdZR48sVSnVtHVTWT7D2QljtlmxtiA0pjxaERe8KecVaJDvlYg8vjHxch02bSUHWcuRtNY
 VIXNSvKzR9xXnBw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3MiBTYWx0ZWRfX8c6LtLrQGwyv
 YKbJzGlX+FqAjXOddx1QSKINKM/uDV0eY8jRAbHStNyZQaoDL4H6QWBbJFcfqN4p87kGy16Bkl3
 9bLzvvhnVjYUjPMFTzqRz7vQHeSD7ZEfMatxN5stAI9AtIlP2g30DvGShCy7cR7k+BSoiywIkxR
 ATRA/ntBwk/gauGusVSskdoniQi8kLXJ6kjDswmjNzmU8sHv5eJ+zcz/ticbHcM9OMslhY+p7FX
 yGRH1v0VAx1ZqQGixVJMUDASVwT64LHl9IKxe5xlqNhg12aJW7pf+kx+fIg2if5c9aBpNPma4YR
 6/BFbgTkTpS1bNYUfQWnuIt8S4fU06k4jWMdRHROhM+KcU70yyJW9bF3L40aBtG3PVTNhqtL7Wx
 WTbnMj8WUyirbLmk3TPhRyivxKVIOw==
X-Proofpoint-GUID: l-K6XhneQAJJFEh53nJs7HmjGIwC3r6X
X-Proofpoint-ORIG-GUID: l-K6XhneQAJJFEh53nJs7HmjGIwC3r6X
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=69427d42 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=IkrQgrjNrYqhz69tAt8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170072

Changes in v2:
- None, just rebase and apply tags.
- Can this be finally applied? It's waiting for almost four months.
- Link to v1: https://lore.kernel.org/r/20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org

S3C2410 is gone from kernel, so we can drop its support.  Also cleanup
and correct a bit the bindings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: watchdog: samsung-wdt: Define cluster constraints top-level
      watchdog: s3c2410_wdt: Drop S3C2410 support
      dt-bindings: watchdog: samsung-wdt: Drop S3C2410
      dt-bindings: watchdog: samsung-wdt: Split if:then: and constrain more

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 72 ++++++++++++++++------
 drivers/watchdog/s3c2410_wdt.c                     | 22 +------
 2 files changed, 53 insertions(+), 41 deletions(-)
---
base-commit: 12b95d29eb979e5c4f4f31bb05817bc935c52050
change-id: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

