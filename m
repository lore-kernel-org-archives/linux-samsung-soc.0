Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AF5134BD
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757859479; cv=none; b=Gp/dkSmhsJJA7hWfWqMTf4I40GqNOQDcwsYwoNTIZh8YOeMNoOui6Hsl97tUAQT+RCcy5diK/XcXahAIfg7qNoj2VbJPntU8fn6ZovU/ZPDOomQ7giOiSsnaGvsk0VCyDby5WiQ8oEOkb6onLqrAb3JxIu7NnWNStPDzV/qdyrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757859479; c=relaxed/simple;
	bh=oanHDB/HU2SsYAo3QKajuMOnq/wtBoc5Vph6yvBts6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e4nWdeAl5d+YbpbAJ6oVK31bKMAudmoNxAcWSVKYdlohEOiLvLlRoWTcdUNI2MXtRWmqIW3d3XyeJ4FFJBlyasUpFxDo2Q5OCDj9xpqu/iindy/T4bCeIMgtNUQfjrR91DMqRsSSAz1/zVYaXU2APARlx0omXvqngS6xV2omIfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYr1itAM; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYr1itAM"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so2349341f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 07:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757859476; x=1758464276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rsUHVkzZaZp36viUnZ0K/EbyNwm+EVEnUQ5b1FzHDOg=;
        b=EYr1itAMOIfdrCpe2HS62umcPEJL6+uAcVycupbYnWKiGsxhiehGGIN19MMcP1ricl
         mgJJr1nScQRJ2FN2KIFvX7kODSpUEE3KvK141IJWVR0+AkoWVTdwqlH/pxvKr3c1vxsh
         U76N7XBdMtMlZD5tgmGk56ybae8SKd/FMTBpBSN40edAb9g/1OcPvtE7wSvtSVbnETmY
         3lRLyMVatgLoafCu6vTq77vsWmTdqZoh6mCHDI+QHVD1EQz1Vo95ITxs7nDQ/Hgp2eUI
         Hf+hynf7ABYoyjg8oSMJ0VWqst3yA/auB9nAa8PE4o/wnA/ND/rMB6VpUZbbBHj+lMGJ
         U9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757859476; x=1758464276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsUHVkzZaZp36viUnZ0K/EbyNwm+EVEnUQ5b1FzHDOg=;
        b=BKrripX5Vi9EO7vpFARhlXmOkHly+zMObB+fFxGjiQrX+Xp5tVnDGodr4+/2RnVUa0
         j3a7KIqzfZB0QFSEVz8zFB37yzewg0hH7sZBa+40LNcNUm1oiUxPTyRIFLHY8p6cZBwl
         8yriF3ItvEYUzD0c2Y/eI/z9q5pE5k3l0kjS9y7cTKBZmUWW/nTqwEc1hApSsOPzjsgu
         RJFQBGgI/bXJQCGGXa36TdzC40zp9kkKYQiHwBinAIzRV5Bw6yjkwpOKG7hdFUO/N99b
         FMpYRBtJLRUGFJK/D1kPpcsE/jTGOUI+QUmSPNXneFSGRLbDMld3Ion4hFEoLu5zuTSj
         Mifg==
X-Gm-Message-State: AOJu0YyZXv0L6Rru8qVN3xdAY0JAqTQGc4w8FXZpWBXjVEh6X5s9dMKN
	16f/4FpqFZQj0pLS7jzUuuf8m0Z8tNq0Y1STOiDzylALNgQ4Z/t6FV3G
X-Gm-Gg: ASbGnctNGeQJffKnNsvY66fzhiLAIbPJaG2D3hbj+rOWsmjdEbs9fOPT17jlhlqHE5o
	CYJ+JWeIC1fyFPApEm/G5cdzoB+Qs//Wf+faL3ckP90WUmPtiSJFhdBYM0G9n53RrHDlZFC6A7/
	tZauJeu6douyd2Bi1mrVAzvAGI+Kp5FM6kMkSFCFIDVIpBBDYJGnQmDVYNHpI9ZIckQMPYNKkZD
	XmCtWOjB1Uu5wIilaXBJYYGKiCjnAHYPv9vpBEMBWRNOSzx+KOLMp4KpOwMpZrBFVyqu2lG2sJd
	qeo1WZoI47moRs6zBfHkkOi49awAR/FiZW1DnxDbpcM8lY1kEcOtzRHZGos7NPE17SmSHM2dj5y
	MBMgkt8A7FA6GmGEhRv8PfA/b6iz4P/5TPS6rOCI07oWwbE2yXrHaXGnSxanRy1Er7NIpKf0b51
	dRRg4DGPA0
X-Google-Smtp-Source: AGHT+IG7SrhD2n8YR6eRCNsiBeL2SRv1fue30YukLFK37eQXkOEUvQbSB53x/xhqHBpjrKKhjtKgHg==
X-Received: by 2002:a05:6000:270e:b0:3e7:9d76:beb5 with SMTP id ffacd0b85a97d-3e79d76c25emr4400712f8f.14.1757859475877;
        Sun, 14 Sep 2025 07:17:55 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e813eb46f3sm7319270f8f.23.2025.09.14.07.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 07:17:55 -0700 (PDT)
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
Subject: [PATCH v1 0/2] phy: exynos5-usbdrd: support the exynos8890 USBDRD
Date: Sun, 14 Sep 2025 17:17:41 +0300
Message-ID: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
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

Ivaylo Ivanov (2):
  dt-bindings: phy: samsung,usb3-drd-phy: add exynos8890 support
  phy: exynos5-usbdrd: support the exynos8890 USBDRD controller

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  25 +++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 210 ++++++++++++++++++
 2 files changed, 235 insertions(+)

-- 
2.43.0

