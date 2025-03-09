Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69A61F8739
	for <linux-samsung-soc@vger.kernel.org>; Sun,  9 Mar 2025 18:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741546573; cv=none; b=H7U37B0YiluxmqYm8XsJJD7KNZ94cHBhkpALjoAHTJy8IlwkBjtrg6gKo47oPYTpX1Hj7+Fnpu+fXNsaN6lPOpKBxCdfEX4j9SBl2Oj825LxazA45i3g9wwidVHOZsCa52L4g3Troe6UM2q2NTF4OJdP0hI6hHjvBxvGCNTlgbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741546573; c=relaxed/simple;
	bh=kUxIzjT34djjsSWrouN9kcaq2cVWYfP4zf9wrxF60YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n25iYMSE1fJKC0jnwp1IADypbS52OM4l+FXZ8GPoZR+L4m3LrnbkDpU6bsXkeWPNZuhbY8Y5F4U8ICX83mLXy0JSvFMDnUL0onXnGHIdQwuOhcChZjK3UC70YQqq55bEmBDVtDjYbdPa9sRvGAy6V2jyTWJ7ygZ7xOMkb/iU+IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BUvAfBfP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BUvAfBfP"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-390e0f7b272so254729f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Mar 2025 11:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741546570; x=1742151370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csnV4M7t8mG+4gzOzlbb+RIrtUw1t0+Fx7m4dlnVHBE=;
        b=BUvAfBfPzS8V5fAnWkJ1+FUAenq+Lgdi/BXByG7jddMToWlLBusdiYntynvy17Lzzd
         aG5Alq7Ai0X9s7ghBLejAxE3irhkno0QvQMvOWPnlHfbIQyEg5UKcfjGuMHc7fXENqW6
         pwqETGZLEHYs0BCBCeHuj7OQ7QVCs0uU3x4jrXIi3cMD4GflM4kmg21fLp6IxnsIOHfI
         zNixhMvQxoOagigtHK0IJ9/jKdcyClc8VnZQ2XJ4JEwuYS18eZwpVzHANxnlbxj0Ei4h
         vyvMgRW56JzIKvHIvNUMW5E745TE8vdXY7cfg9iFCym02/yVwMcasEecbORouV0wAGas
         8OLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741546570; x=1742151370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csnV4M7t8mG+4gzOzlbb+RIrtUw1t0+Fx7m4dlnVHBE=;
        b=qaSjM4DQHrjCue8gTIOQk/jFGqZ+7reyjpeA0rKelK5N2cQPvp1NPYVLCKLECL61xK
         lWMi1GvqW3uCsKHqyN6PmEPkS6gAXSfw2lbU8RgJyJrHmcCR4FijWqJ65W5H68JzitPd
         6s/1HgsBx8CDmbR/2+Xgf0P82VA9Dz8IONNTTtpFcbLP4mWbBcVAiX/mCm7kFeen9Hb0
         CZwtSoZ7y7bxb6L9fqt9xkmlVcGaGTXWlt6JjbOzXqPcTaS7aCBD5CKCQav1pf8YjOmS
         i2IANxp6+8U4x7z+6ideZ2LXCETkKPDrcmD8YU0I93wQJzJvOot5prYevMh/1taYJ84d
         ouBA==
X-Forwarded-Encrypted: i=1; AJvYcCWrZ/n0GrhvMWGCMx7DQOqBcPaPVoYFSPNplSJZ0pkL0MsBoGTdHbYYXzhUefEoBQhsbOENSYfga+glOubF3ezt7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2iQL2Ui5uQvv716+inNN+ZsRtIyAkyXAWJjR8RunvYMnO6q5a
	J/CTyZsH6p7H4dULya5nhYJX3Pqwu9M8j3sAtw75q6ngHFcnBccKT2pWIKgJ6h8=
X-Gm-Gg: ASbGncsOzjHKB4CyCLvkXdxkLyCAzYnKWh+uFOKg4iBG+vDtFC8dsFtj/9lIvxJxiSH
	oIlZ7bCn0J//gPXjmfBDNz1lx4Tx+XLVKshyUvQjPecsnP2wrnMdT7mhT+bsaWFt4FotY5G6Bpm
	1J2cLmKs+eCXi1Aeok8XfelsY2rZfPA8q0E7bfMJa31M0BHybRmiYONL4yftBap/hRtPY0Twhf/
	ufcUt1LHuSc/ztD/qw5oEQfrsUjUnrhCQ6bCB28Vnfvpx687LOOxO+chmEWHlKhnpA6TqDzF7VE
	hw0ZOulzM5Jt+jb1XAoxMTlf5md3n+0poryqURsMWyzAQxgTmfmhxmvfziY=
X-Google-Smtp-Source: AGHT+IHOjQZl6au5AX9pwx89qj1PiY9uUWPbWjZhcAqE7l92MV4Sd5wk3pnxNKw3T6EVY3vWBvszTg==
X-Received: by 2002:a05:600c:3588:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-43ce6b12816mr15245875e9.2.1741546570242;
        Sun, 09 Mar 2025 11:56:10 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cee22c13fsm44263945e9.40.2025.03.09.11.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 11:56:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/4] ARM: samsung: soc/drivers for v6.15
Date: Sun,  9 Mar 2025 19:55:57 +0100
Message-ID: <20250309185601.10616-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
References: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-6.15

for you to fetch changes up to c8222ef6cf29dd7cad21643228f96535cc02b327:

  soc: samsung: exynos-chipid: Add NULL pointer check in exynos_chipid_probe() (2025-02-15 14:37:19 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v6.15

1. S3C: Drop linux/fb.h header.
2. Exynos ChipID: Check if memory allocation succeeded.

----------------------------------------------------------------
Chenyuan Yang (1):
      soc: samsung: exynos-chipid: Add NULL pointer check in exynos_chipid_probe()

Thomas Zimmermann (1):
      ARM: s3c: Do not include <linux/fb.h>

 arch/arm/mach-s3c/devs.c                   | 1 -
 arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c | 1 -
 drivers/soc/samsung/exynos-chipid.c        | 2 ++
 3 files changed, 2 insertions(+), 2 deletions(-)
