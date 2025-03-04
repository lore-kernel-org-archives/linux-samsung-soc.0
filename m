Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F266520459A
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 18:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741113949; cv=none; b=H60/Fk3jt8mIKlVsyIN5HMMLJ6rAU0GaTZN5AWKqHXBzuFpH8YnrBluZ1zpFVWcX0pUFrd8CXSvNXXdV9MPiRYB/O8tKATUrwiMqjPGNNZ4TjPhh487rPbsFb6Px3L31hkRts2XMZejf3BBASaalV3ykJw81KP7B2w8yk9XW+M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741113949; c=relaxed/simple;
	bh=Y0l6LF+cPZkGBff4XH+f4wgTySGbQrJV5Lf/9eDivjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lXeYE/94sj7eJyYNSwmVGJaly5T5sTPDIqvVTMXtneCG44qYrJLpeHbjUAiY0QqD9xfgwPBSL/owaoq2sF6FtxSE67ESC0F16cLZGWlJFwl0FhkTJbQV9lwjBwP1ELzrQ1MzKcUZes78PcVmB/lknnQLkS5Z2Evr5qhhvca/aFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wd0M9R3Q; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wd0M9R3Q"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43bbf0fb0d6so2611715e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2025 10:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741113945; x=1741718745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23fw9nd2WijxdvDPVP22O//GXKGD/eRJ6jlUzmtvfS0=;
        b=wd0M9R3QBbUnRglAmbIeGiI76ioTmLZdzFXgWqmTbEdnTHX5CP/x7H9LTCB9UvIrIT
         zWTGx1MYmHuT3w1N6vELJRapFsAD8Go6QQSMI15FETLn1ZmP7RuAUBd0MsthGGv+XFYq
         aOt+fd1QKO10Sq3yedy/dzrD7KYI+gNSyzswe+8bMdJeXLQOYTK9ZqJBGDwDOCTkEPkT
         EIa/iCm+1d1L8/YUYHhZ0ktXmyK7Kl/dF2XJWcZwTiORzxHmVqEJ2YV+T3JsheMnQyOo
         k/ZlNPmuAObLa76hpO3pH4egewWFeQ97eB0XUm8kULDIk2qt411p7XkbliZxlo+uK9S3
         sCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741113945; x=1741718745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23fw9nd2WijxdvDPVP22O//GXKGD/eRJ6jlUzmtvfS0=;
        b=QADscxHBokoDgAHiFNLCfhWxn8nuM6sAMVdGY2rFH68kwFtlY79+SmmOtslVl/IbFD
         CNzxaVB2d6eLqz5yW/tY10pLKoPF6X8+8wjUMT1xou5veJk1ibpgkqoUU7pJyTLD/6MZ
         eE7HNdUFfZ1o8Z6QXaSrrWZrozs2DmhxMl7MUsEymvZ/iIFKH+rZ3M1IhKTSu3So66DI
         qzjuyOFtC+98fcbdcNCVGHuyloPjI3Z5AdhDhSbOegrXwZuw/nGV3VyTD1sFzbJ2g2Wn
         kNwNSWL581xWQeSaueOOVYX710xaLIOU3FTz0Z99jAP4e30HaHkpOjJ7P5nQOnltviZd
         q6eA==
X-Gm-Message-State: AOJu0YwZI2DWJ+Ncd+HSyls6pG8Kwk8pw9fuTz6VJCweAKNdFRbdEWXF
	uYo2DzfH1C46sKEcmDEzgSJ8OwcpMUeJnn9jFB0lwNEzaHZFTS7uyocScWt3VSo=
X-Gm-Gg: ASbGncvpUwtgBXGNsfTSntzbRz+JAnxTDTpFWCsk4EVoLJft8Jq0NXsc3y4r49dgmZO
	Zbceg9nUvqZAFDacE599fDjfkO1VXbamqGPGzDLDAaVw/bmhp3xCDdca3tj96klbScvtoSCC1HN
	d7bU9CY8WqJLb5rF5wMlS6smXSVON9kwnEia0g4oWY72uHaL1PkPQJbWrPSwVxIjvAiqVf1edql
	LusZDUWfcmHUh1qlTCJMwwhilWpmNUz/DQj/U7DEz6KvcB+POXapsIJHQpDe0OoIs6FUFnbfCc2
	X8OQ2P9kigcdOAji4kuD3rUOT/5wNWqD9RaNPxpSfQdKyZLa5ClCz4C/Urzf
