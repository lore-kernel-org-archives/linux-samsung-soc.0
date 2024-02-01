Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0BD1649D2
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Feb 2024 17:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706808152; cv=none; b=gse0tBhIooeHl9SkfGJ2UMwJ/d8f3vihkyhrNWSe0PcQKF7OqAqyGuELruyyRin9yavjFRGggSMUA5Qp4vt3As1DyODNQkiX+da6hfa+Wvf97vgoJrgneRtkn7PRDKMWsiUat6UGgBBj4S9h+Vk5jtfurhfjuuwC8uyx5petC7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706808152; c=relaxed/simple;
	bh=FZi8cuS5zbsSseMLtcLBjqBxbx1ip5hphT5FWZ6ecYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KKtyWGDMDJHrigZmZxVF1mBWSaKiHMo+gmgqupKmVrBGI7HGQDWfExZEYDLvjOaqPwC/lmkvesz39CZQmv+8NZYTywOl/7eO9zKkmjROlkf5vAPQJ5DOQ+EQjSVXxU3hNRjMtuNTNl/u6YpBBaf44hmy5mcC2CAs1Zkl3JrGYQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JovNpSjS; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JovNpSjS"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33b130f605eso715441f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Feb 2024 09:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706808148; x=1707412948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=655phT6p/xX4gabPq+CgbuzehrB6Qvw3RCd729athhY=;
        b=JovNpSjSeP7P82V7KZkXGFt1l+6umLQl3dX1Cn9/Diwi7oB+jrbIkx3i0r8cYLpcW9
         LLOetjUICVvNZqzhPWNhQ5y6qLZE3RN3TBbTo9/cH1P8J0GojE1xuEOgydIhS79VH+8q
         Bc9EGibEj+JVxL/nEUCeW8nJnTPQIskTBAxr7iyP5heZycfOiIoeBPnTOl1c331+YVCq
         GPip5p8AQDbYpDruAVod6flcYvnMqBrpZVboGITIBPpl8oODQRaDWYTbeoVt1kfe+4XR
         ejcISiBW1m51VUF0VEFzg9EVNeJDviV+nFfwhTf07kvZ/sKeephbMUyUse/lOqtTGfUK
         dOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706808148; x=1707412948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=655phT6p/xX4gabPq+CgbuzehrB6Qvw3RCd729athhY=;
        b=RLY4LXwOiLXtxjFlDqfJizDomCxGy25A15AyY+bkhRVFp+7c4fdCRycfkuHOAUS25P
         EF5s0TqEf81tH30tYKRGtL/5ftvKcaiFrPrJEyzkJyEk6w889op4C+Ws0G5iO1kXoxpw
         yneTRJzu5/YPcWeVwWZss+5uOwxLqf+Y8SJMQm2e+89PPR1X53Drg4yVyJz2FL3NVjFc
         QlBKsexAvee0pSCRH1vAs71k4LOLd2dpjvsSYeCatM4MBwmuHqULPSHxTMLNRBzpjJ28
         ByDhdmTRcwC2RCW36zz5xve60PTfKzX7XHFPTtzXwijuBG1XJENt7FCfeYXzVmbkRHHg
         bC/A==
X-Gm-Message-State: AOJu0YyDo4CYD/CbFt3WAwDVHdXRGfmZHQ5ORaYSStWEOigYeRaOs4CQ
	/yhi7vP4rv5OztkxCMbkjTEVbd77pxOdzCMB0DPyYZeovrPOK4mU4OjjYPLtqOM=
