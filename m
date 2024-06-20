Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17801AB531
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 11:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718882693; cv=none; b=Pxm+y68Jd55H65N5rPM4wiIY3OG0tB1u3X+lDFNPvGWiQmLlbpYefwrknhhkx90eovXUHg6VfKPsXqqHvc/zj4OXdXLkr05t66oy5n6ledVUqFf3xL5Ndoe0JGT196bG+3XLmMV0v00TZo2dH8tqYwhomHBs8eN4eQRebyQSBu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718882693; c=relaxed/simple;
	bh=4ds6lgEBHypbXsdx34WZF0wcW2UxEYrxEDqsfQYnqds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CpuHDjMDsYjHWB9zdbO9pO7K8K79H3HicxKi5G2WseL7BV2f72d69vS7GaFNEeiWYbdKqOhvdn1rl1cDsn39IXV0raMcm3exn/oXJFgVG/f6ufyRp0fkQa2yN8bejdzCtIToTqkxwhYUX3Q0Qv3iYQ/ihdKqEW5EiCfVKKW029I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E9dTn8PI; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E9dTn8PI"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e724bc466fso8185961fa.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 04:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718882690; x=1719487490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gCJG0Ja4O3W5+n0BOGZ+62h9PoJVQnw5m6Ruy1ZerC8=;
        b=E9dTn8PIif2iwk+5mcX7bV2SXNZvuYwd6vx1Vx/DoOfLHV5NaS2s8SPO7+vl/V9zVR
         fi33yjm9G7WPvD1GVcy2u180gLHLcYn8j6rPG0Ox56VDWoL4idt7fgpucV2SAOunIz/H
         zX2Vsd0UDqS2+vcH4nnFRxJuIvBswkj0FldqRdN4L97g6td+kc2YFs6iaSmVkKxuyeCt
         fyeh8qjMT66JClXV76TkXROK9Saz8ksUg56j7J01gkM7sFuSz4CkNCU3D+r5shrQldDp
         TTqhQpCwYad2KiVDQ4pPJ2vqz0boiyS9by6bVEwBIaFwJiAHzNb9dMki9b80T2g6RQH9
         GU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718882690; x=1719487490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCJG0Ja4O3W5+n0BOGZ+62h9PoJVQnw5m6Ruy1ZerC8=;
        b=seWvWfYBNVQPrTTKdiYQC72bMhmLyryy2yPsvgTSjs8nVl/ubM5p2mdLIXAqXG1eHT
         KgFjkfQYS59zjalearnv1I9QQ41ouUcsEjFuPZJpG5dq76GWP8ar26/bi1e/OgQ3W53O
         zNoVVNXcI6tBSNCr9xcxmWU22TjLdblzCM5v+PvwQaZ/yfDrr8AAepcxzJyrAQNzY5FY
         VT3yaB8O0ukR9g5rpR8vXnOEmyjvNt21DujQb+JlkWKx30n8O95U0oQF5yGUA2i8B99y
         0qLSSMyPuXxLtA6wlhO9i4NpgdiArK8YwT4hLJbI4P3WDy1GnTa79LpFFYlPudh4g2K2
         +txA==
X-Forwarded-Encrypted: i=1; AJvYcCXW6fV+9EN8p7n+41ilM5equksF2Po0tyM+hNfoPzGwMT7ngski2at8AAp4g7gKhrUOurISjh6w7Qcbf8C4q1PSrpoJUEO70LHhlZyEu0gO39M=
X-Gm-Message-State: AOJu0Yyjl0KKZr3B4Tf9j+oKbhZLufFG3t0QYC7RzNlO2SgkqFBv9YbF
	xJzvwy1zCpFiuqsJM6ei80VNk2VhIKURnHmLnTPPLxbhlAJOTENOVOgl5b8KQV8=
X-Google-Smtp-Source: AGHT+IFa6EadGkjUelwniOpcoV8wjGzlajwf0CUb0A6oVYtvqsnZs3ZgSbMRkdrUCg8xWmBN7N855g==
X-Received: by 2002:a05:651c:20f:b0:2eb:f6bd:e4ec with SMTP id 38308e7fff4ca-2ec3cea1b44mr37772661fa.24.1718882689841;
        Thu, 20 Jun 2024 04:24:49 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510::3aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3647bf3092csm2025371f8f.97.2024.06.20.04.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 04:24:49 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: lee@kernel.org,
	arnd@arndb.de,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/2]  Add syscon of_syscon_register_regmap api
