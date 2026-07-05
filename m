Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E9938552C
	for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jul 2026 15:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783264478; cv=none; b=J6QFpAsa8VwL91jTt+ki7Xkm/rLa/15AaFFTerDn6YbZgdySqZ3N172l0a0f0WSKluoW0dltg4zOZNtw8yNn1R2TBvyuj6Ipx/JeSayV87n6/a2BTRb+AiovA296hqSYtQX5haZYuXZ7N4YumvYRaIv1TDvoDNEz0jD/0MRCPyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783264478; c=relaxed/simple;
	bh=/ARYZ3nMFNE4qw1dHISvtgGeE92jI229vSRxfVl732s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GlzmIz8zLc4V8ZQE6wi66lEMBli54jwajkbb/zrAFNTg48BHSM0M5k33ePOl9IKmyxqGJJRsyquEBW21GIAKxzZdUBssiQVFFZ4rpDxMB3Rq+RRSpSQpKWBWsK9Yy2dr3IbMkRJFJHi4oUoemFTCc5Kf1ngmAtE0m8BnYy1mHeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PD1I2V8A; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PD1I2V8A"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b77b150aso20044615e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jul 2026 08:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783264474; x=1783869274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1sbIzpLoPVOsWAp5a91/2b+hubQz3OERKvp78vmABs=;
        b=PD1I2V8A5KdEME/1KcKwaX7YqOfPMzSF9mRgcdyyOh1GXWDyi3zuF3fIMgSb0q1DIa
         oHXj6JhPq2mpatWUKIM5n4QcOZpC1WDsbLeEKe+7tIYiolbZf6IDGjIdEv64lOg2/UIc
         PGX/0akQx+IdpOtb/WS9wReP0M/TwtyhcHsvcNaFkITYJnQ1mplUJhXtDSnfDseNufm9
         VXvosP/HQKlTfWyzAaxxBEngTrcrdv4WgOnEHNe1u5PnExNBGsBj4M2gJI8TPX33IgOj
         sDfZP2/Y8gPWC8m/Da9acriEbPg/5Sr2RZZOyhcKTEdlzpaQ/1npURWN9TamRtymV2oK
         nr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783264474; x=1783869274;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W1sbIzpLoPVOsWAp5a91/2b+hubQz3OERKvp78vmABs=;
        b=MgcMV1+VLNnQ70h4l0snk48eMDVr5zDqUzmaiwVsz4JBMjJfy+2GJ/HOX5RKEOi6+1
         oJ3eY5JA41XxqrNpC7TD2uWqYp4D+WA2MvRw7aLJbO4mbIjrs+Yum5H8mJFCtJKRtZps
         cOK2UmJHB/MzivWoSXrR+2WsEAjx8I+c6ZubZ/Nu1xRC4nNX/3XCQiwpHyKyU1meTI06
         75f9P8qdgGw7ti7y4CGij1dqB0xP1/V+j0DsvT+kFBMY+vVwe5riSNwuQPcIFImwaNRe
         5fUxyl1Hp9RGKXbTQAqgRQqKYjMigBffw1/oWhoPsKG1pWoITX6KyZEQoywLsPY4hiED
         aQ/A==
X-Forwarded-Encrypted: i=1; AFNElJ97rWsBtnuktJgpzf+T2/trhrssFiioe2GS2ZDO/p0e+NNilfTzIfhUqomSfL3pGqnc/nJjkbCiSeanUVijAuifLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yypg+hHpB4VnurZhuXFrwR/RQcGnhpVXeAnDmrD1KBTWKw4ctSn
	txGfqvHCdXLLIoaCNKZ1AUscZwJ8DVVGEsZhgdRVz2ECJTQWf9SxLqFrIqmyGz9qFNk=
