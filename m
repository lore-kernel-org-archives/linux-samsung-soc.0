Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1592340DA7
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763545080; cv=none; b=VnPu4IG8eCokcohQ0BeP5XY/PE4NssYb2cjUEXiIohEp6a/6WDrHNKhXXDC6RReUjbVZ8Vyw6srNyqZlrlw5feqEXoUMk0TZGmYZJ/nKZrFH6JRLS9OG4GzlkX0rWtd5IgT+umuZiX4m+lsZRcJ7LxWpZlvFS0aUufwRQ3jOg68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763545080; c=relaxed/simple;
	bh=oGFn4T6uBdDTDl7k5+SUdvNHhOilGuNgXAul+y5alzw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Uew21xV6PQSuxHY0OCEjXwtNBZJphdA9CyS5foljcBR6cW33pn+pnF3AkEsKv8FBKsTFCkBzFFENLCqEVr3KC4WShAJ5bE4rrUfbVmr7GgGIIRgmbuL+ZFh+9Zr4nhKV5cjE1pIvrwoAXz8LE2GEtKIZUev0rNFQJKNFwqgzgAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hvb3h2Vy; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hvb3h2Vy"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2a45fea6efbso974eec.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 01:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763545077; x=1764149877; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mAVQG061YW725q/wmjUYBgy0COgl5nGBRM+6s0kYZuo=;
        b=hvb3h2VyMXmJ+9bi62a4CGY9xsG7MhSBGBUfERNKNw15xkWs5Ado9dbNmMPP6tkACV
         yiCmYgE8dnfQYUgdfLiJaoOJCKp73bm9kVIJmgTBsK0vcDpwED2AscuDk+fhMg60BkMb
         IUVwgu8YjS4DQ96p5H6kvhleh2g5S0H5CgRfWsQA3UxK9T+YYpcSKWmBfV92/wWYTXL1
         fBapZGmBoq1UwJJpIUcWpdhxJOTfTzfhLMreSxWHgDCdHBCY6n8B6Gy5alUkU11cec36
         i9n+0arm3ZO7XFW9vKN10e8UtcRJLuUS16oaevt7YVLP2Q2CdOCGR7gMcffixL8ZNQaC
         n/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763545077; x=1764149877;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mAVQG061YW725q/wmjUYBgy0COgl5nGBRM+6s0kYZuo=;
        b=G93zWSyqsMw4alfectVxO6bO2dw7CiYq0FWYAoorv9+q+ZZF2WNb2IN02BfpSxfwJ9
         Mz2PwIl2oDE7iEhSB93wDNrl9KZtfnRT61xaSlFuk1Txhp2SZmYkc/yMj/AnADdtSDaH
         xRJ1K/pLCFD3oCFNWeFF6bO7x9aoYKcXtZpKleqwE6n4CTyIDsSK4RJwATML78gU2Zia
         cao7JPG7MCnOvFH5x9yVJpm1Ac6c4Cva3srvAhx8x311s4cumFg74hroot+L0A8p1ydH
         DCrCrJQu7vT8gk3CnB7VoyOR3eUD8BacINuy0lLct71fQCKaFkjF20KvnLjuEuMKYz8u
         Nu+g==
X-Forwarded-Encrypted: i=1; AJvYcCV0CAT3iQKCuD+s7Cxj9bEDgqJXGrd9UiwoBfc6OH2SK5VGVuZhT8cXQ6s80eTZm5cxIQsMYGoUxX/KaWX/ficM0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk5w6jkzhIJXCFpernjLH4s0DsorJiU2rXFciE+Gzil9g/8MtC
	f4Dq7spkJ2n9JSC+PPy7Cg/6ktbjHRu+epbPpwxpBjOV1yArwndWHszsKHLxPVg3iYnHED//oUO
	bIWY5XA==
X-Google-Smtp-Source: AGHT+IEjF6sLuOZO6K6uO5uOpAxqm66tBkwkp0GiH/cYEmkoiS90zBFbVK08yLSxq9hgLXgfWB6Zs/rO4SQ=
X-Received: from dlbdm33.prod.google.com ([2002:a05:7022:6ba1:b0:119:49ca:6ba1])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ff42:b0:11b:b6f7:563b
 with SMTP id a92af1059eb24-11c8dd1e72cmr683912c88.1.1763545076721; Wed, 19
 Nov 2025 01:37:56 -0800 (PST)
Date: Wed, 19 Nov 2025 09:37:46 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251119093749.292926-1-royluo@google.com>
Subject: [PATCH v7 0/2] Add Google Tensor SoC USB controller support
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

 .../bindings/usb/google,lga-dwc3.yaml         | 140 ++++
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-google.c                | 628 ++++++++++++++++++
 4 files changed, 779 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 create mode 100644 drivers/usb/dwc3/dwc3-google.c


base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
-- 
2.52.0.rc1.455.g30608eb744-goog

