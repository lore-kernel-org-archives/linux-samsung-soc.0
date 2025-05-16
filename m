Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC4822D7AD
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 May 2025 08:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383647; cv=none; b=DjKZEXQed1qJpwMaz8Fq0evaMsiLyXiUm9D/xNdWWTZNzKlaqelr/VimvHt4KL1qizmUM1xhdfZHEg9b7hwFeDfhbmYY79Yhv8vZrTH9EIKYgeVct8hOabL56Qt3594yw0QIWg+dtdNyIUDxnaCfcmUKx7jIV0HpigQpEUbHpJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383647; c=relaxed/simple;
	bh=q7KcxdCf754Fm0Sh6Fg6Al5BAVBp19Dlxv08kjo2YD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lMjNiJWPBx4Cd/BOsHFnNZFPAbEFZ821B4OlBtkMj77aO7WCNH7BLt+BWICzvCTbV5MDVT/xURnlJXGJ60sheW/SDG3Jzq/oduZGkPqd5WNG1edFVUpfk4wTtuP6DQFv7VN9ZAjJQWQ/Dvr98nfCqCdi1tA7c7B/w++Mf8lFW8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f6kV7qxr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f6kV7qxr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442eb7edc80so873315e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 May 2025 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747383643; x=1747988443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AWiHCyffjsTF/4oBfvkCIkeTDad5rgPB/sxiLylVPuY=;
        b=f6kV7qxrpvJKaplu59mpvM3LGAny1QXeMKSB+0uPXArGX/56QHqdV94KaTr26tD98q
         obTmf60rcmHQI5CQq1ebNyQWgQQcmTU1iheYd0dj2J2DfUn78QbwjtHnhZGeCsRfixpi
         YBPXM0l6d3ffZY4C0mM8kjDn6u2K1cDmMSYuw0toNYgCPR7kbDGijG62gFvSdUZHkOXO
         OF/B6jk2PQPkc/QOoYUiRtcWoHDMQa7K+2NfHYhNrmI38zu6c8gx8qakkXBl02N99cl6
         t7zpC+QNuvFeDFBIf6aUseo//S16z3AHlrEQ5qkBogrE7nWYivmwZeJ6jbtNTElQjTtw
         3rFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383643; x=1747988443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWiHCyffjsTF/4oBfvkCIkeTDad5rgPB/sxiLylVPuY=;
        b=HDcyK9wWBay2eyr1R1wbufCH/K5JOjRq0DV+FY07X5raDw/JVvE9WFJrFKXAsxLvgt
         h+5yr0EkHUb0XhqfH5tUImuUNTEwsQA+M40dTrfHehWSNiC/5bg5BcyoFY9eI1BED4Yv
         +TobG88TB1+/xWMpNxwce5KOFIQ7jMUHz+KR9Z5oNf5smlTbjl7Fdq2g0xVWT0OUswF0
         M4Aq8K1Ovw35HbA2Y4ir16aCdGGmeLdwnCBY+V3YuAhh8ZE5LXulRq8W/JilEMviMe/b
         NTh5zVAoyNeK7kzrcqvuRjyfmLQB9WZ9OgJSCn+JE9FQzEoLtnBxBr8Yj1AVQ+qkXpHd
         1XQw==
X-Forwarded-Encrypted: i=1; AJvYcCUPdGdGiB056rla10LgjJbAHR8qWjFA/8SjQaaZrKQykdlxUuK92sfr02SS8TXGpcqcQpkLWcOdk2By1n6f9Qh+Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHTZw6sAl/DySvXKwX0ncQ9+99pZPVGx6fmL1x2iXND5peSJJ0
	Y6JCWBiLRC4cpNsd+nvMv6qcAeeUhamB230rvGd32oKwOD5DlHoLHGc85IObcM9NpCQ=
X-Gm-Gg: ASbGnctwIMVayegNAW08cdm8SVMuqKO0aFb8jnhW79mg88wdR28DjpoQWGUWN8MPPhK
	Ma/t+M8EgRA2YFSW4vB9jk+w557km7O1UR/Nba4ANXhfwLvEvCNadQGjeshSWIn9m43bPFIF79n
	IKULSXU20UMiPeB6RzFo6d7aijYqUbTYNNtnJXmY/59C203uSpuk/lg2Nzs7MbhlukDFBnilFAM
	FX856w1qZG9Osf+svHtmMhzx6IOwO5X5cXx9PMMiEVx8im0pAYjJJx9H4fspCgIa3FFmR/WADRD
	F10N7klgVSJGo5thASf4QVHhRJt49WpgzJlEqFGcrWvDRp+Kq4e9Rq905vysUKIyMTrq+utP5dz
	ikH7CPHgFFerv+Uh5b5ZetxEhw7w4Y5BrlSSIoT0=