X-Google-Smtp-Source: AGHT+IFOsiz899UMNmir60Feb50FhEcxnYz80YcKYleMfajNk/aqDsleyVRR78NvhALhRngCdU0V3w==
X-Received: by 2002:adf:f590:0:b0:339:39ea:aaa3 with SMTP id f16-20020adff590000000b0033939eaaaa3mr4042470wro.54.1706808148176;
        Thu, 01 Feb 2024 09:22:28 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUdrtxBDnY1A3xcSW6aLqqdnaZ61n5bIgrQUbPZtoaim07Ow3vHyyZM7skGO5J14mICRMK8c/V12CHhtfZnPhvhARkbATId9ksintnLX7edGzdXf0n0m+hwRVJ+fABZYnzWuHcFrxVq6D5Okm72XGhVO4ZTJQuUWlnkY9V3I1q7kiEN/h+QNnUgzwUUUKrT26bAYd0qzSvFpYjcUCHAfE+3Nly0aL3OMbUAOlvnhZgc5Cl9AFH2cYyLIgvIEJFSYmxYNNGlTIwYfNy6dDtj2BFnIJDlHnovmzTDwoD55AwIgfi9GH92V1Ibn+IFZd3U8s9FEz7fpqAbR7z3RFrw0O1l5MweKVBCIC7443Hxw8diGijYa05UCV4QCliR0W1McSSdYdYlCdl6JX8hU/Yvrmz74jao1Dk/BEaiF4XGe9NNpnpedjpot8YAJqydMOO8P+ME/LbWMuQ3YS8b2wcmvEKS556Epq3q5Kfwt90HwTHiUjHBftpZq8dLMmYhWMwlTHjKZdrSBmTVbSDSlWsm51XYoaorqwsdI/jMTcuyTgRoopkLOGogGhm8bxqECVH4Dp4=
Received: from tux.Home ([2a02:c7c:7213:c700:e992:6869:474c:a63f])
        by smtp.gmail.com with ESMTPSA id f15-20020a056000036f00b00337d84efaf7sm16733582wrf.74.2024.02.01.09.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 09:22:27 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org,
	semen.protsenko@linaro.org,
	peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	klimov.linux@gmail.com,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	arnd@arndb.de
Subject: [PATCH 4/4] soc: samsung: exynos-chipid: fix revision calculation for gs101
Date: Thu,  1 Feb 2024 17:22:24 +0000
Message-ID: <20240201172224.574238-4-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201172224.574238-1-alexey.klimov@linaro.org>
References: <20240201172224.574238-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The main revision for gs101 SoC is not reported in the CHIPID_REV
register. The gs101 Product ID and revisions registers have a behaviour
split between old Exynos SoCs and new SoCs. The sub-revision is
reported in CHIPID_REV register in [19:16] bits but main revision
is still present in Product ID [7:0].

To construct soc_info->revision correctly for gs101 the main_rev
should not be reset from a value read from CHIPID_REV.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c       | 20 ++++++++++++++++----
 include/linux/soc/samsung/exynos-chipid.h |  1 +
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 7fee6094db12..3b952ffd8cf7 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -87,14 +87,26 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
 	soc_info->product_id = val & EXYNOS_MASK;
 
 	if (data->rev_reg != EXYNOS_CHIPID_REG_PRO_ID) {
-		ret = regmap_read(regmap, data->rev_reg, &val);
+		unsigned int val2;
+
+		ret = regmap_read(regmap, data->rev_reg, &val2);
 		if (ret < 0)
 			return ret;
+
+		if (data->main_rev_shift == 0)
+			main_rev = (val >> data->main_rev_shift)
+				   & EXYNOS_REV_PART_MASK_GS101;
+		else
+			main_rev = (val2 >> data->main_rev_shift)
+				   & EXYNOS_REV_PART_MASK;
+
+		sub_rev = (val2 >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
+	} else {
+		main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
+		sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
 	}
-	main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
-	sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
-	soc_info->revision = (main_rev << EXYNOS_REV_PART_SHIFT) | sub_rev;
 
+	soc_info->revision = (main_rev << EXYNOS_REV_PART_SHIFT) | sub_rev;
 	return 0;
 }
 
diff --git a/include/linux/soc/samsung/exynos-chipid.h b/include/linux/soc/samsung/exynos-chipid.h
index 62f0e2531068..1eb13068f513 100644
--- a/include/linux/soc/samsung/exynos-chipid.h
+++ b/include/linux/soc/samsung/exynos-chipid.h
@@ -10,6 +10,7 @@
 
 #define EXYNOS_CHIPID_REG_PRO_ID	0x00
 #define EXYNOS_REV_PART_MASK		0xf
+#define EXYNOS_REV_PART_MASK_GS101	0xff
 #define EXYNOS_REV_PART_SHIFT		4
 #define EXYNOS_MASK			0xfffff000
 
-- 
2.43.0

