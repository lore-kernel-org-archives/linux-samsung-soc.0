Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB85314D0E
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Jan 2026 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358207; cv=none; b=NK6c51i/mwCSS50ljMzoOuu/o17gxMKtjfdLZqbHzpZCrN18DZOmMG7IxxnCVvPbpvxta+M5ToKkT5OpxmifZdPbkzYUP6jXSyt9dIoGhf+ksGgq3PL6KhYF3CJ/VH8S+8l5/TdpwJwgfnMzdt/TYUFOu/S/zJi38MDplpnJUOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358207; c=relaxed/simple;
	bh=7Kxp4rafP02LArCpSg5dncCo0KyLbUptXkzMYKxwphg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pYn/ZxWUa2zyUirfvcMQcOWaEuLlxqVq6BuYmPabviDYCNY7DHNAyZXausUn2d+te16FV5ClDyWbmmvXCXK8sZVELCQ/7caTxzDKipcUIJ3NXW5ZjSmzoKp4Wdi1SGihPla6dWjpYPO9wZbvU++oQZg7uCZDsce0sHtWAn1RTDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWsp5iE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OrYrHRtS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWsp5iE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OrYrHRtS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602BnlIY1095111
	for <linux-samsung-soc@vger.kernel.org>; Fri, 2 Jan 2026 12:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zLiUNZSnAo9t78mimXccZs/6MNf7HQaGBca
	3M1GbB58=; b=QWsp5iE9ab8xJ597i5D7toXb901fdK12hZ33wV4DbhtU2Z9otu+
	quK8vg2iidBwngPCsR0cKI6J1AJRw26HrB+oqJncGhYkaRNgPVILHsXoeUrZ6Gag
	MivsT7qJ5pdhnlliRvJxGXOYGmz8Pr9emp+g7gfaqzzpD7L11fMa6n1O/O2PPyIV
	xv7I5Rx7lskbMSLFgbwy+U9VJhsC/xcUbRi1GqYHJ+U6KHLIKDmcLC+lOlYbjxZY
	8nl+HS5HFWMDQhVqSkQ+tzQ9djHBb6X6WakeOxSJwilaaDGmO7R0xvCg2UuQjZlr
	qNnaJAtPYDdHHMJvRc5hpKc8BgSQrHbqd9w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bedg4032v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Jan 2026 12:49:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb6a94873so237474081cf.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Jan 2026 04:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358199; x=1767962999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zLiUNZSnAo9t78mimXccZs/6MNf7HQaGBca3M1GbB58=;
        b=OrYrHRtSfrnRB0a5aqFVJRBxepicERo5gRwUYEmRHAyVU3eqBEm6HXZimd3dtyG0p3
         iIGacHa0lsDNj3QxQp3xLZ5PDViLBAlkVFrpZC0B+N5Uc41kTbWO9axstWUeH2+tuuPH
         lv2qxW7MXgHPh+9yxgYm2kX/csxeDo2g6bxwXxxvSuGuifpb+rAfckygQ/sLkMBjSsEP
         V4rOvwyQEzs5KJ9AWbMUKv85Qmyhlvu0h60IrDAfjyD0CB9YM25FjEDgcXbY9H7p1lHM
         zLhT7EdaNRD4HxudZz+MU7Mekh1rzsYa7saoZ7I7i2Xfg/TXmJY5wwGrWrNkEdmEGWLa
         yGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358199; x=1767962999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLiUNZSnAo9t78mimXccZs/6MNf7HQaGBca3M1GbB58=;
        b=Xxs6LhJItGYUDMhk4AzKekIqiUCUmZxTZvZT8ZZqg63Fj3Fw6LW7w7t7QXp2sQhHgA
         dhMzXk1qv0cLQed7j6Qi+Qt5e9lhQg9iSZnRLCJgwfzr5wo6aE11EAid4fRJ3FwCksmN
         qhviQrB7SGF3UvX8edikKP0pa2hT2PKvjwuUuzxUvKOqH9b7h/Qvf5qfBYZ9caMwLHMU
         eYzhBbrMOly5vEOdI2u25sQ5TFeNgn8ECIeFW1hy/EtlQ511EBAIPWPUdZDZ3y03TTZ5
         pJsklm8rZvLMsS+Cc6zvdUZx1ZrYbEKz43kfSYgQbLrYMaD5ZVCvYxcGRlzCUZj019MD
         zovA==
X-Forwarded-Encrypted: i=1; AJvYcCUSGrVPRyER6KJAvco/wx9MyGtV3fZZ5TsUg7VZCUDM+TXTCsZevGr0YNvty0BUCxMgX1p0I9dme0OS254EADumRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrUTthh+HdbAB52+VnFOxB+Og5+IbYnWbvPcaZ0brvAWigRmy0
	NJfjR+Ik5CU26ltTr2rbi2QCs88ilUjcVabuoTboD2xp1cS1J2RUX/9GuuPQPUekkzsj6Y8UlVG
	d+vhB51NHrFd+NjnNmGA26xwMm1ZOh+9BL7CE6JzCXumywQYEwUaTPHLX9/hO3Ya8Poi9q/Ac7g
	==
