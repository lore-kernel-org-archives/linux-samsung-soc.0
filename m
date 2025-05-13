Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00D924728C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747133990; cv=none; b=OKu574alXLv8yviRvvUQh8Ag/+IS1iCOwOakW+2kLhFmeQM8rCNvXBWucaRHDTmgy9nkhwyXz2g9FGiGfdeVzfp3rpeNf/v0+nQnw0DDbFTcqnGcKc/YUurp1y6ieGmEA9gwnXF08FAC6bAJraa5/Pihh/ZTeyu1Pzcja7d3m10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747133990; c=relaxed/simple;
	bh=GAD0kFJ5YJ2FK8mLZ5w9P8zRKTWeWXXWX86RwPrS390=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MVGpH0ve170JXAenVw7+gi3xUMxhPsUaPvyfYdFE9Dz5qaNGp/C0doiG+rq/761AM3wPbP50eTtHpz1hI1eRw9SiQ9n1Nq2cdwuaFHwCKY8D5w7OrFeR5aPoQCxY4fCI6fnicS+iv0LfwfeQ6ZrtLgENCJOHf5cvQzzdjVeBqko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jQUXizoj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jQUXizoj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a0b28d9251so787764f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 03:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747133986; x=1747738786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IvRmj826ad4QUb971cjwKbsd9avSTJmnW3hYgxwozQA=;
        b=jQUXizoj0s8tXQLdH4D/428a8dG6y31jd0Ts82QycPUYpPMD8QOTcNSaNsD9QXGqaQ
         N7EJtnF/1sXZ+zyAGfVvTU8Z6AvWpTWtUAx+JQi1hBU8L1FgaW945syqGhi5yYbOVACd
         AmTHpIHncEHrWfjd+0C69PC2qRfCv+6OYYECgUPn4uBhDiN8OcctKblOtSrnew00cew/
         MnB6jv+0/OiDLxKijrCOXcxtXmKGAkB7vEpo/LQu+dFQrMqyJsIO0AtO+yjWK1Czfptg
         StKYg/o4Tx3IBVCG1uF2QLgQp10cJX9kBUPW7eF2lGkZG3Al3BNUybnyRqWC9j7rZ21t
         CzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133986; x=1747738786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvRmj826ad4QUb971cjwKbsd9avSTJmnW3hYgxwozQA=;
        b=Q38ksZg3drR2ijrZ9hjJuMeSUOkS43x5ChWv6QvS5OC+cwRyMZj6hUujIEsBWhUXUI
         FgSzsSj7rv0612epZDrSZ482zmGHgR5y05SR9+t/DCAhJcka0eM2nJB/XsiQ0pZXmk59
         pW4hsCz6uOCgZJ+6fZ1FJGm2RI4qEbSsDxkgRuefNzG3qqAL96Cda4b+fxKSK2Q2fdu/
         3nA3G7XcB79Vw/8rUU5iabP97fyAN1EsJ8P/HNBV8ffBv4AcQwd8FZHcdCnpb+tEeJSb
         xHwtMrPdt8P32pK0CHCV5n1J7dTHcZsMHXPWYrKBcOYNBIc9ibQzR/NcQaqI/ETZKKT4
         zOBg==
X-Forwarded-Encrypted: i=1; AJvYcCWCaTKbF26ELTMAFchOK5AU63+De0WspO/v+GJROtaZ0dJIfR7PaitgLLJ95UNy2tGD6giUcUUhR7bSD5e3Z2jR2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqsdDjeX2SftoIACVJBvV8es9TGD3sHLQ3wtUQFNFAsCYnSjSk
	Ykiq8tdwoerlBuol+lE5G2TRBQSty/HWgXdUyahbQtKoEZhUJXlQv6LYdacqrOzIH9eZUJ0J+DN
	LSLg=
