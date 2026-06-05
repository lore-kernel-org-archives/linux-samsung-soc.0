Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C34B320CCC
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jun 2026 20:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780690750; cv=none; b=jE2DJzu7YKCzR6gJlKEibTS8DYBK4W5X12gGx80UCzVHU7tNRbOB444xbyoSmsE21o2t+uAjVi7YiZce+rb7eDq+8FX17jpFhdKnoTkyF27Nkzx1mLcKjz3veYDum04XEXCManEDKaFfSG4t+Hzw9tsyM5KM0O/e7NGaDEwbLnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780690750; c=relaxed/simple;
	bh=OoF9Xm4zEceiVun1U4P/sU/e+H8GRtR4qWLoIVDocR8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RnguzFs/ZnpGtY99Lmf2K0BPsuLKCf4jxaThB+JXyE6yztsRNE5bc69STAZo6/w9PnSKHl0D61RE+um/Mpfkzl5vQIaQm1GyX+WXzWf/0Iy2ems6KxDSTLz5axNjfQ5uwDP4XtHsdu7dIviUVGhQm4ugzm7ZiCQQbYITLmbg8c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X6OiBpFC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6OiBpFC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b915ded5so19218655e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Jun 2026 13:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780690748; x=1781295548; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LV2TWmv6e3Y0iXxtyydvRw2ubePqc7/64NdStyqTFkI=;
        b=X6OiBpFCrxJbjlJ03ze5J3NWppdVGJPXM2Q42Ph13oQBGQM9cn6lSHkocV/G8CMBSj
         ru1qdNZBg2Q/OObI2gGSRgyhzSaLRGz4lF1z83zBJjaJvwZd4/Zn/skQS5l4pRxtLtEg
         BD/tL6x9TtdpybmYIf2kKzml/xfGzyh2YP5qQvrb03zd06YydrnWewXYtjHcthGNcaDg
         0+7LmcUEqQ/j1VGNGihIdkXUzGP8yZBPCipqrIKQMf0dAKUvXmYRYpTf3obbCUHYJbAz
         cM2ukIjiYB8OPjJSHKdy3qnxy+YrnTrM3MVxm9rON2hqsfCHAkFci6gKBwz7kafJBgm1
         IFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780690748; x=1781295548;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LV2TWmv6e3Y0iXxtyydvRw2ubePqc7/64NdStyqTFkI=;
        b=ZjChtbDcQRfGZVexsP6DQOrfWEcbj/tOrrAeVL5s14leDO/7VAGAV8YXS81bC2FiGI
         tdRuBbdWtxFZoLoDmaIoklZEcLn9YrT1RKd9R96tps7bacupwIaa4UYBgRTGQ2n80+Kz
         +GZL6CDm2ay9shkk7B3gu3niuQrmaVHNZ1HFFFX9zsi0Km5xIAOYmHiwEvp6Z3/8Q3rT
         c1FkbJKXZ9vdbhHKz77bmjJBUAP/t03Iu8gV478QPbDajpiEG0mqaJpnC5/FNl75xyHe
         zF75Rl8920dL5mDvzX8xxFdMUMzaIlX/Ay/Gr2S6SOjQntbZxuxiRAgdoTYIphCpU6uI
         zJ2A==
X-Forwarded-Encrypted: i=1; AFNElJ+gL730jMLXNYbgX2LrntL1Zb03UulPUNViuu0pfBLF9kJo1BRgfO+jEeDQAhfhW+2m359bDU3jE3OgrhDMBzVvDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6OqGAqx1Oie5Ek7s+latSxRZiTax8eUkbCq4GpjW7uotUUJ4U
	Zbv7n1R1NVpsSEs6pjGWg3pBNi1OC2vUgPr+6tsYgP0zJkG+VEhbHQGo2AndEgZKsyk=
X-Gm-Gg: Acq92OFDfw3dO+nNfAQ4OmzXUw7egCH8ch5J7Jsq2sjS3HjzDTr3bmiluUuqGHTmnln
	FJm8nZrSBowAI+hr6IRhHsEInJir5Q7BySb1E221ONNnVw1bSjG0tCqecK2WIWu/5/DPk8xX0iV
	0dyPr2XQFwqH8NR6uH/DH5y3wjrgkatqSJSEE8tqRlk7Qri3BrsaG1nLgqDzGQ/fsq7wUXYfgBq
	CJb/fNIAqS4ygQzUxr8JiHbG2NUYMnFHaewi+qjVrx2i6Q6IknnqzTX3jRtEHYbA6HqaqSM7lc+
	ku1sWXkMSuWsBy+c9XF/dtXxtdHq6sc6vV/OtPff7qcND4jLBw8bJhm3A3P6kUDVQlF2POYYquo
	frV/vjja1rJixUxbXsICks2y+4FZIbBTua8Er6LElgWjv7hff0Gs5t5rTdgIRhw1xZMO0SOadYC
	+kJGabmVREdGnOJhKY6JwlQooT5/jKI8hfaFcZGIYeGgvMOoaHpyxKXY90uEip11tIwOLWokdGf
	cyBj04Y06ikkARWKp52k0HvOxA=
X-Received: by 2002:a05:600d:6444:20b0:490:5466:8591 with SMTP id 5b1f17b1804b1-490c26e1acbmr64974595e9.12.1780690747723;
        Fri, 05 Jun 2026 13:19:07 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413541sm190533895e9.14.2026.06.05.13.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 13:19:06 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/3] Exynos PMU fixes for cpu hotplug and cpuidle routines
Date: Fri, 05 Jun 2026 21:18:49 +0100
Message-Id: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACkvI2oC/x3MQQrCMBBG4auUWTsQI43Uq4gLSf+0A5qGDC2R0
 rs7dPn44O2kqAKlR7dTxSYqS7a4XjqK8ztPYBmtyTsfXHA9o/3yoly+K8eyzsX8A07SoHzzqcd
 4j0MYEtmhVJxgg+frOP7sYMawbQAAAA==
X-Change-ID: 20260605-exynos-pmu-cpuhp-idle-fixes-32f5ed7c969f
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3

This was reported by Sashiko here:
https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
and was mainly introduced by enabling cpu hotplug
support and cpuidle for gs101-based SoCs.

One patch removes strange usage of smp_processor_id() and
other patches deal with a few missing error paths issues
here and there in setup_cpuhp_and_cpuidle() and around.

Tested on gs101-raven device, I don't see any regressions
but testing from others will be appreciated.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (3):
      soc: samsung: exynos-pmu: use target cpu ID in hotplug callbacks
      soc: samsung: exynos-pmu: fix use-after-free of interrupt generator node
      soc: samsung: exynos-pmu: fix error paths in cpuhotplug/idle states setup

 drivers/soc/samsung/exynos-pmu.c | 75 ++++++++++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 15 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260605-exynos-pmu-cpuhp-idle-fixes-32f5ed7c969f

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

