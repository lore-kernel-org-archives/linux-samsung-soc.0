Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1242040B6
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Jun 2025 15:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965405; cv=none; b=mFiWnKQEYbJHjHcQehf6DB1Zvx+D6SUo/i7LWfW7Z87D/MD1VdzQ59KCLZXnn0SphQG+Nnvitzwg9CrXhj9N+euka+07vEfueqK2pCgGAsoOua7Bp0r6dYzO0sF8WjzPzyPvKLLq4t1BlhBgm7m1K39yF1EDI+8b9yJYJ247ROk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965405; c=relaxed/simple;
	bh=aKo9WNWRBL0f8HmrtPSASNW+mdOzeR3AWVqy7W4T820=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HrbuKD7XP/ag8IrUVPvBe8l5qb8GvVw0dArMQr5sXJ1P3ltucSIXPjyL7HuQhJSunUKKNekQxYHrX88CnlDKtghBuwyD4ktVsjCgRZhaR1JfLrUQITvww834bvwk7/bzTNjvrmhdQ3xTGq0y1RMYF7JJ2Kk+8NwXuOj9DK0mgn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dn5Lp0bK; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dn5Lp0bK"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad89ee255easo1053863366b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Jun 2025 08:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748965401; x=1749570201; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=172AOsAQz4QlRBaW+nRn36onwnXefgQKgc9WvkOzeXc=;
        b=dn5Lp0bKDGpLka3BIU+PNOMDBTnjqJ6TcNBnKA9IurpOBFORDMHiLUAEjLqZeRP41o
         Zj6fUUGPeYh/id/u7KywDsovgxjJuhM+SeRFTOS8O4uQxx4T9Hlq7teWVVH14RHccAHL
         Od0g948M8zIZEtLNuEnq4tLUr3UNLpSWDqJIA88+8RVqcJ3BHQKCULikJ9jRbpO1AB/i
         HtOz15pKID+N50w7l8dV6YG5ynL9aro1I1VFXxwJgmujgHhpununNuG2C2qiPp0+V61B
         tiJNJoUh9aFI1BU3UEe1qlLuLZqV45Jah85mO1oioqLh4nF77pWv9WH3QWYLQJiBS2j2
         h3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965401; x=1749570201;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=172AOsAQz4QlRBaW+nRn36onwnXefgQKgc9WvkOzeXc=;
        b=Y0UZNQph6mF1SoxuhhvwavEH2vlMcOZeZtrR1EPxIH33MaqzMF4JeEsXhEpMyYybUY
         L12bhcWMNV/Gy2bZz3/U2/wGF7faFsSXYxNyg2jbineUgUMzVuWcqaF2Wha04CNTQAKz
         bRgmny3canLASiCl9KwwYKb/IDsC9rkUN2R9Gsq4Y5X4O4/t4k2cPDWPxMIyXPWQHD5N
         uUWo6UJg50Wl9g4/y0UcbSIz6SPKv3aYfEj5zr/8rBNFmYbN16KEpmrFKUkxZu0X4/X/
         cChfjZvRhk9FXUEVlMv27Y4PYi21ttECOVxfEl/8eTSFVh78+5ng5fYsR23e2Dmpu6V1
         0HJA==
X-Forwarded-Encrypted: i=1; AJvYcCXGjuOypgLeIW5ntj/ym9uU/xbXovpnycvLnVxghVTBQZjrOJlplDmbVJ7jTY4nF+CySpnXQwpmxUWE0k7wLZjvbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6tliHkNizxMmwQ/PDHBUFiG1RmIchNGwgVH8WRMHx41I/mdgF
	51RWAokDnd8G0vqXXgqrGyT7Nj40HCJr5+/xH4Onre0/JIN0CGPE2iHK7oYpCkVesxs=
X-Gm-Gg: ASbGnctgFzAmCy3L/2kpBlmkLYYbRZ7++/lxpnZ9WDmPcLz4jzIAE5TKF6UhEgxO1ae
	fEuj2pWYATvHXK0AF4HJg4jCkwnTh3ugm1vTqy99xqrsPWsxEZ8kuQ2nkS/fSI1Lt2XmsHv/J9U
	CkUHwa4OePREdnRZLrG0mxKoGOC/I3CG+8NWqCVbO+UbXxf6LDmY8ui9TpsPg4viwz80hTjyy0i
	jA7a1OetQob0vblpcsPivBbrsaZ3SNfbgpZGmzGVuHYttMjjGwGck4ZlsNTLkZy/ts/kmNhOV8y
	WbOes/nzmTBUpi8+kAdEhU0GT2nRTXyK++T6tPVEj8bzJDT+Yo9UjeVji8lhoUfZmey8WrjlyO7
	zm67hzr2RnEXZ1FtGCduMZcvkwr5ODM2+DEg=
X-Google-Smtp-Source: AGHT+IGloNqlwgmA2JLdwpv1Sfgyhpoy3jA6UsqagxeRD/QCKnQisvHafq6ll76RsV6qpOjXtFvGFg==
X-Received: by 2002:a17:906:478d:b0:ace:5461:81dd with SMTP id a640c23a62f3a-adb36b05802mr1654872166b.3.1748965401077;
        Tue, 03 Jun 2025 08:43:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de9bsm959277166b.47.2025.06.03.08.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:43:20 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] clk: samsung: gs101 & exynos850 fixes
Date: Tue, 03 Jun 2025 16:43:18 +0100
Message-Id: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABYYP2gC/x3LSwqAMAwA0atI1gbqp4heRVzUmtagVmlQBPHuF
 pePYR4QikwCXfZApIuF95BQ5BnY2QRPyFMylKrUShctitnkDB7tuqDjmwRN7fToRl3bpoL0HZH
 +kLZ+eN8PPxlKomMAAAA=
X-Change-ID: 20250519-samsung-clk-fixes-a4f5bfb54c73
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

Hi,

The patches fix some errors in the gs101 clock driver as well as a
trivial comment typo in the Exynos E850 clock driver.

Cheers,
Andre

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      clk: samsung: gs101: fix CLK_DOUT_CMU_G3D_BUSD
      clk: samsung: gs101: fix alternate mout_hsi0_usb20_ref parent clock
      clk: samsung: exynos850: fix a comment

 drivers/clk/samsung/clk-exynos850.c | 2 +-
 drivers/clk/samsung/clk-gs101.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250519-samsung-clk-fixes-a4f5bfb54c73

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