X-Gm-Gg: ASbGncsfuFdH1gF8ff15w5STSeS4Yc/qdyaWTDWol4iPszTratcioWLzXSX64pOXJnr
	FNCUwXKiZgKT2ubIfYz6AV0SqsK15+IgpInANfNhsBEBDOmnD+C7+9GCKH4PGy0cWGhR+ZEcWGb
	ibR72gpr3Z3JyvJYA8l6eT0fi2E6mUr5lXZMnQyhllGQiAwiDoRDsWlmOcS3pfhW4UEjAE/w67M
	G0W0WWz0952IfeYFWKkFFkK5GJydBgNroJQxqF/+U9/yc8ZsoHb5HqIn2tADUX80tNBrqV1FBzr
	x1jAPJtxZDz4fi6T8lfk0mD90tlqzP7Xhze8ZAogqRUjMDwvrhyrlTiOan/kjsa2gMWJXcnphuB
	GHCzpDoBqNAMTTz6VBmZBme5X8fmZQhreP1uGQS0=
X-Google-Smtp-Source: AGHT+IG5fKMxvjjltTJpP1VGWjmB/2GOQg7Z1BsjigMi3Gmj35E8GZ5+qOXlM4koXQ1T7HjcmVC4nw==
X-Received: by 2002:a05:6000:40df:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a1f6423590mr4776881f8f.2.1747133986123;
        Tue, 13 May 2025 03:59:46 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm16078670f8f.60.2025.05.13.03.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:59:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.16
Date: Tue, 13 May 2025 12:59:41 +0200
Message-ID: <20250513105941.28448-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1442; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=GAD0kFJ5YJ2FK8mLZ5w9P8zRKTWeWXXWX86RwPrS390=;
 b=owEBbAKT/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIyYeXGYfRXBpOgZAbyMyM0G0gXfP7x4rVhaNG
 ZNlW5kBi1aJAjIEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMmHgAKCRDBN2bmhouD
 1/mMD/QJrD+uVxskUSpR2WCT2iO2+zMLNh2Y105Wpicr6Ppz9U1EayRxH/yzRm4FqlVITLwSXPi
 J7Wutiaf6sSE2g+LRG5mvicN5kctLn6jeKpgtCr7chJmHsffzJ24bC4MPO77a84H/0pItzLZYss
 W5bzXLsjUr8VMg/22ALBMREsx+wfGlD5wzSXf/eTXoPaIWktsTOaSMC6UQ1+kC5zLgUZHXVJdW3
 wf4gOksiN+SxVyQw1831nBdb4d3o68a5HtWw/q620FAkMOmKrur4T2Jow9E2eAaC3xjcE46cynw
 m/FXrz42LMv6FeI+6oPdkx1gn00Eeg4pM2LRIyTK9htDCTkC5DvNZvOwTbvobADJgAxopW8riR1
 9yEWXP0hQOTaoLnmWmatCcKRPhvFh3mScZ7aWEML5Vh/AVRVe/2vA2tyPqBi9kxePyQbTJjAKiE
 PkRTZ7gAgGxy2W6y4oXv85TbJgt7FYIQknSg4xPjnmkhrAcOXi77Q7hGQxDwh0bJzxL4bwgBikx
 ZO2Zh5Yi2T2TzlEffmT/iaq5GtwUtRkOdwuK6byXJJpRAL6GFlyAVKdXqxtRJzLR1EncdtF9c2i
 x3BO0yWGmDqHJXPZ6Ge0SoVyGhmn4vq+eo5UsX+5n6NqJwlqI5f+3YqjebieP9OZmVRz21iaKm1 VIdZZ7f5Bry/C
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.16

for you to fetch changes up to a30692b4f81ba864cf880d57e9cc6cf6278a2943:

  pinctrl: samsung: Add filter selection support for alive bank on gs101 (2025-04-08 20:57:51 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.16

Refactor the driver suspend and resume to handle Google GS101 EINT GPIO
pin banks and add the alive pin bank for that SoC.

----------------------------------------------------------------
Peter Griffin (4):
      pinctrl: samsung: refactor drvdata suspend & resume callbacks
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs101

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |  52 ++---
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 300 +++++++++++++++----------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  28 ++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  21 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   8 +-
 5 files changed, 255 insertions(+), 154 deletions(-)
