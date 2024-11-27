Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE41E0DD6
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 10:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705095; cv=none; b=uEjIIlvLIwnOeYo6eqK52lHLwCHK4rIaKn87+p9aQGF9PMbOPIBFMx26E0zjRFUD/y0RSmcsP71kuPDWfIwvib6LrSTPRH/2Bm2eyMXcgtsTENd471aTNT0H8cUYyjYnzImViZI0E2q/ByjZREI0wktByt6tIolqJ6AhAfWwzdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705095; c=relaxed/simple;
	bh=+j4kL8jQakPtA0ubTOj6v20Lv2vxrklGu98FO81Id8M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Om0GH0MeN/6DBZuagQrwpqMCISYveluzjVsfI6wUKI2PnS5vD3AUrq8rp1T6wn5kv0BWDEO7w7d1U6mPEpRAVFKNd/DbmHViN1Hepa/AQ4Yz71k5Ucw0ymnNhh2Zf2p/MGYEvN9uQ09XbE+u+VvBj7pBvtb/p0j+Yxo4tn8/3fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mkeu19hm; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mkeu19hm"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa51bf95ce1so794325266b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 02:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705092; x=1733309892; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FnSBghT1PQvjEoqKzE6lYaSFxfTQgIMEYx5M8qLoZaE=;
        b=mkeu19hmS+gux3BLo04TpsDfAFL0LGb4eHkl+1gW5IH4ynkT7r8geVypbIhc2ddrlF
         /tFzO6+EyBH2wekupHUIjtLNL6M28JQKV27/34Y9G3RU78ym4Izssn2DPYBohUMKcdrd
         G5iiZvkdHBejpeGD/l9nf2Gnwb7IUjtU3z7WuWuzzFUn66+xx83jqlwLLVhG4LrxJ8I5
         FGnuPJErpoB5VlZfsnz8zPeeWF9YInHDSX91yJ7K/8ZcPbQEmOHrMYXYrI8mFIRbth98
         WHzWGdZ/+dPnj/OnoczoRcLlbt4qETtBjtlZfgPTiRxJAth/CUIy+NtON5FTlXVxtOJe
         37ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705092; x=1733309892;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnSBghT1PQvjEoqKzE6lYaSFxfTQgIMEYx5M8qLoZaE=;
        b=ugDnRxy/uVnSnaSN2czrWn5NQuQkZJqwb1x+6i2tHjZ4XC0aJwxlw0LRXJirDzfzmT
         UwQWsS8whrX7rblRa1rIdNwb7j1c6xDN7AVNNPodBCcxBFkqlvcKHm11NUuvPhswjOO9
         izmKDOGW1qpVSjMSEl10rq74bG+0XpqaWWQ+pH7eZ4+V2J2VIj0k5tmLGOXVFiCcROxa
         uxqQRc038kkHWTLxNPHs5haoX4MCr0Y3NLfxbmC4KA/CGitENpbK8fy/srrA0zPT4plT
         XvC5jemALMtBQEDgcJXY6PrtZYLEH/YnPpRGdZOPj31WxAPzWr+nkNBC+n0yicaozzMO
         zM9w==
X-Forwarded-Encrypted: i=1; AJvYcCWJ7NFPzwQuVT8jQsheIBOpfMerNXxQBZrxo+emSjx2kHDjfE8GqPPL+aVspAbp5oyGHFotYfKcT/0KbpuCfYNbtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjaKMem6YoEJrqdtW/cEVQPu5p94adke57SgjO1EQpgZdmqqj0
	ClYDjo6Dil4yiZ1wl2s9zgwTzmIb6F7MldGON+zwpncjZoxGifBd+VlOvcmR4xQ=
X-Gm-Gg: ASbGnct08bQwoTsR51mrREXLMcH4Wv6huWzaY4N66GHQv1x/BrIaC9Sm59ZW0yYcvHG
	2c2TXYLqrZ0yS/uIOsgXKsqQIsFfJ2ciMqIvzBDxifCM70B2Ix6781vQkJzZn7IXIIGmq4M8Bqk
	3t9bJbPBGe56AOHgutLgcybf+dwzyDmg/QFLSmpu2oR1RWkwNL2lOEUkFscDE54JDZPDdTKnK5l
	FVWDQ10qGkslKF3wgnXzta+oMMncOJaJ30hAtqXVjCu/bOrknKwYp/ry/tn9FQ6ZIRq+i/UBA+X
	cVQOGP2PtL98xcTNzldthrdLGKqzQEkmnw==
X-Google-Smtp-Source: AGHT+IHtqYL91H6SMMvksK3ZTB/2Fzc9xaGKysfgcuXFtHMmqYC6TditIFw1AYITQuYQn85K2iSkAQ==
X-Received: by 2002:a17:906:1bb2:b0:aa2:c73:3720 with SMTP id a640c23a62f3a-aa58107846bmr200250766b.58.1732705092241;
        Wed, 27 Nov 2024 02:58:12 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:11 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/9] USB31DRD phy updates for Google Tensor gs101
 (orientation & DWC3 rpm)
Date: Wed, 27 Nov 2024 10:58:10 +0000
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEL7RmcC/x2NQQqDQAxFryJZG5iEoa1epbgYnFQDZZSJFEW8e
 4PL9+G9f4JJVTHomxOq/NR0KQ7UNjDOqUyCmp2BA0cifuJkFAjX+cBvKmK4uF62tLl3r9xlDuM
 jv2Jm8Mpa5aP7/fAerusPwzyMdXEAAAA=
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Hi,

This series enables USB3 Type-C lane orientation detection and
configuration on platforms that support this (Google gs101), and it
also allows the DWC3 core to enter runtime suspend even when UDC is
active.

For lane orientation, this driver now optionally (based on DT)
subscribes to the TCPC's lane orientation notifier and remembers the
orientation to later be used during phy_init().

To enable DWC3 runtime suspend, the gadget needs to inform the core via
dwc3_gadget_interrupt() with event type == DWC3_DEVICE_EVENT_DISCONNECT
of a cable disconnect. For that to allow to happen, this driver
therefore needs to stop forcing the Vbus and bvalid signals to active
and instead change their state based on actual conditions. The same
TCPC notifier is used to detect this, and program the hardware
accordingly.

That signal state is based on advice given by Thinh in
https://lore.kernel.org/all/20240813230625.jgkatqstyhcmpezv@synopsys.com/

Both changes together now allow cable orientation detection to work, as
the DWC3 will now call phy_exit() on cable disconnect, and we can
reprogram the lane mux in phy_init().

On top of that, there are some small related cleanup patches.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (9):
      dt-bindings: phy: samsung,usb3-drd-phy: align to universal style
      dt-bindings: phy: samsung,usb3-drd-phy: add optional orientation-switch
      dt-bindings: phy: samsung,usb3-drd-phy: gs101: require Type-C properties
      phy: exynos5-usbdrd: convert to dev_err_probe
      phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
      phy: exynos5-usbdrd: gs101: ensure power is gated to SS phy in phy_exit()
      phy: exynos5-usbdrd: gs101: configure SS lanes based on orientation
      phy: exynos5-usbdrd: subscribe to orientation notifier if required
      phy: exynos5-usbdrd: allow DWC3 runtime suspend with UDC bound (E850+)

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  20 ++
 drivers/phy/samsung/Kconfig                        |   1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 222 ++++++++++++++++-----
 3 files changed, 197 insertions(+), 46 deletions(-)
---
base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
change-id: 20241127-gs101-phy-lanes-orientation-phy-29d20c6d84d2

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

