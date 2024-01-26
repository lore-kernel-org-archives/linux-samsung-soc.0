Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373871CD11
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 14:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706278298; cv=none; b=TCN1oWdIRvC+G5dKzAmKXNYVqFvGucDjLqhNy8wY92DcXy9KIbLigo+iBYot+qA0m0vs4YxidCG580TyD+szAZ9rqfHprftPEnC3utHs8x6zVx78DHcngrLmfEzrANmesHajaGksddNuxn94TWLVUm4myaP2Xu2USWAKRFmdetw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706278298; c=relaxed/simple;
	bh=ORG3PUk6hJ36HaK8k6qEbN0RT3bBtPF5EOuhqaMjupo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=KOgI2vpHssIXCvOG0Jg1E76QHhdch9ExVyTez7JCBPBDI6IXGZQGj8dPlLe0BVVk5PtSICi7fKV5JD1EzgJ4khQ90KpWG5bvmwWuI0rLjAWD8gMtgQglUtWqsm3Hzi0h/5f2MFIB6T84a3VZUhSw1eqL8sYzD1OvpMSabwW7hLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTdk/O+6; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTdk/O+6"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ddd19552e6so218864b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 06:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706278295; x=1706883095; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DQlVzK5S0SZ8xLgogJiclZtODcnjOBeJZwV+6P0khw=;
        b=MTdk/O+69hu84nEYQ3HgLUt+i9NdOwplWTN12khPVcyrYF59PRvPPvJ4VRaVqSMcO3
         djrqBXuxGC0I1Wz24VNvdC2WodL2prwluiHqNy1pUp9EpNc7bVlEC/PiLvQqbzJqdUOC
         y/cMDX1e02/Y0Noi6V2jSsMUl1k0vynoo8UVrPrcctQEKvbb8iblSKYwBYK0YO8YQ19T
         2EHnwEiLevrrUYp3ViN93KtN2ML25ypQT9Uq9tfUOy173hbzIW9fWIy7lZTRyBzIXUsW
         shK+FrnJIe5+4dKtbxIJ2HCoJTJT6JReASsJ/S448Tjbo8fcRrPTJ5pX8JRzAKtGGiQK
         6X2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706278295; x=1706883095;
        h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5DQlVzK5S0SZ8xLgogJiclZtODcnjOBeJZwV+6P0khw=;
        b=Wy9yoMe/w74QiFc/u0XG/bAW0DPV7I7FUV/0ho5HDTvthzSPu2jgoSJunJPe3EGJKu
         2qc8ItLVkKGgG/8oJNhdQX6AX8wgoe/Yuz3z/RXdwo6l36bjOufEGpwITawTJ/o3VW9G
         IYrueiAi8UORn8VRmdDGkdOhN88lD13yMcvjROwtHyg3Vk/E1Gp65ChU9rHMoCzRiJnv
         XDBTGwDfAtLEMZKfkehnnFL3eMkzfNOwF9YJ3q9lNOGjxs56xgQsngDeledUOQ+lFfW3
         Ugh1vE45pvT8ha/7nil70pwGIBpvUbTT8SMzUzwcTQNnM+5QSQdb32kygsrfnpHN9guc
         U9LQ==
X-Gm-Message-State: AOJu0Ywh5as3FmLg80kHvqWOP9DNNbbtO+mHc3fsxXfcG+pVYyCQ2mfz
	6PqHa1KcotFUydsWjYZcnkxh5Zj0iN5NsLApVAk3PpKRq/aQuoh+
X-Google-Smtp-Source: AGHT+IGnlmTXNCkdfD8LAjE9foXlMwyd/et0ZdQ5i7Uirv391URClm3cosbQwHR39kAlKZ6YiZ2FMw==
X-Received: by 2002:aa7:9dde:0:b0:6dd:a118:9082 with SMTP id g30-20020aa79dde000000b006dda1189082mr1508080pfq.29.1706278295303;
        Fri, 26 Jan 2024 06:11:35 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id gu7-20020a056a004e4700b006db105027basm1125511pfb.50.2024.01.26.06.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 06:11:35 -0800 (PST)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] drm-misc-fixes
Date: Fri, 26 Jan 2024 23:11:30 +0900
Message-Id: <20240126141130.15512-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Hi Dave and Daniel,

   Just one regression fixup to samsung-dsim.c module.

   I attempted a pull request on the drm-misc tree but encountered
   a permission issue. In response to this, I've created an issue[1]
   on gitlab.freedesktop.org.

   Therefore, I added the drm-misc tree as a remote to the drm-exynos tree.
   This pull request is based on the latest drm-misc-fixes branch of
   the drm-misc tree.


   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

[1] https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/1151

The following changes since commit 27d19268cf394f2c78db732be0cb31852eeadb0a:

  accel/ivpu: Improve recovery and reset support (2024-01-25 10:17:37 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/drm-misc-fixes-for-v6.8-rc2

for you to fetch changes up to ff3d5d04db07e5374758baa7e877fde8d683ebab:

  drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE (2024-01-26 22:48:47 +0900)

----------------------------------------------------------------
One regression fixup to samsung-dsim.c module
- The FORCE_STOP_STATE bit is ineffective for forcing DSI link into LP-11 mode,
  causing timing issues and potential bridge failures.
  This patch reverts previous commits and corrects this issue.

----------------------------------------------------------------
Michael Walle (1):
      drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE

 drivers/gpu/drm/bridge/samsung-dsim.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)
