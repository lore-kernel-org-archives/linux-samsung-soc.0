Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1114F25CC68
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Mar 2025 21:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211047; cv=none; b=tioWvT4O/tiHaj7aOr5eEwNluC2N6buRKkupPDcjNKqqGBSKjMDJLC132yR8ykOSCOkyIv4pBWyl+PvFueacUvv3Y4rrsnds3W3s9p4BjrsIcpQ2+K64ZEo4bhW5GRDjI481yuw5XyCIapD0DcZm9ThWzyNSrf9ihooUybBoSNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211047; c=relaxed/simple;
	bh=k2uk7mWRxQ/F2xpJkIMGDONFAxPuJRwjbtFcXicz32s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GijE7EbkEkS0dlj4Pw2czfqpbrpDsAvUQUl9IEw/UDtvtdinMGiNeoUY7UvWUItQnVfcQVXnMO4EUJTd61rxlYbL2N4a0k9Mfzek6+UbQpQ8q5tfllzeMdsgF3DKLXFs8uSB1vJwFvue26dRe6uLUOqvR5ckOlzHgEHLFzKrLf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KFB8sQpD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KFB8sQpD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43bd750d27dso947455e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2025 13:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211044; x=1741815844; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dx/4ooZvaFT+M8KdTIK1XiMnsARRScY2O0ollC2/tl4=;
        b=KFB8sQpD5RbIicQUOEzeF0L2nWkuUCSJQhD1+rv4dje2qacy1+gWc952bcaluQObmV
         x0kQzNqHaqG/dO/nMz8uq1Rf83w5iPo3O2GneCntT68X4USNnbcIKHT1y3w7kbLdPeZ+
         V0Nz84t536ljD5gSU8RQZRkmPvgjUXsRBRFe9HNoJr1gZd5qhczcKYNC+HZknFNNCKVb
         4yJN0mv7QTNr7JzUmp2NhubT4Vk7ebbFnbSunuJI5/6lZLAe45PoPhbqmvCQAy0WATFy
         8brB0yRpxM31545cuZYWcPDH615yY/QmDFQfUL/Nfhn6FYnFKh9OZX886BngOfFGaGNk
         XiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211044; x=1741815844;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dx/4ooZvaFT+M8KdTIK1XiMnsARRScY2O0ollC2/tl4=;
        b=r6LrzZLOccxLMoShaSqC4Y5PMyO9WeniCK7Gov8EWI/33vdozne6+GNyQZ0ZSSkwY+
         vt7sxjI0tCLwqRdpVVow8pHo3tkiGye7fk8afv+YNZBrS9bWVPivk0r0VSWU0CquPbj+
         OsxDGZ3V/Qdy23R+pzmlOTYk7ZnwzYKs09CS5rfO3olnpW36qFzXqhe16tCinyjFNV9m
         ciu0oW8ljNaFc2BqAo7exegu6HsdvSAxKW3Vh+KZQ5P46b5E0l2zFl6Du0iKZb9IMr6k
         zEAkrXAnT+KZ4CjKeXZMjqi8FVMFFP9WdOnnJbfgjPzugozkMyugxEsGJNdi7z5HreMf
         HbYQ==
X-Gm-Message-State: AOJu0Yx2F5q7G1zek3xfz4LgxUn6G7lfzns5oBoSpPgYoK7j/r+AQ4uk
	9e5coipzCqyrJVXnzuMLa8GgAPC++Vo/jq4xIfDtVYGorAW6AEMR1D3NnPKRbu8=
X-Gm-Gg: ASbGncsNO0PG/NOBeDUVChI5QJRzyX/PrQialgZuS2Jss9+Nz8NbJNN02oqyMh0xv8t
	eb6T4Ebl2XnaBo2+vkNJj83q7L7hKmmx81e6dJrJMnsYBTnsrxAOAyb4c1PkiBtXb59h9tXKw/c
	ZDCbLBIKD+foPVMLsXKDcWbHRdCzrTPmHZQjop0PzfNoZngCwDWpof2oaQgSWBuPntsCGaeKTpv
	3rDa8ZeJlL/X2pH0QxNeuZKRT2JoN9dksIpewH+HRdGKg6KcmWrvnUyj9bIra1Q24s9srFrlctj
	KiYbniS6bDfstUopVvuYr2kIogtFWX3gxQADo22Olf4HkDzO8/47AmqtmCno
X-Google-Smtp-Source: AGHT+IHgrPk9LjMSTCWkz+mX87OREQ24VNtJT8cUEPQ3oCYGUFwwbcrSWBYFeLv2csIBnT9oc+2Bmg==
X-Received: by 2002:a05:600c:3b17:b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-43bd289418amr16472395e9.0.1741211044238;
        Wed, 05 Mar 2025 13:44:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC/RFT 00/12] clk: samsung: Use platform_driver_probe() to
 avoid __refdata
