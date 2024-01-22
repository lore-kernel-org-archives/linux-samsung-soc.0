Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C343615E94
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 22:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705964250; cv=none; b=L7aGa2e+kZs6v4TmdovkIYzjj2tsRsKhXEx4v1NcIpVAkRYF6+x8gjVF/L+u6npCVl/a4F+/b+EaOabVUVJkTfSUiOhlCj7bJXaSlWbEwLBWEryDAA9RL2vyB3QE+cWvcyuZgxjH7Q/Q0V1Fm0gWpZsYbbNKYLeCcAH9hHXps4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705964250; c=relaxed/simple;
	bh=S/IPBO3UaHcQodIvhRi4kyTxwEOCeiKNGEaMLXlGWKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZXkLEWssQvHOWcsk2bKgFZ5WTzskq/i//0dx1u18hyPCXdgUA6rDhbbJ7EviTbZVENHM3qLOd4PkaMsMwibTGO/K36YNPu2gMjtaRln6YRMWV6txpcRPS0LsT01ywRb1Z4Y6IAeBod8fGbJxqDPNJjN77Tpqzng3NcbDuARx5kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NvuEnQim; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NvuEnQim"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40eb2f392f0so4345705e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 14:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705964246; x=1706569046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5hzZWqF+rVKmx3icOtLTiy0bZfp8YzrdXiqhu+TKNXo=;
        b=NvuEnQimGW3jb7PWnOkS9FC7ReC+KWYxU1pDqxWI0hCbI0ZAAF1btj2HN+lgb+z2UL
         EU9mKlLCBec2HVSsI/eWeEGyQB3f4IqWiWD+xoVNUz9nD2C2kaQPJbE0lVJs7sU2SLQh
         Kb8OuUdbMPbCp46AhV/WnX3hA3IwCCpahnMdYbVcosbSn3MT0eTVChIT7jT4umgsnx2Y
         1kjrjafEBLbtqWpApKuwFpPgZDZo0XZAUBJbJ6cQE2AgtR9Vst/qdPKtnjuvZNXv5H8j
         1FoiFIMWg3HP9yIyVu6VHydaLkvFtwIvWoYsuom9/g7iWNtRNriZB96Ri469R3sovuX5
         vvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705964246; x=1706569046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5hzZWqF+rVKmx3icOtLTiy0bZfp8YzrdXiqhu+TKNXo=;
        b=vfuEIsEv/IiWxotW0ol/wGYw+W/BXn8YaG9gfp4Geo+a1MKaHcf3gdQE9SfXtLAsy6
         usKxXb0OW+0WXe2TFv8N1i4B6pXb4zNKAuFlI+SVDxi/jZMBvirrrBQdDV8CUhC2ckfY
         IyF5a/rCiNzYWRZFuhVbt6LzPm3RX7HVn6tp2Evmi5YZJPQeqqKhXMYHRi4sXut2aK7z
         n6ScZQh77hC2RmaRDDDJrn3cW/S/xUFYbRV5AFNh//eMRH+tIqFtjPw05sUqZ3qtp6Wb
         H2hsEG5WDankSjF1m+4gdKETXtZ/SMFRjEgY1UKJRX/PzUedX5ARKxRASFB6iXa/U2x0
         ANAQ==
X-Gm-Message-State: AOJu0YxZTLWVPcHgL3EwpcmCLhoAChLrNvwwZxrGyrctDNH6UTgTAsiB
	gEBnuxDagWk6w3Tbjas0jZEFaW4ymonKgf/JkMc/eElxWamF+8jYqeK6mr0OCEk=
X-Google-Smtp-Source: AGHT+IF/qmmr1h6d7eEv8r/gTDNI7BfV7/Yg3i+zz/wcIAuj3ppcg/e8McB2NIBVtXJTpXDvPW492g==
X-Received: by 2002:a05:600c:a49:b0:40e:448a:91ff with SMTP id c9-20020a05600c0a4900b0040e448a91ffmr2758844wmq.168.1705964245898;
        Mon, 22 Jan 2024 14:57:25 -0800 (PST)
Received: from gpeter-l.lan (host-92-18-76-30.as13285.net. [92.18.76.30])
        by smtp.gmail.com with ESMTPSA id fa26-20020a05600c519a00b0040e89ff10f5sm19776847wmb.1.2024.01.22.14.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 14:57:25 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: arnd@arndb.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux@roeck-us.net,
	wim@linux-watchdog.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	jaewon02.kim@samsung.com,
	chanho61.park@samsung.com,
	semen.protsenko@linaro.org
