Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8F93F8ED8
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 May 2026 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779803605; cv=none; b=EjEAT7yJb+9B8Lb5/mUr1IKa8jkNA+e+QK3EYsHmqumRMC0N7bpJYm4sz4ukOna06d8KixeUbDioNFk45aI9oDRKfpSmAzqYZR4Ysvayyx2VuUuTaNLrLY6wgUe5w7YM8GP5nF2CWXCOMJi+BbIVPIiX4Snlx+QHH3iSBylXjVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779803605; c=relaxed/simple;
	bh=ov5tEjFvoaGrkiVXAr1zTV7YKFvleimXOMz+2Q3yGOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LuhaniXCZPMtZnSq0eGhUatf5DdRzMeYisRtDCMYUng6TS/ESV21XraGjX8qwihPKp8TBhpB3GHkrroTA0rZ8M8/n6r/5gJ8bZINuGx7jtoFpcQUk1v6HO+tf03srqu3B+1nIAg79yoOzfVvj59mVRvS79oxxmIXIrKFh9hCyio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fomChW3B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+IHg+a9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fomChW3B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+IHg+a9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsOG72697710
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 May 2026 13:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0sEKMYA5MpTomLzN/Vde712qorQQ5Q2IHji
	LJ1cR88Y=; b=fomChW3BROXICMIfUAcbA8ocWtdlJyVUzc4d9NZdB6D/qe4JQ0N
	Tuj2RAfu2wp3z62QMksLA1Uo3sGCbRUUcyHT5o90j3os4w+5L2cclMRWY6TDAOBc
	HHT2/6TXIgmPRQXmLL7j8s0nY7mXm4bRSoR7a3Y0dRJmZWlzbQC2UsnsQ2vrkfII
	jELozuq673OE5wjZv1/Fl4jZGBleJoGp+/xUS6Qva+KhwzTM3qMOOfw2ugxIhF2P
	tsWzFsGK9/SNtuDpWN3Ncd3bYjhtuTHnE294d1v9TqK0OExqjQ/gKePuzRhS6tFC
	Wqc/s+gw+YxIsTHSOsJed4ksSiEdH7dXiKw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm04483-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 May 2026 13:53:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516ccfa109dso91405751cf.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 May 2026 06:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779803602; x=1780408402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0sEKMYA5MpTomLzN/Vde712qorQQ5Q2IHjiLJ1cR88Y=;
        b=b+IHg+a9bua4vqs806AVrJvWD6wm9YfX7k+VQij1KtOYckoXQY4IYZpfeQYFjr8cUN
         3f5/LdXOekazqrwd71EuaGNtNgAc9N1/1Igk3cK3oUHlGF9Z00yXwkq2r8vdei4C3GEK
         U3XDypdrKpaHbcDzokKG/iUR6ecbyPyCg5DTQZk8jkMslgAmMloAHbqB8EeeJgu+ZrW2
         Eix2WZQEiOpnIw0F0PGgBdY5wJjZjqY27o4OZA5PHX95+pHGbJUQsaHr58AQS+NdjtD+
         1seDwclCjyQdK5QC0zkzSLPmj+5fBqsZTN0c7/f9J8IaUSdTpr4dwwbDO5XvSplQ9OcL
         yqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779803602; x=1780408402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sEKMYA5MpTomLzN/Vde712qorQQ5Q2IHjiLJ1cR88Y=;
        b=dbP5odqwWsbNnEke2v1H5a09Nuqjdef4RbXVUqzls1DNrz1lXa1+GZKEQJdS7VyVfE
         ncTHSZkcuOOp46UdS4P33bEp6PTsjZgg/94W6M8flqompQIk3JshV/gJIAKK/xs97Mji
         Q76nx+Ip5hTATXFwr6ziTo0CM61Th6GqZUqZziDWjjrLP08pszGrGe46cpp228QnUVJA
         /LU2vb9B0xcsJn1ymqJz3SqPggEiXJhZC8crqkDUjmB5Y7Tax92gcvJ0Gn6hqkOwBsF1
         6B9dusyaXuMNAhJ7BwhRV60XdsjWQ0LjKtIVqbl51ck1rRDfWJKTW5JO3QAgqTXEuoo2
         M1Xg==
