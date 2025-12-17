Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2934D346A11
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965127; cv=none; b=sl5gy2LJ+r2+4t+1AcYUOWryJcW/BcSJ9no/uNjOSIkvDgvCpDO8Z37Ky6BkN6xSW93AgEkpv68QOBjMc2YZ12LVebqDhqafe0BFQbHWGAoPR9SbmHLDpvxOpaJciI2LvUFcdSDL/WgO9uJsxbOP+KuQALItu3A0Xrnvl1hahwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965127; c=relaxed/simple;
	bh=SX21PhGZicijazZ9aMiqBXstGUcTFn/+qwMSgUuCSYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BwN+LtbiEe0H/0IbvKagjvUPkVPs49H+ItE+neqS9z85/W8nKD6OdmyKaxfE3J1SEuy5ZYeCtCAq1Px//1wZgU7PHgZ7Q5TEPh/CkHEEHpIH3eNJzA2fxcjz75uUZTl5GdnV+WwWL1cEpEX8P3i462MXgvtJlC/fwb5P8HWj4fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQHdIe9S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JvSCW+WF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQHdIe9S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JvSCW+WF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F5jO1501258
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 09:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=; b=MQHdIe9Se7dZvplx
	MjH9W40zW1fX6er/eKkIGhtY89dyda0YX+1xufWLqGIMTJpZVfIgw25mVOlq9/Hk
	uT9WDyIRfO6qd9/+zFvWq7x1zrPdFY9PUFUkT7thUu5XCCsbFHraDDYJBUHchIWP
	stzzKQtIzYkjEDtwS+qlSjFOhVuc40NU4bA2KCapDEqVyucr3D35km/lZYx0RG1k
	KFOFshuQriqyoTL30rUcQ3k2/pkwwJrPzwKJgShQS3y3bmYhoKbaAKQ1vA3/g2MK
	z8qi8mh0wqohHpmh676f6YzIXpgHcr4fYlq+rwaTZFX1x7+Tbbn7D02S6kvM6MZB
	/pnMeQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3kkesb08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 09:52:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee41b07099so66360971cf.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Dec 2025 01:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965123; x=1766569923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=;
        b=JvSCW+WFD/k2tSCGc42faolsGD72D2prMMmT6XrTvGeKEjjV6j166BnmQ/wzci0Wmm
         Rn8qFACimdNDNLQrNpgJ6nauc55tr/KVFiN7aI/Kq2qw/QRkrV0FI+QxSl8CVZuNaevs
         EzWfjs8byyEWbQBJOMYAkPJ21mFHTjfVT2lt+Ggxuzi9/q/0EuVDozEZg5N9V0pOv8Vc
         s9qRG+lGjLAC0WYD7U4iuQerBGnEVlD8X1eHHRRsoFYvSC3oCNPodSij1qfgGlOTpmNS
         J0Zf64puuloqYXHinT/PSLheekaRcLE2cALOn9pnbR8hW21zEuvQomwQvmUQuNBA6yrN
         G1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965123; x=1766569923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H9yfz5VWJzjGgs2tjdJmygWfZrktON+3CXq/+Js3i0o=;
        b=H4TAsdJDQsjHxb9Q8E7Ltkp31pb+zQ7qbTsicuSLvOuWe0BtRWdZadb810htGB+Ka1
         wOcgzvZxaLmlfv63SD03dpeqMlXGkQYuTNv5X4mqFJrEefJzCFsY7UxCNNNLfzxQWLbB
         xuiq18dApJigpWQgbPRLxCHVRQf+3Ozez9C1bYbaCAdE/canWcH+mGCfDvyyV1f5aci5
         4lj+akGhNZRNUfEQ0uwZcPatED16ouAPeHaYKxe+t/uZ4XtZo+UgqLm2rceU4MWM5pcT
         0fjd6Q5c6PMv/8JDTA9uOvD0Q77BO1o3Pc1FukhDD51KF7IHtE8olMZKO6VDV9bg/UEJ
         elGw==
X-Forwarded-Encrypted: i=1; AJvYcCVnYAZRPvlP2VyfMyUoUHWS3Hvn7sneHcTCIw1+6I2KI2pEe7uho7vI/lZXeeSNiuZYROwfewEk+zoUYJd2wtit8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1vNERBrMF1JiZQzmy+6DfRqxvJfGBJqveraC0ZlX3N9/P6wSz
	9v5Gm9ZzatE58jXohMlDjQKGDWZkbn/cQe5J0mDm08bMgO0j5Q4dy1X4f6BC4/aTZLlfjzGTw8z
	VpxetOMqAMZgJySsjRPQljm/mYvgl2IrZdADowx9gmg9aYiEy0tHydvkEsPgEqcBLVgGAVMajtw
	==
