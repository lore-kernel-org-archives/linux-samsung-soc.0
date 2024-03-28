Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871987F466
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Mar 2024 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711629289; cv=none; b=tCAbECzfm7uvCV3S3zRU6QoGXhFrm5UT/ROFMSi0NyuS2pD/+WJ16YXI4rc3lC0kaJnJBeWL0eIFIc/MADPYmVNG5BV0S5TChK22ZNnPVYJVlWjHSXjbHfgBuEigoMgW9gWyB5+BtGPTnoAPHbsZtLiStEYjmXMAVKbd+E/9QSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711629289; c=relaxed/simple;
	bh=N0VnPgbWrvY1XSHkJSVJnzw1cjtZzFe0yo4Covel7Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nm4XDiGoY8o68S4a6vwmyBYF5WxTt8htm9ZVs+fGsCli8jT3NPY8yRLKovYThrCBbjGYBiZSlpLu//VxgElaBUHFLVfy1TOLWTadVP3Kym2ypyMkT5EJj37TlsK0KBfl7df9b9VKJKtX0pZKZFwpta8Ij/cOqFCiIeJhbDFbVwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ypwiHoIt; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypwiHoIt"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-34005b5927eso608045f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Mar 2024 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711629285; x=1712234085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0wFpD+++a2qGN194PQlW/ydpKP0vxDJuH65l8GmtaME=;
        b=ypwiHoItjV+5/GIR/MZSqp8UFkl88D3MPWZ5EsBWcyDv7aWwXKwugVn0722FobebGe
         R38jX5z65/G3N1KAV35Mb81InwBIykUshd34indmcysQBvgCZFaketKk+tGrORhTOcfO
         KfEQyusE4TZSKXQccVLabuD52xDppzbGOs/KOZMshkq+VtZUJiJ6VhYEY/3g7pyLFgYO
         W3XOV3hsdu4Oc4pZISXBBCwNgQbcRSI3WAfQd1jAM7bMiiAFZoWrilcMpRArTFuXQcyY
         +HmxL0iHhWL0HvwL1PQofKDHAinW2IAxCDLrzJXsprQmUB39MziU2JraFHTVrDBhJkrw
         hcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711629285; x=1712234085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wFpD+++a2qGN194PQlW/ydpKP0vxDJuH65l8GmtaME=;
        b=I2PP1V6SATLSqZH3rSX7BJqP1wDERF8gzgw1I6GdRdxfKxJDfNJJpMNvgU9SyF5CvG
         FC90k9W+zjKbre3dzLa+BjktLAWo1ey8VJsl9B26g9PYUU3jYK9uN6mr2aXITXR0+8QN
         t5hXK3Ct4kzk77bLvwza5TpSpbwFIrR+oc/CiITYRCqiEMvsd33dUMFosehHM9E9EjOP
         oUdRunseFna8HxDrYo6rbJOZjCYomgGpL9NXijM3YWxUvSOJ7HBby8cZRu2VrehnPFWg
         JxZs1yRjwn/VRx7aasr/o7a7LmZJ5/NtGNQGhOY4QHLLopZIBEnU0BMDeUVivnp1wG0X
         07nw==
X-Forwarded-Encrypted: i=1; AJvYcCWnRtXLPrnwi+IGNX4ENT1+UIgn6RRirg3FzjVMYIOoyZs2VQcA4V7ZTjKJY94rc4Dd7ooT+fGOEnVHgyS9G/O6RFu+0j0PXR/OM10Utskb8v8=
X-Gm-Message-State: AOJu0YxljHZyuXbKRw7RUTu+mXrArIivDp3sAlhadoYaiiJauV1cLK6y
	Zgpsa43v0x3g2gqTTHUx1b8W7pe4QU4wf33VXfA0fyx2jYfPCwdEVeyw7SnIkns=
X-Google-Smtp-Source: AGHT+IGeWvo/4NVkNv2RtRW6WUniovQcsePcpHiG6m59zjQV4C3QR40TEwzrJzXenDVVjdliNkIBvg==
X-Received: by 2002:a5d:6448:0:b0:33e:c316:2a51 with SMTP id d8-20020a5d6448000000b0033ec3162a51mr1524284wrw.27.1711629284889;
        Thu, 28 Mar 2024 05:34:44 -0700 (PDT)
Received: from ta2.c.googlers.com.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id u6-20020adfa186000000b00341e2146b53sm1639671wru.106.2024.03.28.05.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 05:34:44 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	krzysztof.kozlowski@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	semen.protsenko@linaro.org,
	linux-clk@vger.kernel.org,
	jaewon02.kim@samsung.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/3] clk: samsung: introduce nMUX to reparent MUX clocks
Date: Thu, 28 Mar 2024 12:34:37 +0000
Message-ID: <20240328123440.1387823-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v3:
- update first patch:
  - remove __nMUX() as it duplicated __MUX() with an exception on flags.
  - update commit message
  - update comment and say that nMUX() shall be used where MUX reparenting
    on clock rate chage is allowed
- collect R-b, A-b tags

v2:
- reword commit messages
- drop exynos850 patch on Sam's request

v1: https://lore.kernel.org/linux-samsung-soc/20240229122021.1901785-1-tudor.ambarus@linaro.org/


All samsung MUX clocks that are defined with MUX() set the
CLK_SET_RATE_NO_REPARENT flag in __MUX(), which prevents MUXes to be
reparented during clk_set_rate().
    
Introduce nMUX() for MUX clocks that can be reparented. nMUX is used
in GS101 to reparent the USI MUX to OSCCLK on low SPI clock rates.

Each instance of the USI IP in GS101 has its own MUX_USI clock, thus
the reparenting of a MUX_USI clock corresponds to a single instance
of the USI IP. We allow the reparenting of the MUX_USIx clocks to
OSCCLK. The datasheet mentions OSCCLK just in the low-power mode
context, but the downstream driver reparents too the MUX_USI clocks
to OSCCLK. Follow the downstream driver and do the same.

Tested with USI6 and USI13 SPI.

Find discussion on MUX reparenting to OSCCLK at:
https://lore.kernel.org/linux-samsung-soc/d508dfc1-bc28-4470-92aa-cf71915966f4@linaro.org/

Tudor Ambarus (3):
  clk: samsung: introduce nMUX for MUX clks that can reparented
  clk: samsung: gs101: propagate PERIC1 USI SPI clock rate
  clk: samsung: gs101: propagate PERIC0 USI SPI clock rate

 drivers/clk/samsung/clk-gs101.c | 225 +++++++++++++++++---------------
 drivers/clk/samsung/clk.h       |  11 +-
 2 files changed, 129 insertions(+), 107 deletions(-)

-- 
2.44.0.396.g6e790dbe36-goog

