Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B534D43D51A
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067566; cv=none; b=B4LO+HKpmpxAvKVIWS3V8/MJzyQ4plnuMFOnSJw8NWI14CkzzfvJLU6oY0WIRNAMtaojG93xKn1GsdDf9Q/dHl71lo8bw3jo7v2Lm+aaxl5BNPv4YpYJu8BnINV+h75uge6BJcCYmfF097rnfIpffLALyut0dgziXAjL8/A7xuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067566; c=relaxed/simple;
	bh=9wjIXq96Ye0zgM2I0ds4oYNVzLtE1yAQNKLV1EIU9V8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dtpLUutXJW6zSTnHM46aB1A1lUxOgFcP6vVwzWDrMW7h0GnpBOZzXXihPkTSEaQshso+rwgCSlxgDaYmQG3AFa1ewmMwXF5KRk67mQ00sfUHl7k7LnoEKv1oYuqdoEkzm/kW92j7hzgYTYmAn+IVPHxnluDz1tWQbkcJ3DQWVQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K73V6rrr; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K73V6rrr"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so5084728f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778067562; x=1778672362; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IVj1fWCL5+lK+iedLmeQpkoKIZN4NJDvNvjAcGI6dJ4=;
        b=K73V6rrrSE+AMJo3i0ACwCTS1P082p/G0P1XvztAczC06uZAl6DKipDVBjnfc6m9z5
         yMQx7OriVyX7fkPiqpiagpaFjfpVnvBFVH1Vxozp5+yWQqTrcunPIQh8ZAVRT2uVVyEG
         bF5hN+AwE7krMSkzvOdpjwTyYHvTLdMNpiF6ugQZp+U9o3v2GXr0Nb+EwkCAdJtrIAit
         F6snMa4XlDRfRn20J/XIqhlxsR2WQaV0wZEr/7F5rLyLHAIIVBC0PS3qOoO+G6RFldDC
         YAD8Kqb5g8PVF4ioWvWNowp7BV6ZjKd4TdY9RTYYzXHPuq4zJnikXHnhRnPpn6QHaz33
         q07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067562; x=1778672362;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVj1fWCL5+lK+iedLmeQpkoKIZN4NJDvNvjAcGI6dJ4=;
        b=DqDJZCWWcCgReKGyByc0AQ6HjYEpqnRvXBtnZ4xn6sDc7/7VW6AO8jcb0J4kFNE0LR
         6mME1pdyXrznf8woOpcsH+V3YjlbvmwOQZnzV1DTqjWCM7Kwo1hUsHEsARZsIKN92OCK
         3AvH+L6658uDfkQcXXsemTwnwa5KxDp1+6y5N92klwcQBK7CtEQkaLxHCusGxnxd9BXt
         WRPQAx8iCG5KomTAs/g2XC6gdoCw5QXzHAw+P/iCUkbdhyAMSs7pJwBUAoM6GHoQtkwV
         esEQkcHkBb45LBfso2knWd2NIciuJKp9MEpWsXw6EAGKlzWaqRMp7eEGTjXRtuOSTLG/
         no9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Wv2nNzpOWOh1nAxKz3FEmow/7JiMB7d4P5j4hKJwiyrIRjTCPjYKU5hG8diXGJWem6r2MHq97sH2BOgcgVIudcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybFiK3ce2bDhXXGt3wtV+kPfVU8MPyexFFhhVgJdR1hZhEw2fa
	0d1DDHvYOUyh2kYuFFHpjD4ws4S3t7s+E+TI8RlFgF4zLQ/wXMztT5qwybRvaZ8/xsc=
X-Gm-Gg: AeBDiesuPHJh4hTXePpgr1iGK4NW4Kt0vA/mXuefja2r3DQPHbZcbkxTF1YzKEOrRvW
	bXZ2JzSQmQzy5HtW4izgxcthEgxHdWaTmRRU/tczL4b1CDKeWTy5OhFovd33R8N4tbiBU8NkVTw
	y/4g/UCIPricdSszlZ8LPGqrkvKxlsYOa15qcuDqleWb7bwtrje2cMX/zTIuVXpo+UoNDWLEQ+r
	THwCn/I5Gqy+eIkXV8Wuu/quarwlDnFJgviwn7Y2owXHq0BGAuCiiZo5Z1v9MrLVwmWxIcAhXy6
	vTeGe4QYeNNIWgwpJAkSVT0EbGUU4H5/HUjFi0onduXbCU5iR+gZrdDLr3flGHf9s4+kfQveLw7
	PTqelkG4RSRxVMoXILUid8cODhfPi/UWMV8UcCdIHJlzVIVhaiRE/Tdl1JsPart/RNYCN8Kfv/4
	fF9Ai/o8kvMSwUoZ7qq62hgr+/SEA2s1JZzpdJ7HUm1dY4Bix9WLReQLdB9d6jQQLOfy/KBNLms
	8sq8rASg+xECZKybg==
