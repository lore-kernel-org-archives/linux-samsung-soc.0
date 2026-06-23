Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7A9263C8C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220794; cv=none; b=LOMPG9Tik3zlhxPk2x2Nhnmx03Tr2Fu1v1+T5+mX4gdx3r4o/qdRhQDscLUW1RLqj6a91/J4tcRoGKsr22tlwivRSlKOrft+jG0YVjmi3XYddICikWSqHU/GVUCp4lw7z7V2eGKGzhcVeC2grsB11FxODEMfu0f+CWHdwskNucg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220794; c=relaxed/simple;
	bh=1gGrwl0EHUsNEu4noj7giJcbU2d/otseTn8yvo94OFI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ctCthmrxtPdBDowq8DR5DToFHZNZ1NpYmSgYyJX8kJ3qML6JU4F0oqurxbTSNCBU3JJGz3HlMCGuJOsq4B4n9muJhleR6L4ZvBbHSi++ryIAVOUM4zywMm2HVsjjzEHqznnNEqLtwJ6m17UugJbAZbwfcEXLlNHwhVNU4/B4QmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVJy+HqQ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVJy+HqQ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-697ebe536b6so20254a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 06:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782220791; x=1782825591; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7PhzB9IpnBw2GMjA06F7mqNVMnbUZwmTYPMzQKsAxjM=;
        b=XVJy+HqQigkGKNCuAbgHNVFrYIv4F6T6ffy1QcquKfGOeWGkGEbnV6W69dQlRtSiVT
         S3VytjipaR1L8otCDDy0tVviYJI1V/FEnJT7DqTSFGcIiuIouYaZp9Fz/rvAtnZ4ygtN
         XXDpgnUMuIomrY6DpjbcgpHkW8QWfL/QrifhyR1SCgh12LIl/8YJfB3W+dAd4XfnaQEx
         67jshGaGn47AV3l+HDFx3ABnJY7RbbRxWt3ca51Air2F+lA67DRLsfu13gdlkRnz9AFJ
         CP8w8JS9cfNW6Z8brQyppXQtjTckaK6iUD5ykGfwL+ysF6Qikrgzirua2okqJBFTXspM
         VjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220792; x=1782825592;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PhzB9IpnBw2GMjA06F7mqNVMnbUZwmTYPMzQKsAxjM=;
        b=M48oZiWIQ7Y5KeweoPHWwgHo0H1cD8iVC5Hi0OMqm0dr0mE4My+rGbCjLCeZ73cTXh
         CeazQv34T+UaM0pU8t04wwBPxpS+7MLwJEV4sPrmGINbPeEmyxdWAOQ4TGZVOaFQ4YN6
         Ji1cYWfihf1PGZiLop75C5z2TPD8+FT65KOw9KRVP8Ig7DOULMGnBuIRXWPvQbuqP2R/
         4+Ou6+Og1gX3ykxjNqgdvgX5jCqJJhTzsTqwYkTxdfr929zgbMXtM7oXi3ocqVF/ZDGX
         +1BaQK0KrmoEyshtyq4yWkR2kOYUb6lh02AsB81OV+sPn8NQ7ZFh75rY86zapoVMvHDs
         G6DQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ws9VLQr3Y/JJiUiqjIHnYYPaDqcK5U4d1INudeDqcvnY6Dw7A/38Iy36/qDAu74iiJNbPnkUF3J7H2gREwJF6Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBhQ3eomRuX48f7Xb/VIfgQcTjDD5IX2ejP0FrV6SHic61GtuX
	s+zp5wAGDC192RN//6EVA791S2jh3gHoDLIPrYm3yaJutHfMGEb2xjIx
X-Gm-Gg: AfdE7clWE9ZNsmHF2Mj8TQr8BVaO1urTLWlo7WrpSKbMNz3fQr/SMAkTHJkuZtXrWDt
	0mlYdwVhwC7Ukhf3omADTq2fn0LImTs/UCIroNAgAk8w9uTT8bRKkEqyXfbRjsLrWdtWqDDwPnV
	ykuphOHpYrF7Obcla5nEEn7GtDkIaCYbkw/yGAusr95FdVfq78ov29fQnkHrgJcSO+Q4raWDQL2
	e/CZjRbxA0NmegCfUb+PzzoNRMr9Xg++agGmYKbYkGDE9sFz6s0g0Lk7BcOlYdeoWxVVjZYeh3m
	EK8pphXS1waYEjLm4Ab/aW9/ulK2Am/LA05QWkPneAjSMhvX6AsZu8eGE9Ear+Wz0iZlrVQUqzp
	2vMCU+IAG0t2WKNkbU6Yox61DWWQSBiSoWGrZny+iUE0yWCgvR9MLUdm79u0To+DtJyCuG3qvPo
	I0Y/FFTfTUd1t65YZX7lRb
X-Received: by 2002:a05:6402:5107:b0:697:bdb9:51f with SMTP id 4fb4d7f45d1cf-697bdb909c9mr3759928a12.4.1782220791355;
        Tue, 23 Jun 2026 06:19:51 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82f95dsm5060107a12.3.2026.06.23.06.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:19:50 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Subject: [PATCH v2 0/2] drm/exynos: DRM encoder improvements for Exynos
 devices
Date: Tue, 23 Jun 2026 15:19:29 +0200
Message-Id: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOGHOmoC/32NQQ6DIBBFr2JmXRrESrWr3qNxITLqJAIGGqIx3
 L3oAbp8L/nvHxDQEwZ4FQd4jBTI2QziVsAw93ZCRjozCC4kl6JiuO3WBaa9YYHMuiBTqq4aqeW
 jbp+Qd6vHkbar+ekyzxS+zu/XRSxP+68WS8bPpBh526gS8T2Znpb74Ax0KaUfj96zn7IAAAA=
X-Change-ID: 20260623-exynos-drm-simple-bb5386d64597
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.14.3

This series does two things:
	- Open-code drm_simple_encoder_init() since it is deprecated
	- Handle the error code from drm_encoder_init (previously
	  drm_simple_encoder_init) to prevent silent failures and
	  cleanup of uninitialized encoders

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
Changes in v2:
- Fix mistake in exynos_drm_vidi
- Fix indentation
- Link to v1: https://lore.kernel.org/r/20260623-exynos-drm-simple-v1-0-bb52f098b1ee@gmail.com

---
Diogo Silva (2):
      drm/exynos: Remove dependency on DRM simple helpers
      drm/exynos: Add error handling to drm_encoder_init()

 drivers/gpu/drm/exynos/exynos_dp.c       | 13 +++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 14 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 11 +++++++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 14 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 15 +++++++++++++--
 5 files changed, 57 insertions(+), 10 deletions(-)
---
base-commit: 60326b17f877e12846167bf8ef83680b9875218a
change-id: 20260623-exynos-drm-simple-bb5386d64597

Best regards,
-- 
Diogo Silva <diogompaissilva@gmail.com>

