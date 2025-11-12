Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E123358B0
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762950819; cv=none; b=fVuhmrajlPN9pN6r886yYUhCUwBsJ3NKtlpUWpnPIi8DM9MtEUzUQWCbqPuNxEZN/rjTGhmNCtZnQd50NP0iDJEFiXQLFv8g0AzLQ1thD5l84m7MzP3NWOHNPlTOO3xQmucqrX3+KHLc0fVmK0D4U4mTeby7IltYbmFKgWnDHf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762950819; c=relaxed/simple;
	bh=eJGTRxnOGVlYO1XOKNxCxIlSAwDMsw++4ZlRAIAiDyU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jvTVZnflX6S8H+R8u91oPwHj1342tVgk+baa8rKdywqVCMEAk9XBIlqQB3OXOTzvvWmSglnSOWLzLeMP6b4v6giNMbi/26Hj3104yUCGybaHi7UULWrV02zz1wj1a4zQQYMuYHd9TwOUihLMiS1qmMXgF1d28VRw/DZ54yhCm+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FYm7BLOr; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FYm7BLOr"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2958a134514so11083275ad.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 04:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762950815; x=1763555615; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3lvK+uc33/YSncyDEJOxI3GlGodXaiJ9TvJi/yjxYBw=;
        b=FYm7BLOrDMM4113BBGhall0SNW0H6Orc0Dsr9kKpDKla2moSkjbDEmMvq1eOv3NHpW
         lRbz7cN5As8pHAja4yKW/Bj9LMj+pzFw5OF7t780XNbEGox8ZU5ctSmwD4q23jjvkGTO
         XVjTUbtBtP2nwJhtWRmjcwcEkiQIQokySmceS+rnREV+SST4eiOZuLRD9JzUJlpVM+6y
         QufdMyE4N0zm024f1v+YDhPW/De/mdRyYfrBgFPLynUQhpC5Ds4ZVZUidZ5tf8uxAM8L
         oVwSmPheoOk50PJwZzmjnHbzbtao6uv6WxNdwHHLRZyyHxE0e/AAwkQTk04DJrO5I9Tp
         t8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762950815; x=1763555615;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3lvK+uc33/YSncyDEJOxI3GlGodXaiJ9TvJi/yjxYBw=;
        b=UgzW6AHphfBFHf5IRDiMgpPz1XwIt85cIn51j2ysQORWwjIqSH41cJqejw4/XCvPXp
         dl4HSs9/dZppWDOmFP5V5cySfEyc3iI/EBN1mz/v5LYxb/vTFd9i2MY4zbNEpmwRSndQ
         KRs6tvKHSc0oqoSAHriqjVyfPs1S9ZHCMbL4KIUtRbM7qIFOZr/qER1eQK2rxM85EDqk
         x21dQSa6qkEPbt5z164HfTG/i7xEjKzQ5sddql7fDuE79eijbvqANvUkBOFkbDrjfWa1
         L4gfSwCHdCXpLjPxjOuSodVaVPDhs+c9p4/Q41mbLklI+YVheu4703Ro1hTxjxvr4BJN
         QNsw==
X-Forwarded-Encrypted: i=1; AJvYcCV0XbuFu5fgEgqfoPUFrkL1+Y7atGo7sQ9/xEBgPaZ5nNmuNkPKAQJEbrZL64oBRlM0lpIwikqy29uejSsEcsXU7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNwDCe9xXHtaUF6PNvGefRJ8+lMcsbonduFtLtza26fAGNKEy7
	p9el9wednCJ1wiUKam2Xs83CdFC2OO3a04roTccp8nSytpTHuxx1/xuDj8I3Q1mlheHWbqS6qxf
	lZXq8gg==
X-Google-Smtp-Source: AGHT+IFLqNhYrJ49MxXnkbzra9diXQg1Vv0DtfGNDDqWdo1vsY+CTaFtQqSWQk1ZZK+fvX+HgOTe5Uof+d0=
X-Received: from dlbur6-n2.prod.google.com ([2002:a05:7022:ea46:20b0:119:78ff:fe15])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:286:b0:295:5972:4363
 with SMTP id d9443c01a7336-2984ec8f54emr35613555ad.0.1762950815330; Wed, 12
 Nov 2025 04:33:35 -0800 (PST)
Date: Wed, 12 Nov 2025 12:32:55 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112123257.3755489-1-royluo@google.com>
Subject: [PATCH v6 0/2] Add Google Tensor SoC USB controller support
From: Roy Luo <royluo@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series introduces USB controller support for the Google Tensor G5
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
block comprising Synopsys eUSB2 and USB 3.2/DP combo PHYs. The PHY
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
Link to v5: https://lore.kernel.org/linux-usb/20251111130624.3069704-1-royluo@google.com

Changes in v5:
- Use syscon to access host_cfg and usbint_cfg MMIO space per
  discussion in https://lore.kernel.org/linux-phy/89733ddf-8af3-42d0-b6e5-20b7a4ef588c@kernel.org
- Make warn logs in dwc3_google_resume_irq() dev_dbg.
Link to v4: https://lore.kernel.org/linux-usb/20251017233459.2409975-1-royluo@google.com

Changes in v4:
- Separate controller and phy changes into two distinct patch series.
- Rename dwc3 core interrupt as "core".
- Remove u2phy_apb clk/reset (moved to PHY)
- Configure usb2only mode when usb3 phy is not present.
- Adopt pm_ptr PM macros to fix build warnings.
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
  dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
  usb: dwc3: Add Google Tensor SoC DWC3 glue driver

 .../bindings/usb/google,lga-dwc3.yaml         | 140 ++++
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-google.c                | 628 ++++++++++++++++++
 4 files changed, 779 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 create mode 100644 drivers/usb/dwc3/dwc3-google.c


base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
-- 
2.51.2.1041.gc1ab5b90ca-goog

