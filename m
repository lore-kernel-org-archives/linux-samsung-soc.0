Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BC41BE227;
	Fri, 16 Aug 2024 17:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723830852; cv=none; b=nYPnh+cScMEQ8vm00uODnnW2DnuuRO3cNfjfl0WDfpsarXDC9+GcSVznMnXHsEw+wMqrA0k0Gxvld5OGui7hoMQCDsVxM1yA1Qvay+uvbMD7tjbR+Pez1DN3NrwGfSf+GHHQvC9YbCD9v6+PZsonfxfjM6N6zk9KUcF79/W1MkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723830852; c=relaxed/simple;
	bh=8vgOupAH9q3Pi0C1YgjJiYJ1t6r81pGgJFXgCydFQk4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lXJuS+Fm9IuEX79bL7TOIMAvXuPCOwSun/VqWzX0KvCvV+kImpWnUq+LWaOcdvpU5HI/w1lqX9HmUx1xHVaMynmx8wLgrCtmSNgAbt60iQMTc0H+osiDKCrwSkALbGSL2vL1pUA4q0tqEatJOb4ByJFiTU8NAITvxHy0g7FiVXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HECkA8lJ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HECkA8lJ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a80eab3945eso254657166b.1;
        Fri, 16 Aug 2024 10:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723830850; x=1724435650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X3ztZ41qtkgTnqop04iLTUGQriZy+0ASCXL8BXf6h5Y=;
        b=HECkA8lJ2Hq8gFfrPBVmGgehzhYqXmHHNldqVilCRJxa8Qvxc7ulb9G/V4H9CRquU8
         /BhRk2Vd71ZJX32Z1gOq6Gt4Gy89ntJjypCySWfCoevJ68wP2XN1pauUoOhZchCwifpj
         gw82zelJ27qOIm9Xw1enti2+mHbD2VVTEkpcqJMRiO7ko8d4yS7u31MCd24oA2tZuFls
         Y+W16tr9ImsLpyU3awwt2y/j0Iu+tZc3QuPbPciM+JLnOqqFYv3jPUvLIxVyog1Tn2N0
         T25ZrWKiycDYtFkPJpDrSeHvk5/vpY+YCFmu/W7dPDx6nvvypmLG+0XWm7y6yxNs5Nrs
         gHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723830850; x=1724435650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3ztZ41qtkgTnqop04iLTUGQriZy+0ASCXL8BXf6h5Y=;
        b=EZS6VFx2hIYrIz9iF7Q8ZiXGW21CN1/Rt3XiWDFNyz1Rk8L9O2gBd758zxfXA+eg+H
         6smgBUGH7HLrZO4L8qudb6MNMlVAoEUnAxkaAzxkPxH781gyksMOSZfUP+xgZPnRs9mo
         hMDGXs19+zYfhrj6PiEYTTgRFXK9l1MrVqZi59Qzu535DkhwoFm/433Q/GpUtMLv5yov
         K1fCxeQoeuqGGQrUAQZsOHbkhESaWL95+MOUKMuKEyqF5FboYFzeW5dRIRkE7V6/n/FE
         +pXhlqtqGCYSHyKDAf8ln1CSfzIkfdLfFFC9EqrPFLicor3sHBhSAR9ZcpZsiOjV3cgO
         AODQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOzxEhls+tYcsgOUj5SpeZ7XDYNWPHiRzb68JiUbUVUU4cKduL92GOIXtrep+3amGvUyp1Zo+WjYwyGhauGvvGh424heF8L/TjlZaQggIk1ppaAB3DVDRhMbnCCwKieoCWuvGFPza9mfvHc3rDjhfVbMWStsZjyxF9TxY7B2TU+PDavs3f8+2cnqc=
X-Gm-Message-State: AOJu0Yz+OzmwJc0JoVGO4bwcYbgUtN6vmTIG/XBMWq6XfQ7rTCz3rU99
	s06viWiOtVkjdFCC/gUB98nJ7QIqJcbzWlgOgqpVOJWACnovBM5B
X-Google-Smtp-Source: AGHT+IEutHQ7iq7C56qtT3zYVqrbjNKJ6AJuAvMzjeNo6nfJ5fGmO556NBhvcd7YavhyfF6nAR5WDg==
X-Received: by 2002:a17:907:c889:b0:a7a:bece:6223 with SMTP id a640c23a62f3a-a83928a9f5emr259160466b.6.1723830849232;
        Fri, 16 Aug 2024 10:54:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a83838c66b6sm290520866b.16.2024.08.16.10.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 10:54:08 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: David Virag <virag.david003@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add USB clocks to Exynos7885
Date: Fri, 16 Aug 2024 19:50:30 +0200
Message-ID: <20240816175034.769628-1-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set of patches adds the clocks necessary for USB on the Exynos7885
SoC.

Earlier versions of the set also contained some fixes for issues with
the existing driver/bindings, which have been applied now.

Changes in v2:
- Split from full patchset.
- Added Cc-stable tags and fixes tag to update CLKS_NR_FSYS patch
- Blank line fixes

Changes in v3:
- Remove already applied patches
- Simplify PLL support patch

David Virag (2):
  clk: samsung: clk-pll: Add support for pll_1418x
  clk: samsung: exynos7885: Add USB related clocks to CMU_FSYS

 drivers/clk/samsung/clk-exynos7885.c | 71 ++++++++++++++++++++++------
 drivers/clk/samsung/clk-pll.c        | 18 +++++--
 drivers/clk/samsung/clk-pll.h        |  1 +
 3 files changed, 73 insertions(+), 17 deletions(-)

-- 
2.46.0

