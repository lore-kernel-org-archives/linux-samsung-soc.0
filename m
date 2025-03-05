Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB972561A1
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Mar 2025 20:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741205045; cv=none; b=NtqjoYW2vkTdjuzuMfe3OvT0399wMiP8StLruy6FAm5L1J7asu3hTBl9SKojZZAjTEk8zxhUBCwScxQ9ozJUpSzxFdVJaaCceXAgO4ShFAvg0bBgNTZQlcZ3ob1TiGpNlLLvAoh+y3bm6JZyPS5C1fKkan+KqrgInm8yYhjJ35o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741205045; c=relaxed/simple;
	bh=2g1OkBnfZbKGPLNo4YYRKOXwmTCLK/NxHJr0ibJ8jWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJZmcCms/CQJ1q27E5pTU4kF8gdeIbR0KWvATcSjkCeP4DpgPAp3S3GkvSczQgo4XrsheNNHBMLJdEFXxXWKRxwlg7h53PcqKhAfRh9sTbTD+ub6hlJZK00g/+bGNECulQ6L5jfa9J3wuQTXdnvG5tZlQODt/orOxH+FUnW2Dtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pLQoSc54; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pLQoSc54"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43bd750d27dso834235e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2025 12:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741205042; x=1741809842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3MgUbGEWphzLuO1KH/FYjLl6raNc7Bo6ONufLSewCc=;
        b=pLQoSc54cAb5KlR75Z0RYr7gkBEve/aNH4X2lKt7zzPKCIa1LofyZVHCLutztDgcx8
         VMXpMDReO7E7jWftnChWigR2l7j2rQdPCaDGhcQEleHRLqeogZb+bcdwnAQMaDyqXIwg
         /mSr4GgWMm9N9PX8oIyvJEXb9+KOrvx3CUkxZHoyOW4O4Pv8HGr9XLftrenwolTrupOS
         KgUZgyMVWCEDolLGzTmxHYscHaRQA1Rg5R7VBJzketjY8InJZJk5ETMaVd7Ugiu5AdJC
         HhuU0wpfOZwYTr2QAog2Xee4Gq2fv9Xe+mvQ85msS7RvcwsB+fdWA6KLmPG7HoLMHCXu
         A7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741205042; x=1741809842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3MgUbGEWphzLuO1KH/FYjLl6raNc7Bo6ONufLSewCc=;
        b=W0nTmbQbfFSqF1LKSPGrvLnPhu92BEEYABNFoDH0Ks6uc06qG46EaZgrw+cJRSYaQC
         dYY3VsLIzeEkTBJ57t0NYhpP6jsUODz1PqWn/1vap2uYuUIVBtcrd83bCxDOPMe0bfK0
         o7yrQZ3cS+3tyeNnyfhnE5mmzYedFeCp5JkhsHyaFvINW+btq7m28WD7IcgoxYYUNfsN
         +6CCoei3tTXWd7DlsfLhvuVG33Y85IJ/Qnwu3qzVz9YA3lJyHJIiQv55wZENxOLDO+6v
         GftVP2Rx6T6Jm5oTj70B+Z4ASJb6tnuMdSN5fFrdMwqmnijDspINyvm2yP8rEFavRUMV
         oFDw==
X-Gm-Message-State: AOJu0YwfUTKBqnbZA4sAkul5mizn1Nt626y9wl2E5Kh8GVt4q4Zi1PO2
	uhmnvBDx0nqj7pPBNpXU/x0TnA0WuF0EmZ6rk6qhWnTv9kwhuhlQd+WuHUIqE6E=
X-Gm-Gg: ASbGncsmBvk+mK+K3ysSfDLE3UFD6gJGFQEKHv4awcRcMJlluu4BDuw8u1MNfWclp/P
	53ZUnnomgh7ayBpXX/Rg/+oQyvrXSQimPizqmz5ZHlChjdpw5wgpyZNS9/UnYWxMsWzrnf6KYVa
	tOS7kH0zeHJNGVMH9prhEvc5qC9VXp05CgPd8bdUp6gTg8GYRRcqNy6SdlzTLKEUQ3g7NUro4x6
	TiqeiV7dgoomyhr0MMSMnP9nfBZtxQ8i2LDjDOafbW2CPd2wnWKyF1nrzWEtko0KyXOnWiN2VFb
	8du/kLytKV3tusitRzZBjgzfo2msOXxhzzcfxosg5vjSmOJO31KOAuppDQN7
