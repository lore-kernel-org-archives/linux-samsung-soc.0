Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88251BD9D0
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 13:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757854979; cv=none; b=lNv2USWXIN0phtiZpCSwAPK0An2TbBPvmlIiXR2xB0Wbv1WDOqzioArYFlrzxEtprAdkFN60rn1dQx43LiUXxjMH1pRQIK+YjgS5Mna6QJ2o7rM8X2r9XpDAa7j5CFe2urf1kUpXmBH0c3JtJw5lTV5BUfn3SI+fkzSJSAwGoto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757854979; c=relaxed/simple;
	bh=rHuGnmNSAWtGbO8Z8WgRAPBhmsVTpCs/w3FGfSbK7vc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wc/XyA3PFayY7zxdNSchnjNP4ZGpA+1u03sn2xTfgq/Wm//ORgn5jYUCNZ+2nc/BZp+JqWNUiO1oYR0tJYxeIiiYs3bjnqdKwk07k2Mld6W4gdtZAMYXag/ncO8zhOUhMUonOtgW1cdTsK0izyVKE8XAnIE7MByj5j01lqzmin8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwI51HHM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwI51HHM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso20660415e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 06:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757854976; x=1758459776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t3UizsZpg1Ha/ybkP8NHn55rTYoNi8egOSFYxh+y7kw=;
        b=FwI51HHMACcv7AjyhdBSY3NnDunfL1bVOzp97DOdRWHrDaLdE07dyG8J3F6K30161y
         LHbPWmB7fn7YACE3wEIBrXUnP2EyxiEoHeb6MiozeqtT6VGoKLWoa7IP4L6oACeEZOUy
         vUuonmB9JPp90AyB5t2omsaNFoJhMv4Y239gv1N97ZWdqaa+zYl6D8fPmSH9qb04g462
         E4gtr1PSLqSOQudmmznnODNCMNB4zpO/qcARoKI7MjWSwSZkuKdM6l41slOmNOLyjiJJ
         o05htwq+dENOFwrkaOZdGxOgk5vQzLTmcFblUmT7gob+hoVQrIKnoEj/q7Om6Zf5wuYP
         +Kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757854976; x=1758459776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3UizsZpg1Ha/ybkP8NHn55rTYoNi8egOSFYxh+y7kw=;
        b=HoHKx1cfHwQ+b2i7wlfmxVird6PAtbJH5zAT+NUl7XnawACHnhCxNS9to+TMmYSAfh
         2sPvN78nRL6Y6z37ydxXcnkFxM42XxAHWU1C7MxSk5pmGHT6xGs2u3XflDP/j9jKSM73
         zpn6oRm4fzSbhhXDI2B8pB6Ptuo9myISjU5wJk6Wl0hRzEyr62STI2AFCBhxFJ2tqcZu
         01bz8M7prtRkb1cj6N3k2acdHynFDo/9GOvgjs1oFNNAjL81OtABDUOrHUuUPyww80Nj
         54KDXyhMKjspiUGleTe0RlEZkIs1PqjgKLMsk7zqkjPaIXjR/ptHUGZo/fdN7sOlEzuf
         tFUQ==
X-Gm-Message-State: AOJu0YwoUX4ojksGAOISQ6pImNljrWyKHjKE0CXdrD1MH3RYYWGQkl7O
	H8wfLaV+QBElSOxA6bgRhxKW7/0OU1riGt4xtttlQbBXXANlflE9F1gP
X-Gm-Gg: ASbGncvO+ADdre/k8qDmUTVaGI0Sz606BnEV4/Pxftj27FoGZdV25PJagYO/LdBt9lf
	OrFKQeMEt+Fx961WFRNrc9LrLrECfi+WWzfwNOGASEYAd7DIX/2QKmNvS/7uIRNWUNpJ7TZZQzI
	jvTjiONkK/1lOFXMVrihNu1dXuVKp25Pubus0eQv/ftJMfSpeRKJANw+cCAw4Ga3O4plYzmPNBa
	UL1P4gme2mwBi/7j5c90lZ62vSlGER+nJwpViAgH2Oh3k0m8z1VOV7WADyyxQnGPGvFQd6rKcWD
	a2oZjK8wDWp/+5nsAugOkhOkfY/x0ANMS+eOIbnOgklRHOUm7OfVg/OOE2LrKcL54u93jKPcaRq
	653wm/8Y9R+jdYW98bG5MkzBUGUhvElPjYz2f21BkAy+qCcjT+7KyMIbXQbtcoGiQJ9bySTqHCg
	==
X-Google-Smtp-Source: AGHT+IGmdtP+Xjj7Yz1YjXKOoV3AmMEnzLyC4YA+29C+PPV4+VMe7iGYUdI+/lEFqgOw121dIqHB9w==
X-Received: by 2002:a05:600c:6dc8:b0:45b:8366:2a1a with SMTP id 5b1f17b1804b1-45f211d577fmr60534635e9.11.1757854976111;
        Sun, 14 Sep 2025 06:02:56 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0187f0a7sm77060965e9.3.2025.09.14.06.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:02:55 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] regulator: max77838: add max77838 regulator driver
Date: Sun, 14 Sep 2025 16:02:28 +0300
Message-ID: <20250914130230.2622030-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds support for the max77838 PMIC. It's used on the Galaxy
S7 lineup of phones, and provides regulators for the display.

Best regards,
Ivaylo

Ivaylo Ivanov (2):
  dt-bindings: regulator: document max77838 pmic
  regulator: max77838: add max77838 regulator driver

 .../bindings/regulator/maxim,max77838.yaml    |  68 ++++++
 MAINTAINERS                                   |   7 +
 drivers/regulator/Kconfig                     |   8 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/max77838-regulator.c        | 221 ++++++++++++++++++
 5 files changed, 305 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77838.yaml
 create mode 100644 drivers/regulator/max77838-regulator.c

-- 
2.43.0

