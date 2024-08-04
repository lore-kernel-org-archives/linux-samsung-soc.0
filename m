Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE236FB9;
	Sun,  4 Aug 2024 21:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808505; cv=none; b=XKA8lw3qaVadWsWcuLWm4NggV62KxG7I9MiJ+45s6SpopYE7BR8Ag+18VqgYc2GwWBlBP08GAG7Xl42YlbXoZA4YCMp4Mmi+OJIgFp6uhd6J5Y8XTVGMb18ISer82sT3FwQCRdyTOGd03fuVj01Lqf+gtIOCJxUokPhHT7xaEWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808505; c=relaxed/simple;
	bh=Sv8L92lRXPZxB1CQr2pJAqtj0Hm1AQ9ja/a86LMewjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QmPgVNqpvvMoLZPW7QFApoLMWoLQmNL690MaslNkeRCChBU6R5GwgquiE6h0OuB6qDVjNbYJFKGSizenp7Xmyauo0DV+TBLkpQEf2RgVL7sNgOuccHv1BJm4P/zDiZqibi+4gHOzRm6oyzGA+TC7kfEqGoaQCafPXXOc9fbjERs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5mImu8i; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5mImu8i"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52fc4388a64so15700520e87.1;
        Sun, 04 Aug 2024 14:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722808502; x=1723413302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pCexiuddVYJqWOl0RZ40FcRzxOfCT1O1W+s5YZ9iMgc=;
        b=A5mImu8ivb5pqZ+6VGhYnCEFvjwzAYNQEVibF6hpwg/190t1D8cc2RgaoyboBRLH6m
         XsXAhY6jamfnIf9K453Kk5PHzGGj/IX2qrffWp/LRJ1SKPBkc66EgKN+5car4GgG9r8t
         SX0QNaLN8yoeu7sQkTKfjd/7lxnuygPaORFq6DPw1j6g2934tULTEErEVdeLYqURSdA2
         G2nzYnLCiGXMpaqR9k/pdjr+Fm5CFV3WaYfLQRqb7sguqGtkN+JAyIbN1CuNq+TFiiSH
         ujAFoE0RaJaFVXJ2tfls8EpuY4/kWnLkRvBLDHClgiRS89frMAFPaQHEU+JasoMj3Vn6
         DXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722808502; x=1723413302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCexiuddVYJqWOl0RZ40FcRzxOfCT1O1W+s5YZ9iMgc=;
        b=H7Ez2JVPG7V6nFOczQ3zx2lSHboZ9QYo1obvTTL2A52I2wjNOLiGdHA+jztgBq6GoO
         NUQRuVvJ0ovH/qYvUq9kTqFV+zUpAK5XzhfpnUhW6+jljbpVxmTOKLcLmXwhJcxmuVp8
         AjDoNmzs9NLL6UzyoUZGCPuDRUrN/caoYWKEqg7wYqdOhGxyMe87dHuKhlNKzp/yFlPu
         A1fa1bkD0HN+6tYAy0k8NxKLzA6keyHhmb7SWEM+3sEMSoSkPjoTl6E1+nc5NhSmtQEr
         IaBmhDhVaNjnXJC4G5IGb+C+KnkKgKdWKfaGa7hY6V542qwwhfI6SoNqe/hKsj4SZ9R+
         DHTw==
X-Forwarded-Encrypted: i=1; AJvYcCVfRiVsXyANTXlKi4aou2a99IZXVDqJJLoT5KuRCSCL1c6wfY0AUrRO8JFF2FV5qWnsY7+Oley2N54J7kWuaAldksd5OK9tgW5+vbrdMCWKg+GVOTUZbgmxTaEcxyw94PXpsOILxT0UwE33JDHsIwx2dR1zo1obD3Ur2USt3jhDvLDfU+F5JrbuxC+jxlUa8Iy6LWfvCD1vN9quuLZhl3j7oqJFAEVdNVmm4UihQHgy4FDNoR91kDsuXceebrYvMINf
X-Gm-Message-State: AOJu0Yy6ZvDIdfhLq4xbAge8SYH8C6ep1GeP19iX+UulseegHhFQdLK+
	SJh4vNqnR+6RycgBNgexqOpVAoPuTam7IMuhYtNkCvmJgHVZQe+2
X-Google-Smtp-Source: AGHT+IFCPz2n+bI1kGoQLioilhFkYLeYs33IRkQdvNgAiTf2rhaF9PMzLiX5ATzV7KlWpxZkXOFHHw==
X-Received: by 2002:a05:6512:3d04:b0:52e:9b15:1c60 with SMTP id 2adb3069b0e04-530bb3a5035mr7252667e87.48.1722808501427;
        Sun, 04 Aug 2024 14:55:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d45452sm370485066b.111.2024.08.04.14.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 14:55:01 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	David Virag <virag.david003@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 00/13] Add USB support to Exynos7885
Date: Sun,  4 Aug 2024 23:53:45 +0200
Message-ID: <20240804215458.404085-1-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set of patches adds support for USB on the Exynos7885 SoC.

The Exynos7885 has a DWC3 compatible USB controller and an Exynos USB
PHY that theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we do not support it.

While at it, since we need some new clocks implemented, also fix some
issues with the existing clock driver/bindings.

p.s.: Not realizing the USB PLL has a MUX on it made me waste I don't
even want to know how much time on troubleshooting why it's not
working...

David Virag (13):
  dt-bindings: clock: exynos7885: Fix duplicated binding
  dt-bindings: clock: exynos7885: Add CMU_TOP PLL MUX indices
  dt-bindings: clock: exynos7885: Add indices for USB clocks
  dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
  dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
  clk: samsung: exynos7885: Update CLKS_NR_FSYS after bindings fix
  clk: samsung: exynos7885: Add missing MUX clocks from PLLs in CMU_TOP
  clk: samsung: clk-pll: Add support for pll_1418x
  clk: samsung: exynos7885: Add USB related clocks to CMU_FSYS
  usb: dwc3: exynos: Add support for Exynos7885
  phy: exynos5-usbdrd: support Exynos7885 USB PHY
  arm64: dts: exynos: Enable USB in Exynos7885
  arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 +
 .../bindings/usb/samsung,exynos-dwc3.yaml     |  5 +-
 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 ++++
 arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 35 +++++++
 drivers/clk/samsung/clk-exynos7885.c          | 95 +++++++++++++++----
 drivers/clk/samsung/clk-pll.c                 | 20 +++-
 drivers/clk/samsung/clk-pll.h                 |  1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 21 ++++
 drivers/usb/dwc3/dwc3-exynos.c                |  3 +
 include/dt-bindings/clock/exynos7885.h        | 32 ++++---
 include/linux/soc/samsung/exynos-regs-pmu.h   |  3 +
 11 files changed, 201 insertions(+), 36 deletions(-)

-- 
2.46.0

