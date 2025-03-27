Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B16C2F2A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Mar 2025 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743080072; cv=none; b=AUx2O4glmBdmMvw5IinDk1qlp4Nk8p8QNHwKmFoTjeYkA6N8L7tVWPEPjDGIVc7U9DxcsQu7HpSNwheWrSXMGivs8435mXyaODPFOM/8NYfJlRgfirp1uxO69NVDmfgOqZzv1peGx6YOEYFKwYcgHwFkTeJ9/9VvJNlsDKlH1Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743080072; c=relaxed/simple;
	bh=ychP7TGSX/2wGk0uS2WMYhYRS2eiEVwJPcEBtkIB0sU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HeXe8v2GCaOBK9nCl8bmJIcTmSSQg8KNMZkOej5mhv9TBUy57yFPRekOW8UmOQts4Cx2oDm583Jh077DdbXIfyNUQPGqiqEt7Brk01YTH/N9Q0G6IEDSNyeNAPnXlLHrEQ5mzR1eI5bQcqNju4rtOLvqA3fzOQFHPVzBDlyXmfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uP+YcO9b; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uP+YcO9b"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so1559030a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Mar 2025 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743080069; x=1743684869; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EkkCTZBIAWTTIL0zgzo8V5WU2QfnJ7YXlyAxklDZZHE=;
        b=uP+YcO9bofeanEsNF+LkFj6+L3KrR699Du1eNDtscnJ0BwssGbfVJM7c/4PS1TbxWO
         CHU5XKcbYMohu+Q4Vp+bSXst/fSZ3w2GPc6mJTCxEktyv7L2ym7xXK8jpvw1dPI25y0m
         S6POIIk7UXuBoobuWOXoObP8Ys2C4FI+RzdM2/4fMVB2RQt8gOJPlTSlzQn9mpTkrFx/
         YAp0lqIJFtuECcDJzrXuBcO6MkJEW9ZimolFO9FTQksGrkufKuBYYVAz4P4iOPjD6svX
         3MXFoZb881/6/mKZ0I8TWMg11gdSvHEhRbbmFaAqki7CqYVvToEPOOZAT009x+fZBEFh
         Jb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080069; x=1743684869;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkkCTZBIAWTTIL0zgzo8V5WU2QfnJ7YXlyAxklDZZHE=;
        b=jacmG9RXlP0PhRCiO6yh4oK1B8C9qMK8OsJELocohlTpMjc0r1VXF+k5ZlJq6/s6nz
         gdMZExPaTa5l7nF5c9sGJPNohxz/u+zDSGna2rA8TBajisv9fVRLtw/nrP9CQjPfgjGO
         hL038dV/SE6qNdruz66WflRcEUIx89E5xfbj1duHBGyrxM7W0csiuma2XYuK7SB55wb7
         vwnft2jpx+qA6ru955Vd3yTmpTXneJtUa0DZNKcxXBzmELjTkMp2f3/1IlKZMngPWNrN
         7Urx0E5X02OSNiOTwOp6XvMn9Wkg/DG9itWsFs3PgMLItSm9nSBvyQGiY15LOY80yNtU
         3VDA==
X-Forwarded-Encrypted: i=1; AJvYcCVA46sJf+WE8VJg2ZIhUEduInZhzhrxR2KRaoMj3JDVW0iquZNB9LgtHsRK/SeqekTZIVy4v8vCgyxpbPnSfkkAwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhObdm4RaBZ7F7TPkX+ZmGXytNtX31KubFISIrt2GrPVnlv2I0
	7QaRKXXwO4BZ9McMfBb3qeRVQaseJZlW41U+aRIQ3aInVbdT9jRRGG5qhjDX6DA=
X-Gm-Gg: ASbGnctctM4DtmwCO5ReDgw0mO8GG0wqshFB9t4b7DqSwXnkPBYBRjyZCA22mQ/BPFY
	s/AKEsw7SFJ0UlwaA96LvSub9TP3VoijMy72OQvrHMoaPHPZD2eqn7MtCH5+Qum2v+9zufisWbW
	VT+nf/r6q+oNL3tincxtMdnrLVUUqTX1m1gleCqmL5tqURiFaSnZQD19JI2yXNpZ0lqjAUvGO+7
	z8ziulVO6tJFA1rtUEa6n4kY0zn22z9IEdFZ0bZFkBNYNaQ2EXqHn53ZTrT+aAdHahzCacNwXOZ
	TJgL32i32jrDoi8dNYh92pQBZfsz5qwwtc2hUjXlwwL3ev1b+TVlEH3RsWs1jkkk7D1kRpFxOnf
	0ppycE9jkKw3A7zdvLW2sZpVbtT5V
X-Google-Smtp-Source: AGHT+IEVuF11DqXI4fu8QPcna7hms3onAO1YAcy+0T0YnqsvYmZH1rxVRZNLDer4YXPTGOn0rM72Vg==
X-Received: by 2002:a17:907:940e:b0:ac1:e6bd:a568 with SMTP id a640c23a62f3a-ac6fb142aacmr283746566b.37.1743080068712;
        Thu, 27 Mar 2025 05:54:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd47e9dsm1205410266b.167.2025.03.27.05.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:54:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/2] firmware: exynos-acpm: clients (PMIC, clocks, etc.)
 will become children
Date: Thu, 27 Mar 2025 12:54:26 +0000
Message-Id: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIJK5WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyNz3cTkglzd5IzMnJSi1Dxdc4Pk1CQDQ2OLFDNjJaCegqLUtMwKsHn
 RsbW1AGvVOHpfAAAA
X-Change-ID: 20250327-acpm-children-70ceb0138d63
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

ACPM clients (PMIC, clocks, etc.) will be modeled as children of the
ACPM interface.

This necessitates two changes in this driver:
* child platform_devices from device tree need to be populated here
* child drivers will need to be able to get the ACPM handle via a
  struct device_node, not via a DT property name

This series implements these changes and is a prerequisite for v2 of
https://lore.kernel.org/all/20250323-s2mpg10-v1-0-d08943702707@linaro.org/

--- dependency note ---

To apply cleanly, patch 2 must be applied after
https://lore.kernel.org/all/20250319-acpm-fixes-v2-2-ac2c1bcf322b@linaro.org/
due to touching similar areas of the code.

I can merge that and this series into one if that is preferred instead,
please let me know if so.

--- dependency note end ---

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (1):
      firmware: exynos-acpm: introduce devm_acpm_get_by_node()

Tudor Ambarus (1):
      firmware: exynos-acpm: populate devices from device tree data

 drivers/firmware/samsung/exynos-acpm.c             | 25 +++++++++-------------
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++++--
 2 files changed, 14 insertions(+), 17 deletions(-)
---
base-commit: cc024fd4c6640be5e2e0989cc98f2c68e31289d5
change-id: 20250327-acpm-children-70ceb0138d63

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

