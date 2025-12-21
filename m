Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7F32FD7BC
	for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766327193; cv=none; b=V4t5dXIE2I7AFr1Beyy1ie+EkLFnEStJ4VR+J01WewYDhN41Ny93DZ+mUpI1Sf9cSxj7V3v0oo4VSu/OXRttiRG/LcXz/f/ft1pmzKk94VrMp8PmhplgelIKlanZK5qP+1LCCYLpGWcbcTPolF8BnIMNNJ1z/PY5pf/vukvsVTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766327193; c=relaxed/simple;
	bh=HCB26hEUOkbZ72ftaM1RnljHTQz/EsE98Plg38e2Ofw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZBDpAt/JxjMvFtkMbnLmX6yu+aUbCL1qw/Uoa3yhuF3yyasRrJYVTtDEWV4uxXg8FLp7NdDKR2sNDJE0LN68NUqKMQx7SR+6C9m6VB2T2kLHkWGpI7lcV3wg1nbFxYT8kYBV295vkb+qfp98Lvyam84EeZHFXwSgeCu1eoSRlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FsRh4ae1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TsEoHbAN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FsRh4ae1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TsEoHbAN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BL1FSuP1884320
	for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 14:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N/Ya93eis3x
	qRDX4t6fcfXGbB6PyZ7xS9AaL1hTAB60=; b=FsRh4ae1DDi063NeFL/u8wjoPkP
	sN1VrGwgnaX/DgnI7mD43o25xSS/xFHXShyTridFFdVWZpPGo84Z/I+LjFv9ovDj
	LLyfTZ2ABPhXHSYNckKztW8l8a3UJSlHgeLHe55Y1Of9CDatGM4/RVVbdWGkp0vW
	osM7k2noJ4Oy5Vp1hc2ki10MluXc7IarvuJ1FydPxHvsxH1vGeAU8WrZ9VJ1JMYi
	ZJGz7keslpPULe87+fC4PKckLRziJA+8v5DskpSKLSXE7UX1U9iI8OzlTmIJAR6/
	/BejovyYdwu0O/Q7DM+unaC50m4e3+4qmFq1whpSy7K9Bz+hJ2Elux1atdQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mubjduy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 14:26:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a2d8b7ea5so39255066d6.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 06:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766327190; x=1766931990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/Ya93eis3xqRDX4t6fcfXGbB6PyZ7xS9AaL1hTAB60=;
        b=TsEoHbANP1S4kLyG+02IixVXZsHcXJDC1ykCKChYQAWReVjkGxYfqmUf2+R9GCxSx0
         vE33mY2afC9a1YG/PVE8ZYrxchaMpW8ked6QEsobAsPrmJOb9+oyVed+KMmlkqzw43Tl
         8wZSqHsEDVO2/SzJAlelMzr2Bz1htyhXDGNXfERxC9qZp3FltKbD3gGxRZDFx/SfVuNa
         7Fwt7f4vxPcLI6TtqJsn042Cdqe3YraKx5Yemj/t/yHm1k2LH7vfDnvZGKSXYx3eNAhH
         RL4o/+xUmbXxDiIFsLtKIQazJDvdLIT3y8j8o4SespYy0j1MAsfyCDOIJWKzg/4I26EV
         pZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766327190; x=1766931990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N/Ya93eis3xqRDX4t6fcfXGbB6PyZ7xS9AaL1hTAB60=;
        b=aV4MevXkte1ZYZ26fm9BEb3Q1VptErvy0OZ3ucVFYjSHuwUIPXJPSASzAKluqWuYA5
         d+jECz1k7lvAGVKj/zFyrXz7tbcC24DJHPYDMvSJ6N23gsdn6ecq9Kg1kKUW17AghIxT
         4bWD8GXKT07i+JZq3SDfzkrHk+OCamZ3m50+NOItDeRgfXuuqCiU+w10WtAIbrzhe9OM
         pIBLvxBk7rVNPAoW9J+RJHU1ajN4j0QXgcPw1oiUGIYIxAVKXWQYIwU6ZptwKaPlF4qe
         xzZYta7tkUHZTGeiIziXdXgPv/KT5VK+sLrD8Mpl9YcE6zhjT7TeyYha1dkxTF/qNmuV
         pjxw==
