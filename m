Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAC920459A
	for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 14:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766327188; cv=none; b=YTgkRDuxphv9YJdSEO7HPJ1ouzJ8e0/9MTxdVOFFbkuQCgaGGqm/lIo8QTDQLdsSacbohCc0z9lpRXbYM5OlUjYa4abkorAgg7zTdburQPyq7+DmcCZiPvhgrL03O4a+wCgNxpc/lj34blrKcD24Y+j6GQwiO0BgfU28ti3zTOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766327188; c=relaxed/simple;
	bh=4memX5LYrUSHkpPHO9rC17xhoMrrygUhrVZmB+X+Pes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lSj5t44/Ta6w3wTgN4YdnnA0hKjlFLmAJcyHG3yNZ1CCRK2dLhkFoIV9WSApn59r5os0HdVENtgtgKqyd3/rZJzSNT3AfFU0GNK2xVoNywWaJQVnQlHyhzXY9TtS+8pAxYsjcD60o/ZDIKTTske+FFjbWg4eGb/CLIrAz3rv/f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8EUpWtX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1BPYhUs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8EUpWtX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1BPYhUs"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLEGNex3089684
	for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 14:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hgLU28eZkGhuvXnuaKPXbCVu7AuMcgJfWMs
	7HupizkM=; b=m8EUpWtXl3yU9Rj8JAnOwV47nrwluO7hLjeBfomTh99Rg6v1FVH
	7lAbOiiTId8JG875n/CBetzVQxZEHKmAMdJET8z4HgZVPs7bISugR6zXg3fFhal2
	a2UIH3pS28Yv9WxloIjcXIPDcn0gBraDLP0+7emj/amIHKMcjaK9OMFHYI+eau/j
	g3dnQQ+6l7Xi2Qg6Gm6zL2tYxBiP0vzYnwJx0KXBO/kWCqlomOL72jkz03dBO/bA
	m4GRGIlJM0YgE+6i1SPaC097B1CIf1vxFfh5mjzJ4/uXgfMt8rC2QepxY0l8jZjx
	uGgk+5Nia8r/IT/KjxAfK2djdBySTQC9QYA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux2cug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 14:26:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a3929171bso67572726d6.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 06:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766327185; x=1766931985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hgLU28eZkGhuvXnuaKPXbCVu7AuMcgJfWMs7HupizkM=;
        b=K1BPYhUsLkf0mrYPNruHo9EDTcH8ZIBpFaNSjxht8tCE+YOS+fqoewdUqmnQcwd0pl
         zKUP52tiLnigCtMgn8gvxa++76Evnfe75nIgKGrQqrqi/xlmW9L2FLERRoBtg+8Xm2xg
         jAaJxNbRDtEVa/PpuVAKQoQ+qAlq8rCplpsmYkc0ZwBwbFqO1uz0nn6qUlrOqmPvLEcA
         NFcMn0rh27r/DACkXU8l8TyUkaQTxQO7EneBe0E5Cs3tjBm3ySBUJ0o903jTTfKDWqT2
         gKCvFDyRzX+MqCNpAtG2Pp7l9agTiPj98VdbCez9nWIMWzHLocB5DdAbCHsAkwwcNg95
         NEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766327185; x=1766931985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgLU28eZkGhuvXnuaKPXbCVu7AuMcgJfWMs7HupizkM=;
        b=hP6N0TrVbCOk8WddZjikmtuVVQ9kMdTQYMVftNbka5ofHr9vemd1CgpG3oYdeq/kjo
         wNVHkfvJADmHBFNsknzEwtmGYgIlBLeDtRzRf02jkoAh7e8g+hk62UXSLpa1eJ2+r5JO
         L1ufJLUTUx0qJSmjdJCCIp/znqGIDPd48eXhB3W7KT6OQzAopHMOi+AtU5iFNvoFGKfh
         HSkCN902yZ11DXo97ZRfkJJ8dmqJZImwYiXRw5B7PWYf7zf4CVyuZKLMpl/ZgsCf3y7h
         YMKFkO7jTfdrI7ScwU0BYdPZ2mpfbrNKLXWt7RVlZ9s8baJwpLgREYfdJPigdyD/eOUs
         P4ww==
