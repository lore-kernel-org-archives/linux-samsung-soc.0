Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79A326A0AE
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2025 22:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740607463; cv=none; b=d4TyohE4gJbe+j/mZspAZojnCuWeTByZBYugV+quSMtZeZN2FL/mAGEwjKVEel5LyCsourrCntckNfoJHdid5TSrQ6kb8Urd+vOHsmw3PAXw2iQYiPsJ4urBd8dCnIK6BArab4VlIOuo6A1PX+BpZr1fHwUmGRpChf0L4sEEJ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740607463; c=relaxed/simple;
	bh=edjG7+NpM6hUw8RgFAOna+b2UsEfIHK1mS5PuS8JmAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oZBNYBstAFl0Huav7XZxF+D9pGWvNnSLERCKgbyTJcWn/d1BEELfaCorBgaF9PKHyha1/vVKt3JPG6AxeE7zV8rGCy6C6rTvVd8n+0/2n8y0XEZoOceJ1teEKev9SUenXL+LaeKU330O2BKFpXJQ1rkLRxB8CHSk+p2bejMgKOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SikezjYw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SikezjYw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223480ea43aso5835315ad.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2025 14:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740607461; x=1741212261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kyFN50mzARxoEv961GrQx/43IA9dhxw9QoBd7XIEQPY=;
        b=SikezjYwYTVhNtKhYmMwWOAZ8RZVLcS1D1a+AsBCnkwEyamQ8DbB6+7kM9IyrYQkPy
         wi4BGCdIXmZjXOadzgURBcWP0aSAhcjkfo6kUXjtVHQcxXyteuKSgYs4KQehjgp8IHAi
         YOQUytHc2u2HKFrJNsSFXK1xPRJQjhF5mtR3lp8Zs3kRtGjLVUCW8GqxxQBaZv+Hdtcc
         qvf85rWut7nzqPz5opBmMxmiFni7SnWMbDeqVLEzz+5pzwEzY7iplFLRT+8eiT5S2DQ3
         AgZsSXLk5b+rTlzE+fEQAWnPV+3s9XdMlCKNdt7zuC7lzpJivBBQIjkWj6Yw/Mq7aYOb
         i/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740607461; x=1741212261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyFN50mzARxoEv961GrQx/43IA9dhxw9QoBd7XIEQPY=;
        b=Gk9NTL0Tb1ljVYsZlB+zLNmw/Hx2szT4k4NhfStrihBnA29puP7aB2VCDhvOBYecHa
         gVHOko6VELrFNp9NTfN6sUwZKwRH8gwwijEk9M7n+0mYJL6Tn6HqyaUAj6gvtvwGtrZ7
         e7uY43nRL1wbRphHBCqiALeSnVUIzFX6gYJkJKD+JyMsNG40S6dfQN05PFioSYl4HcZl
         3xJFDr0aoPUUFn+ULJOVe2M0B+bkZCVlRORTrdh2geoX+kMYhKUFBo3AezF3VmRrHxrp
         e/PAm97r0m3aiuYQS5Ob+PujEe3zig4F8yNl7DfKflZhHlebuXvxZd22qGPW/qfuy5+w
         kHvw==
X-Forwarded-Encrypted: i=1; AJvYcCU/UfMFdXueaUg7jcPvMJYqnquDea3jam+iIpFhPQt4mqUn71NpYCwJB7hMrzqrj7G8arMpmC6yhKEHDdzyAwMJFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXY4r3P6wLtMSYgDqXPI6tASrplbIK7sf9QUjn7126vyWCNVl3
	LzyNh3QNVApKWiHJ+qELjbSIdKyeIjTyvs0ZE1PBgB1isGvxYamKoswsT0kHFJ4=
X-Gm-Gg: ASbGncu+2yfIIeoOcdmM/AIUSj2LWoimgOfdtVeYxc75skxLI66UeOTSHupwjwZ63cJ
	B/ouTngQ9WBd2DggSM7HV0N+NCLiuyykqAYtlKEb9Ao2xHCuirCOzpqTP+LHpGu8yCZx7ZMZ1ne
	GWy5kLJEAqPAQYqrdh+nMxlKkEoWQOiI+CzRhJP44B3GjhPwOoGiWZ9hAhXPh7vk+j//ecZSBIR
	SLqEckOE9HHB2TwjApToJqvLNEUKHBRFF/s0ZRAHqsDuFkGNDIKCi2o7/v6tenMOaU6JH52fm+W
	dA+K2MmAlIZqDqYx5QUOX22MkMi6iOMzeUgWXbQvwwHeGgpwMNYCOU39
X-Google-Smtp-Source: AGHT+IEJEmPRHAir0pC4JxiSC41YFyAd31zLaa4ACXPDw8wOhc4r3SARGvmSjNnM+NRArbU/MX0XsQ==
X-Received: by 2002:a17:902:f552:b0:215:94eb:adb6 with SMTP id d9443c01a7336-221a1149088mr411033855ad.40.1740607461056;
        Wed, 26 Feb 2025 14:04:21 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([104.134.203.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350534004sm1044145ad.252.2025.02.26.14.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:04:20 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	krzk@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	willmcvicker@google.com,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	ebiggers@kernel.org,
	bvanassche@acm.org,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/6] ufs-exynos fixes for gs101
Date: Wed, 26 Feb 2025 22:04:08 +0000
Message-ID: <20250226220414.343659-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Whilst investigating some stability issues with the upstream ufs-exynos
driver on gs101/Pixel 6 the following fixes have been authored.

Whilst some of the stability issues remain these patches do improve
certain aspects and make things more deterministic especially module
load/unload.

regards,

Peter

Peter Griffin (6):
  scsi: ufs: exynos: ensure pre_link() executes before
    exynos_ufs_phy_init()
  scsi: ufs: exynos: move ufs shareability value to drvdata
  scsi: ufs: exynos: ensure consistent phy reference counts
  scsi: ufs: exynos: Enable PRDT pre-fetching with UFSHCD_CAP_CRYPTO
  scsi: ufs: exynos: Move phy calls to .exit() callback
  scsi: ufs: exynos: put ufs device in reset on .exit() and .suspend()

 drivers/ufs/host/ufs-exynos.c | 62 +++++++++++++++++++++++++----------
 drivers/ufs/host/ufs-exynos.h |  2 ++
 2 files changed, 46 insertions(+), 18 deletions(-)

-- 
2.48.1.658.g4767266eb4-goog