X-Forwarded-Encrypted: i=1; AJvYcCWOerabeCBauWclxixwnBTAnZoMi4+u4ANiytkbJl5LxE0SFmBQ9Ql5d4L5Xf4B4y64oZ0dA/JNv+91R8+REWJWCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMXMIylia9MdyiEet22cM6HSMguRiT5VJa59kpAq3mpHs0BO9B
	sXnka9bZvzI46vZIVrO/fZPTjXpnepRbVdpUpC57rrCa/AoJdEhtPwY3iopL3/CY3KfMFEKU4DY
	FvJSujGDgH+0g6fq5fxgYEHxtEODE49X1c7zFbRmBuKgQc8z0pvecW45wiy8JETy32sO9jQNGAg
	==
X-Gm-Gg: AY/fxX6rhDjgRUvMgnKIDkCy8ChjUmQqkkyJGkG2SdBiIxW4kX2fOQvEtGWa5OJzhmJ
	mG/Nx8nICDz7Nen/IErpFJJ1OJIaq9nTd8z7GqUGNzrn0b+jVDXixfkNS605BVwbCoo5CXEwXl7
	McNf9tp2SfS9EjyQalAB5rIQy7Ii16bybcLGBOgQPlrcMdYc4MPjl2K2hQDaQTrN1XopxgS7zwj
	RQn/is1DcPAswS8IzVxv3qB0awp0gJvA1P6LWrgZNqWFfheIdjqC64KeAIJwcMYWLYoB8gUWAIf
	iRq6AKDU3tRuW0eqGxbq0hxFCex74W8pLlqmTUfCg7yoKgLAMQcw2QZ6ThXyIjfctPvYXJ5Xkxz
	8T5jDPJspOpdLdyFhahjImzzFEg53H2v6bUJZWHl8eLNDdBp6OKxXjqpiPiGIiGKsSkA=
X-Received: by 2002:ac8:4808:0:b0:4f4:c11f:a893 with SMTP id d75a77b69052e-4f4c841ce15mr13310161cf.38.1766327189831;
        Sun, 21 Dec 2025 06:26:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6MSj9kp3XaPt/Hj5dvTyhFXG7Ou9KvnYkLbuj3WrXScz5IKiaHkNRDJMrQqc7zufDKoYpDQ==
