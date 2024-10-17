Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635521DF274
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 16:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729183021; cv=none; b=uWx2lF+3/uO5bqoY3SkbUuSJRmDxs2v3yCYjNkLLqkOp09cqe0wYOLxryoYe1V7PIwS83XGliUvoE9qF8tD65Ddqo26I6Tu3jhv0Id2G26oSxScbwp4IVsNLzDYIrBghQzBUCYufUXbj2iEVjswqSH4q7Lqf1K9AK8RquTrnx68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729183021; c=relaxed/simple;
	bh=cqJ8YXSL/6G8nBCjbPilRI7C8VZJG7pdQBTkoAIYBrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gwUmu8Ag3Dw0EXITRtNLv+jcxaW3P+Ni11dp95+1cj4LqINqbmShPCdMD5VPym1pifPQLjFXt7mqiS18WcErOFV797JlgBgahIgspo7L6yrD89E9RrDoB4O1TJYnAW1CqzhIYPlL16E+IAWIO1xZT80XzcuQVBx4qQINuRA8rM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YzpdJA6Y; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YzpdJA6Y"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315eac969aso4014035e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 09:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729183018; x=1729787818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fg01EDslkFVUhzMkkUb4hB5z0mSu8A5C2uHNCojkyKY=;
        b=YzpdJA6Y1lk+4j43KOFHjcbPs9p1BCskRb9jBTxdxe/Vyw8oXuTTgPzwFhGwvQso3c
         ir/hBRsZbBoUv7OCeDJ8h6QUbTCf2vqscdp2/0nAfXbuDWSEy9lNaJHKu6GOrcBUS/HW
         7ZigLN8v18y1N3T46HmLm2wNScmnlwYFNpl03DWiipo0oXotrT8ZkIRbv52mwqjpc1JC
         Ej9HXjSH39VbfGWaN8eJC0pjNLbDNozqUPtWZ1tSmABCnMnPcEaubZKYopR06fzGysvG
         5ygeNSPQPJIj1yOcoyTEuV78YtBM9Bxtq86RaNT2fHSqPrVPG6EB5H2GYKqV6Ymy7gtf
         a13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729183018; x=1729787818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fg01EDslkFVUhzMkkUb4hB5z0mSu8A5C2uHNCojkyKY=;
        b=k9TuhXv5AMHmCYtPEpMM+UcPLTX4uopOEVrQTnLT4HEsiFJOazz4RDJHBfPGX4EhOr
         1Pk1oPsxkheshnZ7pUqstStu9FumNYEm2CW6NxfkJbV9Dvs/vQv9kHroq/etpfMAZbQE
         rb3moEh2Ty1xyFYlyyg9x/UuFeoLMJTEbF+cxaGIGKLRECRuB0Lh+0FU/3BR8a5FsTbj
         p/tA3GrYPoSYiOZNHGTQFTCbPCXroq01FESRm+C4FREWV4TpMdQF11oypKb6mnSZy33x
         Z/8/HosGtl6qUfTweJxO81Nhr1VJVYQVZdfNzHB9f5o2qJCt6lPwQf5RUtGcOfzNM6vc
         F70g==
X-Forwarded-Encrypted: i=1; AJvYcCUUtcZDlv4IJxGLuRe5RrXXXxAZLf4JGvUYFxhHjU5sQbTk4k3nz9qfLH0anpdyY8ufY2IDqpqKEfECPjFx/9zx0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkhQK2QlORspUSWW75t7ZHgvMmslQv5xSNCig7bAwFMy4g8PmX
	rUyu+jIHJMp2HlKmZpS3q7bxCTGSR3qWttRCP9A9FrxhZC6tWwUiKHe0rw4YkGg=