X-Forwarded-Encrypted: i=1; AJvYcCUjzGo6/9nW09AIjIqXMbXpuMZtvhk6L0+lo+eiexvZNnA29V4r16XnQKnLvuxF/+6uKmh/y6lnB7JabjTPkBwQLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpjtB/Z8N/zTkBIxvXnT/ySGqCV3QdeZ/iH67KG20QORolEkSC
	DyD7k8KywIvSX/cT7+usTrn8SNXQ1aZ7dq4lnMApqFvUQKmC+wP1jw5LZSGrlufp/mxtMZPuEFC
	2uP/7BGw6C9FIDkkfgbCsVZKvDKMNTCawrbewxwK2ZprOC+NijJUJFlmijoAn09o3AhFCfbMFIQ
	==
X-Gm-Gg: AY/fxX72hS4UkkS/2MneuSeUepBCbAdTwwClVC48buSO1PPD+oRnqvUA1W3RZ2bfWzP
	AfMnY+yxoVv5DYV7HpYTzdZTZN9XDyrv2KJYOaQIIIjimIXgMbQqzrOLpnv/S4P2H/i7WCtOfRg
	gO7r57Ea1V0Pi2LdChN4bFHm9zoq7wKTJmXVDcljtV8H6Y7X9jbxJIZzPfI9sU/jtWyw8N3TThN
	sibJP7BcEw2nzuxDgqSJoACpX0KDFnlQA5+14jJH9zKqoX0mjhDHWS/HZR/PQs3wQs+iZ8newkD
	7H5agOsRSTkF9kNoipPYSvVwe+fYwOI+JclBYpMGdkhZEvhLGDxxSd7LKQm2GgBiIuA+P0A5KO+
	RbPbB+qoaNAlspfw+PxbRCF2E8H+jnXGeoHRUvOQp2Qg7kV+p+wGu145Jj7dEI9U5HKM=
X-Received: by 2002:ac8:7c4d:0:b0:4f1:ea37:cc6c with SMTP id d75a77b69052e-4f4abccef5cmr121973771cf.1.1766327185428;
        Sun, 21 Dec 2025 06:26:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1Ewwu8jx2ZwPNq71Z/1YkKihvuGLTgnEvdj7fUV4p110jAK9fWg0mU4MzcCWC6pVFe4KQUw==
