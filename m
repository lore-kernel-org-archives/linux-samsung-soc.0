Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1370D218E98
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 17:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733421231; cv=none; b=hVt33HpNiJbsFPOVa5nukoPLth7OdR1ONLK/gbehqcS3+Fm+zU3txBmVbSPwb8kVUuH4+wFZ+JKA0GBLvQdgrutVehdVF0pQojW5Kfd3ITleNj23bWht8kHmWVxlRFRN3da2QF/VjHqux6KkUZk1RXAeXHv4eQWuLn/FCHv/5Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733421231; c=relaxed/simple;
	bh=F5+uFyFuVjSoq22HoEhipvOsq8O5C/u1+zRx6Lu+Ggk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FvAayaPVS/XiVjI3RnlWaQ/MHTuvPypT3OXSJI4KXZQFPfYS/PwAwpxfDqFC6ea/shOMkZ71j7XTm522mqXSHmRzTnzpkGawDuA2mVU8lyHtjNYlVF9U/P8GODnOTXfgrezgpxsmWEgCR3srqbqC29hJe+d6IJ1SVYAJ50f1+YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vGVzvMKd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vGVzvMKd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a2f3bae4so12890975e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2024 09:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421228; x=1734026028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JKLV+ZZ6L5RhiT3EAHJqznTL9zji3yYsZpCcDpbwg+Y=;
        b=vGVzvMKdMh2qeqfUzRbCLx+LEqG5qAzYhkmdXkBkqIGlVO9Ecs5cZs+skNNA6E8Mlv
         h4Cc1mBUmKVigWJnE89dIx98xAxEMW0+kIb1vzjNzcZRbmuwmlkhKu1EfO7IHzrqGG5s
         5WW+/NTVpPWEFLij7QbLjfZZ4fIWiogczInN1kdsZfFBFmvdBCHhkM8/nlo/BpkT4RVq
         n7+hma5JsLb1ejB6WlQhvLDGBOcLWM8SxG/TDXIhpIvfkqYFNRrNO0kpb/oZug7Y4tME
         YVv7ctmftOlhCxFPcANsHECzRobKeZ2TQIdCIxVQwiPxiF//CuZ17pXvaiyf1/0bTTgZ
         C7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421228; x=1734026028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKLV+ZZ6L5RhiT3EAHJqznTL9zji3yYsZpCcDpbwg+Y=;
        b=eimhbjk+/N8JsEhVYNTa7Ht0KTl+lcN6cnIUmGOHkOIvxczzft3u5osf6oEieZqJqE
         DpPYVPhYvt3b6dDaXIyxxhOqyxx46rzk2boLi7Qg/npErvnrK6ZC0BNlNQwU4IjFb9w6
         hZuL9eKgWuSTTDKFUJBIljX4DMSAGYgWGJX7vTHSy3jehrNN1Lux5bEJIFyHw3Ly/tU2
         MFAIrkzj/35hqAczUrG12Y7GYUsRYSSarP+AMPZTH8D+6bQuvwLDwWCVSIgfjkmlAYfO
         gzjadzODdNydebOmtc6nyB3fAmargsulUFE7SYzwFTLDAzM5NTJx0850yYw1Q6lnb4zG
         h2lA==
X-Forwarded-Encrypted: i=1; AJvYcCWQE/HNwMJkhqcyr+WJYGDcq4lIEFmY6JVZKQCNVPqw7ACGJRYkA+5c89MBy3NBgWDPMRY60DJ7PMh8TGYylzZgOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNjbY0Lz6AIir51d/IQLoKluxdBDTvV8LZrOLLgUp8oIzQuI3G
	dFqiBKmXL7dcFe74pmQtK0kgGG3HC8FHIroSMJP4viAmKW7XFee0BbvJUQLCyc0=
X-Gm-Gg: ASbGncu/lsEzejTaaVDDdJIYoR3e2jJnQLZlXzDfGUf8s2/KB4/9lB/uoaWh6k0OJkF
	hhQP30UtHX2DN5tbBU/QgzyP9ngoz5IdwKx8WZYpJ943wazOfPSnD5DBQHRrmfRkEIjUYg2hrwe
	0LP9xjvShErTXn/tnovB/yHmCDbc5mwLAgpIeN/XPf4pfMYwNKheIqHvxADrMG3uysTIeHvtvQu
	K1e08TLMmmLe+ZsQ99lQ44cugO9K/m9G7j+Xv/jb30GzW+ClxZgcbh+ckwO/HlSV1CHK/5AoQRl
	a48KUP/PaP6Uky4nv5mt7IBtcpHAcedU
X-Google-Smtp-Source: AGHT+IHYi5ufJF54E0WyoeAp8hOns/BOtH+3X4gKSwUdN9VlL8YVCCF+k0/XEjzO2xfKiytFgL5nWA==
X-Received: by 2002:a05:600c:35d5:b0:42c:b45d:4a7b with SMTP id 5b1f17b1804b1-434dded6649mr1525615e9.25.1733421228429;
        Thu, 05 Dec 2024 09:53:48 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5280fc4sm67882835e9.24.2024.12.05.09.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:53:47 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/3] firmware: add exynos ACPM protocol driver
Date: Thu,  5 Dec 2024 17:53:42 +0000
Message-ID: <20241205175345.201595-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alive Clock and Power Manager (ACPM) Message Protocol is defined for
the purpose of communication between the ACPM firmware and masters
(AP, AOC, ...). ACPM firmware operates on the Active Power Management
(APM) module that handles overall power activities.

This protocol library provides the interface for all the client drivers
making use of the features offered by the APM. Add ACPM protocol support.

I mark this as v3 because it is a continuation of:
https://lore.kernel.org/linux-arm-kernel/20241017163649.3007062-1-tudor.ambarus@linaro.org/

The samsung exynos mailbox controller driver, the transport layer for
ACPM, can be found at:
https://lore.kernel.org/linux-arm-kernel/20241205174137.190545-1-tudor.ambarus@linaro.org/

Changes in v3:
- decouple the mailbox controller driver from the ACPM protocol driver
- address Krzysztof's eview comments 
- add ACPM PMIC protocol helpers

Cheers,
ta

Tudor Ambarus (3):
  dt-bindings: firmware: add samsung,exynos-acpm-ipc bindings
  firmware: add exynos ACPM protocol driver
  MAINTAINERS: add entry for the samsung exynos ACPM mailbox protocol

 .../firmware/samsung,exynos-acpm-ipc.yaml     |  64 ++
 MAINTAINERS                                   |  10 +
 drivers/firmware/Kconfig                      |   1 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/samsung/Kconfig              |  14 +
 drivers/firmware/samsung/Makefile             |   4 +
 drivers/firmware/samsung/exynos-acpm-pmic.c   | 226 +++++
 drivers/firmware/samsung/exynos-acpm-pmic.h   |  24 +
 drivers/firmware/samsung/exynos-acpm.c        | 772 ++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.h        |  15 +
 .../linux/soc/samsung/exynos-acpm-protocol.h  |  57 ++
 11 files changed, 1188 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml
 create mode 100644 drivers/firmware/samsung/Kconfig
 create mode 100644 drivers/firmware/samsung/Makefile
 create mode 100644 drivers/firmware/samsung/exynos-acpm-pmic.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm-pmic.h
 create mode 100644 drivers/firmware/samsung/exynos-acpm.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm.h
 create mode 100644 include/linux/soc/samsung/exynos-acpm-protocol.h

-- 
2.47.0.338.g60cca15819-goog

