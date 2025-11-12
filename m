Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4546B277CB8
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762963575; cv=none; b=iAKnYX1PFgiJjVvhhVQCkugSV8GKqdg3L/Nz7TOznYTab26EQEwcsACJhYwzCMkDZKe/hPgUQRkMqEEWIJiSOcJhJLqDJGY8O9ZrM3ZfOV28pRd4iNZP28wEj1lewCn3h1CvM3V5/P0aRg7pnauUceEwRXdpahEIIYFgSmwYoPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762963575; c=relaxed/simple;
	bh=Tb8QWBachEzK293/rkkaGX5QoR2WIIDvyetwzLPF/dU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HxpzV8Y9hnMH/guP8kYegWs9qQkq2JLXnPfIdKEjfnBBhSf+prXEnfPv1Du4p1LAtpg5ons1obJ3ydyGGFddFMTJwRWZZs0Ez5zA7Lkpd8rSjJc0WBkXhTVpZ0cxBrEGVnyBEixZnV9g+jvaTvAjz5Z/pMC5hwz8dAIQksHcHGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P/+OniD4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P/+OniD4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4774f41628bso5299245e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 08:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762963570; x=1763568370; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eSaK7KjpsRpJPsoshb/MU55TLjeahDB1ks0unKYBn4A=;
        b=P/+OniD4oFPwK95EkkNwCjQ1gQLRbks1cLJYHWlMk+/oQamHe9jUPc+58MMhaS56gt
         XtymMPz1wdweGsTUS3w2+YzyPgjyBH8K0sZGFIe36AeFCMJOUL+GySQfs4Kd/S21A7uo
         UrzPBnKHilAqnsDb4lbNduIGrcMGxfncGplQGAiDsN6AuwC9UNxgcI31KzzmvFhd/EyS
         /VUQNU69S8zmM7yXIF9zkEXlXdOpzOr7Qoexf4osZN7UPznXuWf6y1vHKy1LAUaLBhLK
         henFRXpVN5BVFcwJ1ALl3qVoCGegF1Lk2IxaumIZJqNStSoZmahTIA9yonas/5N8bzK2
         LW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762963570; x=1763568370;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSaK7KjpsRpJPsoshb/MU55TLjeahDB1ks0unKYBn4A=;
        b=SO/7P+dcYBPy5Je9oDJYurZSwxXZP/r/j6vky0u7x5sK7agM86EbXcwtLVWA3FjJzc
         oGYL7piuExLs7+hLF/hOA2JTZOhm1v0kODB1mhuUgoIKdqLFoaUMihpdPNdMuMidAW4D
         0YWOQdK79pKNj3CRmeTznsPnKLk23miGEbb1ZbFp5owHpOW6I/hOJ+a+OinSG4s5YBcY
         azoQDQ2zuK498ryT9b+uON6qocXQCzpuqEy5qKN8U/SoAgYIc7TbgO8Ex9t15IHpg8wy
         RFDEttvn0MvS3XIPF1cNG/Qqnm2pXYjWYf2hNr/runhkDWLkjUEmC9ZGUAfa74vX5EAe
         GrQg==
X-Forwarded-Encrypted: i=1; AJvYcCX/7zEk4+kqqRZvklm5/gAEfOwJMo7gpI578EjBta7oC0CsywhGlC65MRIXZaI1FvjFmLdU8U+miFJeSVIvtu0qNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhgC/k2JUS3EpwxxDTBN6ANHcdi22f5UdYxw2+aySxdgtVPLSx
	v8EUxDCv2fN2LJvBhJDC6IBj8ffYi5ZyK3a2XX7Oy8Hn6l7RdLh4KJyybJ/Y6nOu6Z0=
X-Gm-Gg: ASbGncsHRaHRUV9G2+rzHp1jPoqc+TYjfH5Dits7NX1OCe9jq2k8+YlXBKH3d4U5yS7
	UI8fR4MWO9H+eU8a6H6ENn9APXweD6F7HIofHN7ABDvk4NYvWTf2+VrSs6wrus9zoFEQ7YEZvIb
	x1uDUjJi8T6Zgcudvg7loohpZR3yrJbOapQZFmu1nUPl34hVC5fXlqgJN/YrffzQdD9oZfO2BuO
	TuAdm0xcO+hrp+rZc2Xwdb0+IKP3OulubJnwUjRNdX3/0/0a7QA1lMK5evBWzJJdEn36P6kyBkH
	g3Lurqj0P0puG7MA3a+GLI+QCFiTEV2wYz3iKAtulapscFqbB2+flohehbqQPWn9UtbodGgGLze
	4UwpjamVPPPIIDZ2tQDrcYxlH8RUK7OejQB9iNvbc0bLR8dKGIKdGprwKwVmc3BtpA/iJgCpNYf
	KwKLmA4fruGg+mwxAsbs7B+lr6othUcZw=
