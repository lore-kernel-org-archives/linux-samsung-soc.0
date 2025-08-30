Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA2626E717
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 10:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756549149; cv=none; b=lWDYrguwbwW+EhcjJXc0nQfupWFwrX2ou8q7pjPxjbW2+hVpU23YMXe7d42FA2Wul6niJ9leJKzjTc6Ln2FsEJz+K4YvWwM77MGfaruix0pBr4abJEXjKasR4Bp/L4wGzp0RRmizI66fqpDFeFUKxIl7IRNFawL71VkygkorT5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756549149; c=relaxed/simple;
	bh=mBL3wH8Zv3gv3XD9pXxPdu8BLbNtjAnS1/nt1THHYdU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HJel0eShjlRf7nb6zvbRVg/iK7X3EmqhVRSyP80anUnVpFaqLK3Nuv11NE1xkVjU0W3K55+NgeBBgUjXvH62CImW0k00C7OMVTv77O57qu7hGf9QcsN4WiITDfTcze5we0waH2G40eQcNgUIt4SkF7CmNJmNRgnqk8EyRZApEOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=opyLd51d; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="opyLd51d"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3cef2c300afso301005f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756549145; x=1757153945; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5sUn7QP2kz00DztPqMuLvh5JhaL5x74fWgbdKmTLlw4=;
        b=opyLd51d+GtF6e8bu2Z6jF8iXcu3Qtrc2PYP53ILlsPusb3RmErsfCCT7p2ihVGB/+
         sG7K0nJ/kQ1bG3L5BQXkfjtc2AmfM33LPMl0xqdiQ/NSZBKbLte8hMFF/9c1ytDFNm9g
         FXlft6xUjRyJXCAqNMiVjQa+0RvRR3LLXBWx/QZs3YmEqfdONVfF0TkBPd0yaQyureGZ
         3v+jfFFu5ZgwZ9+Ar2BCrKIOD9uLOq9dpE6ATm4R93fstT1dMrrQHBVr9URq6GKHDbk5
         QEuFqsl9dKJH0yVR3xoWkl2pZH10NGbdsfCrlTyhxobEPAVgOdBl+g31YFluvJHSP4Rd
         lcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549145; x=1757153945;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sUn7QP2kz00DztPqMuLvh5JhaL5x74fWgbdKmTLlw4=;
        b=JjSmNxQSYylRYAZVgHV78/hbcmpuWzLFRthYOC1eDY9I/Qx9A00sizKYQ5VwdQp4bb
         VPk6dZER0yuFZ05uzCx2IP77mpO9wLSQJj28joaN3Z4pi2+Hw+S1ffZwduKFAb/abT2d
         BJnPHgoAGqpH+GnFK0czv4PIY69hCwyXQMlrrd/gwmv1orAw+REuXbQimQYp7orD85nv
         O4OW34jrv+marCB9FcXsI0y7MaiTNTgdcZXgPh1h9vqQjCB/d51CR+zEUygFfINKd7yV
         B57/eoJLtNsThQUkwWr3OFmsQQoxMayaQf0whi74c34QLP9Tc82rfn/J/aP15xFSwviW
         5nCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDpqj6SSmP6iEPI0xboWfWskR54IJEVGe7qcXoM7HhP8FAdBLfQKSBtHIJfTUar0ezlTy7ZpCQnUEICi2sBa2DDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrNqo5iU9IqpLYIc2gO/DTckq3X/6ebWi1qqcm7xW+VZ9DfIzF
	gnDwPSWen+nTSt3bFQfhxPPguCCnbtqOgXpE+dLBjka2b8QWn0lF/SI/lFFjU+69L34=
X-Gm-Gg: ASbGncsAgAhd+M9CYJJnmlyMXHGBnhE6w2z7cJSkJzl/oPpxqMhSgoX3eSM13rB/ufR
	OX653lFHu2tVBopmHz737/kcQILCncpzZ59GMrhK2EetBxTjJuQDJOAISRYVoKMiwOTkwunqHfc
	UP3+ln7GirGxXvXLAZr0yDENCbY9OZlHUEuePcyfF9Xgy0vTXFhm7UuB+GTIa414ATizoPHz+mr
	nVk9fdlaYmRAEaED6MaQth99y86yPaerskdj78+L2Ovqvw5juiysUqTebmeSw2a2jtDNIUX+nlq
	plkFmdl0AifiDwaaRDkAO48gz96Ye7ntQDcl6LEMkE+5x/Tf+GzYCiBddNpdQNszpPGTmaTwM5y
	b/HsbRVv3buBz+WIQo2FrQygMvyui6FpyNEBSZxXodomu8+vIrQ==