X-Google-Smtp-Source: AGHT+IHGx6QP4vIYKl0XdRxXzlcL0E27pf6UfcuPtsTF+FnoZu+zxIZfaWZRjwGrTENDWAM8REFnYw==
X-Received: by 2002:a5d:59a4:0:b0:391:42f:7e83 with SMTP id ffacd0b85a97d-3911f7c17fdmr1308033f8f.13.1741205041638;
        Wed, 05 Mar 2025 12:04:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b792asm21874027f8f.53.2025.03.05.12.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 12:04:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 21:03:44 +0100
Subject: [PATCH v2 2/2] clk: samsung: Drop unused clk.h and of.h headers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-headers-cleanup-v2-2-ea1ae8e9e2bf@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11121;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2g1OkBnfZbKGPLNo4YYRKOXwmTCLK/NxHJr0ibJ8jWM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyK4j5wW2zO1NYFsFkd1skeQ8VtQNlrCT3Pf4k
 rpRgLb4X5+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8iuIwAKCRDBN2bmhouD
 1+Z0D/9rCmjJmJ2ib2+s5ncVueP5O98zT6ZkIVjrKPGIb20psOyTtLrmJaFRWmfE2kOUACzmIPF
 rWZxDG+lXA1n8LfD8TpKk2K34fy7TjqmPBF32vDJ3LA6CJYvRGQptyNDiWVMwJgt1/Op/PLE/jS
 zq+alblFLC6FRlssX3Lwq8aXE5aWb70HorDJWzoCjOheEkQWGhl4AAQq0wbJDksDn30pwCxmaTo
 HKzCc1+ZzAD/54CJ/vWx31xlYBrlp3oOpvuqDAq4bpKwR5AmDnGQ75UGgCi1QtWUuWhVYBwjmAa
 nz0Zcze0eIvc6UjIPDEVd26eqoYoRU1NIWb+SmVrz7R40spJN168rr414A00/54xSA7IYRuTLA6
 VKtOiMXJ+sRPX1iIexUbYR/winSisYDK5Kf5OsL9GtIsNnchdr8Hvz/Fy/lYWT6YD6zVpwbGJWa
 +ssfuOFo0mfig1rfYaPUvd8k6QzqTDEpD3IGPQ0bKige24fIjmCjDuJ4rQeoYck6QxSY5UIqlaj
 Nxat+NGdsR/u/aNdiCMSI/bO7QR6YU2nzrDdiosCWNF7i24EN/q5i2CPRrAlzRDgxSNTOlEyYY+
 SzIG6QFqZW81GIF7gs7z+B9qV0i8CfBVO5zksXVyTJqJPz5DD1KtG0DxvX65LBxxpxw4luVvryJ
 yFU3A7UtkxoxuFA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

<clk.h> header is for clock consumers, so drop its include from the
Samsung clock controller drivers which do not use the consumer API
(there are few which do, so leave it there).

