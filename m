Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DC52E543E
	for <linux-samsung-soc@vger.kernel.org>; Sat, 20 Dec 2025 09:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766221556; cv=none; b=DIxiq76MZlOPYlhbs1W1KQJzhmouV7LL+u0IFTMxVxrMq3g0o5JZzIvKg7u6PcqaEButpYxKK0rYIQgODC5WOlifKNfWX2Ma0MKei/89CIcU+8nE7u1dEPJlA3EMQ8tPQzwG3LhEnxyadsUSyY9KynwrzYeU/Hc577EA6T+fcyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766221556; c=relaxed/simple;
	bh=//GIb7OAmVjsWQKBizLr0xALXMpGX2EA3Daz0kGWYqA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rHYqy6h0lDhGQumynpbfyvXHxQcKTvjxR+yRKjJ5TQTx/Sw9UnZwUUsc844uDTQw7LnnInRwhVIomY/ckXu7Vikt5EvSeREM+bpPOitj5ypGfCR9osrMjTxTseIXQUo5itNpjCdNh9nB2mjVVVKSMJfHGJbGZDTMZEuLbSHvSFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GQcPOjkz; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GQcPOjkz"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so7891435e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 20 Dec 2025 01:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766221552; x=1766826352; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bFMhA15AnZZkBHkOxypkP9FvWp2weXL/FALdblTG1mc=;
        b=GQcPOjkzLgUG9KcEB1KEo3763NkY+7GKnZFsp/k1A71TkRHB6N4ipp56Al6zDu1+di
         qRP4Nrcln6wkamByR/fYG1SXFj3OZST9ike4Nxw/kmN7+zzaf4j4uYxMBO9Cs33nil4e
         dl4dElQWXh6Q2SGoc7vGju/VtGkMKslLceHDIwSjNjfxV4pL4JPoaGfzWQIojiANdHXQ
         xEa8qjMY/QwOgQO1GLp8GcxW0DQMOcfF09IzyOCXa7Gfi4TvuuJ4ijioDJNLX95Cmz+m
         rAdgk0jDOkDazE9uk9RkqlKIlkZwCIAkQUV4lRox5grY4UX2/G8UsPKLACsH2F8WrjRr
         LsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766221552; x=1766826352;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFMhA15AnZZkBHkOxypkP9FvWp2weXL/FALdblTG1mc=;
        b=bT26A8/0uK88oEhfeASQx8I/uu0YMXietqyQ4ZSU8kDRcg9vJSgmxTDgeVqgdiAAf2
         +TThvB2WbPVYU1602ilOkxTMl6ma3KVvVDApnC9NUltvSX3HnomuohFvNHLjYBWbTzcg
         3XCGq3P117KAba+3ssjELuHDLVh+GahzofbDa24a5kDbMNuw8wCnfjUdRvajYYNLqvnm
         F25o8TT6NMZ8/57KahQvP7pupQjMDLuJtPkdi4tlyPDNXFyKHMIKofTFBlxWldmydKDI
         lYlyTGC+pNeFTerNsXKozY+JRJlbvy0notUAnYi4rY1Lvb4FZG0YbnkYDw6GPN6gqBpA
         1eaA==
X-Forwarded-Encrypted: i=1; AJvYcCVFXWGnbyIrx24XlifTaUEnTqgfiOw/CTW/RuPUVGkj+ODfqpauFKb/aP4KYcEgtop7NxjHjXzwyWeLQM5D54OpRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfTJTRUYeo5QedJY4hq0YXaf7A9QXrUQd+st/7YqP3QL6rjfss
	C3IAjU5ENkuuRuHjNPuMIsiz/hGj3sY3u+M5OtqU/0sOa7PfSwqqN80RBFZ3Gbvu23w=
