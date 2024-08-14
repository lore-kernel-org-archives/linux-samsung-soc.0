Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66FF1B3F15
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2024 15:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647863; cv=none; b=JGyRVatzrLu4W1w5SsOnzw8KKAOPtFsfeht/8VDDfh414O2roRuBkjDFBMK4VVMnHP23uGH9Sr+TRyr6YEN03ywBP9ZPLRlB6/xMaUmQEc+8vO+UJjWFFfTFVaCflrqEixNKPf+EEmWFhfN/N8sfVsmBim9KRsxJ8l+ddgW2+Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647863; c=relaxed/simple;
	bh=rPSu/s1mk/65EmKeel3ZSXNy2qhadMl26zNDJ4MnfSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJnXaaoCD5/W2ZVLzhvLYxH0PSBLcAJkeCcSamAW0JVgnA23hRwzcDSdwzFuMVOjoCBw3PK3Nf3pl47BvK5LJxYmARDFI7SM7YPDC0alIU8Pa/sajqhfs41RKEEtPVjGyt885SyzIghqX1K+KXnd1F9PVVABfKS4XbP5ALGT1dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fsq7ttHb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fsq7ttHb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso51836775e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2024 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723647858; x=1724252658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3la53aoQx5CXNdnscGkAvwRAocgNTDTT4f12xEvMb4M=;
        b=fsq7ttHbHDp0Ny3Owogw4yYAyxCrcxeAxvjstUc+ysLUhhRiLKEPz7MtJkWj9E5xFg
         lIxv5/TaJ3HIlJE2JpPTVxuFoUHHfaIE2u/gF+fchqjIu3e2xT2o31uFtFIRkZE2iI58
         nhu7+lSr7CA6eMzwz5DoPszUIYpepvOUWEKi3LFQUIL9xIhq8G/b3kiFxFW0sWCp4UeM
         f9y5N1V1i4lwB+J3I272PtO+oMPMxkxZZiuij3YncOsolHdokU8mR/B/0xrALjVcjPZk
         M0bGRsQUQ056Tr4lZNVi4XwJN1EMYXoPKzIlPxwvPMOFBUHeRp6QryKnvafwhD6tDjO3
         CN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647858; x=1724252658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3la53aoQx5CXNdnscGkAvwRAocgNTDTT4f12xEvMb4M=;
        b=NaaVdt0QAaWA2gCcdKmwqHoDN8nudVW+1G32J/XzjEGnON7w+QKte8Nx3CmmRbsSxz
         TpNl2lUn0GrbzUuq/cXccgmO7G0aCX67zszLP27gPN6iBQh7ixS94IkmnRUx6HekkVDC
         few3HUS4hTmLS6U7ey34/AWtNMYzkUZL5XJHh4wDwydyT/BPuHjq0Zgk4j2nV8873i6c
         fSOgZgjaO34lMewP3oaH2Ax7sQjMWebXmZNCP3lYcmwu9mfJ+xXCerZTrSMzdPGGHw8v
         VtRZm1GYX/676MDiFUZk8bkZWrIBiQz4dmo1QZVGH3LFkEAXdH+KGYp86tO993sR1t1F
         +Ruw==
X-Forwarded-Encrypted: i=1; AJvYcCX4ZtAh4GKQe1aYQGU8U75a2EaLeiPGH+e4MvGUBIa2pZa9EiNCaxkQOWX/XdUtJGGN9aF9lZAzd5jqT4z8opqbbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYMCk4lZXAL+vWkeJEZ4Y1Zs3bK2KwbFqeGYGKRazli7uG27zO
	JkikAhOvfFjYtHEvIQqKSBZJpsURRK8ydRRf+IlERr9BXOnLzSJzzVszOeLNpIQ=
X-Google-Smtp-Source: AGHT+IEEcMUngaR/huI9xnvuAYfbKL2PYJIZ2I2Vju7agb/lAgnPLeyDFgJH4wZoy7E1fNPizlP13g==
X-Received: by 2002:a7b:c385:0:b0:429:d43e:db9e with SMTP id 5b1f17b1804b1-429dd26701dmr17332745e9.36.1723647858216;
        Wed, 14 Aug 2024 08:04:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7cfbasm22313425e9.45.2024.08.14.08.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 08:04:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 17:04:05 +0200
