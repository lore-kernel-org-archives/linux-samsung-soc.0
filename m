Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0121F03C7
	for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2025 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263974; cv=none; b=K78eohTUlgdlm6+S/qTP5Vao0Min+Tt2btD6jUiWDnSs0m23UptIf0UeCMEOVoMaifmMZXQzdiBndjsmG81zzOQ05nAnvkB4pmrp9ddv3MrLL/6SV3XxaA6NosyKSopxJnuoH/MEFIefm1H3BBIvjn4RS20Nki/z9w737BUyBvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263974; c=relaxed/simple;
	bh=CvGiVKhIZswP4wKgAQsjHEPJ6nFC0lHhIDLbODeavE8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kxlTPXAz13QZcH0aZIENb9AsxBsbI+FOXetQrKpNZvuN6NouxvBBXuEON2Kjy+BAfTt3v/4VRSpauYD0M/my0P/D4zfT5Seqyr2ftAqYugyVva7wW1NNsHmuqobhATvdSofW7N/fPnwV2jifkLPRalE4hYCLHOo4m1OPJrWcLpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OcXpfW2n; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OcXpfW2n"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dd93ace00so1315337f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2025 00:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739263971; x=1739868771; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t6OWY0fos10iStOF5H1IFYgZ2IDlUZVRYgpKLYkqEuc=;
        b=OcXpfW2njigF6/zAqrP0RIxLnDW7Y2tpEIZYZz8JPNMRV8gh0RYhU0ibkTUAZC6HLO
         LEsVfaqj4E3a0c4nd3vUmmuKxdqPIPoSlZTDffcoA5TJ9mGtAS50DsSqe0xbG4WwqdVV
         1xfqH6FoBGXMvbvP1O8SPPXJvJo275o374crhh0eWo9WfxZFlQ0zhW+72DLNgzaEf0vu
         oVb7doq2GThm/eUyXOJzrvgmgqyul0Kkv7WYe86Kt5ClnsO4g+cgqh7mz/j8SsZ8ojJf
         9mXiMjaESPO+b2wWe2Oaf1qu/LHzkkM9iGplxv0GZ8LrWGQZOGcahikqn28NKj8s7EoB
         DpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263971; x=1739868771;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6OWY0fos10iStOF5H1IFYgZ2IDlUZVRYgpKLYkqEuc=;
        b=RiP4xmIunKmKSTO5bXHL/82DaplYBvnzn/gJduFoZ7jUdYjbrmqk03ywzmnA/6YgBZ
         QqArSF/ueMoqo2M/kxMypfgDtTm9WEmxFMbcA/P2Wi4HSv/5FrJj8tYU/vHRwfAUPOzv
         RdK79VoZ8OApiU8j5dJYFE9UjI2dpY0cl8N9dcQnRIULFJXtEekc3q6FjadgHgbRtwIB
         +iHAumSzfX4owEG71ir9DLHfK2+OSTx4m0DDGGD5Oi62d8pi7QVfopJ2P2K7VQgQSncW
         YoUDQFOWqh3flMesaSycJax9LQ5PZOVVWdIoGrorwojywhb4Yu/UbUjLD31heX2DbHMF
         id3g==
X-Forwarded-Encrypted: i=1; AJvYcCXsN4KAm6fzUIZgF4ejUSgB/7nWvH36uidE68IZzZooqwECsotgzxg0v+72fcRREY0uRBsJZGFtTEdll08nD+3Ivg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoTuUd20kkt1o/MbWV18PZplYaFBtwfoTOcq2m0rZgIZaj+26S
	GLu/IwebBf7qN0v0IQjWYDeg2CCp5VTm4klIM+odJ8LJ5Erj6l2OfxHeNA+FbHM=
