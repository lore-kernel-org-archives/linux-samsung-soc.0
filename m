Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB22F1C7B7B
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Sep 2024 09:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725614018; cv=none; b=XaVnf+izc0h7zNEfQKKWxbu2AVU1owSY0WWITYJ8jj7MpWX/FfE9gS/74ZEEJTSud4ozACAUg/WTZ+sZwrME7B58KlbWYNTckSuLxUiVW7+duZtH+RIciDyRBq4NMZdiep2StBWDVz3NsF5ZuCkBabIdIh/PbsyN62XC163nfUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725614018; c=relaxed/simple;
	bh=AHgkrlYQ+uremmDxJ/qacnNSLt+BInpfGlHfs4t5vWI=;
	h=From:To:Cc:Subject:Date:Message-Id; b=LDxmhsjTIDfatO6fF5i7awsv3l+xKsJp4DE7PB54FO6E9zuhsbitnp1Yjt/KMnzPKGEEBQSmk3qgjSf64jd3deN/o/aarW7qyKYMPb55jJPkhJPTFnSjYVvmcM/DjiA22of+t8TZOK4JsM8QPQl4wCRZjDSpWODmppMZqTPS12c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksEq0TcV; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksEq0TcV"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71781f42f75so1374180b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Sep 2024 02:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725614016; x=1726218816; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leB/EuZR76FE79r8CZx4icvbD1A2uzJHnNuq1c7iWUk=;
        b=ksEq0TcVAW5SKMznpSsH/1aVTWF0H5j1/JcEBAJ5oXq5+5F9W4P6ERY3hy6fosga5N
         IjF0QAz7kYExm7V/53chN8PoCDEYYjZs3HCAC/0AJ1pX7nuITD+7I5bTE00JfKY7aMpT
         vFYfbp4n89ujUykt3gT9usQQwSYEPtZbh47LVPdDImInEjeI0kp315y/Use6zlMZ1WG7
         eNH3iQdHfNO9pJSeq3rQ3Hf3gHc7MKMGC/CENReyot8HKvg45OXrMiknojNK3GDbMR1g
         eRTOMlHYcYR0wWdDjjYhSQxZdcVBLKT/OA0ir3N+yJ8zQ2JadBOinFR1Fm0c2dcvmzlp
         BHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725614016; x=1726218816;
        h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=leB/EuZR76FE79r8CZx4icvbD1A2uzJHnNuq1c7iWUk=;
        b=ncvbpF7hsLWEFEYpZ7GJ7zDUU+GFpkNLylBldvCfXOWa7RdoKQfs9QuFBcBberQamz
         CDSBCYdFpApIp4Dh7AtjlB921n7fM7IgmotVNXCTA62ZlbwVrjnd6Yf4wSgR/5PspYuq
         IVXxjnDb8k57qoO8gYIoQw+8jGwcv7M2O0flqfcsupVKSXzJVcypW3RGHVn5BY8+7yod
         W0IKrL2i3vyPk0iuI/UDr0yc6M7sNTUZ0szBE0IdlmHvX8DXUuT1lsGlWOelWrIcc1+V
         rj0dYjfi4BsNeKYGL1wvoAwzb4o9/igOWiHUhOqb6pOih9UBkEVTNYUQsYaSUCG3BMhj
         XGtw==
X-Forwarded-Encrypted: i=1; AJvYcCXEkYLvrpFRtlZvpHMwlJCTUJ+JEvj45rUotO7hfwCNigjjeY5YGpAIn+pEZVnNN71OpQNzN17eAAARYRyHuXECQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmqAeWnPt0al7AGjs/Aj4HwJlseLgIrk3V/twH3nWS0RpCCd1U
	DXakKp7Vjdh0AleQws1KxgEx8jrWUscg+J5RzSAxG0M988Uqfb7Z
X-Google-Smtp-Source: AGHT+IE46PuAltnoIqw7EddONWrjHM9xv3Zdvz5L6wCzwu9Jw1e+3mLn1DpvovbhSwFWwhoREdC6vA==
X-Received: by 2002:a05:6a00:b42:b0:714:2069:d90e with SMTP id d2e1a72fcca58-718d5f0839amr1898716b3a.26.1725614015968;
        Fri, 06 Sep 2024 02:13:35 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717938470e6sm1927034b3a.183.2024.09.06.02.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:13:35 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Fri,  6 Sep 2024 18:13:31 +0900
Message-Id: <20240906091331.34244-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Hi Dave and Daniel,

   Just three cleanups and one fixup.

Please kindly let me know if there is any problem.

Thanks,


The following changes since commit b1aa0491fad27f030c94ed42c873c3f46f5e7364:

  drm/xe: Fix merge fails related to display runtime PM (2024-09-02 14:14:07 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.12

for you to fetch changes up to 94ebc3d3235c5c516f67315059ce657e5090e94b:

  drivers:drm:exynos_drm_gsc:Fix wrong assignment in gsc_bind() (2024-09-06 16:08:30 +0900)

----------------------------------------------------------------
Three cleanups
- Drop stale exynos file pattern from MAINTAINERS file
  The old "exynos" directory is removed from MAINTAINERS as Samsung Exynos
  display bindings have been relocated. This resolves a warning
  from get_maintainers.pl about no files matching the outdated directory.

- Constify struct exynos_drm_ipp_funcs
  By making struct exynos_drm_ipp_funcs constant, the patch enhances security
  by moving the structure to a read-only section of memory.
  This change results in a slight reduction in the data section size.

- Remove unnecessary code
  The function exynos_atomic_commit is removed as it became redundant
  after a previous update. This cleans up the code and eliminates
  unused function declarations.

One fixup
- Fix wrong assignment in gsc_bind()
  A double assignment in gsc_bind() was flagged by the cocci tool and
  corrected to fix an incorrect assignment, addressing a potential issue
  introduced in a prior commit.

----------------------------------------------------------------
Christophe JAILLET (1):
      drm/exynos: Constify struct exynos_drm_ipp_funcs

Krzysztof Kozlowski (1):
      dt-bindings: MAINTAINERS: drop stale exynos file pattern

Kwanghoon Son (1):
      drm/exynos: Remove unnecessary code

Simona Vetter (1):
      MAINATINERS: update drm maintainer contacts

Yuesong Li (1):
      drivers:drm:exynos_drm_gsc:Fix wrong assignment in gsc_bind()

 .mailmap                                   |  4 ++++
 Documentation/gpu/introduction.rst         | 10 ++++-----
 Documentation/gpu/todo.rst                 | 34 +++++++++++++++---------------
 MAINTAINERS                                |  7 +++---
 drivers/gpu/drm/exynos/exynos_drm_drv.h    |  4 ----
 drivers/gpu/drm/exynos/exynos_drm_fimc.c   |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c    |  4 ++--
 drivers/gpu/drm/exynos/exynos_drm_scaler.c |  2 +-
 8 files changed, 33 insertions(+), 34 deletions(-)
