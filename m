Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EAB26E6F0
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 21:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761773438; cv=none; b=a7+KfjmqrOXVfDO6sa/tbFH1DL3z+bIa047aCD5Xm6QirAgoR0/K6bVRIYscNJKKg1xJJ5huyuZ40fbjX+x8xyzUItbzpv6igoGBMjPeexSlVDKrKD9ku3ZhAbynTxZ8R85njFEmu6RchjtuW4jEFOZnkJ9y+O9FTup89TDcKZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761773438; c=relaxed/simple;
	bh=55HAc3H2pTNFibfzo9flbFWBCV0NF4ne7pX++sLxqj4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V9aJSMIco0g6vSWbgoaTIsgsHsW+LFkHnOIpK4tUalQpF5GNb+W0fInYiRgdex1kLw3zu0BDunsLt/CzFLQZRIy9yuWlfe/lCEeYMLlHgxQToS8wBsG5qAC5aS+o1RLzOEZQOwhPHrzl/hHHF2T/nP2GAkzpiMXrZWClSEv4wVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iRTKTGbG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iRTKTGbG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-475dc0ed8aeso2222285e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761773435; x=1762378235; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6MOSEMyF/K0yKEFT6dKUF7DE2m7sMRwO3zCRZtu9VWU=;
        b=iRTKTGbGdpZQGj/cyRF8wEoeX1+TcrUYMbZkbXz12rjo7iTqz3caMzJpkeyWUw2M5p
         TqNxjI/+ytG6dgxLol7PN1Da4QnHOeCKKUDAqJAvRyqo5+wo9JY6l1meuBcsCm27zZ7H
         ALndFPSgWqjPYytov/k7l389ZAFcJMmtOyxx/rFG4p0Sl9AEfbFR7Vu1XYija04mT1U9
         R+RNLSOhlW8OGXcwAvqV/g1I0CaTvGtrzZEHD2OCrExucPiC0bTZOa2CQWUy5THhELmw
         8Rpe7dJeXaYFgpoNzJEX8ZF8g7XduRnQSuCkLZsNzWFrlLUf47AOvHaXnxcCnyxy7Auy
         +y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761773435; x=1762378235;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MOSEMyF/K0yKEFT6dKUF7DE2m7sMRwO3zCRZtu9VWU=;
        b=u1DGHYPt/uEuGIOuPCNHVwGIJWxhuKiz9LzT7LLLnH9IVjLu1h5kD7/PoKRgGoBHcw
         xgF0E5jP+2199wofvzXkufDzwS5VJOycZWqwAqq9pd2Z/6bZ0700G2ndxLgZEbBRp5Q6
         WGfnhxWgsrSg+GIDESQ4dJdDyiHoaupSuHNtskpLi2Bks92BSnXFxidk0I2szoVdjnJr
         8XuIfloXXOR/Nm0JmskF5WtOExvNcrK20+CqcGLZLZWKXU550+AU+qzR46muk94C9nca
         gPN+VKi8FQk2v2t6nERExOQJxX6idvP/tewCzK2QbpYgF7qNuaIeAYA0VJLsnmjfN+PI
         kl7A==
X-Forwarded-Encrypted: i=1; AJvYcCWAklb+CE8g3y3Vdg/OroW9yR6q4OFbg25/TYyiquKnobbadFzGxixvzx9ycBykKj7r36aCiM4HrKFnG4Xr8QsT5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtCT8Yts4IFVjTIyVr42w4NXfHWBiQJu8fGOONNYfbjnFtzFhA
	jRzMduc/OVpRSoXOhZJjUDL5o9b727lTgDNK8VFCgUoBNHbAp0MqOvUkDfbQezFxwGI=
