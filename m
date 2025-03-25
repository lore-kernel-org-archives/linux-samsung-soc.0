Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F5B198A29
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Mar 2025 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742895973; cv=none; b=ISPnvHpa0VTfw4YWRT/v/CLKA9VQZH4qqANaMZ6Ahy4f6WppaGe0AAIN+mDuoWF2/7ANsKhjmDTo2DkgEebDaqNq+o92mxDIeiFqzgVZoN/a/ISr0N4p8+GKV0Mb6YNfpx5tbO1uwPR2cVwpNSkWvy3MowMyKdimQoatnGO6304=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742895973; c=relaxed/simple;
	bh=KxaPfmUvSFnV3Byq3QqC+CSZjErbzsYdDMoKikjwIGo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X5dkceO0JPjSti1h58ruFFJUlg7bgZdCzkSXfeg2P1D2JhECbywp+tYjGEptSxWXtovxJ7bCGItO5tRKQRa91C7sC2mvOFxlOWUcnqHTl6Z/urR2UkyJ/HJrqo1WAcjJ4EBtlFAnyuPIjL3pIEmsmUOOPihC4qoVLPwMomQUFB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z4rZA/qg; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z4rZA/qg"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so10474367a12.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Mar 2025 02:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742895970; x=1743500770; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IbefRUQKW2oql/88hpKv3fFad6yESLUR8BZTv5IsOP0=;
        b=z4rZA/qgUpvD2iU+efBlQ7bWMsQvXwDh2o5un+PKtQvZc8aTSsof0v2flPdwM724+O
         2JA7X8MZaBslhCKvsowbHJzXSkkRcKeM6JjTPIlKh5HPyxq1JQIpPrj12zyB1Lz4XOhV
         Wd1dFbxrDhFVMssT//qUw1XUL4jPLSjk+SL+eLNEs+Apnw0lDV8WwsXYnhg57zo/mrkI
         VUk+jAriuRX9YXG/VUez/t+mw19/G6ZPKbqPlVLHJHv2Q6TfbP/FoWriLVQno7QkpC+j
         9m+dkmX1WOwoi5//KqdxlBrv2lpZ+NU4AEOeCSVI3jZYpT0cAKR61MT+IV2Ji2ap5YFa
         p9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742895970; x=1743500770;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbefRUQKW2oql/88hpKv3fFad6yESLUR8BZTv5IsOP0=;
        b=r9Wg4jhzXzP6yIC4iVaMvcaFWEofk9q1L3UURaBcpjGho3A5gHSdi1f/SaTpeqdsQk
         8hHg9iUv2hD08AnVcMII5jeTyBkLtRH1zqCz/MpUfYvWQlFHcvHqO1OjV67Kskgs/28f
         xv1s3nNDVMcdcCGIptYF2b5/qNc2XcKG1sgx7vUD1tC5YSJ3GtkghLlZf/jI100whaOL
         5xsRzDDuhhn4FoPPYb0iNSm2lJEiY8msfdWcHzh3HRHc+KP/CBdWYpm+TRpsrMah4hfl
         o8qGF3n7xz6aUnEyNe2sL8jGsjDLjN8o0QMBE9n9ZiG8kIyk7+sj0PF/W9GSnsiLMmlK
         IFHg==
X-Forwarded-Encrypted: i=1; AJvYcCWCmP0NfC5fFpAg2sKiB/vW01UCIP4NeyPvNyAG99PiEUdEAEQNHRv539LoV0KHICCyiCseKoqO0qrmEBGz/d5kEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9cXB1EzEUUZrpZ/HwrZYUrDgTzqKwIlKFREazaLhevFIYWtA3
	HX7kIBzOcMAbuQ7r8PBb8z/xy01rURfUFcx2SEIQx054vMe0gVDSY5ejP9FSoX8=
X-Gm-Gg: ASbGncsjxsfPmU32AByPdyHEAvHc0LpgYssStGodk9aGOcLKusf81jqPa6n2nOGZ51m
	ZP+CTiVfFay4ZbJHA2jPbOD7W7uKBkvJXr1HTS19cGV+dEf3E30O+Xr5zjw3+0+8MwZtRDFyP4Y
	h0/56Teqc4ZOxTQm4GgV5JD5Hj9gutb0DC+vpd0DLx8htnqxtJxZQhkvrmyQlaVTt8aAIsJi543
	nWSvILrLrG+sKfPws4DD3AEEymvuXNJNU+X0eCNpFpKWjlKiO19glDJZqZyCh3GpnbkOP8l4bVz
	ov1qN5OAQWJzrlTOlADjg48XgPntHZHwmVux8mFbMwrpLEVvH9KoKGOV9t+cZiYOoKz+qYPckxT
	BdMilmff9vVBA+5KV4q7LKTuKDHZo
X-Google-Smtp-Source: AGHT+IFYMNqZbEEZU24hSgKcW3m5RLIViDlNIgnffwEY/e9N3Ve3Ev3qTdJRHo9n8Lr2y8eJMqGUHg==
X-Received: by 2002:a17:907:972a:b0:ac3:cff:80f1 with SMTP id a640c23a62f3a-ac3f258cee9mr1765840966b.54.1742895969537;
        Tue, 25 Mar 2025 02:46:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8e509dsm832834566b.68.2025.03.25.02.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 02:46:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v3 0/2] firmware: exynos-acpm: allow use during system
 shutdown
Date: Tue, 25 Mar 2025 09:46:06 +0000
Message-Id: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF574mcC/23MSwqDMBSF4a1Ixk3Jw3ilo+6jdBDjVS9UI4mEF
 nHvjY4qdHgOfP/KIgbCyG7FygImiuSnPPSlYG6wU4+c2ryZEsoIrSS3bh65XfxIjgutAUwjjMS
 OZTEH7Oh91B7PvAeKiw+fI57k/v7vJMkF75q6hqZFwEreXzTZ4K8+9GwPJfWLyzNWGUNbA5QVS
 qjMCW/b9gWJkyPp5AAAAA==
X-Change-ID: 20250321-acpm-atomic-033775b051ef
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

One user of this ACPM driver is a PMIC driver that needs to communicate
with the PMIC during late system shutdown [1] and at that time we are
not allowed to sleep anymore.

This series address this by switching the code to using udelay() in the
specific case of system shutdown. This approach was inspired by I2C's
i2c_in_atomic_xfer_mode(), which has to deal with a similar corner
case.

Link: https://lore.kernel.org/all/20250323-s2mpg10-v1-29-d08943702707@linaro.org/ [1]

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v3:
- switch to unconditional udelay() (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org

Changes in v2:
- add missing ktime.h include
- switch to ktime_before() instead of !ktime_after()
- add link to user requiring this change to cover letter
- collect Tudor's Rb
- Link to v1: https://lore.kernel.org/r/20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org

---
André Draszik (2):
      firmware: exynos-acpm: use ktime APIs for timeout detection
      firmware: exynos-acpm: allow use during system shutdown

 drivers/firmware/samsung/exynos-acpm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
---
base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
change-id: 20250321-acpm-atomic-033775b051ef

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

