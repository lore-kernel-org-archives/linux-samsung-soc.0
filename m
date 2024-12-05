Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C7B19D07C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 10:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733394125; cv=none; b=DR2wTWrqSLSXJo0wAZ8pfMtHz8TIRCH1YzZuddkx08U8fciAekxHpq4k2Fmk4eJKlFfp3THz6DI33g9/5VhZHxGeu5rlzV0NrOCbE1Pp1gRfCvsaT8s9d5vvK/XavQQ2NaUtWesmfT9HJ3Ooaq6Kx+h3dsnRRkkeTJq1oqIUKU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733394125; c=relaxed/simple;
	bh=plXtOKz29GTft7oIa1xpVOqkG4eCLvwhQNSboWbCoo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fMV6oQE3P8InwiZRefUTYGb9b0S+WtjpiTbd0hSgQmQnfCMhGByB4ERjP6A/gU5nDERAu/rBoUfWmzIEw0JhBl55FpysX2j0hSJfLHzrmXTvAUHjlelOiOt1hUgNoNxEtv/+fR7qYSWGbsm9RvRwDmo5ISdJi8qKlFeS+LREgwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tarLBTty; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tarLBTty"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa628d7046eso71068266b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2024 02:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733394121; x=1733998921; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2qCz2oyAWXcySnvC/YTGdboyjGwCf8uvEh34M5NQ1w=;
        b=tarLBTtyIxG789Wi2HydCwg6vBxQtscctZ4kbdPpu4HrYKw4sgBRbA41gD4qHEObd4
         88a/ZCvSovQAiKsnOvOSPsw/ZbO714p45GXjNzJWWXYWN+A9ULxS8KGa3dJXhw3Zfdir
         S9F425i8sFvQwbHuUF5MsDC4SqZYT3ZgbJw/W9mS9W/OM8Qg3bzEV0fmjUUwroRbGn+N
         MS7o8gM3XdQs0QxR2q5UpL9uAgEbft9j8q6wWBjK9aRt/9J2Fd3TdJQYlhnwnRedluBh
         41YHOqOlIAPDWiT9k1NWRirADF6BXCUVX7nde1w8y719od33qhBMXjSp4QnSx92+2oja
         KvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733394121; x=1733998921;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2qCz2oyAWXcySnvC/YTGdboyjGwCf8uvEh34M5NQ1w=;
        b=uNkhRXgiFFl6kElxeg7hNiAZVryREHO21okJrg6whijTME2f2wrEWiywMVwPBRtn9M
         Qjk+VrVwknQeJal+IAG6dzO6yzWW4oB+mIW7/kKqBKdY6WbNFKd/4032C957SruxjiiW
         x1tW0N7yiKyid2ZfG97f0CzYuZVcjHsKkt0miDSHKT2EGVGdS4s2yhhfXmCp3vPliaFa
         wzauGv3MCTaEyfQAnMEhtgwj6L8rHkuklFuEQ1BhQT7NKkFXEZDJZ3872bGxHI7pf9oV
         rwsWrM0SGEhLgJWXDEwY2fcXDa6Fbv1YazdbXpsV3F/ZGePAJ1Hv7V0BUXzJVUvIStyW
         LjFA==
X-Forwarded-Encrypted: i=1; AJvYcCW/AStIWPyrMMEdqaFswv3iz0l6ycKUV0FeVGcYcbC3ITzqmhFknvhpi67UO+3w1irmAX//2ymqThp/w7+6LG5GZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6WXOH6SjNEfxQXztGwUdHxa878bu19hGcbnDHrR6zh01/+22A
	qyVQ+1NJd1Q1HyMUZE/nnQ/E7Gmif0loyhPT9v0iIYyOHj8MAPFSWnWh32/esQU=
X-Gm-Gg: ASbGncuXYB9bjTiDuq4Lp1cca/amhCjCol7kQJrDRkEMTFLsEW9K0bf9Sh0f/z/NENn
	NRk9FYuZkkGrsUTgcEUm23CS5ZG6xI6mr067RrosEdJM7nB1UAenfnWm3IhPeoF2yGQkfrj2aUW
	2wNqJFud+Ftex/3hdXfNBdV1uVPDszlsCJfJ654SCaDun/gWxqp7hFLEnq/vz+JF84kdV3zzz3u
	/k0+y36Je3RLxprJF4xdckupz1/4hJJp6HTpz7HxSRf4mO+Ne9pTNjN2dcFj3fgxYAm9dyU/j87
	d+5khJVtDP8syDhCjxjg1zPDRoK5bW1PYw==
X-Google-Smtp-Source: AGHT+IGIzS6w8nmzLwTehZGRCWLb5o+CLPa7VmxDEuLmOqo4b1mzG0cAAJu2wok4wnlPx8fiTWLtkA==
X-Received: by 2002:a17:906:3d31:b0:aa5:41b2:e23e with SMTP id a640c23a62f3a-aa5f7da9717mr766598566b.30.1733394120780;
        Thu, 05 Dec 2024 02:22:00 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62608f57fsm71606166b.146.2024.12.05.02.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 02:22:00 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Dec 2024 10:22:00 +0000
Subject: [PATCH v4] phy: exynos5-usbdrd: gs101: ensure power is gated to SS
 phy in phy_exit()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-gs101-usb-phy-fix-v4-1-0278809fb810@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMd+UWcC/x2MQQqAMAzAviI9W9iqA/Ur4mFq3XpRWVEU8e8Oj
 wkkDygnYYWueCDxKSrbmqEuC5iiXwOjzJmBDNWWjMOg1lg8dMQ93rjIhTQ513hvqpY85G5PnPX
 /7If3/QBAd16DYwAAAA==
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

We currently don't gate the power to the SS phy in phy_exit().

Shuffle the code slightly to ensure the power is gated to the SS phy as
well.

Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)")
CC: stable@vger.kernel.org # 6.11+
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v4:
- separate this patch out from original series
- Link to v3: https://lore.kernel.org/all/20241205-gs101-phy-lanes-orientation-phy-v3-5-32f721bed219@linaro.org/

Changes in v3:
- none
- Link to v2: https://lore.kernel.org/all/20241203-gs101-phy-lanes-orientation-phy-v2-5-40dcf1b7670d@linaro.org/

Changes in v2:
- add cc-stable and fixes tags to power gating patch (Krzysztof)
- Link to v1: https://lore.kernel.org/all/20241127-gs101-phy-lanes-orientation-phy-v1-6-1b7fce24960b@linaro.org/
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index c421b495eb0f..e4699d4e8075 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1296,14 +1296,17 @@ static int exynos5_usbdrd_gs101_phy_exit(struct phy *phy)
 	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
 	int ret;
 
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		ret = exynos850_usbdrd_phy_exit(phy);
+		if (ret)
+			return ret;
+	}
+
+	exynos5_usbdrd_phy_isol(inst, true);
+
 	if (inst->phy_cfg->id != EXYNOS5_DRDPHY_UTMI)
 		return 0;
 
-	ret = exynos850_usbdrd_phy_exit(phy);
-	if (ret)
-		return ret;
-
-	exynos5_usbdrd_phy_isol(inst, true);
 	return regulator_bulk_disable(phy_drd->drv_data->n_regulators,
 				      phy_drd->regulators);
 }

---
base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
change-id: 20241205-gs101-usb-phy-fix-2c558aa0392a

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

