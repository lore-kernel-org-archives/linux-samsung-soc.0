Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF101A9FBD
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 03:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764906859; cv=none; b=X3sKSTf83/2jKnHhysM00epWI21HtXQLtgrl2cQhh3FFuzkcsVDM2u0QG1a2cWPgBJYvocrR4czdR/tz+1ID5qtCY0tpPf26qcRO97QfKz6gTMHDU1F5KAJ0qdz8YdqDGSiySj2kAfnwAdbsi9zCYk6OdgVAsyVhga/SdxzLdQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764906859; c=relaxed/simple;
	bh=2tc2ueK5yCrImLff3UraB+poQHbzXwYCQ4YuwSh4gbU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=o7uCNfEdd42LsmVwk5nJUxuqUFlSvofE7cI8I8qpfNlFAE92EDEe6Usch3pZCs+xEo1ietEu6eVGW6ZDfKuBlUr3PmyNuHOTrFrOpuub19x79Y5EUeYnbpyP1umsTOTrhiSKw9vQ/iQf3SPCBskxk/GyqgZnzfKYXzWeIFRBwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sT5SNHbL; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sT5SNHbL"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-ba4c6ac8406so1408360a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Dec 2025 19:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764906857; x=1765511657; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l7o0+wFB0fxZrZrqPCxWWUrX5bGrJiIWd93CpaGi7BI=;
        b=sT5SNHbLgYb7S3WTC+Pgm88yIHMJb4G9nH+6J6x3datrcGAixBxR3DB4lNq1sNyUoh
         Wu9W+jRB6kh4Mt+m1CQj54FSmVqjxq9fJ5NJAsy4lxWf75hr7kfspSnvZ4yH1cCtZxGP
         DPpjLvmmZi7rRiQlJ3jXl6qLwKi4DtjeLuTEfC1mUN7qO9u/2s4w7/LYf77nBpyfeEur
         dXQ5tLawja1PYsopjniNKHvyKNyzZMha3cxMDAXwD/R2QTpqLL8RD1UC3KO/d+9KM88Z
         K7VwX90hnlA6XmOCShjKXmz2/ulbUWpImKqT8npHnw6HAPBg0w9cH0BZbpjNhH58cKI1
         Xzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764906857; x=1765511657;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l7o0+wFB0fxZrZrqPCxWWUrX5bGrJiIWd93CpaGi7BI=;
        b=M4J98HWE87hJRWrKgV8rrhB9cVH0KwU4MDoG39wre0Xk5FH6KALrZM9nrv6Lxgm6AB
         JhN0H86dCC9NnqWFp6/YRL50QMZKsWnIMMXNzs+LLLHIyehwaz0ITexRxBeaYVXSC5YY
         07ixTYGS4dd3u6XGEk+cSk5Ox+XbVI0OIZiYimsmJn0FT9spob/WM2c+X6lJJRc9LjY1
         wajjHL/PQbkqsqHZYIGGqPcwYEt49D6D+SVBKyL5YAYQRUJO5RgZ0RLToOZzx+C3FDtu
         S78gK+tiM62cPW8M61igohT+nEQEYZsGZ6QwPUi5zmvI9N/9Nz2ntqeQC1spAHxDZ92n
         oUOA==
X-Forwarded-Encrypted: i=1; AJvYcCWXvMFDTgHKSb+qhpq6yC72MqK1vJ7Rbl6NGKZHVNJxDp2k/bA1HcSn581E0skh3Dq8VXRdGoI7YBjyyiXCGB39pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3L5okflN9UuV/vnkR0QDI+CKH1qZLCasBXa2mYOQISyQrH1n/
	lfCPgGkiKVgh+WUZi/BF6PzN9kvwIHpejHKO/by+zef/pvMNDdk0S3HNqx+b+PHerwvRucGePRz
	FifoP6Q==
X-Google-Smtp-Source: AGHT+IH/A0OAPzxz4CmbNcZZUtF8cAw99r376uPh69pJveO0mGRkFLKzTyCIyHvM349SWS0rV0K4DyG164A=
X-Received: from dlii13.prod.google.com ([2002:a05:7022:418d:b0:11a:5223:14ab])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4591:b0:119:e56b:91f2
 with SMTP id a92af1059eb24-11df0c3db04mr5952111c88.35.1764906857360; Thu, 04
 Dec 2025 19:54:17 -0800 (PST)
Date: Fri, 05 Dec 2025 03:54:10 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGJXMmkC/1WOQQ6CMBBFr0K6tqQzlAKuvIdxUcoUmog1RYmEc
 HcLwajLn8x7b2Y2UHA0sGMys0CjG5y/xVEeEmY6fWuJuyZuhgJzAKj4vZtqyZFEpgsjZWUki7f
 3QNa9Ns/5ErcNvuePLpD+0gIrBCkyTDMoclTAgQc/XZ/+1HrfXik1vl9lnRsePkzbT6NalXsex Z4fFRe8VqqSBFYYbX8Na38sfjH4YEXEGquktFohlOIPW5blDWlfJXMPAQAA
X-Change-Id: 20251119-phyb4-2e03a7c449c4
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764906855; l=5157;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=2tc2ueK5yCrImLff3UraB+poQHbzXwYCQ4YuwSh4gbU=; b=YojkW60N+NQkCkHwVLnMl4R03inzTaOCjroXExlpWISnRrpm+AXiY7T2V3KtLHv4XXhd3XQTR
 /m+a8NOa9+IAkbxt94mvHmeS4IkHloJK5WV1R629yUFgzlVOfStluTQ
X-Mailer: b4 0.14.2
Message-ID: <20251205-phyb4-v8-0-c59ea80a4458@google.com>
Subject: [PATCH v8 0/2] Add Google Tensor SoC USB PHY support
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
Changes in v8:
- Update the Kconfig dependency to depends on ARCH_GOOGLE || COMPILE_TEST
  Note that ARCH_GOOGLE does not exist yet but will eventually
  be there when the following patch lands
  https://lore.kernel.org/r/20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid/
- Mention SoC codename Laguna in Kconfig description.
- Sort the header alphabetically and sort the variables using the
  reverse christmas tree ordering.
- Add driver and binding files to the Tensor SoC MAINTAINER entry.
- Add detailed comment for phy_mutex
Link to v7: https://lore.kernel.org/r/20251121-phyb4-v7-0-df644fa62180@google.com

Changes in v7:
- Change the device tree binding example node name to usb-phy to follow
 the hyphen-separated naming convention and remove label.
Link to v6: https://lore.kernel.org/r/20251120-phyb4-v6-0-b6694e1f0caf@google.com

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
 MAINTAINERS                                        |   2 +
 drivers/phy/Kconfig                                |  11 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-google-usb.c                       | 295 +++++++++++++++++++++
 5 files changed, 442 insertions(+)
---
base-commit: 43dfc13ca972988e620a6edb72956981b75ab6b0
change-id: 20251119-phyb4-2e03a7c449c4

Best regards,
-- 
Roy Luo <royluo@google.com>