Date: Wed, 05 Mar 2025 22:43:35 +0100
Message-Id: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIfFyGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwNT3eScbN3ixNzi0rx03aLUNN3MvMwS3ZTEkkRdsySj5BQjEyMTA8s
 0JaD+AqB0ZgXY7GilIDdn/SC3EKXY2loAauT3JnQAAAA=
X-Change-ID: 20250305-clk-samsung-ref-init-data-6b2cd242409f
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2492;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=k2uk7mWRxQ/F2xpJkIMGDONFAxPuJRwjbtFcXicz32s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWW+Fg63DDLT5RU0aIcpUZH7IqA1fov1XeLz
 +W3BI3/CAuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFlgAKCRDBN2bmhouD
 15JiD/9nXCHXFQUw697F9/fNVIrPcbtmW5NHXZFybOF4f2dai/whUloBo4qQReli/BYWu3nCW7X
 rpBoYsgwNFjhePzvOR1spoSH5lZFLjpsd5v3kzU2iK1UwSRQJ5kY9yb9zt7nS73XjVVl7QUMrgy
 6X7hTB+6H6Rbl5AM97J49zzn6VF9i7E+DjDk2MecDc3BVeV+oQICWwdGPR76byLR7ElchPtm4HP
 cRiGElNBl+kov5YgrVHo3zB0cypidtk+kc8Myayjt1ae+iMqkBcpQslPyI459B7zctZF+GTtRBW
 e8D4wiDCB6Oxw/4E/WgMzLzVfTYf2Ha7wPLB2OkbVw15JrxDjrImnQD5ZPLTGI5clZq73IDilhT
 77E/+r6D7xhgfQuG6m4/oFQwxP/If3XSGO3th+jecGiMfOcb0ykFi2FeoSFU4gPLrXTQmGvKXQP
 gBLPzgEx3O+G1aXks1/uR01nM6YG/fmD/VBHNXmb/aQo0w0YA1L7Psyd5ROWmzJRd22WT3Jdkoz
 IW+fiwz22v9mbsrPAvrX5Kbpd5knN14KOGJZdsgYZXh8SeVGbqpEhaVRl6gfdRwoRCL9o5Kx9ni
 KUc+YqMmu4PFtWAHdaN0FIjNdmzgRf23DUFuAVd09qgz79Fyk5+Rmo9y7dsHehd7qmhCTsit58p
 kCPSQM+VzxaGNFg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

RFT/RFC because testing needed. I tried to do the same on exynos5-subcmu
and it caused weird oopses which even KASAN did not narrow. Probably
because of multiple exynos5-subcmu devices?

Switch registering platform driver to platform_driver_probe(), so the
'struct platform_driver' can be properly discarded after init and there
won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.

The change requires using subsys_initcall instead of core_initcall,
because no device drivers would bound in the latter, as required by
platform_driver_probe().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (12):
      clk: samsung: exynos2200: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos4412-isp: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos5433: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos7870: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos7885: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos850: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos8895: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynos990: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynosautov9: Use platform_driver_probe() to avoid __refdata
      clk: samsung: exynosautov920: Use platform_driver_probe() to avoid __refdata
      clk: samsung: fsd: Use platform_driver_probe() to avoid __refdata
      clk: samsung: gs101: Use platform_driver_probe() to avoid __refdata

 drivers/clk/samsung/clk-exynos2200.c     | 7 +++----
 drivers/clk/samsung/clk-exynos4412-isp.c | 7 +++----
 drivers/clk/samsung/clk-exynos5433.c     | 7 +++----
 drivers/clk/samsung/clk-exynos7870.c     | 7 +++----
 drivers/clk/samsung/clk-exynos7885.c     | 7 +++----
 drivers/clk/samsung/clk-exynos850.c      | 7 +++----
 drivers/clk/samsung/clk-exynos8895.c     | 7 +++----
 drivers/clk/samsung/clk-exynos990.c      | 7 +++----
 drivers/clk/samsung/clk-exynosautov9.c   | 5 ++---
 drivers/clk/samsung/clk-exynosautov920.c | 7 +++----
 drivers/clk/samsung/clk-fsd.c            | 7 +++----
 drivers/clk/samsung/clk-gs101.c          | 7 +++----
 12 files changed, 35 insertions(+), 47 deletions(-)
---
base-commit: 7ec162622e66a4ff886f8f28712ea1b13069e1aa
change-id: 20250305-clk-samsung-ref-init-data-6b2cd242409f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

