Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CD531282C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 14:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762784518; cv=none; b=QrApLgG0nq+AySUnDnYxJVqfnduN5L7aixBOVkJXoE3gPKdvTfa0zN2XCoSdEXOuRTcuB3BBwyxTWXW5vLBhS+amErABdOO/ASfxgcL0xbcUYp4aO5tey0l8rtJw3/rrTk5JEKBXCZ5vfXux3XPN3mxIuuHMyCIj72M/OGiUufE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762784518; c=relaxed/simple;
	bh=1QhIhqeBqQFJYxh6dF7YY7QSMlj8SKS5YCmCkuRGJLQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FsERCRouXsqbQ7OEsEKWzSCc6RbOsas8Gv3YzWFFshW36ujEfj+0JDiWXQFBqoOdOpng6IxHabNCncm3VGv+SRlhrQvSN+EmEVmExQaPCnCVWnNKBJkjenovZ3igt7xmbSfxIaXYR38ftWBW4PcGt1AylDuRzv37pUA0hRUqep4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ubmfBkKV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ubmfBkKV"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47728f914a4so18092855e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 06:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762784511; x=1763389311; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QE6nJY8xw+e7wdi1yqVQH04Dj6slEaMZwmLP+N2iawc=;
        b=ubmfBkKVVHxsaHxVJSFSZWBkta3aZtO42bqwlixvMjEVeKMbzFxBG4xXL67AuEBjQa
         FQ7Bc9405O7uKPxWkKMMtPP7jrD9Ad8j31UVuc/mkBnxppQhv9H6lg0wHags4w1HIhlu
         48OYAkPGujBbhYigP4Sl5qTvJiUD/STWfmALRw49tPkzPbPR30oGafzLgci7Yo1rc8k/
         TdxsTGFDayEEHZU10qjm76DPw1JfwcfbuiFTDBLksIkXLAL76MP2BEwW0VIejO0JPU0J
         iTV/zRJPmQLWD1X5927cfr7fKzh/wT7m8y8LXx9b+UeqSTh8UtVqXJR+HuER0L7QvFZF
         74oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762784511; x=1763389311;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QE6nJY8xw+e7wdi1yqVQH04Dj6slEaMZwmLP+N2iawc=;
        b=TdSAe/iLhMsojJ4GOth+/nI49yRilu9J5FbKQxdmrC+mzC923xZChzBJD4w6lOVeSd
         hoB7YWm7t6r6TrxlG5bB2i4pRMoSiIWFvgQ+1jgo+1jVBNyC8OytbY4s9jV6l0wXGCrc
         +2bIhZbaoxgbRV0W7aWPy28sY72aumwbhdmj7WLkPO1YLMZ5Lz6EX1+zuUgzaKY471mR
         FMYhqDI/biGJz23vqG58TEdeLO03m980ABGhKIjCyVQxcR+0Pv4ZVXgiUA+bCH6zC8P9
         FBPO9iPyLGjvmNyBspM0BhqTwIK19FQsyuJ/Ifk+a8tTTmHQcDndutnwNOvksnq3T6jS
         x05Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQokXGwdz62UntaYaj3owULpDzSHWIh5/99FtFf2f6rPjA6sHw0Ps1OOtgKRQaWFMv5tBgX5nCk7ljHeW2Jf4Ujw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAh0/Px/Zy/31MImmYSo4Jw5EKivZXdrPAxa+6hKyLuZ+UcRHN
	/eUBGLQu5jAFZiUp1xHx7dosztmvDiJkcjx1O+gaF6R4k4OpSYU2tPYHXHJGXV+pIp5uSt0MG7e
	JEOI+JaY=
