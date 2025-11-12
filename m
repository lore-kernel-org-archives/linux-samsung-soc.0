Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DEB2FDC36
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 08:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762937327; cv=none; b=QqvLjykPcxBL87jwyDR4hKKVqch5jyse+hOomkYlG3+WDz3IWvlk0h4QyyxV7VEQ0QKuxwGRNq6A80sxtdF3Wp8t6F20jaUoV40GQxzE9gqtF7UV3TpaMBCU0K+o5S8beYXE3qRyOZzuwhHPbeWjD8czIF8N4pqY7u1oSsxFnes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762937327; c=relaxed/simple;
	bh=n57AkQX/19Tb7iHOH+H3uEtUeyVRBEzgRBixRLiXHFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q68+FwrYeJQWi8NsjL37ARB5IDYPmxVb/W3Rr+u61w43Aqts8PLJVYEj+eEFWhecs0KXpiQJYtZcIlJylll/egv8iNQ0j2l75ChDrhQDL+cXzW4xwZ6N5GBNUjq5ADBZMR5Wx0p9MJJppryAwaFCXCTKpQIgWjFYEEafV1QYvpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PFPGKxn5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PFPGKxn5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so3900525e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 00:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762937324; x=1763542124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHCwzReQ17B3LDkchxkIz3eblf2i0j4UnwMVHJlClGg=;
        b=PFPGKxn5zBt9prhjOxKgV6FPoSOd9VYvzVnAH2K4Cn0HVyBMCjEoUxzD2QwQoySfJn
         TKSYOIccp/l+yD7x/zH23sWWiUjVZhvMg64V9keL/vFxNAoQG5kclLa0tuqzcDiQTbmh
         UNg3GfnQc46GpXEU97QSvI0i7TxdLf1yVgVeFu8QkjGMUvKwS/QT3vb1xJYMnw8qZFv0
         ALiq1xtvQgSXmijkNIM7IqUrVsYWIkgHDbsGNiqTTJlQ1vaDAdYJYuNWEdyEL7H0cNnZ
         Ec/BbVboYCYtC6RPgxgYUaL6LCGkAvhRMBoVoLm18yyJ5U9AqDru9r8OuYVylmSbxrSL
         0Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937324; x=1763542124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YHCwzReQ17B3LDkchxkIz3eblf2i0j4UnwMVHJlClGg=;
        b=jTDdHtZySvRiaAICfvweHDUmE0Iy7k2IM7O7juWq5/BwaH00/4UIzT3agl0k2BxUz2
         WdP8CuxCREStQoZOe8EjNkiMEcHTXEYr77wvZ4SS/hrZNlvFzPvSe6iACLAV5fqtGA0U
         E+jGN33XLQ1JPzWjK/sQJgjP49WaplagjjgAk1eEHBs4Wa2f6LDt8pEKYHWf/WgwilcN
         zti9rjsXFR8M93FedjcFtkb06nc31ahSJcPiAehtkHsBgNAXvckDPezGVFSNF9tZ8K39
         YPBrh46i902Hl/xysFIXi0tZwjuUphXZIT7mPfDd91+XTvmHTA399deUH6sVlz2lpcUn
         6V6A==
X-Forwarded-Encrypted: i=1; AJvYcCUOxLyQhYZdQ/dyCygXT5My4znMsZ97325Pmb2mNdJ2A8eFjDFloq6ZvbFA0++8H1oHjvx4TV3YpRlRdBDli67fiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2tczl/HnzTl3AVGMAwGlDdZISrrtSZhZXDdctdrhZu37lmhF8
	anyBUNH99drgcHfBunRyXLEu5LcnWnwKyT46Eic3HV1EAMm9UmVF7l1ES4oGfW6ol9U=
