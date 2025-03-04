Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EA828153E
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107936; cv=none; b=s5b93tf5C8bJVlXGiagsJmt+mwfxic9iaQ1cs4HgeOaNC7Wa54sH3K6Zip+gMOmlrBF3DbxSH0Ny15J6nR6uS8lRuzzNiVx1mMd4ZhegzQvXehGStVLf/8AbjzC68UCjj/9fO/xC7MMOEzkKeXXg4rUqWlifXJyL+iyk6dT/gSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107936; c=relaxed/simple;
	bh=vgbHVbyAdNxxqlJ49fGdNGtTt3OgYs9o/Lygu1bq/OA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kku9tEpSDcxLaiCOZS2EIKLuRDeqnQYkRrHIPjkda+I95/FwcKYIHDjT5fGkc6OUWREtAnmb3rtk3t3OvxdnbfPCIXcYvwShUZERlaR5Skxw0HxLBeRGbYC8cEXJJNlsQxGHt+Ukr7t9SQ7wzwe+a7z7XBofkgaRYjFqZ21Etyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ITXiACx8; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ITXiACx8"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so3379456a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107931; x=1741712731; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VwGP1hOkgqyt7cuslt+mBb5Pi8swKaj/YmncchBevCs=;
        b=ITXiACx82elRORdzNYn4xfGKOF8bz9O7LelV8yR1/wQagJY55lumDQGs7DfJxlfeBJ
         QRsAgNJFETKetYw4CRXwLuw+y1OYuXGkXpgCxTiteJXimBvUkOI76Kd0VMDbjz+2a5FY
         hVoh102w72cV+7xNsTs/XPc0vFoqUw1tGENmju171aNoLJ4A5k2S6qIe8IB2A3ADyipv
         Bxg+I4ydJ9ShuXV5XFpoDnHJvMLMwZJiXE7ln4Hv1jM0UDbE0ts/J+2TAL6CwMXiKr5D
         b0ydZxjgUobsM1PoeWdFZqVB8xWNGJhCmgrEzfLqYGk2eG6RrK71mb4cFz5ZB67AyWWF
         gfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107931; x=1741712731;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwGP1hOkgqyt7cuslt+mBb5Pi8swKaj/YmncchBevCs=;
        b=DPJi6Gq//icSC01ejvtv27Hqpgkb9IO1gcgs58Gavf9JIbE2XJ9MHoQmEEwt/hkl1m
         5zGNvzofvX7tsdltitlyaoJ7VLAbWCldXxzFP/zPTWQ4/9xFQIO2+0YQQrU45pNXpP+Y
         ClsZyCHK6wvGunm+2AJiGjQURq7n3CevQN5VDcX3jmJY4Jrf9ztBqA9L5qO/3nwvU12A
         cf/Ap+HegRhamfvBplgUlzXqW1pSrjsnZxJ93yZZmAmO1cm4s5H43QHAe5od8lLl6mmt
         w3ZrYzD/LNOizK8G0a1ejCexmfi9D4w+dTq+ZoQ8qnTmaQBE4IkuRpAsZ43mw61GzUpz
         40bg==
X-Forwarded-Encrypted: i=1; AJvYcCWOVCwFsYqaiuvCnUHv7zN9hL24zmBlYdHb1stX/IFpD/SFeOagI8Ch6tw85rovQw9YylsdhJyLNgv+7IZROlob/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/oaAA6vF3snBRzEJ6PaP5UPED5MOIA9H3EEn6H8J0q0e40Gp0
	o/a7jTTpL7+uSleuV2es4ddCFteWURLlTrzSmDlW3EVOYuWavDmU8Ib/RdDkvdpaG0TqvfE5VKe
	PRgM=
X-Gm-Gg: ASbGncuSrQbkMbuzImYuTWq9ckLKfub839EUbBUtvEo7mwdcq36taYYS/cs0syMSNVY
	Nu72xjNArZLRgp/kubRutDnP4mFsR3cpgBUwwd97CtYX3k+BN+xk/m+aMYekxNHTGK2tXfwfI2L
	OkwEnJtvzMO461dVpdOHW5aU/FKq5OTduF9sE1JYNA2ZT5hAXJJahr/Nc9KEdtRaE1AXFA2b6WR
	Fi82ccZUqR6RTVoVQRArB7sIBIVPvE4Md+H5BB4+3mEri45V3wom6+qDM8PgNm/eD+snIOZOCym
	F+rESkXPJ34rjp218QOB472bmqMpBpKhDfDPKHwlEadqZHxm/QDVcWwSGoGiCD2RSmlz0ex7PmV
	3Cg9CkLJ4h5AvK+xtvPnY6bATxjEk