X-Google-Smtp-Source: AGHT+IEZBNrDOHIEWekGAJtSc/UGpK8YWJ/bFwbNk8fHje7TlkvZlpJFIsLNWuWturVh4W8L4OYIwA==
X-Received: by 2002:a05:600c:46c6:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-43bcb934956mr14692285e9.2.1741113945177;
        Tue, 04 Mar 2025 10:45:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6ceesm18229985f8f.45.2025.03.04.10.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 10:45:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 04 Mar 2025 19:45:31 +0100
Subject: [PATCH 1/2] clk: samsung: Add missing mod_devicetable.h header
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-clk-samsung-headers-cleanup-v1-1-81718e38246e@linaro.org>
References: <20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org>
In-Reply-To: <20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8836;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Y0l6LF+cPZkGBff4XH+f4wgTySGbQrJV5Lf/9eDivjo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnx0pSzzh5ohT9snnEM746NI1k5H9yYLWWjKWzK
 wfvoGmlS2aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8dKUgAKCRDBN2bmhouD
 17oZEACBSdNA+d7lPkrrmUb9SzAHhRp0EPOtIIgcv9QMzrhDdrHB5fLAx1nkstnb+Bdxt2sPtr0
 7iDHL8ayCmpXurxTyiesZA58uL/xrvTUcOr0aIWnj+KmaDsmnhf4csl0eLKqb5nt+6dJCU4//Qn
 5pMfOunXUDv0XvX0Xr+Jy5LfzvOlixxL4Rrc3qPuoYl5JUSa/tvKEwpkHaSd4F+BMMfhwmzhnyZ
 VRAxqReeNTjjV8ITwRGGca32Uv0Cu+0nowOSzFS6f06CmXNazg4XlsaH/2afLuxJCjF+ioQSdvv
 mCNcgedUAhGQOu6SQw0zjb+mNLAu0iOq2F7iyOFyYIloqnMnCD3vO/8u/tWohi/5tUImG9qJwJj
 0ZP/RIu27rDLAO/CyrunpNlWPi3INxcylJ/X6ge96sScGT87vfZhIAAAiEGvsj34rIUpNMj/9by
 HFrKYgDuyje6epr9o0XkVgpwjqx5f43pD7c7NjvbWrSjenC36t1+rTt/GHxbdBdHDFMm6JPOqy8
 UZX/jPk321k9EzQXHPToxaxKDkNxoZHGXYG3WQXYK/aJXOgxeLRA3veffUUx22EHPRTVifXglWy
 RCrHWcBZHKgQCEPMhN6U2hLQq+lNh4cXNk4+unwvE0bANxX4KsK+RQ6GAos6ZQkJpF+V6S/XfTL
 Fn5t3dKkcSr2brQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add an include for <mod_devicetable.h> in the drivers which use
