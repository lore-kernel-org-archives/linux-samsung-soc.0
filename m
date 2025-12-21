Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF272FD696
	for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766327190; cv=none; b=q0t/UNKudq4BmnmySdIbLMG8Lg5jekBPFTheTPecK6HJIMsgnrT5ywjw+dasZMaqpa+cTAot18+23XwM5JgJm9RuHVuF0rWPl8vVxQreUuWpiON9AEXqLnoDKDTf7A73EY51m/ECrw8bkuLrElL6S+aETiSFg6ZMXu7S6IE5p6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766327190; c=relaxed/simple;
	bh=K0IQtqWX619jZ9YkzBmDaKMoDdmrpKcT02lv7CF+pGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYq4bM5HA+hpxA9SMDcyQZUQm4DPXofz7aldcoPQ6kc/i5IMhsoNvXtXAMjR6Jsbwo0aJIeY7Xpde/6U1ilzgxl7NDm95F1KkNCo5iB+nxCzvobCSGSUDiGk8ksvDPZWcTuyzsq2E4piGBhT2oWhynmbC7nE5CpcqawGIRqU848=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESqqQSPk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7vBAQm1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESqqQSPk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7vBAQm1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLEGgAS3256635
	for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 14:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cXrQ0eZNLwv
	aZ+XYDJE/L7mMaZiYna99KUBbaqbUVsU=; b=ESqqQSPkedBLhNq/E4CyZq1vCkD
	mpS6lcHajHlLLq/IzjSJkGONW3Tznz5HDQnY+sJEDU44RT5HXK84eRAg4auDDsZt
	zLLXjBpYr1sqVkGKeMxBfU+iRF0ltmCP7OorhTUfUIrexKTjYOhdgXO1uRnmTTOo
	RYs66G5eVwg5VkaTjWa76ONagbOYxuX7LJ8ZseR6gac0w1VDbJtk+0tn2mZnS/p9
	RtpsflX7YiFYyf4JPZCHTg4e78dvWbgGf9ImF6xO9beP6TCqGEwd8DVsqpquJ/2m
	X42Ay2Vjkaz7PLsknBt5NgF2+BFa5mxDqxmuCUkOgnZuaWs4fT77J2KgHDA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mraad2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 14:26:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6ceab125so84609501cf.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 06:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766327187; x=1766931987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXrQ0eZNLwvaZ+XYDJE/L7mMaZiYna99KUBbaqbUVsU=;
        b=L7vBAQm1aRA9ANrzMohQnDAq5S/NZgE+Bugek/hDnrSUqdxEzHegUFbvBMRtiAOIae
         E5rkR7DvlFjgr3PMiYQBBfZcUQA8hdnf/tLrt4Hli2pHKNausSfwdDlqLyCHifp/xnnc
         +o5bEWNAFcoWSSgB0Ia15Eu2Kkht4np42XGGdeD4LIJg+3u2UUIjMBX/VEB7wFFTucM2
         mhXh0Al50PXKxdHs9Cb8BtVc6P+OKWawwqQ4ks0y4wKtiKqDA3eN8uzvjr3nvg0iPCwh
         dHMIG4o7SySxZQm3XChxcSDXIWQfn8vOFirTxpaH+qkxJrqBZV3qatjH2baY11ISzNpJ
         KwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766327187; x=1766931987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cXrQ0eZNLwvaZ+XYDJE/L7mMaZiYna99KUBbaqbUVsU=;
        b=jq55e4dnAzuYeu7F39du0dajwEfjgZe/7T3T3ZSCNS+L87opORBWOzR4LOvR7VdHel
         Pgb9wGR7sFxoul6DfFnFyzVe3rDKtOPasNvnON86GG3WnbDIPf42ao0Ooj6+7NdVennm
         dSM1Z+nvdHksJAojXlqRoiphiz280CKqxf79NYErPbXEghxeBZokjvnzB9u3pDwzBYW4
         GrSzBPf6+16Y/7pvGscq0hsPIag7yGKxy0BgYevx9LHhL83fpyRTYz5dacXx0NWyMynT
         kII+2zK4Qukb9Fapq18uG6IS9Chynq/Rt5qKLlRznqpqKrgALGmD6xeFuPD+zdbrIZTf
         7ZIA==
X-Forwarded-Encrypted: i=1; AJvYcCWQmncr+SvUX93Kr3v3/dxzL1b1oKuOtPNSS9/2kgGa/LGhf0JGJhEnbWQlgeG5rK/+HhtXwbs7XBWTFWYX2Ozuhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxKpJXeiuENEnTdQtDxpFFdTQlXMoUM/etDlHdTt9Rd3fu51AF
	4VhUrOO8d4dMHRbu6ZHC40OG12IEx/aomnRL8TM4yEKh+36EEB4EYoqnkX3OQLqsWUxJ9TrHmvC
	GlUi7tA2j6URlf55xpH6byREN6O0axIMtC3LP22L1IzzzvyTvF9S2D4QokLqKDtKpTvWta/Basg
	==
