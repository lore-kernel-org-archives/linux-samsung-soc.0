Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB32346E4A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965129; cv=none; b=gGYwmuEBOM1DIW0GJR4/FdZwFSUPG75DzyCV73WkpE2EJu4xgtHwP2GSQW+/Vf9UdMU00W9JOIj8L+jHNfANRu63wwb5WDNbfSvyZnyZHXdF9S9saDc6V/ezgzwl5/f7Dz+xHuukn38j/GoSSvLzYnZQ5/IVA3cCuyy198DQBCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965129; c=relaxed/simple;
	bh=81K6U7VafNJyQR2ZQhA/gQisDZ/YzqJjFN8sE3S9KJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=euBzfdvnK/FDKfM2GA4xyxHMH9OFGNrCiNkuRD7bGkmzvSXqXwKQkAUydV6o2Ky6Cv/H58u2k1SCptmBMO/LwoQUQFAuSZNCkFVB9dJaeyr369ZSSLyIOEDLGZWs+IIfKB9M9bIXQMa42/Y/2YwdrXtsuSYHYLs8SW4uNnnHe0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBHOuPqJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3WzhX1G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBHOuPqJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j3WzhX1G"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4XQwS2316097
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 09:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=; b=UBHOuPqJzAb+W3+V
	yQNen9gKx9+QSAd7t9bkn8zaPli/H2uBY6DiAUmRHzzvHym1pqPrDG3c1hcXmhXk
	L2dPm8fkl7ZuU9ug8K3BORaFlx0icsjlTOaUTP048GyWXfl5vSnqBpnlewuJU35C
	5ZqVLyWxhrVp2cL3H7lSa1eGucdjpt9u0Xfobh5Dn8gGb4nBqSXRR/HXvgzUU/QY
	J7W+69dv2egVsqafQHhlw71ZeIAd2XttbKYy9UnPGbdRwTwu4zP904P2/6MBO7dU
	fNDnr9wz6D/TZmCCL/pwXdU+fMpqG1O5LNyqVxfvVHp4kSnSkR9QbD3QsR3my01W
	UFgr6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3nkkh11d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 09:52:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b22ab98226so1748010185a.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 01:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965126; x=1766569926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=;
        b=j3WzhX1GMgmKcYUowplCybQ8oQwc152y/573Ik/VtHZ6APSTVnTw2GOSbMVNR4wgZp
         Punya9m1vvW61Kjx6MPk45uvFTIHluGAFGVdaWoBAhFhDg70B/Si4seehG9NPfE6gvem
         g5U8S9gPrFH7/7DTzlLkdlu2wUAktIsborzJcjS1UDL2/6tP/kUnsbm+yFrYT7MNHun1
         wbLtK/bvQoZEM3VvH5LuC8igMnqAvnYmeMgLrGdwpLqiNiPPlSTZuTKMoI1YDE4JGk2J
         73or8qmyT2zCJ3VJT0cxqjc1GiZCjGZEuhoyspI5PSA64KhBwwGy+5Y/0x6Jb5IjLt2V
         GZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965126; x=1766569926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GT4B0YFtEOT/3K50u2J8ovIjdID7YchtsEV1tVnlPqU=;
        b=pq1Ko0XdLtakHv7LRRWs6WRLB/Ny6o9oes5RuCywPcWYytbhO2PJT/28gA1dqaCXgG
         90ycC4qD295vObUl/ojCH7JUrFV5jrHbS4G3oaYAtkjFw/qP436PQSEg0mmtlJE2AnjW
         nBq78A3Wl9xZu3yck5npCL/y5+C4pPvy5jcbAJ2sDrg6fJ3FuAGfpxw7saqlTysF0WqC
         frsXlYHIRvQZIHlopxeiaj5NoVxcsxEGXMpc6st5zLjTSrjY6J0y6a3PAq8fiBre4iqh
         nGXTVOun7DQf1h8mN+Pp7rs2iDLpllllwXFKReHrth79DomcjBjSjdmKo8nmdI0bgipq
         EkGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWWhJxcExiQomPBW+COjwEyDufzI0+1sbeZ3mkEdkcwgVjAU8+umNip6cx1ieexQxhr9yn5SomNTQQ+Z3wBtMMLA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn3MgumSzK5QCfc3FJkhDtRuYmmj2uFp8mQknQflgYGBOvfWtg
	MXlV093wYwWyJrbpNns1Fq0781zoKK3CPlR+K+4f/HXB6ZI/YSHyvdrUkTAVAaZ5MFHhYE1m3c6
	EoG0E+Q4U5gZXy2un+GcdTA8X26liASRnJG7oZzb+UfU8S5HTxV2Ecdhkwbr10s3fhYSefC30KQ
	==
X-Gm-Gg: AY/fxX4LC+Ju8IR5Zo4bYTwEGIzsVliMg0kCL1YXqgyOqOMNVM9LiHj2ZlclJnd7bNt
	LNk6Zf0SWh7W2FpIlA4isldmZTj4g39HymzYu3shcVEcv4OA7D9/bYI2qm9wIjOSuY4zkm7upBK
	/GtZJS0EqOP8UOi8ye3U6ffjOnbLZulgmjnKdJeWIZ60iKPtAfcvaWsOaKG9tdLVvRiAdYP4fTE
	ZoskKRLoDso1ny3GM6Iq8QWkn9QVo9M/CfM7BRMZrVjZ5jMc+X/tNK5VD3ZxkEt7nrgAmdrABxB
	hSQ6TIJej2nLUII49B2xK+0bS4t/2OEimF2/P+pDdpAFxg1AW93Bzk5lHK5Mv6Agi7IEzzuZwAe
	sv2DNBPxYMQ0uhLxtjBVLpMqhKKS5qZr0
