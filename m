Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7BC1A23B9
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 02:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764901632; cv=none; b=mQl4Pl7KCFEm8qIX9XcIH32f8e8SK/IiPvWqZcWYQ5Cs905g2vFpg1kPbLaJUVSbZWU5bu6c+Ro4m0lcoTSp+MSMpnayOip4VGhtbvSactAGJr3ZbmeZz84f1y805GUBWlT7ZiLpFK8n6rEtSG2WnXgbL4+HRZoCyFDyjwznoP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764901632; c=relaxed/simple;
	bh=TqvI1+EhfFR6oXIbUZQ/1JtyXdud1DfSeTXuuSX7Htw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bft3gIU1SGQHGktqvT3wJUGpJDhEsjxfNaEz13x3uSL36aebSOl5EqB46JnepRPqGMBmMEhvBXa/CCSSR/3FFKJjAEaq/+6DrhpDzbEnf8oZrUSjrPs1Q/wzCh+2b3ZhGGBLwAJ8RXeasusbKszrHqlXtzXMNT1mXW9eVHUIqF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a+gfdMJV; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a+gfdMJV"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7dd05696910so2058520b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Dec 2025 18:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764901630; x=1765506430; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yTK8vEFI0CjLxRcJubNhZxVfYVJdPu7BvYrObwAnRlU=;
        b=a+gfdMJVJdTjDFqFG7j/NlEACumL1zPe6xt/tJlLWGURJo49h9VBf3ywP/x+6QawLw
         9y/chWLyO8dZvqGqTneLBZ+5GiZw+6tNtvtYzZSdMvoWbY/7yHXntyhizFyLRHoefJJd
         Z/Wk22AJVMV1de1NxD3sXr2ufZe1kU1Unp7+qvr5QfMRwYzHmduugNHtv0EAu9zDJ7AR
         BeJmATgiQ327petlaw8j6Q77f6yWqv9ANnffNUvywOGkEROUmJSPTWHXV+v0G7RkStiy
         FCPqd5quljbHELV4WqCLUZ9PsCZmT/uLoL3FEb8i1dGq524o8AW8GhUmyF43ISFT84Og
         UZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764901630; x=1765506430;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yTK8vEFI0CjLxRcJubNhZxVfYVJdPu7BvYrObwAnRlU=;
        b=NcaxnlqkZYj4TAH4TDUTCgZlo8opkO80DdRH2gsqRQjx+E0xkH8IlANGoibXOHUxWs
         81XZCqOtrmFFTqjWXzTG+HpmpKoq2D5aFsu/WCpMoUH7lZyWV1p+mSTdU/RWRAiDDXB5
         qVIH707JH8s2FAL6FIIHB0HVVitPUkaYxmhs/i4UEdaTlCaRn1HhpxDae/1RcL/GEZwK
         OsymRp3/UgQRT8dQb85/T2Kh8Qw+RxrSURkSdBO0aWgsmrFEOw8gCTdY2gZ96Lso935v
         vR7oJ+aSvCgiJwFnqsJzSeZncj3oEefx5FGhOOFzf6lCQeGbTVxH3TAnJQd9lPWZXk5r
         S7QA==
X-Forwarded-Encrypted: i=1; AJvYcCXdgQdLVBfLmekJ1Th8QxzJmLa0X48x2J6w0UUHM7gZ3cy8b9pZ361C3Ouq46/PtKKfCkC9DWuI3oZgtppH/BKcvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFp4YCRunLZBdrYKYogrcZYpa61ZQZ0uxDPd9isp3uhQOgZAFv
	MODd55Ca93LJUFHXZwJo/6n0N6eHQhrUDbd0EbcdV6vK/uUkBPOkkJTCm0nNZsyIoa40kQkWpU+
	P9uMVHw==
X-Google-Smtp-Source: AGHT+IGQ4LElx7uU5MBh+1/dyf/+KwM79ULhN+f14A5X68GyJqiRjIFMWicTRFECxPftMFDUJsVXFd5gFog=
X-Received: from pggr9.prod.google.com ([2002:a63:d909:0:b0:bac:6acd:818a])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3389:b0:2ca:1b5:9d45
 with SMTP id adf61e73a8af0-363f5e24b28mr9201790637.32.1764901629786; Thu, 04
 Dec 2025 18:27:09 -0800 (PST)
Date: Fri, 05 Dec 2025 02:26:36 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANxCMmkC/23OsQ6DIBDG8VcxzMUAFZFOfY/GwcqpJNRrDmtqj
 O9edHJobvoP98u3sgjkIbJbtjKC2UePYwp7yVg7NGMP3LvUTAmlpVSKtzhOhCEAcansUzinTWM
 Klh7eBJ3/HtijTt0Rvvg0EDQnQlphr6awubLpSi454RI+eO8R+wB5i6/dGnyckJZj11zt4t8Jc 8UFB6NLBcJ1pa7OTL1t2w+XTjb34QAAAA==
X-Change-Id: 20251122-controller-129b0dd57a74
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764901627; l=4580;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=TqvI1+EhfFR6oXIbUZQ/1JtyXdud1DfSeTXuuSX7Htw=; b=tAc00f4hLwjWG0tXrhMw8QTDqOQ4ehBNIMYAh5XNMTUu+/dvM5GEvhL+SpriE/+ad7y828DEc
 lkycZBv/X7UBzVBq4Gku4LmTNYD6mN1QkB/sZWAkz0LCDE1tC/OjPkE
X-Mailer: b4 0.14.2
Message-ID: <20251205-controller-v9-0-9f158b18f979@google.com>
Subject: [PATCH v9 0/2] Add Google Tensor SoC USB controller support
From: Roy Luo <royluo@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="utf-8"

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
Changes in v9:
- Update the Kconfig dependency to depends on ARCH_GOOGLE || COMPILE_TEST
  Note that ARCH_GOOGLE does not exist yet but will eventually
  be there when the following patch lands
  https://lore.kernel.org/r/20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid/
- Mention SoC codename Laguna in Kconfig description.
- Sort the header alphabetically.
- Add driver and binding files to the Tensor SoC MAINTAINER entry.
Link to v8: https://lore.kernel.org/r/20251122-controller-v8-0-e7562e0df658@google.com

Changes in v8:
- Add COMPILE_TEST to dependencies for build coverage.
- Drop redundant default n in Kconfig.
- Update Kconfig help text to explicitly state the module name.
- Use container_of_const() in the to_dwc3_google() macro for type safety.
Link to v7: https://lore.kernel.org/linux-usb/20251119093749.292926-1-royluo@google.com

Changes in v7:
- Follow driver naming convention and rename the driver as "dwc3-google".
Link to v6: https://lore.kernel.org/linux-usb/20251112123257.3755489-1-royluo@google.com

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

 .../devicetree/bindings/usb/google,lga-dwc3.yaml   | 140 +++++
 MAINTAINERS                                        |   2 +
 drivers/usb/dwc3/Kconfig                           |  12 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-google.c                     | 628 +++++++++++++++++++++
 5 files changed, 783 insertions(+)
---
base-commit: 43dfc13ca972988e620a6edb72956981b75ab6b0
change-id: 20251122-controller-129b0dd57a74

Best regards,
-- 
Roy Luo <royluo@google.com>