X-Google-Smtp-Source: AGHT+IFaSqFDmfEc/eXrwtep+5lHfw+ciUUyEyM+rhboqdKMEMNhsbsCj3GNPcoF2ibeCQI1/GgRgA==
X-Received: by 2002:a05:600c:468f:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-442fd62fd3amr8485415e9.3.1747383643357;
        Fri, 16 May 2025 01:20:43 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb8c92d9sm66344685e9.2.2025.05.16.01.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:20:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] samsung: drivers part two for v6.16
Date: Fri, 16 May 2025 10:20:38 +0200
Message-ID: <20250516082037.7248-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1799; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=q7KcxdCf754Fm0Sh6Fg6Al5BAVBp19Dlxv08kjo2YD8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoJvVWHlLDYQ1S3UC+mjKP1Ml+sn0gSReMD8ON6
 HvYzvkVZhOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCb1VgAKCRDBN2bmhouD
 17CvD/40Jeg7IGxWsQFaoCXBN5u2/NbbOnFY2YILEL4HSDeuNA67zO/9cNH9hKKy6qVERpoxlyg
 lCOAneP3CP+W4sKSxAGsHWP/VLTZ5KmWW8r6/8Hy/4ua3kngRR5OPrJe4xJqgrOM+OqO8w893qp
 qMv3WhQObxIwP4j9aQ16VFe27x8b3b5jmcpv4DWkBMQmHxWPdfqhI6y05+jG2MK5tk9xoEddcqW
 XLyIWAt28tGblvzNuOv3nRfinV9TGiXkP2gycA8TNGqraweESwwzEW/kD+EKDkLdGCgXx/Hv77I
 LD7Rvj3P6cwnHzrtDi1d3XoTAjVhWPqs/7+1wR6fPLPAEMkx7E4n5zWNKnGEvogv6nipmxk+V7p
 rHvfde6HuqllUI8j4fHkPGq7l0t8zlMdQMye/t4bKPTw2gMP1fd6qDuL/I5BtyISWG6LZicNDKj
 Sf2tn0bhWROtuwZwqIkN1dInyn952pHbl9Y0rvZBRr1yEtTjGiyuel4GDyFzSEH9dHx5UgWXzFc
 17qbuQtA9TF0e222zzyNIY9Qn41PyyEEZOw3BTxF85BExbuTQ/pPISHqyZYj7pA2+3j29hziP0q
 fLTVEOp8AHGx+5aOJ2I7czWZCMbyNFe5mqHOM27wYxYQKG4IbvTgxHADgc+CH+7lB+D0DJddlRn 75pwPLFgK0OqP4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

On top of previous drivers pul request.

Best regards,
Krzysztof


The following changes since commit 2c2e5e908ea2b53aa0d21fbfe4d1dab527a7703e:

  firmware: exynos-acpm: Correct kerneldoc and use typical np argument name (2025-04-25 11:41:03 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.16-2

for you to fetch changes up to 598995027b9181ada81789bf01fb8ef30d93c9dc:

  soc: samsung: exynos-pmu: enable CPU hotplug support for gs101 (2025-05-13 10:02:29 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v6.16, part two

Add CPU hotplug support on Google GS101 by toggling respective bits in
secondary PMU intr block (Power Management Unit (PMU) Interrupt
Generation) from the main PMU driver.

----------------------------------------------------------------
Peter Griffin (4):
      dt-bindings: soc: google: Add gs101-pmu-intr-gen binding documentation
      dt-bindings: soc: samsung: exynos-pmu: gs101: add google,pmu-intr-gen phandle
      MAINTAINERS: Add google,gs101-pmu-intr-gen.yaml binding file
      soc: samsung: exynos-pmu: enable CPU hotplug support for gs101

 .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 15 +++++
 MAINTAINERS                                        |  1 +
 drivers/soc/samsung/exynos-pmu.c                   | 78 +++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h                   |  1 +
 include/linux/soc/samsung/exynos-regs-pmu.h        | 11 +++
 6 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
