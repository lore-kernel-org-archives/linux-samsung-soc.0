Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E846F30BB87
	for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2025 15:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726672; cv=none; b=UoWm8FenQaJrTaxAuWtXcXjOvVPj5lKO5/s+2sOUcpUheajBwaYyioaIPufiaUpigPa3Y+BsoZlpyouKnh3J/rbazo26ao1V87DGzUeKW8S+tY6T+MowLuNMUQAa+A5P365hJzONUtoSDAG4be3VLwpiw9YYYd1O0lvg1q/wjaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726672; c=relaxed/simple;
	bh=cwMIlE3GkPC64JAJSB4aokfZYWK2EOhyiJo/gkpirXM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YjK6qWCq0zpVdgxKM1XhI/sPLFkO8gBasC/3Ctv+9w7TwpInwSlEMQosXm3wgliyDVifRjFqZTZd472bsjOelCrtdt3zL5yYCbs3/rSfP79Vb7kuTJ6+qInUKbGlWThpff10wLF3yQpVTbT0FlnnhS6LnOeUQsIV4edil3ufL0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o7Op/i5U; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o7Op/i5U"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e30ef74b0so2921455e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2025 08:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758726669; x=1759331469; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KggF4AzFkPnQi9cWSb9T0cD1sb2eqqa5TYT3EEF8Bgw=;
        b=o7Op/i5UbzGGizZHj8q/RMVmRMyjU2fetxesZzqY3+8HXnRvkw0fXBBEjqV1cr41F8
         psILv+tGxK4/vSSvD8VT/MZZkL1CdZPIV49REPl58GrbjhQJsZZqrgCu5jfavbqefRmQ
         /fHvmasfY1MaHhW6YkSu1cSiFX/tUnax202L/L+1sx24/tltKh8NEx81BCMUKAhiZRhW
         rZjoH9JFg8pMMolgV8zqCJ8nyZLNqS0TT9uJweOVlTerqX1AfHHeJyVDimYjNdrAJWfq
         JZE289GeDjMh5RcRnbzuOV+BQ0il+WO/OcQCoLiPuAJ2XIOuzfDpcI3ewmDZQo5vkrPL
         eFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726669; x=1759331469;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KggF4AzFkPnQi9cWSb9T0cD1sb2eqqa5TYT3EEF8Bgw=;
        b=B8e+eEvL1cpurSBfd7y8sQ+fDmkpwT2t/2rP+sZYmwG0X8B/EUZNNEuZc/Vq1aK5va
         SufRnTOgCCm+lHDrdXzXfNP00HoDdHczsUNb4RhkdTWv8CVoGFXCO0oY+nX0CTSvgxMS
         TbqQPbrHdbdlA2arotcT+zNaJRfG1SbD24DWIUcQcZtTDMjoS8JS4r1YAcQQxNkQs/ss
         jiJUdP8xUQftqm/w1akcchDCikfPmEzuJ2b9dkKmJLlqF0toW9vE/LXXJuS8wLro9JLb
         9Ykk3iUdng0OUvCndTP+Y8N/nTmfsRClRf6aa9LrQoOwpJuyRmgXNj8KjnYRp+LO6pv1
         y3SA==
X-Forwarded-Encrypted: i=1; AJvYcCW3G0t1BFVbf1rwf95Om0TTqwyA/G/rXsU+Sk2uPs+PZC7/3Y7Jp8HCpVJD7saSs5WXUXOI2HhHdzt9XIlZKpk9PA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw5AS/bjCes9QOKUcYp2c6J+Vw1VxOTDfF82+yWWqW0L28K0Yl
	qw5u9IZ79dIEU6QK6KpV4CasuGWgaT4ZFvzrVkIqylxr4Frgq47UEcatKYLhVKqYvls=
X-Gm-Gg: ASbGncvaerznUWHd11DACGii0Ca+sRxkKnnwztjdCLwNtqiw5ixSv8iZfJT0YzXzRIS
	TvPysO9ox1c9jiVKifDX/bYF0hz0S76O0DIVpEfceco8iDtDr+AgiuvNzV8FWTyMFOujadK20y6
	cGOlaFQkqdrmMOLScOvD03B6lgGbk06me73EWWvPegoFEn7UX1wLWjDjcXqmnx3MaTgtRWv3NFH
	hwL+kuz4TxDEJOum/brsyqQIkvqw3w43rE4V0AoTFXScwiN6qUQOJB6ZUl27LsjTR3UqWqvzGme
	gJ48Igf3HnOd5ZWw7S6t16dQqiNWDBUkBiKB9WBHJvkegssV/PC553GWAQtyc+cJKN8NrvsU2we
	NjUfxFrRHlGbuPgWEp1rug4UFvO483GAwAGCoVnOh/dKO84222Fynodg9A1mWRxE7UanAlsaGZR
	w=
X-Google-Smtp-Source: AGHT+IHGeGSg7hWYaClMwyJxTZdmSKbwm2O/TRWj6tWRYvpwU8Qj5GI4vawvnTrp+TRppDIVHbfFJQ==
X-Received: by 2002:a05:600c:3586:b0:46e:2079:f50 with SMTP id 5b1f17b1804b1-46e329f8180mr2184925e9.20.1758726669193;
        Wed, 24 Sep 2025 08:11:09 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a7c8531sm36045145e9.0.2025.09.24.08.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:11:08 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 0/5] exynos-acpm: add DVFS protocol and clock driver