X-Gm-Gg: ASbGncv2VeLqlHrlLIXNt8LAP+PjDPzx22ZFE4ZWF+SHLnB12HnW4upeF4qTlPtlLZa
	KQ9lLMHb8dkRuwc61sZVxFGxaKYfoEfjwiBHHNTxoxS7J6Z82UFWx2KOkP8uHce6TvjOiOm91Q3
	rF8t2/sexQ+scTlZvn8zU6lbtCV3TWsok8vxKNr7AV4zM9q51l5ZB7ctG37/Pk6+LuZbt63NyXL
	mIPvCEXHuS3TlkPSrQ1Qc0sdta0wb9Vdr992OwIuBezRn02z84RhqxBJw24r8ppU3HzwU94Z5sx
	XXT3Kl5xOSJLS1zXQsmCQtf/f8yogQuUeYGw0c7s/NT2Omfefiowy2jvl7GyBJX79LGFarFpjTv
	XKfHc9obqx3T6uFbdHMGpFWLregY7SweHtjCqp0iLooC/w8hMXDFaK9LR/52jcQ0Ei7Jffla3k3
	Rx5nWEoaVR2qVGjZobJGjwBL7kac60hQ==
X-Google-Smtp-Source: AGHT+IE1eBg7TwUsq5KPf16TecjnHzMJffoLDM/OVCqrXzJVZwVvKSB2UMZvVMcbS7+LZIqpKrqHUQ==
X-Received: by 2002:a05:6000:2313:b0:429:b21e:49ad with SMTP id ffacd0b85a97d-429b4c97c10mr843747f8f.37.1761773434517;
        Wed, 29 Oct 2025 14:30:34 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm28573457f8f.6.2025.10.29.14.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 14:30:33 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/4] Implement hardware automatic clock gating (HWACG)
 for gs101
Date: Wed, 29 Oct 2025 21:29:21 +0000
Message-Id: <20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADGHAmkC/2WNQQ7CIBBFr9LMWsxAba2uvIfpAnHaTqxgAImm4
 e5i487le8l/f4FAninAsVrAU+LAzhZQmwrMpO1Igq+FQaFqJGIn9DO6u45shJmduQWhdgd9aXF
 olSEos4engV9r8twXnjhE59/rQ5Jf+4vJ+j+WpECxV10jiRBrxNPMVnu3dX6EPuf8AVmfFB+xA
 AAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7998;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=55HAc3H2pTNFibfzo9flbFWBCV0NF4ne7pX++sLxqj4=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpAod2IMZsBiQQituoQboH4FGQqqNagEisEEWqs
 TlXY7lxAKCJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQKHdgAKCRDO6LjWAjRy
 ukDmD/4yJRJxiT5V0kURtDvDCAPnAFixfDT79EGsrWtRy1dhzX6HcG1WPUfR2SBeAowdf7GXxrx
 u2Bmj7fI+s+hur4DDOxZc7RSWgchhA3U7qFsxWfprBfRE6gFi9yJAdOBRrHQR1j8ovxfUjYMzCy
 b8AuR0wh94bZ45Y6M6BD/UYU1xlMiGzCWl50m3ZJQBTjr6XPpQoUO8eL7NxdOB9es6bLzVDLXMR
 N6htqeF8dB2UyVzE2Ku6Oi2TEzAhTgC5UhemJKUzB/Av44iNf75J1Molty0e/0S+MCBGUZHDpbt
 KvjIqtWgYKOcTTtMdkdyOdS9HR9Ucx2SI5002xY4TQfaNnG7japJtWXscsha7L49ycTFby2A0AL
 VK7BZGQlV/Cmi0b86t1mZOm5bTea/n1NM0VVSaejv/LoUv3qj7E90rY4gYuHAoBUR3YCnFYrN8S
 4u/anpDmnd0aMtFxE4Y0CkEnn2HpHU8Vn6Wl1Kt9w+/3o2PWtevbNBtbhEAgolkTwZLxXwEX2rF
 9456hxmliTv6dYNApCJGpzu05p045/l2kfg97HNWnGjhbgXGq10iXZ3TxSd9CkCfgHp01Q+LDFZ
 Q56ZTJbSr7CnryzjlBYfpUjuJzhYH5MOb7y8X1tknjUBw/vwIbtYtRLG5+37wZqtU6JCNeJEn6x
 AbAXSwvaPYF505g==
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
 drivers/clk/samsung/clk.c                          | 199 +++++++++++++++++++--
 drivers/clk/samsung/clk.h                          |  55 +++++-
 12 files changed, 385 insertions(+), 44 deletions(-)
---
base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
change-id: 20251008-automatic-clocks-249ab60f62ce

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

