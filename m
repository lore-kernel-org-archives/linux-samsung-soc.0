Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C1E16D4FB
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jul 2024 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720530013; cv=none; b=a0TlFxeVMvRPUcWd5FiEcyinSm/QVc2oBfvbS3WxshBWVbCOHn46bANAtl3r6P/WVPMraDIh6cluey9My6pzTGZimCk9yqzcQOrLBAy7i5cuPmShSoubyo7esgfEIv++aLkEB4w93VjZXWAWi8ZvSYOjOWUG5hzkdQlJfW126oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720530013; c=relaxed/simple;
	bh=eEyUFJCaslzrN09N4kRvWhSVle3ssZXjhx/9f1+ehYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EPxLwnCJmmYvSqCn209dCgpNCAamL6C9TsUJ7v6JOjMP54fB+0WjPob7eOWYzXigZ54DQWJKqr9Tf8dY9I7BTax5ukGsIgCefZY6drpLompQSHhiiucq9ZkETQbgX5L03DYVGJL+Bgz4iPs+9Gx7i/AM5S0xgRTuXtdjZrKdr1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yzT0ex5l; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yzT0ex5l"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab8cso7566851a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jul 2024 06:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720530010; x=1721134810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzW48j6krTR5s34wJWFukT+LbSymS5BDvSeAZWi+Wow=;
        b=yzT0ex5l5jYU4p0ISjLCNMKeSkluqRn1KsuT0wwIpDAnAHyXZux/7g2PH96dSjuvml
         xCXE5IETMjdpkjPN3gb+kI2JLNaU/7NTnh9Qpmy1biIjcJHFUTrlI2Vb6v+mbnLNRfvH
         SvDbDqnvxqTm5bhCFrz8gizgijFwih4sQuigAFcTM5FBJ06D3DeqZLRaQxFoPhW1NKlM
         i0T4xtNLrug0mZQrxR/QyT7JMtlKo2rZ2xrj9pBFeNT7G8ybyJCoeK56IO63pq+IGS9Y
         G0dTGZkiSvgQDdzBIwFgLjoNjBhLEtPC/loFWRcVyReNkpvqitDrObKo5R54Ccw4W8jr
         VArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720530010; x=1721134810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzW48j6krTR5s34wJWFukT+LbSymS5BDvSeAZWi+Wow=;
        b=CTx6n+WmqrsYTydwLaU5CMEGR2aTqoo4n2WCIpaHAXVAdYEXLBTEvv+6ij4m1UQgqT
         fHgw3h6FTIktRcuKMsL3MXKYiTuMJdSSREgUPzsP/MshqjM2bgg/vUurgZ8IULnkoVsx
         UgHa1fFnQ2TFJnVjqUAlbXE8FqJv9wczoHfEZFP/x34yzlQkshTv3s8Pl92dxw/OCqlr
         iL6XuG7LP0uvc/tj75uknI1wVhMftKmGhY8He1FL0Urd2T3QoeYCp9NFT+fpX6W20YWc
         IimjpmuOwM/Z0JU3DTGHKcDun2R7YhY7LOtsWt1qsEno595y2JKxOLSKDfnrOCU3syb5
         W58w==
X-Forwarded-Encrypted: i=1; AJvYcCXMJHacR4ybTcWgqgxsFsF0eN6TpmDWLHE3uyO3Wz56kp1dMrdpEcp1bCPQmWXJyY+i9KZDM7SRYQ2vRlh2YmiZ27ylu3BOIEJNNgBnVWGSvFM=
X-Gm-Message-State: AOJu0Yw/ClT9LKftrQDX/uKA8X035YCkZmThlJnUpbTC9y8GtYdr03Jl
	oQipLSLq8hf6lsUdZ8RtfUgD4YI1lZC3vhbl1miOwy33e2aY0nAWFXOhmSX5bgU=
X-Google-Smtp-Source: AGHT+IEyvSvNnHJBmTNmBE5q9+eXMI8HyGrB48FczNPHdOUgnUE83nanJw+lV2N8WjcrpE3hybyTnA==
X-Received: by 2002:a17:907:94cd:b0:a72:5470:1d6a with SMTP id a640c23a62f3a-a780b6fe30emr213764166b.35.1720530010047;
        Tue, 09 Jul 2024 06:00:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6e157bsm76643166b.80.2024.07.09.06.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 06:00:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 09 Jul 2024 14:59:39 +0200
Subject: [PATCH 09/12] thermal/drivers/qcom-spmi-adc-tm5: simplify with
 dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-thermal-probe-v1-9-241644e2b6e0@linaro.org>
References: <20240709-thermal-probe-v1-0-241644e2b6e0@linaro.org>
In-Reply-To: <20240709-thermal-probe-v1-0-241644e2b6e0@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=eEyUFJCaslzrN09N4kRvWhSVle3ssZXjhx/9f1+ehYc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjTREd4eRdUgv30y5FNovCfhnVFAgPvLqDNcgl
 e4yxTEx/amJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo00RAAKCRDBN2bmhouD
 1wCdEACRx5XDgh1Y9pfhZ3HXgDEYgiMW8sWIXMBOoTxJ888EhSoqP9Wb31sc+oK2ivwKgeONn+7
 ENo1u23SCzqi+NPsF2gmLh0H+e6wQg8HQbffNX5BGXsm98TorF70yCHoI8vAD9MRYbhh8tUCZI/
 FDnGKwfssMVnW0b/cYL2JCwBwU1R7r8JVCgwTNGUZ2P7l4bkZWMOV6aJ+DbBeMxFJC/vL/WsDbd
 Gr53rUwbjAsXkOXKBGq+ZI3wV8ee0JC8p5CQvdgDMQ69EHo+80XUQCd2E/PgfYiEdHN3PNCiIGy
 k4PdVonKSj+eI/ZXG1/FFupV6MKN8AztenXuhf4xomRf4j74RLRIbBw0wX8Pl3VDAtRvlXtSuXS
 eueUCVbGyP6XwpYjd0JA+JopzWo9AzHEJ83VvEjTjjkKMuaFb9pg9StEasNrDN8ACCyHD+STbK6
 TWjhLLG+4NSruNeKqXRtPfeTyTsOMI6urBECxP4Bztae9IjNDBzqJ/BIW1NAFf54CUyg67huw6z
 PkmHNbIKej5hjWe76ZLYr0kjK1XQjeXZ5Md3KDNzRf66+u8LbCLfNt/Lzred9OwqDmlQ3Us02Ld
 326H2F+SemCW2qb/OGh+Bi16D4ESFSgYGoaTnfF7hJNjlJldLLbrtev/oQ5ggk7UQSQhlNI2cIL
 4yGqRJoJoyeMV1A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Error handling in probe() can be a bit simpler with dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index 756ac6842ff9..7c9f4023babc 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -829,12 +829,9 @@ static int adc_tm5_get_dt_channel_data(struct adc_tm5_chip *adc_tm,
 
 	channel->iio = devm_fwnode_iio_channel_get_by_name(adc_tm->dev,
 							   of_fwnode_handle(node), NULL);
-	if (IS_ERR(channel->iio)) {
-		ret = PTR_ERR(channel->iio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "%s: error getting channel: %d\n", name, ret);
-		return ret;
-	}
+	if (IS_ERR(channel->iio))
+		return dev_err_probe(dev, PTR_ERR(channel->iio), "%s: error getting channel\n",
+				     name);
 
 	ret = of_property_read_u32_array(node, "qcom,pre-scaling", varr, 2);
 	if (!ret) {

-- 
2.43.0

