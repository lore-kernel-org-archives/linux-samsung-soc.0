Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D6130ACE7
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Sep 2025 13:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757337183; cv=none; b=IisWlYN67LNLFryrXnGqNRI0LlVunTeRKBJ3V+SIUDZ+tt6qkLU7QhhW/0Q6iU3ThXTJtX/gMEjh8giJAQfr91iiGoyH/aG6/nmwbVnxNqTOgM7WODa+aL+RSwaOki8ryPjSnX5WKMP69aoC6riZrOEd3Io09sCKybQegITOnjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757337183; c=relaxed/simple;
	bh=k/rYEqvoUHmQsSFnRWJthGrqkooxPs75rw/T6s9nl2c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rq/OktrFJuSzTXF0dGh1IoLJmAXd+7XSWe4L2/xiIVamzrQrv2AltqdUeZGUhhMl6GO1m1GKi8WpVA5Wn5YxeFs31ktmbmfytIzTJ19T4uJB2xaKdJz3NU1J71RA3sWsm7Zd46SbDjoB9RohqVUSzf9I5ySgfZ0uMemyc6SeJ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SfxK/VBK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SfxK/VBK"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3e07ffffb87so2023189f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Sep 2025 06:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757337179; x=1757941979; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=euNzNi2+8hGcblKlx8oKoI+4PgNfizE50VEjZnuwFB4=;
        b=SfxK/VBK52yTBIPVmbLDgxebshnhN44UPTUIxChmJxcVX0XCINwhwbGbTpcff3jmX6
         lKC6x8Vx+7fI/IUH/8dBA83Bf+4bORjnNLgnNHOSNwPkQj67LGRbN9fJJ3nyxlJkAMGV
         /qG1eqpIgE4jqVbggdo0H/PZ66eFnpcFRa2FIeWGkVSdCLTEjvD6JIoqaqn9qKduAmZQ
         dRHXt/l0A4xPzb6NPAAw+o81Zo8g7O7th46H6SyXIT+bllMn/VrMITIyTEOwKEQBjdUa
         5BAnt5KFezhQP8HVqxkDsgwOayVxTW9gw+mWbreEHmpEeUpYT0rrgJzY/wmP8MvWU/Pr
         opXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757337179; x=1757941979;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euNzNi2+8hGcblKlx8oKoI+4PgNfizE50VEjZnuwFB4=;
        b=R2w5McUrNX5AAL0eUMrYT2ubpGQ07LB4s1buYIK6TpFs/mbRrw3WJ7A5NAnCGRNPJn
         zBaWYOzGSlB5/Jrlp2cuzQ+geUCza5W1XgXOWCQpgKJxnwiP79UrSZ+TjIXbJZMEJq6Z
         syvEjWuHxBypLZP5uVskItOLWnhYwJXVgNwwQJ7EHQsfji9c0ob598OdUffO+u4a38Q4
         R5VXMFPQJrSwmgVRraYAK/YGkz8pkX8p/E1VtAJUInwzaTi+Bl47RwavMCVMs7xQnt85
         DrXGz1uWmB8k7nXHaTyG66lhhhJvBIckhcgEyGQbifAsd3vOUv1RuaDsTdRQ/cBXvgnZ
         TUBg==
X-Forwarded-Encrypted: i=1; AJvYcCVxkDJXYTBtoXzu+CgQqapwtvcMEPxkuNV6ccsRZgU0GKe/lsOx4VjipukyDt103wwcrelxe87lTJ4Cv+GMABI/yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkhzYW6i4LddfYVq5DhhaJ7qWRXXVXGkskodyJYq52K1/111S7
	1L8WOczbxvmPJDuxkqkYfxAUqXq3LqBQJX0i9dlKo5ruqlWuYQZwEw9JXb4dopS39j2+tUuk+3W
	9iiZD
X-Gm-Gg: ASbGncsOIKmKbXcpY7QTG262QX/pThdzzHG0sE3/uN87+tfGoj0NnZ+YpHKlN/xbEbk
	Mg2+Smd5hnCj5wOVnKxt7aE5KBPmEldC5uHXRQwOA/voCWLAR4b/LN3IXFqnH7vWBoC5FEowqPc
	dvcJ5QQN/FH2JMCgi+cKCqM4KHSHq4pd9gva/Ee5trN2kBaVJDso+i+MQtKX7+jo6E3eQ6FEX3/
	w0b7BvSjSboZV00zEcuOvpFC/dpA3pytBQKztImpbZunnnmSo2neX9PDSCPwHpa9bbxTEbUXjlH
	V5n+mhlhUN79YrWqh5gNiiNBUEwHl98fub4ynnCX9NUGQtgO86UHws1GwoWQproo29ALA0i7sK/
	scYmR2ytcKniwXlB2GdsqXX/IJrmhh4nPrU7oLlLFzPP7UD0mi2m/ThlnENsFGGbTRBx7D/LA8v
	ttgyyUnwCx/HVzTHLrH/o1hhM=
X-Google-Smtp-Source: AGHT+IHYOeXJ7kL2S1pO2C07X8d64bw/OMH9vgtjnahGnxt7HgXXYrfjcsnaLr8FftHR7cKUZ3vsRg==
X-Received: by 2002:a05:6000:200c:b0:3e2:2dd3:f9d6 with SMTP id ffacd0b85a97d-3e64ca780d5mr6256069f8f.55.1757337179163;
        Mon, 08 Sep 2025 06:12:59 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fb9dbfsm41650181f8f.43.2025.09.08.06.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:12:58 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 0/5] exynos-acpm: add DVFS protocol and clock driver
Date: Mon, 08 Sep 2025 13:12:41 +0000
Message-Id: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEnWvmgC/23NSQ7CIBiG4as0rMUwlcGV9zAumGyJWhowRNP07
 tJurNHl94fnZQLZp+AzODQTSL6EHOJQB9s1wPZ66DwMrm5AEGmRxApqO96hvV0hkY5oIT2iSID
 6fEz+Ep5r6nSuuw/5EdNrLRe8XP9ECoYIcmOcEkwwLvDxFgad4j6mDiyVQjaSiI0kVTrfWskNU
 4azH0k/UiG6kXT5s/XWMeKktOJLzvP8BlhmPf8VAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757337178; l=4646;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=k/rYEqvoUHmQsSFnRWJthGrqkooxPs75rw/T6s9nl2c=;
 b=MBibO8bOauSF0KxVN1B/clJFWfdF+BQrGCfYfDTCMuR36/9gpDIQ6z5kikA8VEdpKxlYF/Uj3
 dvJ6kP/+SsuAEDD9ACTWR6NVwsGr5VVhx6/RvgiYGs/oe2cYiPwc380
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Dependencies description:
All patches should go through the Samsung SoC tree.
The acpm-clk driver (#4) depends on the ACPM DVFS ops (#2).
If the clock subsystem needs to merge the new clock driver, it will
need an immutable tag with the 2 patches.
No dependecies for #1, #3, #5.

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
 drivers/clk/samsung/clk-acpm.c                     | 184 +++++++++++++++++++++
 drivers/firmware/samsung/Makefile                  |   4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  83 ++++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |  21 +++
 drivers/firmware/samsung/exynos-acpm.c             |  26 +++
 include/dt-bindings/clock/google,gs101-acpm.h      |  26 +++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  10 ++
 11 files changed, 376 insertions(+), 1 deletion(-)
---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250819-acpm-clk-28d2a78e0307

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