X-Forwarded-Encrypted: i=1; AFNElJ9NV8HIfBjokRYm3zVRmwL6jLDOYjVXLQtVDXfy/NpeqDlCHrmmNEAgN2oQAcB30IHXtwxtM9otSz7B4DKp3AnBpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy1mWcFthd5cugrgIGvMQzcigGs7XrZjDFDuqIIt+sbkO/IJhL
	QhgKaWVhyAdBOUxBiF/MqMNttMA+gvo7FnbkzwZJOAtM9/Qk9YJJ/b9DoRKCHRFRuvpsnw1ruE3
	KYUbabcRl6Jt134eTPQV9LhwqZQ2ZD045IdkTEqdgECq/D4CBb+dxEsAA/JVpqhIky1LtMhggCj
	0uArJrAMy2
X-Gm-Gg: Acq92OGmx64Lc+2qlzPjQBNBO4//pSdjAicT8/pRGx9HOXel6zyUItMLVBkC0GEWvC3
	JUSXOkARV4hIg7QaQCSSZwfSDFfSR887KHT7WBVOmcgZjpTxn37qkjzrV6YtLEz+L8WIbMqcIEn
	C2CUBxBXHurBMJGzVmn0/vEgOmymI/iSyfHiY6A8UNaPByadPhr2y6lesA5M4GuUNAp9DubpPEd
	Hmab2sDvZxiSq4o+MfmwVwz9wINUGoj681TEuEt9+vOHMMEhC09sefZgewz8gTrpfIE7ryR4kRt
	cRnE8RIuiRpRiOURTNwig7i3hDSEASSRxWHMCrjLGkEjPuE1kmOuJ10IZ4XEykpOUs+r4P9ZJL9
	5KSFgZxxTxKXTAGSzFl41e8p8rxoKDhOcm/kvDa1KI24woL+FKVWu5UgMSM1X/b6l1L82jtoutl
	Qy3UNo6z6G+A==
X-Received: by 2002:a05:622a:446:b0:516:db5d:ebf6 with SMTP id d75a77b69052e-516db5e07aemr226013941cf.59.1779803601710;
        Tue, 26 May 2026 06:53:21 -0700 (PDT)
X-Received: by 2002:a05:622a:446:b0:516:db5d:ebf6 with SMTP id d75a77b69052e-516db5e07aemr226013231cf.59.1779803601049;
        Tue, 26 May 2026 06:53:21 -0700 (PDT)
