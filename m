Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9342D8DCF
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763660221; cv=none; b=d3PlqV/MbcKu81JFOE8CWl6AETQyuUCavXMzKYZrl0t6tHGvrXXn/kIrXsunikcxMIZJR6Qa+WWDCM6yz5V3iwTcOd75ckwjPQ8TImUisW0lj+H0lGdrzquoeGPPmwnWT152yUUMxvEH3MyKjDK7WrlJKlc2IVlJsC8b1x1VZaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763660221; c=relaxed/simple;
	bh=gsS3QINB3jX+ZRH8cuZXIVubPgqbPwUz2dBtzJJwyyE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ogTvEUp6HEZGWpxEhLuWCQYH17vurwfd7v2HZotWlPEzqHxzyiBUeMF+7fqAmYjJFnOnsN5/f6f7vwN1iM7T9WRcevy/wOV3GRquFcyFY2bQhlH2DKicYsaV4HtHj4c8P6PxmjcVPhQDeeMbnXAU2GQ2rspjhY7pXlxXpTHMnHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v6tJGbhq; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v6tJGbhq"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7b9208e1976so2703950b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 09:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763660218; x=1764265018; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OFhpJKIcqes9gFcy7I+3pvbyB0hH/HnYmueMzCw4SP4=;
        b=v6tJGbhqSiRAzrde4rIzzsrTgR1V942AF2QfbVnjPVpeVCgfsI/1eYF0GHCU2rDBId
         KaL2y/ZFXLsLoDs+RqL4YD33ZhFW4KSi5s4SZ1d5NeA2SOG5o1OHhThXNHIwZXdgx4oi
         gZUQhP749JpC6ZFW0Ch2phqxOxfh2+2oOda2CnpkotVeudP6aE9KP82CjpizWr8Mo/EC
         gfy6Ym0TNsZBBPoc1hmC1ziTWpv6La4Um7fBMRNYqDmkgYhduFXbXoiN0BUJu76pV0B8
         IKEShl2pv6h3/xr2YLufVBEMqB9t9s/nRbREHaUFiMPRaGPYEafadDEYGZD7qTwBZbFH
         ejUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763660218; x=1764265018;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OFhpJKIcqes9gFcy7I+3pvbyB0hH/HnYmueMzCw4SP4=;
        b=JGGQWAJIABP5gfj+DrKj6iWzMMbeWSeW6KprJhItGH+i+f3RcCuXebVj9ReeDzYsu1
         RomQnVLbmA3+6gy/tEJdRJB6Qd9oUPdmfkSIlrGkGTc9m5su+Dx5adc3yFGOhW3Whsy2
         n3pbyyq2UmJe8nbJcnRCKAblzxsX9cZDWf26VbN0eiF1zy4O7qxSXuZI5flDGSqsBBEg
         cqf1jQWMWA4HwYK2+fGvOhB611YoL4qCK9NqScGepKGb/XbcNnboKh9QakGCs9n52tyu
         1xoLCxU57lO7KmGBcX4qxTeAFvzATLqRGaY1Cx2DTphkisNkJHKM8dlYgMBRkFxFTmse
         gXjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX43oWZFGN5EqF5CxSUC87l40KXoNejoiJUxg7TU9EF+VbW+FgHKDEqBqhfcN6COBs5Qrle1wQeB/sFtAfdd9tGHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvDZfaiuK9wZlYwjfvDjyuSCM+PWyaL7jEX8+zu7Kb0KoVBg5S
	iX2IJOu/cY5rdmW1PdRSA8CFmnzTAdyrwO6AzaMqoDJudnHXZ+UqbH4/uVKcqoMEL7hSTvpffyB
	nyLUIiQ==
X-Google-Smtp-Source: AGHT+IGFo+p0WlPj9Paobaw5vUvwfOFWPwB1dL40zeiXpe02+C7tIF6tiC3OF+S8WBQ3crxEOzfqU3kVKtU=
X-Received: from dlbrs12.prod.google.com ([2002:a05:7022:f68c:b0:11b:d4a7:e833])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b902:b0:119:e56b:9590
 with SMTP id a92af1059eb24-11c9478ab64mr1112164c88.21.1763660218304; Thu, 20
 Nov 2025 09:36:58 -0800 (PST)
Date: Thu, 20 Nov 2025 17:36:40 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKhRH2kC/0XMQQ6CMBCF4auQWVvSmRYIrryHcYF1gCbAkKkaC
 eHuNm5cfsn/3g6JNXKCc7GD8jumKEtGfSogjN0ysImPbCBLFSK2Zh23uzfE1nVN8L4NHnK7Kvf x8/u53rJ7ldk8R+Xuv7bUEnrrqHTYVFSjQaOyTS+5DCLDxGWQGY7jC6IpaBWUAAAA
