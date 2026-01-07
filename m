Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ADD78F59
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Jan 2026 09:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767777122; cv=none; b=CUbGp699rXca/nR+zZDYc98EnMvJ5aoc9MmHuEwgRakPn7Gsg7rGX4Nuo71iuUn/XjtjiT1jpxp0Pu2CCUf4JtjOHP5cisKzJNQ1XrQVZ4iu1WYi75S9wv2/nAgRnQagqA6MEM01NNarFTMyryRXUqJMa51HaJYrwNRg2zFb/Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767777122; c=relaxed/simple;
	bh=I+Z6/oLcPfM/Bm41nTCSNmQgZ1WO/gKuYMLMv+8JORc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ck2qg/4A+NWNMeP6m+ErzJ+fVvcjQvW/4V69qbjhwvF6kmslkGROsJmfGrxmI4PzrUM/Cclrt7CDalgXlWSPxuI5u2SHotu1TYlev7bFHDmMtQmf6IAbH/p8SZqyovetGx5rcUQK+r09y87mE1No7oJuFgpuZfHsTiovWYAxm8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXcAo055; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXcAo055"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bcfd82f55ebso230851a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Jan 2026 01:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767777120; x=1768381920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=z6PKvH2Ow6ko853+AH354pPeqzOvITROthdCzpOchPU=;
        b=CXcAo055fhgyh0/9W94VcpwPbm4sPOdqFqKsqrAaxZNiklHstQgWbwBgU2X4QEd+op
         7GHZeemdyqSRDS7i5npsauMD6kzjZ7S9BDaJ/8I6PlDeFz3rP1Pe4xL1MLIBqRCus8iG
         uyE+7uraGA5U0vj2iK1bmqcWzGGsDWnXMW4m6nBgTWxFB2GNQZQGTGOMJI7WKx8H0SoO
         Sco+Mj2sp9knzU1pZnRQTmLjzWGSgJBFZMSM+VcezV91G3kkkeiuqOO9eSifQW6okw+j
         PVvifE+Z89mJJ186N2168DwQc97j0m2aGUGHt3RDAFSZr2roUjOQv+eG8yVxTwEdA5ZO
         ragA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767777120; x=1768381920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6PKvH2Ow6ko853+AH354pPeqzOvITROthdCzpOchPU=;
        b=N0UnwB31UGNcdqfRR99nJN/s8vg7YJ7hm4D7DM5onZBRRzV/bjr5bvdR6Wk4F52apj
         EyDoMXaN0QyPJTIczeBviiZMee73yeD4H1KYMGY/ufPQ2HnEEMGG6DfcC3xQ9868qCQz
         DOw7A/oHeFQ04WOiDR+yFgi8fntdLJh/OWJVr2U6LYOgZotP69Uhq/lF/n/y7gz7QvRl
         TKMQ4q8ZjTWInzhAhCVeqayQBz4NpYp+YZ+IdG7pYewiWTZW4yBRV4yFCmOFWr5fgFYZ
         Rw1NOPPSJ2Lp3t49ERocq/3dlfBJ7NyJXb7+CKCsvE23OsPx1T+q7FucmBVzAQ2O15Lo
         o5kg==
X-Forwarded-Encrypted: i=1; AJvYcCUUCCMWFxBUGJDnpKix3lAaMcoPMeE/q48bYleXlaof857+EGrp0a2r6xWEpIakymISLkH2e6VZm+34Gu7u+OdHcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCuYh5eZmM7taxoEP/kLySUQb/ti9VvIrVr7F+8rqmgd8gLHHT
	6Ohk18xT1JzyumNhlKQcgCb3QfxT2rR3cAER0HJXVyjMuWf1ScMvtasp
X-Gm-Gg: AY/fxX62CS18jgMwoesPAj/jGDI37/Sx0zg0vd9j6GDAlRpJfLlDD5AHaN8e5uTjDJ2
	V/aVaprUKxX3ok3gh9LTtwpXHSZI96CnNQ5ZRrC36ajlxhm6Q6ZTArXVA0ptBDCduXHoLsq8DiL
	N0HpmGPaT5UG2jYJNXpByVZ6dB4VvqiSnEDuhE16zWPPJbq5Le1ctRVt6eeBH5eBfooXqQ5LjiW
	3eXy/iCWTdHepHduDZSG2P3KZIyGbZ6KCR1ZEeB22f81BBHu4CZKSt9/jv48fs0mHQv5vkLtUJB
	FBAn1vFUM+j6Re9fvluiJ4pPKa5Wwb+Rux4d+GXEv/ENNbomeOB+DCLsj8zTdSjcKp1uAdWB3vK
	b47q3rklIjv/+0tOfgxY5Bz7XvtuMXFYX7x3REUBFKtImPQm0hs6MM6DciytTTco46yR8tKmKed
	BHoXuT9HNq1IHPQdnJ9nx1pCMUQihHG/wPNx7YPNpQAcZbQ9RQMxmrMEo=
X-Google-Smtp-Source: AGHT+IET8/5wzNt7Aff+epntdgaB5qdBkTImmgeJLXZCQ39VAdysCsV7Qhu6h3hzUYQd0+SOKj8n7w==
X-Received: by 2002:a17:90b:4f81:b0:34f:5039:5ac7 with SMTP id 98e67ed59e1d1-34f5f84a94dmr4656646a91.6.1767777119628;
        Wed, 07 Jan 2026 01:11:59 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e9d42sm4335843b3a.51.2026.01.07.01.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:11:59 -0800 (PST)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date: Wed,  7 Jan 2026 18:11:54 +0900
Message-Id: <20260107091154.27436-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dave and Daniel,

   One trivial cleanup which replaces system_wq with system_percpu_wq
   in HDMI driver.

   This change aligns the driver with the new workqueue model and avoids
   further use of the ambiguous system_wq. No functional change is intended.

   Merging this early helps unblock and simplify further workqueue API
   refactoring.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit c4f2ae53863de2b5d125c3cdc9ff12668868a74a:

  Merge tag 'drm-rust-fixes-2025-12-29' of https://gitlab.freedesktop.org/drm/rust/kernel into drm-fixes (2026-01-05 14:45:33 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-v6.19-rc5

for you to fetch changes up to 8e6ad0dac6266c5e13874e816b016759d7145500:

  drm/exynos: hdmi: replace use of system_wq with system_percpu_wq (2026-01-07 17:50:50 +0900)

----------------------------------------------------------------
One code cleanup
. Replace system_wq with system_percpu_wq in the Exynos HDMI driver.
  system_wq is effectively a per-cpu workqueue, but its name does not make
  this explicit. Recent workqueue changes introduced system_percpu_wq to clarify
  semantics and support ongoing workqueue API refactoring.

----------------------------------------------------------------
Marco Crivellari (1):
      drm/exynos: hdmi: replace use of system_wq with system_percpu_wq

 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
