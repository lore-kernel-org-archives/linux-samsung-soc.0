Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FB119AA56
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jan 2025 17:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737133801; cv=none; b=ON70N9XqAi/m9wwRaEcyfR4iEMDgCKSp6n76CBWuS3XY6Abnvm5+1u4mxy99K3TXnDTt4A/FQcxPCBAnBEhA4ON9kkAXAA4LQj5nElMaPJhBO0tSn0fOZ9Hg1OsFlyY3RujBJstaOR9iqircLrVYKqwNWgz0xVh41ilhY8n0CPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737133801; c=relaxed/simple;
	bh=7ANeKR3v+yRKzyRqPitJHgvF8fJkGhtW2OO51o2J7Ho=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NwGyTj+MuFOKfAZq/E64+TOgUpPZhcm/EkOoMxT8nX23lyA4hnq93oEATF5nF4/PDOJSQEcqWcpXhBddE2snGGcdHPJDjKyqxA+D26nZrg1jcHuZRdRBJ0Iry3c6X0676H2FsDofoUotzYE8c8u2jz8rX3pU9hJugHvRWWIWOUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mKCKU4TN; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mKCKU4TN"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so3730347a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jan 2025 09:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737133797; x=1737738597; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VpofVFRqOOEG6qf6RBN58H/+7B1FAaQ0YrVaEqz5D7g=;
        b=mKCKU4TNYB+1z6wfvIv+Xx+1nYC4LTkZok5bfAIfVlQWLPSVtwpLC8/D9h75JTh43I
         eoMWNHZGjog7c2CeWYFZ98zWLL0XTgD1wIxq9WioiYkKWi51Xz48kWc/MAOGy8XG9zzn
         phGjXg6fJa+8QR2hYt5DwosZ8CgvjVPWXpA0AiPZOWHBIImZDJOobgTx8jkuWQ2+yVuZ
         tUWJSqFyd7Yf/VlCr5gFVfaonbjtQFsHsoIkpUjvYeGztOLsXUzW/XCuR1B3+/t81kqE
         dmk8gLce2ISdeCTWPY+Ht//lnNSS3efkBtQnp+ZX7TR+kVzYfDDbCcIsMnCvzc9v3oZ/
         pdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737133797; x=1737738597;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpofVFRqOOEG6qf6RBN58H/+7B1FAaQ0YrVaEqz5D7g=;
        b=BUE52akOVq4p6VKG1Uqbnf5BUXSFZWcEll6+0mHyy/hWfij+E4hKqEA6VyQW1rDBec
         7HdgEoUrFzThSmkspwNUDGY2mRxeBZg8TtZzCRRNlmhALTytC+yj/pZlStZ3bG4nsIm4
         w8uV73R0j5kTDA5AlekKCroG8fg3dAQDcntclZgbX03LKxVQkWdIAA9bY6ZmqwohI5Ni
         M433CI2hZHBZNe2zLSx7aC5Pa+TI7IoxUQdNmSUwQgSblhhInATWJvYlXbdYRYqhr6CI
         C5uhe7nZ2Oyy7IwoVFCdc/8ANRM3COhqn7hVleBlYKWTnKCFkEcKuloHwj3hAuX+18T9
         GthA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Ctzxt5CngbTescCG0PFtD3/WQhAq1MCPA2bO/DwlLcfik+kn7ctyyuogPviofHnTfAZ8IWPJIhx5dl3CH17fjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcYJlzPif27DRTgZ2AHHi3ZoIA8nRsb5r+Ax+uGYOxbg6nsR7M
	K4sMaXWXUUj3U+g2c7+Q6fpGNvkhyJNjKpfSEvO8/MtYV1+u++hOtX/x+V6bLlM=
X-Gm-Gg: ASbGncuolBnJE0ZFYaMxhcUDMpMN2+kUJ423n5TI84D21Ml364R2FRS5uY/oRU4/bLN
	Wjt/LMLn9ngcjhJ7jJF4DEsKU4I+PtUGLqebsusI0I6Qa0wTNZPyPRoNTT3A4TG9IxpfoBToZ/8
	LBDizS54ORyWCx28IVZ+KjMNxuohQQaOGsMZetsyVrSB4ch3+2eGX4rnonmyQaDsl+IWISnbane
	nvFPMPKXCPKASvq3PZhJ8Z7UvuqeypeNP4aHePth8wAuBhGU3qS9DImonl6ksM0cDSQSzdFX8VP
	xCqMuiqgdBz/FFvBnCryLR9wTA2oxz8A9N2VLr5i
