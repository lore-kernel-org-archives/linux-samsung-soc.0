Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C3D79F1
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Mar 2024 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709294153; cv=none; b=o2/9uWxsx+abLFMbGiOCIesYKxJLenxgeIxkkf33zv8TcM9bfGdC1/6jfXbbC9ghc+Hsn6i5Ft1M1HYr+W0WK8pIBHQXPaSczkLEDf8YEUG1UK7FaTRT59E7tJDPGsPhYV9LimBYGtTJbPEzCBAiv2sr+aPVhOdTiF5Zcx0Kkjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709294153; c=relaxed/simple;
	bh=9IBd4IHdnmgZMr9MhB2rgqeToI13RNjtnipSgmttHIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=utptrseRaYzkr/xrh5bieOorikGCBzQ3eLhdbi1LjsxmNrsFcgUNsCfoRrNWD1n/76h9G0BqQfn2/37dNmgn3zzutRyeW2yykkgDXLeZZ8qhU9k8boLzDON7joIWMKnLVp4CoKmiOsAqhjQ6D7uXkFnW66B+dfa99q1ihYGONm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eIFn0f9H; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eIFn0f9H"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-512b700c8ebso2093527e87.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Mar 2024 03:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709294150; x=1709898950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PH9FTG8r38kw/2KGPIjmzvSzyg9hKHZV3106W9dU8K0=;
        b=eIFn0f9HdsKAjpJMPIO8Ee42E6ZkP04W4IggB97tcnZ1GKtBpqH1bSNQsr5wMT9bTO
         Y5t1ZdOwX56MmioM0UkWz/tUcL1rsbK8SarBRfQrrS/28usVFnviwKOljazO1XTM6kjM
         TnpMEVxWO3Z/BXWxCE5fWePDE56pzPBNtoyeZWgnO4T8tiehbXKXuZy/ArP5qjch4BVy
         nXbRFBO2jtL6Q77I3QOl8CrjPD47KgjJzgqNFCn7NYsfNbCl2kVfp/BxsJw4bEWEBXZg
         /hTouSIb6r6qTGdVVwEIjxhCnfTvp+hMperYaqykRoM2p/ZulvIIjZdOp9Xqsf/wv+ki
         M3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709294150; x=1709898950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PH9FTG8r38kw/2KGPIjmzvSzyg9hKHZV3106W9dU8K0=;
        b=LTRGWC6u28UMQUqZ/8itp0Ua2+nUomFlzmWEB8DWawQY63OTGzlbmAhjqzQI6ATzVM
         2hmhz+u3swNSHiKb7IGL/LX2edADUOxmNxgTMPg4bJI7VPJe/XyaAzjOkogpczl5Ddur
         oJR5tEqEQ+JeV4ZQkLNc8gHgNP98EfrcwND9F6b4hR9kMOcUye02OE++aVN8b5isC2mb
         tQJh7BvNoTUkurUa0D+j8XFH6FxyvzwMvdbtAOGOl7Wsdrag0xlHNkP5hgtPbSJ6LqqF
         Qu30Fd+KMW9tHwvPWmVq3K9lz6KEgyia4jemrsmPNDvjZqSpIpMOU3BdYBtWsR98DlgX
         dTDA==
X-Forwarded-Encrypted: i=1; AJvYcCXoKUDqhS+Q+mKw91FkLbEgjz1Z8LHaBbE0hEwhkaTVKhiJvaCvhHw7IpPYoaLyNhs50Ep5lbhf60vhMmhKnfr820j4vOHsR1uccta9adnT31k=
X-Gm-Message-State: AOJu0Yy9ajxFNCMXRQJC4I60hzKsHvchKMCOStKECvMuikt/OwsmadBl
	afzyZpDaSgapFQGNcDTjdEKOAZ+TbePQ8QSxsXUHnxprhgM7w25TF25EPQ924Uw=
X-Google-Smtp-Source: AGHT+IGe/5toR7aR9KlswPXRC7C3s6xaBbWIf2MKbXyVEOxjns4ZoEJA1I/mWf8hmVsKPNGdq0dHlQ==
X-Received: by 2002:ac2:4c13:0:b0:513:24b8:a7b1 with SMTP id t19-20020ac24c13000000b0051324b8a7b1mr1236878lfq.47.1709294150170;
        Fri, 01 Mar 2024 03:55:50 -0800 (PST)
Received: from ta2.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id i10-20020adff30a000000b0033b6e26f0f9sm4367674wro.42.2024.03.01.03.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 03:55:49 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: andi.shyti@kernel.org,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	semen.protsenko@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] spi: dt-bindings: samsung: make dma properties not required
Date: Fri,  1 Mar 2024 11:55:46 +0000
Message-ID: <20240301115546.2266676-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the addition of the driver in 2009, the driver selects between DMA
and polling mode depending on the transfer length - DMA mode for
transfers bigger than the FIFO depth, polling mode otherwise. All
versions of the IP support polling mode, make the dma properties not
required.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/devicetree/bindings/spi/samsung,spi.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
index 2f0a0835ecfb..f681372da81f 100644
--- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
+++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
@@ -76,8 +76,6 @@ required:
   - compatible
   - clocks
   - clock-names
-  - dmas
-  - dma-names
   - interrupts
   - reg
 
-- 
2.44.0.278.ge034bb2e1d-goog

