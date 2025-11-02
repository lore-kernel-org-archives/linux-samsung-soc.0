Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF50C86348
	for <linux-samsung-soc@vger.kernel.org>; Sun,  2 Nov 2025 20:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762115252; cv=none; b=pXrzMw26J6nrsGfiVwRmDe7Baaw1BofKwV5hpAod0DK5Cp+wI+zX/YPX1uwlq4CP1gNxVcsNpcyyIR/vS+7zEX8xwOAsYfSvp0f9BbN2rZspSxDYWjdmwdqUBHT6L2sQ9sdSIRN5zzZiXtC37/ybvPXTsOdlUX8TnZ/qa8RDyZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762115252; c=relaxed/simple;
	bh=OhekFW3h+d47C/5AQdp3ggOLmxhgBAEJIvtUoN5VEas=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jXwMzqItRoUDY6z9vabe+iEHgUxJMnLOwf+ZSyLq/KDagH7y05eXa42qYUU4P9W4vvrW+BIHWTIVuw5tbx6p+xFuBigjjWmwaYfnODoW1lKu23Uk4WBVrcNXyZpI/9hykrIynjRHpMw2ZjnxCcUW2CNUNCPWnn7TLhwHh0f8SiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tlu9OeP9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tlu9OeP9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso51122195e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 02 Nov 2025 12:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762115248; x=1762720048; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nT7uAiV0xMGo0ccwsBEgegZqRMJyigLwSqhDtIUoOXM=;
        b=tlu9OeP9lbiEJNTHM0ZkedCcHjWz3bELuVdqkz3TUNxPd2mKBgJUhwunyxXXTrGW9d
         4YsSH52ZUnloJptjDL1KVYSCvdet1uEZJgFxwRlX5J/tD+dG4pC3nE7RKrkNlaGwiJsC
         u1QwPKlzxmuMHvFnJBRgAL2l8QHy5ZWgz7rzkZIqWYur3JQBMR8mRTOFmd669m4euulP
         0KBfWDrbTnfG325Sowm5p8vLIKFahW+zGX/AyrT4D/OaXhlvAM+4lhNq6CQp7iurysJS
         yUnCBC5S7jMrgs1uzrShWSbYjvlHweVsl9qW9uIXSdqIFaoMeLa2XhuGQbNaetaKnP2n
         LUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762115248; x=1762720048;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nT7uAiV0xMGo0ccwsBEgegZqRMJyigLwSqhDtIUoOXM=;
        b=Fp8lCdTi9hAmsiFutsWyVrVTVKZj77EvjCHFj1fD1TQtFdB1fB39Gec3w7QHxYk84N
         voiGGaGY4TiyHF3xIasyGOLXkXUES+v/dILHRxGkpELKLuny3XB/xPaMvVvmUdkUHGq3
         AT/p0Y3j47tvji2PV3tk05PWVqfNSieXolKxDcEBbFrryB6bO5TXwNlbhT6GZzQWsRmV
         XeuFlh+u3z1ay7CpxdiYmETsuhhV3EtM7IYC9tZAzd9dlBUqEqMy2bu/kQR7DuowrllE
         vCTfh5HwyJLxgKNDfFlIKEgEW61MbuPY1n7afq+vvqm9gnxFCwRM0II4yi/0AGxaKDd1
         8J3g==
X-Forwarded-Encrypted: i=1; AJvYcCV7FsSBpJerlzt6TeOHU9Cue1UKx59awHyAyhsXAnLLFCj4eZihwOp4TYuEPD0SXfMqnlODpMDxt+Q3BL00qtAI6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza7s3uxEsJRUwCUWD511+527PUVJ+jnftLSxC/qBVWqQj7WhKM
	5dKk+uFQCWCb3d+gADeXgHhOcRyQljMLDQtL3dpsPvo9AuHxNemINsn6gdaJxRqVx8M=
X-Gm-Gg: ASbGncvvm5fOK7iVJdnpDD+BMv9hx6iPCnql7Fe/E7Occ3NsKFRMkf/EFLoykk0u8sR
	+KPjVnB0tkf0raSM+k5Ta18cCSdVAXQNcD96OffNt3usvKHcbJhWLPkBSSJIdRY73eBEDfY3Dj0
	VfWY5rnvmyjgsw8N1cXiSVfZGN8r+8yxX47Js7IsSlIY3klu+FJ6p0UTOc0dWEWww8hUiDpJcjM
	yEOn/oa6GYwVO31gVn6QyCvVEQu/+53joYoDPMDeiEG2fQkOhorXsX/kLMnJSSrf3I70EUX6y6Z
	L3B5e7AR0y6+A5tR+iJ/YDyIvcwsKTEu8RQ22hEXwM/Qd/vTP132rgm/jwaUrz3d3G7vzjmSl2P
	CMJaM5hZS84EUngUPPH+MmvvJYa2jsLMgk1i6QB69nf6zhqYhZ8q3g5KPyvGr1uuvXkjouh9XQZ
	KYLcs2ahz2IFdpl0S38aV3q7e1/1P2LMJ9/0pAG3mzgw==
