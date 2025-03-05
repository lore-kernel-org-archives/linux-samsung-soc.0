Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB2B24EF74
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Mar 2025 20:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741205041; cv=none; b=C7txDtPYfYBqJnYgOmX1wVabT3Tk+lhMhpg9XRiPJPa93w9TLZx95lLs6448eJ1QaDy7xTEH6Ic1SSB3STbFM1gbuQCzEQZkisDf03sJg8/yD/CiWFe/v+QalFJXk8TkGXwXnV6i7mzOYiwccGGjK+gh/pQBBARvbj3EpVyGybI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741205041; c=relaxed/simple;
	bh=VXqz5QFrGEcscnxHniVpDxoYFwWeMkCf1TUwN7Veayo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kho+Cw0M+5fLXsi7dCRqAIbhiCKZsQ82QqJ5OrCZSJmJXZzTaHyho5Pie1NRZfat31t8DgL8oUykRMWnbn8NGuAEUZqB6mp8gndnYjXVG7cwJsf0z2BMlVQMth/zeLqCRBT7EdqWSXAlKsNj+MolEFG0q6GkICbCiD29fr936TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PrG99/bh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PrG99/bh"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43937d315abso7731155e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2025 12:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741205037; x=1741809837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=We29K0ajYvmu5froUNFlXp24ZLX44RiWqcq+t22bYdA=;
        b=PrG99/bhOP4OW4/xjNJ81LikoZnUZmkyLjJJ7X6U6dYt9kbqjJnBSBhAInxVDi3lp9
         s8qFhQLrR1ijP8iXjykLEaeFfzRBriH+oSczssUS3UUKb5lP0SAtxRAVqaNCypG3rMfJ
         Fhj2m0XiHqUnqoVWlTAXqXQn0lVvbOybGCj+K6iA238lzZt5dk1/LpT9qLs1CcmGuRaa
         r8KZSA+NCkMXEBYrdxAJ7hveDCcA3gaOR5g1cUyoJkvHls+oqAMsx9xnvop0Bd8B4fqb
         TvJSDzc5OfBejiO9GDi8koDSrsBr3f0u6TvrKwoBWUEx4ioawg+19FuI564NdJIAl/i0
         fGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741205037; x=1741809837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=We29K0ajYvmu5froUNFlXp24ZLX44RiWqcq+t22bYdA=;
        b=FGHjIJ9qTNOdDifIJqtXIqyOj6J3bdzS8S6GCV/P7f63tTMd6xblHrSjQxVO1U7BWd
         A3qrfx4WQ0Esb8n6hb1QlijhlAmnQLJlCRCgYkGs1bfNh3Ceopv+GVD580IaJ4ebY1Yl
         jh2KdWzGX8ZgNBokEOX19elL6I4hQ7RD/BkCa1BaIhHXrizvXUSt2ect5OcZPW8BTXTO
         TA9mYL8pE2pDjqhVF8K8GzO/HZ3yblkH54Vsnq0DXfiHrz7oSyV+B0XfcwmB8GV/ZvMr
         aTw5e/Bi/7lWP+BkZxn6ykA0TWPb+XTelUgqwP/B7b99KxOiTu84DePJ1ARKpWkxirDd
         ETfQ==
X-Gm-Message-State: AOJu0YyeLywBLsVs5oRBjEHZSJePnAotBDvhDXRiTZngsQYSh/uPXKzu
	/zlyyo9l+qX9SK3SmJttVPNrhUy9vreJPFddXCSwpbEeLcIbhGXRYjDraqt78aI=
X-Gm-Gg: ASbGncvmaZCsYjdTbkbmMWVShncni2FsUBmWnZBhv3hh3onjNSqFAJ9KeGZt8PbSSQK
	K8jvz/8OTFEB644E52zwXq0oy5ZWGRkK90ai92swAwySIB+erVP/lp7whbboeVwigTO1EVIlcix
	EAIw10KBZxS/SI4i2oAXqsUhy+imimFPLbX9o8mjVoMvolOuGrFVasS37chAswjgayjVuOiNoVs
	G/BgBLrQygMUvuRzP4pFYDfgnkkMDzdYaxdHfnN9XAj54OQhZbp4rj+j+zaoEQ0sPzb/XnGsB5f
	JO3qa/UpSChVXxHXv1lfYMrRivTdXRpxPuljQPcqr+Dk2YB3NDllMETE1+Q0
X-Google-Smtp-Source: AGHT+IGA75Q5dEam0rbFDZSqEbD+dlIFZjXkTmjXzVC6NKzn0tQNrNWqKLTLrzQRyuRMTvb5FKfx4Q==
X-Received: by 2002:a5d:6d8c:0:b0:38b:f3a4:4e15 with SMTP id ffacd0b85a97d-3911f740f7cmr1491891f8f.4.1741205037229;
        Wed, 05 Mar 2025 12:03:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b792asm21874027f8f.53.2025.03.05.12.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 12:03:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 21:03:43 +0100
