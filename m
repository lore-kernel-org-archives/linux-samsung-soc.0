Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A05424A7D1
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 14:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736950708; cv=none; b=T1mhll0yIWf4g/+pW2FxPjJppTyNZu4gi7w0mUWO9BBP1GAScwbngyXvwn3Lsaf6m4cBcFfTzcl0CA+tNfN24LYYYnnXyuHKdIItLAEREZDb0Y/fWntCrEFDU2gEDrQf+kMKvrbpj+yWe65bbIVYcKLAbS0IqATTBrjRlJ4LJZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736950708; c=relaxed/simple;
	bh=Ra6VjKu0S3TSfrpyZV+gMCodGc+tYkk8uce5ZVbjZAk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fDIdG/PyyKtS6ceAwxurYnK2XYtE29Xf3ooriyNBXZS/oR9/i69IcUpL3alOMZZuw/BR0IOR4Z0eYfSRjPUnOEFy0p7By+mDbeRqqH357q1w7qoV3PiZuBNvlWtC5CfUmdEwjhY5dRzRLk0GG73+mgRHD+8eAlj+FsGj0O6zvKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a9Lsdstq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a9Lsdstq"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso69907425e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 06:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736950705; x=1737555505; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LyLefsirnFHiBny48nwRg1v70yfpPBzd1WsBXD7eEU0=;
        b=a9LsdstqCz9KaGW0a3x+4DnluLuuQRVAIbKiSxVN3DIy+xPYQOdWuBd9qHemt/ShQ/
         GBevwkCC9zDZ9aFmVgMyNm3pGOO2UmClZyfqNarQjPh8GjDvccoMk336xaNEyScjNzh4
         UoaaHJ15WM826CIPIqgv/Cck4tGI1blfGcmXyGg8sk5KpxDOKRbb2R7msYqmS7Q2o2Oe
         14lvNSWyPyUC9wJ7ceBoGHEmqb+OzscENmPzRMqSse239XaB8wVnhnw6jHSoLwyBaZb9
         2vwutpibce8ol3vzfd0EOQuHdlTq6Q1DYF9twIOLXi+AavIKcpA2bijhz/su/L5laWpd
         RbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736950705; x=1737555505;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LyLefsirnFHiBny48nwRg1v70yfpPBzd1WsBXD7eEU0=;
        b=kPtLozllvaR81kPWll01XrJmO7Cbfbr9AXUkZY5bTqDI6vlraj1q+3++hVvj/sGUap
         FPZqJKtKEakzfWm+YN9LLejqjnQKLFuIf5YbZHeTylQne3guvaXNXnGHGu/Nuc4MsoG2
         4m0KjzqWcbUDQ4Kv9fXVPlPL4ZZQpkfJWwZhjaux12WLcJ5mXVuToRigjpNV+DslWgs0
         5FkSLdjI2W7SIjjMkGFL7of0KszX04s6UFzlYsNE5C6QD8rFDCd6obtStSVhZeidpI2+
         jW+fHCOodRO8WCK/z+tXu48HSFyQKu70t+sSC9k//qS9Bh+osKAwCi40ALvO5TbETBv3
         3HFw==
X-Forwarded-Encrypted: i=1; AJvYcCU1Tzbr3nUYjw+lAAGn0Pdez+FUb0P1P9xrMtKI7lDhPFOzF8iLFTRPCKfsTMBakGBJ8z2/XXXhevSvPI7nFiEhkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN4Lbw1MPQtrHpJ/ZnWEVjnxBwy023Bi1JwMd67sPHpfvZPZKU
	xBg3Do019p/vv1/D363ZWAAgmhgGmmPcQoYu0jvHPIxXAQkof+cQ7d8gMt6eAzs=
X-Gm-Gg: ASbGnctFzRrMGIozd8H5aTX3MiuWjYZjjnzj/mVneh5jcA1JkpRhFOVIYIJtUeZ+Il/
	O3/0FfuGh0laDxUyDgbEpjEt4qmCZAoYTnjSoK5RQnprXW2Qo/v9DSxrBtmcXj2z62whsIGtzhb
	lkHWUO2WzC47+A+AybWp2ER1qOVglPMFzaQ1wCBrK/j2bf8rNfqwxN73tcxLvtMd1JhtXzouYJJ
	6XSgmsr2/99BUD9tyqeTyqqJmxUgV4lLjiO4Ocv3em2QgzIU3wjYxXDL20sb05M0zHT6znrhm4y
	K5/gI57siRMAZbSSrRtbHdS24rst+GqHSCMB
X-Google-Smtp-Source: AGHT+IGP60LUIuwASgS9o56h7S+gPKy3P6BFhKHpsGSUmfHT7ch3g+Akxa/OVdsuqoBRuhChB68dWw==
X-Received: by 2002:a05:600c:3ca4:b0:434:a10f:9b with SMTP id 5b1f17b1804b1-436e26ab2a2mr300078595e9.14.1736950704653;
        Wed, 15 Jan 2025 06:18:24 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74d8e06sm25184555e9.31.2025.01.15.06.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:18:24 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v7 0/3] mailbox: add Samsung Exynos driver
