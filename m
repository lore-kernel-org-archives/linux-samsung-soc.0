Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678F31A00E3
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Aug 2024 12:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761006; cv=none; b=gJ8ZHKXQDb7KpkhIfwdeqdOzXGKERC/BNtU+bBSkHq0vih43ewV4E9p3Dm9f7wLjOt7+1/UirTlzQ6UtXrRlu2vCC5vIxVl/RprK1PaFT9+fHN1101iwl5DKaGNikqm3//HCp3twagyxtl3sAfJtx0swkXh22nq4wth5qFZIHrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761006; c=relaxed/simple;
	bh=nep7vEaigqYcGCVuwcX1KbQzok96E19XfomX5Tfihx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V85ISYCOJGSi7VKmHdcvJZz4KCA1DBJJTbUgB2usb3QbCEnATKXUBV9KrHyMwRh31Ouuym8l0nYHux+5WtiO8WpRw1bQX+pMIm/j7SWveCjHougfFa+MJHJ7gL6eZOukV8we/egw8vS0fmPVpZykvZsUDfP6RUHRTI4hPDUCqPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mt1DyWL7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mt1DyWL7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42b964d7526so2396305e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Aug 2024 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724761003; x=1725365803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oEwWKAl5wGRDwroJblbu7pL64awe1nGTFISfN3cbkak=;
        b=Mt1DyWL7027yn8BbKvGaau4Cewu7Ammk8oGoY86JdOzp9NZgv5/e96+4yZdnTkepbt
         oDvOdyal2LJpFDk4c8kqOVPD+ECJmbuZhn7/RMSJzIncI52Pt5dFP5adoGxExErB3Mvr
         QQVFdsDrtvJanTsMMxohG4E59l0FPLhYvWWy9ZaPJC4axyucRiejgL0Y0dBQKtCVSjIA
         y0suQmW7ISRve0AxVOrThBzbltmVaghBSro2Zqx47ENJdPK/cavjDmApS2jfyJYE6AJu
         xjuEs7LpThkCCWdH1B6+HB0oWegCcKz1XTq0DkgRpu+QhpcALDVPgZsmElJbMFiNzDA7
         FlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724761003; x=1725365803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEwWKAl5wGRDwroJblbu7pL64awe1nGTFISfN3cbkak=;
        b=t766LeKehdxcNfjt3yHQk7+J20FEx5dCN7ze/XeQIToc8da6PNWK1xRWlFc03D1Q7w
         Y6lpfMIYJyFnW/wuIub78SgUAqm9I2VBBXV/owteXsLwklgQsRs7V/wa0tYI1/KN12dD
         1Jgx97Q9Uq0qdOmoo1R5uwrkIp+DoA4f/Q7cO/JSODjv9bEnwffdnv7URMYOWece2J7R
         51+TGosYYRYwsAHSh3bHJc98EvR6HPSXvhrdJ/qDeTs6PO7C2Mfmf8Pwr4NTZ6TE3YBe
         hbOJr5CgdMf6bLhVELbWSqs8wf1L16dS4NKoScSXmSpwhZvoKzUgio9YB8Cy8fldgHvA
         BKFg==
X-Forwarded-Encrypted: i=1; AJvYcCVw7gMhmbEyxovud7G2uI9xEaLmwGaG87QrukV9KlIKHk7/AYxFTWxatlT0BAw/nCz8zu+tptLuPeamjj3z/MBhRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLvDwf2dJI84ZT1BLBUPAHW9rtrD/kpwJ3Y/vOGkek4KGnx3ca
	EXVxDLqV8Jb249y+/YNoHTc3rapB0kO/w1jY1glMBIiizcLnpLXpgf5PBUE5ZIE=
X-Google-Smtp-Source: AGHT+IGI2jkuW2aZw6VxP7IpTsq60+7tPJdvBVRUUpM0SYoTCjpfgtxRq+29vHOWeEMfK0msqpZx+Q==
X-Received: by 2002:a05:6000:154f:b0:368:4c5:12ec with SMTP id ffacd0b85a97d-3731191d5c5mr5082598f8f.8.1724761002343;
        Tue, 27 Aug 2024 05:16:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730815b7e3sm12998658f8f.53.2024.08.27.05.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 05:16:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] samsung: drivers for v6.12
Date: Tue, 27 Aug 2024 14:16:33 +0200
Message-ID: <20240827121638.29707-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.12

for you to fetch changes up to 259f5082721f1d17b4e5b9dc2bb430821afd95aa:

  dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt binding (2024-08-26 14:34:51 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v6.12

1. Improve Samsung USI (Universal Serial Interface) DT binding,
2. Cleanup old Samsung MFC TXT binding.

----------------------------------------------------------------
Aakarsh Jain (1):
      dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt binding

Krzysztof Kozlowski (1):
      dt-bindings: samsung: exynos-usi: add missing constraints

 Documentation/devicetree/bindings/media/s5p-mfc.txt       |  0
 .../devicetree/bindings/soc/samsung/exynos-usi.yaml       | 15 +++++++++------
 2 files changed, 9 insertions(+), 6 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/s5p-mfc.txt
