Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF7518BC26
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Mar 2025 20:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741293786; cv=none; b=n/TY1mQWj2g0TW4KhP8KtqeLd4fuN1SuUil2ohBcJl+fxN1eYUCbSlwdfujVqQ7QWrWwYDn2byduTurBkat2Bs6ZhijWVNCJ9QFgbkb+8zTumfJdWoEWzeQSldPzrCOt66+VI0RzA5uDriFy4rinmZMphgwN0Uro9e5/CMn48Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741293786; c=relaxed/simple;
	bh=3I8CBekQ5y/NxfRFNZcDsBWqJ6pOTtgFdlfo4wG1dyw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A5t7leMkG+eKZaExpOxiu38gLNf46bi5RxRhIHxXM2AwVKZcebVidZMJ63ySwybgTaLXzp+qSYoOIUwff4R0BVK4xMYZ65N2YmJtgxTy3qsZNPV36XhjKHLzYiwSxzKwO4MZYalevYQQPT97Gk1rq1GbwS5oH7JVGWmL/gI49WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hq/FEjdg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hq/FEjdg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso7105175e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Mar 2025 12:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741293782; x=1741898582; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4GimjoaXXladrZg38HxX+WEY/YSmPMUaXL9bgDFdsYs=;
        b=Hq/FEjdgnCAWesbkOC4IhhELsB0SHZoHhzLo7uX056AxRKqgNeC0VGmJjIl7RpeAKo
         xgX24Sy5zh0CFhZaGuNjFPDGZu4M08IIg8eQqyYNQeA8Bib3dhgoJ0ZluEfrsGEA6XBW
         Chm8GzrXpN8XpaNHSmtJCLhXUMlNDdGKoYZxmRmBE5ocsyTxuO8zqwi/XMaJTL7J/2Xh
         /yHbemj8Z/7WWUh/ZVb/jrFhj4o6uQ1e/4uKABaBvuosVOoayuAhFmNmE2H1sLk94/tq
         kLGBtpHOp1MR4VNLNWajM905FM+ol2P5vD+i/IyhhAETfqPGlE/QUDemXAq3cwAhWLHq
         Fv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741293782; x=1741898582;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GimjoaXXladrZg38HxX+WEY/YSmPMUaXL9bgDFdsYs=;
        b=upbylWhYma51QHyilu9RaSFtme2NNj7FVLzEJEw8bYKQkEPKFnZOVymBR9Bw7AhzuB
         Onb7RZthNb2g8h/7l0M8gRkZDbKnsxK3h+bP0E2eR6HMIXpWwNpxg9FhI2JxX+2w0ZNa
         6iPo6LVrVrDLVjlGulnAzLeDT3gci7n5n7Ncw0zJjxO9oKNRMFv8jOpelt6zuVbceYw5
         lEKHZCSAKspe62brrgVJvWiwgrvrxp2h/ec2+rmbLhNhec92tffs2zampZak79eg14OQ
         csiAGsgojfzdeyNrm/RGF3RnN5CwssIUXMKQlBPa8RVU9NtHUzccGanyGmiW9HDBR4Yp
         1viw==
X-Forwarded-Encrypted: i=1; AJvYcCVWe9XjOKPQlbvTo44X+dGwQxfKW5ORlIsmVMEYvPgsIJr9dpmMaal3gxeJh+AFnxFOpbkgN7nppKLAXJtmybK8HA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywssi88ckLpsXXRaZM4O6YfS2dxqyPqKeVfAO/ypz95I58oHgOK
	AicNIOdR1i+9hIypXZcBkjbXfcZPtf9gTOsFWUZ4tuePW0oUWC/5tKUnpMIDZY0=
X-Gm-Gg: ASbGnctmGEgQ+RPdkrIDVchdAbssK+M5FjzCL5egEZW9v0GHAmEjub5OLib1Hw0/qjV
	73+a53zCwW0fXUcf+TWTo17ttUKZtJIl2IM2FSmvkVKwEn1KDIug1QxrQLzaXhTjC24IvZyidom
	C0FQ1aQ5SfOCxXSBOFeDhorAH5Z7oorA5yzBXJYxQHRMfumPMIqu0SZMZadm2p62AzeZMIAJiGF
	1HiOHaWaM1x1zlDlBU7GPcYIgxxrKuXUvzN9VlUhgpOUbHlWIOKDs6n6AkxQ1jogi09oSBQ1sfV
	oM0YJmRbbULFHm/YlnzUyJNiyfFAck3XXOyPe77IwU2JnQwM0/D655dmbC1fOZ8Aij+17Ipoa+k
	=
X-Google-Smtp-Source: AGHT+IFFBM1ec0+y9QOjsWkRze+N/TMmKsFw2dds6E7/MII8+8XfXYdGTXLu56qK+wFv8awCozTznQ==
X-Received: by 2002:a05:600c:4450:b0:43b:d531:ca9a with SMTP id 5b1f17b1804b1-43c68702906mr6559645e9.31.1741293782422;
        Thu, 06 Mar 2025 12:43:02 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd9470e2sm30081715e9.33.2025.03.06.12.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 12:43:01 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 0/4] samsung: pinctrl: Add support for
 eint_fltcon_offset and filter selection on gs101