X-Gm-Gg: AY/fxX4wrdgnROuZ0raDxyICuuxLJHSedAszDP5Gs918jB0KmTM8JpY7HUooRrI0YGI
	lpGTbG+JwXkJbypbiW5mwxnY/Brngp3G1ta1PH9IExN+hKkGlu2bPE8pIgiGLdzCbu2s23EQJAu
	lStm/MF9MLWA9RsLPBVdzfc2CyZmnH/p9+rC496uM4W31ahxzBMp9vDeshNA6e4JWpJp4v8Lp9H
	637GvdMr0rzOe0IpWtCIdHgq+epkaX30dvOXtScBrnoZ/U59mAzJvt2qSAvRJ3cX0nCW3oAaky8
	a4P0GD6Kcfu9c2rfF1HdLFbxSvlT5VRkYaTbTwkmtbVB+Op2xgSIXyax+BD1wrZb0KnLrYAWinz
	pqEOPZ93mnyP2V9V0j1e1q1LEaP9xGHC8FFr6zG3sk4R5sEu2mYbQZHr+cWqfQBpKvIg=
X-Received: by 2002:ac8:6f07:0:b0:4f1:83e3:bb1a with SMTP id d75a77b69052e-4f4abcf86abmr121194941cf.31.1766327187402;
        Sun, 21 Dec 2025 06:26:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4X1T9bdZZS/qvpRUsFhD2vRTGIBwr1akucMiS/SqlqEtSXJi9+JqEGzxWGbwmBgDxvbN0gQ==
X-Received: by 2002:ac8:6f07:0:b0:4f1:83e3:bb1a with SMTP id d75a77b69052e-4f4abcf86abmr121194621cf.31.1766327186904;
        Sun, 21 Dec 2025 06:26:26 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80620c4520sm211742666b.28.2025.12.21.06.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 06:26:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] iio: adc: exynos: Simplify probe() with local 'dev' and 'np'
Date: Sun, 21 Dec 2025 15:26:04 +0100
Message-ID: <20251221142602.47368-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251221142602.47368-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251221142602.47368-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4355; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=K0IQtqWX619jZ9YkzBmDaKMoDdmrpKcT02lv7CF+pGE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSAN7uXaCJu7ZGPqhfs4R9Ef5h9276gYJLaLUY
 YKtXtzQRLGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUgDewAKCRDBN2bmhouD
 1zfqD/wIktSEHD3nlDu4v1bjhJA+iTTRm5qqTc01Jd3T7PEFYcGXDQQwVYANojieNLNhQux9H/p
 NFLX3aSMRGGDEtulqa8DTrHo70IujJZnb2VvTTwdsT1tLHm2e3cIJu2tEdsuSICwS/NYNbpJahV
 BwjaeUk3isJfSeqXAP6Csj3zU4RfoaB92oRmTYaBj3eORohYq6iX/4Aau7uY4KTPR/L2Q979/L2
 oK46pTx6bcGRSMxerNyqWfkY7wFEnldgowWv+xTWy8+zUeEttz+1RTfu/TZN3KMTkwPJo6EQNHU
 cYv/XezRWPAZdmSeVmsNQARSPCZoXtMw8kY5rq3m6NdJaGe/epLes9YKEEVao3TqboDYEtFGpws
 +N1kQjjwOjdRLTBufFRlH7Srs3LK7s7fliDsvr4QC+Ds6HVcj9VQ629ELMv7HOVj5z1L6xtGB4/
 2uHJWxzoPAY0CvX1tuyVHtvXrc9W4i4hAe/dNXmPpkgY4sndzLGcjsLtfZNNSHzRozcPVo3LRmQ
 QEsDz+N1VL2jw2fvLPTeV4GlwIFvlwXk9g+Tp7XFsQroqX6D4OTzxudmqlMPnjJcrcF0tvZMlol
 mMO9nAe9r45SZ0mNUNB+DdalACiMKdZxySYOp6/HwvPbxNagKQxBEAAnkQS2cnW/OIZdKLBHhdD StOStPPzq1Gm0FA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 10aphw5w4l_okoNiFdZUeksah0NLibGd
X-Proofpoint-GUID: 10aphw5w4l_okoNiFdZUeksah0NLibGd
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=69480393 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=XA6BSOE7zRTYN9-09qgA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDEzNSBTYWx0ZWRfXwyLSoYljpmXg
 4Nkze+abXa+3H/PSFCGjxRXvkfzx6g1QXCIqhjehMfu+HRWCxsJkBe6D/ihDV5m6+fVBl093Rsv
 jCQ0IU5T2IZiZ9V0GActUCYNiCw8Gkdndyx+QhepUu1nHY7aNQtBmy2qrElznpEnInBbHixowhb
 t9oX8o8tIoYruOeVyLE5vyyCotnNgNnc6mHzUGtKU711jrq5xYlIr9o+m8Jai9oHj2lHP/tMP5D
 bbWgBvFHXKJS2zLqWGwn2GkO9rD40upNyC0YhEg5MdtM3X+FKzvFn/i2kKLzESChIOtrLY+uHDT
 KG/d8a+Zx0okXtMmUhKN90yHGwFL3GdxR2NdgId8NySa1avjSrGu2GWOAvMbepSU3b8UAYB1eF9
 S/yVznKwCBQtxLHryyTT042x/0RKxifsEUmVomGQNHag6pE5Bzp9Rn24GyqWiVJm0EHHKvlUlFo
 ln2s5rwqns5mXyuTM2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512210135