X-Gm-Gg: AY/fxX7yduSoWTIaUnurAOdSRVoFjty3OmJFvhlu1qRjC+I1Coy+jQwMXXkw/JeiUv5
	t2EeY0I8cWV7BzQtPGc5+de48MQCyplWQ7mXY3lrfzHTsUlttU8pa7zeAH3ACpTWekF0yK97iyr
	4cU1wuWMnuhT9OrME6gSUIANKC8NzJne1Zu8Hvvm3V8QnFQq1KCFE8/hmk2A4drh/kyCmTKW5i1
	N0VEME9MxSe0txdHEfOHIlgfsc0wjkrFxkyVottJ3Fo+5Gf/SIWOEdbicILu5MGMYQsokPHIJRR
	lcbhPu3YykmU21FT37K48iEcOIOSb93dLj64Obv5rnkwZxbisJCEyczfxI+1bC828wh3yBN2jb7
	hffgp+sDbVKAT6kReU57XDdItHWvtJqG8
X-Received: by 2002:a05:622a:1c17:b0:4ee:4512:4a24 with SMTP id d75a77b69052e-4f1d063632fmr227963181cf.72.1765965123218;
        Wed, 17 Dec 2025 01:52:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXkNSdNnHweEKikyXzlt4EEB+42BULtBSNK+x5JvVI709mhaYmQtx7shg/iQQ5h9VEtm7Axw==
X-Received: by 2002:a05:622a:1c17:b0:4ee:4512:4a24 with SMTP id d75a77b69052e-4f1d063632fmr227963001cf.72.1765965122786;
        Wed, 17 Dec 2025 01:52:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f5630easm1981969a12.22.2025.12.17.01.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:52:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 10:51:54 +0100
Subject: [PATCH v2 1/4] dt-bindings: watchdog: samsung-wdt: Define cluster
 constraints top-level
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-watchdog-s3c-cleanup-v2-1-79d8caf65ec3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SX21PhGZicijazZ9aMiqBXstGUcTFn/+qwMSgUuCSYs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQn08GwVfAzRVxrZFPlAs3C1xZM/0gJe0MU5Rm
 pLwZ1LKZcKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ9PAAKCRDBN2bmhouD
 1ySMEACKiUoyvl8N31YiC7Iz57fK+ZWem9zh/ehs6hC79j8z2BJMFD1WY6h+VsBUOa1i6StrfZK
 9gcn40aqruCyr2iRSPoZimiiCu558JKaSMdBO/uzpPu5Jd7/1Zlrr5E/onbXQycM8SDKLU5AywG
 jPrxcLzc2sexP1Ccv7Q4ZYnq4k8Q+SVTlCEzqK9t5X1eR2rTcsmZF4kX8e6DFAFU85aAWpF4kX/
 ynSmTHh/1KM+t2RLlOV5W3eAOEWrNltqHkeQPqhCNl5NQNgTUWGPNysXwo22vvjJF4Hx1EwExwh
 82f7KRcmJTfp6qahAl/TZ8pDgZ5eNpHEoaUNl3wdzHrVhsCU8VoA/zCnQQRFW3AHgq8Ef22UJ8K
 GtD0qS0YQklDbnJVN6b+lye2t2A9cis21XBQCwuxTRGyi+SJ86TeATwHCUFkJ96ckwh5sC9WHjH
 E4OuszXo2CIYLDEwHfWM20bgLHr6ZKCq+YqZfnajhxK8GhNkzu51CRqEvZbSko06X4TbCjCFjrm
 clS6nXAxJZOkbj6902q4GTmrnDkiLx6zjX46FomgCdsfkRxskANzHz8xmStMjQiMNxGx5FOlfI8
 7ccWbgzlS+g/QSChJ9WF/36l+Mwvtn8GKTkkDgySthLAZrh5WLBVE0z8u5pUWlpt3uTxugkHRv+
 GyfMQFtOBD5bv6w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3OCBTYWx0ZWRfXzuyTZ6coArBJ
 Nu7HcHORaFTjliU0ZIA1x+iT0DFp7OQKhHs2qgbl3BmYjD62P8eWBoLOPspBYW46/Xq99/WY5z3
 dEfFd29WgOPnY8oJHNtidsZnTV6IOv1IunguCSFnnWSNAkO+cQI2yxq41aE9nhKGMBB4R4xFGvh
 4pCkRe/se3UADl84PInPPgiP63+nbrAftf3SHLdvPDSI1QI5U+3O5WJHn1AGxsr9jkpF6Jw4ocG
 hRX/qkdLWluS+xEv1yfr0jCPVoFgx1+Qxzhcxqvo0gWWG2nyBNYbPOh6KB4F3N7AGT49n3ZMVqp
 MLvGll/5zNH3lA31aWEMityhqiDqFCStflh5WHku6rR48Du1LRq23EGPC1Jl/bn12ZHh3PJAmaa
 IBji/sRyFBCQpx8Nd3cSBeUf/zHZbg==
X-Proofpoint-GUID: 0mqjqaVLKHt_CZpRkGdC0AVVTg6ghMJJ
X-Authority-Analysis: v=2.4 cv=Fcw6BZ+6 c=1 sm=1 tr=0 ts=69427d44 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RUZyBBiHXQlI0l-aNaAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-ORIG-GUID: 0mqjqaVLKHt_CZpRkGdC0AVVTg6ghMJJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170078

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

