Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43434423A63
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 19:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489235; cv=none; b=nCIcW2RzB+w36cJ8U/quTZJlrpZmb1PA0ez/P+glNKuhGHBHl80XKDLPDR7Ac4kJ2tnh61+m1fFePtom4lNsVltJLRTcFcjoEgpL6jp2KbCIpVe2n+REQ9Cv+4cw4j02IpmAELK/GVJgo/0g9Z8w/zGeTtK5TLEGMuDWV+iqcS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489235; c=relaxed/simple;
	bh=gcPg21n+7REDjhleiyZxccUDctqNVYz8CCfBfgzqIGo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Npmc62eSumtfVQSESNLDt2uX1oHlc2RqomFj9oRyi1XSpVTomXQpYIe6jQrc8a5RBQ7X8KjzCvCRY+rV5BCGtnCx7hKn/t6o63dqP3gEOA+DzEeuxsx4I1MzqGR3RLfpLcD+Rdkb3UNhkhyfkCQrcj4rS3FmjU0yIJx4p1L4Kxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sij1a/Sh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sij1a/Sh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso1012505e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777489230; x=1778094030; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EeSG/sU57dwGrdaXnh7xf6O7BK0V9sIBOT8z7/4RP5o=;
        b=Sij1a/Sh0c7YITDCLtAb8A0pkcudvYgMGDetRq7U+crpWYYZ66iKl4bKJZ9MLiEEa5
         Y4DJwDRaFrI3xP3vJbuXzKAidducW2AkBEahJS/ySwxWChoET9s8y9eT6V7azFhVqHnz
         i6IpGZT1Pf1xR/VXTJ8l6OSbfiYSyAQOD67XJNH1QsWyqtpbilySkqKDvSupV4RuNeMt
         gsXGUJggPni1xPc8oDfljO5gp2VmoaYpFt5jy+jNSWLPREW8fueVFbJ2e0PtWCbSS/cn
         Ec9BoyV5Rq0MRzPcoHjpOmNnoqc4spRlEg8Z2QNMuDuEC3POnwQtMfzLL8HTYEOGb77a
         SoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489230; x=1778094030;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeSG/sU57dwGrdaXnh7xf6O7BK0V9sIBOT8z7/4RP5o=;
        b=JE9YniMKQyI0kXx1/avVPDJ7Sx8FmpzBboCTRTGKr4LVwxkBbA0UH3DL6gioQJXiay
         QCGRm+O23PvbHMVHL3+2WAVfilOq8QnORsdGrh//E8fy7a5+TvoDrsP0ZkHKdRHrsbYM
         PVIegd/XzbsJxuty95nUkJkHTI5vcNekObjnzYQ44HKBXMx9vmT72N6ze6SPFlK9ynDu
         bHesqJHYzsPqPbB5Z4lR7MR3KnTnUf78l9pgzduC8qUgK5l6HdAIy7QZOciAV8SQ/6cn
         CN4YFxX/JByr4FA8gOhDx2/F3O+eIwrb0xAQmP/SUmPVULMAFQrh2hzWUJ0Kl75YiGrg
         ux6A==
X-Forwarded-Encrypted: i=1; AFNElJ+U8DN7ZK5pHT8fuRvuL0JTksG1zv/OOEDYgviRzrlDg4Q21fdf84/GcqI1LVpCGJKAix3M3OHygyiaUdcVbgX6Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ZaFAFbhVWd3b6m9bTnKBZWjkdiowKcN73a7hZ7UAU4evXyh4
	nrFGUowwZqKY8LzLOanq5KsYAKH9JDf3pYqhXRCGfz+h5zSI0p9JvJs8DW/3nvXCu6d7+dlZfap
	zmbuLYFc=
