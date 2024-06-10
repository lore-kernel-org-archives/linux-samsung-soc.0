Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5F7224F6
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 07:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718005126; cv=none; b=ascCcP77wi9S4r5V7qhSM2dFvfg3OAYszqHttjrBDX2tmPlZvhyGFKXfQwi1NbNKbLhnG3bdEsdNzwu4T7/hClezCnNs0Ywjm+++Jhb4AtAyLyrXBhFjecsPOsUzmCj32W53UOOMIRlx5mnPMlqqGQQufTV9swkiMnKtpITDCfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718005126; c=relaxed/simple;
	bh=KdYwW+f0zwrMeKGRegSFmZQDMvEAtriEte6o6Iugejc=;
	h=From:To:Cc:Subject:Date:Message-Id; b=SwmRMMDQ/IqQnLRJcV8WSLEncEyUdUc3ssHln/CnDHrcq1nNR0wXVi2jBn02Gcpr4nVdbyTgNibj8XF4LNqb96Nq7ilIQdPrRmCow2zQAXP+H/HeMtG/y6XOWMyz6+umTj3n0AM72C6cPFm+bmE0C+wonswESvKmjawXU7P8nD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxNSny3t; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxNSny3t"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f480624d0fso33346115ad.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 00:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718005124; x=1718609924; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEeYczgmKxylMukshxG6mWi27nmS4L72/ofau0FaVSI=;
        b=CxNSny3tmOXIGjK23AocnM7WBns19Qd3XLxBKd9gi+z13wlp7nN5Ze4JUyryNPkBqg
         1aj3ambqPBYJlVHUaz5EKOZsaQnDbNIZU2/B0XncfivMeUkYzDQNbCxt1HEZ5VHhhSnI
         ODMwP1hc1QpOomrG17jVe+4OnohUQD3EUbXfJ9x2K98sEVFBkhvtvDaS1/0qqi2r3BfB
         xxd14CBaKIDVftK4NXsoO1dkI63rF7iDiuZZ6PruumEmkSToTEL9gS3b3kjBn2DKV6Hh
         WyHyQpUm0Xyv3IJCoPmtMgFEphgGn2PdYaoKcemn3/IthOB8rwJMNqmBlZL8NiKs+bc+
         HnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718005124; x=1718609924;
        h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fEeYczgmKxylMukshxG6mWi27nmS4L72/ofau0FaVSI=;
        b=YVBiqfEl9Ch2D74Xdqo5FPbWurOPO2s0QjoF4+wJXYZBiginhVxL76un06MB3Y3jBv
         ZucygnlJPAh6AZ6dHV5u38gpNZUNS/IuzE8o0kOuOrIftq0200yTsAqY9RrsTbllFj/M
         wCYkn3zOn2CfRxFtMcrUBbDbApPhYMy7K40mK96Ii3XU/1mRx2WGttz7j6bpNJmb2KVH
         DXCgOMXvzpMBZfFF/n6mQtGf5mYTOx/KpngO2vRaq8cHkRqihMO1Wf74xej4UfrYHpS/
         wLMcYqD2NEy1gVdLAJv4RUJ/czmUjrs68Dez0WcflKQWqrJB/aRHYN88RfK2wWoyVH1q
         kBBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvdCoBm0B3CxZVYxURREUmRn13doxu30OPNDF+YtB5dORScBI6NW7gIVTqyqFkgVFdQOGYEGMmQlQuCGULcZyfI+Xxo/7sElXNSe5evYHUlsI=
X-Gm-Message-State: AOJu0YyKTa+dp8G7NQiAsua0UmmIE+kKw95DYeBMzONC0xXiFswy1g4k
	QX2k0dpj/elcDp4nl/+IfC8jdQ3HVaJ9AUF/CZ16+xVcdL7VXIrc
X-Google-Smtp-Source: AGHT+IHzTtNYHQERotEFnvwdsciHAGRVrrOcRqC4zBx7IkWX/kCXL7BDT1ZwLHdaBUAHJknASlMROw==
X-Received: by 2002:a17:902:d4d2:b0:1f4:b702:f143 with SMTP id d9443c01a7336-1f6d02dda45mr89178495ad.15.1718005123325;
        Mon, 10 Jun 2024 00:38:43 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7e5cc4sm78276175ad.235.2024.06.10.00.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 00:38:42 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date: Mon, 10 Jun 2024 16:38:39 +0900
Message-Id: <20240610073839.37430-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Hi Dave and Daniel,

   Two fixups - one for an regeression issue and other for memory leak - and one cleanup.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit eb55943aab89be99a26e34fc2175ebb3583a2778:

  Merge tag 'drm-misc-next-fixes-2024-06-07' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes (2024-06-07 08:40:58 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v6.10-rc4

for you to fetch changes up to 38e3825631b1f314b21e3ade00b5a4d737eb054e:

  drm/exynos/vidi: fix memory leak in .get_modes() (2024-06-10 15:05:43 +0900)

----------------------------------------------------------------
Regression fix
- Fix an regression issue by adding 640x480 fallback mode
  for Exynos HDMI driver.

Bug fix
- Fix a memory leak by ensuring the duplicated EDID is properly freed in the get_modes function.

Code cleanup
- Remove redundant driver owner initialization since platform_driver_register() sets it automatically.

----------------------------------------------------------------
Jani Nikula (1):
      drm/exynos/vidi: fix memory leak in .get_modes()

Krzysztof Kozlowski (1):
      drm/exynos: dp: drop driver owner initialization

Marek Szyprowski (1):
      drm/exynos: hdmi: report safe 640x480 mode as a fallback when no EDID found

 drivers/gpu/drm/exynos/exynos_dp.c       | 1 -
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 7 ++++++-
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 7 +++++--
 3 files changed, 11 insertions(+), 4 deletions(-)