X-Received: by 2002:a05:6000:22c4:b0:43d:1c21:ead5 with SMTP id ffacd0b85a97d-4515ce1c6bcmr5425016f8f.22.1778067561946;
        Wed, 06 May 2026 04:39:21 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm11852350f8f.6.2026.05.06.04.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:39:21 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/6] firmware: samsung: acpm: TMU support and cleanups
Date: Wed, 06 May 2026 11:39:02 +0000
Message-Id: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYo+2kC/0XNQQ6DIBCF4asQ1p0GqKjhKo0LxLGSFqGAponx7
 qW66PKf5H2z0YTRYqKKbDTiapP1cwl+IdRMen4g2KE0FUzUTDIJ2gQH2S0w4StgTFAZqUeGYmS
 NoWUWIo72c5D37uyI76XI+Tz+YUUOthK3kz12kHSa7NNDxOBjTqBRtH2Ng5QtV6v8/eh1QjDeO
 ZsVWZsrh2g47fb9C9kMBjfQAAAA
X-Change-ID: 20260505-acpm-tmu-helpers-4c5af0e2f07c
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778067561; l=3632;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=9wjIXq96Ye0zgM2I0ds4oYNVzLtE1yAQNKLV1EIU9V8=;
 b=r8xf8GxAIL1BdWW1vT0QMZLJ3de6b9Cpy9hf2Hon4GLaqnK6iD4XK7jpdzHllGv0zilynV9Wm
 nlU05KGBnMgAK9cl50FBjPbEhD8d5fkX9k59ZWvBPIxJDpcyysnx9mP
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Hi all,

This series introduces protocol support for the Exynos
Thermal Management Unit (TMU) to the ACPM driver, alongside several
cleanups.

These patches are split from the following set:
Link: https://lore.kernel.org/linux-samsung-soc/20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org/#t

Dependencies
============

Please note that this series is based on top of the ACPM polling and
LKMM fixes series:
Link: https://lore.kernel.org/linux-samsung-soc/20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org/

The MFD and clk maintainers are included because of the cleanup patches
(3 and 4). ACPM updated some structures that the mfd and clk client
drivers are using, so these patches shall naturally go via the Samsung
SoC tree.

Note that when compiling with W=1 one will see the following kdoc
false-positive warning:
  CC [M]  drivers/firmware/samsung/exynos-acpm.o
Warning: drivers/firmware/samsung/exynos-acpm.c:118 struct member '__counted_by_ptr(cmdcnt' not described in 'acpm_rx_data'
Warning: linux/drivers/firmware/samsung/exynos-acpm.c:118 struct member '__counted_by_ptr(cmdcnt' not described in 'acpm_rx_data'

This is not a dependency per se, but wanted to let you know that
I proposed the following patch to fix it:
Link: https://lore.kernel.org/all/20260506-kdoc-__counted_by_ptr-v1-1-70763486871f@linaro.org/

Cheers,
ta

---
Changes since 20260113-acpm-tmu-27e21f0e2c3b:v4:
- reword commit message of first patch emphasizing there's no
  functional change (Krzysztof)
- remove static keyword from `static void acpm_set_xfer`
- replace for loop with memcpy in acpm_tmu_set_threshold()
- update kernel doc on devm_acpm_get_by_phandle()

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

---
Tudor Ambarus (6):
      firmware: samsung: acpm: Consolidate transfer initialization helper
      firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_ptr
      firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops members
      firmware: samsung: acpm: Make acpm_ops const and access via pointer
      firmware: samsung: acpm: Add TMU protocol support
      firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper

 drivers/clk/samsung/clk-acpm.c                     |   8 +-
 drivers/firmware/samsung/Makefile                  |   1 +
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  20 +-
 drivers/firmware/samsung/exynos-acpm-pmic.c        |  20 +-
 drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
 drivers/firmware/samsung/exynos-acpm.c             | 113 +++++++---
 drivers/firmware/samsung/exynos-acpm.h             |   2 +
 drivers/mfd/sec-acpm.c                             |   6 +-
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  32 ++-
 10 files changed, 397 insertions(+), 72 deletions(-)
---
base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
change-id: 20260505-acpm-tmu-helpers-4c5af0e2f07c
prerequisite-change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581:v5
prerequisite-patch-id: 18d89d0e2bc0efe2cb366746ac4db36f4682f061
prerequisite-patch-id: e877f865862ee94f5750b877b5fad863d8acd7c8
prerequisite-patch-id: b5da16b5c6d6731ea519ed68302fd52ce57c7ffa
prerequisite-patch-id: df5b1d9df4c8894afaff645c9eb84aa4e3daeeee
prerequisite-patch-id: be74a55583acb36dedca3e118f49633172979617
prerequisite-patch-id: 31ebc7bd806d4d466c256049f32e3270e2caeeb6
prerequisite-patch-id: 7ea0832fcf76e4f40e18b74083904e7e37e1addf

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

