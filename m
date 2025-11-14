Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8360E31C597
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 14:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129823; cv=none; b=rFFtqHvRMXSLPeiUqdMn75KhYIsCSxxdBSEzQSja3cAAymo3xsNFyI7Oij9Cv5qKFZNkdG6NugajmmiT1/SxtBQGmCozF3+rY3E2JnSlolDk0ojIuhzHs+omilYNtI9pjZuR3FV2Lzn0VcYnrEQfQww2vA1WbnMLLfnTknkyN0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129823; c=relaxed/simple;
	bh=PtiusYFomlFJQqIy51+0ZGjb65BzpiYU3h/BnyVhrrc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qRf9xsI8buCu8/mIvbexCXb50FgfQaUYH55Px8NCxU0D7AztC+EDyqiuKNibu0IEo4K3V3D/Y8ituvDxefKqql+th5rOZ3lOFsX1QWAlCKyhnTcJa2SqX/r1rJftIA4tj36a4CArXcjY6lr/CSbLzqdjIguEgSRY17HDue00tuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLigBiZO; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLigBiZO"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3720e58eso1869322f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 06:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763129820; x=1763734620; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MusOjV15eqd+DunevkywFU1fjOENPwqnBUs/CeyN298=;
        b=XLigBiZONmRdZMlatv7DkThrQmKywk59RSrhrC81hWhhFU32xxsK9G1D7HrP6z3pKy
         NW+KVJI5FXHh2mi4C+r/r0VcAs83FZ9f2YCINykdMGjQbRm+qyOhfSBLbNtt2S9MweYu
         +U7sagxugVfUer3hv+6vOQ3BOcxprjlFNZ0qn9ShPfmoZTxWlswI7gBuz0/nj49SUSg0
         t6XmgRakL2Kq1vapSnEPhlBWjz6UEyN0tC0IfntBnmSLHpONGywG3gVw1aatKKA0rF5p
         zD1/KQiGrLtwEBlX989hxEt9tF89IMdw6ERixFWTJtY4aKSwsD0QKUTHQqM5cFYgm0Op
         5rdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129820; x=1763734620;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MusOjV15eqd+DunevkywFU1fjOENPwqnBUs/CeyN298=;
        b=X0oj2YPnpFT/7k4hM+4n4wV0TkqpK0+x47Ol4ElKyxB0mYQ2YE62Dd2sQRukY8YAX4
         7Sxc7gM75YNO7GwsGtgg3XSm+doEDqjbAqkWnYigs4FRu550Iclv32OO5M+SdE/Za/uQ
         G4Xu9vpPjC1/XbcfjzZfY+eg3aacFLnXh9+8BOUEwrEiKN+1noUW0ZQdpvOMCaQmx1PU
         YQ1dxs/zfoc4LJdcy3d5EIE0VgdvnSFxOLTrYu0IYspprDhPmZIDnycJ4RYfDymWErwn
         tzzFeGbLGTTQOVwFHKeXYpPFMBOeaA4TL5yo6bMV+Skmq7mPE51p/1pkM+/nsdqLV6Xq
         DR8g==
X-Forwarded-Encrypted: i=1; AJvYcCXfZnQ6bZSrC2Q7fOOcX38xiGf0ftK9a/81AhU35XBGLGTT44asK6PqNxoUtl1GF3us5UDwQ9DZ9tPEDTFyKUQdQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWtiohAt8zlTC+MJTvkMnVTyBwgAJfzhbmy9FpRRaOzAFoPads
	LakFAMDRNMtEU6mLblbcYqMf2rdFFQcrioSgEbgakzyjabNuwuctLoHzjpSeBvk5LKo=