Simplify the probe function by using local 'dev' and 'np' variables
instead of full pointer dereferences.  This makes several lines shorter,
which allows to avoid wrapping making code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/iio/adc/exynos_adc.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 491e8dcfd91e..aa287132a369 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -552,12 +552,13 @@ static int exynos_adc_remove_devices(struct device *dev, void *c)
 static int exynos_adc_probe(struct platform_device *pdev)
 {
 	struct exynos_adc *info = NULL;
+	struct device *dev = &pdev->dev;
 	struct device_node *np = pdev->dev.of_node;
 	struct iio_dev *indio_dev = NULL;
 	int ret;
 	int irq;
 
-	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(struct exynos_adc));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(struct exynos_adc));
 	if (!indio_dev)
 		return -ENOMEM;
 
@@ -565,7 +566,7 @@ static int exynos_adc_probe(struct platform_device *pdev)
 
 	info->data = exynos_adc_get_data(pdev);
 	if (!info->data)
-		return dev_err_probe(&pdev->dev, -EINVAL, "failed getting exynos_adc_data\n");
+		return dev_err_probe(dev, -EINVAL, "failed getting exynos_adc_data\n");
 
 	info->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(info->regs))
@@ -573,11 +574,9 @@ static int exynos_adc_probe(struct platform_device *pdev)
 
 
 	if (info->data->needs_adc_phy) {
-		info->pmu_map = syscon_regmap_lookup_by_phandle(
-					pdev->dev.of_node,
-					"samsung,syscon-phandle");
+		info->pmu_map = syscon_regmap_lookup_by_phandle(np, "samsung,syscon-phandle");
 		if (IS_ERR(info->pmu_map))
-			return dev_err_probe(&pdev->dev, PTR_ERR(info->pmu_map),
+			return dev_err_probe(dev, PTR_ERR(info->pmu_map),
 					     "syscon regmap lookup failed.\n");
 	}
 
@@ -585,25 +584,24 @@ static int exynos_adc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 	info->irq = irq;
-	info->dev = &pdev->dev;
+	info->dev = dev;
 
 	init_completion(&info->completion);
 
-	info->clk = devm_clk_get(&pdev->dev, "adc");
+	info->clk = devm_clk_get(dev, "adc");
 	if (IS_ERR(info->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->clk), "failed getting clock\n");
+		return dev_err_probe(dev, PTR_ERR(info->clk), "failed getting clock\n");
 
 	if (info->data->needs_sclk) {
-		info->sclk = devm_clk_get(&pdev->dev, "sclk");
+		info->sclk = devm_clk_get(dev, "sclk");
 		if (IS_ERR(info->sclk))
-			return dev_err_probe(&pdev->dev, PTR_ERR(info->sclk),
+			return dev_err_probe(dev, PTR_ERR(info->sclk),
 					     "failed getting sclk clock\n");
 	}
 
-	info->vdd = devm_regulator_get(&pdev->dev, "vdd");
+	info->vdd = devm_regulator_get(dev, "vdd");
 	if (IS_ERR(info->vdd))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->vdd),
-				     "failed getting regulator");
+		return dev_err_probe(dev, PTR_ERR(info->vdd), "failed getting regulator");
 
 	ret = regulator_enable(info->vdd);
 	if (ret)
@@ -619,7 +617,7 @@ static int exynos_adc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, indio_dev);
 
-	indio_dev->name = dev_name(&pdev->dev);
+	indio_dev->name = dev_name(dev);
 	indio_dev->info = &exynos_adc_iio_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = exynos_adc_iio_channels;
@@ -627,11 +625,9 @@ static int exynos_adc_probe(struct platform_device *pdev)
 
 	mutex_init(&info->lock);
 
-	ret = request_irq(info->irq, exynos_adc_isr,
-					0, dev_name(&pdev->dev), info);
+	ret = request_irq(info->irq, exynos_adc_isr, 0, dev_name(dev), info);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "failed requesting irq, irq = %d\n",
-							info->irq);
+		dev_err(dev, "failed requesting irq, irq = %d\n", info->irq);
 		goto err_disable_clk;
 	}
 
@@ -644,7 +640,7 @@ static int exynos_adc_probe(struct platform_device *pdev)
 
 	ret = of_platform_populate(np, exynos_adc_match, NULL, &indio_dev->dev);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "failed adding child nodes\n");
+		dev_err(dev, "failed adding child nodes\n");
 		goto err_of_populate;
 	}
 
-- 
2.51.0

