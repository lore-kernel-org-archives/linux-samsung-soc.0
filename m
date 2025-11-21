Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A7333C53D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763715400; cv=none; b=IwMBqXEp2PZE4aZpr7fCVExdP093kk3wTlBsh8tBr3l3tN8WwYlQGWivI/CqYBk+b+GefIyHH29vR+o2+07K4dfnH5VAOWSD+f4bQvARoP6ejaVdpDxpQ4WmB+oK3saVrmvs6bROAESypECFGrq7Z8kCIMNJ7nfZXsDitL4h0Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763715400; c=relaxed/simple;
	bh=Ar+FpJ9OcQupIafQmNevHRUQrYI7zdExOsWYoTxS3fQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EFax4i6IdgxVHQ8GaitapWgBHl98CPDYrdEfbwmH35d8hC4cfvpPikAJ8Ve1qACfvnTconSX3gxxxcdCuM+bKefRuTKR0cVPwuV1aX7mJsAx7bHlQRWaDmfY5z++U9Wqhcn463OD8qVtryRbT+94ejhWsb7I3Nh8JH68ErZeKco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ApzxvpwK; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ApzxvpwK"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so1597737a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 00:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763715397; x=1764320197; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DhM9Fa/jP+KWb7vx3DxnfgNJ8bMuk70umuAM2oX5908=;
        b=ApzxvpwK4zP3j40ZTo0Yhy7gg0n5ZJo+3fnGuPUweK81GM/78bPWmegH5JkR8fnZSE
         fSn8qbNGED2pd04a5IhPk2slBbODfkrcbTx2n7n7cIZpZ8aWdmMbaUCOtTL2/2DQUP8W
         yaUUffaWpqX3fLVCFrgd78Paq/M3g7YQwjAgY4p3sK3Q9aHTUJxB486Q8c4oM0RghaSN
         D3X3bbY2vHGad1/cDVtQ7Jr86s4EKzoxDVMQlyGey6uIRlyJOTlO2kNGXF3Gi6BmntbC
         PA+Ip86YIGUu03FTbqStfDzHrjaGINKg/cpToshfMV8sx8sXQYw3sDpnWowqiS/K8N1D
         qIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763715397; x=1764320197;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DhM9Fa/jP+KWb7vx3DxnfgNJ8bMuk70umuAM2oX5908=;
        b=h/64nsUHPf1GlZ3QQulL5MSX33vABoWd5ZnS5+oXgekSeQVhd7p/MqdQAuUIvIzURs
         qvvcFIfl7fj9WkOqcsax26SOuo+4zxo6AqmGlGisT7M2QxAHM1mds08qR9cBI+I429/C
         /UEzOn1V6lB9DPfoLGWT7vs3pHed4XBBmZvWRJkBkra1f20RNrAnKmrPKiZluh26mv/U
         y443TVVTt+8Kgicl86+zMzVQTPBl9cdJEue+Rq0Qn+GO7AkN0gpHdbB8ODRz68CVfq3W
         lM5kmh4gMkCjB+cXzXXY57MV+NdJ7TChkbQQQvpPbZJ0lR5LvouJWUjwHLJc32hAuj8S
         XhDA==
X-Forwarded-Encrypted: i=1; AJvYcCUrrCdTOjkIaPljoGfY+9zuHrVtgXhW/XuXut2E0GKuVq0xS0dRH/VNFHLdnQmIcyTOL+yvXZRSN0i4Lq4jOy7leA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw66YOyiQMl4TJtKjon2+YPFIYrsg5lIDpUY2Yjk6WqwZ3ndJ7y
	HokehdYpTlGCI0qekYt4QZ7qxmOfzWVfovmvtevYcSdZa60Fx3Jn7AJPEky4snnLUzkW2xtlemk
	uc8ijow==
X-Google-Smtp-Source: AGHT+IHOt9VGLM5kE8fbmXammocOK9LHEy2oDCT5mMWFdkcdyy6xX1Z2HP5Qw8fBAZ2SiujmIs4ZXkkrgOM=
X-Received: from dlbqj20.prod.google.com ([2002:a05:7022:ec14:b0:11b:806e:9c8d])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3f89:b0:119:e56b:91f6
 with SMTP id a92af1059eb24-11c9d87076bmr424174c88.39.1763715397353; Fri, 21
 Nov 2025 00:56:37 -0800 (PST)
Date: Fri, 21 Nov 2025 08:56:19 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADMpIGkC/02OQQqDMBREryJZN5J8Y8Sueo/iIqY/JqBGEisV8
 e6NIrTLBzNvZiMRg8NI7tlGAi4uOj8mqG4Z0VaNHVL3SkyAQck5r+lk11ZQQFaoSgtRa0FSdgp
 o3Of0PJvEJviBzjag+rUZ1MAFKyAveFWC5JTT4Nf+7R+d912PufbDIbMuzj6s56dFHsprHtg1v 0jKaCtlLZAbppX5NzT7vn8BvOwlxdgAAAA=
X-Change-Id: 20251119-phyb4-2e03a7c449c4
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763715395; l=4451;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=Ar+FpJ9OcQupIafQmNevHRUQrYI7zdExOsWYoTxS3fQ=; b=SBxNkIDzrCsiCjNNLNfD4nwYdPjqjoFKrywstPwPtPtm9mW+EVfzp6ypYcS1gv6q6NhTIaxuU
 boJMTGOjnZ6CVULL34Yllotu9p0zwgKXaWjiMFHgrWaci1TWiDyKmwc
X-Mailer: b4 0.14.2
Message-ID: <20251121-phyb4-v7-0-df644fa62180@google.com>
Subject: [PATCH v7 0/2] Add Google Tensor SoC USB PHY support
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
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
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