X-Change-Id: 20251119-phyb4-2e03a7c449c4
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763660216; l=4218;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=gsS3QINB3jX+ZRH8cuZXIVubPgqbPwUz2dBtzJJwyyE=; b=nKBxDu+hW1XAB/2+eENQ1XLCEWJM6tfpn4cqNbVISMLXtgHyz7sPjnMNHE4OAdBgCN6L1aByZ
 J445SDv9iPMBRmpMMTiBvqjX3bFNGPFqA0kfKFU1NRWRm3lXqWi9Guj
X-Mailer: b4 0.14.2
Message-ID: <20251120-phyb4-v6-0-b6694e1f0caf@google.com>
Subject: [PATCH v6 0/2] Add Google Tensor SoC USB PHY support
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="utf-8"

This series introduces USB PHY support for the Google Tensor G5
SoC (codename: Laguna), a new generation of Google silicon first
launched with Pixel 10 devices.

The Tensor G5 represents a significant architectural overhaul compared
to previous Tensor generations (e.g., gs101), which were based on Samsung
Exynos IP. Although the G5 still utilizes Synopsys IP for the USB
components, the custom top-level integration introduces a completely new
design for clock, reset scheme, register interfaces and programming
sequence, necessitating new drivers and device tree bindings.

The USB subsystem on Tensor G5 integrates a Synopsys DWC3 USB 3.1
DRD-Single Port controller with hibernation support, and a custom PHY
block comprising Synopsys eUSB2 and USB 3.2/DP combo PHYs. The controller
support is sent as a separate patch series.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
Changes in v6:
- Use "lga" as SoC name instead of "gs5" to align with Tensor G5 device
  tree https://lore.kernel.org/lkml/20251111192422.4180216-1-dianders@chromium.org 
- Add "usb2_core" to the reg property to define the MMIO space for
  the eUSB 2.0 PHY IP.
- Rename "usb3_top" reg as "usbdp_top" and update the description to
  reflect its nature as a top-level wrapper and align with internal
  documentation.
- Use syscon to access the "usb2_cfg" MMIO space.
- Remove minItems for clocks and resets, making all listed clocks and
  resets (including USB3) mandatory.
Link to v5: https://lore.kernel.org/linux-phy/20251029214032.3175261-1-royluo@google.com

Changes in v5:
- Add usb3 registers/clks/resets to binding as suggested by Krzysztof
  Kozlowski. This ensures completeness of the binding, though the
  driver has not yet ultilized the resources. The usb3 clks and resets
  are optional if usb2-only operation is desired, this is denoted by
  minItems and descriptions in the clocks and resets properties.
  Additionally, rename existing binding entries for consistency and to
  better differntiate between usb2 and usb3.
- Move the description of the phy select to phy-cells in binding as
  suggested by Krzysztof Kozlowski.
Link to v4: https://lore.kernel.org/linux-phy/20251017235159.2417576-1-royluo@google.com

Changes in v4:
- Separate controller and phy changes into two distinct patch series.
- Remove usb2only mode configuration and the corresponding usb_top_cfg
  reg (moved to controller)
- Add more descriptions to dp_top reg to indicate it's not DP specific.
- Add u2phy_apb clk/reset
Link to v3: https://lore.kernel.org/linux-usb/20251010201607.1190967-1-royluo@google.com

Changes in v3:
- Align binding file name with the compatible string
- Simplify the compatible property in binding to a single const value.
- Add descriptive comments and use item list in binding.
- Rename binding entries for clarity and brevity.
Link to v2: https://lore.kernel.org/linux-usb/20251008060000.3136021-1-royluo@google.com

Changes in v2:
- Reorder patches to present bindings first.
- Update dt binding compatible strings to be SoC-specific (google,gs5-*).
- Better describe the hardware in dt binding commit messages and
  descriptions.
- Adjust PHY driver commit subjects to use correct prefixes ("phy:").
- Move PHY driver from a subdirectory to drivers/phy/.
Link to v1: https://lore.kernel.org/linux-usb/20251006232125.1833979-1-royluo@google.com/

---
Roy Luo (2):
      dt-bindings: phy: google: Add Google Tensor G5 USB PHY
      phy: Add Google Tensor SoC USB PHY driver

 .../bindings/phy/google,lga-usb-phy.yaml           | 133 ++++++++++
 drivers/phy/Kconfig                                |  13 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-google-usb.c                       | 292 +++++++++++++++++++++
 4 files changed, 439 insertions(+)
---
base-commit: 8b690556d8fe074b4f9835075050fba3fb180e93
change-id: 20251119-phyb4-2e03a7c449c4

Best regards,
-- 
Roy Luo <royluo@google.com>

