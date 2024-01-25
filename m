Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EFB1369
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 01:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706146547; cv=none; b=JwiSanivntXQvxRB07wg6Tb4NMHvgio/22IjBIvaJg8jkxxyoxWsvVmlsiXium+XA7Y7NEYMKws5DYgq1GzIr7DvldsPhKBv4WzmRG9/T7JoS5H2+1ADN/brvX/SxyyS55axbKtT35dRT99jiPBteeeG0eTH8/O4QKcgKJKQqNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706146547; c=relaxed/simple;
	bh=gvS9OR872hMLDwjbJt9LD4SXHkhJWBAYwtl2RkaXhw0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=crK81RmSHWhB/ivobdwidMwbasYMxYL808D9XjYcvDw7BHbC6hMffKU3Uz9+bCGxd+BXtGvMU2aqwj4Jift6zTxKMl7KKxg4CetIstPn0Nm32mbwEfA0DzzZVWjGmIk4fmCxuUc4ulWGfyp9uSuVYirY/QFZIRQbn67n8ccZs9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DyVLwgf4; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DyVLwgf4"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-20536d5c5c7so3622333fac.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jan 2024 17:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706146545; x=1706751345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrTPIRFEFJl4D6usMUg96I/YEqaZ4s0DmE7WQLKQltI=;
        b=DyVLwgf4SMZKgX/HuWJm6AONwqK7BQUHZd2HZkW8dipo+ACRGZfRTofRCbttgFyJYF
         sLDRl4HEXbFYlTxlmtDN1NpB0+vVGSxDTA7rpKX5xkuvnH8bBuK2zySvaH5IMKeJcofu
         k2vvr8oThswxENpHeKvnyfRYVjUMzGi02/VCLMqHHCojSGOBeF7z/O5xD7Go9JmzGmbu
         2s6HbwFUYkBgNvJ3DJNb3kD2ZDL2imgOMRtjNx9gmUR97Y39kpM9uasx7NXz7gdfZeI9
         Zg6JNGN+faJAY11MveOtv+r4c0zZYieCE4JwwSJHQ+IZAqfP0ypeeNd31s0zJNPeMUii
         WieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706146545; x=1706751345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrTPIRFEFJl4D6usMUg96I/YEqaZ4s0DmE7WQLKQltI=;
        b=FLYDTqvVu4bIsrfPkeuZuLJOub8IRUELSegKzuj77Q7NpHpebb7qKC8vx9Y19/LJmg
         Tz5aSpswPYFPR9q+cXyX7KWlfgT9/28zslZDrWrRBU6gxkO7tCpBuferxQsNl1HpEWla
         SE7JIqR41BWdSzK+ufE3gc+uzCZn+E0bpk0MRzz6ZxCJ26GDhm8QE7OhDmY2FSewcwPm
         F53lbokC9dLIfIoDGCHr4O4jxdlZX0EfzX3Q7aiAD40Pk0CYuXRfRiE06pZXUOq1gGBu
         smRnVppTSmofMGSByu4BcbjtqWqsS7BIwUoYbNSlUJfXRYmDFYuofT7oelnGEsRC2buJ
         SPXw==
X-Gm-Message-State: AOJu0YykqLawsHZBB8K98HtDk6E/Bd0H84MPjwNP9r6p9OYAcFciV0ED
	JVd0VNMBN5iaWQ8oY1az4JP224uXR/oVh1cTeNDFrYGM5SCCVJWB0f2hZfFExXA=
X-Google-Smtp-Source: AGHT+IF3NwE0mZ28Ss+0PVwv8nCKU3mV6Ff3m1ZDji1UuD5XHmoV+07SSc21F/vfqXbluZjjyIrAbA==
X-Received: by 2002:a05:6870:817:b0:210:d5a5:7d37 with SMTP id fw23-20020a056870081700b00210d5a57d37mr190367oab.22.1706146545100;
        Wed, 24 Jan 2024 17:35:45 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id xa13-20020a0568707f0d00b00210d8274204sm2999081oab.23.2024.01.24.17.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 17:35:44 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] spi: dt-bindings: samsung: Add Exynos850 SPI
Date: Wed, 24 Jan 2024 19:35:42 -0600
Message-Id: <20240125013543.31067-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240125013543.31067-1-semen.protsenko@linaro.org>
References: <20240125013543.31067-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document samsung,exynos850-spi compatible which will be used on
Exynos850 SoC. Exynos850 doesn't have ioclk, so only two clocks are
needed (bus clock and functional SPI clock).

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v2:
  - Collected R-b tags
  - Changed bindings patch title to "spi: dt-bindings: ..."

 Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
index 79da99ca0e53..f71099852653 100644
--- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
+++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
@@ -22,6 +22,7 @@ properties:
           - samsung,s5pv210-spi # for S5PV210 and S5PC110
           - samsung,exynos4210-spi
           - samsung,exynos5433-spi
+          - samsung,exynos850-spi
           - samsung,exynosautov9-spi
           - tesla,fsd-spi
       - const: samsung,exynos7-spi
-- 
2.39.2

