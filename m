Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1327212B2F
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 23:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759792908; cv=none; b=iD0U5sglzeOuTOsFCbaPkQ0U+qKLINbeJrLEWnjZvfJcPyDLxoePAIW1MpNb8/BSGSgVHbuI0nrMtmEb3TdnJ0fbaUsCDRtvsXPYQktYp++Pz/AB7HeZoJVj44X+OKPxTfFceNpPOE9oBEzJV9vkvlj16xWRA5OqTe3suJ4FDjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759792908; c=relaxed/simple;
	bh=1qMbcIpf0Z3Ab03rwmeKct8kSYRJGu8/jk5K/4kkiK0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OhAjohISsNJMh71RWmjVjgbVymilf1Qht6N3FosywUAdYX1nlOyna/6jQaHxJ1Chrssc0S11sb/L16O6EHZ7ayQadnr4CF7W5bDZ97PZR2kDlEZ+Hrk8IUOdt8uIoX5V4nUKsYCkVzwN2OrSHyg/c8dPUqrcTraBh4q0fTmW5Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uDHvzIw+; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uDHvzIw+"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-780f914b5a4so4818538b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Oct 2025 16:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759792906; x=1760397706; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XzfK1528ICmc0tXAsZYoRPv5AMX4H8ddjdDCNZ7iAFo=;
        b=uDHvzIw+AHaP65gAVE8yvZoZJOpGoCb1wZ7HrGR55Wf5C5Mqg8vo5L8Ssrkif1UVjK
         U47iYDZrLCm/g1meLeuNUc8ET7eYnyJN6sa8/z7qNEwSGtjJUTjXIpWu8LY9JAb232c6
         hEVR+mPRK9WBJBO3Uh07YWXyaafPOcNil9D1XTNn1JZfAGsnJhwJu9U8G67okTrsZTtE
         nkrA4kVvR+UEMLAGv/0uj+eiyUcOkUM4HjPycFoXu51zCcdAYjH5qj0uTuaIlsVGnsVk
         oH9c90qJsniby9EwfZj1uITIeHQm2+oDChmCP5FsfC1usqaKGYXRQpRB2Yu5D3go32ov
         L1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759792906; x=1760397706;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XzfK1528ICmc0tXAsZYoRPv5AMX4H8ddjdDCNZ7iAFo=;
        b=StbzC4AXhipCuUkl/J/pBcbI4vLKsgMEvjEcsR1q3dq1IZfB/G99tmwc/Q8bCAQCGq
         Iws6kbqgZQcI7V4ONZZP71CBLjZp+IuBiJ3/nb5l2ohUb5K2GUMjiZq/IKfX6tG78dZx
         dHNu56DU8oqnlZWSoZTp2Xw7JC/2gPA6e68krZf+xL6RfdbVKg0sPlOE39cVkGpsk8xr
         mgSacW0/BeiIKIaPb8xiXyX2hqCJGqmPDX7cAsnFjMbXoIgPRwGyzPMMT/x6I1npD4CW
         KDkNP884nw4mAs0tAZWXW51Kp7VJFESToQEwQ72upiVtwZfMMY3bB1048WVuHjbeSg/5
         3IdA==
X-Forwarded-Encrypted: i=1; AJvYcCV9Ip2ag9AMvidS7+89bXhUabn6Kx0dc1+82fPETQ43xq0jnSXaw5LRvvayX0x7MJY3aVyevHTdpqMYTp5qFTZZ/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlTPBMBtZNsbbolH4OCb76q//DzbTjGxOgIuBqqrfHlMsbk9Ne
	PGnF3uF2MsgZd6HOakhnOFKsTOAaKQcH/+VejaanL8L8vP5fSPcolct8xqnT1OMYtNlzKFz8tjw
	KbSUp7g==
X-Google-Smtp-Source: AGHT+IFQk/JRlFBeeVilrRKrIrWvH98VXOUhHqyPMmczUypQ4yLO+zGXFQ3cFbalFp6SbZeQtiGfVA0tVYA=
X-Received: from pfbgj18.prod.google.com ([2002:a05:6a00:8412:b0:77d:12a5:d3dc])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:99a3:b0:261:b20d:3ee5
 with SMTP id adf61e73a8af0-32b61e65fb4mr17776464637.23.1759792905892; Mon, 06
 Oct 2025 16:21:45 -0700 (PDT)
Date: Mon,  6 Oct 2025 23:21:21 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251006232125.1833979-1-royluo@google.com>
Subject: [PATCH v1 0/4] Add Google Tensor SoC USB support
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series introduces support for the USB controller and PHY found on
Google Tensor SoCs (G5 and newer). This includes:

1.  DWC3 Glue Driver: A new glue layer for the Synopsys DesignWare USB 3.0
    controller (DWC3) as integrated into Google Tensor SoCs, including
    hibernation support.
2.  DWC3 DT Bindings: Device Tree binding documentation for the Google
    Tensor SoC DWC3 controller.
3.  USB PHY Driver: A new driver for the Google Tensor SoC USB PHY,
    initially supporting high-speed operations.
4.  USB PHY DT Bindings: Device Tree binding documentation for the Google
    Tensor SoC USB PHY.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
Roy Luo (4):
  usb: dwc3: Add Google SoC DWC3 glue driver
  dt-bindings: usb: dwc3: Add Google SoC DWC3 USB
  usb: dwc3: Add Google SoC USB PHY driver
  dt-bindings: phy: google: Add Google SoC USB PHY

 .../bindings/phy/google,usb-phy.yaml          |  91 +++
 .../bindings/usb/google,snps-dwc3.yaml        | 144 +++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/google/Kconfig                    |  15 +
 drivers/phy/google/Makefile                   |   2 +
 drivers/phy/google/phy-google-usb.c           | 286 +++++++++
 drivers/usb/dwc3/Kconfig                      |   8 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-google.c                | 597 ++++++++++++++++++
 10 files changed, 1146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,usb-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
 create mode 100644 drivers/phy/google/Kconfig
 create mode 100644 drivers/phy/google/Makefile
 create mode 100644 drivers/phy/google/phy-google-usb.c
 create mode 100644 drivers/usb/dwc3/dwc3-google.c


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
2.51.0.618.g983fd99d29-goog

