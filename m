Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA6205E01
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 13:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734354394; cv=none; b=FEEzWarqOQWzdFlMgi6+U93qn15ysEew03yd7Di/caj5OwhqHOnHiA6Knx+J4/Wa39i42a1pe2wU46SnSMMJWQNgrd5Bu/QpkHYmSisGIq/zOYkVfrJw/0N0DJSqVsoibHzx0/GJlLLzpelRtXJ/1vhs6RcxrxSK3hZw7ahMMXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734354394; c=relaxed/simple;
	bh=njXkzI6vI1ZYRHwJzVfbeDQKZfu2R961r5TrXKbUMso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxVyn5rzWt1Q341dW9tnNGjhZ0+GVzc66PM4WWYXtsPRLWHOvyrXtbAMOScg819KRRqyrjw1Pk15Z0xI/+00WpcvPAUoDmJA2ziqjdycf+tVQBrvNVPPmEmO6LEV1UzZXAT5iNvp9l/fPJIFZoOHtDyT5sW9Eg0mAr8OzRocI8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CSJcBO2a; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CSJcBO2a"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30034ad2ca3so34143341fa.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 05:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734354390; x=1734959190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jHSn691OHBL23f0kkrBermuRwglSVSSGPFSIcJ/qrU=;
        b=CSJcBO2aN13BbnuFiNhSOnc8qKNAw1+g8ug+cEa60lejkZ2sJCLKAMW7vzSpPaVUzc
         /HeEeWh60nAeoNnuCMdXGa5F4+HhArO8j9B3JNT4ycKTFZudGJ5CqfEDPJcM5dyhC9Cu
         NqB45PxnJnbdXu5qqmsXnZRjm/cnA/J4tiTD3k3siM2hZb7qgRWAgYAegq2ghk21o392
         XFMAyFkFjSx/Ij8EMSbdHXfIKEUxsSFRhRxeV87nnxw52VXsd5KMgk4v3l8dFu1P6YJq
         EelcOSww/bFYLb3feQOA0YHVcTB9CuTlzVTUA1f2b8IbOrfR0wT65JBDxaN1rKfZvZu5
         h2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734354390; x=1734959190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jHSn691OHBL23f0kkrBermuRwglSVSSGPFSIcJ/qrU=;
        b=na+hgSRFDSi5xMs2XpjpauV8ocJ+2FPWBzJUC7NRd2dk/DeOYMepkbs9DxL5DoX/xZ
         vseszA+JbvKm9mFeMtsI9tLJ+ioJCWymAYye99IkrSspFK5kPXEnuY3Ss8GfNf5yvfvr
         xgbRiHLQgw7eWTUFlW2PwQWNcH/WsddEfFOcGGqgDiHfr3M1SCo/6GXOs46/IkracFo2
         rTdirN0bounzVQ8EajkbRSo5/V8o0+Pztv0Z2Pz8HKfdu+ldP7WUcSFVLpFS+sjU3txn
         4wOSdj3loaGTJV4SNu6PRC20OQ8iOJTthi8PFnp19uhpBaBbylfMnPyhPXdR5CzXcoBx
         zoGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlcoXiVzqEY1ofcdTdWonnfFDHpWXPFJH7KbPOuYna4Qp9cfWHwYzhJJUWsejSY8nliwFWxatJyAzp6y8XTNkb2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUXcZZhkyTrakaf4PgZClwqAMK39O3UwA2R4bwFlzk6tY7HiND
	OOXln4Amph+Gf+ov81sSYPembQ14Ey3bBIqTgq1Z9hxdWCoQkzUXqRM7LvkSII4=
X-Gm-Gg: ASbGncvcL5fckkPmX0tASemUi9BYNqNke3KpT9JW+h7gwNtMcHRXbF4RatUvlZdkZs7
	pyTiakxHCS9zNR1XF4tBZAo8OAZS/Hn5sswlkWMpdjCX1AXpgbnjXoj7E415eUnYJDOxJHyJbwi
	0wTxksu2pXwksDBe8aC5yERZ6SOO0A8yeT2Yekb5SP0og34JJOZKFddNDaLEHpcO2Y3XJOAbemy
	hFTyFqVO9E/GUwR2mZuDcLuPC8OW3vrjEyl4WRRVOSxGVJl7QIBs4wX42ltqG1lZZzqZQKl4qup
	g0yvQqEP8XqNmThITj/rojHupC7z71eHLMvVT8LA
X-Google-Smtp-Source: AGHT+IHNVHPL9gCv6JsuwH0i+Iexhp279Myp4zBY3rnTq/iQAV9yBxFHBzZcKLky1N6tgEJkpPmDvg==
X-Received: by 2002:a2e:a58e:0:b0:300:ef4b:d820 with SMTP id 38308e7fff4ca-302544e3930mr46051511fa.38.1734354388504;
        Mon, 16 Dec 2024 05:06:28 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab960681dbsm326648666b.52.2024.12.16.05.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 05:06:28 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 16 Dec 2024 13:06:29 +0000
Subject: [PATCH 4/4] arm64: dts: exynos: gs101-raven: add new board file
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-gs101-simplefb-v1-4-8ccad1830281@linaro.org>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
In-Reply-To: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Raven is Google's code name for Pixel 6 Pro. Similar to Pixel 6
(Oriole), this is also based around its Tensor gs101 SoC.

For now, the relevant difference here is the display resolution:
1440 x 3120 instead of 1080 x 2400.

Create a new board file to reflect this difference.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: MAINTAINERS doesn't need updating, it covers this whole directory
---
 arch/arm64/boot/dts/exynos/google/Makefile        |  1 +
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts | 27 +++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot/dts/exynos/google/Makefile
index 0a6d5e1fe4ee..7385f82b03c9 100644
--- a/arch/arm64/boot/dts/exynos/google/Makefile
+++ b/arch/arm64/boot/dts/exynos/google/Makefile
@@ -2,3 +2,4 @@
 
 dtb-$(CONFIG_ARCH_EXYNOS) += \
 	gs101-oriole.dtb \
+	gs101-raven.dtb
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
new file mode 100644
index 000000000000..75fd34797fa9
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Raven Device Tree
+ *
+ * Copyright 2021-2023 Google LLC
+ * Copyright 2023-2024 Linaro Ltd
+ */
+
+/dts-v1/;
+
+#include "gs101-raviole.dtsi"
+
+/ {
+	model = "Raven";
+	compatible = "google,gs101-raven", "google,gs101";
+};
+
+&framebuffer0 {
+	reg = <0x0 0xfac00000 (1440 * 3120 * 4)>;
+	width = <1440>;
+	height = <3120>;
+	stride = <(1440 * 4)>;
+};
+
+&cont_splash_mem {
+	reg = <0x0 0xfac00000 (1440 * 3120 * 4)>;
+};

-- 
2.47.1.613.gc27f4b7a9f-goog

