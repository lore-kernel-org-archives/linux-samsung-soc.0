Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6411F175BF
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 14:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745418655; cv=none; b=kSbJO1lCfgOLM2AWN27l+PeGr0pFTLrExf6upbMDIvEncm1/CG/oXh4eebrmjuYKr8SraYhukccP/+8q1IDjtQ7IEp/HpoZgfWQM1Y+xLrqIarxmGQ6XT0PKQPVaOny6I53pXU9D5c1LSl569/HmnFfVjR9nb+Bd0+SHrsZsYGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745418655; c=relaxed/simple;
	bh=fVcG4XFaJq/iJE173RxYpdBiDmVQAGMoY6BJ/JwZHSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d4Gg7ofp41wPj3Emy/yMKZodRnbXGcsq6BgPQ0ZVlGGPRtvuirEMtzk3ed/DCqToFZOgKh5vOPyVXBJW5Gai74OlPzGRH5XXOY32EYiDvHQieyStceHivyeKOcZUs1DEBnahEO5D/1lD8Mnhd2+rRWU267L7lLxyIn/a79hteoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBvOnuho; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBvOnuho"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22c336fcdaaso72290905ad.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 07:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745418649; x=1746023449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gaQX08B2+8x266QyJ6QuzOwzOJ8c1UJqUK6mYtewD40=;
        b=cBvOnuhoKg/v5XCwoOSMEIW0WaXisQnlzLMcYUmeYxVhDTGo3XyEpeDDF8Je9I6/pq
         xgWjCzEei9dTSEKkGPJHjMPU+FQTqTFDPjG66Ct96jy5d7X8rQLeAiMWKlpEJNEIlFdR
         N0VPxtv94FlcNmSMsIIMXIPtE9nXp0Ohzjr7J8fPcjN1LILuwCF/diiv2b3a7GiNLeyr
         +ZHy3vZgC5e1i6wiophZekEjI+MiBjAH8hcQCLai0xKpj8jaI3z1hT2G2/9qQp93ojVo
         P8d1wt1IunOXm6CFi0vnEV4dT8gEAfCm+TzFneddeZrjlUPSfR4rFPmVQbDpw7qwlysn
         BZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745418650; x=1746023450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaQX08B2+8x266QyJ6QuzOwzOJ8c1UJqUK6mYtewD40=;
        b=Mj7tazR6T5ZGQM48J1M4yvFE54AieIJuxpzMt/y8Ie9ti9Bky06X+fJ/YA5J6zfti7
         VzEag88nlpu5B3jKiZcbLWSXM3D73ExKAiHcxaF2fBSsvkg7qD1CYTUPqljZY637ZhxV
         z6RZonfiOSe9UfAjipeQUs6Y67YIPuhTX9Vm2+NTM+3muI3VCq42aL+9U76vjikksF04
         DX8aEQFQ2ahn3xFoqPtZeRilFo0EtDL45vBk0OpQuMZfryLjb1XgnAzFoEiynD5+l3Zh
         J4WaMmPkbEKSdC9VOdVJaZVoEZPoazM7UFFNA0DUCrZfMHZF0C1ZjNxJ53kLrdi9c3hf
         e01g==
X-Forwarded-Encrypted: i=1; AJvYcCWfQZVKJmaOxXVZK//LZ34k12pYMNCerAxoC1/RwvajdmN+dpR+VC40N71I+W/EhbtSyz62XhZEiAgXYMn95agXeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Fn9jkZ3nyH/1f0eP1CW1ORpaOVAyyOKlpsdrFYbvnOjigeRW
	qFGrwPfXScRFAw8vQnTN0orCdyXi4uAKTaLYewEA4qdjiS/Hh6fBkrGI8/LQ
X-Gm-Gg: ASbGncvXIHKKDENgO3ig2pnBcKgxF/5rTN1vfx+lLzKIEo1qUv3dLeBWAoPDdjRJuNZ
	nkaQbLW5l72QIce09/fIKciyGQ6xXTpYHSNUQhsATbwUGd2+BJzLLjklQ2WHRquJRHDYWlOnADg
	W5vuVNtdCLONxM8mPGDdyBpbCf57TQYSu36R6J43DhZNJSpytHnMDb7of8sEjJgSwSUTKgGAAf4
	4qMi0zjBKtqKN2iUWW7sPPsSkI7dSSLVaD3zOAtfKW95CN90B7HvqfMAg3VSswXD+LH+g+HE6ni
	jHEPe+j4ZUwfEU6LhssDg0qU+VFsOMQc2i6WYxb+AC1jzoDSkR19VaCVxFW735Cuqzvk/vvZQfo
	HxJhQSDvYDSkIE0xYtjaD
X-Google-Smtp-Source: AGHT+IH4v/tQKdMaHFAFk0yNJ2N0GNG1N9zIvOuNxHaZ9ts2MjhK6ik5G1JhmRDmwinwBCgqB4Hu5w==
X-Received: by 2002:a17:903:110c:b0:223:66bb:8993 with SMTP id d9443c01a7336-22c5362e04bmr303908445ad.43.1745418649550;
        Wed, 23 Apr 2025 07:30:49 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb5349sm105397745ad.157.2025.04.23.07.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 07:30:49 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date: Wed, 23 Apr 2025 23:30:44 +0900
Message-Id: <20250423143044.46165-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dave and Daniel,

   Just minor fixups and cleanup.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 0467145fab3b3a7a1efd221722310fe32329b3da:

  Merge tag 'drm-msm-fixes-2025-04-18' of https://gitlab.freedesktop.org/drm/msm into drm-fixes (2025-04-19 15:09:29 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v6.15-rc4

for you to fetch changes up to c171ad1e8166ff8b3ab9ac94bad2574167b41f66:

  drm/exynos: Fix spelling mistake "enqueu" -> "enqueue" (2025-04-23 23:07:28 +0900)

----------------------------------------------------------------
Several fixups
- fix spelling error
- remove redundant error handling in exynos_drm_vidi.c module.
- marks struct decon_data as const in the exynos7_drm_decon driver since it is only read.

Cleanup
- Remove unnecessary checking in exynos_drm_drv.c module

----------------------------------------------------------------
Anindya Sundar Gayen (1):
      drm/exynos: fixed a spelling error

Colin Ian King (1):
      drm/exynos: Fix spelling mistake "enqueu" -> "enqueue"

Guoqing Jiang (1):
      drm/exynos: Remove unnecessary checking

Krzysztof Kozlowski (1):
      drm/exynos: exynos7_drm_decon: Consstify struct decon_data

Wentao Liang (1):
      drm/exynos/vidi: Remove redundant error handling in vidi_get_modes()

 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_drv.c    | 3 +--
 drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c   | 3 ---
 5 files changed, 5 insertions(+), 9 deletions(-)