X-Google-Smtp-Source: AGHT+IG6rFzEcxKdldL8ZJSA90DQKBh2V/CJToGQI/q5NdQAalijEOc2BYKjbz+pmbmuHRK+JHR6rQ==
X-Received: by 2002:a05:600c:5247:b0:477:7f4a:44bd with SMTP id 5b1f17b1804b1-47787224955mr29777585e9.0.1762963570392;
        Wed, 12 Nov 2025 08:06:10 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e95327sm41226855e9.12.2025.11.12.08.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 08:06:09 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v4 0/2] Add new phy_notify_state() api
Date: Wed, 12 Nov 2025 16:05:57 +0000
Message-Id: <20251112-phy-notify-pmstate-v4-0-717d78009d15@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGWwFGkC/3XOQWrDMBAF0KsErSszmvEkdla9R8lCiSV7oJWMJ
 ExM8N0rB0opbZd/4L8/D5VdEpfV+fBQyS2SJYYa2peDuk02jE7LULNCQIYTkJ6nVYdYxK96/sj
 FFqc94NUyd+iPrGpxTs7L/Ym+XWqeJJeY1ufGYvbrzrUGABEMMzdEhIY6jXp2xaVmTOK9hNd3C
 TbFJqZR7dCCX+V/f1lQg/Y3c+yhpd6Y0y+Dvo3O/G1QNeg6WO6BeRjoh7Ft2ydU4cJ1NgEAAA=
 =
X-Change-ID: 20250703-phy-notify-pmstate-f02ba5582f65
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1976;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Tb8QWBachEzK293/rkkaGX5QoR2WIIDvyetwzLPF/dU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFLBvBMKx+UST6zAYRGgV+Ns9aJTxOwnsxasX4
 V/1V6CwXvyJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRSwbwAKCRDO6LjWAjRy
 uqy0D/9yeYWXP6i5RIKwe6GIAI0BWoqhXoXkNenwExXcitTNpZk414r9TMsa1jqI0fj3A1TSesq
 KQSB+5+FFomF7mRj4i1z4ToYS8GlrBPBwm9JufqwjzQ7MTcN71JzReyMtUSEj9EkVFto7Pz891G
 YWK6nTx+MqgDJcSZt2+DnKYJheWutFMpQVD4R5jHWncVFYj6Qpvlh9BOq5upOiWrIuvmzX5rV5f
 ISp9AMu2FnLKjQhM+S7qEO5pPVD5zVPiRcAm6kcNTeX04ZFrm4fXiAouRy2YL01IbQx+NDtj+zE
 RjELefMhdU9ZCALKPu7TAA2AFGq+N/0jamQ2epi8DV2vXIB5hHtZ0ie166LLLjAwScov+pSQs14
 nmRel0AunzcRbXG0lCkKaMDKIptSLVygvTa2RpycBbGMuil7h1FSRO97whzFuM1d4h+pvArvwJr
 Bcg2TqI8pzc9pHTKv2TJbcoe0PzR4J8V5h1GOzkkFd9N2EbVvLi/TjZZmCNaoejmCnstvGYcCmy
 XjmZjy3wf7f+g3i2Zvdz/V4wY2R4C1p0u27OvTi97lSSMe7Tdx7Mmnwc0R7kCiVtm+nEjVcEeUj
 /pjAW2PupbeOjVQ80H+NZJ+snaJN+X6fmmhqg3wuTwUne/3+7LEeEOEBe/OI3/lFidz3Ep710z4
 dRvM7VGm26TWWMw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

This series adds a new phy_notify_state() API to the phy subsystem. It is
designed to be used when some specific runtime configuration parameters
need to be changed when transitioning to the desired state which can't be
handled by phy_calibrate()or phy_power_{on|off}().

The first user of the new API is phy-samsung-ufs and phy-gs101-ufs which
need to issue some register writes when entering and exiting the hibern8
link state.

A separate patch will be sent for ufs-exynos driver to make use of this new
API in the hibern8 callbacks.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- Add missing 'used' word in commit description (Vinod)
- Fix 0-day compiler warning
- Link to v3: https://lore.kernel.org/r/20250813-phy-notify-pmstate-v3-0-3bda59055dd3@linaro.org

Changes in v3:
- Rename API to phy_notify_state(). (Mani/Neil)
- Remove inline kerneldoc comment (Mani)
- s/phy/PHY (Mani)
- peripheral specific enums in phy.h (Vinod)

- Link to v2: https://lore.kernel.org/r/20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org

Changes in v2:
- Add new phy_notify_pmstate API() instead of using phy_set_mode() (Vinod)
- Link to v1: https://lore.kernel.org/r/20241002201555.3332138-1-peter.griffin@linaro.org

---
Peter Griffin (2):
      phy: add new phy_notify_state() api
      phy: samsung: gs101-ufs: Add .notify_phystate() & hibern8 enter/exit values

 drivers/phy/phy-core.c                | 25 ++++++++++++++++++++++
 drivers/phy/samsung/phy-gs101-ufs.c   | 28 ++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c | 40 +++++++++++++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.h |  7 ++++++
 include/linux/phy/phy.h               | 19 +++++++++++++++++
 5 files changed, 119 insertions(+)
---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20250703-phy-notify-pmstate-f02ba5582f65

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