Subject: [PATCH 1/7] regulator: bd718x7: Use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cleanup-h-of-node-put-regulator-v1-1-87151088b883@linaro.org>
References: <20240814-cleanup-h-of-node-put-regulator-v1-0-87151088b883@linaro.org>
In-Reply-To: <20240814-cleanup-h-of-node-put-regulator-v1-0-87151088b883@linaro.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2068;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rPSu/s1mk/65EmKeel3ZSXNy2qhadMl26zNDJ4MnfSg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvMdnvE3Tn9NSxneESR03vM+B9CHmU3fn1L1iH
 fTFW0d70F2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrzHZwAKCRDBN2bmhouD
 19SiD/9H7/t31qMp/9HOygrF7TQy7/pnv8R03i/MYIwYR69rIis3AfXj8hHucOo68d8YkO+17HV
 lzkY17jjrFSogIb6rrYQiJEbm2DGsPSc7nEbwFLsxWSqESCQOYapjwnWRF+VcjVnOYKG6tP4v85
 PZ0W1q6Nj0eP09oMecGZkHAVwtni5yfEeu7gZT+rQoK5zB3TU/0gRq59NBPQxmQmrfcNalqPO0Y
 oSLOLXD9JAwPzOb5pxlUGOkuqWchnkoC1dbA9ntblSVJY1wm6EVmZ3plr3zJ1ezTE4jmBFQSphe
 YczAeSTvS2pYbEL+MPMx4cjMIghjAXsvafZxZ1xAdQH0vnJu7etHKfHwSDPdsm4rNokdQBeCOUn
 SupZ8PkQvlWpqMQgjYCY96Vbr5eo6MIj+ZzinZ7BxHA1EouaFtSGZhWFMG8f1gSPPlmyeu1h96L
 3dkF/K/Nuvw1W8hXOIGD3eyF4erBxHoB+Ox6ivagmni51cAFEifICvmOfjOtXUthc18OM8cAhTE
 7GjTNHLAnVqdS4mCrkGpvrqk8JGba3XyADO7uspHBoyzD944CtmUuj/OTTXiK6aXF3t46onz7KB
 1mV/+d6V9G+JxlBLfcmuCJ7D1Wd2+SMmcY/eC4jCfZ9WPH0iG24VBedhx1uSdVbmsoNapiDafhZ
 k7GXMyCKl5IZr9g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h and use scoped
for_each_child_of_node_scoped() to reduce error handling and make the
code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/bd718x7-regulator.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd718x7-regulator.c
index c3fb05dce40c..1bb048de3ecd 100644
--- a/drivers/regulator/bd718x7-regulator.c
+++ b/drivers/regulator/bd718x7-regulator.c
@@ -2,6 +2,7 @@
 // Copyright (C) 2018 ROHM Semiconductors
 // bd71837-regulator.c ROHM BD71837MWV/BD71847MWV regulator driver
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -1635,18 +1636,17 @@ static int get_special_regulators(struct device *dev,
 				  unsigned int num_reg_data, int *info)
 {
 	int ret;
-	struct device_node *np;
-	struct device_node *nproot = dev->of_node;
 	int uv;
 
 	*info = 0;
 
-	nproot = of_get_child_by_name(nproot, "regulators");
+	struct device_node *nproot __free(device_node) = of_get_child_by_name(dev->of_node,
+									      "regulators");
 	if (!nproot) {
 		dev_err(dev, "failed to find regulators node\n");
 		return -ENODEV;
 	}
-	for_each_child_of_node(nproot, np) {
+	for_each_child_of_node_scoped(nproot, np) {
 		if (of_property_read_bool(np, "rohm,no-regulator-enable-control"))
 			mark_hw_controlled(dev, np, reg_data, num_reg_data,
 					   info);
@@ -1656,22 +1656,15 @@ static int get_special_regulators(struct device *dev,
 			if (ret == -EINVAL)
 				continue;
 			else
-				goto err_out;
+				return ret;
 		}
 
 		ret = setup_feedback_loop(dev, np, reg_data, num_reg_data, uv);
 		if (ret)
-			goto err_out;
+			return ret;
 	}
 
-	of_node_put(nproot);
 	return 0;
-
-err_out:
-	of_node_put(np);
-	of_node_put(nproot);
-
-	return ret;
 }
 
 static int bd718xx_probe(struct platform_device *pdev)

-- 
2.43.0