X-Gm-Gg: AY/fxX5YABHknLmFhAhGOvYsIFnn3pnyphPLz7MysXKWy97My96TQGCaPL95fITwbE6
	yDm8YK/2QE8uafqHYb8yXWG5Hus2H/0Io/0wivLP9b8k4SWNGhKsYq8gp5UKRKo/MbSoOn502eH
	dq+HEwuwUAs1Nc73wVl4ZxvanidhK9L70wYFh9kpo/hqwHxwr4XCCj+XxKQHz5p1xjPcdckm94m
	aXBZq251bz5b8a/jmz7g2DE2izTrsxrbnXGCa/5trkk9p/l2V4xeXMUcRekppl28gINfxRvcshq
	oWgxjUBQ9E7w8iyoHYZrY8unZQZmjBvdUTdKszIG/qj1uqG+rIT2zuNtHCi3KzLgz8a3RKHKm8B
	zAhNLAVImIcIn3WLNf97Xv6++TJbdTIWIuqmK7449e9rh3FCtvrbCD6ti4JCR1WQi1BeslKWmdZ
	1Zc+UOyUg9uFCeXtF2PNsdPUegEZJ6v8+TQz/vvn4=
X-Google-Smtp-Source: AGHT+IGTFt8xSAiM49vZjNVk1KJSFssC5ukYxotoKf59TklT2COwePyitrFqpeG2x5VoR0hvc3/Abg==
X-Received: by 2002:a05:600c:8116:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-47d1953bd09mr47900365e9.4.1766221552248;
        Sat, 20 Dec 2025 01:05:52 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm88466685e9.8.2025.12.20.01.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 01:05:51 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v6 0/4] Implement hardware automatic clock gating (HWACG)
 for gs101
Date: Sat, 20 Dec 2025 09:05:38 +0000
Message-Id: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJmRmkC/23NzU7DMAzA8VeZcibIcT6WcuI90A5p4mwRo0FJV
 4GmvjvphERRe/xb9s93VqkkquzlcGeFplRTHlqYpwPzFzeciafQmiGgFgCWu9uYP9yYPPfX7N8
 rR9W53kA06Im1s89CMX09yLdT60uqYy7fjw+TWKa/mJBbbBIc+BGtFkQAEuD1mgZX8nMuZ7ZoE
 64E7HYEbEK0FIJ0GCz2G0H+CY3YEeQiRAHkIhnh7UZQK0HAjqCaYKMyHXZRQ3/cCHotqB1BN4F
 i37WVGH34L8zz/AOveMr8uQEAAA==
X-Change-ID: 20251008-automatic-clocks-249ab60f62ce
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8951;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=//GIb7OAmVjsWQKBizLr0xALXMpGX2EA3Daz0kGWYqA=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpRmbsjvTmPWdF9+O9fl8lYtSQcJ3i1uNlfNGBb
 PMdF5DTVjOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaUZm7AAKCRDO6LjWAjRy
 us/qEACXdSRPSQFsDMMij1Xsu9Fhsbz1TVM/vnTTFYW/zDKRiM6Oenfk+iugKx57Ll2QIY8kWq4
 +WkJiNW+ILZanYFV8RHyLf/fD+k8cZhxFt10g3nzfTJGkCaJ+ORyNFLY2hg2bHhK0e+/43YE+Q0
 pvZntTwYe5kFcVnvVPvFKQUJATj5A7ChK4cMVq/T7N/9q+STAYVJFwzM1ZjTQwC4CBzuRVDYfJD
 yhGaWa6O7uep/1/fhGBanYFT4LESntGu+W/2hUY99vH6A136jhWpJd/BV2beIIFpl9KeoGdUrMw
 4IVYzJr/Totxy0h22BRUuueyEW5uQDaWahrcGb1xwtHZPPRKDUrR9uepqZ0bTf1WSjbrkAQFS8u
 weu+uOYkADWeExlmMJgFkpyMT1SIYkHVZJTcpZksTlyok8R/AFA2b0R0OLojc3Y+G85VNIGo5vD
 UKJpK1c8xCrWNaFeJ7ZrQ4lU/9qsDZSSYDge49cTkicKv4zBz3NPUnxNS2OOR4AHPkTYFDfJIUU
 IXOr4Mq3j6lK+h5vzY+CH0WnX+hQbL9Kp+9ZYsZCRRUA83sn5FWophC8qPyfjKIT0WTEGbdUGTg
 XJ7wZ2MXCXVsirwb7PyzAj/PQVZ9BDUMRwjwRbXRife+UoHAJ9sskC3pZfJQ/oygaMOA7NoQJlP
 EoDfKbLysXKdwvw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