Date: Thu, 06 Mar 2025 20:42:34 +0000
Message-Id: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALoIymcC/4XNTQqDMBCG4atI1k3Jn6R25T1KF0kcdUASSWxoE
 e/e6KZ0Ubp8P5hnVpIgIiRyrVYSIWPC4EvIU0XcaPwAFLvSRDBRMy4YndG7JU60nxYXPE2PNIP
 vqJBSGi61U50i5XiO0OPzgG/30iOmJcTX8Sfzff1LZk4ZBa0bxqwwl1q1E3oTwznEgexmFh9HM
 v7TEcUxGqBvrFVK2i9n27Y3yVaqygUBAAA=
X-Change-ID: 20250120-pinctrl-fltcon-suspend-2333a137c4d4
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3165;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=3I8CBekQ5y/NxfRFNZcDsBWqJ6pOTtgFdlfo4wG1dyw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnygjO1FoQGjv5WeO6HKLDs5Z3pU7BeLco3mKZb
 JrQPhD83pGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8oIzgAKCRDO6LjWAjRy
 uh6CD/0e3PFcWK5hQCDVm8D0hG5a9L0DcyFK5AY5V3V0os/VHVy2PDL9bwNHCbiYme2oPf3lFCg
 O3SG6AThUsy/5ubHJaGkVCguuXbGbTO6Hi1M1jeCRAOOzKvIdlDoUYTOKoIX9BLHeKC5rS/FUof
 WY2MG8jqRDAG6S0GP6RdP0Ga//cBzApEUskyLgdXr2K8woZSlleQ+B662bOYVm3II9KKQgVG82O
 VVg9rifHPa/l+cnI4lL98o12pWcTPWK9UD8krJrkDS3UTl+Eu4xWRywSmYFjYVdgEQF7lbDZvNd
 s6flonruKPVDDZAG4HLihYFFsNNFEhtyc52qhVeRmkFJxHkJo3HkSxU4roq7+OcPbFsPsLvXh/T
 lO6qnJwxhH20G9U0KxvgeFILR63k9kpMu9e+zZ9gBra2KkcSzu/3IOb6rrmV0qS+G/Wwh+eWPFC
 NBTMdz0XExh1O/4p2sAZWGz2VyaivgdjLD930JNziBmYMih4K1Ne1usDgT8tL/F2U0gXifuv1dy
 AWrH6RtSZShQ6Of3ulZoa1m1bvz4offCkKbz4PFEyv/91U2p+OoOhO5v2xTLPYmXhbZ3yrc0yr1
 6wZY26wW2kq6kgCCejZsiRw41CaXv2e53F77BEf887Vxga8RVIdHQRtyWgAACNgZNYz+W0vyAPb
 MefopIujLpsI7nA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

This series fixes support for correctly saving and restoring fltcon0
and fltcon1 registers on gs101 for non-alive banks where the fltcon
register offset is not at a fixed offset (unlike previous SoCs).
This is done by adding a eint_fltcon_offset and providing GS101
specific pin macros that take an additional parameter (similar to
how exynosautov920 handles it's eint_con_offset).

Additionally the SoC specific suspend and resume callbacks are
re-factored so that each SoC variant has it's own callback containing
the peculiarities for that SoC.

Finally support for filter selection on alive banks is added, this is
currently only enabled for gs101. The code path can be excercised using
`echo mem > /sys/power/state`

regards,

Peter

To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: andre.draszik@linaro.org
Cc: tudor.ambarus@linaro.org
Cc: willmcvicker@google.com
Cc: semen.protsenko@linaro.org
Cc: kernel-team@android.com
Cc: jaewon02.kim@samsung.com

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v3:

- Ensure EXYNOS_FLTCON_DIGITAL bit is cleared (Andre)
- Make it obvious that exynos_eint_set_filter() is conditional on bank type (Andre)
- Make it obvious exynos_set_wakeup() is conditional on bank type (Andre)
- Align style where the '+' is placed first (Andre)
- Remove unnecessary braces (Andre)
- Link to v2: https://lore.kernel.org/r/20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org

Changes in v2:
- Remove eint_flt_selectable bool as it can be deduced from EINT_TYPE_WKUP (Peter)
- Move filter config register comment to header file (Andre)
- Rename EXYNOS_FLTCON_DELAY to EXYNOS_FLTCON_ANALOG (Andre)
- Remove misleading old comment (Andre)
- Refactor exynos_eint_update_flt_reg() into a loop (Andre)
- Split refactor of suspend/resume callbacks & gs101 parts into separate patches (Andre)
- Link to v1: https://lore.kernel.org/r/20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org

---
Peter Griffin (4):
      pinctrl: samsung: add support for eint_fltcon_offset
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs101

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 150 ++++++-------
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 294 +++++++++++++++----------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  50 ++++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  12 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |  12 +-
 5 files changed, 318 insertions(+), 200 deletions(-)
---
base-commit: 0761652a3b3b607787aebc386d412b1d0ae8008c
change-id: 20250120-pinctrl-fltcon-suspend-2333a137c4d4

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

