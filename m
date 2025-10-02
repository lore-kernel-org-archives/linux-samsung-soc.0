Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FAC309F01
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Oct 2025 10:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759401182; cv=none; b=uWby0rf29euqSMXK2+e47Cq3xWlOKfHuTv7cI+1Y+hz8ZOPf09ymWbxE9sK+263ynx1MHeUuOYyrtoiIyn7aAXYo/vBFFF7q2Q8IcRO8Stnecj3968Ak27vVV85l1+o3P9fmEQhQrqsCiE/uGcn34SGN6ahb2vTSraXgjGNewvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759401182; c=relaxed/simple;
	bh=tPprOdfHzL3a17EiavBR2uOFxXJwStXq+kTCl82G4Ug=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ES+VYhic5dAPkYc8NxkINg66Hny2J/rrSIaZOHkHRdnrAGU4HkPmnTHgWgu8jgpOK/x1R7uHHyKK0N/l1MwsloWUHNipT4enXSMeQNN3/ggR0sly1mK6LGtcOpcetlmaGFXjJ0F8JamyqU9JnIKTbSMpdhgszcnhF88sUX+N/Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VrIHaL4w; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VrIHaL4w"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3e44f22f15so120942266b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Oct 2025 03:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759401179; x=1760005979; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7P+sGtXRhq0usSaYxPiIMynq3nyv26DuyfZTuxL8VWI=;
        b=VrIHaL4wk1CAhF9XIp8ydHhKWtvV2AsENwBTVmhU+gR60mTxm1asrudu7AxE56OqmW
         ZDASuNMb+nIKpyI8jwBP4/Je6NnYvj37taY8FqHSHnyLupVwCVYPM93uhY9qzmmnfjW8
         wrNAI4/D1bMeUoq6xI0I2MqBp57F2XHz0pTd9CWVbQbpTNTFpz5/5xcyGRjhz9wFK1Xr
         oFG97ePotM64Yh6G2h4IqF4HLe9ERTkeU+6rsePJOLiyYF5rXcC5KrBa/SVFL/akVzVZ
         r8E6Rwap8li7ZUO7njx6YowzjblFX317hhZKCe5UWlUg0sbqVt3kpcr6MrVyHCLZORi5
         xY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759401179; x=1760005979;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P+sGtXRhq0usSaYxPiIMynq3nyv26DuyfZTuxL8VWI=;
        b=dAivOpYxhnqjvNtCOEYYDM374EYO41Vyp8Hv7dDAldJkF8vdEs0LYb1vCWGNNT67Bd
         A39lvUXKkIrjlBwf/wOo8ZZICIZGrIt4P2QaxUZRtMh1h5XybzHI8wlO9AqzvDLTNVcv
         i75iupZc8vqBwHn/+vZYt7R0ppdpqQErrvhsTM0kcHHRapAiZ1t1Df7KoL89g48yofl3
         UNHO6GZkuBcvHtebEmiafb5Aj0ge6/sCwbt6AKEPcKpe16SBcLS1658JUcxjcbXBXuNO
         3j4HBhs9FcVF1FDH+c0iRILApPRa3Nv3gHYU6ZDP1YfnmX3uEdUoL7AykJosJPm9dbel
         NaIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5kKpHZsRioMBr+Su9AGG/3VFpEP0i1q9xRoybNmW2B9hfHscb0EYrK/QjAngsDx29nihM7Bo/oqo92kdsFslsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCvDd+2ayuGVwzUiVs5roDiqZiKg6PrizVNs0CpyJijG8nb+Wu
	REFRJFUGaeTE97uFLeaNh8I2Vhih2c7DC2JJnZ8vyj8q9qkODCwuEGvcgRcxnE36L/uDoRGm5TW
	2KJgg/F8=
X-Gm-Gg: ASbGnctIJJsfCK7iRyK6IFS25kvbfeb/ZT5iLA+sKHof++3aNsCs73ZSh6mT6UhX+PA
	C9QGOiYdhBJXHc9sIBgcIWW/ued/9bOYMTUXCMCY5ex+4jOIvqrQmty+uycQhWAUHqqEIU1ge5F
	kFk3MF/IbFSOPiCpsLUi6U47KzBlFmEBJEKGQeCnl+WDvvEp5K/l3bqSH1rHjmQTti8bPKJfAE7
	sHBQUY2r4Rw3CP/jEIoa1na+LzO8II7CrWX6KYG2QZQQV4kQHMnnuI24gv8b5RkC5zenL5Krj42
	553Nxb5y232XG+OivP4adY02npQaS0j9d2uPGEFtixF8GuEdMF3wmMvP4h3VoDyuiGZOKwTsbOu
	86bd+ohVB1n7AegGJnFtddmmgimBgzqFs5LGTubUH9fq2+EpZ3HpxMTqM/N/vgVi0wGuQxchQIP
	H6ImDuysGTYOG6RPDbXBJuQVcJ+TjTaGmu9P/UNvVk
X-Google-Smtp-Source: AGHT+IE55OaBBhFZS/spDOtLmb4PerdgYY5yS2Ckb/IGy29/YmfIffHAN0iEIq0aghfbW8MKNL/xbg==
X-Received: by 2002:a17:907:3d94:b0:b3f:f66b:268a with SMTP id a640c23a62f3a-b46e30e957amr846825566b.19.1759401179405;
        Thu, 02 Oct 2025 03:32:59 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4871167172sm170262566b.65.2025.10.02.03.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:32:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] soc: samsung: exynos-pmu: gs101: avoid SError for
 inaccessible registers
Date: Thu, 02 Oct 2025 11:32:56 +0100
Message-Id: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANhU3mgC/x2MSQqAMAwAvyI5G2grrl8RD1VjDbiURkUQ/27xM
 jCHmQeEApNAkzwQ6GLhfYui0wSG2W6OkMfoYJTJtVIanehIv54YyK3W42H7hQSr0hR2qKcqzwh
 i7QNNfP/ntnvfD35ip1hpAAAA
X-Change-ID: 20251001-gs101-pmu-regmap-tables-8726ac9f853e
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Accessing non-existent PMU registers causes an SError, halting the
system and rendering it unuseable.

For gs101, we can avoid that by creating the underlying PMU regmap with
the read- and writable register ranges in place, because on gs101 this
driver controls creation of the regmap.

This series updates the Exynos PMU driver and gs101 in particular to do
just that. For gs101 this is easy, as the exynos-pmu driver creates a
regmap and we can update the regmap config to pass in the registers.
For other SoCs it's not as straight forward, as syscon_node_to_regmap()
is used which doesn't allow passing a custom regmap config - those SoCs
are out of scope for this series.

With this in place, invalid registers (by drivers, or even plain
debugfs), are now simply skipped by regmap, leaving the system useable
in that case.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      soc: samsung: exynos-pmu: allow specifying read & write access tables for secure regmap
      soc: samsung: exynos-pmu: move some gs101 related code into new file
      soc: samsung: gs101-pmu: implement access tables for read and write

 MAINTAINERS                                 |   1 +
 drivers/soc/samsung/Makefile                |   3 +-
 drivers/soc/samsung/exynos-pmu.c            | 136 +--------
 drivers/soc/samsung/exynos-pmu.h            |  11 +
 drivers/soc/samsung/gs101-pmu.c             | 445 ++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h | 343 ++++++++++++++++++++-
 6 files changed, 797 insertions(+), 142 deletions(-)
---
base-commit: 5eb97efbe6a375944984e7fb69bb632d2879c841
change-id: 20251001-gs101-pmu-regmap-tables-8726ac9f853e

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