This series addresses an issue with Samsung Exynos based upstream clock driver
whereby the upstream clock driver sets all the clock gates into "manual mode"
(which uses a bit that is documented as reserved in the gate registers).

Another issue with the current "manual clock gating" approach upstream is
there are many bus/interconnect clocks whose relationships to the IPs
are not well documented or defined in the specs. When adding a new CMU until
now we have tried to label these clocks appropriately with CLK_IS_CRITICAL and
CLK_IGNORE_UNUSED but doing so is both error prone and time consuming. If
your lucky disabling a critical bus clock causes an immediate hang. Other
clocks however aren't so obvious and show up through random instability
some period of time later.

Fortunately each CMU (at least on newer Exynos) provides a "hardware
automatic clock gating" HWACG feature that is used by the downstream
Samsung clock drivers. Hardware automatic clock gating uses a hardware
interface between the CMU and IP to control all clocks required by the
IP. This interface is called Q-channel, and is part of the Arm AMBA low
power interface specification [1].

The advantage of using this Qchannel hardware interface for
enabling/disabling the clocks is that it takes care of all clocks
(including bus/interconnect) ones for the IP automatically thereby reducing
the dynamic power.

Whilst each clock component (GATE, MUX, DIV, QCH etc) has a HWACG enable
bit there are also some "global enable override" bits for the entire CMU in
the CMU_CONTROLLER_OPTION register.

This series makes use of those "global enable" override bits to enable auto
clock mode for the entire CMU and every component within it. Through
experimentation we can see that setting the "manual mode" reserved gate bit
on a particular gate register overides the global enable bits. So the code
is updated accordingly not to do that.

Auto clock mode has been implemented as a "opt in" by setting a new
auto_clock_gate flag in the CMU static data. The intention is existing
platforms in manual mode should not be effected by any of these changes.

If auto_clock_mode flag is set and the option_offset field is specified
then the global enable override bits will be written for the
CMU (to avoid relying on any prior bootstage configuration). Again if auto
mode is enabled the code no longer sets MANUAL and clears HWACG bits on
each gate register.

To ensure compatibility with older DTs (that specified an incorrect CMU
size) the resource size is checked and the driver falls back to manual
clock gate mode in such cases. As the CLK_IGNORE_UNUSED and CLK_IS_CRITICAL
flags are required for manual clock gate mode, the patch removing these
flags has been dropped from v2. I tested with an old DT and we successfully
switch to manual clock gate mode and the system correctly boots.

To have dynamic root clock gating (drcg) of bus components and memclk
enabled, it is required to set the bus_component_drcg and memclk registers
in the correspondingly named sysreg controller. If auto clock mode is
enabled the clock driver will now attempt to get the sysreg syscon via the
samsung,sysreg property (as used by other Exynos drivers upstream) and set
the registers accordingly. The suspend/resume code paths are also updated
to handle saving/restoring registers using a regmap. Note cmu_top is an
exception and does not have a corresondingly named sysreg_top.

As all clock gates are currently exposed in the gs101 drivers and DT, we
continue to register all of these gates in auto clock mode, but with some new
samsung_auto_clk_gate_ops. As clk enable and clk disable are now handled by
Q-channel interface the .enable and .disable implementations are
no-ops. However by using some CMU qchannel debug registers we can report
the current clock status (enabled or disabled) of every clock gate in the
system. This has the nice effect of still being able to dump the entire
clock tree from /sys/kernel/debug/clk/clk_summary and see a live view of
every auto clock in the system.

With the infrastructure in place, all the CMUs registered in clk-gs101 are
now updated to enable auto clock mode. From dumping
/sys/kernel/debug/clk/clk_summary it is possible to see that after enabling
auto clock mode approximately 305 clocks are enabled, and 299 are now
disabled. This number goes up and down a bit by 3-5 clocks just on a idle
system sat at a console.

With auto clock mode enabled it is now also possible to boot without the
clk_ignore_unused kernel command line property for the first time!

