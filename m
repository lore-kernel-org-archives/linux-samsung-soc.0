Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C4723AB8D;
	Tue, 22 Jul 2025 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753187038; cv=none; b=L06G+eGPze4dYSXIarUnwvjQzk94g9+0/7gN5mqzM4wTHfFmqCT7Pt+iiVqNNRVdnTJh7mVAhHeDljApAU1qWiftkVtX/0OOVJi0oE6pSmv4Zq5DQj0V1zYiRcp8mgEsZDSprdGPkMw9He4t6MKYPmtFAN/3uHZg2JpehRrnqdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753187038; c=relaxed/simple;
	bh=WeTPywAQLUuchrmA0NvHrm6ddehj4OFPXPzgdioHAnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=owLzFiWQxu54Tjgd3IF9mRgcJF9p2rSHBcM6v3Wy/kL2ZjyyUgUmejZDK8Q+b6G/NEk226bFml7vmAES4tBFyT2h1PiE76pQqanVAofFNOC+2Qc05HhwEDaJbBkXbUajZMk7eQaM0PJikF7a7La3L7ZP8qvGDZ8Bp62OhJliTAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OshxhfJX; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OshxhfJX"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae6fa02d8feso791092066b.0;
        Tue, 22 Jul 2025 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753187035; x=1753791835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o9zVmz81PD3EcDqh5BGdUlKDbC/PBBgCXACORglCMmc=;
        b=OshxhfJX1h7xkzClEekXTwDpl3I/BW6vkfq55EEtfJsOPKNI7ZU1zvHvKTXydggNcI
         YI5tUjpKMoaH5cji9yKVJOnH9hSkMkcc5RY0yMi5dwzguuGVV0vqUkSc9EfJeIb03hJx
         BoPPFVF/+2LSWrs0yhtUJ9DDCvByc3ARPrYjNRj8ULnkkkyrOBdAOdwFGQ/NV8wl9PnO
         fWKYz7Qs+K8PzYk+dCwQGi/yCGlFIGHGkxtDbmjgEvmfN5ibXMGMta9PHAcga9P33LPF
         BMGiaz99FKQgfxUxh0wIwNxntZHDD5atq7bYcJP3aWlNq1HQHYpQhI/R3jfVtxnaKTLK
         aYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187035; x=1753791835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9zVmz81PD3EcDqh5BGdUlKDbC/PBBgCXACORglCMmc=;
        b=gETbwkcuqxlTAIJ5Ebh+WlZst5g7WRHuJC+wZ5cwAqypHwCh7z75e81j1k8CX5sEcx
         vcIVLVLHJ2kH86D1JSpqG2nFIPTl5NX7n9zFd20MWUqLniSzuzuBngkSfQOZxaEIEqKm
         wIDKvAbCGIClIkmWRNG/2U58PgGYq+gmsv+6Hzg7dBaRYqbtBUHDcx8sL2yyZToX6/c4
         DiLk78gRQy8R/ES7xAmSjx3qzlJcU/pWLke+WVxAAV8RNbldZy9tmOIvng4uXhrR9351
         POoDvhcNfjNRW+si4QDeJxxS2bVGynBgpbSbkVurJ2HNnKl04LC4Kk4k1n/Op6teO/dv
         kuQg==
X-Forwarded-Encrypted: i=1; AJvYcCVi30HHFMjUZCDoKsyglykS9yxP/EgnpnKuI2yP3bGMJg4ShyDKW5//+eFRtrBuUkcO/Btoq18wck1eXy5E@vger.kernel.org, AJvYcCWwQTjJhPrh0GrZOhEJAQpOTClRHIe6A/mSH83OMYqP/D/r2ef8BhDO7jGTSG+ootHQs7WII9BwoJZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzmJqf4CezCX+Ud1nOPJmlPPc+Yf7Be+IlkUPIBbYKx+tSUihjh
	YQ3cOGfOGxTjoU9ecJ1VTjSYOgTYwFm6g5uyUX9Klf0FmVp0NXBUzXhndxiCtg==
X-Gm-Gg: ASbGnctGQT7pWtcGA5dJ5r9W/nzJ1dgWBHHA4GdVyCvxt9DaQpY/CmZdDAb8wF9Aa4N
	riM+oBeqreMmqfAm0nYhnKFQ7J6kX88FF2OOSi0Rkhv0lLGaGkPGALtgE0jwuXhY9qM96xicMTN
	t1guxxN6+dXghXxiWqJ43I+VSzwwc/4zCOX9eInZGo5kwthqxJS7MTEOBaWm3WZftYhDK4W2OTM
	lqMrfmDz86jzDJGo66jBWMXbI7sY11v+5gCdxTIgVkSIWaBEf2LD/KIEUvONHX6E2ChAhyRYm+s
	0v4EPt/JgzVBCXqybhWIkUXpmLuVhMah4Yx8C9RLTedH1cHAZrMqF5U7apC0MiFxBW+Xtoi+bc5
	MaEr8fcusqHLomNy6N+waov+mmtTK7wB0q+U+1WoF83HENN0Im/EPtr0eNCVhCOUV7Bk197rLOA
	==
X-Google-Smtp-Source: AGHT+IGLZ9hBnU0L+6iBn36Ar8EtrC0DggxduYejAe7GRNOw5gatUgZQ863G8i/REynVRkoMww08NQ==
X-Received: by 2002:a17:906:c00f:b0:ae3:7058:7b48 with SMTP id a640c23a62f3a-ae9cde31899mr1973204166b.25.1753187034636;
        Tue, 22 Jul 2025 05:23:54 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79a056sm861358466b.14.2025.07.22.05.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:23:54 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] arm64: dts: exynos2200: introduce serial busses, except spi
Date: Tue, 22 Jul 2025 15:23:46 +0300
Message-ID: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey, folks!

Before anything, this patchset only has binding dependencies, without
which it will have undocumented compatibles. They are the following:

[1] - https://lore.kernel.org/all/20250722120859.443283-1-ivo.ivanov.ivanov1@gmail.com/
[2] - https://lore.kernel.org/all/20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com/
[3] - https://lore.kernel.org/all/20250722121434.443648-1-ivo.ivanov.ivanov1@gmail.com/

This patchset adds serial busses, implemented in usi, as well as serial_0
and serial_1 for exynos2200. It's missing spi, due to me having troubles
with reads when testing.

Best regards,
Ivaylo

Ivaylo Ivanov (4):
  arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
  arm64: dts: exynos2200: increase peric1 and cmgp syscon sizes
  arm64: dts: exynos2200: add serial_0/1 nodes
  arm64: dts: exynos2200: define all usi nodes

 .../boot/dts/exynos/exynos2200-pinctrl.dtsi   |    2 +-
 arch/arm64/boot/dts/exynos/exynos2200.dtsi    | 1391 ++++++++++++++++-
 2 files changed, 1390 insertions(+), 3 deletions(-)

-- 
2.43.0