X-Gm-Gg: AfdE7ckemq+Z6JBG7Bq2FD4Fn5tYGDCeD2bxkVBHB0DAt4nEccNrj8adiFv+TdEa1rq
	S0bSAdhMt3nXnTa0BZxUS94Mw7IzO69OZnAXhlXRfwccMW3ITrtf9jUZfhw8vOSEw/3WnRM+ekJ
	+/9ZK3hik/f/TcXE8g6JPFOkQPUHpYcg4fuWyh3LN8P5bcgI7vHBZ8Zu130WFWU3VBdFUTuv5bL
	Q1psuavS92xaWlSRb2ISjlIRUEiOwU6FfBRlt5XOyFpx6fWNz2b6d6coR3SjHmwwO09PLizHPak
	tF77Ys0MFGnVZ9Wj8rLwpNUHYgPDHmc6870zBKz4RnqL+XpiDx7PXL+FqV25DMBs1SyHWanFKvn
	GrfG5XVTq15EKoEFzgHZy06gxSinWkqzM5qdrjx396i5JDoiC3o33+7zXAyMchpj9ConyhAiv8M
	zQv4tdsGvhc8x37mW+Gg==
X-Received: by 2002:a05:600c:8b61:b0:492:7084:32af with SMTP id 5b1f17b1804b1-493d11f4b80mr87345205e9.23.1783264473096;
        Sun, 05 Jul 2026 08:14:33 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c63b6f8csm262180195e9.11.2026.07.05.08.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 08:14:32 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Michael Walle <mwalle@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Hammer Hsieh <hammerh0314@gmail.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Alexey Charkov <alchark@gmail.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Michal Simek <michal.simek@amd.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	imx@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 0/5] pwm: Unify arrays of various *_device_id
Date: Sun,  5 Jul 2026 17:14:12 +0200
Message-ID: <cover.1783263835.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3597; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=/ARYZ3nMFNE4qw1dHISvtgGeE92jI229vSRxfVl732s=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBqSnTF02HXaqUpIDE1Mt23JzG4uWfnR2u11awWU 3umjMoAUj+JATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakp0xQAKCRCPgPtYfRL+ TnxCB/i0tqSm4WRb5bStOYawCPIjfRWQcr4xSi/+9osjT9WCMkOFcdJIALH3OTjRDssO1bo27Lf HlxVL0NC+cyu2/kdQnTKxCwlN4Mr+K0ubzHhjQG0p5hKoo0E+ymyawDtJ372H29L5zSSYeZCvIo x4WE6N9MvkYqMFbIYzoBUakF9cYdVbu6ohyBqtXYSqr1ZwGjdHd4MWHija/sPCTtV/LrwSg4fhc gQCbrGPW2Y9VKehuNTAzHv2wje5Cu3eNO+c3uV15dBMdPgO9DfEp3EXIwH2ZR09Uaz5HwWXbYK9 FN+Z8CfZYziZ0D7HLlPGgse2ncweWpObjQ6pQzued8YQFKE=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series is part of a preparation for changing .driver_data (and
similarily named members) of *_device_id to an anonymous union.
See e.g.
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for the idea behind it. I also grabbed the opportunity to unify the
coding style for all these arrays while going through these.

The patch series is based on pwm/for-next + "pwm: pxa: Depend on OF and
simplify accordingly" [1].

Best regards
Uwe

[1] https://lore.kernel.org/linux-pwm/20260705083910.3502207-2-u.kleine-koenig@baylibre.com

