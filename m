Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9FC15E5DC
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 14:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757861770; cv=none; b=u2c9hQpcFNcnAX4PYVOdtyxo3yaqrcGHQK7Pe1d3HJCobbepTK7FHihh6/PdCEUkDFNJy1N7HiUvjF1SWBi78mifWzWsz9ZNHDb0vs3mevKt6t9U2L3nOq5PQqpG17A1c56zTxF6/m7RIlLRhtOaQcOvEgAoMM7xDcmNPyLa1VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757861770; c=relaxed/simple;
	bh=GtzfjRzPIcRz3TlDPzQkhFG0JB1MRNghy5cWBQyLfB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AXQ8aKrifzCM6dnVCfuUb110uo4wzXBC3m0twbDQsFbhnQ/weFJFg6KqZ75ym39UEYVUelFQn/NEbxtUEHF4KyLXtVAj+X5NyB520Ic1IOpr+hgQNAm+5LoFhADyAN/V8WpmkO/okTsRRQiCm7MP76S7uAp+le3F3w22h62z/q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqxMqJ/k; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqxMqJ/k"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ea7af25f8aso86551f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 07:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757861765; x=1758466565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5qapOJtKxyY0MNaqH7qXtB8qqR3nlxKXEctWyb1YrfM=;
        b=eqxMqJ/kF3Uo4/Bf1swgDqKzqb1RNYU4W1rBYitmTmYaurnEh2yJQVCiwyGpfknVBw
         sbbjw8eVEHm6ZcSVXTNYNJl9x8QHDKk2AKP4/bT/nu732Okan662mosSeei4G6UTceYh
         YGGiNqCDBzYf21KUc7ufl3ztwjn5ETniKHGbZbu6P59KBrVw89Sq11Ur+6uYBQ9IRvD2
         qLXVPrVsEhJSep1r8Whv+axZNrbqILqIsAQGA6o6LIfhkPWCjJEnm4yDQXmxSMuhew0z
         TrYOs5guhHIoqcW+GB4AmW1jYcr95SD3XQ3ZBkc3BDWwumcrvLPRcpW9Pp7mHaK7ws1D
         r7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757861766; x=1758466566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qapOJtKxyY0MNaqH7qXtB8qqR3nlxKXEctWyb1YrfM=;
        b=xIMp1lC+3X/lV/ZqQ/7gPImEyBYvm+mSIOu7BhZleaPYGpsICXX8VrUkCvbjHHuka9
         KJEkiZbSlecXPzzRgCtuQ7ueQM+XIMarm7ktfVgywDYFE7G7bouI+3d6h1rdt8ETBlcr
         oeyn1TxeU3Oa/H08AoFUNKDrcwqHedemIPBsYjO1+LHzu6m705iPlsgATbZHtME3dtH0
         zDkOFZOgAn6XydxVaCvv4WwtThu4DlBv+h6IwdvUCfdfr7llbzW2wAHfxvZ/rrihetGc
         N6o/YxGQk65ydgXM5ei1jRrBEUDAH2Qy3BdFvZvN7fJGvgniy4JhGf7b+oz2i2n8mWKD
         WUkg==
X-Gm-Message-State: AOJu0YxtRXIQaDg6nEN8oSbS1S5m0gGUJBbf5fIW3c4C2sO6Evjd/CCL
	f4cPEA4K6Dxrk5dcYMJi50qyM2bKp8wy12jZ8aUO/6D1iCbAb6zd5/Um
X-Gm-Gg: ASbGnct/xAnczyRDY4Xr9Jheaw/Ff/ZjJmE0JbU1viDBhCwVwEPZPBNg2Dmcx5yKFx5
	c3FPo6jMJ6iiAANCmlOy78VDXIs2oU27/S9nxfwZoilrUqDSJquDzMsAXZ16YPg4y54+HvWjVo9
	O0OEYzqNrZg2A7mEkPxK5Z+FRuUt3EvoN0veBBp4eaYqqUkBmX3Z/Im+830PAzaQsBoctomQR39
	Tt7lxRVV2MA/BiD98i9/4zG0xjRPhAGQ5Lk0Z1i2qlOFfZyAI7fVp2xGkxvynM3qq+gPLXWikRh
	mMc+3eHw4SaAjWmwUP+07BNquNFBsSd5skFWUZ9g1IShXghQ0jqcipxId16HSjQYU8QqbQOms1x
	G2QWhEHv2+ohEI3Y0wOtPvEREnmMPH+B8NDb66HHWtFzBm2gQykkj0cEQ3DsTNKLwxcspZlLHOA
	==
X-Google-Smtp-Source: AGHT+IFV/3JZpFtVZv9IijfdfagkrdK3hCy/JcOZd8MWso5BvseWKVtiecc8/LFjzi/kNn1nTtuUIw==
X-Received: by 2002:a05:6000:2486:b0:3e7:404f:685 with SMTP id ffacd0b85a97d-3e765a197ebmr8559306f8f.44.1757861765516;
        Sun, 14 Sep 2025 07:56:05 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037d62besm136303475e9.21.2025.09.14.07.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 07:56:05 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] phy: exynos5-usbdrd: support the exynos8890 USBDRD
Date: Sun, 14 Sep 2025 17:55:53 +0300
Message-ID: <20250914145555.2631595-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds support for the usbdrd phy for exynos8890. The SoC
features 2 dwc3 controllers and 2 usb phy controllers. One of the USBs
is used for DRD, whereas the second - for host. The host one seems to
only be used on the MV8890 SBC, which... I don't think anyone has,
really.

Code from this patchset can and will be reused for 8895 (I actually based
it on my old 8895 work but decided to upstream it)

Best regards,
Ivaylo

Changes in v2:
- fix up the messed series (a patch from another subsystem was accidentally
  sent)

Ivaylo Ivanov (2):
  dt-bindings: phy: samsung,usb3-drd-phy: add exynos8890 support
  phy: exynos5-usbdrd: support the exynos8890 USBDRD controller

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  25 +++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 210 ++++++++++++++++++
 2 files changed, 235 insertions(+)

-- 
2.43.0