X-Received: by 2002:ac8:7c4d:0:b0:4f1:ea37:cc6c with SMTP id d75a77b69052e-4f4abccef5cmr121973401cf.1.1766327184948;
        Sun, 21 Dec 2025 06:26:24 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80620c4520sm211742666b.28.2025.12.21.06.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 06:26:24 -0800 (PST)
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
Subject: [PATCH 1/3] iio: adc: aspeed: Simplify probe() with local 'dev' and 'np'
Date: Sun, 21 Dec 2025 15:26:03 +0100
Message-ID: <20251221142602.47368-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5796; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=4memX5LYrUSHkpPHO9rC17xhoMrrygUhrVZmB+X+Pes=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSAN6XXbmliCtMd47o2Ukt4Nzqp5wMfuT7YMpn
 B0bxk6i8+iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUgDegAKCRDBN2bmhouD
 1+QUD/4h6/Z/xjzwuixOi8qQKqxnJhDBq0SFL89uOLzuKcSdkerG6kIqP7Ohf+mL8qJq4iT9ZiK
 VsdrgMQA3s3wVXAXqMBkdCK4e9csD8bF2MAUKIb6+HbFsphWegKqmDsL43IPwZx9/Jnhc8ju4xg
 oxISsYHMxi+Lj+hZLswy7fJuPV/rlT4xRCfpnYaEaHrxzE0DHOdYw9VFuch6FLzt/KI5dJB+0rq
 7bqm2523WSW2EJ4qQhN0AIfkGnn7aQS8WFdQ9JgjvYolDnqxLqRTskV+aTUh77WY2ryH27Z/qSm
 cHHcsvZ4+knptjeLzi7tuaHR6Fm1a4PV9q1Cf6nvm2G8XflIX9mk9xTUCzqz5uFkJx4p/hW2n5R
 6owLdaaAFn3fweGPPh56+M388RM89VLo3lkF1W0ElrbFdySTYlWn00GU1nS90KlKf7MxrsWOoSS
 RaSroRmjHzXefIK6ze3kbvtJE6WWl4yhFfauKQea7oj8F2bPFtXX966l/rAm3hf2dxd1CrYdOCE
 RksgInFqSNWHu3uv+A5FBHnK3AqjapgI4O0rjglPxs4M65UEZ/Y7wJDZtriE0TYjiDNFIxl4lo2
 njHCvzlwf61GZw/aZas9Y1KQrIPiEYJeCBOcCv49+k/V6Q8WWZUJtdkLDLvBbHNzeL+MeN/gb4A JQzD7dXuG8fDQ9A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jrPwVtnlrNRpP0qGEB9DX6cTs3UIdArJ
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=69480392 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Nk-rwAvTYNLgZ8AtZ6UA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: jrPwVtnlrNRpP0qGEB9DX6cTs3UIdArJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDEzNSBTYWx0ZWRfX8oO0avKs3VyY
 5r5/vUf0+hIIfJMwo5LpTPr5Bo2WslJM5eyOK1HkDvH6pEN59y5czt5W7eYlCDsRsE2oZzvebL/
 LHuzlumNH7ry74X8YQbk9d4efxplZ66RuFEytNa+w7bBu0RJkOePrj41s0KuQPg/yXKBiEmE89U
 Bg5X6O6DBnAbqlCSYbizsS27JUvp6V+AohgzJAkOdVQ7oKeiqThXjsHaT65x3L9adJP3Nbb31sP
 jixve/75txr9NrKM8KLrQkTHg9gAO5W0dFGRTGKucTwS+M01Gz02KOhX5mpMQ1K7eU+cS5dOBZn
 VQocki0buw+08r4/sEL5NgvjwNhqui5wpEqEReohPZ56p/nHLY4ec+7LKXxoLD8dO5o8H70tNco
 xUNJXynTYZdM5frfoxb6SwfpDn9sxOKUQM4MGimg9wOdIc02eKt5whYq9bOdxu63rhC6r2s+550
 VuxQmvTNdV25xnd4fOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512210135

Simplify the probe function by using local 'dev' and 'np' variables
instead of full pointer dereferences.  This makes several lines shorter,
which allows to avoid wrapping making code more readable.  While
touching the return line, simplify by avoiding unnecessary 'ret'
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/iio/adc/aspeed_adc.c | 42 ++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 1ae45fe90e6c..4be44c524b4d 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -472,16 +472,18 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	struct aspeed_adc_data *data;
 	int ret;
 	u32 adc_engine_control_reg_val;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev_of_node(dev);
 	unsigned long scaler_flags = 0;
 	char clk_name[32], clk_parent_name[32];
 
-	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*data));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!indio_dev)
 		return -ENOMEM;
 
 	data = iio_priv(indio_dev);
-	data->dev = &pdev->dev;
-	data->model_data = of_device_get_match_data(&pdev->dev);
+	data->dev = dev;
+	data->model_data = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, indio_dev);
 
 	data->base = devm_platform_ioremap_resource(pdev, 0);
@@ -491,16 +493,15 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	/* Register ADC clock prescaler with source specified by device tree. */
 	spin_lock_init(&data->clk_lock);
 	snprintf(clk_parent_name, ARRAY_SIZE(clk_parent_name), "%s",
-		 of_clk_get_parent_name(pdev->dev.of_node, 0));
+		 of_clk_get_parent_name(np, 0));
 	snprintf(clk_name, ARRAY_SIZE(clk_name), "%s-fixed-div",
 		 data->model_data->model_name);
-	data->fixed_div_clk = clk_hw_register_fixed_factor(
-		&pdev->dev, clk_name, clk_parent_name, 0, 1, 2);
+	data->fixed_div_clk = clk_hw_register_fixed_factor(dev, clk_name,
+							   clk_parent_name, 0, 1, 2);
 	if (IS_ERR(data->fixed_div_clk))
 		return PTR_ERR(data->fixed_div_clk);
 