X-Gm-Gg: AeBDievvyGGD0xErFQEfUTkCjiQcWMpGg2e5cr693owquaVaywNjveH+sCAHPbFEQGf
	HTHcFTo9FRwGuI5vFFQ2RY0kBsuEAlAr89FxIz7jQ050sEa3mE8ci/L1+ER9SRF/poXEAcO8Lnz
	uzGp9PFjGIBdalSHT/mtL9w2H85K/fn1/cRh66Qs9NLO2BF5u4bjMbeULuZUcl0Va3p7Ssf60kJ
	u2p6B6oMdiYT1s4+dWXntJ6PIEQOFT9hI7c+wpBpDW3rtFzliql6LmTohC7ITeVtySFBqvzNqX/
	TX7+bdYhO10ymKsKysFlgjrKfSXqUSRlmOchZTFxkCtLsPKgx5wpjf2dM34ZR8Hh0JrwVwVQlCE
	usnSFDRJHlRfvf1HBVmG667AQLLB7BZ95tAVO86haXkKo8HWulafj4HxkWghFUFLNfyGp1xHA/7
	5aw77gYH7pdnKnWkDLww8zoAUCBEpViJJlE+RpRZCPChatt5yC2BJx0YnLMUKQBHaL7F1K09o9r
	hHiaHGzhnJeHdCxNEuKS5VbmH0=
X-Received: by 2002:a05:600c:1f13:b0:48a:7772:c26b with SMTP id 5b1f17b1804b1-48a7b546cf4mr85601935e9.26.1777489228834;
        Wed, 29 Apr 2026 12:00:28 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b900b40sm26187785e9.2.2026.04.29.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:00:27 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 0/2] Exynos850 AP-to-APM mailbox support
Date: Wed, 29 Apr 2026 20:00:23 +0100
Message-Id: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEdV8mkC/43NQQ6DIBCF4asY1qVBUANd9R5NFwiMTqJgoDEa4
 92Lbppumi7/l8w3G0kuokvkVmwkuhkTBp9DXApieu07R9HmJpzxhgnOqFtWH5KsGdUT19NIR41
 DGxZqAJiRtlFSSZLPp+gAl5N+PHP3mF4hruenuTzWP9C5pIwqKVwrgKsGzH1Ar2O4htiRQ535R
 6oY/yHxLBldA1gApWz1Je37/gZAfZJrCwEAAA==
X-Change-ID: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

This patch series introduces support for the AP-to-APM mailbox on the 
Exynos850 SoC. This mailbox is required for communicating with the APM 
co-processor using ACPM.

The Exynos850 mailbox operates similarly to the existing gs101 
implementation, but the register offsets and IRQ mask bits differ. 
This series abstracts these differences into platform-specific data 
structures matched via the device tree.

Also, it requires APM-to-AP mailbox clock in CMU_APM block (which was
already merged). I also dropped clk-list emails from this series.

Will be appreciated if it can be tested on gs101 to make sure that I
didn't break anything.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v3:
- exynos850 dts change is split out to a separate patch;
- updated commit messages to a proper name AP-to-APM;
- added comment "ring the doorbell" right before generating an IRQ to APM;
- renamed regs callback names to intgr, intgr_shift, intmr, intmr_mask;
- Link to v2: https://lore.kernel.org/r/20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org

Changes in v2:
- dropped clock patches (they seem to be merged);
- patch 3: updated commit description mentioning that
  exynos850 is not compatible to gs101 mbox (as suggested by Krzysztof);
- fixed comment description for struct exynos_mbox_driver_data
  (reported by kernel test robot <lkp@intel.com>);
- Link to v1: https://lore.kernel.org/r/20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org

---
Alexey Klimov (2):
      dt-bindings: mailbox: google,gs101-mbox: Add samsung,exynos850-mbox
      mailbox: exynos: Add support for Exynos850 mailbox

 .../bindings/mailbox/google,gs101-mbox.yaml        |  4 +-
 drivers/mailbox/exynos-mailbox.c                   | 59 ++++++++++++++++++++--
 2 files changed, 59 insertions(+), 4 deletions(-)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

