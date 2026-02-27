Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3859B3290B5
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 04:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772168399; cv=none; b=bEv+7bCq1P3jD1eP+GhCpxas6AtE4tHe0vKvKYL5+NKwiQP9UlENh4DX/DR7yob0/+/2aGTH9S8H3E/Vt4o7piLhgcF9TqoMmdc9TNobKbLWnaGEE1HV7BFw1t4fyj9j0PCzwckBUXWg/LJ2eXRPv5BzUMFRifKwuH7TcRBQraE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772168399; c=relaxed/simple;
	bh=kNhN4uiLU9hWF7ojHUliD6F9I+s0BzOeel06kok/oic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rAt6pVXTepYDYf1U05Mciol7fr4ZmmRcAMpSBMXh3zsblxJ7gmHZbqCgmuk1jcTBTHKd+HxxevRRVDw9l56nggV5Ng4rTKzVGABo5Tn8i+8OfVsQpRi9sWgoHqY4ML/BzOhRWtmbHtwwin5QvKNcgDelV0xenBRJC4WTWHYRTHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRowTCz5; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRowTCz5"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81df6a302b1so1909461b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 20:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772168397; x=1772773197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9M9yKCPLn+iVOORDFLmMfOISzVgCjsTOG3aAkzJLHbw=;
        b=QRowTCz5UvNH7lKSH4foUx6PiucBn1NG/6dXaU2yf4zuS2ww/WAss3fgmwBFTj86Ac
         v8FxkNGo2RNKYjbY6t/Jm0pY/n2n/ViUDX72hrzxHsHue8Kj0RwN13CLayyYO2E5UZuN
         s8u7Br/LHhbnBgG535JhwUd9/gBCfbpJYYGA+6kLM81aXsm+zU1qzJWOY+ZIR6uyMW8E
         AJ7YCylUgcItnJHNvJOKeieq6R7mLoDZuW7joJg8O3nGm4ZFA/RcMeEZwLcbLUZH+MGa
         pdOFZK/7DYfyvrOcSk9eFeoJvtKYPOnqTqiL3GiRd6CW4njBvBf7AoHrKiINwlIA0NAV
         Fldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772168397; x=1772773197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9M9yKCPLn+iVOORDFLmMfOISzVgCjsTOG3aAkzJLHbw=;
        b=RLgVhcKlBVhKoLC0BlKktbOflOw27YYZ4TmLvN95mf43BnpptPGvJUm16gy+iOZAre
         yT3VgftaOEBuudzWSpl5zoK946FcW6iIJ3PNsMG26PdyCt5JhZ18LNVQuXznbN9CRFzu
         4cwlV6cSx46ssnYtntd+ARfqZd5Mpe0jwlM6JUBe21eT18LfgetIuKArKa4ZkoqNJoX4
         lU8hnEmASk5bXXhaP2sG0asnaz4c81Pzf3gtF/scFL9BPCoso08tR9UkOSuih5f68I/D
         Dwptf5a3XrbYyDpUkdUtCkZxurKAqVrJFeqb0uedmKqD0sIp9jShQXmy9fnyuqD6g6Or
         PZ2w==
X-Forwarded-Encrypted: i=1; AJvYcCU7aaanO17HcPqKy7gigikNAtQOh6g0Emz4/4elIv8wy5yj1N8YR05RXL+lUzfgD3EIJaO1pDFlB3Jfw44FQHlY7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg6RiV77Hx+vg5XomCNvLTCC4K5qr39o6kpxCjgJjny1uBRpWi
	F80gGJdZp51nzrYSjmPj0pPrbehjG6GYc9zQ2r5yt+zy/eb7zz/3qvYB
X-Gm-Gg: ATEYQzyvsRXqUBqPVJ/RLQy/RF746hTNUTmK8lGy0nDezjOSgW2iKr+L5mmitZxGOnT
	71epnvMZ3eeh1uaYCJBumo3tFyFUpOloS76K5ezujUlj23MM+HlHi1tRHQazROOYv20PSdL+AOV
	VELgEyDwuYVDHEE7ae/QZgpYBOAbeHvnC/dUO6Ax5rlq4UtQ2v/fg/p8tmr5rtRGPGGZ31hHh/q
	OQi63q8aQhOhp/YNq/ygyIq4kDpeNk3j2OqtyeTv5OQj74zLHQuAiK4QrnsxEUDD41OIFZH00Kd
	q+PP5/M+Uvs7NEa19fAsgtEeKJ/rB1xIhL40F8K/kqozrdx6ZaDQZIz9plvX40rbNrsc0N4Lyo6
	tvyfJi4aMGGWqGaDK/Dl9G3ARe83XYR8GJVwj02A/3AoW62EX3nDXdBoc/QWCM35FitxLGaWMK5
	hXDR8sGuLn/OblEOBSOmBQQFc4eZEUolpcTpB0NyZJK+UcEfW/uQ==
X-Received: by 2002:a05:6a00:4390:b0:81f:4566:cce6 with SMTP id d2e1a72fcca58-8274d969893mr1442557b3a.28.1772168397546;
        Thu, 26 Feb 2026 20:59:57 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d94de6sm3966543b3a.24.2026.02.26.20.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 20:59:57 -0800 (PST)
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
Subject: [PATCH 6.6.y 0/3] drm/exynos: vidi: fix various memory corruption bugs
Date: Fri, 27 Feb 2026 13:59:50 +0900
Message-Id: <20260227045953.165751-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This backport patch is for 6.6.y only and fixes a bug in the
Exynos VIDI driver.

https://lore.kernel.org/all/20260119082553.195181-1-aha310510@gmail.com/

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 60 insertions(+), 13 deletions(-)
