Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2CB3DAC17
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 16:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733502665; cv=none; b=Yk1NWrzozwTZeTEP2ic86eIsRzg3xXmN2RttpO8bmLxuxqRqXPtuOqdx13JcbRHKuqvI24Fj06j9lu+t+JnGYOntxV6ZnfpHzur7SdtUqsQOOKGsOZ1yO58X4EgbRMUsiD3NRJg3Bz1Y4PrMLzY2nlHxDAFxPZMpjb5l0ZEGoN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733502665; c=relaxed/simple;
	bh=GtJoFybvFh6AbrC9O+Fzs8cMuNJZ+3NTaYZfoyrNIV4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Djuy8BXg1NkCjB0zOfZSueqoq5Gmaq2vvbmy9/f04I4RtG6Pprv8fHq8PWk8DXmgZ8ex07wKjbJPLz/gIQw5hSU5wjiV2N9O4TVpJWtQfRt0Eo7pObPnBCKZFwzqcBMH3UV4JrdJb/2kgz8TlO2KDF7+08wmONJV96LBvstVWWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NNZ0Dq4P; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NNZ0Dq4P"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa5366d3b47so357125266b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 08:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733502662; x=1734107462; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b7nSjvUx63MADVpt7oEUea+FY7rhNfLzD9bh4ADhfVg=;
        b=NNZ0Dq4PBde1CYREkSzdmPUnZQ9apG3wAr/aao1jt4wjCWpeswCYV4MtwK1CeBrViT
         QqUVCYgRmYQIvjIOZlYpOdYmUViD5AI4tYE79H7KE787Y0gUmrG+Qm5aJ3O30Rj3IzxS
         AP9JHHtcR/fJVucgV+kqighH5mvgQzXucKOArA+FbY9HRN4YN4JH1CpH38jaYhypFMgR
         yVyoStUdytZExi1I4A95TZfIj39twV6FUosh1S/nyKytQcWw2vngHc91LmpzXC0LQbpr
         KfQft6ZiaJYohfblszXb/L81nizKpk8lJ+DAnBHeEPfINPqZuME+6TE0t6BBExqQWQw4
         H6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502662; x=1734107462;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7nSjvUx63MADVpt7oEUea+FY7rhNfLzD9bh4ADhfVg=;
        b=ixshikCE1WjBp7srkG7tuHm02faMQnXF2ytiahAb7pakgmdinexeAfj+doZqs6e2hG
         5mva2z/ap3cxZOXFLX6zm4xSXSVRZNYq/l7IzXUkyFPfnjWzpVA3wEFqXZWOFDvdDe71
         1gnSwwZuD7a1B7PMK37yXKwZ5joxBf92GtXbMRxIq0KsYaEL2WatB7u4h1oTB6oycuVp
         ASOSHtrcrk1Wh+c1JGWLay06WL53PCiNE3KVS5ZrRmA9hQXFbyXr0bqHgkedIBhzeXEq
         FFmbgrrEktINQPgeG8BDCPVtCCoDCWQPxEMptCiaZ29Yx4Q++OLpr7qwtr74gFo44HiX
         3TAA==
X-Forwarded-Encrypted: i=1; AJvYcCW1NmRR39yRpMAe1zVvu4wmBZ0zkEh3V+CJQNVpZv9u7uFCUY+cF2dBtJf9yXk3kQfAxbCt+0gMyZSUNY4VEYiXaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym/KwpdyPt4txYPU+UmQmZQiPLdeEjF9EpeB+68gKWJ+6Avk99
	8D+sLodx8uFQhPgEVg+htpV9/1nGikpFL+8uS9nitCSx/q/x0veWamp7Bz7Hd38=