Cc: kernel-team@android.com,
	peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-fsd@tesla.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/9]  Add exynos_pmu_update/read/write() APIs to exynos-pmu
Date: Mon, 22 Jan 2024 22:57:01 +0000
Message-ID: <20240122225710.1952066-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series adds 4 new exynos_pmu_update/read/write() APIs to the exynos-pmu
driver. The APIs are intended to be used by drivers that need to read and
write PMU registers on Exynos based SoCs.

Examples of such Exynos drivers are:
* watchdog
* usb phy
* mipi phy
* ufs phy

Currently upstream most drivers that require PMU register access have a phandle
to the pmu_system_controller in their dt node and obtain a regmap using the
syscon_regmap_lookup_by_phandle() API.

On newer Exynos SoCs this approach is insufficient, for the following reasons

1) Newer Exynos Socs have special set/clear bit hardware on PMU registers.
The intention is this should be used when the register can be accessed by
multiple masters. Support is added for this hw via the QUIRK_HAS_ATOMIC_BITSETHW
and is implemented in exynos_pmu_set_bit_atomic() function.

2) On some SoCs the PMU registers can only be written from secure state (el3).
As Linux needs to write some of these registers a SMC read/write interface
is provided in the secure monitor, and the register offset is checked against
an allowlist. This is done for security hardenning reasons so that normal world
can't tamper with the power to root of trust IPs. Support for this is added
via QUIRK_PMU_ALIVE_WRITE_SEC. This SMC interface is known to be implemented on
gs101 and derivative based SoCs firmware.

The above (2) is a similar mechanism to what drivers/soc/tegra/pmc.c is
providing for it's SoCs where PMC registers can only be accessed from secure
state on some SoCs.

As an example of a consumer of these APIs I have updated the s3c2410_wdt
watchdog driver to use these new exynos_pmu_*() APIs. As the
samsung,syscon-phandle logic has been removed from the s3c2410_wdt.c driver
I have also updated the bindings documentation to mark this as deprecated, and
updated all existing platforms DT to remove samsung,syscon-phandle from the
Watchdog DT node. Please let me know if there is alternative process I should
follow with regards to to deprecating this and updating existing platforms.

This series has been tested on Pixel 6 / gs101. If the various maintainers/
contributors of fsd, exynos850, exynosautov9 etc can test these patches on
your respective systems that would also be most appreciated!

The expectation is this series would be merged via Krzysztofs Samsung Exynos
tree.

Many thanks,

Peter.

Peter Griffin (9):
  dt-bindings: watchdog: samsung-wdt: deprecate samsung,syscon-phandle
  soc: samsung: exynos-pmu: Add exynos_pmu_update/read/write APIs and
    SoC quirks
  watchdog: s3c2410_wdt: update to use new exynos_pmu_*() apis
  arm64: dts: fsd: remove deprecated samsung,syscon-phandle
  arm64: dts: exynosautov9: remove deprecated samsung,syscon-phandle
  arm64: dts: exynos850: remove deprecated samsung,syscon-phandle
  arm64: dts: exynos7: remove deprecated samsung,syscon-phandle
  ARM: dts: samsung: exynos4: remove deprecated samsung,syscon-phandle
  ARM: dts: exynos5250: remove deprecated samsung,syscon-phandle

 .../bindings/watchdog/samsung-wdt.yaml        |  15 +-
 arch/arm/boot/dts/samsung/exynos4x12.dtsi     |   1 -
 arch/arm/boot/dts/samsung/exynos5250.dtsi     |   1 -
 arch/arm64/boot/dts/exynos/exynos7.dtsi       |   1 -
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   2 -
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |   2 -
 arch/arm64/boot/dts/tesla/fsd.dtsi            |   3 -
 drivers/soc/samsung/exynos-pmu.c              | 209 +++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h              |   4 +
 drivers/watchdog/Kconfig                      |   1 +
 drivers/watchdog/s3c2410_wdt.c                |  25 +--
 include/linux/soc/samsung/exynos-pmu.h        |  28 +++
 12 files changed, 245 insertions(+), 47 deletions(-)

-- 
2.43.0.429.g432eaa2c6b-goog

