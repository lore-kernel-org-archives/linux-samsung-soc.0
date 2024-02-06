Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972FC12C7F5
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Feb 2024 08:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707209571; cv=none; b=tvDqEwyhxQmiRs3W8NR+bDX08PUm7c6r0QMJ8t7LTHYVPdV0jGG6+E5umgze1KfwOOp5rxcUT2eq4/o/JbtXFUkDNXBHL6N2cmJI2Rvk3AU2Gji7VZ04xYTMyoiQznpdOVk2X8CqY63wPe5to1rNOf1Mat1bLzzgqbWRNwm+YAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707209571; c=relaxed/simple;
	bh=gb3/09jPmJQxQa+5iqTwD5oAbMlzBsY/867NNayEZIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFW1hj8Vg35BSoeRxH4ToxtDGZ8pofVnH3IwPhjTzr7CxproD0UWE/Xm4DddIwkkkufm+lqxGHdNh0rLmJ5SIQnlJiGXNRx05q04ClP+X/Z2lp5hrpV34MlNTjyJXQyxXXLsA0XP9fbzX8yDnz3Pxq4oUEGMI//ksvi7wXP18jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=je3aQsiG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="je3aQsiG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40ef3f351d2so1591725e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Feb 2024 00:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707209567; x=1707814367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0QF+4HlffGHefJgdKDHp8fWrwCAllLNXyqxziFTkTw=;
        b=je3aQsiGazQCNZNe+PZOEbl9eW5biPn5f5Wdo34ObGbWi8IRUpWGVlfVCp2wBMXPU0
         vuIr3zu9TeSoXjzej09c0cKNJgdpnLAbnothQedNaFnTwidlkNh7Q/7bXFeR71QzY+sQ
         wktAIf5qmcL9uKb80djp3rDCYXb9KIhKmn9Ru0X+7+v7HfACf8oxaTwSqLFw2lVJvu/i
         b5wb88pTcF2Z0HdWbeMMMbLB31qrU8nWP4GRIrEWWCO1yXHE7qwhHf8X1OPnTgOOxUW1
         NN5tyB3uGMRgtVQaalymr0a4Vhkh29C11i1MD0Am1O8WokQcgtuN4oHyvemlVculUK5u
         uRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707209567; x=1707814367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0QF+4HlffGHefJgdKDHp8fWrwCAllLNXyqxziFTkTw=;
        b=ORm6e6F3waMnAD2BruwW4bwhN8fy/2OkKIdvfF6HDZKqZyLo83dibCljusaW8KH48v
         DBIP0h9O8igBvgHDhBjHWYysUN219LzhBddHDzYIK0czgdxgu/yDwjp7LEvhEcO2OdY4
         MdL+U+kg9EPZnHiJyTkqdrAvIoZ9Le9sgZ1z8yghGj5C+SE9FuYFYzfcTVpt4PZRnGq7
         sHHdDjVtQqkDopxrYZF2Hb+jowA7KM6HfVgajOXvbjgGM/RY0PLiEmuOUzjjk2ae3S+D
         0911B4pQP2R2zsglPInbFqbpmO0LQxHzOyPavl47/GtGDTOchfWC2lkwTlXjQsBAwTDh
         RWig==
X-Gm-Message-State: AOJu0YxXfuftWi7pyvPMgmazNaas2TfymYP1X2X1zKJw0/FXjL9IsRQ3
	Mfxtx5y5Sgyh8VVi7/mWcns079MTsk5R4alDhlKliKN2TW1N26DkWPmpbzvTrfA=
X-Google-Smtp-Source: AGHT+IHC6aAcZXDMP8gtfL6xV0f2h4mOHWkxbV6phqY/eiIZshjnTyf0+T79bpivuePsboqjK7az0g==
X-Received: by 2002:a05:600c:3552:b0:40f:b69e:aa1e with SMTP id i18-20020a05600c355200b0040fb69eaa1emr6080174wmq.13.1707209566865;
        Tue, 06 Feb 2024 00:52:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX34c5jWCHAgfG586e2HK612qLg2gCXlE4wjCIoYzWl3tcQpCivQug2snTitLJTQHbNt5mqHrqdY2LX9UlZpyKlmx7yk7+WUWrIHaaMyKd1OZ1WIsbuaexKggfZj3/m7VNeWa2LtqbxvwPCTaKCS16sVVf0lgTrSuq9j3gNkniYUVS80Af4jhFO393vVC2SX/dCVqJw/Fzi1DcQuRmv3s4Ux5J6NkakJf8jpnXcSyYFlFpnuyGkpJI4Hdk0aXwjsilBnRrByZKi42Lx7l+dkM57l3RSopzSEkh0uEMr8tiWP94RnmrDBMvN1i2mrETQzIcKhuD2G2Ku2H9VUybzQE+uyNwiutMihV4d4qsTtbpbtZbtX9JUhvzATyc+oL6OWcM4yc7Rgc1s8Btx4hVijcGR7lD9omjj5Egj59rkcixqd5u/ZiZQbpzi+BZ4xGRU1NBcv+VPOXN6E+aHgR7iqRUzWRd0FmmdIY058AKrqi3xm/LGphYKL9bdV4sQQE0OKWKp4byiTlRCxurauI12xA9rPsbQQNRTkzo7XKFh4TpOd6z+AJ1LEFTmUZaEg+xb65hxNOYpLrPVYdlQ2w+uORRBqg==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c078a00b0040fe078fb03sm1221591wmo.32.2024.02.06.00.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 00:52:45 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	andi.shyti@kernel.org,
	semen.protsenko@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 2/4] spi: dt-bindings: samsung: add google,gs101-spi compatible
Date: Tue,  6 Feb 2024 08:52:36 +0000
Message-ID: <20240206085238.1208256-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
In-Reply-To: <20240206085238.1208256-1-tudor.ambarus@linaro.org>
References: <20240206085238.1208256-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "google,gs101-spi" dedicated compatible for representing SPI of
Google GS101 SoC.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
index f71099852653..2f0a0835ecfb 100644
--- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
+++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - google,gs101-spi
           - samsung,s3c2443-spi # for S3C2443, S3C2416 and S3C2450
           - samsung,s3c6410-spi
           - samsung,s5pv210-spi # for S5PV210 and S5PC110
-- 
2.43.0.594.gd9cf4e227d-goog