X-Google-Smtp-Source: AGHT+IFRSodLproKws30Fwmeh9U5gZJ48F5btqXXPZbS12I3VrKrnbwPTFo3tKyGKXkjTmOb9njy7w==
X-Received: by 2002:a05:600c:1f12:b0:431:5226:1633 with SMTP id 5b1f17b1804b1-431587173a2mr26093615e9.6.1729183017642;
        Thu, 17 Oct 2024 09:36:57 -0700 (PDT)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc11aefsm7710376f8f.93.2024.10.17.09.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:36:57 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: jassisinghbrar@gmail.com,
	krzk@kernel.org
Cc: alim.akhtar@samsung.com,
	mst@redhat.com,
	javierm@redhat.com,
	tzimmermann@suse.de,
	bartosz.golaszewski@linaro.org,
	luzmaximilian@gmail.com,
	sudeep.holla@arm.com,
	conor.dooley@microchip.com,
	bjorn@rivosinc.com,
	ulf.hansson@linaro.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	marcan@marcan.st,
	neal@gompa.dev,
	alyssa@rosenzweig.io,
	broonie@kernel.org,
	andre.draszik@linaro.org,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	vincent.guittot@linaro.org,
	daniel.lezcano@linaro.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/2] mailbox: add async request mechanism w/ a user
Date: Thu, 17 Oct 2024 16:36:47 +0000
Message-ID: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This adds a simple mailbox async mechanism, similar to the one found in
the crypto subsystem. It empowers mailbox controllers with hardware
queue support.

It then adds a user for this mechanism, the ACPM driver.
ACPM (Alive Clock and Power Manager) is a firmware that operates on the
APM (Active Power Management) module that handles overall power management
activities. ACPM and masters communicate with each other using mailbox
messages and shared memory (mmio-sram). The shared memory contains
channel configuration data. It exposes at a specific offset into the
memory the channel ID, message and queue lengths, pointers to the TX and
RX queues (which are also part of the shared memory), and whether the RX
queues work by polling or interrupts. It resembles in a way to the
arm-scmi driver as that too uses mailbox messages and shared memory to
communicate with the firmware.

The set is marked as v2 because the mailbox core patch was already sent
for review a few weeks ago:
Link: https://lore.kernel.org/linux-arm-kernel/20241004165301.1979527-1-tudor.ambarus@linaro.org/

If everyone is happy with the current form of the set, we'll probably
need an immutable tag/branch to be shared between the mailbox and firmware
trees.

Thanks,
ta

Changes in v2:
- add the exynos acpm driver - new patch.
- extend the mailbox request with rx and tx len - let the client decide
  how much to write and get back from the controller. The controller can
  verify the lengths by comparing them with its channel length.
- extend the mailbox request with flags, in particular with
  MBOX_REQ_MAY_SLEEP. All requests that don't set this flag are
  considered in atomic context.
- remove a dereference that was done before checking for null.
- update the commit message, rebased on top of v6.12-rc3.


Tudor Ambarus (2):
  mailbox: add async request mechanism to empower controllers w/ hw
    queues
  firmware: add exynos acpm driver

 drivers/firmware/Kconfig                    |   1 +
 drivers/firmware/Makefile                   |   1 +
 drivers/firmware/samsung/Kconfig            |  11 +
 drivers/firmware/samsung/Makefile           |   3 +
 drivers/firmware/samsung/exynos-acpm.c      | 703 ++++++++++++++++++++
 drivers/mailbox/mailbox.c                   | 127 +++-
 include/linux/mailbox/exynos-acpm-message.h |  21 +
 include/linux/mailbox_client.h              |   4 +
 include/linux/mailbox_controller.h          |   7 +
 include/linux/mailbox_request.h             |  33 +
 10 files changed, 888 insertions(+), 23 deletions(-)
 create mode 100644 drivers/firmware/samsung/Kconfig
 create mode 100644 drivers/firmware/samsung/Makefile
 create mode 100644 drivers/firmware/samsung/exynos-acpm.c
 create mode 100644 include/linux/mailbox/exynos-acpm-message.h
 create mode 100644 include/linux/mailbox_request.h

-- 
2.47.0.rc1.288.g06298d1525-goog

