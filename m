Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32955131E2D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2024 15:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647859; cv=none; b=EsbBnClXktYMis5vBOwVnj6whThn4UFULQiDt09gfUySMD3PL1/ktK0xmEegUrJBHkhwvo3Y8ubGp7Lzz42lMAz6Ljn5N9makGn2tpMWe+Hk5k5v2PUPxt0Kp2+ONuFjnXNmMiseqf19GULUUhWYinb7P5G6xul2FQJSjyNGhzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647859; c=relaxed/simple;
	bh=iH0p1V4eqat+M+Ev3ANGFPe7vqJ4jJ5CZXeTzvo7Cdg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GAKKlLvXmTvQUQQ1Z6PvZ91eh5EwT6uFnwm2Cv2mJNzN5W4GuFIJRYnTeQV1kmaGQ1OuqvNLp8Nm5Xt7+pUev43mmk821CK41C/Yt2wwmbdEwROYKn4F0DsMfPk3zkr/iXC9ljiPiS4uwrbtxzYyfvOwtmVCA5MT1Fme4LsxLLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H5N63MMX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H5N63MMX"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso49972605e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2024 08:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723647856; x=1724252656; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9XvQrRhyjQYZnQbMs3EjboskCKHEKhPSKVqnPioFGZ4=;
        b=H5N63MMXysNxuQII24p1ekBVXN5EGMX5OKt3hrNtOcoI0rgAa7MiOB+J85rWk1tYrV
         6rkvXHDLoOpP24TZ96Dugk66FJl4EjCSwtTGFHW6EEeSNlM0EYxaj+Swy800rNDIIFf9
         3bf5IQ4KdIuTG+4PJdTaVW2dF6Q4h64N1rWGoBG6JO4sDF2rojkEGUtpWB8sqCHwL/yB
         EC6GlySnNLiYuQ+rstGx9azYDkmysc4+vSQxloh/HQsrHjSvQon4aXVCHGcl4pUZrT0Z
         8yeft0Epsy/CpdXrcroqtwnX85V2mbN5YIjO5/dx7rHoVbacjr+rwXvPFppGTbEI3Ook
         916w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647856; x=1724252656;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XvQrRhyjQYZnQbMs3EjboskCKHEKhPSKVqnPioFGZ4=;
        b=v5sywkZSdL00vIWHZ4JA/3bgfKhIjTNfd5lwVjNNGtwEepJ3JYiHkTmGhvazYYxwje
         ahy2vero3EcNhGvkNffz5z0FBLY44XSEbEC+pC04MQRnx4dg9Qm3wEzjeM9HxidfrzUO
         dRE/Klp+axKE/tPz5jKha3QEehSuuBVptlRaI7xWQzFWWNye+XRZ4q+w+fmA8HvtF0t0
         KaaGEd1KwWKXXRL8xWAZ8jIAdZPIifk5nXF3xghsEZdBRxgd2gcLjl1LhjU/1dhTklvo
         f5PNPqXA26x4XrMtIb9soFFeg8TU7eG7385gCrW74gLTs8e1LHB55IW3HM0AFmogbARn
         LApg==
X-Forwarded-Encrypted: i=1; AJvYcCU36B/cvl0xv7EHm7IlpnveiqrKWVumJ3/HicueI03OQ2lixDEde2zm4XoEy1DZqgWIppNkEeTzMwwG1KYfRGv1Z3qTr3lb91poqgx3cgP/Cc8=
X-Gm-Message-State: AOJu0YyPBrQ/bW82j7JrmVn9VzaDi90PelQ2Y02vCRP/8t1rbjJJ2ZzN
	cTkzneTQeqOY34lGGGMk/2wFvMl4DbA6f1kMxyT98r7wTzRXgtAoxRacwnseRzU=
X-Google-Smtp-Source: AGHT+IHmH/lZvjGcJ8hd1XXOkhepYdrTq38ZINMbfl6cgbN+vgIZhEXaS4U/b6MJaA+KEgX05jhvHQ==
X-Received: by 2002:a05:600c:1f96:b0:426:6308:e2f0 with SMTP id 5b1f17b1804b1-429dd25f8f2mr20826075e9.26.1723647856256;
        Wed, 14 Aug 2024 08:04:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7cfbasm22313425e9.45.2024.08.14.08.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 08:04:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/7] regulator: Use scoped device node handling to simplify
 error paths