X-Google-Smtp-Source: AGHT+IG1qDKc0hst2zevKKhfPXC0MrEb14O70/5mMsp5hFfaUprLxoI4xNFXRR1d5hlR/z34qhDcpw==
X-Received: by 2002:a17:907:da0:b0:abf:23a7:fc6 with SMTP id a640c23a62f3a-ac1f1185263mr365511466b.16.1741107931351;
        Tue, 04 Mar 2025 09:05:31 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:30 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 00/16] a few rtc driver cleanups
Date: Tue, 04 Mar 2025 17:05:28 +0000
Message-Id: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANgyx2cC/3XMQQrCMBCF4auUWRtJxhSDK+9Rukjj2A6UpExqU
 Urubuze5f/gfTtkEqYMt2YHoY0zp1gDTw2EyceRFD9qA2psNaJTsgYVZvLxtWRlMOihNXghb6F
 eFqEnvw+u62tPnNckn0PfzG/9A21GaTVYGyjoq7PO3GeOXtI5yQh9KeULAj75TakAAAA=
X-Change-ID: 20250228-rtc-cleanups-12c0b5123ea4
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Hi,

While looking at RTC, I noticed that various drivers are keeping
pointers to data that they're not using themselves throughout their
lifetime.

So I took the liberty to drop these pointers and this series is the
result.

The last two patches also convert two drivers to using dev_err_probe(),
as I looked slightly closer into those two. They don't exactly fit the
general subject of removal of unneeded pointers, but I wanted to share
them anyway, since they're ready.

Drivers other than s5m were compile-tested only.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- s5m: fix arguments to devm_i2c_new_dummy_device()
- merge two rx8581 & sd3078 patches into one each (Alexandre)
- Link to v1: https://lore.kernel.org/r/20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org

---
André Draszik (16):
      rtc: max77686: drop needless struct max77686_rtc_info::rtc member
      rtc: s5m: drop needless struct s5m_rtc_info::i2c member
      rtc: aspeed: drop needless struct aspeed_rtc::rtc_dev member
      rtc: ds2404: drop needless struct ds2404::rtc member
      rtc: ep93xx: drop needless struct ep93xx_rtc::rtc member
      rtc: ftrtc010: drop needless struct ftrtc010_rtc::rtc_dev member
      rtc: m48t86: drop needless struct m48t86_rtc_info::rtc member
      rtc: meson: drop needless struct meson_rtc::rtc member
      rtc: meson-vrtc: drop needless struct meson_vrtc_data::rtc member
      rtc: pl030: drop needless struct pl030_rtc::rtc member
      rtc: rx8581: drop needless struct rx8581
      rtc: s35390a: drop needless struct s35390a::rtc member
      rtc: sd2405al: drop needless struct sd2405al::rtc member
      rtc: sd3078: drop needless struct sd3078
      rtc: max77686: use dev_err_probe() where appropriate
      rtc: s5m: convert to dev_err_probe() where appropriate

 drivers/rtc/rtc-aspeed.c     | 16 ++++-----
 drivers/rtc/rtc-ds2404.c     | 14 ++++----
 drivers/rtc/rtc-ep93xx.c     | 16 ++++-----
 drivers/rtc/rtc-ftrtc010.c   | 17 +++++----
 drivers/rtc/rtc-m48t86.c     | 14 ++++----
 drivers/rtc/rtc-max77686.c   | 37 +++++++++----------
 drivers/rtc/rtc-meson-vrtc.c | 12 +++----
 drivers/rtc/rtc-meson.c      | 16 ++++-----
 drivers/rtc/rtc-pl030.c      | 14 ++++----
 drivers/rtc/rtc-rx8581.c     | 85 +++++++++++++++++++-------------------------
 drivers/rtc/rtc-s35390a.c    | 22 ++++++------
 drivers/rtc/rtc-s5m.c        | 58 +++++++++++++-----------------
 drivers/rtc/rtc-sd2405al.c   | 16 ++++-----
 drivers/rtc/rtc-sd3078.c     | 71 +++++++++++++++---------------------
 14 files changed, 183 insertions(+), 225 deletions(-)
---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250228-rtc-cleanups-12c0b5123ea4

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