Drop including of <of.h> and <of_address.h> headers for all drivers
which do not use anything from generic OF API or of_iomap().

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos2200.c     | 1 -
 drivers/clk/samsung/clk-exynos3250.c     | 2 --
 drivers/clk/samsung/clk-exynos4.c        | 1 -
 drivers/clk/samsung/clk-exynos4412-isp.c | 1 -
 drivers/clk/samsung/clk-exynos5260.c     | 3 ---
 drivers/clk/samsung/clk-exynos5410.c     | 2 --
 drivers/clk/samsung/clk-exynos5433.c     | 3 ---
 drivers/clk/samsung/clk-exynos7.c        | 1 -
 drivers/clk/samsung/clk-exynos7870.c     | 2 --
 drivers/clk/samsung/clk-exynos7885.c     | 1 -
 drivers/clk/samsung/clk-exynos850.c      | 1 -
 drivers/clk/samsung/clk-exynos8895.c     | 1 -
 drivers/clk/samsung/clk-exynos990.c      | 1 -
 drivers/clk/samsung/clk-exynosautov9.c   | 1 -
 drivers/clk/samsung/clk-exynosautov920.c | 1 -
 drivers/clk/samsung/clk-fsd.c            | 1 -
 drivers/clk/samsung/clk-gs101.c          | 1 -
 drivers/clk/samsung/clk-s3c64xx.c        | 1 -
 drivers/clk/samsung/clk-s5pv210.c        | 1 -
 drivers/clk/samsung/clk.c                | 1 -
 20 files changed, 27 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos2200.c b/drivers/clk/samsung/clk-exynos2200.c
index c7ee0fb58fca52ed711b12f1b729a5b732ebb20b..eab9f5eecfa3de742560591c0e122096bfae3bcf 100644
--- a/drivers/clk/samsung/clk-exynos2200.c
+++ b/drivers/clk/samsung/clk-exynos2200.c
@@ -6,7 +6,6 @@
  * Common Clock Framework support for Exynos2200 SoC.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index 62ae5d845853e6fed2498cecb1151c8cf99bcae4..84564ec4c8ecfa012743d3fa9826daeab4bb0f75 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -8,8 +8,6 @@
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <dt-bindings/clock/exynos3250.h>
 
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index be5882e5c160f42154cb4472bbe54eb986d91637..374c26e5d9fda631cc5360eb73b3de498249cc49 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -9,7 +9,6 @@
 
 #include <dt-bindings/clock/exynos4.h>
 #include <linux/slab.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index a6595b8d918b972208ba0b61d4c0d7f13bccaa3d..fa915057e109e0008ebe0b1b5d1652fd5804e82b 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -8,7 +8,6 @@
 
 #include <dt-bindings/clock/exynos4.h>
 #include <linux/slab.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
diff --git a/drivers/clk/samsung/clk-exynos5260.c b/drivers/clk/samsung/clk-exynos5260.c
index fd0520d204dc7e993b443fa1811c81f0a2e16a3f..0a59598233704b201ea97e907286f761152f54aa 100644
--- a/drivers/clk/samsung/clk-exynos5260.c
+++ b/drivers/clk/samsung/clk-exynos5260.c
@@ -6,9 +6,6 @@
  * Common Clock Framework support for Exynos5260 SoC.
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
-
 #include "clk-exynos5260.h"
 #include "clk.h"
 #include "clk-pll.h"
diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
index 99b1bb4539fd0f08da61814887af7a40da06b002..baa9988c7bb717cd87fa3c340062afa784985090 100644
--- a/drivers/clk/samsung/clk-exynos5410.c
+++ b/drivers/clk/samsung/clk-exynos5410.c
@@ -9,8 +9,6 @@
 #include <dt-bindings/clock/exynos5410.h>
 
 #include <linux/clk-provider.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/clk.h>
 
 #include "clk.h"
diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 61e7e7ce1f60aba005018054aa2155455dece6bb..4b2a861e7d573213e92666033893c44ae286b78a 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -6,11 +6,8 @@
  * Common Clock Framework support for Exynos5433 SoC.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index e6c938effa29bc067fa4cf864fe721cce37d9fda..fe0fa5bdbd4bca6921d07403637f93ba5c92208d 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -5,7 +5,6 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/of.h>
 
 #include "clk.h"
 #include <dt-bindings/clock/exynos7-clk.h>
diff --git a/drivers/clk/samsung/clk-exynos7870.c b/drivers/clk/samsung/clk-exynos7870.c
index c0c8dc4aae746034b9d822ea11812ba1341abaa7..b3bcf3a1d0b7b1f66263c7ce135e7be758c95d72 100644
--- a/drivers/clk/samsung/clk-exynos7870.c
+++ b/drivers/clk/samsung/clk-exynos7870.c
@@ -6,11 +6,9 @@
  * Common Clock Framework support for Exynos7870.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/clock/samsung,exynos7870-cmu.h>