X-Gm-Gg: AY/fxX7kFgoBxIb0eEEu79jLY5r42r0OsoBuwpOguVwHnEeGYBM8AOl+Ig7TC5FSJFo
	KGp6OEV1uQj3Zrx/9XjKGqq1EURx6ZyJAMENXMrX09u6yJJAjnYwedYnrA1WkwTg5bsBRRtdRpz
	eY7djWbFSU3kjgMvUkma6hiPSdZ4erj8kZpPzjpxAtvWS14iTwOf/Ece1e9aGz2OkjWC7Fn2iQR
	daWhFPqREmKzj/UiotXdx3/mKddFZO40TFgZjwu3K6h7fQvujx8gto9aQH5Uk4OZxJp8OYqLGrC
	PPKaMK89n0QOuRE98exG6ZoJqrYPIRhP7uOVy0Jj2iygG2qieJwTdYkvy1RayQKy1pwWKn8jWgA
	+JiQSbv7OCqpF6Oz2MkG3uhUCjQ==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr641766251cf.27.1767358199051;
        Fri, 02 Jan 2026 04:49:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZagIXa4K7UiwD5qxXFieVCGwspFO5xpb5gF8sjqKgHUder8jH1otxtn+PNVNQiVr37FiqWA==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr641766021cf.27.1767358198703;
        Fri, 02 Jan 2026 04:49:58 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa477bsm84559575f8f.36.2026.01.02.04.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] media: samsung: exynos4-is: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:56 +0100
Message-ID: <20260102124955.64904-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1366; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7Kxp4rafP02LArCpSg5dncCo0KyLbUptXkzMYKxwphg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77zD2hVA5D57NH58kYmrfiyJQ3QXONoILlur
 6D15JdueleJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+8wAKCRDBN2bmhouD
 17PZD/9Lij+SGI18r/gFDiIrQhcXUCtmYd3oxV+HNEyfOOtGYWT5QXmo5Vc4ZPW7hLRHTYxd8z4
 ufqwqpNHT4Bd03OrijU1h1/htWdD4OW3w007czSsAeAi4wtfMk2OrydUHW0ZJny/VB3f9tpnHPH
 u3o6nULvSNMZaj2pzRwHOgNXajwzS8eXEQxrQZ9s3aaBCtAgF+5471vnQSZ95PoAHlnrjFi/wRt
 DyOM5JxExVg2cxFrpC2BKIk8rtgUHMNtxU3OZJj49C1TGHmE//EZ1mTtZ0reC5lkN0D/dKVjw7C
 WI3Vd4eXAB+yrdYhkCIvzPxM4jQ86R7lD3tv1aOTr14lsa5aZTe9UaCHyYjwUQVKC1jlwRt/TW/
 i8BQD/1YzAgObycfzQsOytiVA+Ra/KtVZy5RmwOLfFBDD5c5F/rSVCtxz8eYbX69RxszY/vFPqf
 xeTzfWFTodIr5hbqsod6LOYsMiOQT9vLQLLZRUtbfbtSknHzdNnXxeoAlwUtailGSFYG6TnXBFc
 LYV8Vdhs3uS8Ji6jN7tboxFJqwyWXNWxNE9rT6hoM221vdzHRKIrEiel8t1Zs0uorXtVPPYHL5q
 vhyb8LR0ZeiKkdZTKhFZEZXub73MILtbU3mTTMvlMyuGUQDDysTs9WfV/AfgRQuPGFSCJJovGk4 mjjujELBTaPYcWg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V47p4NqU4-0QFNIMbBAI9AYb2N0L4Q1n
X-Authority-Analysis: v=2.4 cv=IssTsb/g c=1 sm=1 tr=0 ts=6957bef7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=i4aJ-GEgVbPWXsRE1ngA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: V47p4NqU4-0QFNIMbBAI9AYb2N0L4Q1n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX1j8d1EvR8yVe
 neiRRPnJy5r8UFfiqqe/r6+T5SLM7D2yVJ/cb4x0oVMybum7FGePZo7OYevdTcFEx2xAczMMWwM
 Xf2ahygzP+bri685VE7x3t5xaL9xBLwDQzkdt+sDzHXUGV/GrSZjYHxshw1Ks2RgzTnK0XVYu55
 D1DfHyGOn1if9V5I9xEATHCov9DzSrfHizYbmgFKN+MegPlsgqeVQ2njyBeJ1HoEhnrHJyB/XUW
 On1BKv805CDrgxl1pZ68vwA+/4CWDQGL2rAXBCnONCUGq92e7BdTVWEByjpqkCe7ctrrW6SVXTk
 M1TBhOcxupyGf44gNbMX4gB6VqKmKYXGtBoQ/I++H2M2N49b1PV6PzSmMXhN4c1DkoUz/UYV05Z
 GvONOr28bumFN5qVN0eGdMh+IiswdEJeIOet5FbZHVByRqcYrgNmipVi48DZKYSQiFLJucwUZ0R
 ETAw/r9Fr4Ddtxco2cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index 0827fdaf455a..14d84cc96831 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -200,7 +200,7 @@ static int fimc_is_parse_sensor_config(struct fimc_is *is, unsigned int index,
 
 static int fimc_is_register_subdevs(struct fimc_is *is)
 {
-	struct device_node *i2c_bus, *child;
+	struct device_node *i2c_bus;
 	int ret, index = 0;
 
 	ret = fimc_isp_subdev_create(&is->isp);
@@ -208,11 +208,10 @@ static int fimc_is_register_subdevs(struct fimc_is *is)
 		return ret;
 
 	for_each_compatible_node(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
-		for_each_available_child_of_node(i2c_bus, child) {
+		for_each_available_child_of_node_scoped(i2c_bus, child) {
 			ret = fimc_is_parse_sensor_config(is, index, child);
 
 			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM) {
-				of_node_put(child);
 				of_node_put(i2c_bus);
 				return ret;
 			}
-- 
2.51.0

