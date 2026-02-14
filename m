Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B020C2E285C
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 18:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771093207; cv=none; b=i4UV5T/+p5bqkUQXtFT4OT5h9xxsuTLwZCSpAGr1aNeI5PcHeLWrMkbYUtxXq7bG3j9Ssdz7xtk+yiKOoHwjGI7lv/gfYuushPjKP84PX/+ukeoAYeloAFSSoiMNEMY3XiFV6kNGGd8rd7tZmuJdqmu2aKDM5cNHAEsi9OHIL8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771093207; c=relaxed/simple;
	bh=kn5V7b3COcuwYHlqKgJPX/LLOq0wc1sfglnkMH3EOts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WP375GM0eOm0rls1QgjsmYhyPEy3uGZK/J9p4wTiZPvf95wAAso3zTrihcxXY5PkxP60NPng6DDF8LKbqPCMNBrFXgU5UTJf/UDdlBEQDlWxLi2JsGpMrciV43xqE8gyUdJu9mgbvgcSwRqcFd5y3xOfz0LJlS083zyPKfxk6Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nak+0a3C; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nak+0a3C"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a91215c158so11082645ad.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 10:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093206; x=1771698006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9mMRm9Rf8IRm6thRLVnHSRFul8AYpRyy4igzBQWHAs=;
        b=Nak+0a3CiZK611zbMOYsxjbkJXqPY+alovtFqv+4yhj0auijZqk+HAqWtWZGXxaA9D
         KtlakTyjNEKJcQU5l52zxbxUulT478FQUtq+zMB8MxWWpPaypLgq9ru7jvHrM+4DA0Sh
         ZvBaHdcz/vpdvj1D6xvv04tMSRAH5da6D/7atfqU3Kg3suz1nksDiByw2SYSZu2nF/EN
         LWI1QOAhllQ7rLa80lfef4in08RyRQBUEgIsjHoh/LrOeoV//14t+dDW0x92mXvzTeT4
         MbusSGjCNmQzq+Bjki9megfV8tExODQ8apvlR/ltJxs5wjJpQ22Bhk1EDzVdkIhAId1E
         Ccmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093206; x=1771698006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9mMRm9Rf8IRm6thRLVnHSRFul8AYpRyy4igzBQWHAs=;
        b=g0hCBx199z9qajizIAQPYixYuBgUL0b4KR7tgizfBlVb0vnx/9nlQkdoJ6b9S2oigK
         tA+moMzih2OlFRUu6jgfQMUxQ4lUwzTobJhwwAR0dxmIvhKv/1O4qxwe7CmQHXCIM63n
         ZhDJWK+QgBPQEkK4FTM84jHr8eSapIrEonieUv58CiAuuxIaAP9M6ysRHOfizcDzwjRH
         mukkgKQGnxtU5/S/3jcwlNt6UvoReEJH5pd0aJco56tGvf7TljUE4MnQKGkIqQOJzPWO
         zaFb6z1xmokc4ZJ7uCesBxxes+DFIr+NaHXXAg+yLl/cEwq3LYHO4LPzQ/yzfsb4P3Li
         8dAg==
X-Forwarded-Encrypted: i=1; AJvYcCXDS1pxfqv2wzr+pl9KZnbmG0Wz9AVeejF2LXh4x5f9109d37tzAuDDqnMr31oc4zgSDXXG1E3cgK/P5UrvREyhxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfD2/zZIwny9YcBsZY5zMeQZqiRfsLG+GXM/+HXZGH3N65/SDE
	C03j2xdbK5VGe1NPsmeDfJ8/BkwGKqNyOP0MeW9ZIga/rQF/7cR5f+D8