Date: Wed, 24 Sep 2025 15:10:59 +0000
Message-Id: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAQK1GgC/23Oyw7CIBAF0F9pWIvhWagr/8O4KA9bYi0NmEbT9
 N+FbsTUsLpkzp1ZQLTB2QhO1QKCnV10fkyBHyqg+3bsLHQmZUAQ4UjiBrZ6ekA93CGRhrRCWkS
 RAGl8CvbmXlvV5Zpy7+LTh/fWPOP8+6dkxhDBWinTCCZYLfB5cGMb/NGHDuSWmRSSiEKSJI3lW
 taKNapmO0m/skG0kDTv5FYbRoyUWuwkK6UsJMuSUsqRTk/9Xruu6wfOFp2ATwEAAA==
X-Change-ID: 20250819-acpm-clk-28d2a78e0307
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726667; l=5145;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=cwMIlE3GkPC64JAJSB4aokfZYWK2EOhyiJo/gkpirXM=;
 b=JswpE2Fv9zQL+B0aWcWNPjlcR8GXvjFyMyJtyOMkhrL+FjesIZla+MV0mvbJLlPGWWLWAITHj
 dKeYFRzgUIsA+PiGYjWz7mNesCsEIUXC9A6yUTQUjXDhfEuPl/UzWPN
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Dependencies description:
All patches should go through the Samsung SoC tree.
The acpm-clk driver (#4) depends on the ACPM DVFS ops (#2).
If the clock subsystem needs to merge the new clock driver, it will
need an immutable tag with the 2 patches.
No dependecies for #1, #3, #5 here. The DT patches that will follow will
depend on the bindings from #1.

The Alive CLock and Power Manager (ACPM) firmware exposes clocks that
are variable and index based. These clocks don't provide an entire range
of values between the limits but only discrete points within the range.
The firmware also manages the voltage scaling appropriately with the
clock scaling. Make the ACPM node a clock provider.

Add support for the ACPM DVFS protocol. It translates clock frequency
requests to messages that can be interpreted by the ACPM firmware.
Add an ACPM clock driver to model the clocks exposed by the ACPM firmware.

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v5:
- acpm-clk: address Stephen's comments:
  - drop of.h unused include, add devres/devres.h and container_of.h
    to avoid implicit includes.
  - r/acpm_clk_ops_init/acpm_clk_register.
  - remove period from error messages, drop comma after sentinel in
    platform_device_id.
- collect Peter's R-b and T-b tags.
- Link to v4: https://lore.kernel.org/r/20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org

Changes in v4:
- clk-acpm:
  - remove GS101_ACPM_CLK_ID type handling. Dead code, it should be
    introduced with next devices.
  - remove runtime check on clock IDs. Instead add a comment about the
    assumptions the code is making: the clock IDs start from zero, are
    sequential and do not have gaps. Slight changes based on this
    assumption: s/hws[id]/hws[i], remove the inclusion of
    dt-bindings/clock/google,gs101-acpm.h and the use of the clock IDs.
    The clocks are defined solely by name in the driver.
- move firmware patches close to each other, in between the bindings and
  the clock driver
- update the description of dependencies in the cover letter.
- Link to v3: https://lore.kernel.org/r/20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org

Changes in v3:
- dt-bindings:
  - move clock bindings to a new bindings header
  - update commit's subject, s/add #clock-cells/add ACPM clocks.
    It also suggests that the bindings are added.
  - prepend "GS101_" on clocks binding name. The bindings name are the
    same for GS201 and the acpm-clk driver will likely include both.
  - collect Rob's R-b
- clk-acpm:
  - move clock definitions here instead of keeping them into the
    ACPM protocol driver
  - use platform_driver.id_table to differentiate device type
  - fix Kconfig dependency, || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
  - update commit subject, s/dev/pdev
- exynos-acpm:
  - move clock definitions to clk-acpm
  - use devm-action to unregister clk-acpm platform device
- Link to v2: https://lore.kernel.org/r/20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org

Changes in v2:
- dt-bindings: clocks are not longer a child of ACPM protocol. Instead
  make Alive Clock and Power Manager (ACPM) node a clock provider.
  Update commit message.
- firmware: exynos-acpm: register by hand the ACPM clocks dev (new
  patch)
- firmware: exynos-acpm: use defines intead of enum
- acpm-clk:
  - switch to determine_rate
  - drop __init, __refdata, __initconst, this is a module, we need those
    methods and data, after boot as well.
  - fix the assumption that the clocks are defined by ID in ascending order.
    There's still an assumption that the clk_id < nr_clks, but this is
    now covered by a sanity check in the clock driver.
- arm64: defconfig: enable Exynos ACPM clocks (add patch together with
  this patch set) 
- Link to v1: https://lore.kernel.org/r/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org

---
Tudor Ambarus (5):
      dt-bindings: firmware: google,gs101-acpm-ipc: add ACPM clocks
      firmware: exynos-acpm: add DVFS protocol
      firmware: exynos-acpm: register ACPM clocks pdev
      clk: samsung: add Exynos ACPM clock driver
      arm64: defconfig: enable Exynos ACPM clocks

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  11 ++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/samsung/Kconfig                        |  10 ++
 drivers/clk/samsung/Makefile                       |   1 +
 drivers/clk/samsung/clk-acpm.c                     | 185 +++++++++++++++++++++
 drivers/firmware/samsung/Makefile                  |   4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  83 +++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |  21 +++
 drivers/firmware/samsung/exynos-acpm.c             |  26 +++
 include/dt-bindings/clock/google,gs101-acpm.h      |  26 +++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  10 ++
 11 files changed, 377 insertions(+), 1 deletion(-)
---
base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
change-id: 20250819-acpm-clk-28d2a78e0307

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