X-Received: by 2002:ac8:4808:0:b0:4f4:c11f:a893 with SMTP id d75a77b69052e-4f4c841ce15mr13309851cf.38.1766327189276;
        Sun, 21 Dec 2025 06:26:29 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80620c4520sm211742666b.28.2025.12.21.06.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 06:26:28 -0800 (PST)
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
Subject: [PATCH 3/3] iio: adc: rockchip: Simplify probe() with local 'dev'
Date: Sun, 21 Dec 2025 15:26:05 +0100
Message-ID: <20251221142602.47368-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251221142602.47368-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251221142602.47368-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6007; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=HCB26hEUOkbZ72ftaM1RnljHTQz/EsE98Plg38e2Ofw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSAN8/kcgZNFHUfB3Ke+DoF9mdl7RgO5jsfjBt
 eN2YOKEHeqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUgDfAAKCRDBN2bmhouD
 13OzD/93KT9dmliMmsuwd8OOM8ZuIX084rVOcADFrvVtzozY0sU8KlUTvYM/rPMk0reJd+QgIvq
 N1LZVujUSp3iYnYUk1v9/iaXKnbIUR+/kU5gNBZzoTz4FuoPXnQHzHjqJw1nPmrDaas93l0YR8M
 2F9VZuU7nELtirflYtOEOtzAHIfAwxc9GhcslUuHTD44dtc34W8s0xCzXB6m91DKH3T2u13q5/F
 BcS9YWPjAZ2kKw1Aa98hxwXSb7yTyZQn+D+74OeuF86xg8ADZOUV7By7uUJ19pR/uu2Pabl9Vit
 tk03JUTPTlUKzFOqQZ1N+5fTxjFgNRn8TdzVrQoy1t8QexBRo5lTSlpAQ5RTe6ft4lW6dDti54R
 b28cFZyN/z+a/lTu4eMvC1oRNEZuyGoWGTKxE2UnSTWcdzSebTUOXh/IgV+faAzEk4SRmMXsehU
 e03NBnIIcXoeoJbe99uJ65vYEPTD5PD8ktls9/3n4bMNjCscHwvkAyMWw4Q1GHDPbo+RFAvjP6b
 PQBZFt5IFj7vUJm5Y7zD0EK4CzgLbBrDhUtD1D0HIWOAGwpm42ytcF00VTiSJbwKoUPjsXWKMcl
 xmcwRIBdcM3Otrdvl/arbkZjZtD30tpJ8Ugl21DoVCX0mBCn8vziGIgCM8MlzXgoj7ax6ltia2L xCpbZ49NWUj7xbg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDEzNSBTYWx0ZWRfX7r8P8Vryeunk
 e++5Be2dlqtM8H6xgj9p904PHpNr8LWyY4h/Hd84J2l1RhM0bZVuMT0qwPCgVWOSQExNd8p/PE2
 VRZgVzqQE5ZBRw8q3Low8WQdEWrPLCbpilGxKMXQ+vayoSo2h/f3JejzPBjcU9vR8GBqlUp9IUQ
 c1a1wb5QLNVh1xg52NSbw9G5Wo8u2uefwWwuUWnZNUkDTyZUicY/GFXyN2W7yjfBBA0Xzi8D0it
 QLKjFTPP4p/cUA7eYQBiolKRvUx/cXCQkbGbK4+8QtB/lQJkNrZwUWLDeard23NN+hjTNpRgqzP
 QdHQXa/3cSKx/YqFF8HCYRYiPMarFBp5q6piA4vN8YSYhWKGhYlgVhzQzq0Z1ZvZgnzEIP7QJ+H
 J/hCJSzI/R1b//JJOHi19Yye/6XoUG2S/ZRuDWS8nB7e6lU83fY6bzfgdIShdEmD8J5Xd2GiVP1
 2mdyPDFqPq/J4cWeKdw==
X-Proofpoint-GUID: G95vvPMzAPlFHpPQw5fqjeurrJd1Go_M
X-Proofpoint-ORIG-GUID: G95vvPMzAPlFHpPQw5fqjeurrJd1Go_M
X-Authority-Analysis: v=2.4 cv=KYbfcAYD c=1 sm=1 tr=0 ts=69480396 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Dh8f_jLqcEms2xoULN4A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512210135

Simplify the probe function by using a local 'dev' variable instead of
full pointer dereference.  This makes several lines shorter, which
allows to avoid wrapping making code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/iio/adc/rockchip_saradc.c | 50 ++++++++++++++-----------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
index 263d80c5fc50..0f0bf2906af0 100644
--- a/drivers/iio/adc/rockchip_saradc.c
+++ b/drivers/iio/adc/rockchip_saradc.c
@@ -456,6 +456,7 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 {
 	const struct rockchip_saradc_data *match_data;
 	struct rockchip_saradc *info = NULL;
+	struct device *dev = &pdev->dev;
 	struct device_node *np = pdev->dev.of_node;
 	struct iio_dev *indio_dev = NULL;
 	int ret;
@@ -464,23 +465,21 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 	if (!np)
 		return -ENODEV;
 
-	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*info));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*info));
 	if (!indio_dev)
 		return -ENOMEM;
 
 	info = iio_priv(indio_dev);
 
-	match_data = of_device_get_match_data(&pdev->dev);
+	match_data = of_device_get_match_data(dev);
 	if (!match_data)
-		return dev_err_probe(&pdev->dev, -ENODEV,
-				     "failed to match device\n");
+		return dev_err_probe(dev, -ENODEV, "failed to match device\n");
 
 	info->data = match_data;
 
 	/* Sanity check for possible later IP variants with more channels */
 	if (info->data->num_channels > SARADC_MAX_CHANNELS)
