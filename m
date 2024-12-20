Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FB6216388
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702604; cv=none; b=bVr4h0vY9jcaxyak/SYLqkeUNJtZqTVOHGF6FhkO0zgpMpd06iK11Ig4TEHH8ZOWhxNXurq3LbvVh/wGqF8qrVCwokapZQZ87A6xwlq71IRqwRdqCT/ezoOZw8KEVycAaOlSkeEkJv7fbeQrmFU0P6Cjkw1+umpT0RhDyzIClKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702604; c=relaxed/simple;
	bh=6TWIHezHv4FF1GCXzi2P0OdCIA/CiwYW9/ITn62N+lE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aWjHy+yOSOPV0e+KiOdsfFl3+CeKHLv0lIyhpDTslp/Lm+9p65rlcI3TCroOjxlmIT6g3VFtRBJFyP/ahQ6EowhHi2ipltyduoQh/YOwvkz+AljF+vxQDmb4MpKCw4UDTgbWPOcVIKYf7xFnrOXoFswTm40qR+b1SCQg95r4VAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AFLfzDKQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AFLfzDKQ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so894235f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 05:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734702599; x=1735307399; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=afCBTLlzLOHDuBx94uI8KNEKbVqLnuqOfBh0B3tL2lM=;
        b=AFLfzDKQTkBfcbcsP/hrw2kxMmemMm22qrYeagqE08w2JOgKDV4N4TMjWBq7CkHhtr
         fCE2ZymWg+YPTDtFW8p6jGVIMa1JRPBbna0NDi5ZfaTnH2ET73JsuP+fQnsKNsp3rtYc
         UnwCz+sAP8pbhnOhauHYLxr3T/i1YxY/PA6f88Ysrw8oExkbixtA8iIQFnO1KswrehGY
         s7BgQLwkxc//ITSKMNqG5dTW8S39cizvKliM0qim/HjdkXTgBDPHKhg5Jk3wk49iF/yJ
         0LbJQMQaeuKN3rAZxOHhiA30Q2V4Z/weZcrQMNIYPPL9tY/cHYzn2SlXHuA9CyI3OsrS
         TUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702599; x=1735307399;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=afCBTLlzLOHDuBx94uI8KNEKbVqLnuqOfBh0B3tL2lM=;
        b=ErO5BeZAAT+woJ9fvoN5A30Ry87A4Q/zQd2ePpJPOXSA2WXfkcpkIQNYxA62Fia4pL
         vbRy8yPOpSV7GhnHsF5fBbJdM5MS2vl1HUJbgxKpldKjm3IFbIAWrpA1ltpRvzS9UVPj
         qUpMsdl1zVI/kQMBTGXNTW2CE/JK7H8q+wNQGCBkmfF61+bhnQptgDQ7JClrjSPFM+qY
         lY1jXSKZDnBAby15qeWoR4hu/ifCtRQShrX+3a0g6wY/Gv55vGwD81mciJBt39BCpdVD
         1KRMQGE2VikPuS4ihO/XL9eTXxRZVsxcgZJVn92hciSfsynET6o+Vw8pYzkTmuyU4rKL
         Tv0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtVT6Cv6ltgbwTNlJ+DU5lXYiIlXcAcTWP2jQol5LlZjYExsNrbPqgMmXGllWmT+YpkZmZ5T9wUyX5UT8RGX9aTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMEhH58e4BHeOPRr+LttMD7zo8NQANVLpi5o9tzPCue1avu//5
	2Et83qWfs+yCNiP2QsRsXF0GIeXaqSqhZw+sUn2h5kp9vOQJkyKTeTwTBGyOp+k=
X-Gm-Gg: ASbGncvUmphpHf/5YZtTpuk6fX7poFKRRGqO8ChcsZ7dciHLqfTk1Y9spPm9NNRBrQD
	iPiRQOadZuB/SY3qWNZl1YfDArWEP6u68bqcC9QiIKzY6Zt/IKyL4XYUnnLdg76ou2uIbq6XsoA
	tb24MXa4d3Ag1/AzgN8PWyc9lJLFl3JKXvBKih67M/+PdKnIn6oNP8crX0Wivt7XIYsAmm/3dDv
	A4SmGj5NEoC8K7Bhi0e3jOpVZkbUcm0Zop5B2v6uthxAeLlZrmyhRq6T9L+vGg8VTWlK0AOHlRL
	4qmWYoNNfwq+zjcRUz0l1rIyszOYtueW7ezx
X-Google-Smtp-Source: AGHT+IFVI3Xlug85tV4rBO/UFKQXj9r2d/ofSITIKky8mI4773TM7o/3BAQMekG6blf+o8eGkUmgxw==
X-Received: by 2002:a05:6000:704:b0:385:ee40:2d88 with SMTP id ffacd0b85a97d-38a221f2e42mr3327105f8f.3.1734702599540;
        Fri, 20 Dec 2024 05:49:59 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e74sm4044313f8f.30.2024.12.20.05.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 05:49:59 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v6 0/5] mailbox: add Samsung Exynos driver
Date: Fri, 20 Dec 2024 13:49:55 +0000
Message-Id: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAR2ZWcC/4XNQQ7CIBCF4as0rMUAgm1deQ/jgsLQktjSDJXUN
 L27tCtdGJf/S+abhURAD5FcioUgJB99GHKcDwUxnR5aoN7mJoIJyQUXVJuxp0nS5xgnBN3Tvgk
 zrWVVcsmYbJgi+XZEcH7e3ds9d+fjFPC1v0lyW/+JeWCUCVdZqIVx2l0fftAYjgFbspFJfTLlL
 0ZlxlhuT7XiDir5xazr+gYjZI3VAgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734702598; l=4158;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=6TWIHezHv4FF1GCXzi2P0OdCIA/CiwYW9/ITn62N+lE=;
 b=qoUNrXlM1bh5TrIe5JvK1TOR2yxyEB+ORbRWykfdMg09NzeXljxBL7Yrz06wfb9Yo3eH0VNSa
 +nT/vc/kjxPDxF5xVL5anw8+FTIfDJ0nlJVlxjSI4Xhwzt3i5hUY8qt
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The Samsung Exynos mailbox controller, used on Google GS101 SoC, has 16 flag
bits for hardware interrupt generation and a shared register for passing
mailbox messages. When the controller is used by the ACPM protocol the shared
register is ignored and the mailbox controller acts as a doorbell.
The controller just raises the interrupt to APM after the ACPM protocol has
written the message to SRAM.

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
Tudor Ambarus (5):
      dt-bindings: mailbox: allow #mbox-cells = <0>;
      dt-bindings: mailbox: add google,gs101-mbox
      mailbox: add support for clients to request channels by args
      mailbox: add Samsung Exynos driver
      MAINTAINERS: add entry for Samsung Exynos mailbox driver

 .../bindings/mailbox/google,gs101-mbox.yaml        |  70 +++++++++
 .../devicetree/bindings/mailbox/mailbox.txt        |   3 +-
 MAINTAINERS                                        |  10 ++
 drivers/mailbox/Kconfig                            |  11 ++
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/exynos-mailbox.c                   | 174 +++++++++++++++++++++
 drivers/mailbox/mailbox.c                          |  60 +++++++
 include/dt-bindings/mailbox/google,gs101.h         |  14 ++
 include/linux/mailbox.h                            |  17 ++
 include/linux/mailbox_client.h                     |   3 +
 include/linux/mailbox_controller.h                 |   4 +
 11 files changed, 366 insertions(+), 2 deletions(-)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241212-acpm-v4-upstream-mbox-948714004b05

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