X-Gm-Gg: ASbGnctPVDPtLcjOGpGkPZCdeynEWp00NfEjvVkjXWu83ugFpXzjYCayKZAwkh8b7cE
	C4hgx+hyujSaXXKJd780z1iwuGvT8ZmfBwdN6IiQHAteDxoFCcsu0v8VsRx91a96m18T6O0Ibrf
	ISLdcN+nbh8d0Hs82XNkRACBbbHK7nmNS8fQJ2MS85I6ly3OR9sne42aE5qAANqgRIg+JIb7Ep3
	iROPLYkcDccPtvPYcvfgZhJyh9eb3mjahj9pDRj17SdwqUZVMQV69G/h6ufNpQpa0VXsOHY4xwX
	CoPuwWjZiKO7wYU8KzUGaHtTf9a1f6qK8/VNob+zqz+43MJmrp3QE7ySY5JurxAeS9POV+ho3tJ
	qyRoNPqvSzXWnO6c6TaA+/bZ+4BpTRlK8Rbsd7YqmOsbTIt75krhb2wK2+pLBVX2DlyofeP5mb5
	9UYts7Rn64C75tzNuS74CcM4KwKHgxJw==
X-Google-Smtp-Source: AGHT+IE6lPC2ArPH0y3V1wrM8NgzWtwJMV1G/iavb2IWgQ7qatEUYaxhTgFriUNfbEJWAeBWDN/aOw==
X-Received: by 2002:a05:6000:2888:b0:42b:3978:157a with SMTP id ffacd0b85a97d-42b5937876fmr2947192f8f.39.1763129819719;
        Fri, 14 Nov 2025 06:16:59 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f21948sm10150958f8f.43.2025.11.14.06.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:16:59 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v5 0/4] Implement hardware automatic clock gating (HWACG)
 for gs101
Date: Fri, 14 Nov 2025 14:16:47 +0000
Message-Id: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM85F2kC/23NQQ6CMBCF4auYrq2ZTgGLK+9hXJQyxUalpkWiM
 dzdYkzEwPJ/yXzzYpGCo8h2qxcL1LvofJsiX6+YOem2Ie7q1AwBcwGguL53/qo7Z7i5eHOOHLN
 SVwXYAg2xdHYLZN3jQx6OqU8udj48Px96Ma5fTMg51gsOfIsqF0QAEmB/ca0OfuNDw0atx4mA5
 YKASbCK6lpqrBVWM0H+hEQsCHIUrADSlgph1EzIJoKABSFLgrJZUWJpc6i2f8IwDG9PpboHdwE
 AAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8621;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=PtiusYFomlFJQqIy51+0ZGjb65BzpiYU3h/BnyVhrrc=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFznTS0dynX3zzQ8DmGdtL8IhvPe3BaDcVKfs+
 E4hAYhuBHWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRc50wAKCRDO6LjWAjRy
 utvND/9MhUZcCGUqLThDGh3bwlZeQ3tcy5YJJuwAdOuQb+JsQCnjL93xRmdhK5FnmAB2tboogAS
 HKGSCIjAxijjIGCdec06VZTAjzJIuhNmkXYCbgLYgO0Uz09T/rOlk1ACf9DlJeaQHDNoOtlDMav
 w5RA3Dg5wS0E6gC6ub5Inm4LCJm/Cvf1uJxLASMukyIjjlzaA7QD3iZ9kK8sMKN/59dQbOpcv2Y
 C9f7NfCUS7TnhzQKcmWgchU4SO2L1yGNaY6a8wXny5gQ2xIws33y+zb3eSfOuM28n3RDk+b1ScA
 8MAqiAPmI1a+V4z4UMQ5P77cJHgQOe8tPTTVH+Wz+d2P0smyr5MeJIAMImfjYeZmoTw7ZpjMBzF
 SBQWN6MDay0yG1Onnj3QBKYb15Qp/IYjLZKluM+PQrw5PTPsJ+y4rsO821HXl5gSbvniZPk0XCL
 FzOdkY9G1JujsDXBJKyF8xaf18+E0+xXXKBBEtLhlOdmZ2vzg7B0Lyrzc6HW1B2Pnsm5StaMUaA
 zYcmsJnXZC1gtOt0t9Zcq6Lw5oQKoFOI9GQERoBwH3ms2+W4bhOW4XEvnNTcqgzIEgL8EyvLZXQ
 GZU5hLqVsjDti0mf98Wxg0oopkqAPNXAvE3W3qM0MtJOKLmSB79HOUX/A9+YSb1+orKn3Bxv5W5
 bWYoKpwuR7vHwTA==
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
base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
change-id: 20251008-automatic-clocks-249ab60f62ce

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

