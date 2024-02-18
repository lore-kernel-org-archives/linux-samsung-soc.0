Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE4D1E534
	for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Feb 2024 18:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708280824; cv=none; b=klFA9N+a3RdSwLA3w0AeN9cD2d/ra8BNT7M5VytQdA/jaaTawpzh/dmFG7pzyjO9MIac6Guc8k7Fa4FXMM7WuTOQj51575zOCDJd8ULGYKkyI82hLGx3n6OmMT+JQym0rljmUJFO4qPR/UL7cIjJqmswz6CEQ+RlA+YIejYNfkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708280824; c=relaxed/simple;
	bh=h+8YSK5EbUCVVcPv/5kUVUOYAs8nPjnuNS8a9vxhy0A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=txFf2SqlksdmiQBujjw+2/7jBsxjwtGOpjlgvaul0jbWP0XO0g+SuSnjausnO5k38RBH6fEfrVn+1oGsUVe18NYfIjOcwe7XhkKyVu1MFjrrGgjn7fyMucDOxbGpi68usebXgV4HJo9gGGzHTKZ4ZmvupqLAFAqB0RDDuF2SZoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rl4jbnV+; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rl4jbnV+"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d107900457so51106541fa.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Feb 2024 10:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708280821; x=1708885621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcQ97OFQNs3R16kTM2aR1AcH40aXNgteh4fPRKCJudg=;
        b=Rl4jbnV+IoCmew+LWaP8DSPjiPDs7TAotds1RfTAXVMigljlIXvZGzwiKCXaJsxVgL
         2a3iTn5IA37y6NCTol7lsOd3vmeEn9mvqBRDbhSreGC46FlzMZeW1EaSudJvXs5xDGVM
         QhJ0JUi5qfwCDsephcP9m2ljDSPNCCPQgE5K5XpUdrLGD+n8CiXvNKjTdDeYf42T9ghZ
         ZXRWICyxahn0wtnpI94gz4KaQPz7CoKUdTCyypk6OJxobq0O5+bdoifeCajJV90zOzO8
         x2qyY5s/6trUhht7KI19x9P7faMtJdywkj5affj/1TlZO0tIW2CnWdggXFEHLnYAJbUt
         UUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708280821; x=1708885621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcQ97OFQNs3R16kTM2aR1AcH40aXNgteh4fPRKCJudg=;
        b=IDKvj0arY5iZeIzkHf1aCODr7ETgo6KuFq0RsET8SujC6d/5p9yYN280c2UR0hMpRm
         QbtzhW0+sWIdvh+plf5VipjywJEjNVYd6brZxwgH0aB103uKhMz1AS46fW1LEvt91maS
         Tj+8j27D0IdhzN40Vtr44cAEMcIiij80HFo2l7bKIisLnAMhfoip1cqQQQhAtnUXYecB
         z2lfgM2zsM23AS0pEHi14I0qJyNOzHgAZ5BarGqEk7/04PEI110GRq7ER+D0XMStM7/w
         +gcYgb9nOLm+HbnVMXJ+Lq+jW7pjZbjHt0aBTtvEB6m4E9dUWGM70A7Br+I+8xLoRS5W
         zGRg==
X-Forwarded-Encrypted: i=1; AJvYcCVIs9XzyLqxSBvJUgjPvqWXhulE+ykytx1NBtR3/QXbMpZqVwojv3ByLuchxhFfg+j3vwR8zeLGW5spL3NJ/MuLg9EY9NTE1jqC0EzdZiT4DY0=
X-Gm-Message-State: AOJu0YzljWk2WDqaZ3exnRbZ8sv2KHZv9A+HxE5ObohwT8AAXg8O8jPz
	P7OFtsZjrY20cLfHRSGvMUuR27xJRQKk9R6dbhU9YT2NyHtVrlEiLayhsJI5n9g=
X-Google-Smtp-Source: AGHT+IE80M1z/F09P03IHlpRGx7t7Lw6zDY6kyyJTY7Jo4EVo8YoAgu0THGO93HaW3bGoE36IXzy7Q==
X-Received: by 2002:a2e:300d:0:b0:2d2:39fa:822c with SMTP id w13-20020a2e300d000000b002d239fa822cmr500915ljw.35.1708280820849;
        Sun, 18 Feb 2024 10:27:00 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id 23-20020a05600c231700b00410b0ce91b1sm8698796wmo.25.2024.02.18.10.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 10:27:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: dts: various improvements for v6.9
Date: Sun, 18 Feb 2024 19:26:56 +0100
Message-Id: <20240218182656.32103-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.9

for you to fetch changes up to 8c82b4eef2972200f6171aaa260d7bba2ad29889:

  ARM: dts: sti: minor whitespace cleanup around '=' (2024-01-26 15:30:45 +0100)

----------------------------------------------------------------
Minor improvements in ARM DTS for v6.9

1. Marvell MMP2: Very old issue, for which I sent patch back in 2014.
   Patch was never picked up and now another try to fix the same
   happened, so here it goes: use proper compatible MAX8925.
2. Marvell Dove: add proper unit-addresses.
3. TI DA850: add MMC interrupts.
4. STI: minor white-space fixes.

----------------------------------------------------------------
Alvin Šipraga (1):
      ARM: dts: marvell: dove-cubox: fix si5351 node names

David Lechner (1):
      ARM: dts: da850: add MMD SDIO interrupts

Duje Mihanović (1):
      arm: dts: marvell: Fix maxium->maxim typo in brownstone dts

Krzysztof Kozlowski (1):
      ARM: dts: sti: minor whitespace cleanup around '='

 arch/arm/boot/dts/marvell/dove-cubox.dts      | 4 ++--
 arch/arm/boot/dts/marvell/mmp2-brownstone.dts | 2 +-
 arch/arm/boot/dts/st/stih407-pinctrl.dtsi     | 8 ++++----
 arch/arm/boot/dts/ti/davinci/da850.dtsi       | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)