X-Gm-Gg: ASbGncvDqSwuRAaps24+4Y+g43W/dOh/n+TZbyvU/vNkqhRm1R9AJZj1/OotzIxu2ck
	jXn96OXa03pxoAXhGgEc+dDtyK0AS7PvUFDvfAJJY8A7fibK3mmQ+vMV+QOiE0WvKjXjJhsuYv9
	LDi8ip3CBfuJz8ZYavMAXcM1at7+o4R7CqF8VNgmS+2ejpGsAjslGni4xNAUbrFgLhPkTrK2HWw
	xcy+qWmwd4fpqZ/kiVmV2NJDBsTmd3A+oBEGjMwwKU38X2fHiD8VBIgfs4ywq4nON6Gl5ETiWKn
	pJ33JYCSuaZfV/vQU0b+ewO7QCdeApxl1Q==
X-Google-Smtp-Source: AGHT+IG5YohV/4iJ4GCzEmX7QvPbyvRE1dHLvIsPCNB971me4/Bxko7NAtS9jjY0kEtDTyMZljoJ8A==
X-Received: by 2002:a17:907:770d:b0:aa6:23ba:d8c4 with SMTP id a640c23a62f3a-aa639fb1a24mr339321566b.4.1733502661682;
        Fri, 06 Dec 2024 08:31:01 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e8af8sm257710266b.191.2024.12.06.08.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:01 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v4 0/7] USB31DRD phy updates for Google Tensor gs101
 (orientation & DWC3 rpm)
Date: Fri, 06 Dec 2024 16:31:00 +0000
Message-Id: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMQmU2cC/43NQQ6CMBQE0KuYrq3p/1QqrryHcQG0hSakJS0hE
 sLd/bBR4wKXM8m8mVky0ZnEroeZRTO65IKnII8HVrelbwx3mjJDgRIAFW8SCOB9O/Gu9CbxQHM
 /lAPtthYLjaLO9UVqZKT00Vj33B7uD8qtS0OI03Y4wtr+b4/ABYdK2dqgLHJR3TrnyxhOITZsx
 Ud8gyiyfRAJlELXltRcCf0DZp/geR/MCMzQKoTKaITiC1yW5QUJoFYgcQEAAA==
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Changes in v4:
- separate out patch 5 'phy: exynos5-usbdrd: gs101: ensure power is
  gated to SS phy in phy_exit()' from this series, as a stable patch
  shouldn't be buried inside a series like this (Greg)
  Link: https://lore.kernel.org/all/20241205-gs101-usb-phy-fix-v4-1-0278809fb810@linaro.org/
- Link to v3: https://lore.kernel.org/r/20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org

Changes in v3:
- patches 1 & 2: update as per Rob's suggestions
- patch 7 & 8: drop init to -1 of phy_drd->orientation (Vinod)
- patch 7: avoid an #ifdef 
- Link to v2: https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org

Changes in v2:
- squash patches #2 and #3 from v1 to actually disallow
  orientation-switch on !gs101 (not just optional) (Conor)
- update bindings commit message to clarify that the intention for the
  driver is to work with old and new DTS (Conor)
- add cc-stable and fixes tags to power gating patch (Krzysztof)
- fix an #include and typo (Peter)
- Link to v1: https://lore.kernel.org/r/20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org

---
André Draszik (7):
      dt-bindings: phy: samsung,usb3-drd-phy: add blank lines between DT properties
      dt-bindings: phy: samsung,usb3-drd-phy: gs101: require Type-C properties
      phy: exynos5-usbdrd: convert to dev_err_probe
      phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
      phy: exynos5-usbdrd: gs101: configure SS lanes based on orientation
      phy: exynos5-usbdrd: subscribe to orientation notifier if required
      phy: exynos5-usbdrd: allow DWC3 runtime suspend with UDC bound (E850+)

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  21 ++-
 drivers/phy/samsung/Kconfig                        |   1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 202 ++++++++++++++++-----
 3 files changed, 182 insertions(+), 42 deletions(-)
---
base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
change-id: 20241127-gs101-phy-lanes-orientation-phy-29d20c6d84d2

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

