Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04891C5F1B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694081; cv=none; b=pWCdYq8raKJlgZy6owhaMrnLy5C6unqgRd/Qnb4lvEL1e++Ic9MlksPfpJkHIF7dSE37LVH92nffq0AcGMNKVj5DvIeDBryxPbdbt3ABSOS23uFAB5j+Al7SxG2JxEl7UDMkCpJBf98A8vLzlOYF0rQxU0FiUa9soIsjA6bunXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694081; c=relaxed/simple;
	bh=LW9NlVQ1ZU8KJiqYxsvxHLTdhOAcCb8IC1f+fzi3wEs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vCRYmfG9LfiPpfEHZB7tr4XktQaG60Z6eXl+1XtKmgNLUYQ6ffdIMgYDtC+tQy29+sIHWZ2MqL9NmDTDaRZBsLZzb665yLjwKfWT6+4lttyfGuvQY0zISbOd5NzmYIvvezww2FQVVRQH6mJJAJvRQpoXQPjejLE4Ak2WxitcWnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oXx5tpzD; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oXx5tpzD"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so3238938a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 03:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734694078; x=1735298878; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPnFnnIbk1GG60/+MNJYGRtUv6D7I7cGesD5TPc/BLc=;
        b=oXx5tpzDNeers9c36bmjF4PqNIqWV5AEYjfuHoe1rn+FVWpDFlfyb6NfzTTTQxn25u
         IsW/H+PUFKs4KWonMiMLI2TTcXPt9Lo02lW6NWXYf1bHtMo/eTbjseW8N/o7cq4SBnAp
         M3lfdsU869nDgzHMfMzg1lQEY5LCOY9JhesPWsQB5UE71iZqgc7QFrEsat4rYICxn+tR
         /x7baDihng3x7zjWWVfHbkDe8vMzhjxzrHjh5jAG8f6SYSl34hPz0uGLgyz3mPo0HHeD
         HVaCL9TKu+KPCeNNuycZi5j5OuHVUYJA6OzGR2eWcLh4G+zCB4W5+gTm5uClJMTizQcS
         vgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734694078; x=1735298878;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPnFnnIbk1GG60/+MNJYGRtUv6D7I7cGesD5TPc/BLc=;
        b=YS+Nude2YsamoJn7eQnOl3R4CKh6VgZhD/aIsECG9JTRSUl6psqt2PnxqQr80Z8V7r
         qbbnxM+mBZ9qmAY0Wc4M6eJtwYCLWJgoE4NmusCl5Jhh/qIent8yja5bglGrSolYYGZn
         VhWQPZQA/bgU0gj5iVHTpaFuvAeCw1jJlVAZI8VpSS4O9IXCXQhWdULW9Xxz9VDEpU6P
         d7GYhkSmN21grM7weYiMFiER1KOj2Zynb7YkSeqtS6/sLLdSIYQbnzme19z2UiABFUhY
         V7FK/dcQk8LZs8ioxHm+dz2K/y9T2jujHBw3+Zaqus7PU/DxkqXHxPrUaEEHbl1gSR/o
         dxwg==
X-Forwarded-Encrypted: i=1; AJvYcCW1r9jWD6Q5JwUMqatgJ/hEc49/fnKi5TCS2L4X5XN5Rpkt4USl5l1zMZ1I5+cJdczM7Yyfz1ZrcGP/T/YnPfQXlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz88A5waUl1DEiuUsC23zo3s4pqBUcMhrJq2JXpih6DK5IQmqk+
	jKTCdsbF8oOcbxQHI2GRyFOirrjYBgonKEHJ7Exkn3wRLHIIxJO2lZr1h4SgR5c=
X-Gm-Gg: ASbGncuVFcFXRkte9zsVlTfiGTUXG0UhfxMoo6YHoW7ZblBcDKZvsqXpIIcB23hqucI
	4t/dYHDXkZpPXb3mBZLxKXAiEGKlzKJ1HTfzh58DlWjMRm9McH1C+OImsHMnTJuvYEKZR3ZnLh8
	T2r66vlFEUwkvVrQbn7EvRMvHto3UeesYg72/1mBMiMLWG22gN25rcnLw5HVU4hEvMxqa2jNemU
	jtwArarXCan0k9tvURTqqT+uGiIZGQUJZmO5JFrn8V04CAHT/s6ifet6ELH5tvzkRNIeJ/vXrob
	KFDqhHQGYvHN5OvvwEskkzwewEvQAE3z4CZoVlKQ
