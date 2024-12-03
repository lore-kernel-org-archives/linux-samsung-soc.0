Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380601DA0F5
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 12:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733228033; cv=none; b=hPIjOWrur0WtaTYzbLAUm2YhtEWQLBkvx5sUMoxHNFdYwd+dwhyFOQFGpsc8MmuW+YxJv1cLELm0kTv7C6YyZWzmM+IgTOv97m5VbC0GFzUXNAT6je77/2MVQ1bfzT7me4f7FtaJ9gfsdLMXttjHfVm3bRB0v9x2z/dojxESEMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733228033; c=relaxed/simple;
	bh=ACKWQL0UkQUS7cOWEjRNwI1FfFj12bO7OxDuhVTv4KE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MR9gJTJW98UuxkTAcALgTyzd6i5cVUn/TpG2Y9q4GeD+VhM98S/upHahNrvcq1uOWVib2A++oH7/i7QxjvkrHW9tOfHtBT3PvkaJY7tj+AwlziyHbRQsa8OxNJv8QSmyw8GUp9m1ioMkl6fdOZR2bRE8FFrRgFisNd7Z8c2X0c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iJaBU//F; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iJaBU//F"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso900809466b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 04:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228031; x=1733832831; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+D27OUR16Cl4TWEJRos/7LAnM8aBb1wRGjF74GArkfA=;
        b=iJaBU//FeDPXTTN/bLEC/FYuS4UdJNU9LBIInxQ2hL9/uIPfaEEbPe6nrQSVsyxQzN
         S1CrogAScPi0v5ZoFgCNPO8qna9dHoSmu090XDuCyRuVuAvsPaXsnOqZTx1nJ2xEGavV
         p9XR0sQLmNscztj39ZcYPGDh8J7SLGmiUDbILRNxwID9qTSJeCxKA7QILxzbqzhbqb+k
         8U47/FRcBEP7pEFRfSUjDWCD9lEwl5gy7pxMZuM+869WnJY06gy7SX3M7bwxYzkXzUdi
         x5khK2CtaQdj8/AW7jXF4/yBZK44Cg52q31l+BrMdxEoKRIEQ9Q7j2nym+bspyJRophE
         JjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228031; x=1733832831;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+D27OUR16Cl4TWEJRos/7LAnM8aBb1wRGjF74GArkfA=;
        b=cNe6wBxSz3wB+1mwEly7/W8rxp1di6F1tPo/4hJVVTqr7Kc2snkwJISaz70MZAdnf6
         ZVOQv2Pk19GSKmxDBpE8BcDUYu/2VT7XwWbmIH0c70vE4wQ82x7dk542rEEjgW7EkmQA
         x1IHA3ts30UTjNiXFyxWUbE5lsn/RVh1sc417MbtOH+lKwRXbDVhAp6vSEMERVUk1AF5
         51HXPMBCqOGc3WEFBHUcAriYi1r9FZfE0mX+CW9vw5T4F9KOtz7+FjXkRt2wb1uYrhDz
         vUJM1G80HJ9F4z6WkSGpQm+Nok2VeqDnrgxrRIE9d2LFHXOk3HPSkyYbmPmet8vymHOe
         I1jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkhkIGwn6Vr0N3PV9WOCavFzPZeD/EHBckAbPomb4jjn9WkFiuSpbje5ikr4CrpNYD4YgKqU8u5zEc7ejqrl6LRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKU/i5WxPGTHif+u3SuVoxzbZgkM2l0fby4AcmaeYskJxy8NdV
	tPFVyCQgGKmE5ax9hcB1iwGuRrUH1EG6KzJzxq+LLiW15E/PnQvdrQn13DlrdQk=
X-Gm-Gg: ASbGncurqydZFiiFYSfmJ9MKKLgbyHiM/iuRmaeX9wWn/RL0zrIhAwdM86E++3nPBc+
	WMLnixVsm75xT7SeBYxlVxPpLYE1843dyaYJaPMjT1CcFB5l7p8WYCGtLN0InhroGQIdJlWGATk
	q9dUboOBlXMrjnYwtPe3W0UdQtS2HHgyH9cYS5NK9auOV+c5uewtXnU6qFFcEvVV+esTSSm61t9
	goo2bvqdXTl9XNi12WgWkprtTvzInwfFmnthwy7aApnHhJO6zEtEFgfmC7tYupabmW0igVCKYY/
	GNVwpuo/8rN70Sv+h975SQerhHqxZ5hrNQ==
X-Google-Smtp-Source: AGHT+IG/LNiQRH1H/AD37FJTCdb/ukxG6+4AcIb4aIX7NrDNY7ETqg4yetmoSzQOoqOa1fQIjvYgLw==
X-Received: by 2002:a17:906:1daa:b0:aa5:1661:1949 with SMTP id a640c23a62f3a-aa5f7f2413dmr188219066b.40.1733228030629;
        Tue, 03 Dec 2024 04:13:50 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c245bsm607603766b.8.2024.12.03.04.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:13:50 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/8] USB31DRD phy updates for Google Tensor gs101
 (orientation & DWC3 rpm)
Date: Tue, 03 Dec 2024 12:13:48 +0000
Message-Id: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPz1TmcC/42NQQqDMBBFryKz7pTMIFq76j2Ki2hGHZBEEpGKe
 PemnqDL9+H9d0CSqJLgWRwQZdOkwWfgWwH9ZP0oqC4zsOGSiGscExnCZdpxtl4Shqz71a7Zu1Z
 uHJu+co/SMeSXJcqgn6vwbjNPmtYQ9yu40W/9/3sjNEhdPfTCZVOZ7jWrtzHcQxyhPc/zC6gJ1
 QTPAAAA
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 stable@vger.kernel.org
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
Changes in v2:
- squash patches #2 and #3 from v1 to actually disallow
  orientation-switch on !gs101 (not just optional) (Conor)
- update bindings commit message to clarify that the intention for the
  driver is to work with old and new DTS (Conor)
- add cc-stable and fixes tags to power gating patch (Krzysztof)
- fix an #include and typo (Peter)
- Link to v1: https://lore.kernel.org/r/20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org

---
André Draszik (8):
      dt-bindings: phy: samsung,usb3-drd-phy: align to universal style
      dt-bindings: phy: samsung,usb3-drd-phy: gs101: require Type-C properties
      phy: exynos5-usbdrd: convert to dev_err_probe
      phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
      phy: exynos5-usbdrd: gs101: ensure power is gated to SS phy in phy_exit()
      phy: exynos5-usbdrd: gs101: configure SS lanes based on orientation
      phy: exynos5-usbdrd: subscribe to orientation notifier if required
      phy: exynos5-usbdrd: allow DWC3 runtime suspend with UDC bound (E850+)

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  24 +++
 drivers/phy/samsung/Kconfig                        |   1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 223 ++++++++++++++++-----
 3 files changed, 202 insertions(+), 46 deletions(-)
---
base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
change-id: 20241127-gs101-phy-lanes-orientation-phy-29d20c6d84d2

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