Uwe Kleine-König (The Capable Hub) (5):
  pwm: pca9685: Drop unused assignment of acpi_device_id driver data
  pwm: Use named initializers for arrays of acpi_device_id
  pwm: Unify coding style of acpi_device_id arrays
  pwm: Unify coding style of of_device_id arrays
  pwm: lpss-pci: Unify coding style of pci_device_id array

 drivers/pwm/pwm-apple.c           |  2 +-
 drivers/pwm/pwm-argon-fan-hat.c   |  2 +-
 drivers/pwm/pwm-atmel-hlcdc.c     | 15 ++++++---------
 drivers/pwm/pwm-atmel-tcb.c       |  6 +++---
 drivers/pwm/pwm-atmel.c           |  3 +--
 drivers/pwm/pwm-bcm-iproc.c       |  2 +-
 drivers/pwm/pwm-bcm-kona.c        |  2 +-
 drivers/pwm/pwm-bcm2835.c         |  2 +-
 drivers/pwm/pwm-berlin.c          |  2 +-
 drivers/pwm/pwm-brcmstb.c         |  2 +-
 drivers/pwm/pwm-clk.c             |  2 +-
 drivers/pwm/pwm-clps711x.c        |  2 +-
 drivers/pwm/pwm-cros-ec.c         |  2 +-
 drivers/pwm/pwm-hibvt.c           |  2 +-
 drivers/pwm/pwm-imx-tpm.c         |  2 +-
 drivers/pwm/pwm-imx1.c            |  2 +-
 drivers/pwm/pwm-imx27.c           |  2 +-
 drivers/pwm/pwm-ipq.c             |  4 ++--
 drivers/pwm/pwm-jz4740.c          |  2 +-
 drivers/pwm/pwm-loongson.c        |  2 +-
 drivers/pwm/pwm-lp3943.c          |  2 +-
 drivers/pwm/pwm-lpc18xx-sct.c     |  2 +-
 drivers/pwm/pwm-lpc32xx.c         |  2 +-
 drivers/pwm/pwm-lpss-pci.c        |  2 +-
 drivers/pwm/pwm-lpss-platform.c   | 10 +++++-----
 drivers/pwm/pwm-mediatek.c        |  2 +-
 drivers/pwm/pwm-meson.c           |  9 ++++-----
 drivers/pwm/pwm-mtk-disp.c        |  8 ++++----
 drivers/pwm/pwm-mxs.c             |  2 +-
 drivers/pwm/pwm-omap-dmtimer.c    |  4 ++--
 drivers/pwm/pwm-pca9685.c         |  6 +++---
 drivers/pwm/pwm-pxa.c             |  8 ++++----
 drivers/pwm/pwm-raspberrypi-poe.c |  2 +-
 drivers/pwm/pwm-rcar.c            |  4 ++--
 drivers/pwm/pwm-renesas-tpu.c     | 10 +++++-----
 drivers/pwm/pwm-rockchip.c        |  8 ++++----
 drivers/pwm/pwm-rzg2l-gpt.c       |  2 +-
 drivers/pwm/pwm-samsung.c         |  2 +-
 drivers/pwm/pwm-sifive.c          |  2 +-
 drivers/pwm/pwm-sl28cpld.c        |  2 +-
 drivers/pwm/pwm-sophgo-sg2042.c   |  7 +++----
 drivers/pwm/pwm-sprd.c            |  4 ++--
 drivers/pwm/pwm-sti.c             |  2 +-
 drivers/pwm/pwm-stm32-lp.c        |  4 ++--
 drivers/pwm/pwm-stm32.c           |  6 +++---
 drivers/pwm/pwm-sun4i.c           |  2 +-
 drivers/pwm/pwm-sunplus.c         |  4 ++--
 drivers/pwm/pwm-tiecap.c          |  6 +++---
 drivers/pwm/pwm-tiehrpwm.c        |  2 +-
 drivers/pwm/pwm-twl-led.c         |  2 +-
 drivers/pwm/pwm-twl.c             |  2 +-
 drivers/pwm/pwm-visconti.c        |  2 +-
 drivers/pwm/pwm-vt8500.c          |  2 +-
 drivers/pwm/pwm-xilinx.c          |  4 ++--
 54 files changed, 96 insertions(+), 102 deletions(-)


base-commit: 1a4920940ebfd8d907858abd8f8dd09b13752946
prerequisite-patch-id: b423a9d049b4520ef37b40635c95004363ecf692
-- 
2.55.0.11.g153666a7d9bb