-		return dev_err_probe(&pdev->dev, -EINVAL,
-				     "max channels exceeded");
+		return dev_err_probe(dev, -EINVAL, "max channels exceeded");
 
 	info->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(info->regs))
@@ -490,10 +489,9 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 	 * The reset should be an optional property, as it should work
 	 * with old devicetrees as well
 	 */
-	info->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
-								"saradc-apb");
+	info->reset = devm_reset_control_get_optional_exclusive(dev, "saradc-apb");
 	if (IS_ERR(info->reset))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->reset),
+		return dev_err_probe(dev, PTR_ERR(info->reset),
 				     "failed to get saradc-apb\n");
 
 	init_completion(&info->completion);
@@ -502,14 +500,14 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, rockchip_saradc_isr,
+	ret = devm_request_irq(dev, irq, rockchip_saradc_isr,
 			       0, dev_name(&pdev->dev), info);
 	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret, "failed requesting irq %d\n", irq);
+		return dev_err_probe(dev, ret, "failed requesting irq %d\n", irq);
 
-	info->vref = devm_regulator_get(&pdev->dev, "vref");
+	info->vref = devm_regulator_get(dev, "vref");
 	if (IS_ERR(info->vref))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->vref),
+		return dev_err_probe(dev, PTR_ERR(info->vref),
 				     "failed to get regulator\n");
 
 	if (info->reset)
@@ -517,11 +515,9 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 
 	ret = regulator_enable(info->vref);
 	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to enable vref regulator\n");
+		return dev_err_probe(dev, ret, "failed to enable vref regulator\n");
 
-	ret = devm_add_action_or_reset(&pdev->dev,
-				       rockchip_saradc_regulator_disable, info);
+	ret = devm_add_action_or_reset(dev, rockchip_saradc_regulator_disable, info);
 	if (ret)
 		return ret;
 
@@ -531,14 +527,13 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 
 	info->uv_vref = ret;
 
-	info->pclk = devm_clk_get_enabled(&pdev->dev, "apb_pclk");
+	info->pclk = devm_clk_get_enabled(dev, "apb_pclk");
 	if (IS_ERR(info->pclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->pclk),
-				     "failed to get pclk\n");
+		return dev_err_probe(dev, PTR_ERR(info->pclk), "failed to get pclk\n");
 
-	info->clk = devm_clk_get_enabled(&pdev->dev, "saradc");
+	info->clk = devm_clk_get_enabled(dev, "saradc");
 	if (IS_ERR(info->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->clk),
+		return dev_err_probe(dev, PTR_ERR(info->clk),
 				     "failed to get adc clock\n");
 	/*
 	 * Use a default value for the converter clock.
@@ -546,18 +541,17 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 	 */
 	ret = clk_set_rate(info->clk, info->data->clk_rate);
 	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to set adc clk rate\n");
+		return dev_err_probe(dev, ret, "failed to set adc clk rate\n");
 
 	platform_set_drvdata(pdev, indio_dev);
 
-	indio_dev->name = dev_name(&pdev->dev);
+	indio_dev->name = dev_name(dev);
 	indio_dev->info = &rockchip_saradc_iio_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
 	indio_dev->channels = info->data->channels;
 	indio_dev->num_channels = info->data->num_channels;
-	ret = devm_iio_triggered_buffer_setup(&indio_dev->dev, indio_dev, NULL,
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
 					      rockchip_saradc_trigger_handler,
 					      NULL);
 	if (ret)
@@ -568,7 +562,7 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(&pdev->dev,
+	ret = devm_add_action_or_reset(dev,
 				       rockchip_saradc_regulator_unreg_notifier,
 				       info);
 	if (ret)
@@ -576,7 +570,7 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 
 	mutex_init(&info->lock);
 
-	return devm_iio_device_register(&pdev->dev, indio_dev);
+	return devm_iio_device_register(dev, indio_dev);
 }
 
 static int rockchip_saradc_suspend(struct device *dev)
-- 
2.51.0