X-Google-Smtp-Source: AGHT+IFCw5/PULuUVcI3llc0y1a6yuLGG1HzrWtHK+9OOBjslUtrFHMO2qLGPE6HaWlamqpm+rB8Qg==
X-Received: by 2002:a05:6402:501b:b0:5d0:efaf:fb73 with SMTP id 4fb4d7f45d1cf-5d81ddc3ca4mr1883854a12.15.1734694077983;
        Fri, 20 Dec 2024 03:27:57 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701abd1sm1632634a12.76.2024.12.20.03.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 03:27:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/3] Google Pixel 6 Pro support
Date: Fri, 20 Dec 2024 11:27:23 +0000
Message-Id: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJtUZWcC/3XMQQrCMBCF4auUWRvJRLHBlfeQLmIyTQdqUzISl
 JK7G7t3+T943wZCmUng2m2QqbBwWlqYQwd+ckskxaE1GG3OaPCioqBGJfxcZxofyjpHVpveUui
 hndZMI7938D60nlheKX92v+Bv/UsVVFpZ711Ae9LG4m3mxeV0TDnCUGv9AlSb5nWtAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Hi,

This series enables support for Google Pixel 6 Pro.

Since Pixel 6 and Pixel 6 Pro use a different resolution display, we
now need to add explicit support for it, we can not piggyback on the
non-Pro version anymore. This means having to separate them into their
respective DTs, and provide one for each of them.
There are other differences between the two of course, like battery
design capacity, etc., but they don't matter at this stage due to
incomplete upstream support.

* dependency note *

Due to the renaming of the gs101-oriole.dts, this series will conflict
with any pending patches touching the same file. I have therefore based
this series on top of my USB series from
https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org
and the patch enabling framebuffer support for Pixel 6 from
https://lore.kernel.org/r/20241220-gs101-simplefb-oriole-v2-1-df60e566932a@linaro.org

* dependency note end *

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- We now have a generic gs101-based Pixel board DT, which can work on
  any Pixel 6 / 6 Pro / 6a
- Pixel 6 (Pro) are overlays onto that one.
  This has the advantage that all boards can be supported without
  having to have a full copy of the DT for each of them. We still
  instruct kbuild to create merged DTBs (in addition to the DTBOs) so
  that existing scripts can keep working while giving the option to
  just apply the overlay before boot (e.g. by the bootloader).
- The binding has been updated according to the above points
- I've changed the simple-framebuffer node to specify the memory via
  memory-region instead of reg, as that avoids unnecessary duplication
  (of the size), and it avoids having to specify #address-cells
  and #size-cells in the chosen node (and duplicating this in the
  DTSO), which is otherwise necessary to keep dt_binding_check happy
  and DT validation working in general.
- sort overriding/extending nodes ordered by label name (Krzysztof)
- format patches with diff.renames=copies (Krzysztof)
- dependencies have been updated, see below
- Link to v1: https://lore.kernel.org/r/20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org

---
André Draszik (3):
      dt-bindings: arm: google: add gs101-raven and generic gs101-pixel
      arm64: dts: exynos: gs101-pixel: add generic gs101-based Pixel support
      arm64: dts: exynos: gs101-raven: add new board file

 Documentation/devicetree/bindings/arm/google.yaml  | 18 +++++++++---
 arch/arm64/boot/dts/exynos/google/Makefile         |  9 ++++--
 .../arm64/boot/dts/exynos/google/gs101-oriole.dtso | 33 ++++++++++++++++++++++
 .../{gs101-oriole.dts => gs101-pixel-generic.dts}  | 24 +++++++---------
 arch/arm64/boot/dts/exynos/google/gs101-raven.dtso | 33 ++++++++++++++++++++++
 5 files changed, 97 insertions(+), 20 deletions(-)
---
base-commit: f70ddfc479f2fac1d0b744148743c25ce1778f01
change-id: 20241216-gs101-simplefb-8aae80278ed7

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

