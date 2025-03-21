Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589611D5CC2;
	Fri, 21 Mar 2025 14:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568024; cv=none; b=qUT/JXZjBR9//D7Ha9F0tsFVrWI75+L6gyYgMXujrvtBfmExaPPw3dOi+a5lk0Dtksz4WeXI30vgSLFERtKxs+WtwMZ6cHDpkrwY39d/8ZuKCzzXFR4nLweBWH7FICHMNyeb+5kYain+wJtKlJv0ZeGaq17ILWgHo9wnfNsJ79w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568024; c=relaxed/simple;
	bh=yeG18USQPDx4efwarq1A9gAFoc0eGVttqF5cfRoNgPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r8Y0R4dTYWSPa6APjdDY9VZSrnBIQOlVGrPH94tGuGfMSkDunxIL3/Z1f8eCGZFrTAj8fzSfjcIYvyjpU8gGed5v4T0m/WI/jVIoxJWK0D0FECYIy2ULNrLA6Pp2iFGQ8ImRoY2xEIn6uqm3akuQAKqLgTSZ527O63GSF/NAgfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAJ+Hz7m; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAJ+Hz7m"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3965c995151so1089053f8f.1;
        Fri, 21 Mar 2025 07:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568020; x=1743172820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dWamBMGzQ4b2qzS5reu3KA74iQ43aQ3a9idYDj5XNb4=;
        b=LAJ+Hz7mwXlf+WDgTlDGWw1vbLO6my7oqqr+OqeNAoriqIvTV12rmUXmUtzqCtmExk
         PqDBtGoPlVGPWJ3UIsNYK0SbA8TZCekci5IwyyX7isE0bAJn8oYqQRKXTGn9tfkJVByw
         GUzfmjcbHzFX2mD60qA62gGaKC4runYi5I3RRipQbrKUoG4yHPr/MJi4X4hyEZjZeqPY
         BkP2gA+VsHuH6WUJXXf18EQycj+QXX4otkM7Jn/VCRXOa10gLMh8NRfjyGN73JDRg9/C
         iqi2dusU1X/tLcz1ez3Z38YSesfKyM5rIsOd921yRyZ4it8im//oK6/au9ym5PKarcld
         tiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568020; x=1743172820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWamBMGzQ4b2qzS5reu3KA74iQ43aQ3a9idYDj5XNb4=;
        b=rZQxHxd0jziVYECI7W+nKnudS7APmmapOYkRcSI6MxLydPlZRYv4eSadflLoyR+9ib
         91oKIpkUZLwmPD+ncNEfoZ0UUWpLuNvyg+dU+bfGJaETAh30yUbr7nRbtIODKg2YSiG3
         SH08E/NrzHH3y6NagJ2CKytp+M5I+88XIaLlwmOs0Eo4k2zjs3//aZZGfCZw1bS/fjeB
         WwKXaAB9oqZGCwYGYhOMSATB8Dx+drRfh7aSaMBBY0TI5jN+oI31LjyL2OGr6pw4OeWy
         md8RibTzy+pN8yw85U0+peuomlj95srvpQN678VZtWrZ6GbIpEUQhOjMQi+Ps/+keTsc
         P7vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYyTkoSkhQRcef2RjgGo5+UUezCYIYAl6YxfadgSUKfFZvS+XbqwsHM8+5X8FhwfwLHf3LYYtb03IcNM4bpJdO4sY=@vger.kernel.org, AJvYcCWxMSdHdzHIbVMdO9AkCw83nGTsVEeipW+I74lPmxu0lzgBhnSNK8e6d7stD1uMeeo2QaG9Cd0F/n0Oru4=@vger.kernel.org, AJvYcCX93ZD/L1aO9XiTu1w6Yxheai0Gl3lWsphrbebgUTQGazvqGjx4N9vNknnn2WsK8ubMsfzHl2RDyiH9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo4BczhJMyAuc9fyP6kp+pOYPBJA4GcCP9q3OmAOtN5KTFDp3N
	AECf+Zz3UvGwnDB7k/2MR2NbOdT55wji7mqM3EY0wo39pJNrvBzl
X-Gm-Gg: ASbGncshlnPIMxMYk/nQfnl2VxVrFFmuMcXx54m0wd/x9E+0jZn6KXvU9xdW75RQNjc
	rRiJjAnAKEPwISeKqyqPHdoBKtWHsJ59HB7moW4LygXJupI0kZ0rlG9F/+IinjSFXtn87Hf11Iv
	UwhAU8pp+fI63fsxGTQxlso5jULjz2MRpPeVxoaM2FcTVl1ZBXB/Y5/wqrL+gE5vqd0m6nKgW8N
	goYft2KerGrSXecXNKgcQa2E9bpV7lkiikEd1f214fBUGzSwRpdJrqobAxcS2sLzw+fUGmWkgrh
	u+h03Csa+AfIz7WN8eIV3Pdq7Lqcwk6NG5iQhDakF5Rx5ifnUrvvbrsMHSG4mtgTnR6XNzzHpgH
	294LikGPXJ82Gh3vhnsbe
X-Google-Smtp-Source: AGHT+IFQeRM9QPE09HFBRqHaY3uOORN2Cbc8vPnkx/biZLOobat7sMvMEqqreD9p39WhPvc7YAHoew==
X-Received: by 2002:a05:6000:186b:b0:391:3768:f448 with SMTP id ffacd0b85a97d-3997f941b0fmr3190399f8f.49.1742568020439;
        Fri, 21 Mar 2025 07:40:20 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e65d5sm2557156f8f.64.2025.03.21.07.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:40:20 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 0/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Fri, 21 Mar 2025 16:40:14 +0200
Message-ID: <20250321144016.1434848-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds support for the Exynos 2200 to the exynos-dwc3 glue
code. It takes one clock - the link_aclk, and the dwc3 refclk is passed
to the dwc3 subnode, as with gs101.

Best regards,
Ivaylo

Changes in v2:
- add sob and r-b tags
- drop minitems from binding patch

Ivaylo Ivanov (2):
  dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
  usb: dwc3: exynos: add support for Exynos2200 variant

 .../bindings/usb/samsung,exynos-dwc3.yaml          | 14 ++++++++++++++
 drivers/usb/dwc3/dwc3-exynos.c                     |  9 +++++++++
 2 files changed, 23 insertions(+)

-- 
2.43.0

