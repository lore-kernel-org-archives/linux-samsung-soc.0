Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E99D3002A0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757936151; cv=none; b=IoN/Tp0PF51eWCac3QZlvdutWFagRAZkE+TGRGqSA1+gvMDfwgymfHy4dEVd9uDOeCTxTIjCjwPjxxLW3LopRqq8MTUlSqOcZVCR2SxDC3ZCZPchZrzc9HKy2B5UfUDcHz5ou1hYGezUlE3thKiPER7Gyx3lwdfFMi2jBQ6ByGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757936151; c=relaxed/simple;
	bh=1PkBQL9MG+FTL30snx49qZ03JgCam4aX/8234xsQ54I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iHd+2mUz7gH0jULMj1gKCWDT38MOutmFYCi8+I9u7ES5DssxuHNOVc5WvPmLZvwIaNLi7uUsOKfQAoEV63wnQJeWyFhSAGl+WT3QQLXmOo2nWtfOOcYBVlUUQ9U0CghwhODuGx1yrHIDZp5RfU63+MykKA+HfiFR7aR+TgBhZRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BA/Vvtk4; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BA/Vvtk4"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-772301f8ae2so3781171b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757936149; x=1758540949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dUzFkFk1+mO2jRYji6fAqwLaxf+InG/7uYm0PLcoMDU=;
        b=BA/Vvtk4VX8feYhvA30Jgvfcr2kPPpGIWi7VI8KwP+BP8sC/NLTAy9QWJBDQJ3u2QT
         M1+sLWwCaRoGyas6yYbkZlrDEBpdVfgQBD2YueN4nsTset4efDmNujN65TW+E2XVWj3I
         hGoFr0VpyCitcBWkKqQYoZ91b0QSsvKqJgkU6WNPL10+ASXPVeLSHQK0c/h0iOBhaDRr
         i7lzCviQSQTVvC8HshsCD89FVvCccsZwPngfNtVvsCpZNL4fAEPzc+hn/feN2Y4gCud1
         tSUJsUl2WQ+W9DIm2cDQ2HbF+ex8EhvS80H48QusWIzO6FZKZcy9QzbXsWAlUxdS6uCV
         NArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757936149; x=1758540949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUzFkFk1+mO2jRYji6fAqwLaxf+InG/7uYm0PLcoMDU=;
        b=pIFDErmbIRm6TfQIjFW3rqzadqsPEyC6kfc2gHrpMbYAv7A0YvZwxzMWte4ZwI3Bko
         x7DmfueTPkJOGQuzZzFot5A9OEJTqAwGlPuLMOr69QUs4xPFJqD7XyUupkB/W8YGiFvG
         nvqWGfgqhnWkYu6JJb7TZik6cLyxR51qpy4nWzoEHQMq5DhUtxqdUEYLNwvVKGyLkbi4
         h+OeUTTBbYclMDP8YfC/7JvxwT2lAMq6yBEMWbuvuLBuBfgRcfz1LFPjoYGOaXWfvpLm
         CORQXYkCdScTdif9QqduP98hEyJkdDGdsfSl57A+ttaTB1Rl+kqlrZP0p8YL4YwYnY55
         rE5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUy2NjNgmaXmUZL4PVmN289d5MUmo8L2p37gi4BBEFG3l/kZEKO3qqHtU5WohKcaBYvGEjGeFFPxcslbQiPFGNBpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+0Km4TwYySvQbhvG71yTdSCSo0L1ClmePDir7oj+Bi0IfqDNF
	oCU+V1BO3AVwv5YnQs4DDIZN+UCGUrSKskKBLaVfmV45HRZ84Au78EecoB/hAg==
X-Gm-Gg: ASbGncsNt41hjXJV3Nzf72P7RxuPuiGPSNKPo2elttDtnxwg2UYusINbx4++P7uarDs
	TE3L7WjQ1/LJd0vkkpG8M4zbQkHtT5jC9+4MtXTUzSN4c3h6aSOeDwrTtz0xpAze3ivzCgQ5Pj6
	jKzg/hXH81xjs3w/qcC9KN2j4gzdd/oZyQvkZd6jeyeKl6YdUj3ugwCFMVsF0LpGpoG5/+CGgGP
	nsOXiobSLnDO1PWe0rzzwg3eQx5fRC0qR0YTDiif7dmnVUkpCbwyeRw1pt6ZhHlh+l1EZrXPRJl
	XwW89xVEWUmWQ35mFiCSMh/fJTEeuW7hzR/V1CJFl7pIkikJ11XaTnFV7jIDVoJi/MIxIH1mU1G
	xPcLeV8oOQK7TGC1YBOGN6Y6uvK4wBa4L61cbL0ZKRZCnJDlhDPAeD2gn5uzA7siEljE=
X-Google-Smtp-Source: AGHT+IGr09urmEGmQvVvTRHCnJeUE3anzGKvE0M1XN+hFGHJ2XSQsiB0hamET89RZILOw7ceUvDY3A==
X-Received: by 2002:a05:6a00:4646:b0:770:4ede:a2e8 with SMTP id d2e1a72fcca58-77612163929mr12201677b3a.16.1757936148826;
        Mon, 15 Sep 2025 04:35:48 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b18400sm13054455b3a.59.2025.09.15.04.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:35:48 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL RESEND] exynos-drm-next
Date: Mon, 15 Sep 2025 20:35:43 +0900
Message-Id: <20250915113543.51294-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dave and Daniel,

   Add Exynos7870 SoC support to Exynos DSI driver and a bug fixup.

Please kindly let me know if there is any problem.

Ps. This PR depends on the following PR being merged first:
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-misc-next-for-v6.18

Thanks,
Inki Dae


The following changes since commit 77169a11d4e9916f6c22587df396d6128505dbfb:

  drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge (2025-09-15 19:55:15 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.18

for you to fetch changes up to 472df181d7c4c732d5c5b98d506d1902e7580acb:

  drm/exynos: dsi: add support for exynos7870 (2025-09-15 20:19:23 +0900)

----------------------------------------------------------------
New feature
- Add glue layer support for Exynos7870 DSIM in Exynos DSI driver
  . Introduces Exynos7870 DSIM bridge integration at Exynos DRM DSI layer.

Bug fixups for exynos7_drm_decon.c module
- Remove redundant ctx->suspended state handling
  . Cleans up unused state check logic as call flow is now correctly managed.
  . Fixes an issue where decon_commit() was blocked from decon_atomic_enable() due to incorrect state setting.

----------------------------------------------------------------
Kaustabh Chakraborty (3):
      dt-bindings: display: samsung,exynos7-decon: document iommus, memory-region, and ports
      drm/exynos: exynos7_drm_decon: remove ctx->suspended
      drm/exynos: dsi: add support for exynos7870

 .../display/samsung/samsung,exynos7-decon.yaml     | 21 +++++++++++++
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         | 36 ----------------------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  9 ++++++
 3 files changed, 30 insertions(+), 36 deletions(-)
