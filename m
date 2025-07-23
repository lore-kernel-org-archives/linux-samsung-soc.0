Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C47283C8C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jul 2025 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753261507; cv=none; b=P6hjeBdjL3/lBFB5VR8CYEimGgCe+KoteqRQdtH8AyAEQVF981nTTQsyfBFXIhgKmHVQ7zkL8kzf3CABx5CXhkYR58AjPE2T7K0k8oay2UQ9fC0SCAlrEqNUYPPgv79Zz/52QwOrKZH5Soiz+Ar3ni+SCxBw86IshvTmmmjdsXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753261507; c=relaxed/simple;
	bh=k3GjnkVYrP1B4aQik37L6qakXOv0eTA+cuGhbBu9yp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psPuB1n2GXxZ7JdvKgmmHW4z/ujZlTs+SAzE0eWajCTIrOH5HUq9E9y0He+YlLmwo0+77YflJpP9xGOQknsg2tlXrz065uMz2Gw77NxJp1+bD8qL5XYZIB012TEjc5GVu0GRxWCIo4UzqCFAN1krtPk8lCDyr4WXi08Acb1fwEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FJ63pBtV; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FJ63pBtV"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae34f43be56so129956166b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jul 2025 02:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753261504; x=1753866304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCgbja/gOTY6PAB9qzS6fOz3VhDsGQwTh8VHxpGStNo=;
        b=FJ63pBtVkQAyu7mvzuj18M7GkLkfgk0Q0nN7DizSc62/ZrnjpNUBhHW+1Jn90X1e8C
         HX+78PHoZLew1ncvpYZQtn1KUkS1L4GWMkGC4PPKPRHI+QILc9d+VVYeoyPHR3xJfL2D
         M5yWmBiKtYITLQJk2hPNtBnSzdl/FHnTw4DpKwLZSpd/3dUiLPbcBVFbsSGfjQuF9tbB
         Ox1cSq+R2FVn4etsXNmqL46zt6oIQovdUyaEIj5rqlxDfUg/g0+zcq9cBlSkeYr0JIPh
         IXJn+cdKasm905Z+A7u0qCFBFFrvvtEl3mAgjFiix12NGDx6pwePclkzBlQQLfAiRXS7
         Bbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753261504; x=1753866304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCgbja/gOTY6PAB9qzS6fOz3VhDsGQwTh8VHxpGStNo=;
        b=BweypQ5iZ2CiZ9pt3s+Yeaty2m9RNCD/yPF8FWXIvFN+y4efzWgffx4EkTYO+7kr2u
         Nra/zHeIkXOLJThftaK/DEYA0E1pvzFhhRWaTJ0F/bEgbtRBQszQoI/Wai/PkwUA0kZ7
         JYHiw/aCbQfRhh9NYEz4H3OcLnDZvcHF2lwYHptmGxaxReOXxMo4h1lztayWyEThuPYH
         xaB6nCYyirLxPmx0tTI14b0ZaHSobJiGZ1sDga3NNGP6vAPsMrtJKdc4EMVij8yOZmKj
         1l8f15U1XsUJli19aQc+ctlBSykNqHYeLf9BjjKoV6hGf1PBM+Rkxd5E0mS+Vup8gCWB
         UoIA==
X-Forwarded-Encrypted: i=1; AJvYcCWfnkhLa9jYfP2/YUenvKYKLciXVBapy2sUqEz1AXCmmti3MMUGzlYoo7lxza6iOrWCxlBDaJhsDQQth11mggZnpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7lz+Hx2Cl7yOKNXjd9AQb1A1u5aAWbbx5Wcp0QTvDLkLqM+As
	PoK9GDQZ32EwvHB78HGIQRdAWUSSYVo8RQxYrySXaputwUM33jawEl2+ho19ujcWdBQ=
X-Gm-Gg: ASbGncvzpTEPRUMXTiuz/GfsmReSm664WqU3BRKA7pE+/Rn/8uoVEAJKRzErsZttNet
	EXOgDJoBvylyN08I9nCuGlGgRMmr1eZPktTOP5YaMSsoPP1z5JfNUGCHcLQPyA9XhGtV8UZ6NDB
	Q04QTurC1zai+WjD7YcknWHQC29c3KBnKnuN3Xg4RZ/Qc1vi/Cc0pQf/Zo4JYB6eD6L6dnXC5oO
	DpMm3Wacu9LxDHGb0E2hcoAi3m3PGajgj6YvJIaScy3thhZ0RpGfeLULzo9trrd8sO9wXAlVaYq
	8u8SSalfImzIMsvmXDnUt2iVRsmFr8QF6Mqp86W5foz2uuvoNt0geVTfIwcuvYsnwNmt/qOwxPs
	L7ym+AfGqjFUYE2CTB8DFBLlAQ7Ut+uno