-	ret = devm_add_action_or_reset(data->dev,
-				       aspeed_adc_unregister_fixed_divider,
+	ret = devm_add_action_or_reset(dev, aspeed_adc_unregister_fixed_divider,
 				       data->fixed_div_clk);
 	if (ret)
 		return ret;
@@ -510,7 +511,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 		snprintf(clk_name, ARRAY_SIZE(clk_name), "%s-prescaler",
 			 data->model_data->model_name);
 		data->clk_prescaler = devm_clk_hw_register_divider(
-			&pdev->dev, clk_name, clk_parent_name, 0,
+			dev, clk_name, clk_parent_name, 0,
 			data->base + ASPEED_REG_CLOCK_CONTROL, 17, 15, 0,
 			&data->clk_lock);
 		if (IS_ERR(data->clk_prescaler))
@@ -526,7 +527,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	snprintf(clk_name, ARRAY_SIZE(clk_name), "%s-scaler",
 		 data->model_data->model_name);
 	data->clk_scaler = devm_clk_hw_register_divider(
-		&pdev->dev, clk_name, clk_parent_name, scaler_flags,
+		dev, clk_name, clk_parent_name, scaler_flags,
 		data->base + ASPEED_REG_CLOCK_CONTROL, 0,
 		data->model_data->scaler_bit_width,
 		data->model_data->need_prescaler ? CLK_DIVIDER_ONE_BASED : 0,
@@ -534,15 +535,14 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	if (IS_ERR(data->clk_scaler))
 		return PTR_ERR(data->clk_scaler);
 
-	data->rst = devm_reset_control_get_shared(&pdev->dev, NULL);
+	data->rst = devm_reset_control_get_shared(dev, NULL);
 	if (IS_ERR(data->rst))
-		return dev_err_probe(&pdev->dev, PTR_ERR(data->rst),
+		return dev_err_probe(dev, PTR_ERR(data->rst),
 				     "invalid or missing reset controller device tree entry");
 
 	reset_control_deassert(data->rst);
 
-	ret = devm_add_action_or_reset(data->dev, aspeed_adc_reset_assert,
-				       data->rst);
+	ret = devm_add_action_or_reset(dev, aspeed_adc_reset_assert, data->rst);
 	if (ret)
 		return ret;
 
@@ -554,7 +554,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (of_property_present(data->dev->of_node, "aspeed,battery-sensing")) {
+	if (of_property_present(np, "aspeed,battery-sensing")) {
 		if (data->model_data->bat_sense_sup) {
 			data->battery_sensing = 1;
 			if (readl(data->base + ASPEED_REG_ENGINE_CONTROL) &
@@ -566,15 +566,13 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 				data->battery_mode_gain.div = 2;
 			}
 		} else
-			dev_warn(&pdev->dev,
-				 "Failed to enable battery-sensing mode\n");
+			dev_warn(dev, "Failed to enable battery-sensing mode\n");
 	}
 
 	ret = clk_prepare_enable(data->clk_scaler->clk);
 	if (ret)
 		return ret;
-	ret = devm_add_action_or_reset(data->dev,
-				       aspeed_adc_clk_disable_unprepare,
+	ret = devm_add_action_or_reset(dev, aspeed_adc_clk_disable_unprepare,
 				       data->clk_scaler->clk);
 	if (ret)
 		return ret;
@@ -592,8 +590,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	writel(adc_engine_control_reg_val,
 	       data->base + ASPEED_REG_ENGINE_CONTROL);
 
-	ret = devm_add_action_or_reset(data->dev, aspeed_adc_power_down,
-					data);
+	ret = devm_add_action_or_reset(dev, aspeed_adc_power_down, data);
 	if (ret)
 		return ret;
 
@@ -625,8 +622,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 					    aspeed_adc_iio_channels;
 	indio_dev->num_channels = data->model_data->num_channels;
 
-	ret = devm_iio_device_register(data->dev, indio_dev);
-	return ret;
+	return devm_iio_device_register(dev, indio_dev);
 }
 
 static const struct aspeed_adc_trim_locate ast2500_adc_trim = {
-- 
2.51.0