X-Gm-Gg: ASbGncunH2Y950NJixLrBXURDRT0DFtnJokMM3zHr9wsOYajJr2CbSBHTVscS77Ot2n
	agI39p37VVsOAameX7HjfxNNrMlLSnCFecp7jF8FqFQ4LlVwynjlAExrpqsLDIOsFVCruGbAc07
	fgMemEliBroFBNV2efmio7pTX0VKA2i0hvKuJ6AUoDRSdStm6ymvPbANANrv0Fh7kZpH7VN1tCC
	JUwvy2AjYzmQ8Qei8tEoK+C1g3wENY8XdD2Jgy3fSzrKEWtnHhg7H04bQM2+vDyTGasURhJbtNF
	oOaR0LpK8Bn850nYnLD0sjRBARyyApzES21B6HiTIyJHTN8qajlBdlJUAKRs74Y2Kirae1kYcL7
	ps5seTVS0Xws65xi68cd0s6Q4UdAG5GWHypasXECG50AIf9UHcz1U5ScP8b76Yq0zhpnWPOlrja
	zx7bcYJ76BIc/qch97iFSAWz3Cdqxu6jRJJmtSPB3w
X-Google-Smtp-Source: AGHT+IGfk9QMxpL095oW4l5k6kRJuvwmjzGuGYReI0aPwMTL0wEuahVhkwUYnhLSGwtqashoUergpQ==
X-Received: by 2002:a05:600c:3ba0:b0:477:7c7d:d9b7 with SMTP id 5b1f17b1804b1-4777c7ddabdmr41626065e9.33.1762784511044;
        Mon, 10 Nov 2025 06:21:51 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776a953414sm104369435e9.0.2025.11.10.06.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 06:21:49 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v4 0/4] Implement hardware automatic clock gating (HWACG)
 for gs101
Date: Mon, 10 Nov 2025 14:21:39 +0000
Message-Id: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPT0EWkC/23NQQ6CMBCF4auQrq2ZThGLK+9hXNQyhUakpkWiI
 dzdYkzUyPJ/yXwzskjBUWS7bGSBBhed71Lkq4yZRnc1cVelZgi4EQCK61vvL7p3hpvWm3PkmJf
 6VIAt0BBLZ9dA1t1f5OGYunGx9+Hx+jCIeX1jQv5jg+DAt6g2gghAAuxb1+ng1z7UbNYG/BKwX
 BAwCVZRVUmNlcLTnyA/QiIWBDkLVgBpS4Uw6keYpukJeWbW6jUBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8439;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=1QhIhqeBqQFJYxh6dF7YY7QSMlj8SKS5YCmCkuRGJLQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpEfT3FR66ljDUvk6K8V775A3mKTEytO6XuqxbU
 8A8C5svrOOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRH09wAKCRDO6LjWAjRy
 ut8zD/9/sMa93EIgJIRBXunfQvBYFUn0ARq8Y2T7or0OJHTzkDv24QZQKThoiPT2sVRMiWxYg2L
 6c9XYCYRDAKcEeIv4pdvYOSAZXSgpfFdiUdhgNNMljleAsB5qyf8HyrP111W/RxaMH3GUe8m6nK
 34oohUWK7nVmfjuXzTfe5VQY4ETqdk5CmKfv+8EjVDxoOkUu6SaVMmNfhnHz/+T58Mw6fhRuBks
 yy9zfUXWhu+Zzq4eMnl6OlDA3Yd9sEX1i6D0MTpr8bC5hww4pQClv+fZW7Fif7nQJWmMgFYxGXk
 WxqGi4zfxxMAOvuN0OwBCu66IDIM8avY1V/vTkTUG5Q70CiSBbkO+bW8nnSJ7Pgwxl+6f+UG7K0
 99FSltis+c+AUJWxd8wHDnUK1iEatIQ2VnP9yCRWUCThZzDsUWhP4C3TJOjP6wjUo8R728yP6QI
 HwLQqPsvzZkUIOV/vn4E13HTk928iL3dx6sNE30uBx84FKvUVyGlKRBVKkyfVNf3rtaHuiXvocZ
 VdKDI2CIW67iUr9oce4FFDw91/rmmSqoAmnKBbbqken88aDfgJk4SN+P+hjI/oRbioasucktie0
 d+a22ZAlw9C7kFurZUISXmEVUAooJynkstVqQTSHP6MYvC1NO581o+MtbXwYAu2wlo3v/eOcqmM
 IgxDPFN2lJvMQQw==
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

 .../bindings/clock/google,gs101-clock.yaml         |  23 ++-
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
 12 files changed, 385 insertions(+), 44 deletions(-)
---
base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
change-id: 20251008-automatic-clocks-249ab60f62ce

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

