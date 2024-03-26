Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4B5468E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711449386; cv=none; b=aUii2Pqbq2nhsUVdRcTEnRgUKaJ7rd0VQHpmj4LZRs9F17LVKKcH3T1exaljCI/gcQQIb5J/t27RvPJVLp4FGFWoDOlQDehSZGjXRFKGVKOxja/PhwIJi3TYCSa8z4AUVF8ZzPvcjYiR0btPvLIlKaQUdtyKCRdqfnwjjPHYvJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711449386; c=relaxed/simple;
	bh=xQX9vjjhHlhpIG6Oqh4n+jDkazu37I7c7NJ4aCM4BSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tP+eQELqs6Prnl2NCHRA7yxuXypM4T3wsnxDxJdhW+UxxsgIq9D7c9T13sphr4OC3iMBROaAuVcHiQ4cD6wTRRqD8avrf87B6ot3MkBJvs1URl0J2x2Yyja+qMDj6RYkiq2+zpJ8DIBlEF9xa8N4BZo1f8c02+Enz7F9+ybEnt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L+/8JeGG; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L+/8JeGG"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-34100f4f9a2so3199214f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711449383; x=1712054183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8cq4cJeCYZBITVK41CQ5JeNyS7iUkkN8uZMCoe8yIaQ=;
        b=L+/8JeGGLeq/aq3gTgECaXKLXE8j8QkcuPT0KsaGfGJ5SR3OlvACMqpthNV/R6mC49
         a4Qx8fTyqO8JwlrtRtxaT6I/U8keaCeRfjHou/oucfiLLP9QoCByqcTnRhldjiCC/cWk
         0C3zVH9IEoT8Eh990JvVqzXQfSFUUvfwd587MnakO67ppt5iymSwdWGJKAUwbVicmypk
         MedxVPRjpNYPlHc08QPBzzinRNYua6ncsosEV0+idYFDNeszanBwCXrfus18EBW4PBM0
         AkDl4yyX7Ar1D4wixTFyhiheYcTSzDQSjW7UC9Wqy1QALhB8MmpqiTo44B4L2LomzniL
         K7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711449383; x=1712054183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cq4cJeCYZBITVK41CQ5JeNyS7iUkkN8uZMCoe8yIaQ=;
        b=V6ENVrCUv2x+gHr8e4GG69JlPYa3enLc6wc9biO396g3pHFBHJDWAd6qpz8+tnGP4H
         byT/B1mc6jpQjSOetrvMc8z9IWYGWSnwa+7Nf9G3R82j999ScHEeI08hazbKEfgDwjdf
         QUoirv4zP5r5jvNA+y3K9+gQ9wWmExySmPMqKCEiJI/tf5O1daoRNkm/9NvKhpyVffl7
         CTv8ovYa73rPfEjUYmScMfGOSkd1F0MTDtOwiMjJuIcbtsF2lPU/p0Yu6p8WsbSNJw97
         CggLKkQe18vw2YNi6gASPwnOB1/7Mi0MU09wC9sGRIV6LlGQ1YIIK6zfGvNWH4pA/W0M
         PzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzQsnDL4Emxb9YXq3VWsqFq2+zziutX2PZGp4Xy811BuPc9ZKh3WoBP4z2bs6b++0gNTTlBZonfCGEScrH9/WNyeUaQ5zwsYFuq8eycLz5AhI=
X-Gm-Message-State: AOJu0YwDC5E7EB5CKyszUJL7wafZxu5JVyqVBZ6ojIdIprvx7lVAxk5V
	H1XS4IEUPUUb/ggCiEf48xqjTVYCyCuvVwJqi3PODYMvTxzWYRBEm7v67SvUh5I=
X-Google-Smtp-Source: AGHT+IEQC6F62RP1GVxuaRRJ9iwSF/Nxno04fOCkJFrqlroTRqSWmDZp5Wxx5aVj11C+UY5lPZ9ozw==
X-Received: by 2002:a5d:648e:0:b0:341:cf9c:1c43 with SMTP id o14-20020a5d648e000000b00341cf9c1c43mr3595786wri.43.1711449383327;
        Tue, 26 Mar 2024 03:36:23 -0700 (PDT)
Received: from ta2.c.googlers.com.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id bn22-20020a056000061600b00341d2604a35sm3337954wrb.98.2024.03.26.03.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 03:36:22 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/4] arm64: dts: exynos: gs101: define all PERIC USI nodes
Date: Tue, 26 Mar 2024 10:36:16 +0000
Message-ID: <20240326103620.298298-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

The series starts with some cleanup/cosmetics patches, then defines all
the PERIC USI nodes.

v2:
- reverse pinctrl-* lines, first pinctrl-0 then pinctrl-names
- move the pinctrl-* properties after clocks so that we keep alphabetic
  order
- join lines close to 80 chars
- use alphabetic order for the standard/common properties:
  address/size-cells, clocks, interrupts, pinctrl
- collect R-b tags

v1:
- https://lore.kernel.org/linux-samsung-soc/20240307135248.162752-1-tudor.ambarus@linaro.org/
- https://lore.kernel.org/linux-samsung-soc/20240307135912.163996-1-tudor.ambarus@linaro.org/

Tudor Ambarus (4):
  arm64: dts: exynos: gs101: move serial_0 pinctrl-0/names to dtsi
  arm64: dts: exynos: gs101: order pinctrl-* props alphabetically
  arm64: dts: exynos: gs101: join lines close to 80 chars
  arm64: dts: exynos: gs101: define all PERIC USI nodes

 .../boot/dts/exynos/google/gs101-oriole.dts   |   2 -
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  | 791 +++++++++++++++++-
 2 files changed, 779 insertions(+), 14 deletions(-)

-- 
2.44.0.396.g6e790dbe36-goog