X-Google-Smtp-Source: AGHT+IGDvi6weUHt1zBLFFABHti+LtpFg4sB/fcxjNLis7RjEwnRTt3JzWNz/nbQdoKPmX82/bVYRA==
X-Received: by 2002:a17:907:a07:b0:ade:9b52:4d84 with SMTP id a640c23a62f3a-af2f9171be3mr83211566b.15.1753261503791;
        Wed, 23 Jul 2025 02:05:03 -0700 (PDT)
Received: from kuoka.. ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af22f6fa6afsm208165466b.120.2025.07.23.02.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 02:05:03 -0700 (PDT)
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
Subject: [GIT PULL 2/2] arm64: dts: samsung: dts late for v6.17, part two
Date: Wed, 23 Jul 2025 11:04:56 +0200
Message-ID: <20250723090455.25295-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250723090455.25295-3-krzysztof.kozlowski@linaro.org>
References: <20250723090455.25295-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=k3GjnkVYrP1B4aQik37L6qakXOv0eTA+cuGhbBu9yp4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBogKW4P0UvirWoR64QHVT8sGAC5b3VZtif/zjju
 Tcgt15OsOCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaICluAAKCRDBN2bmhouD
 1/8/D/9g5Op+GBYMMSso3IjQEbVlUOXL50H08DRw5IhgOD8/JEC2MB9HI9A27GE+SOvvAuMn95N
 yAiQz2hEVZVBMhZRjSMvA/GgGL68YsFXodGDzrrohbVaQBX1Tt8O8pNZQg0un1MdSGlQk+xmEEz
 VAydxdgmYXNjp7x0DPiOKXgmUTtCBF2SI7l2gDJxZXbHeqx4J88M4eKos3AsLn/UPhiqOSbtOf/
 Vf/1i3bnQvPYiUYb/j+RJsA8O0Z1VsrZn+S81zDu+YmShmJ5K3hXRBPyhhFNvFiDSkEfAcfzh16
 ZhNgr+hH3eLnEBurn/mVIK3C86dvHdYHRRabzt907PbYvYewMqEHyciTIikc77zvJFcemeaKIn7
 NdTymOl0yn1JpbBmqQp3sz77KNHp872fGEBnPjNSW2GcrSERXkEYCjMi4MFD4QqTw/91G7z9AAv
 7jnvOxIoBDk3osWnb2TMCZgTgCm9pKnCyWsBfnm2KrgNVzAknGozS9iMV454DIR2b5Q+QiCltVb
 6/ZrFsnOuREufeR9O9esdGUlIh4T0uEawlYXyPN7/El2KsAWBhWLa3CxYFlBR6KF7p9Lmp9UQzi
 4YSy9Fs/jY70dFp+NG1E5y9nbX1sxvpyRYn0aCzBg+v3p2TqaMgjD/i43Z53S1X86c9er7h6DJg 1IkmyPCm1CfKkZw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request. Late pull with minor things.

Best regards,
Krzysztof


The following changes since commit 49a27c6c392dec46c826ee586f7ec8973acaeed7:

  arm64: dts: exynos7870-j6lte: reduce memory ranges to base amount (2025-07-05 10:23:36 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.17-2

for you to fetch changes up to 8e5bf103b3ada972ea890ae6aa2118ff9b8c321c:

  arm64: samsung: MAINTAINERS: Add Tesla FSD DTS to Exynos entry (2025-07-15 11:03:41 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.17, part two

Tesla FSD and Google GS101 DTS are handled via Samsung SoC tree, so the
clean dtbs_check rule applies there as well - mention this in their
maintainer entries.

Also, include Tesla FSD DTS patterns in Samsung SoC tree to document how
the patches actually travel.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: tesla/google: MAINTAINERS: Reference "SoC clean" maintainer profile
      arm64: samsung: MAINTAINERS: Add Tesla FSD DTS to Exynos entry

 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)