X-Gm-Gg: ASbGncuCB27KdQ0FMt6Ppz0nZuw9HlvsaL2fB2xZMTKNMuWQRTTKs3NXrT+R0tV3z/v
	SQyAZGfDITTNzV0E4R/lXph9mB+HJQLRnEfFLQreiIUAmU82o9zGZgKeY4HnGPQKZzoKZgGNpPd
	rAQ4sEy0T6jfyyznH5gJtvrYYcKurKItcVO8mVBr8yxdwl4Sl38Voy3EHkxaT/qfoTIv0f/BjTp
	G2j5n1TMp2Oo6mquVqZIji3RYUg50oXz9k5ssLjwqk24gYOixEsrMNwXTgoSDJiY7ZHVvyximKJ
	dHgrn4EUdgM/A2aMiTrQ536bMwxts+dTNQDTXLTn3APAVDNBTNa5+Tu2Klo0ZxvOKJa6dJ0=
X-Google-Smtp-Source: AGHT+IFiFaaPLBLJBEAY8+WoDJJ3p9o8HeMoJbNg623UugXDEowbfXM3r+JsQUAhLtZreuBj1aDFNg==
X-Received: by 2002:adf:e981:0:b0:385:f7d2:7e9b with SMTP id ffacd0b85a97d-38dc90e1758mr10123478f8f.30.1739263971130;
        Tue, 11 Feb 2025 00:52:51 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d7d4sm207698225e9.10.2025.02.11.00.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:52:50 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v8 0/3] firmware: add Exynos ACPM protocol driver
Date: Tue, 11 Feb 2025 08:52:48 +0000
Message-Id: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOAPq2cC/23MSwrCMBSF4a2UjI3c3OahjtyHOEjapA1oUxIJS
 uneTQsiRYfnwPdPJNnobSKnaiLRZp98GMo47CrS9HroLPVt2QQBOUME2iUGjOpmvFPg6oioDZe
 CkwLGaJ1/rrHLtezep0eIr7WdxfL+zWRBgXKH0ihnaifc+eYHHcM+xI4snSw/VgBjcmNlsbbWa
 JmuAVTzY9XXIqiNVcU61yqDzjCh7cbO8/wG7tCoaB0BAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739263970; l=6041;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=CvGiVKhIZswP4wKgAQsjHEPJ6nFC0lHhIDLbODeavE8=;
 b=eZXGXagF/HzbBDBvktDYnY2EL5nXxgWg7z3jGAjTjxyplxJ287FnSOEYf2qD4oZPMAiORl8f3
 0Rg/RsP1v/eBBVtH2lqJkJUljgTvXrDY4hwwq5ieKSE/yFXwzdCd8rV
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Alive Clock and Power Manager (ACPM) Message Protocol is defined for
the purpose of communication between the ACPM firmware and masters
(AP, AOC, ...). ACPM firmware operates on the Active Power Management
(APM) module that handles overall power activities.

This protocol driver provides the interface for all the client drivers
making use of the features offered by the APM. Add ACPM protocol support.

Changes in v8:
- replace the open-coded mutex handling with cleanup.h guard(mutex) and
  scoped_guard(mutex, ...).
- fix kdoc warning
- Link to v7: https://lore.kernel.org/r/20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org

Changes in v7:
- drop device_node cleanup because it missed initializer and didn't make
  things much smaller. Call of_not_put() after we're done with the dn.
- pass the property name containing the phandle as argument to
  acpm_get_by_phandle(). This lets consumers define their bindings 
  later on, when introduced.
- fix typo, s/acpm_dvfs_set_xfer/acpm_pmic_set_xfer.
- now that the exynos mailbox driver is in v6.14-rc1, use the
  exynos-message format for the message passed to the mailbox
  controller.
- Link to v6: https://lore.kernel.org/r/20250116-gs101-acpm-v6-0-e3a2e1a3007c@linaro.org

Changes in v6:
- Kconfig: s/depends on EXYNOS_MBOX/depends on MAILBOX, build time
  dependency.
- exynos-acpm-pmic: constify tx buf, make acpm_chan_id unsigned int,
  u32 cmd[4] instead of u32 *cmd on function params.
