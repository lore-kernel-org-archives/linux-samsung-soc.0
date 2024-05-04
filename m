Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E775200C3
	for <linux-samsung-soc@vger.kernel.org>; Sat,  4 May 2024 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714824951; cv=none; b=DNG/0YUNV8tQ4+OVpHtLIM4bdPn7H7aJiW+JnUMiSxQJMKuuh4C5VWeWqNyx5lPVexn5fHX26pHER2s/Wbwl0q8PO6++ea7MVTUgyDlXpmJRFq/hG3VkX4nyW8jYxJCV2hSXCg+fi4qU1eRTo1IiHwzx4kNN2rawuQKV8Cf4MyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714824951; c=relaxed/simple;
	bh=PPpOQyMbS6Mzgm/54tzfCd7GGaJRpWvifByPCcJ0Roc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W6p0jsWem6eS4rOh7pfUPADkuwikTOqgmT/HzBlvs4gih6qKx1xVNlDCGjxkmdW2Jl+FA4MoNuqKqr4IrNKTXymiYRbUv5hCH78M1Ko8BDaMUWX8IteEAuVOLGh2cwNjatedB5q+Upvf4gzr0I55Rptb7qgXZtJ1yeP2TYDohJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UiCLLR1T; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UiCLLR1T"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a599af16934so97164966b.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 04 May 2024 05:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714824948; x=1715429748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uHgH5JlemKr00lARyvPKvrK2odUhHHD2XashLbtv/ww=;
        b=UiCLLR1T+hhfhbEFNzgTgl0vO0ZFwQzS9i+evLhLdsm0ivXL3XKyUSJ06RlswHEbWH
         beJNOnvTOhgLnCrFU5g3xWke5MWwSw8YH+aZYEJ8ICHXP99U23gGbAIYSsb0nr+MpqJd
         tjhPaCn6Y46nL474rYwlWvJadsVb4FT7rgNsbe0iqzYsYc4RMUJU0fXUaX/qVqnTXjjl
         18WcnnoY6FCIOQ/Mr3OyLude62d4WIZzvjx5NFo15g2usUU3Vx/ScNjED8D6aXPJKBxE
         SkIhD+ub9oN21DaLA//7QtABZhq2VaG9adJfYHi6awqbUNVvEus7inj5flwSn+aq5kDq
         BULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714824948; x=1715429748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHgH5JlemKr00lARyvPKvrK2odUhHHD2XashLbtv/ww=;
        b=etwgPcpXPJv4vvTS2mJlOp+w+JwdFQsh8tFDj4KAVuZCo1KX1FPrQFxPxz0EjfAexa
         KrLXZEMSHJ4/5IqBMc1IkyV2y8Oxh6JQUxJEK/ZmenEd096XsdiBc53lo0XZ3mviQhNw
         Q5pJLXvQNIvtKP0CkiBBkKQ+4t8OSfaoeDe6wG4PuOihjIRTe2BhRZ51ataylyy5f6v/
         fIs1bjiFgRnNb3NZagu2GoCNh+0mEXND8kIglLyoCwM7VuS2+VxS8BmmKjBYGC1CCEKD
         X6kOKzC0EHissl5NwjOroVPzJWNs1NQVvU7D7IwSiIpICSpYpknAlkQjFXAJ2FKA944T
         K0QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaVBOVjU/LFYwfPdyXUrYRQR97U/N29rrKfo5GQ6gOQIzn0poA1wtnnIHIgKxoKqm6nZGGpQyB1vDyh7mIlzvbif4HHfNKSkiv+fiUp51/8eU=
X-Gm-Message-State: AOJu0YwxO8QUkpNmN746uHxktm30ZFLy2LFcQsKcJk3aVa7Y0iwmgbpk
	7yUxP2VePbZLJ6eI3j5brPNnQqFb4htXusQRfyJ7vyUcYHYcTDSSViKsGmmNaGA=
X-Google-Smtp-Source: AGHT+IEbcI1Km5xoWoY2FdQxom4QjiT1xv6T6XAEW4MTvRymIgNcGhFAY3zqEBgmmbgizDbdNHRtKg==
X-Received: by 2002:a17:906:5617:b0:a59:a8f8:7e1 with SMTP id f23-20020a170906561700b00a59a8f807e1mr1072336ejq.58.1714824948556;
        Sat, 04 May 2024 05:15:48 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id uj4-20020a170907c98400b00a599f876c28sm1203407ejc.38.2024.05.04.05.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:15:47 -0700 (PDT)
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
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.10
Date: Sat,  4 May 2024 14:15:43 +0200
Message-ID: <20240504121545.8187-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.10

for you to fetch changes up to e5b3732a9654f26d21647d9e7b4fec846f6d4810:

  pinctrl: samsung: drop redundant drvdata assignment (2024-04-30 09:41:58 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.10

1. Add support for toggling bus clock (PCLK) for any pin controller
   register accesses.  This looks needed on newer Samsung chips, like
   Google GS101 and probably Exynos850.
2. Drop old, deprecated in v6.1 bindings header with register constants.
   The constants were moved to DTS headers.

----------------------------------------------------------------
André Draszik (2):
      dt-bindings: pinctrl: samsung: google,gs101-pinctrl needs a clock
      pinctrl: samsung: support a bus clock

Krzysztof Kozlowski (2):
      dt-bindings: pinctrl: samsung: drop unused header with register constants
      pinctrl: samsung: drop redundant drvdata assignment

 .../bindings/pinctrl/samsung,pinctrl.yaml          |  21 ++++
 MAINTAINERS                                        |   1 -
 drivers/pinctrl/samsung/pinctrl-exynos.c           | 112 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |  95 ++++++++++++++++-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   2 +
 include/dt-bindings/pinctrl/samsung.h              |  95 -----------------
 6 files changed, 226 insertions(+), 100 deletions(-)
 delete mode 100644 include/dt-bindings/pinctrl/samsung.h