Date: Wed, 15 Jan 2025 14:18:13 +0000
Message-Id: <20250115-acpm-v4-upstream-mbox-v7-0-948e09fcb5f2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKXDh2cC/4XNTQ6CMBCG4auQrq1px5YfV97DuCh0Ck2EkhYJh
 nB3CyuMIS7fL5lnZhLQWwzkmszE42iDdV2M7JSQqlFdjdTq2AQYCA4cqKr6lo6CvvoweFQtbUs
 30ULkGReMiZJJEm97j8ZOm3t/xG5sGJx/b29Gsa7/xDgwysDkGguojDK3p+2Ud2fna7KSo9wz2
 REjI1Npri+F5AZz8cOkOwbYEZNGRqWFgJylKEF9McuyfABK4qjrSQEAAA==
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736950703; l=4681;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Ra6VjKu0S3TSfrpyZV+gMCodGc+tYkk8uce5ZVbjZAk=;
 b=h33+NfDQmI1lYuSRo6dWA3xcKVXDp8zt+ua3vNaiqopS3831SKpnkgpY5JbC5qMvfYArvfzDr
 Nb5gwIHttynAIeGp41FEsEx44XfnSP20eo86RQivF9H0/dkFeiJEri+
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Hi,

Now that the channel identifiers are passed through 'void *data' in
send_data(), the clients now depend on the message format introduced in
include/linux/mailbox/exynos-message.h. If Jassi finds this set fine,
then he shall provide either an immutable tag so that Krzysztof uses it
if applying the ACPM interface driver, or to ACK this set and let Krzysztof
queue it.

Description and change log below. Thanks.
ta

The Samsung Exynos mailbox controller, used on Google GS101 SoC, has 16 flag
bits for hardware interrupt generation and a shared register for passing
mailbox messages. When the controller is used by the ACPM protocol the shared
register is ignored and the mailbox controller acts as a doorbell.
The controller just raises the interrupt to APM after the ACPM protocol has
written the message to SRAM.

Changes in v7:
- driver: pass channel identifiers via 'void *data' in send_data().
- bindings: drop chan type definitions - not used in dt
- bindings: drop comment and "|".
- spin-off dt-bindings mailbox patch on its own. #mbox-cells = <0>; was
  already allowed and used in brcm and mtk.
- refer to the ACPM driver as "ACPM interface". The interface uses some
  protocols (PMIC, DVFS, etc.) to communicate with the ACPM firmware.
- Link to v6: https://lore.kernel.org/r/20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org

Changes in v6:
- mailbox: add support for clients to request channels by arguments.
  Used by the ACPM interface where the channel identifiers are
  discovered at runtime. Passing them via DT would be redundant.
  Initial version sent on its own to gather feedback:
  - Link: https://lore.kernel.org/all/20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org/
  - the patches differ from the initial version as they allow #mbox-cells = 0
- bindings: google,gs101-mbox: update description, make #mbox-cells
  const 0.
- mailbox: exynos-mailbox:
  - replace exynos_mbox_of_xlate with exynos_mbox_xlate, the channel
    identifiers are discovered at runtime and passed as
    'const struct mbox_xlate_args *sp'
  - in the xlate method, the first argument is the channel and the
    second the type, as channels can be configured either in DOORBELL or
    DATA modes. This becomes an example for when an exynos_mbox_of_xlate()
    method will be introduced.
  - make exynos_mbox_chan_index() inline and directly
    return chan - chan->mbox->chans;
- drop Krzysztof's and Peter's R-b tags from the google,gs101-mbox
  bindings and the Samsung Exynos mailbox driver as they were updated.
- add Krzysztof's and Peter's R-b tags to the MAINTAINERS patch
- Link to v5: https://lore.kernel.org/r/20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org

Changes in v5:
- fix dt-bindings by using the correct compatible name in the example
- drop redundand "bindings" from the dt-bindings patch subject
- rebase on top of v6.13-rc3
- Link to v4: https://lore.kernel.org/r/20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org

Changes in v4:
- rename bindings file to be based on compatible: google,gs101-acpm-mbox
- specify doorbell or data mode via '#mbox-cells' dt property. Update
  driver and introduce exynos_mbox_of_xlate() to parse the mode.
- s/samsung/Samsung/, s/exynos/Exynos/
- use writel instead of writel_relaxed
- remove stray of_match_ptr()
- Link to v3: https://lore.kernel.org/linux-arm-kernel/20241205174137.190545-1-tudor.ambarus@linaro.org/

Changes in v3:
- decouple the mailbox controller driver from the ACPM protocol driver
- address Krzysztof's review comments

v2:
https://lore.kernel.org/linux-arm-kernel/20241017163649.3007062-1-tudor.ambarus@linaro.org/

v1:
https://lore.kernel.org/linux-arm-kernel/20241004165301.1979527-1-tudor.ambarus@linaro.org/

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (3):
      dt-bindings: mailbox: add google,gs101-mbox
      mailbox: add Samsung Exynos driver
      MAINTAINERS: add entry for Samsung Exynos mailbox driver

 .../bindings/mailbox/google,gs101-mbox.yaml        |  69 +++++++++
 MAINTAINERS                                        |  10 ++
 drivers/mailbox/Kconfig                            |  11 ++
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/exynos-mailbox.c                   | 157 +++++++++++++++++++++
 include/linux/mailbox/exynos-message.h             |  19 +++
 6 files changed, 268 insertions(+)
---
base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
change-id: 20241212-acpm-v4-upstream-mbox-948714004b05

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