Subject: [PATCH v2 1/2] clk: samsung: Add missing mod_devicetable.h header
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-headers-cleanup-v2-1-ea1ae8e9e2bf@linaro.org>
References: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
In-Reply-To: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11963;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VXqz5QFrGEcscnxHniVpDxoYFwWeMkCf1TUwN7Veayo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyK4iuXLV9cC9ySsBirhEibUL4/5Kce6223K1R
 g4gUvh3rj+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8iuIgAKCRDBN2bmhouD
 1zb7D/9Y0Z8iEVJKQV6O970j2w9sTa5smoL+GXxlBmD/DCYmPY/zVaDIVz288VsvTCiBBFnJ7WV
 zVWEcQkxcnUu2nKXv7jFF9/R8NuL7DGJZuPi9e1facFiqMspL8q11F1Q/X8E6+lPAXRgoI247ka
 l4uAqIiGMwDJx6ZiChqnNP7pS/VBknvrvQEULnaNv3NPug0rdb3O444DdI1QRzIvBxfGRlphfeY
 bVSROcCCs5Fl+x1SzgoAhIMQHpLZL47Tu/YGDkwfkz/nzD3M7sfRn3AhJp/44BhKjiXtFjXWtvx
 v6SBJxr/z1qlLSUXYQxBP+dUrUqxOH3CEMlRmh3A5+5wPFpycvPVpGGcr2/wqzCVpS07DMtsZFH
 /WkN6TJTK32GtYrtlqYc0joKehRWJyQilYR44MPyWdi9SzGwheEUJpidJhcZESk12asAXQRjTjU
 3OXOhJEO8IHuifsGoyESEZF80XRcJ769LqufvGkRMAGpPY3aCtKy38YRfGakNRNeLAqCWQp0irr
 N05RKqgdoVDNVJH1XzUngwsQI72yAeyHNs5np5cJ9r5p4Pve4Hy41Dvu9kbVdGoIUq2n3W1Q+LT
 IneN1iU1AQCEOXeMCZ2COzpbq7cbocWQLTsUw91Lgs0xUAuMX6RjyesW8vpTQ/5dgi9GotNU9RO
 mRmmiK4UFUqu1Nw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add an include for <mod_devicetable.h> in the drivers which use
of_device_id table to bring its declaration directly, not through some
other headers.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos-audss.c   | 1 +
 drivers/clk/samsung/clk-exynos-clkout.c  | 1 +
 drivers/clk/samsung/clk-exynos2200.c     | 1 +
 drivers/clk/samsung/clk-exynos3250.c     | 2 +-
 drivers/clk/samsung/clk-exynos4.c        | 1 +
 drivers/clk/samsung/clk-exynos4412-isp.c | 1 +
 drivers/clk/samsung/clk-exynos5-subcmu.c | 1 +
 drivers/clk/samsung/clk-exynos5250.c     | 1 +
 drivers/clk/samsung/clk-exynos5420.c     | 1 +
 drivers/clk/samsung/clk-exynos5433.c     | 1 +
 drivers/clk/samsung/clk-exynos7870.c     | 1 +
 drivers/clk/samsung/clk-exynos7885.c     | 1 +
 drivers/clk/samsung/clk-exynos850.c      | 1 +
 drivers/clk/samsung/clk-exynos8895.c     | 1 +
 drivers/clk/samsung/clk-exynos990.c      | 1 +
 drivers/clk/samsung/clk-exynosautov9.c   | 1 +
 drivers/clk/samsung/clk-exynosautov920.c | 1 +
 drivers/clk/samsung/clk-fsd.c            | 1 +
 drivers/clk/samsung/clk-gs101.c          | 1 +
 drivers/clk/samsung/clk-s5pv210-audss.c  | 1 +
 drivers/clk/samsung/clk.c                | 1 +
 drivers/clk/samsung/clk.h                | 1 +
 22 files changed, 22 insertions(+), 1 deletion(-)

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
diff --git a/drivers/clk/samsung/clk-exynos2200.c b/drivers/clk/samsung/clk-exynos2200.c
index 151bdb35a46c42d0b50f48d47974065a892bbb5f..c7ee0fb58fca52ed711b12f1b729a5b732ebb20b 100644
--- a/drivers/clk/samsung/clk-exynos2200.c
+++ b/drivers/clk/samsung/clk-exynos2200.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
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
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 16be0c53903cf43537d6f5496c106a41eae62838..be5882e5c160f42154cb4472bbe54eb986d91637 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 
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
diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.c b/drivers/clk/samsung/clk-exynos5-subcmu.c
index 37312984730136a5f7220d8586469582f837ae54..03bbde76e3ce73d551e30711d527df67ba0b4b87 100644
--- a/drivers/clk/samsung/clk-exynos5-subcmu.c
+++ b/drivers/clk/samsung/clk-exynos5-subcmu.c
@@ -5,6 +5,7 @@
 // Common Clock Framework support for Exynos5 power-domain dependent clocks
 
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
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
diff --git a/drivers/clk/samsung/clk-exynos7870.c b/drivers/clk/samsung/clk-exynos7870.c
index 2ec4a4e489be30bd1cd2e6deac006bb8ac5bdc57..c0c8dc4aae746034b9d822ea11812ba1341abaa7 100644
--- a/drivers/clk/samsung/clk-exynos7870.c
+++ b/drivers/clk/samsung/clk-exynos7870.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
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
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 8d440cf56bd45970929bd556b739194ed7b80ce3..1ec00b06fe9151eb367344025e236961fa9db04f 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -13,6 +13,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of_address.h>
 #include <linux/syscore_ops.h>
 
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index fb06caa71f0aedaa4cb8cb14907fdc71cf7f72e2..18660c1ac6f0106b17b9efc9c6b3cd62d46f7b82 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -11,6 +11,7 @@
 #define __SAMSUNG_CLK_H
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include "clk-pll.h"
 #include "clk-cpu.h"
 

-- 
2.43.0

