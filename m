Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB13304BB4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2025 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766085859; cv=none; b=Ksww9HCSN/lzs/1U6tWhyQM/LDXaq5TP6tfgkyu0es2gtcqZ2BHNbMIUzDONcvg49/qWDZmI2C47cXN/PpIc+mwggM8VJA1lOGyV2hp1aizXmJs18LwUmE6N2S8P6xzpUK6sfmav4XaHWqCNxlwgVN+TXweBlMM0N5AhUyuoDD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766085859; c=relaxed/simple;
	bh=r2nfcgE9H5Zw6cGRbY0dMONGUMXhlb7voPYvTZk/85g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nzNU+YWXXsdMQZUywz+3Vde5/BWKZfeeKZbNmehUv2Rfr26P0Byd4lPIn3onJXg9wx7U7QtoSR6sfCYAEbVzbDth7q5iBHid6zJt8t6ZBQ08IKM1QnfMCxQzA3ePAaTSAKX8Jz0A8OAk3aelFNnqDyRzXuziEpNLk9wpi9y2ZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4pZInPmQ; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4pZInPmQ"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-ba4c6ac8406so841929a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2025 11:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766085857; x=1766690657; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZrezF05hBTPlyoc9tTvkwXhrzwuC5VZE33OKqww2y+o=;
        b=4pZInPmQZ/xLsVOBKqLQrn3gEEaE//UJ6ff1olTxqeDrBqNqpvc4Lyw9THOFAEVRzM
         2SuBiJW+/ufBswz5PMITpisr1UhSPRqmGdGp6QCMOaTywigXyqjXHbF4KvGBYy4ZHItL
         f6PgjjrCynx1OFjrYusEJXwM+UB4BDbVyxByt/llqe7eZ1x9PAvKP51a6e4IrhZYOfJJ
         ymzr6cWoHTs5xb9Xp0qAWUY07RsTjqKFXDtcPrfJpe89u9DPiY0feO3tHThjfx6LmoXv
         uMyG6eZAFynMtLJ+973bbkAcg8oA/jnnNiDzK+Wkd9D7mmvhQG3gJu24sksB5FKbbNyN
         5dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766085857; x=1766690657;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrezF05hBTPlyoc9tTvkwXhrzwuC5VZE33OKqww2y+o=;
        b=KixKvCiQYNYGGKbSj/tJ4uNthbw0mm5PGa4ncL+p9/KEIfPWC1eK6VHoMnk+qmLEPD
         saaovMWyWbixCXaUauM+SUojv+eNGZ7/AlHBk2O0GhvrxSRXtlCfUEU6zYe09M2IKQps
         ifyJAM+hubKFeZU7TiZnr18n18WxSMdU7C/tzETbFuQ2Cyrq8ie39T1U+/Vb+dgG5MMx
         0JOgmlhsJdM3UbQKNr6hiyUoiOwMDi6k0Gf0P5jGL1XooSJUfx+hpvBoTqWKNTlKgUbw
         ipbicg5Sth2EgX9dLtfx3a98e054QvSb9j3AUQnEh+wssOvnRyHOBkh5LVfZND8/naEr
         DrKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP5gRN5e3CVM6PI0G6qeDhPLVkvzAzIEYIEfArp5Kx6qKqLRvGIMLfVzIgAeVjIr6PtCJscAbeUdq+Or24zXRtOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTKm1NJ7ks/i+7XwPU43N0XlX/CpcmtiAk8VXN54wt9aNSqjVO
	Drl8rtr7Kl+duyaie9J3vCtvYr74Z7c6f5LyeBykRSdW7Yeli3O4CD9+WySIyrUFBLBGnF9TnBe
	3DULaaA==
X-Google-Smtp-Source: AGHT+IFa+6SmGfUkIqFcWYkM71AGyzleptfMzh2HOJNU/e7vccjigezYG+iRc0Hs9V5FciCCNY21d7DzDfs=
X-Received: from dybgx3.prod.google.com ([2002:a05:7301:2403:b0:2b0:15ff:44c8])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4185:b0:11e:3e9:3ea1
 with SMTP id a92af1059eb24-121723022e4mr297799c88.50.1766085857216; Thu, 18
 Dec 2025 11:24:17 -0800 (PST)
Date: Thu, 18 Dec 2025 19:23:09 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ1URGkC/22OzQrCMBAGX6XkbCSJTZP15HuIh/5s2kDblW0ti
 vTdTb2oIHv6FmaYp5iQI07imD0F4xKnSGMaWu0yUXfl2KKMTXoIo4zV2hhZ0zgz9T2y1AYq1TT
 WlS4XCbgyhnh/286XtAPTIOeOsfxSaFBwcDnsDaQrpJZMj/5Gp5ao7XFf07C5ujjNxI932OI34 9+ExUsl0dnCoGpCYf23ZmtY4MMaZX9YSCwEbX2lfQAHP+y6ri+vdSAOHgEAAA==
X-Change-Id: 20251122-controller-129b0dd57a74
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766085855; l=4872;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=r2nfcgE9H5Zw6cGRbY0dMONGUMXhlb7voPYvTZk/85g=; b=9tR7mlclTjSkDEjA2dTpWxvMt66/rqatgrSFSBP81dwqat5HpqCGmSCYQH9KHthQZ5pIjoKWv
 GJsMpkbyDCYAWNbICVWhqVkg0wTf5A1IpNz7pz6vp1bBSBYWqJkulPf
X-Mailer: b4 0.14.2
Message-ID: <20251218-controller-v10-0-4047c9077274@google.com>
Subject: [PATCH v10 0/2] Add Google Tensor SoC USB controller support
From: Roy Luo <royluo@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
Changes in v10:
- Per Greg's feedback, remove Kconfig dependency on ARCH_GOOGLE || COMPILE_TEST. 
  Remove ARCH_GOOGLE as it's not yet in the kernel, and COMPILE_TEST is no longer needed without it.
Link to v9: https://lore.kernel.org/r/20251205-controller-v9-0-9f158b18f979@google.com

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
 drivers/usb/dwc3/Kconfig                           |  11 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-google.c                     | 628 +++++++++++++++++++++
 5 files changed, 782 insertions(+)
---
base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
change-id: 20251122-controller-129b0dd57a74

Best regards,
-- 
Roy Luo <royluo@google.com>