Date: Thu, 20 Jun 2024 12:24:44 +0100
Message-ID: <20240620112446.1286223-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lee, Arnd, Krzysztof, all,

This series adds support to syscon driver for a new of_syscon_register_regmap()
api.

Platforms such as gs101 require a special regmap to access PMU registers, which
in the existing upstream client drivers are accessed via syscon regmap. This
issue was partly solved in [1] whereby a custom regmap is created in exynos-pmu
and a new API exynos_get_pmu_regmap_by_phandle() created.

One issue with the approach in [1] is that it required client drivers to be
updated from syscon_regmap_lookup_by_phandle() to
exynos_get_pmu_regmap_by_phandle() when obtaining the regmap.

Whilst updating to exynos_get_pmu_regmap_by_phandle() was OK for exynos
specific drivers, it meant other drivers like syscon-reboot and syscon-poweroff
which span multiple SoC architectures could not be easily re-used.

In previous review feedback for USB phy and gs101 poweroff driver Krzysztof
requested [2] that we take a more generic approach that other SoCs can also
leverage.

The new of_syscon_register_regmap() api overcomes this limitation by allowing
a SoC driver like exynos-pmu to register it's SoC specific regmap with the
syscon driver. This keeps the SoC complexity out of syscon driver, and allows
client drivers to continue using syscon_regmap_lookup_by_phandle() as before.
The solution allows more code re-use and can be used by other SoC archs.

Notes on probe ordering

exynos-pmu runs at postcore_initcall, so all but one of the client drivers
(ufs phy, usb phy, watchdog) run after the regmap is created and registered.

The one exception to this is pinctrl-samsung driver which is also
postcore_initcall level. The exynos_get_pmu_regmap() and
exynos_get_pmu_regmap_by_phandle() have been temporarily left to support
-EPROBE_DEFER for pinctrl-samsung driver.

The longer term plan to solve that probe ordering issue is to enable
fw_devlink for syscon dt properties so they are correctly listed as
suppliers in /sys/class/devlink. I tested a PoC patch (see below) for
fw_devlink and that seemed to work fine. Once fw_devlink supports syscon I
believe exynos_get_pmu_regmap_by_phandle() api could be removed. The main issue
currently with fw_devlink syscon support is the wide diversity of dt property
naming currently in use. That was discussed previously here [3]

1248a1256,1257
> DEFINE_SUFFIX_PROP(syscon_phandle, "syscon-phandle", NULL)
> DEFINE_SUFFIX_PROP(pmu_syscon, "pmu-syscon", NULL)
1358a1368,1369
>     { .parse_prop = parse_syscon_phandle, },
>     { .parse_prop = parse_pmu_syscon, },


Note one previous concern from Saravana about syscon potentially probing
before exynos-pmu driver and it relying on drivers/Makefile ordering. I tested
this and even if mfd is listed before soc in drivers/Makefile exynos-pmu
always probes first due to syscon driver not setting a .of_match_table entry.

Once the syscon and exynos-pmu patchs are queued I will send patches for
watchdog and ufs phy drivers to switch back to syscon_regmap_lookup_by_phandle()

Many thanks,

Peter.

[1] https://lore.kernel.org/linux-arm-kernel/20240219204238.356942-1-peter.griffin@linaro.org/T/
[2] https://lore.kernel.org/lkml/06383015-51b2-4f4c-9fd8-e4f7ce12f44e@kernel.org/
[3] https://lore.kernel.org/all/CAGETcx-CCpaV7R0O0HpDpoX6KxQBuJiMmKdWA8nDE-5Qj2Sa7g@mail.gmail.com/

Changes since v1:
 - Collect by tags
 - Keep syscon lock held for check and adding entry (Krzysztof)
 - pass pmu_np not np to syscon_node_to_regmap() (William)

Link to v1:
 - https://lore.kernel.org/linux-arm-kernel/20240614140421.3172674-1-peter.griffin@linaro.org/

Peter Griffin (2):
  mfd: syscon: add of_syscon_register_regmap() API
  soc: samsung: exynos-pmu: update to use of_syscon_register_regmap()

 drivers/mfd/syscon.c             | 54 ++++++++++++++++++++++++++++++++
 drivers/soc/samsung/exynos-pmu.c | 38 +++++++++-------------
 include/linux/mfd/syscon.h       |  8 +++++
 3 files changed, 76 insertions(+), 24 deletions(-)

-- 
2.45.2.627.g7a2c4fd464-goog

