Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C0D2D2486
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 21:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766439104; cv=none; b=d01IpuKHTnB4Ffwrn7ygvRG2RWT+yuJyz3bHdvOzVOLWvSNuHt6s0J7rlALNAj4159wKbhWuNk5QW3JC3N9IAVQdMdm/Btl1jHCL5K89dIR9z9YsN3OdtanbvKTL6YZjFGqdmcfVtsFaYMNe2YmaIPAHlCaTpegH+nlE4YW3B4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766439104; c=relaxed/simple;
	bh=8GRHby7CsgIUuMvd/G3w3lvZBnsDPhPngnyEMQAQyNA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=d3ICIaDlhpt7WHPtsOAk1SXBr4w8neyUcU1uNs3XqxLL+Hqv9a4NVP+f7wiqMRUdRv9xSRJbYXNVDO11B3qDCm+zJ+Ykit2U/ng8fXuzRN7C6WvXZquEDWZUI3cDlWW7D1uH56YRynAsMgtdD374e/L3zeqFo/tfczMVP+BC53I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hLfFBIUB; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hLfFBIUB"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34c38781efcso8210720a91.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 13:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766439102; x=1767043902; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HU401KItDdT/cw2a60PpMgYx8O0lKu7re6GHYWC/yFA=;
        b=hLfFBIUB8au5BwTy3ittgiD1Yt9vMfjI5RbEIWqQeePdIWN9chG/Rfm5Rrgo59VQMP
         sKriEqbTv1u0RJjUXoIMyEtdWxkQA/QbyQzniyl6VcBv0YFo55Cb7MN7Tar0MFU2X8lX
         o0RMbVP9rvL5MLJfDU8N+ubA/jxDa/kEh1H09bEoJ05BXtW2xnYIrRd5vXA64Uh0ghwl
         fgcPtm4m7esSGM+Z09M9WTcqy+Vyor0L/LHo65ip5L9MfBFwro4LYY1jtr/sTRtQuT2g
         2pH4nTTTZ8SnAoRKBtAbckbps86gpedASSPo156FDd86d2p+oE7yDWCyGKXWR5z2k9eR
         x3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766439102; x=1767043902;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HU401KItDdT/cw2a60PpMgYx8O0lKu7re6GHYWC/yFA=;
        b=NCeT9VWW7RUgJZSqEp+60lg2q94eRcxeH/DtTXsts+f3gcgA8jcKSVwLCUj5eNVlHO
         7xn/stqN/XIUXrd/HINh2WNQ8+Ki5n9JaLhDyhTKlfzcMW+amqdYUbxkQ/7Z/KXqN+R0
         64t8wV6WgTynBF5kUWq+aXG0+GKO4BRyL54EY4FwdftFTN4jM4FeLJ07VIsU+4jajb09
         jx04hUpyjTe7qwo+8Zv1Rqt6kq74mX3nFqvOlARPk9itck74sgWJ2QeTle1OiLLVuAyp
         VQ77kXQsKvzWiA5RfPyKITg8dZEvCdmQRfE+zB7KHgn11CGfXXfvSWtx6SsoYq/gmqHk
         WmDA==
X-Forwarded-Encrypted: i=1; AJvYcCWey2jnaRCbbp5umr+wqPkNPoaTjuk343Nj5V4LOalaR44uzcwLxBMt82mzJKFmZ3rkG2esenfoZfFBdM2TiMZYwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT6x0B7BbNhlGfgXS6pUgx95ghS+a/YzyzVqL72pU8mc6AxKIM
	/4wpfV62TxRgr+e5Y6PfchwxOEtMbl0IK3rXZOj67nbki0dWpMD2Wqae/ZL41cA/DRYlObKDqUR
	7nPShYQ==
X-Google-Smtp-Source: AGHT+IGLgMx8/9lh4/3RKudWfKdHcAxrgOSVcELrAv1teNjtA01GeB/gBYB47ZMjb9I6/D90qEYg2B0QupY=
X-Received: from dlai24.prod.google.com ([2002:a05:701b:2718:b0:11b:9bdf:e45c])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6709:b0:11a:29e5:12e5
 with SMTP id a92af1059eb24-121722ebc26mr14702784c88.30.1766439102487; Mon, 22
 Dec 2025 13:31:42 -0800 (PST)
Date: Mon, 22 Dec 2025 21:31:25 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK64SWkC/2XOQW7CMBAF0Ksgr2s0M5k4dle9R9WFMePEEmDk0
 KgRyt3rIBBUXX5p3v9zVaOUJKN631xVkSmNKZ9qcG8bFQZ/6kWnfc2KgFpEdPo8zDvWJND4LjC
 7wKrenovE9HPr+fyqOZZ81JehiH9qIEfI0NC2wa4lgxp1yfPhO3/0OfcH2YZ8XMuGNF5ymW8/T
 WatvM8T3Ocno0HvjHEsGCH4+Nqw7k/dK8MH6yrbR8McvSG08I/ZJyNoH8xWFlon3oJnbu0ftiz LL2FNd0VGAQAA
X-Change-Id: 20251119-phyb4-2e03a7c449c4
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766439100; l=5442;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=8GRHby7CsgIUuMvd/G3w3lvZBnsDPhPngnyEMQAQyNA=; b=OlbCSy62DL0WMqBZhy7cQn+WYiE1/az9EYugvDiloHKYmktgSFXT2UsCxs4UBYsxzGWdMMWG4
 E7V9svn6TXdDg0XogHakbyVOn19OIthHHWE5SH7UfkCd9bEzkutuqmS
X-Mailer: b4 0.14.2
Message-ID: <20251222-phyb4-v9-0-82c0b671b070@google.com>
Subject: [PATCH v9 0/2] Add Google Tensor SoC USB PHY support
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
Changes in v9:
- Per Greg's feedback, remove Kconfig dependency on ARCH_GOOGLE || COMPILE_TEST.
  Remove ARCH_GOOGLE as it's not yet in the kernel, and COMPILE_TEST is no longer needed without it.
Link to v8: https://lore.kernel.org/r/20251205-phyb4-v8-0-c59ea80a4458@google.com

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
 drivers/phy/Kconfig                                |  10 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-google-usb.c                       | 295 +++++++++++++++++++++
 5 files changed, 441 insertions(+)
---
base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
change-id: 20251119-phyb4-2e03a7c449c4

Best regards,
-- 
Roy Luo <royluo@google.com>