X-Gm-Gg: ASbGnct0Z1lP1/qOkF2YAtXipDAEos9KwyljSLqjXGHZrLyEylsRx4HCLZqJJyCC8/H
	jly2HrUJLRPZwqPd2RY0lTEKGuYnv12KTKV+UJST5Fq/ymv5TS9DN+3Hy/zw/2xbWlMS4HJrrkd
	44uE7DniA/NlGZX8n0QUkSm85yWb6QDzFQ8dPYUu6hZ/kLkXOFtcIc+wVOq6P0HJLT6Y/07irao
	Gw/L/ZSBey1viME5u9VKv02Kj47TuqZqn0iAADHnM+qFu1j4xV08WcZhcz73LqUpXkK+TzmlAAx
	DhZPOir8c2g51PYIl05maE6rjP2ftT1GdYoyfGWykvFdRh5zRB7U0bsgDnyDkE5AOCNPj2ub/AY
	LFGKMj7edLJOkjQGCfbMZ25c2ecbxHtpySY1SfrBk2SpXvZudL8XOMM/shyC2cpDRiDOUJPFsUT
	W6KM1GCWiWJBTASjS9bfSULZH2HLC+bK/JzdpAdW9tb4NUJtwyWvjHTv7e
X-Google-Smtp-Source: AGHT+IER3DYH8U9sYwYLoN8VfKXngSp0sef0ZPfwedq+Ay/0zM7XddiA+Z2Mq/fUyg1ZnrUUB2uTBg==
X-Received: by 2002:a05:600c:35c9:b0:477:6373:f3eb with SMTP id 5b1f17b1804b1-477870a8b57mr21511475e9.31.1762937323522;
        Wed, 12 Nov 2025 00:48:43 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47789ffea1esm3732645e9.13.2025.11.12.00.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:48:43 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:48:23 +0000
Subject: [PATCH 4/4] soc: samsung: exynos-chipid: use devm action to
 unregister soc device
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-chipid-trivial-v1-4-ec2dea03bd83@linaro.org>
References: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
In-Reply-To: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762937318; l=2293;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=n57AkQX/19Tb7iHOH+H3uEtUeyVRBEzgRBixRLiXHFw=;
 b=bMyB0dF9A7s2TwSb6EVYiRGLCLForFlgHHMYDdy3K5A6G2Ioi2jiFOZ13zx6ejNWqrQuMYtg/
 v1Svk1Zmeo6DeqIub2Zm7ixB/YNYSXR4VxOo/yq1VXDQvkqPk2UcVcn
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Simplify the unwinding of the soc device by using a devm action.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index b5866a324d8ae911a5c99d0290328efdcc072dfd..d5b4d4f8d43da4c50d0e856e914550a9322725a1 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -14,6 +14,7 @@
 
 #include <linux/array_size.h>
 #include <linux/device.h>
+#include <linux/device/devres.h>
 #include <linux/errno.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -104,6 +105,11 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 	return 0;
 }
 
+static void exynos_chipid_unregister_soc(void *data)
+{
+	soc_device_unregister(data);
+}
+
 static int exynos_chipid_probe(struct platform_device *pdev)
 {
 	const struct exynos_chipid_variant *drv_data;
@@ -151,28 +157,19 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
-	ret = exynos_asv_init(dev, regmap);
+	ret = devm_add_action_or_reset(dev, exynos_chipid_unregister_soc,
+				       soc_dev);
 	if (ret)
-		goto err;
+		return dev_err_probe(dev, ret, "failed to add devm action\n");
 
-	platform_set_drvdata(pdev, soc_dev);
+	ret = exynos_asv_init(dev, regmap);
+	if (ret)
+		return ret;
 
 	dev_dbg(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
 		soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
 
 	return 0;
-
-err:
-	soc_device_unregister(soc_dev);
-
-	return ret;
-}
-
-static void exynos_chipid_remove(struct platform_device *pdev)
-{
-	struct soc_device *soc_dev = platform_get_drvdata(pdev);
-
-	soc_device_unregister(soc_dev);
 }
 
 static const struct exynos_chipid_variant exynos4210_chipid_drv_data = {
@@ -205,7 +202,6 @@ static struct platform_driver exynos_chipid_driver = {
 		.of_match_table = exynos_chipid_of_device_ids,
 	},
 	.probe = exynos_chipid_probe,
-	.remove = exynos_chipid_remove,
 };
 module_platform_driver(exynos_chipid_driver);
 

-- 
2.51.2.1041.gc1ab5b90ca-goog

