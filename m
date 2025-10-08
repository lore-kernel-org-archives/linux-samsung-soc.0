Received: from mail-oo1-f74.google.com (mail-oo1-f74.google.com [209.85.161.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7B52BDC0C
	for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Oct 2025 06:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759903213; cv=none; b=fjEAJQoSZXG06L60jSfgXwVkxBoNNzHFNagfba2JXf0hL40/dxGbw8Z8fKthjldQhzy3o9OOb/CNoLdYZfRcBDBo3d/MlJoJCfeX8poUz8JKhtXt2dYFkB1Dk4B7K+G82jBEQrOn4RwHr7IzGDq9JcYVfa3SENTWc7XcrZpKcIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759903213; c=relaxed/simple;
	bh=Re4aYmVY4+mRn8xwwmfbfR8Zw01dBZqm91ZI3IkjBPA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MBCRnnQ0wXGv4yEfHzdMTUsl7zvmnwPXWXHerRkpuhbydthmdvAodPVKORr9eviH6AXEdfj36v+5zHvBNQdtrUEutvZn+02++/z9squtdbIzD4YueCQzQs84ClDWtX3VBIXLWdldbRcI+g0Zh0HC4qTb/mRz38c98M+KBdmOoHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ka3L04dx; arc=none smtp.client-ip=209.85.161.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ka3L04dx"
Received: by mail-oo1-f74.google.com with SMTP id 006d021491bc7-64d38b1aa32so1127999eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 23:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759903210; x=1760508010; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AP6DiX2vSgFvsuE3fKRpRDJbOdj4dqy4q7VW/8dnF2Y=;
        b=Ka3L04dxu3SenDU+iB50QOyc4oTm1wtaJPJxc/OQh29r0I2vqrAi75Vp6TROGXeuHv
         RkNG5vpi5Xk7EkUgdALUuwPYNterzOdzi2Q09JUxPMf95dXC8F6yyOUb6wQqFvXKezd4
         bhvPccBnwoYNccM7QV1LRmU8IL+OCK1kH0OpFLVHXUnYiY4lXw8hNuAgKWrg+7XrRfPN
         mRrkoxDXHi1jIdqxmXGctwShhn9lxOvgta49PlJ8mSiwK1Yvs5Z2h0DOfzPII6sFQNz7
         WWyUtgzePI6vtaf/FX4wAQqmDCn6UX5VJnl6/SdCEFsumdOpWw4VPV/R2F+4OwlKpeLu
         zbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759903210; x=1760508010;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AP6DiX2vSgFvsuE3fKRpRDJbOdj4dqy4q7VW/8dnF2Y=;
        b=fOnxQ20+jnmcm/ToRruz7K/G9yMDw81QNIVXcDyV9J69czGuFQRfG1OkVbBvx8qA6I
         JREwhGfNUq+1Ah/n9YJ2M6T9xCyhtvQYB1reNkEU6tgdKnG184hLLnm6blrYNGhkCRiP
         k6mTIz/4nCLJuMfhJTRIk9jjsLJxaIBaXCnAVHJUobms7+FzBJrDwN4j4k6zN9VpD07d
         /zAtn+GUEqLJ/zzlF+HvSqpneLMSqYboYvRkzI48jxkhtXBTzNlDwrd9/02PIQO9wfto
         0+gNqRxcv5c6yzuLdipXUSwi/XQQ591+9o6vado+vnDR68Zv0SktIvkPTn39948uSV6d
         +fcg==
X-Forwarded-Encrypted: i=1; AJvYcCUG5ugLlZ2450gbXH9yv6BK9JaXBnQ885koY6oRjQCFAvXIrkIeT+Zh8O3ZxTaKonQLlaeu3lhemnx9uLdkGIkYsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWI+IXoZPtZKhP3h9rgzJvcnRHjftMJtJvyMSKyqgP1Xzl6J+N
	3nG+q5bPfWypcT4zUKEWa7MrsOG6j6TyZ4LWsWvb2xYFYQPyzngJa7hnMGqOVWdIsVh8tpUJbco
	zNteA7A==
X-Google-Smtp-Source: AGHT+IExUaS0sEpy2tAXscJ/2X+pom3EjFHo1AYYt3+9hKmXEYWCEaP2JPhBawFpp4MTEQMwGSBBqKvOJGE=
X-Received: from oacoo38.prod.google.com ([2002:a05:6871:4526:b0:331:9a49:4dbe])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:2b25:b0:36d:287c:694f
 with SMTP id 586e51a60fabf-3c0f80edcd7mr1302345fac.30.1759903210532; Tue, 07
 Oct 2025 23:00:10 -0700 (PDT)
Date: Wed,  8 Oct 2025 05:59:56 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008060000.3136021-1-royluo@google.com>
Subject: [PATCH v2 0/4] Add Google Tensor SoC USB support
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series introduces USB controller and PHY support for the Google
Tensor G5 SoC (codename: Laguna), a new generation of Google silicon
first launched with Pixel 10 devices.

The Tensor G5 represents a significant architectural overhaul compared
to previous Tensor generations (e.g., gs101), which were based on Samsung
Exynos IP. Although the G5 still utilizes Synopsys IP for the USB
components, the custom top-level integration introduces a completely new
design for clock, reset scheme, register interfaces and programming
sequence, necessitating new drivers and device tree bindings.

The USB subsystem on Tensor G5 integrates a Synopsys DWC3 USB 3.1
DRD-Single Port controller with hibernation support, and a custom PHY
block comprising Synopsys eUSB2 and USB 3.2/DP combo PHYs.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
Changes in v2:
- Reorder patches to present bindings first.
- Update dt binding compatible strings to be SoC-specific (google,gs5-*).
- Better describe the hardware in dt binding commit messages and
  descriptions.
- Adjust PHY driver commit subjects to use correct prefixes ("phy:").
- Move PHY driver from a subdirectory to drivers/phy/.
Link to v1: https://lore.kernel.org/linux-usb/20251006232125.1833979-1-royluo@google.com/
---
Roy Luo (4):
  dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
  usb: dwc3: Add Google Tensor SoC DWC3 glue driver
  dt-bindings: phy: google: Add Google Tensor G5 USB PHY
  phy: Add Google Tensor SoC USB PHY driver

 .../bindings/phy/google,gs-usb-phy.yaml       |  96 +++
 .../bindings/usb/google,gs-dwc3.yaml          | 145 +++++
 drivers/phy/Kconfig                           |  14 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-google-usb.c                  | 286 +++++++++
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-google.c                | 597 ++++++++++++++++++
 8 files changed, 1150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,gs-usb-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
 create mode 100644 drivers/phy/phy-google-usb.c
 create mode 100644 drivers/usb/dwc3/dwc3-google.c


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
2.51.0.710.ga91ca5db03-goog