X-Google-Smtp-Source: AGHT+IHbvCTcAI6lW9P8ZAuKzeHNMi6YmoSOvGR+3NoZENtf5TPqRuQC7jK7/7r4VeX5isvy0wOxHQ==
X-Received: by 2002:a05:600c:8289:b0:453:7011:fcdb with SMTP id 5b1f17b1804b1-45b81e930bfmr19246945e9.1.1756549144734;
        Sat, 30 Aug 2025 03:19:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276c8eccsm6547492f8f.20.2025.08.30.03.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:19:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] watchdog: s3c2410_wdt: Simplify, cleanup and drop
 S3C2410
Date: Sat, 30 Aug 2025 12:18:56 +0200
Message-Id: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABDQsmgC/x3MTQqAIBBA4avErBswJZCuEi10GmsgLLQ/iO6et
 PwW7z2QOQln6KoHEp+SZY0FTV0BzS5OjDIWg1a6VdYovNxO87hOmA0hLezisSEFp60P1ntNUNI
 tcZD73/bD+37RmBCIZgAAAA==
X-Change-ID: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=823;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mBL3wH8Zv3gv3XD9pXxPdu8BLbNtjAnS1/nt1THHYdU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostASNGDkfBHqdI8SdUYlxbtH7WC94z0R+uy+A
 mta0ZnarceJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLQEgAKCRDBN2bmhouD
 1yUzEACOf59cQzzBtTDBnQpXT72uFzQBgLc2W63iuHo7n8Z4baF+xyrn3IfvoPv2BnIthmCepvu
 oyNYaxkaA7XirALUW05Cz/y07xi/hqJanb7ZuNWqSZgBA31+V5Za+6iWFcb40Ik5bfBDMYALJb/
 iDPMyE9/20a7onCLRgGmGKhbnxHIXw2RoxZ2l888N2iMnf3/NuZcUVRtnfR/Qz5G2W+FvgejKd0
 9j7gUwxSZ0VCM7LlbBHSW/+1th8Ab8xvcRAnlnRa0/E/xv7usrcQbDtnyqf2xxScVeBjYoOYniG
 cEWMSjCBnUv9xRJb0+vY0W2T/GFXqsoNFaCVNqbMGzU8q/AFDvekCz1R+welxjn7DzeXihYpFF6
 FXKk2BtaYFdtJ7UuV+ID296cy+IsRraPW1llrw/D6iSd22SGT+IL/cCn1qJ0InoQyC1yaHoviZD
 TW/JVxzqS1ggNI/ey2P7ogV7OCWnpFZCeCiRu3Q9yPyQGRasZbXUwV8AoqjqJG9JjYzlU0ohGmj
 dBYSo+BI4/+DU7Mc3wgaBRIXJc6yCt0k3aryAmtxz70PVjfKgjJIl+6gjltG4Jr/v/7kI3bL6aj
 WFokFak9Ri+IneCymYbboyPmhNB0LyKW/7E7AwjdnN4ds3naV8e7J0Fz+L/ph/cz3KNUdEvG3Z2
 N+1dsLyX4sVubZQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

S3C2410 is gone from kernel, so we can drop its support.  Also cleanup
and correct a bit the bindings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: watchdog: samsung-wdt: Define cluster constraints top-level
      watchdog: s3c2410_wdt: Drop S3C2410 support
      dt-bindings: watchdog: samsung-wdt: Drop S3C2410
      dt-bindings: watchdog: samsung-wdt: Split if:then: and constrain more

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 72 ++++++++++++++++------
 drivers/watchdog/s3c2410_wdt.c                     | 22 +------
 2 files changed, 53 insertions(+), 41 deletions(-)
---
base-commit: 3cace99d63192a7250461b058279a42d91075d0c
change-id: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