Received: from quoll (cust-east-par-46-193-78-100.cust.wifirst.net. [46.193.78.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm322628145e9.3.2026.05.26.06.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:53:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] thermal: samsung: Enable TMU by default
Date: Tue, 26 May 2026 15:53:13 +0200
Message-ID: <20260526135312.8697-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ov5tEjFvoaGrkiVXAr1zTV7YKFvleimXOMz+2Q3yGOM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqFaXIK6IhegWY9jF6DgyiIV9FZ1kcVNn7U5ReK
 2UyXFbQ29iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahWlyAAKCRDBN2bmhouD
 13ggD/9Wzu/EszXTKqveOw/Zl9YIpeYhtz7NbhJWEXCuppJ7obsZXxvHQjfRXyVumdmAlOO7wo0
 9LBP+X1Wk6tTyzQgtnuqTzxRMME/nc1DxO89UD/9+vmpbKhW3eh8NUNxXvWm1Ps42UVIHQvQBcL
 vKn+ZsRLDiMEHAcfmV7SENn4DOvDQQi9Rd3byemPIu7v1vfRp6HEM36OT4QEuQrF1l0LQzg+bKh
 L6Snz/HDTtF2Z71ZPGtyhNk1roR5hz2CIPvj79XCYmpPjj9LDW8sQMRJ+wxKn9x98BJl4jfP21Y
 8oZILweWeuDk8zC1PcN/er4HsXHQ7NFn7xuWl23ClBUlHml4IvqwN+4aiqoa4yG4w4JLLwRdbcd
 tbshxSFFXU5Bj/oCCYjQF2WJQYNeeDFmvyz+80NA36dmr1fK+1456UZGzi2H0mPBiOpXX9p23fn
 H780NsUy579QnHRS0irXtyNAt23Jps5GVyS6F+z7eT0RD3C8ilfyTBd1HY6Bo/vEZtwpzwKATZU
 2YU+4Ui1TaLn3y/i+Ts1ZIOejwWNzJDd+dj+BS+G+FV/wrgouESm84wqYKWEfTGz3dxWqjWKX7e
 ky2VzXMoAEc7Cl3zb616e3SPU3R++KJX9Rmd4w/flsJbgRH0zP2tjd+V8J9PepfVg/YSpD6BYXu sSPqu7wtIjLmAsQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a15a5d2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=EJ0IOxcR2UVZ8cU+XBqL1g==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=FDVN8oASPiqD_u55kVkA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: yHEL6OdO95-7zbvqlMASFJoPoDbfi_ld
X-Proofpoint-ORIG-GUID: yHEL6OdO95-7zbvqlMASFJoPoDbfi_ld
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExOSBTYWx0ZWRfX0Tm+UQWBAyjr
 KpmVH53HtCosFS4v4u0imzChxy3247qH+ZHRYFAamSo1VHS3Gz23XBGzNHoRddF2ZIvifReK636
 4do/qsFDm8QOlaGdV3FYJvbv3muSwA3kt3BklCkde2f6y4NiAixfQrdm7kXaAtCAzNngQ32TEzN
 H7QNumcd50y7dmalhcPHKIe2OdSQEH/YmozLeoznohjK6kfgENH7G1+rzGI/rrJ/D1kx4s+FWjP
 DYXokv140SfEYJBsuOM/1kzleFQD7A6Zlj/poxZrGIarW5qUSaNtfoOJQJ5QJpg8yc4dTccmZt+
 wYfT9FiKSo9X1wFnBfOb5wCoNUa0UvRgS8VBpKWxP+Inj4ichPWazWc+2GOzByvtIRQusbDl/Ln
 tm/jBpELoEowWKtWII8AkkgqEvgbfepywE4y6rKqkcshD+TamwFJeZtvuY+grM5T3ILyg5Cezhu
 r6q2jb9PFgtzD0Z2KJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260119

The SoC Thermal Management Unit (TMU) is essential for proper operation
of the SoCs.  Kernel should not ask users choice of drivers when that
choice is obvious and known to the developers that answer should be
'yes' or 'module'.

Impact of making it default:

1. arm64 defconfig: No changes, already present in defconfig.

2. arm32: No changes, the driver is already selected by MACH_EXYNOS.

3. COMPILE_TEST builds: enable by default for arm32 or arm64 builds,
   whenever ARCH_EXYNOS is selected.  This has impact on build time and
   feels logical, because if one selects ARCH_EXYNOS then probably by
   default wants to build test it entirely.  Kernels with COMPILE_TEST
   are not supposed to be used for booting.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/thermal/samsung/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
index f4eff5a41a84..e1e8035d24fb 100644
--- a/drivers/thermal/samsung/Kconfig
+++ b/drivers/thermal/samsung/Kconfig
@@ -3,6 +3,7 @@ config EXYNOS_THERMAL
 	tristate "Exynos thermal management unit driver"
 	depends on THERMAL_OF
 	depends on HAS_IOMEM
+	default ARCH_EXYNOS
 	help
 	  If you say yes here you get support for the TMU (Thermal Management
 	  Unit) driver for Samsung Exynos series of SoCs. This driver initialises
-- 
2.53.0