Date: Wed, 14 Aug 2024 17:04:04 +0200
Message-Id: <20240814-cleanup-h-of-node-put-regulator-v1-0-87151088b883@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTHvGYC/x2NWwqAIBAArxL73YK9QLpK9CG51kKorBmBdPekz
 4FhpkAiYUowNwWEbk4cfIWubWA7jN8J2VaGXvWj0t2I20nG54gHBoc+WMKYLxTa82muIKiVddX
 UgxsmqJUo5Pj5D8v6vh9oAOq5cQAAAA==
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1380;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=iH0p1V4eqat+M+Ev3ANGFPe7vqJ4jJ5CZXeTzvo7Cdg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvMdmd+tmcteMBql83WlVuhACQS93WzBw8oMPj
 AV6xtrkFf2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrzHZgAKCRDBN2bmhouD
 19bKD/93motsO9ftIadx261e7kNMivGz4JoHeOh1m5TRM7Kk6m2sJE4pXZaOgkXsJik6Et7Mvqd
 AZKA7lclS4PrvpzTrvDVPcEIv9Y7vgKxlnvLV1oQp2SCplhK0dn0PIbS760UMl5gYv/TvNCKJUe
 O6qbI6MF9qwoz46qgn47zFpPPV/muo0s8I1qB4IBENZLcRF390zBtn6WjoyRSrMJp7h/DT3aM5y
 0hbqZCCtooU5IUPtLkRMPdSmgVhGTXzKfOoczB8oLsz7yrXW9ULE4e7rIr/PwCBsSG6WjQ7kgjV
 /V969nWY2hikvDHOv0hLD2RikD/HJU2umVC7z33f/SDy5XlgmnnrsXEscpSFzCo5LYFf8Qe1job
 v+RVCRExOdKbzAXiTNSHV/MZvKXoU24q3WxKT48raQlIvAaOX17J9u1dhptMjPeLlOuFqeb9hbd
 aGSg1+pkfVLP2d10TNhfFQFJ45KPV2DO4xj6ZXtRU7w9urnXFEcjWSgI64Tq94KhDdbqI2lEOTL
 /8+sMrdz6drAVAqYe/kIrh1LL51aZFtnYzU+qlgC0Z6/mlfncaBfiu+wgVnob4ae59v98IPm9xa
 fvoHAh6/EfiZ2cfLC1dhp7BKY9HzIse8L7Ia4UmDQz301tRpQbTAOmGvLcGTquOqoO4WrDHcfJw
 Qx63gwZEjZZsuwg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Make code a bit smaller/simpler, with less of_node_put() thanks to
cleanup.h.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      regulator: bd718x7: Use scoped device node handling to simplify error paths
      regulator: bd96801: Use scoped device node handling to simplify error paths
      regulator: max8997: Use scoped device node handling to simplify error paths
      regulator: s5m8767: Use scoped device node handling to simplify error paths
      regulator: qcom-rpmh: Simplify with scoped for each OF child loop
      regulator: qcom-smd: Simplify with scoped for each OF child loop
      regulator: scmi: Simplify with scoped for each OF child loop

 drivers/regulator/bd718x7-regulator.c   | 19 ++++++-------------
 drivers/regulator/bd96801-regulator.c   | 17 ++++++-----------
 drivers/regulator/max8997-regulator.c   | 11 +++++------
 drivers/regulator/qcom-rpmh-regulator.c | 11 +++--------
 drivers/regulator/qcom_smd-regulator.c  | 11 +++--------
 drivers/regulator/s5m8767.c             | 17 ++++++-----------
 drivers/regulator/scmi-regulator.c      |  8 +++-----
 7 files changed, 32 insertions(+), 62 deletions(-)
---
base-commit: 7b3754ef5d53bb1431e25f65126280993c2e640b
change-id: 20240814-cleanup-h-of-node-put-regulator-80df40883f35

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