of_device_id table to bring its declaration directly, not through some
other headers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos-audss.c   | 1 +
 drivers/clk/samsung/clk-exynos-clkout.c  | 1 +
 drivers/clk/samsung/clk-exynos3250.c     | 2 +-
 drivers/clk/samsung/clk-exynos4412-isp.c | 1 +
 drivers/clk/samsung/clk-exynos5250.c     | 1 +
 drivers/clk/samsung/clk-exynos5420.c     | 1 +
 drivers/clk/samsung/clk-exynos5433.c     | 1 +
 drivers/clk/samsung/clk-exynos7885.c     | 1 +
 drivers/clk/samsung/clk-exynos850.c      | 1 +
 drivers/clk/samsung/clk-exynos8895.c     | 1 +
 drivers/clk/samsung/clk-exynos990.c      | 1 +
 drivers/clk/samsung/clk-exynosautov9.c   | 1 +
 drivers/clk/samsung/clk-exynosautov920.c | 1 +
 drivers/clk/samsung/clk-fsd.c            | 1 +
 drivers/clk/samsung/clk-gs101.c          | 1 +
 drivers/clk/samsung/clk-s5pv210-audss.c  | 1 +
 16 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index e11ac67819ef26f04edfd4d1a26a5d9fde361aae..0f5ae3e8d000f9edddba4beb3c9a2e10d604c8a3 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 2ef5748c139b37ca5429b9071ee0e06f44fcf28e..5f1a4f5e2e594f8e858dd92634de2019bbcf1ee3 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index aec4d18c1f9ef93b62b718c85d731a6afd3e6b92..62ae5d845853e6fed2498cecb1151c8cf99bcae4 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -7,10 +7,10 @@
 
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
-
 #include <dt-bindings/clock/exynos3250.h>
 
 #include "clk.h"
diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index 29c5644f059379f8a0770ce2214c32b9df7d76e3..a6595b8d918b972208ba0b61d4c0d7f13bccaa3d 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 47e9ac2275ee356481f242ce59772f66daa32f14..e90d3a0848cbc24b2709c10795f6affcda404567 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/exynos5250.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 333c52fda17f69797d2defc36ad6293225d25e8a..a9df4e6db82fa7831d4e5c7210b0163d7d301ec1 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/exynos5420.h>
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/clk.h>
diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 609d31a7aa5247e6318884609d1e651001616b73..61e7e7ce1f60aba005018054aa2155455dece6bb 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
diff --git a/drivers/clk/samsung/clk-exynos7885.c b/drivers/clk/samsung/clk-exynos7885.c
index fc42251731edb6f8368d38638179056f8bc58335..79613affe8ab99d78cc677e688dbb03a2dc7cbb0 100644
--- a/drivers/clk/samsung/clk-exynos7885.c
+++ b/drivers/clk/samsung/clk-exynos7885.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index e00e213b1201c82ac0c70cfe23d5ccc9c04f2aa3..dfbb00312b03eea362f90149bfe36129a0d29285 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-exynos8895.c b/drivers/clk/samsung/clk-exynos8895.c
index 29ec0c4a863524fe3fc5c223d762da87e5f13013..66f9b735e3818cc993f1f61acaef4c38bf2a3285 100644
--- a/drivers/clk/samsung/clk-exynos8895.c
+++ b/drivers/clk/samsung/clk-exynos8895.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 76f22a4a4631fadf400420b977f3f59f40f840c7..2cb77a7c3e7830163e8337fd035b5fa426480be5 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -7,6 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 5971e680e566336ecdf55bdccacc3cea09a33201..1834751650df82a4a89a1a50de4c68d985a0cb60 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index 2a8bfd5d9abc8acced4e5a3eaacefe5fa724cbd2..f9b4e9f09bcd0e77ecf99e72273776454b302f31 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
index 9a6006c298c2a80da0e29aeca3b09cc827caac0c..079d3f4eda3f7acec84cc866b0ea7623104fa257 100644
--- a/drivers/clk/samsung/clk-fsd.c
+++ b/drivers/clk/samsung/clk-fsd.c
@@ -12,6 +12,7 @@
 #include <linux/clk-provider.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 86b39edba12276745a124df6a2ea9c22d74b915a..97a4ccc103f62199cfd7d0d8d4b38bd2e127bfc3 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/clk/samsung/clk-s5pv210-audss.c b/drivers/clk/samsung/clk-s5pv210-audss.c
index d19a3d9fd45239500c0f811aa27df86f832ea5c0..b1fd8fac3a4c0549f1143d02d11eeb95ee8967d3 100644
--- a/drivers/clk/samsung/clk-s5pv210-audss.c
+++ b/drivers/clk/samsung/clk-s5pv210-audss.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of_address.h>
 #include <linux/syscore_ops.h>
 #include <linux/init.h>

-- 
2.43.0