X-Google-Smtp-Source: AGHT+IHIKkiQwKtmGAzKOmgbA356fRiVBqvIHDiF+GGEZBhFiNyjM9x7OLxG5XcUh3gmeu6263UQKA==
X-Received: by 2002:a05:600c:530f:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-4773082d988mr91469825e9.9.1762115247938;
        Sun, 02 Nov 2025 12:27:27 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c374f84sm114664165e9.0.2025.11.02.12.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 12:27:27 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 0/4] Implement hardware automatic clock gating (HWACG)
 for gs101
Date: Sun, 02 Nov 2025 20:27:13 +0000
Message-Id: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKG+B2kC/23NQQ6CMBCF4auQrq2ZTgWLK+9hXJQyQCNS02KjI
 dzdQlxodPm/ZL6ZWCBvKbBDNjFP0QbrhhRykzHT6aElbuvUDAFzAaC4vo/uqkdruOmduQSOu1J
 XBTQFGmLp7OapsY+VPJ1TdzaMzj/XD1Es6xsT8heLggPfo8oFEYAEOPZ20N5tnW/ZokX8ELD8I
 2ASGkV1LTXWCqsvYZ7nF4AB82nzAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8200;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=OhekFW3h+d47C/5AQdp3ggOLmxhgBAEJIvtUoN5VEas=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpB76pXUE6B9l/PyF19LGMSvyFgmTlaR0K/ip7w
 JLdHmop57WJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQe+qQAKCRDO6LjWAjRy
 uhm7EACjNzKyTNo/pp6snc9dOYQUWRVlkURbNVn7v4DbhPB95Okxryn6+xv7IN0Rc2pJMT9dtLJ
 DNbJqy+TSx1y19jEgZFPggl+TEVQ+iJdH3GR8lA/dxT8ZKJXvQpUt9Nn0i4pFvtNIZXBaJr13RY
 8O5eNmFOVYkcx27T7KAbpCaPeK9MUf4fQ7vO2liCQ5UPwXb1xdGtilNhaUQvPeFpZrM3qn7S+Qr
 lO912goKd56OXbPud0vhI4wjbsNMVx/AInuQAzT2AKb0oCUodwnnHGqsUQI50KkzhCTq8wmkjFO
 kkeOFN8Tb28a8/lfY5IgZGaKU84brFPoxcmMRpgwESqoJVPzlb/KU3boRC1io9JM9qhcJl3mP9s
 42Oqu8L998pReG92a+fMaVR3zmQi08QbAohXWIieBQL4is3+nQDU74fO6Iq/Uo2p7tND2Hmu9XX
 sG1dFInzatdYUaeP9GHJ2sh7PAzH+6DnfkPy/T+x289JrLMKATUSCvaEqdzZoJlUDPi6aw4t2KR
 5YJgOp4b4FSUhuwNj9xRxkNtqReWi3BLCRnx8bIJlz9x6nJx3TWLCHlNcurSZ4vmMGvIenmZ1Ft
 wjOCho7fg7HM17/fr06t/0mtuyBOpw33a+rfQXgzEyGQw6w28rUUAVQ8TLFO3YZD134CErQZfYE
 XsoqbMcMuFLOeyw==
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

 .../bindings/clock/google,gs101-clock.yaml         |  23 ++-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   6 +
 drivers/clk/samsung/clk-exynos-arm64.c             |  62 ++++++-
 drivers/clk/samsung/clk-exynos4.c                  |  12 +-
 drivers/clk/samsung/clk-exynos4412-isp.c           |   4 +-
 drivers/clk/samsung/clk-exynos5250.c               |   2 +-
 drivers/clk/samsung/clk-exynos5420.c               |   4 +-
 drivers/clk/samsung/clk-gs101.c                    |  56 ++++++
 drivers/clk/samsung/clk-s3c64xx.c                  |   4 +-
 drivers/clk/samsung/clk-s5pv210.c                  |   2 +-
 drivers/clk/samsung/clk.c                          | 200 +++++++++++++++++++--
 drivers/clk/samsung/clk.h                          |  55 +++++-
 12 files changed, 386 insertions(+), 44 deletions(-)
---
base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
change-id: 20251008-automatic-clocks-249ab60f62ce

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

