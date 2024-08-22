Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD97613A86C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2024 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724343159; cv=none; b=OtOLWMZyOEeCwY7Tz9fH8H0Z8CPtDzpb9BonMxiiEAcQChcoqvxgjRpockUAcXhpRsqAEy8FLcHwG3FxBYRNwUbJA9ReeGH2tmMPOm/UijsBLQEBUX0smij1dsugV3+c6ZTIhNhrfudBxIPqTQceqz/vswLOpj863qaviAfRG9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724343159; c=relaxed/simple;
	bh=c1gKbOYbRzHTlTjYofXq013yxFh8Z6J3xYxBKfF4X/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OqZG+J+Fal2yd6lzC3AQRpYCpK3s9sreHnb58FtMyvlWBJKf5PzaOv+yLxZ+ulFHyD01wbS40afvHVoVrSKEiIrU+sztnRYifREtN6qNP7hMyplbi5moxzuAHRu6hzWK5ljhej7edSRTvglYo9tQ79+iGRN8mep1UBF2dhwUpMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IFASNPg9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IFASNPg9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4280921baa2so954565e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2024 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724343156; x=1724947956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GuBw39wlnHRTI9TYebBnuURf5TWTNnwWsEjzSneaKl8=;
        b=IFASNPg9tl+NccZjBpJ8rWmHRtUYGvCyeR/VIeWz98qemVabrL3XTqs0MsxSUPpbRr
         R2Cmp+cPQD1NB7/5uquONfNxxEqDYp7wwVPG77kU4hp98ckiZdqK1NSYcJ53bwA6JPj1
         1YOO6bhn+JRggnXrlrIv779icQB1/xQlGCetWZhjJ9Dcon3ax5uqfVR3UZFdyfV7rwhK
         tPgkPTDAfxs6zPBEwBXVyAg6uC39YksJTdK83hkCzAvB8n73jXtwDz3Su0YZTPu6OB7/
         KPs7m12cTuAf5fvNkxNtG+eK7LQHorx8SKnDVBCWo22jFKgS15IRFRG9gzI9OZhv120I
         73Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724343156; x=1724947956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuBw39wlnHRTI9TYebBnuURf5TWTNnwWsEjzSneaKl8=;
        b=MRnlgWS5I4+Y0WySygoWQEo44SM3Z8LtzXR+/mpxV/1DqEdjkWgHIU6iRZZWDLOwx9
         3pcMcZDcVDUHIdK0nWY9Mmy/9vAdIxi23s2PsVgYxtugILGXBVeoRktdflzVKNPzzmle
         +eZXy2ynGnKZen36vTkRRht6tduIIZMqUJHR6nCUOLHvai6l2lMwGPcSQiNSJIMDvJt1
         w+dam8r7QMwisniOVVT5IawF8EbshYW4SZZ14LxmtB5AwSP79B7Ln9XF8FKG0YaeI3cg
         igQ1OvbcTtmfRbSyT0t6ZwCPs69NWuEkchFHC2WyWouMxuzr6jIKtuI6K6TvtBfeb/FA
         vuHA==
X-Forwarded-Encrypted: i=1; AJvYcCVEd4FUYIfppYLW0/mNrTBxEV1+ipHS7uUiSknAzUjzlf22DqMqN8m1cCGiSxdW68ghzBpz5tb3URchDXNtTsXIvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzamvEcGOMd0EDnJqlSkFrUTiTZamu6gStOXuH9kG4UfSv71WdP
	GvbOK2hxc3U41RV8bbYC/tmkQsWkpyeR+nkkP1ZUrJyRVKqixmHaMxDVZr7HcfyicBfnBiwLKAn
	3
X-Google-Smtp-Source: AGHT+IGKOyeDuDZHhNDIA1lWvxFfjBUjQSWAwxTvr7WmMx3tids2QBG8IXMGVs7fHFeeHRIGcbcjtQ==
X-Received: by 2002:a05:6000:1788:b0:368:4c5:b69 with SMTP id ffacd0b85a97d-372fd936b75mr2149793f8f.10.1724343156190;
        Thu, 22 Aug 2024 09:12:36 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730810ff83sm2021507f8f.17.2024.08.22.09.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 09:12:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] regulator: s2mps11: use scoped memory allocation to simplify probe
Date: Thu, 22 Aug 2024 18:12:31 +0200
Message-ID: <20240822161231.106744-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate the memory with scoped/cleanup.h to reduce error handling (less
error paths) and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/s2mps11.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 570b61420f3a..7dcf92af8f15 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -4,6 +4,7 @@
 //              http://www.samsung.com
 
 #include <linux/bug.h>
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/slab.h>
@@ -1120,7 +1121,6 @@ static const struct regulator_desc s2mpu02_regulators[] = {
 static int s2mps11_pmic_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
-	struct of_regulator_match *rdata = NULL;
 	struct regulator_config config = { };
 	struct s2mps11_info *s2mps11;
 	unsigned int rdev_num = 0;
@@ -1170,7 +1170,8 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	if (!s2mps11->ext_control_gpiod)
 		return -ENOMEM;
 
-	rdata = kcalloc(rdev_num, sizeof(*rdata), GFP_KERNEL);
+	struct of_regulator_match *rdata __free(kfree) =
+		kcalloc(rdev_num, sizeof(*rdata), GFP_KERNEL);
 	if (!rdata)
 		return -ENOMEM;
 
@@ -1179,7 +1180,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 
 	ret = s2mps11_pmic_dt_parse(pdev, rdata, s2mps11, rdev_num);
 	if (ret)
-		goto out;
+		return ret;
 
 	platform_set_drvdata(pdev, s2mps11);
 
@@ -1201,10 +1202,9 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 		regulator = devm_regulator_register(&pdev->dev,
 						&regulators[i], &config);
 		if (IS_ERR(regulator)) {
-			ret = PTR_ERR(regulator);
 			dev_err(&pdev->dev, "regulator init failed for %d\n",
 				i);
-			goto out;
+			return PTR_ERR(regulator);
 		}
 
 		if (config.ena_gpiod) {
@@ -1214,15 +1214,12 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 				dev_err(&pdev->dev,
 						"failed to enable GPIO control over %s: %d\n",
 						regulator->desc->name, ret);
-				goto out;
+				return ret;
 			}
 		}
 	}
 
-out:
-	kfree(rdata);
-
-	return ret;
+	return 0;
 }
 
 static const struct platform_device_id s2mps11_pmic_id[] = {
-- 
2.43.0

