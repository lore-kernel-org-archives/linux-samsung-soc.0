Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B014E29B204
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 05:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772170402; cv=none; b=JFfUQsDG8gzgZQfyfOLdiRIYCuhkTgBOnhNaTbrJ9q9KW9q8sCgTQuOAz7RZe/d+di7nB77BiqPf+iv+VtYsyWi3zb3iBHNDNbNiFTbAWDyuxMW4R0tSBi88pEbDq03WEpmt4QpaHlmJsjFcXrBEEQDrrtDO677HTqPw//L8+vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772170402; c=relaxed/simple;
	bh=E2KHb1OdTxay7BO0Pa0igqLoUMUgt4R2mfyK+qbBt50=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qjWrAmILtyeEoS0EGXbeO60xFEt76kM2io7nPwhFw7g41YEs5AUTQQwscclzCPKMEAvuP/UXJpSTo3zzqQ3V1Zlxdf4AK013KK8aeA0UxTX54hQgfGgS2Wiu07ijFsv5fGMHV2+7rBByTzSu0OuoeqCxgr2YZNkNVtQDmLVwo9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1biDKb2; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1biDKb2"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82746ed8cdcso685676b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 21:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772170401; x=1772775201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uWxM/NY1WZY/R2hcKtz9Vxhb3ZZqeiMM9SHyVrFFUDk=;
        b=K1biDKb25NftLE5deslSvBJjeGLRUUTQST+q1y2sbPIstYmAZOxid46ZheT3iJR+2B
         aG/ku/rU4OakKXEdHbui6yA+rAOBz6ORkutFvc4WvqZ77ekdLmYA9YWEFYPBZJNXKzyl
         TdaQuP0SNPcjI6E2ucTukIIFrMIW+OTpOJ0bx8FPSc3mZd034MvBf4Ad1likdOZISjzN
         yA0dshu2S2wNERX35l9oDZcP+bhGMgosIZajNyrXko/n736amLbhr5lAKuWCG7szcLh5
         2C+S5a6j4Gt7ToJ2xi2OCPSwwAO77QXb3Qyvm1MlY5Rl+FT/lBu7va085dwV0ym/R1TQ
         wCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170401; x=1772775201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWxM/NY1WZY/R2hcKtz9Vxhb3ZZqeiMM9SHyVrFFUDk=;
        b=LcaaYUUpZI26rCHdeZQRuUNfJXGyEjRNQyVJ1/OWmgvnzMGXfEAPrugcEXiC0Jk1K2
         Yg9peCRiP3OnaLVaPvdSNHhUoSggeqlkh3SjSRNJrY3ABbbwZz1o2fCe4ebC87LJso0X
         Iu90PsKdORAW6JeqyUH0oSYLwZ9P0j8Z2//GBFOwD3isZctzKQovSnbfsW7CBk5mH0yj
         q20gn6umUamzzMSEKVpBAj3uVJDG7qaO2rR80Kw5Z0MnOjOXOEaFBOZEKs8IXo21gJsK
         MUjCvJx/Vvvmj1Ne/s1oRPPzg6pQ6AH7GnoWrkmTCxGY8OXFHNVeVHEIeUIzSdbBE58Z
         gw3w==
X-Forwarded-Encrypted: i=1; AJvYcCWOab6ltERpS1WbLc6znnVpf6Utlj5IuDtkgxs7SrgDWd41p8ZS4cve3N7CzcA8Wd7Q0GCKRFUhvGGp0Qyt5m1UcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzsTnNehrM1fpsQ21LRfDEs5rWPGOrVvHzb+bmsCoebIK3vsNM
	Z0TdAZnpN8jTWNyDcemvJoHHk4eR0FTDI1ITjzoNSGuC70Xh71RwLZy1
X-Gm-Gg: ATEYQzwvolu/Rvla8ykMVqJAl05DeW65rYgsXnDykQRjTF9WNdgaiXSU/GcUrqamyRM
	ZZmr7z5jBK9s05v2mjl2hkRIcrg3/VjXh3XpL7eRhha7qhPx1xy8aGvnVn+Too2yWGW6iMKUJ8A
	0L+IENi6oeizAgcjxsqczuvtdPoxdm4alGxf2Mxfq3bmWz/Kn9sc0vXRZ2mMJSXU6Xse3zez3eh
	mr3CXtBg+qXKOM5PjWKjnpN7qfL2smFrxIHJZhLs5RiTQIr2C9nf4Zcv1yIhLWiv0YfOjyo6Mt5
	nm+qGKYFscnWGUQI1eTroEblI2l9nMiUx42GQNGW3eXp7GHFt/nW6VAyUKRPkJimm7MJHGENr1G
	zdz+4jNxCuMB1UxNgMo5wsXvgz4xMNsuW8hSHHFCnIawNphByTSF7Eu0QTdaiuIB0FbNoXZmpnv
	TIr09BBr/B+GzErYrnWAwnoQopVXEE9/EehIjIbKBuI5orI4Yzjg==
X-Received: by 2002:a05:6a00:4143:b0:81c:c98c:aeb7 with SMTP id d2e1a72fcca58-8274d972743mr1365727b3a.7.1772170401133;
        Thu, 26 Feb 2026 21:33:21 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a048615sm3815828b3a.52.2026.02.26.21.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:33:20 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.1.y 5.15.y 5.10.y 0/3] drm/exynos: vidi: fix various memory corruption bugs
Date: Fri, 27 Feb 2026 14:33:14 +0900
Message-Id: <20260227053317.426000-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This backport patch applies to the rest of the longterm kernel and fixes
a bug in the Exynos VIDI driver.

https://lore.kernel.org/all/20260119082553.195181-1-aha310510@gmail.com/

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 60 insertions(+), 13 deletions(-)
