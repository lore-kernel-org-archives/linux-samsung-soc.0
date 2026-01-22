Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402AB2C86D;
	Thu, 22 Jan 2026 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769071168; cv=none; b=NWo/1AOjL9M4Fj+NXSAkpMCB1LLl0eBpsX/A84Cz2gJx/2/29ppNVn2FM/Fqem1Bg7f4UvkckmE0FuX2PKJQajv3C/TBazJIeV5AcYJddXZuTrayJjNaVwQ+dLpAEv4d2GE3NSLcm4/afa26QOOpWwNokL5jz4uar0FWlcVo140=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769071168; c=relaxed/simple;
	bh=lRf24S1QUTOdBwFZpSbeznEDb7qkdT3IRnLkaXjT6vw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TRTk4Hp4/yJNn0hI5WDDu997EcUzA+Hj95tx42M4ZK5TEF9D68DGOfwTulgxQKBXBmu+1yfmIcsfCrUF5VIgsDaBhlmmLnewqHgwcsfvyXNYkAH5a+AXysgsb+8V8dX8lu6qjcQzwAyRVVwVNr4kqMYgtiXEEkhtXQFkLRPQW3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKcugwgd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKcugwgd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CEEC16AAE;
	Thu, 22 Jan 2026 08:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769071168;
	bh=lRf24S1QUTOdBwFZpSbeznEDb7qkdT3IRnLkaXjT6vw=;
	h=From:To:Cc:Subject:Date:From;
	b=EKcugwgdnuFFowFhLOe2+rntBMhu2PIAiajDdqNrt9y0d0BgywfpcQ8/gunOqYa+2
	 H4nKAaSWNvh+wpv1ltsKPgXkf+c7AfbJEv8ATm6ubbj2jYv7NfQgGHcYTFNSAwiSku
	 i5qwUO+hz50bM5ONMvIAl7MZPRzP9skZBp97pnptSjsZotkLd3HTeYz8JLPM7Oef+y
	 yrpT/0BqwMxvj2+8jQFLcsnN+ZyeV6mtoY/lxaqvARMisDpjchJjYzb6l7ApOhjIHf
	 HBX51l1kbPBQfdQn294rRvb3g7UpZQegjWzXuG89vmg8LGS5o7yhlH8zLkEiUCpSFO
	 Gf2sm5419qn7Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: samsung: clock for v6.20/v7.0
Date: Thu, 22 Jan 2026 09:39:20 +0100
Message-ID: <20260122083920.20271-2-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8349; i=krzk@kernel.org; h=from:subject; bh=lRf24S1QUTOdBwFZpSbeznEDb7qkdT3IRnLkaXjT6vw=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpceI4Knu8MKjUioyilO5JbxwypAmBfYoA+P/fj pTiucKA0P+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaXHiOAAKCRDBN2bmhouD 17mPD/9uUQv4LG4Ycc90XWQQmeNzXfQsWtKpXyb/+wACeSQohSEy6tEwbSmwAcn/wUtwrF8ekxe u4BiSiBkzd3XcVg/+eVXTEtTVQkwTKdRDv6cgu/Yk8AhxcMv+FZe7wivW59Zg4DyLW4ZZvml4V/ zrSAaM+XOAu/wZfM2odvmSu2H+fVci6heMgtp1NYvpljuwSgB07r2NKDCU5wWUIi9F9UHU6mpYI nB6PBQO+DnNDzSTq/qDYzaSgie/8maJJaS7MgsKBRRikcWNrhsLiLx8D/nHFA+IUAGqt+9I7W/D 9odAvuZ8dKOIG2RjR/vqn/ydJYmkUcDElqPsvggBEF/zNwEQPVdQ8KlNLHqyLGBladI4kK0+9EX p0jucKxJ0us9NrFcZoxc3bedtxNdHc8LwyOIVvVt3G4DmRvs6SlHhCSCVMsnCzgJHOb9n02kpQJ pxLP5UOs4zX/ZOlvM3aG1DI2aBYiKrd0ZQtYvfnlJV6u/NLQaZpEW0gznH114M9HxmFnB+9krbD HeQmra4EYltiS0WOmZkIvRDhl5EIX2LzHlBOCng0PGGQ1LuDxM5JzaDy5UEISc1BvtITCdJXlyb 0NtuzPixRQEW7VRBjB08yYzWl0iy8ojWwxO0ipoN3xRH7zLPdzw5cQ8w+aN00Hb8kdYPf01vJ9a 0Up4V/k6jt2Q0jA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.20

for you to fetch changes up to 4b18a3ef2230e38439c9c3a0e3fa4a2b5edcc5cd:

  clk: samsung: gs101: add support for Display Process Unit (DPU) clocks (2026-01-17 20:30:38 +0100)

----------------------------------------------------------------
Samsung SoC clock drivers changes for v6.20

1. Add new clock controllers:
   - MFD for ExynosAutov920 SoC,
   - Display Process Unit (DPU) for Google GS101 SoC.

2. Implement automatic clock gating mode (HWACG) for Google GS101 SoC
   clock controllers (but also used on almost all modern Exynos SoC),
   opposed to currently used mode - manual mode.

Background on HW automatic clock gating from Peter Griffin in cover letter:

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

----------------------------------------------------------------
André Draszik (2):
      clk: samsung: avoid warning message on legacy Exynos (auto clock gating)
      clk: samsung: fix sysreg save/restore when PM is enabled for CMU

Krzysztof Kozlowski (1):
      Merge branch 'for-v6.20/dt-bindings-clk' into next/clk

Peter Griffin (7):
      dt-bindings: clock: google,gs101-clock: add samsung,sysreg property as required
      clk: samsung: Implement automatic clock gating mode for CMUs
      clk: samsung: gs101: Enable auto_clock_gate mode for each gs101 CMU
      dt-bindings: clock: google,gs101-clock: fix alphanumeric ordering
      dt-bindings: clock: google,gs101-clock: Add DPU clock management unit
      dt-bindings: samsung: exynos-sysreg: add gs101 dpu compatible
      clk: samsung: gs101: add support for Display Process Unit (DPU) clocks

Raghav Sharma (2):
      dt-bindings: clock: exynosautov920: add MFD clock definitions
      clk: samsung: exynosautov920: add clock support

 .../bindings/clock/google,gs101-clock.yaml         |  40 ++-
 .../clock/samsung,exynosautov920-clock.yaml        |  19 ++
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   2 +
 drivers/clk/samsung/clk-exynos-arm64.c             |  92 +++++-
 drivers/clk/samsung/clk-exynos4.c                  |  12 +-
 drivers/clk/samsung/clk-exynos4412-isp.c           |   4 +-
 drivers/clk/samsung/clk-exynos5250.c               |   2 +-
 drivers/clk/samsung/clk-exynos5420.c               |   4 +-
 drivers/clk/samsung/clk-exynosautov920.c           |  40 +++
 drivers/clk/samsung/clk-gs101.c                    | 338 +++++++++++++++++++++
 drivers/clk/samsung/clk-s3c64xx.c                  |   4 +-
 drivers/clk/samsung/clk-s5pv210.c                  |   2 +-
 drivers/clk/samsung/clk.c                          | 207 +++++++++++--
 drivers/clk/samsung/clk.h                          |  56 +++-
 include/dt-bindings/clock/google,gs101.h           |  36 +++
 include/dt-bindings/clock/samsung,exynosautov920.h |   4 +
 16 files changed, 812 insertions(+), 50 deletions(-)
