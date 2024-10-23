Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631124503C;
	Wed, 23 Oct 2024 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729675083; cv=none; b=QVQlcenHQM7GgpIH8pRP5/+Mjqy5R8DVlnGTsZXQ2MkLYt61tK2N5Dr5iJciZJCBtZZ5qliyovVHX86utuNOAavvEnsr9GEkKyaziOLGNaAvgBjsE3M6qUUSCmOEiNcKFo+jFyTWftmkIFov/qynbxbsdysObiA/ugQQ1lmS91U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729675083; c=relaxed/simple;
	bh=suYFZPHJ9gFTwEFo384qz94z1cETlcVAYVuUXBtfHoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oeYrygWux2R3aRH9DRp6BWmN3d7shRmoTufMmG9Jxmv1mEOICaflBMpmO6jVkUH3j3ZLSdxQrkv5rv55dIIijz2aS+eGybw8HKntTLLKDwIY8IZeuwZgxpsO8oyp2shm8yO9NljuTTt6RnLUHUWHkKv5ja1upWjIJ0FOZDPYUCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHj08Mqt; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHj08Mqt"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a6acac4c3so790549266b.0;
        Wed, 23 Oct 2024 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729675081; x=1730279881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HKyFdp80jeQ+jlEhTVnoKBC7uY0HBHNTi/SulDolW28=;
        b=KHj08MqtCeLhx/26yiZGpJUrLkJ6tYwLCoLINJer8Po8Wn5ilsQJv65pcq/MBvwxBm
         AvHCAPKLczfwyhQm/+YN2W3/TNVfR+7uI5DL4zrhAnUcPqw2kZePES2tZLEcf/WelCpe
         oeT/BnyITDEzkuPiAfTIlKXweL22fBByDAiIlRNZBPZc32oIw/rPo+8ZrQM8Aq9Y8dWh
         b/p7li7EfOzOKiT03yTtD/7wXUVK4popQEEAr2D0W2seeontAqBw2vtEFBAFmwdXPxSS
         nXkG2H1J2ZM0rFZ1RMPoGPLr4dLTgAos00mhMf1C80FFsCe5WGJw3J6nPZ2aBwAt0pLA
         tHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675081; x=1730279881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKyFdp80jeQ+jlEhTVnoKBC7uY0HBHNTi/SulDolW28=;
        b=N6lfyJ7ftKexyA140XuqL7DWRtLGELxp6/tsFMFYS98MVC2ZodlTtXEpbwARNWlRmr
         edAY73sVZi6wzib/TKZo+v+YONHgX4XqkDautpFJqjyRJqQ54hO014V6v58AGamI24Zc
         /IsJxP50RXlpqjk5ZGhvMa+TQU84HRQldMdrPvXg+3BBWYM3zqCLnez2Rh8w0IpP2mmb
         8uc3DF7I9p5ietZnqIFIP+hYtmd/7UhvP2rkgHJShEI3704znaB0BuCVaNhk/g4xb+bz
         5rsyvooWh36BSe5xjR0sYtHX/WfEWFFEs/H8WbljBwH1fgnpimdiUBh9Dh+a+8Qil+Is
         sNug==
X-Forwarded-Encrypted: i=1; AJvYcCVFmLvY4wobL/EopHW/kqNLp+Q/8hadUJ2D8BEX7lthN1kXgA2kC3YeUZB6uJc5r+0Qn6eLnZpQKK64@vger.kernel.org, AJvYcCWn0JvA9I6UfxBih8QtgrLqUOhs8sVWLN88clASPyJ9eAldTHnfDTWeTqVrFQLLKqZQAWhtRn6F8zw6XLxC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw79E/jo4bugCKgYu3xVvfyk1sK1ZWaCFndux/GJCzsGDUbi2og
	FN63JkHz/HxiC6vevFtyAIjKbfGYQoQ/sUUCSpkvizs75i0Tr3Gm
X-Google-Smtp-Source: AGHT+IHQDKM1v6j1KpR3PNxXd6NutIZHwOAX8Zrbdb0rubKzMnxJUNay7KnSa3JA8FZk9Ie4OpNsNg==
X-Received: by 2002:a17:907:980a:b0:a99:ed0c:1d6 with SMTP id a640c23a62f3a-a9abf920abamr159168666b.49.1729675080578;
        Wed, 23 Oct 2024 02:18:00 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913704easm449177466b.107.2024.10.23.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:18:00 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: dts: exynos8895: Add cmu, mct, serial_0/1 and spi_0/1
Date: Wed, 23 Oct 2024 12:17:29 +0300
Message-ID: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds device tree nodes for multiple clock management unit
blocks, MCT, SPI and UART for Exynos8895.

Exynos8895 uses USIv1 for most of its serial buses, except a few that
have been implemented in this series. Support for USIv1 and HSI2C will
be added in the future.

This patchset is dependent on [1] and [2], which add driver support for
CMU and UART.

[1] https://lore.kernel.org/all/20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com/
[2] https://lore.kernel.org/all/20241023090902.538040-1-ivo.ivanov.ivanov1@gmail.com/

Changes in v2:
 - Add r-b from Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 - Change clock-names according to the v2 changes for clk bindings

Ivaylo Ivanov (5):
  dt-bindings: timer: exynos4210-mct: Add samsung,exynos8895-mct
    compatible
  arm64: dts: exynos8895: Add clock management unit nodes
  arm64: dts: exynos8895: Add Multi Core Timer (MCT) node
  arm64: dts: exynos8895: Add serial_0/1 nodes
  arm64: dts: exynos8895: Add spi_0/1 nodes

 .../timer/samsung,exynos4210-mct.yaml         |   2 +
 arch/arm64/boot/dts/exynos/exynos8895.dtsi    | 161 ++++++++++++++++++
 2 files changed, 163 insertions(+)

-- 
2.43.0