X-Gm-Gg: AZuq6aIlmPFbjGBSGtR/Qv/u+0oAWFh2IxcLAN4tW4ZGQhuHjcOpC+uHrduEAOx69ft
	sZP2dNdheiulg+jhb4tgPzwGZ82pn+G/UwujR/wErMcP69pVJqA+nfrHK92+w0mBLEMrSgHW61d
	VORNdw5gLy/fwi1xEiBcpvZnXDUKRPF5vWZj6UeR+bPirUGU+r153WS6WGZ5jzvNyL3bCXsEyRB
	VSoarY56WWSThjLcYX2q0ie9Anw/ToIic0OkIiEI1w88YSPioZT1utJgeJZTv1LUFFHTdWVVwAg
	Ul7GvhY6I+gxbrfMFUT8S+XaYU3zYJlwL17HuzUfli+iYePAA8XU4D2Cfr5LlL/g4yoKDiyBZ1q
	ST83bHH6e4XGDO5IeLRjJkpLVK2oV8weBXl4jz3MXR+s+ITycICShywjCepi8vMrnsjSI+r3iBx
	mb9KccktYJza4JCdNmCUE=
X-Received: by 2002:a17:903:1b43:b0:2a0:9fc8:a98b with SMTP id d9443c01a7336-2ab505d91ccmr68367655ad.40.1771093206154;
        Sat, 14 Feb 2026 10:20:06 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:20:05 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v8 4/9] thermal/drivers/exynos: Fixed the efuse min max value for exynos5422
Date: Sat, 14 Feb 2026 23:49:01 +0530
Message-ID: <20260214181930.238981-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214181930.238981-1-linux.amoon@gmail.com>
References: <20260214181930.238981-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per Exynos5422 user manual e-Fuse range min~max range is 16~76.
if e-Fuse value is out of this range, then thermal sensor may not
sense thermal data properly. Additionally, refactors the efuse
initialization logic in exynos_map_dt_data() by replacing nested
if-else blocks with a switch statement for better readability
and maintainability. Ensures correct efuse setup based on SoC type.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v8: None
v7: drop the Rb Llukasz, as we dropped the nested switch to set efuse.
v6: Add Rb Lukasz and fix typo in subject
v5: None
V4: None
---
 drivers/thermal/samsung/exynos_tmu.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 5f017a78f437..3d12e95703bf 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -884,6 +884,22 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 	case SOC_ARCH_EXYNOS4412:
 	case SOC_ARCH_EXYNOS5250:
 	case SOC_ARCH_EXYNOS5260:
+		data->tmu_set_low_temp = exynos4412_tmu_set_low_temp;
+		data->tmu_set_high_temp = exynos4412_tmu_set_high_temp;
+		data->tmu_disable_low = exynos4412_tmu_disable_low;
+		data->tmu_disable_high = exynos4210_tmu_disable_high;
+		data->tmu_set_crit_temp = exynos4412_tmu_set_crit_temp;
+		data->tmu_initialize = exynos4412_tmu_initialize;
+		data->tmu_control = exynos4210_tmu_control;
+		data->tmu_read = exynos4412_tmu_read;
+		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
+		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->gain = 8;
+		data->reference_voltage = 16;
+		data->efuse_value = 55;
+		data->min_efuse_value = 0;
+		data->max_efuse_value = 100;
+		break;
 	case SOC_ARCH_EXYNOS5420:
 	case SOC_ARCH_EXYNOS5420_TRIMINFO:
 		data->tmu_set_low_temp = exynos4412_tmu_set_low_temp;
@@ -899,12 +915,8 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->gain = 8;
 		data->reference_voltage = 16;
 		data->efuse_value = 55;
-		if (data->soc != SOC_ARCH_EXYNOS5420 &&
-		    data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
-			data->min_efuse_value = 40;
-		else
-			data->min_efuse_value = 0;
-		data->max_efuse_value = 100;
+		data->min_efuse_value = 16;
+		data->max_efuse_value = 76;
 		break;
 	case SOC_ARCH_EXYNOS5433:
 		data->tmu_set_low_temp = exynos5433_tmu_set_low_temp;
-- 
2.50.1