For future CMUs in gs101 I propose we continue to expose all gates, but
register the CMU in "auto mode". For new device drivers or updates to
existing dt bindings related to clocks to support gs101 I suggest we only
use the "obviously correct" clock(s). By "obviously correct" I mean a clock
has the IP name in the clock register name, but not try to deduce other
obsucurely named bus/interconnect clocks which will now all be handled
automatically. Note it is still possible to test whether the "obviously
correct" clock is indeed correct by putting the individual gate in manual
mode and disabling the clock (e.g. by using devmem).

Note: As everything here will go via one of Krzysztof's trees I've sent it
as one series.

regards,

Peter

[1] https://documentation-service.arm.com/static/5f915e69f86e16515cdc3b3e?token=

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v6:
- Rebased onto next-20251219 (Krzysztof)
- NOTE: linux-next has a regression atm 
  24ec03cc5512 ("serial: core: Restore sysfs fwnode information") needs to be
  reverted for boot testing this series on Pixel 6.
- Link to v5: https://lore.kernel.org/r/20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org

Changes in v5:
- Invert the test in dt-bindings: clock: google,gs101-clock (Andre)
- Link to v4: https://lore.kernel.org/r/20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org

Changes in v4:
- Update commit description with additional requested details (Krzysztof)
- Remove unnecessary header of_address.h (Peter)
- Link to v3: https://lore.kernel.org/r/20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org

Changes in v3:
- Add missing 'np' func param to kerneldoc in samsung_cmu_register_clocks
(0-DAY CI )
- Link to v2: https://lore.kernel.org/r/20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org

Changes in v2:
- Rebased onto next-20251024
- Fallback to manual clock gate mode for old DTs with incorrect CMU reg
  size (added samsung_is_auto_capable(). Tested with old DT and it works as
  expected. It does require keeping all the CLK_IS_CRITICAL
  CLK_IGNORE_UNUSED flags in clk-gs101 so patch removing those is
  dropped. (Krzysztof)
- Rename OPT_UNKNOWN bit to OPT_EN_LAYER2_CTRL (Andre)
- Rename OPT_EN_MEM_PM_GATING to OPT_EN_MEM_PWR_GATING (Peter)
- Reverse Option bit definitions LSB -> MSB (Krzysztof)
- Update kerneldoc init_clk_regs comment (Andre)
- Fix space on various comments (Andre)
- Fix regmap typo on samsung_clk_save/restore calls (Andre)
- Include error code in pr_err message (Andre)
- Add macros for dcrg and memclk (Andre)
- Avoid confusing !IS_ERR_OR_NULL(ctx->sysreg) test (Krzysztof)
- Update kerneldoc to mention drcg_offset & memclk_offset are in sysreg
(Andre)
- Update bindings commit description as to why the sysreg is required
(Krzysztof)
- Link to v1: https://lore.kernel.org/r/20251013-automatic-clocks-v1-0-72851ee00300@linaro.org

---
Peter Griffin (4):
      dt-bindings: clock: google,gs101-clock: add samsung,sysreg property as required
      arm64: dts: exynos: gs101: add samsung,sysreg property to CMU nodes
      clk: samsung: Implement automatic clock gating mode for CMUs
      clk: samsung: gs101: Enable auto_clock_gate mode for each gs101 CMU

 .../bindings/clock/google,gs101-clock.yaml         |  19 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   6 +
 drivers/clk/samsung/clk-exynos-arm64.c             |  62 ++++++-
 drivers/clk/samsung/clk-exynos4.c                  |  12 +-
 drivers/clk/samsung/clk-exynos4412-isp.c           |   4 +-
 drivers/clk/samsung/clk-exynos5250.c               |   2 +-
 drivers/clk/samsung/clk-exynos5420.c               |   4 +-
 drivers/clk/samsung/clk-gs101.c                    |  55 ++++++
 drivers/clk/samsung/clk-s3c64xx.c                  |   4 +-
 drivers/clk/samsung/clk-s5pv210.c                  |   2 +-
 drivers/clk/samsung/clk.c                          | 200 +++++++++++++++++++--
 drivers/clk/samsung/clk.h                          |  55 +++++-
 12 files changed, 381 insertions(+), 44 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251008-automatic-clocks-249ab60f62ce

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