diff --git a/drivers/clk/samsung/clk-exynos7885.c b/drivers/clk/samsung/clk-exynos7885.c
index 79613affe8ab99d78cc677e688dbb03a2dc7cbb0..ba7cf79bc300112d01cc0f81e1d74f65309707eb 100644
--- a/drivers/clk/samsung/clk-exynos7885.c
+++ b/drivers/clk/samsung/clk-exynos7885.c
@@ -6,7 +6,6 @@
  * Common Clock Framework support for Exynos7885 SoC.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index dfbb00312b03eea362f90149bfe36129a0d29285..cf7e08cca78e04e496703b565881bf64dcf979c8 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -6,7 +6,6 @@
  * Common Clock Framework support for Exynos850 SoC.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
diff --git a/drivers/clk/samsung/clk-exynos8895.c b/drivers/clk/samsung/clk-exynos8895.c
index 66f9b735e3818cc993f1f61acaef4c38bf2a3285..e6980a8f026fc33645e72a3bdfd3b5eb3a64fa84 100644
--- a/drivers/clk/samsung/clk-exynos8895.c
+++ b/drivers/clk/samsung/clk-exynos8895.c
@@ -6,7 +6,6 @@
  * Common Clock Framework support for Exynos8895 SoC.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 2cb77a7c3e7830163e8337fd035b5fa426480be5..8d3f193d2b4d4c2146d9b8b57d76605b88dc9bbb 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -5,7 +5,6 @@
  * Common Clock Framework support for Exynos990.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 1834751650df82a4a89a1a50de4c68d985a0cb60..e4d7c7b96aa89be3677890102dd68f514a28aa08 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -6,7 +6,6 @@
  * Common Clock Framework support for ExynosAuto V9 SoC.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index f9b4e9f09bcd0e77ecf99e72273776454b302f31..dc8d4240f6defc623cc2e075923556747c98a59d 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -6,7 +6,6 @@
  * Common Clock Framework support for ExynosAuto v920 SoC.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
index 079d3f4eda3f7acec84cc866b0ea7623104fa257..594931334574eba949af92095d2408f7a8f56933 100644
--- a/drivers/clk/samsung/clk-fsd.c
+++ b/drivers/clk/samsung/clk-fsd.c
@@ -8,7 +8,6 @@
  * Common Clock Framework support for FSD SoC.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 97a4ccc103f62199cfd7d0d8d4b38bd2e127bfc3..b58b8e1c272d594c2855a043cedcce5a3f293b84 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -6,7 +6,6 @@
  * Common Clock Framework support for GS101.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
index e2ec8fe32e392844a85c63d837f10d3331d646f4..397a057af5d1e704e7ead7ba04b477fdc28c45bf 100644
--- a/drivers/clk/samsung/clk-s3c64xx.c
+++ b/drivers/clk/samsung/clk-s3c64xx.c
@@ -8,7 +8,6 @@
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
 #include <linux/clk/samsung.h>
-#include <linux/of.h>
 #include <linux/of_address.h>
 
 #include <dt-bindings/clock/samsung,s3c64xx-clock.h>
diff --git a/drivers/clk/samsung/clk-s5pv210.c b/drivers/clk/samsung/clk-s5pv210.c
index cd85342e4ddbe28538d9f30e88c490089adc5e2c..9a4217cc1908aa60ebbe51b2b5c841138cc46ef3 100644
--- a/drivers/clk/samsung/clk-s5pv210.c
+++ b/drivers/clk/samsung/clk-s5pv210.c
@@ -9,7 +9,6 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/of.h>
 #include <linux/of_address.h>
 
 #include "clk.h"
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 1ec00b06fe9151eb367344025e236961fa9db04f..dbc9925ca8f46e951dfb5d391c0e744ca370abcc 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -10,7 +10,6 @@
 
 #include <linux/slab.h>
 #include <linux/clkdev.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>

-- 
2.43.0