- exynos-acpm:
  - drop acpm_memcpy_{from,to}io32 wrappers of __io{read, write}32_copy.
    Right now unailgned accesses can not happen because the only
    protocol implemented (PMIC), uses on stack u32 buffers.
  - constify xfer to make it clear that the caller keeps ownership and
    must ensure it is valid memory through the entire xfer time.
  - rework acpm_get_by_phandle() and use try_module_get and device links.
    With the device links, when acpm is unbind, its consumers are unbind
    first. Thus the acpm drvdata will be destroyed after there are no
    consumers alive, there's no need for kref. try_module_get() is used
    because we'd like to be able to delete the acpm module only when
    there are no consumers left.
  - make 'struct acpm_xfer' private (move it in
    drivers/firmware/samsung/exynos-acpm.h). Get rid of 'struct acpm_msg'
    and use 'const u32 *txcmd'
- bindings: add Krzysztof's R-b tag
- Link to v5: https://lore.kernel.org/r/20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org

Changes in v5:
- depends on:
  - Link: https://lore.kernel.org/all/20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org/
  - it uses the newly introduced mbox_request_channel_by_args() API
- dt-bindings:
  - drop redundant binding word from the commit subject
  - remove extra blank line and update example with by complying to
    #mbox-cells = <0>;
  - drop Krzysztof's R-b tag as the example was updated.
- driver:
  - channel identifiers are discovered at runtime, use
    mbox_request_channel_by_args() instead of specifying them in DT.
  - don't call mbox_free_channel() for PTR_ERR or NULL channels.
  - introduce common method to init xfer
  - rename guard name from __EXYNOS_ACPM_MFD_H__ to __EXYNOS_ACPM_PMIC_H__
  - stop exporting devm_acpm_get_by_phandle(). We'll export the symbol
    once a client is introduced.
- rebase on top of v6.13-rc3
- Link to v4: https://lore.kernel.org/r/20241212-b4-acpm-v4-upstream-firmware-v4-0-3f18ca64f1b9@linaro.org

Changes in v4:
- rename bindings filename based on compatible
- bindings: drop nodename
- bindings: drop mboxes description
- bindings: remove initdata-base prop, and define it based on compatible
- bindings: move additionalProperties after the required block
- bindings: drop firmware node from examples
- bindings: drop unused label in examples
- bindings: rename node to power-management
- driver: switch 2 macros to inline functions for readability
- driver: add checl to avoid shift overflow on these inline functions
- driver: use ktime_to_ms(ktime_get()) to record ktime
- driver: use the default non-relaxed IO accessors
- driver: remove atomic handling
- driver: remove stray of_match_ptr()
- driver: move header in include/linux/firmware
- driver: make sure to, from are 32-bit aligned and count is a 32bit
  quantity before calling __{ioread, write}32_copy
- driver: reject IRQ channels (not supported yet_ at the top of do_xfer,
  instead of when waiting for response.

Changes in v3:
- decouple the mailbox controller driver from the ACPM protocol driver
- address Krzysztof's eview comments
- add ACPM PMIC protocol helpers

v2:
https://lore.kernel.org/linux-arm-kernel/20241017163649.3007062-1-tudor.ambarus@linaro.org/

v1:
https://lore.kernel.org/linux-arm-kernel/20241004165301.1979527-1-tudor.ambarus@linaro.org/

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (3):
      dt-bindings: firmware: add google,gs101-acpm-ipc
      firmware: add Exynos ACPM protocol driver
      MAINTAINERS: add entry for the Samsung Exynos ACPM mailbox protocol

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  50 ++
 MAINTAINERS                                        |  10 +
 drivers/firmware/Kconfig                           |   1 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/samsung/Kconfig                   |  14 +
 drivers/firmware/samsung/Makefile                  |   4 +
 drivers/firmware/samsung/exynos-acpm-pmic.c        | 229 ++++++
 drivers/firmware/samsung/exynos-acpm-pmic.h        |  29 +
 drivers/firmware/samsung/exynos-acpm.c             | 768 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.h             |  23 +
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  49 ++
 11 files changed, 1178 insertions(+)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241220-gs101-acpm-047922ab4654

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