X-Received: by 2002:a05:622a:5814:b0:4ee:14c3:4e6e with SMTP id d75a77b69052e-4f1d04670acmr220676241cf.2.1765965126527;
        Wed, 17 Dec 2025 01:52:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpW64vWVbOztrqNzdldttczNbUys4XmjX2XMOb2lmN014HTYnX0B8wUrudV0PofBerDJRIzA==
X-Received: by 2002:a05:622a:5814:b0:4ee:14c3:4e6e with SMTP id d75a77b69052e-4f1d04670acmr220675981cf.2.1765965126114;
        Wed, 17 Dec 2025 01:52:06 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f5630easm1981969a12.22.2025.12.17.01.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:52:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 10:51:56 +0100
Subject: [PATCH v2 3/4] dt-bindings: watchdog: samsung-wdt: Drop S3C2410
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-watchdog-s3c-cleanup-v2-3-79d8caf65ec3@oss.qualcomm.com>
References: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
In-Reply-To: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=81K6U7VafNJyQR2ZQhA/gQisDZ/YzqJjFN8sE3S9KJA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQn09FZcbkBt3DWFaxdeLWRwB0+wi5dMMjPtjq
 9FuRKbjtOOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ9PQAKCRDBN2bmhouD
 1498EACJ7JmJ5D9lgCn/cvg5WjscrraVzzRiGsO5Js5zixZgNLnjmlNI8yHbrHvLRxJpkGfizkh
 StF3sQFJCwCEy5yFhg1P1sJDVnEJz9kTL5R4yhR3AnUbgaI5Z3Z/PfgwXH2ds3ZH/gt1zkY9PRa
 cOwCiHq2j7cHToNrkLryfq1wlgPRxjI7RiYhssueTP+6SjjlkMPMCA6x/sjfGx9ZFCogPjEFPOM
 jhn51tTFp/KugwQT8yWZ+5Oq4FQSuNPZG8+Eo6T/QpnwEe50CsQrTVobAL5fdwI8ePw8AmWBQEt
 Hg2YZGtWC+AUDp7liYJvFtA1gDiAAbBJML00kZjkJPxTKBYnWxcP0z5D1+RUIGivUpWkuWa3aa+
 5V7aY11NLtxl8JqOgexeLGFvMd+/eDmVBmnu/p+kK+JUdEa/e1Kky2GJiDPQJZu8zGcutcg/NQZ
 4dp6n3JTb3H94NzoE2Oya2OC0rXRYh6i7UlAl2LVTcrQLbnyA4eNfujfHeVbs/xyqYWSkAC7LaN
 TtfQ3j6VaCA1j+iOhkTfcUwFe3vJk1+HFuNxeQqbsKvx+z0+to9+by247FbOYM+WQwHIJcdcCqY
 D999LIh6ouixbSL6SR0TqBlT3nSzGkNgu0mUWgf0bXSKgnLruchZqnPnfle3KrntrEfx1yBfWxz
 823+AR+skWUYC3Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: v-mPrgSHCEJ7LkuzOecYdlxaFFy47xPf
X-Proofpoint-ORIG-GUID: v-mPrgSHCEJ7LkuzOecYdlxaFFy47xPf
X-Authority-Analysis: v=2.4 cv=f/RFxeyM c=1 sm=1 tr=0 ts=69427d47 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=87NIDPt55Z06IyZ_8NIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3OCBTYWx0ZWRfX9KqQpIFUHIts
 ruWbzGoL/5hUTMGRv6lQdOjdh8vfQO+umiwoUZFDcGL65zQWCXhjoygl37A1NJ+HeypNe1a7kNr
 a2rWEPJQKzHHe15nLWZylrTcnqLi2F59RdQaaX0BpxVhnUWS5smSzQ5aGW+sWB5Sdkru/XxDSpt
 zaeE8JizdP4mz8nl029Il890oEVa4dDIN9n9u3DDep8/rEvi0mRRrOQUy1V4zbK2pQxFJ7/qKZt
 KxXiDAhn77Dn/84n79Cd7LEKmNPKEVreJh99n1W+IsWHEzIAFZXxcseR/fyuv4K9uZdGeTmJIL4
 NySuc+X/C8rHARhXjR1P3SmVdVyJ3Jx8WrVtP+/rgdwa+Xv3htTt0Rf+0NSEZo99wpMiB2byMje
 QbTaUV97uJ7pBDRj+BjDgJhFM4hviA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170078

Samsung S3C2410 SoC was removed from Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
anymore and platform is so old, that there should be no out-of-tree
users.  If such existed, they would have enough of time to object
dropping Samsung S3C2410 SoC removal from the kernel (which did not
happen).

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 445c5271879f..51e597ba7db2 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -19,7 +19,6 @@ properties:
     oneOf:
       - enum:
           - google,gs101-wdt                      # for Google gs101
-          - samsung,s3c2410-wdt                   # for S3C2410
           - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
           - samsung,exynos5250-wdt                # for Exynos5250
           - samsung,exynos5420-wdt                # for Exynos5420

-- 
2.51.0

