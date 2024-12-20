Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D501862A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 14:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705959; cv=none; b=gl6EWFesP4egCKkXxW2Mfm+2ybLMRw21pOwMkjukhpBOvUUnahmd4ZVP2oxZMjUgGMviomoIxLB5+zQepUB5BJyKXGOm1hte2syxj/30TObH4axGy6eGlLjMGEicADFxWh1QXCIX7dzKBKgMUIXq3UT7wp6B7ADWC9WxgrlJSqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705959; c=relaxed/simple;
	bh=m3kxsj6PdPfvr39eVNxBgS1/8+vpEhQMSwY5/ydn4Wg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HqeaJjHnVy0MVazQHROCdrGe4nA/xVm9PQpGonxa/cEKSrzdQTRagg9TURTW8VGNGe1vC1GIyknSROUPH9flz5BrGewQjSUXOkPRkXIWsoW369MB2tmjbvVzKrn1uv4kd2BAZ5it6qgLs4t/ONnU/xoRUgIN5YNQEpiTk7kQ6Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E+PVwFw+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E+PVwFw+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3863703258fso1946925f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 06:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705956; x=1735310756; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qBh2PRfn9u43SklY04e4FyKfcTmHSZzt7AhWG/h/FUI=;
        b=E+PVwFw+h1iTviKGqBJWcJMOqV5rD8uRqs99GO+bIr1kFQNIJkFsS1boUDiQBUoSEF
         GbcIIdiHMkLPZZv59G2jHqJJv4lAf06FDMj5SvcdqUBbj77zplFmKlzj2tNJ1zrjxeFS
         cFJfztzitaV+a/l/o3OAANfV+mkFln7+V9+/PBB0J71wDkjBsJQX4JU5+psgrVxsAQiT
         s8sqqWpUMioWDojpYY0qteNp51PWRVKrFbgFnWTD/7CrrAY5iN3p0exF6MjgX9PHAet7
         ixtWiTOCz0vunNQVkaeIas4CIEN9An5RQ6wylWHOnWZqc96/1KxYSYMEvIEsrCI+iWq8
         yj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705956; x=1735310756;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBh2PRfn9u43SklY04e4FyKfcTmHSZzt7AhWG/h/FUI=;
        b=JeMLZ8mEMCkAZXa6+TsbICEkyJaG0lQWZIS5Ij7FfgjOuF3QNQX3Wahr/V1wM9xjA+
         9qTlDyPj0E3qQXyN6xNOn7shgIxy6sbPyq0qjEsYTpT5yNP8Lrm/6ycsRvTVoUzisgwA
         7aGPM+DzFF8gDZqqcHTbUYEu+x+c6sirj1J8lm35jp/Oda7/JySpj1UF7wZyhYuogOV7
         fRa390AFgvwSb1JsRGxfqq4fME4uqjgar846nmzIcFp6B2Em55qGY8tIToK97j8NxlaM
         qjgpR30lhO+JfT2+mTuae/ohmcX3l7RvbTxJKfnSOawE9Xhb3l1Ji5pXD4NmE1ActUXq
         CKXA==
X-Forwarded-Encrypted: i=1; AJvYcCU8xSRYTGfLXuFmuWYKUfEpsmfyZESbjdAM9S/w/h7iTu+0R+7ktRDw0b0Q4dMS/RYttteLgIR+rmhHLszcwPISYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPycnpwOIwtEvmvvKBgldtAOeKFeQjupBQFlvWgJg5vlqDMuOK
	zeK0VhG256dwbdp8KspHZLmlPdj2BtdK4bPS7fW8rMHteGpUwjpqPD1Rv8x7OIY=
X-Gm-Gg: ASbGnctWK4uHdePU7bVDZpMfRowt0WTwBrwC/tNlLQ8vWHZbx1+ELFFs5vo1YSkfCzp
	7NbPFpvL3N64tLbhWI5aZm41np1ysKa+E/urUaIv8ZURyIOvmcbJuDdXbp3o342SaYjS7lkxIUK
	2c/ga4G2SVLX2pWlntL/rNaF08/TOMWJ9S6s9OKsWvMKfXaroq7HZlxwGC0d13GDQvXC5IvBbCF
	EYT9Raar1Dp4jrCkQT7lMwa6fMDXTr9iehFljyCIP6VOHPkXKcwrCcObjLjNpkQZWkmDMsFiQxj
	jMzrV9CYTbo2S71cr4CWhcBTURBLLBtoqU6d
X-Google-Smtp-Source: AGHT+IEZzb0/kl6e42ArojgN/PPsCD/T2HSUJTcMY5j6C8P+GFD/1OQmhH9MjKPITxbxwyX5uZWh6Q==
X-Received: by 2002:a5d:5d09:0:b0:386:4570:ee3d with SMTP id ffacd0b85a97d-38a22a4c983mr2802812f8f.24.1734705956132;
        Fri, 20 Dec 2024 06:45:56 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm4227874f8f.44.2024.12.20.06.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:45:55 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/4] arm64: exynos: gs101: add ACPM related nodes
Date: Fri, 20 Dec 2024 14:45:43 +0000
Message-Id: <20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABeDZWcC/x3MTQqAIBBA4avErBvwp1x0lWghOtksMtGIQLx70
 vJbvFehUGYqsAwVMj1c+IodehzAHTYGQvbdoISapFICQ5FConXpRH+j8c6TNGbWwkJvUqad3/+
 3bq19xvN4bF8AAAA=
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734705955; l=1409;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=m3kxsj6PdPfvr39eVNxBgS1/8+vpEhQMSwY5/ydn4Wg=;
 b=bzqeUTqgit5fBdKsmwIGXgn7rIJzr8IllqISGxcoXsCLqwv0Y6/qFtGaWG3OkrEndurMQFCd4
 6R9L2FyeLQwBXEgvyrqJuOGt3P3q1q73JX6EX3KRJOaWKmIiNG+O9v2
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Define SRAM, mailbox and ACPM protocol in device tree.
Enable the mailbox and ACPM protocol in defconfig.

Changes in v3:
- ACPM: don't specify the channel ID and type in DT: the channel ID is
  discovered at runtime and the channel type is always DOORBELL for the
  ACPM interface.
- mbox: update #mbox-cells = <0>;
- rebase on top of v6.13-rc3
- Link to v2: https://lore.kernel.org/r/20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org

Changes in v2:
- update nodes based on the bindings updates
- update mailbox and power-management (mailbox client) nodes to specify
  channel type (doorbell or data) and channel ID.

v1:
Link: https://lore.kernel.org/linux-arm-kernel/20241205180200.203146-1-tudor.ambarus@linaro.org/

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (4):
      arm64: dts: exynos: gs101: add SRAM node
      arm64: dts: exynos: gs101: add AP to APM mailbox node
      arm64: dts: exynos: gs101: add ACPM protocol node
      arm64: defconfig: enable ACPM protocol and Exynos mailbox

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 25 +++++++++++++++++++++++++
 arch/arm64/configs/defconfig                 |  2 ++
 2 files changed, 27 insertions(+)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241220-gs101-acpm-dt-6dcde166530a

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

