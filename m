Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B389C5FEE5
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 15:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706024069; cv=none; b=IS1sOQo7NbGqLInI7mXy63zVto7LyH0MMlHV7WszVzyWDzFJVCxzREw5rZKD8uQ2ZHZLAwBwx4bmCmZvuGRfO9aKGGGiEI5lYJo3dQCOnB4GVgpk5d5fYB7yLRp0XWKw2VhWkICJXQNnElwcrH1UcycVauus9sf33fBvSXUyAAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706024069; c=relaxed/simple;
	bh=gNyD7i++uD2R8coWU2KAe3MRsCKjSQZq+dn+mnbIQ9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AkrlygwYFaLAWjkPbRy+Z6EXULpYBATYPb8+X/jeURoKOswHhIWcnTCNfwU5Lko9q9ceTG9UK03zvJmImoqCgLVdfQw/dnbRfYP5MsksgIDhRVeAuGIz4i6f3M/qMFJ5QD/W3Tqrk7Wk//iirBaFiU/EHzJ7xhLRov7OCmeE0FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aJbX/nGZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aJbX/nGZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40eac352733so25351455e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 07:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706024066; x=1706628866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ziVeE+WCI2TynApAMc3yW1L2n22pt52jWdrqUi+I10A=;
        b=aJbX/nGZDECc65oOFslfQ1KnfvXsS9zh0efYToJqx/PDuzx5jaPujA7Fr3ED7vZByW
         oIXpH/t+G4ZTwynRofC8fSMu4OIfof1eT88+31V2juY3eZ+sj5y5C8qBapFLjJL4m8A2
         4wZ/i06M004CCYNR453CMoRwbp0+dBzrfSaeuJ3ZELx5SsKJs6dAlR7zLpENm2SMgarX
         +H3gw4tKbYgKz+smjLOknaw4UTP88mZp3PizDL3tJ0qLzGI8UgI7Xa6jda6Sh+aIL2uf
         wNxfGe/89dpGHY8vmjurcUea7RD0CUC64UUFEvR2mES/MS8ESoJJsZo4bkvefz0261fe
         Vcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706024066; x=1706628866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ziVeE+WCI2TynApAMc3yW1L2n22pt52jWdrqUi+I10A=;
        b=EUCxhlCqj6O37lQG9v9aP0r7XqZfX9Y3TFE6InFn+Dq0GLNW4K9nBGV/6qnPWLlWKf
         rPNOhCC1vEcdtXyRflGRQ3GPGn/WfU9Tpn8QfniZJ5Q1Me201cLkfpN4o2fecb+9BA8G
         2I3QXRdHi8MYSD1Rmjp093SgirDgV5fOs7jHDA6LT0Mao0TWd11Q6eEBzFjlTuHrV0s3
         VXULEAZNZOPzPRiQg9ymh6w93ff7VschQ4m5C/HB4lZ3qIZTQCk6SoKkcnAV03rZbGHW
         +QKiy8YVjlYBlCErDmwKnv5k0ujDB1XcqQYDxcGoiIdSrJWMSiegJ48fvuN1KEOZ370d
         ojmg==
X-Gm-Message-State: AOJu0YxB+4AOpGusXne3h2z52GQJZ+PVRZB2K/3sB1Y9Uoq/5KX683HW
	Vy1VvMrbUaEjU5KXx4RpPQqZbW54VtU/gk2Fq+iAuJM3XELQzNPRNfdtvKOleHY=
X-Google-Smtp-Source: AGHT+IFHJyFWUBBJs2U3QAmGmiqakyommRSeQB3esKGCGNr9xKSS2oKCzm2qjt7cgP0Zzl31M0Ydlw==
X-Received: by 2002:a05:600c:5706:b0:40d:60b9:700 with SMTP id jv6-20020a05600c570600b0040d60b90700mr252998wmb.126.1706024065863;
        Tue, 23 Jan 2024 07:34:25 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b0040e3488f16dsm42457536wmq.12.2024.01.23.07.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 07:34:25 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	andi.shyti@kernel.org,
	arnd@arndb.de
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 00/21] spi: s3c64xx: winter cleanup and gs101 support
Date: Tue, 23 Jan 2024 15:33:59 +0000
Message-ID: <20240123153421.715951-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The patch set cleans a bit the driver and adds support for gs101 SPI.

Apart of the SPI patches, I added support for iowrite{8,16}_32 accessors
in asm-generic/io.h. This will allow devices that require 32 bits
register accesses to write data in chunks of 8 or 16 bits (a typical use
case is SPI, where clients can request transfers in words of 8 bits for
example). GS101 only allows 32bit register accesses otherwise it raisses
a Serror Interrupt and hangs the system, thus the accessors are needed
here. If the accessors are fine, I expect they'll be queued either to
the SPI tree or to the ASM header files tree, but by providing an
immutable tag, so that the other tree can merge them too.

The SPI patches were tested with the spi-loopback-test on the gs101
controller.

Thanks!
ta

Tudor Ambarus (21):
  spi: dt-bindings: samsung: add google,gs101-spi compatible
  spi: s3c64xx: sort headers alphabetically
  spi: s3c64xx: remove extra blank line
  spi: s3c64xx: remove unneeded (void *) casts in of_match_table
  spi: s3c64xx: explicitly include <linux/bits.h>
  spi: s3c64xx: remove else after return
  spi: s3c64xx: use bitfield access macros
  spi: s3c64xx: move error check up to avoid rechecking
  spi: s3c64xx: use full mask for {RX, TX}_FIFO_LVL
  spi: s3c64xx: move common code outside if else
  spi: s3c64xx: check return code of dmaengine_slave_config()
  spi: s3c64xx: propagate the dma_submit_error() error code
  spi: s3c64xx: rename prepare_dma() to s3c64xx_prepare_dma()
  spi: s3c64xx: return ETIMEDOUT for wait_for_completion_timeout()
  spi: s3c64xx: simplify s3c64xx_wait_for_pio()
  spi: s3c64xx: add missing blank line after declaration
  spi: s3c64xx: downgrade dev_warn to dev_dbg for optional dt props
  asm-generic/io.h: add iowrite{8,16}_32 accessors
  spi: s3c64xx: add support for google,gs101-spi
  spi: s3c64xx: make the SPI alias optional for newer SoCs
  MAINTAINERS: add Tudor Ambarus as R for the samsung SPI driver

 .../devicetree/bindings/spi/samsung,spi.yaml  |   1 +
 MAINTAINERS                                   |   1 +
 drivers/spi/spi-s3c64xx.c                     | 447 +++++++++---------
 include/asm-generic/io.h                      |  50 ++
 4 files changed, 276 insertions(+), 223 deletions(-)

-- 
2.43.0.429.g432eaa2c6b-goog