X-Google-Smtp-Source: AGHT+IFs8RJ3NO2OT33SRqFUyUB/tvu/B+LNlrcE6krOU8A6UpaUH6OiJazjufKRn27kaO1pthKstw==
X-Received: by 2002:a17:907:72ce:b0:aa6:7df0:b17a with SMTP id a640c23a62f3a-ab38b29b08dmr459543766b.34.1737133797425;
        Fri, 17 Jan 2025 09:09:57 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f87065sm199197966b.133.2025.01.17.09.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:09:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v4 0/4] Google Pixel 6 (simple) framebuffer support
Date: Fri, 17 Jan 2025 17:09:53 +0000
Message-Id: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOKOimcC/3XM0QqCMBTG8VeRXbc456g5u+o9oos5jzowJ1tII
 b57UwgK6fL74PefRWBvOYhzMgvPkw3WDXFkh0SYTg8tS1vHLQgoQ8KTbAMCymDvY89NJZXWrIA
 KxXUhIho9N/a5Ba+3uDsbHs6/tv6E6/s3NaEEqYzRNaoUSOGlt4P27uh8K9bWRF+eYOcpeoOgV
 VNyVkK18+nH54CY73wafU5sdKpzRVXx45dleQNfaq6rLQEAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Hi,

This series enables simple framebuffer support on Google Pixel 6 and
Pixel 6 Pro.

Even if simple-framebuffer is deprecated and DRM should be used
instead, having it available in DT is beneficial for several reasons at
this point in time (the phone uses an OLED display):
* energy consumption goes down significantly, as it changes from white
  (as left by bootloader) to black (linux console), and we generally
  don't run out of battery anymore when plugged into a USB port
* less of a burn-in effect I assume
* phone stays cooler due to reduced energy consumption by display

Since Pixel 6 and Pixel 6 Pro use a different resolution display, this
is the time to separate them into their respective DTs, and provide one
for each of them. There are other differences between the two, like
battery design capacity, but they don't matter at this stage due to
incomplete upstream support.

* dependency note *

None (anymore) - earlier versions of this series had dependencies, but
those are all part of linux-next already, so none remain.

* dependency note end *

For those who want to try this out:
The stock bootloader disables the decon hardware trigger before jumping
to Linux, preventing framebuffer updates from reaching the display. We
have added a work-around in our Yocto BSP layer for the time being
(until a proper display exists upstream). An alternative might be to
port and use uniLoader from https://github.com/ivoszbg/uniLoader, as
seems to be done for some other Exynos platforms.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v4:
- fix an unintended whitespace error introduced in patch 4 in v3
- Link to v3: https://lore.kernel.org/r/20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org

Changes in v3:
- back to using separate DTBs for Pixel 6 and Pixel 6 Pro (Krzysztof)
- update name of common dtsi file (Krzysztof)
- use 'memory-region' property from the start in patch 2, don't
  introduce it as change in patch 3 (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org
  and https://lore.kernel.org/r/20241220-gs101-simplefb-oriole-v2-1-df60e566932a@linaro.org

Changes in v2:
- We now have a generic gs101-based Pixel board DT, which can work on
  any Pixel 6 / 6 Pro / 6a
- Pixel 6 (Pro) are overlays onto that one.
  This has the advantage that all boards can be supported without
  having to have a full copy of the DT for each of them. We still
  instruct kbuild to create merged DTBs (in addition to the DTBOs) so
  that existing scripts can keep working while giving the option to
  just apply the overlay before boot (e.g. by the bootloader).
- The binding has been updated according to the above points
- I've changed the simple-framebuffer node to specify the memory via
  memory-region instead of reg, as that avoids unnecessary duplication
  (of the size), and it avoids having to specify #address-cells
  and #size-cells in the chosen node (and duplicating this in the
  DTSO), which is otherwise necessary to keep dt_binding_check happy
  and DT validation working in general.
- sort overriding/extending nodes ordered by label name (Krzysztof)
- format patches with diff.renames=copies (Krzysztof)
- dependencies have been updated, see below
- Link to v1: https://lore.kernel.org/r/20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org

---
André Draszik (4):
      dt-bindings: arm: google: add gs101-raven
      arm64: dts: exynos: gs101-oriole: configure simple-framebuffer
      arm64: dts: exynos: gs101-oriole: move common Pixel6 & 6Pro parts into a .dtsi
      arm64: dts: exynos: gs101-raven: add new board file

 Documentation/devicetree/bindings/arm/google.yaml  |   3 +-
 arch/arm64/boot/dts/exynos/google/Makefile         |   1 +
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 267 +--------------------
 .../{gs101-oriole.dts => gs101-pixel-common.dtsi}  |  22 +-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  29 +++
 5 files changed, 58 insertions(+), 264 deletions(-)
---
base-commit: 4e16367cfe0ce395f29d0482b78970cce8e1db73
change-id: 20241216-gs101-simplefb-8aae80278ed7

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

