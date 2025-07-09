Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E776D221275
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Jul 2025 19:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088534; cv=none; b=c5FyvLb4jxQmaBvCni1Pp7e123xirkJ9qBwoM2GbPcFlRtjqu9gMajbCbQEUF4Clsx00JfoNqjkV3cX1sxqsSDaXMxG14du2YssT6AgNw8wEZSZn5hKUwqpH80mqdEASp9GtS+v4ayOPOeUiWQnSaOCjpzWOeu4MGXePcsTiUPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088534; c=relaxed/simple;
	bh=LBLtPnGLFKCmbpB+0VnZBJ/y17TkI+PJVcwVQLb1mgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItNh0c3bZBaaig1fueLSwH3buX+Wuh/51C6ysKtTGFgx7JxgB8OQcBObo/5tnPcYxsG4fCi4akkaSfo2jaJm5YWKGSkEhSH5BZFQIWdyXuhOZsErDgvcOyBjpDnvXLMSnziRcAkFI+1NLK3WMh8tcjkvcjH9vxXBoCHpgUvBEgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eKFNscQZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eKFNscQZ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453442d3a15so325955e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jul 2025 12:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752088531; x=1752693331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsSnIgBBZ1kBciUGilPIV4WsdrkG/yK/XMLgkUNs/ME=;
        b=eKFNscQZAO0JGj9Smy+wf6JzBAg2riV46d8nhiwbM2mvNTxacj3hNK3U8tVbtbniTE
         mjrR60Ob2j+/apcblPyEXwXxQXSx5DMhK+greNYZozE8UOetuEtY6blK5z/rYeoERGld
         tUTFxFrf+BO+S549OjDL+PrgWAtfA4an6xgf6WhVaN9AVTPWdPeFGb2soND6h+cHcjcb
         PVgtud38Rfv5v8AHu1UeSE2jmvt51/2SjJJVOO+UIgeVLFG8Z0HVVcuNE7CKpfihmxqr
         ReamdTcmlxwWHqBPAaZ20xhIK2KFLUEqt5GQv8xR5hVO5PhB4TjZKSVvyIvA5X42WnG/
         hImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752088531; x=1752693331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsSnIgBBZ1kBciUGilPIV4WsdrkG/yK/XMLgkUNs/ME=;
        b=OQfazezlK8H4lfCJr1yci8dQ1oGIBDWktplFIBipLNZpwscQE1EXopaW0oDlMbTX8q
         Bm4TnOSUwcZQXQBAAVXAZBRS8bhW+Z3FEe2Dg+zvOeYf3Xy8mjx9/MUUpYpCNAvBR7D5
         +oWkoCBUnjTEiXbgApx/+x0t92oiLo4+bNZC6vcD7DBIWLnjuBQEBlsl+WpxJBxQ0Ak/
         fJR0Ct83SpHWnxg0LyqRt0r4R0gEnPaq6REFlniTycYcMRriaRLXZOeQwF3LsYNYskeV
         PU6paTxqgSbzUBeWs4Rih0ZiDSeVvxn8Iu+4uh+eh+/b4YGzAV0Z+H81V2mYYuXBrVpb
         +E+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpGv8ntPx5LI5iL5N975xDXA/eJdaa2n+v6Pwmsx+Vz+9/38gRtHii564mEdLzLxUll9GJXYSD86NIXNwX/d+xaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6CeCkbsGAy6AB60ZMp2vJlyk1lrzX0kr3ZMUlBZ55/Hht0DRK
	ISYvK84g9GpCokFekV7MQ6PlaColoUvxGpxCGJCPyEIrnOetAv4xRtaVqF/eKfzFFP0=
X-Gm-Gg: ASbGnctwQc0IlwcSlTBADNSoNOg2SG7LIm6pC1kGvnXA9XSXPT6XZC5Ks+wTPQxyZxE
	8ilhUA405kZLQlPA6gqXToU5K8PJhNP2b3xew3njTRUlhzNmp9zh4bHqVkXMPs/KrebhiClH77M
	WcriS9rlb4Qkb1wOwJfF71s0WV5H1LKDZzJb4uNKVnZLBvcciwX/xtah9AaJCbT38J4t3dNt138
	FACAkgMDWpo5Ebc5vZqM4NEXi3M4nSnShQ9EN0UuUkeqP9S62LvkzMqSdVRfV+1tIODaCQg3sTK
	GdSKC70M5zNkHRMpHfmU6XJgHv2B96Zq8EE8H/86+Zjjp6ds+RICaocSKRL66U4ZOTcLhQuaF9A
	=
X-Google-Smtp-Source: AGHT+IEw+2/Fscn7De5ZvL2RlCEWtJ9eIRsrKn6Ngh3wy00p2fYxejGpstLQTHOXdLIlShkvStCcLQ==
X-Received: by 2002:a05:6000:26c1:b0:3a5:8ae3:bd6 with SMTP id ffacd0b85a97d-3b5e4576314mr1192466f8f.16.1752088531010;
        Wed, 09 Jul 2025 12:15:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285dc08sm17159588f8f.98.2025.07.09.12.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 12:15:30 -0700 (PDT)
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
Subject: [GIT PULL 2/3] ARM: dts: samsung: dts for v6.17
Date: Wed,  9 Jul 2025 21:15:21 +0200
Message-ID: <20250709191523.171359-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
References: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=LBLtPnGLFKCmbpB+0VnZBJ/y17TkI+PJVcwVQLb1mgw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBobr/MuYhtk8c9lMPkEtPvmo+CAlmyNqzC5XKsG
 etty9ihw6aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG6/zAAKCRDBN2bmhouD
 17IgEACQ//MMqhTUvXRVCfVpbI4nZNkn1RvBEh7W9Sj1SBLGztID8SkulO7Cf0l02iB3pzOO/Dn
 m2bWGs228g0m0mL2VsXk3hE08J8j2weor9nT77c3WmOGpv2H56SURP3bIuJNIrvWrs0GJ9gumjB
 3dR5PFESdOkbgNj6WIdVikTPhHBXpGfvoMXRZq+qLGUamca+1JdzOrgsEUYjGoVmMdPBji3Kor2
 tRYccxsqUZyw2HF28CeOMDHIU1F0voTj6U6K8Qeg92D8zN6E0UZxxFN8hxqtNicMKqiO7nZlMKA
 nfsDALvXuTDAu0M7BBbXFlQEYhuhGuvLjMJJAk+9yjgMhz0JDplURFo6JzTHCHzJYS737Ze4zH1
 f7K7MYgqco30pBfz8lKugotvynygJ1JAW21MPmTNnrnRszILRaw7FHBbfxYlOjU/CCm1P3pAwV7
 /Ex1M+V+Bp/x3SYrEdc/I2XjyEd57raDmhqgSpKFB+efOEUS/alwpewpOJJQ48zcq+ywRXyUUa7
 X6VS61wmqOXtSKLXm6UPnTpHNBd4NwiOdYyKcwZA6KGGfA0HMpfomV9Bs8LPYEEMtezmxWPl0e8
 VBQBR0Vyq2FohU4tVyr+goz9DGutUd8JIYXTSIe6JvKhTiUlIn90Bd1eAQc7/Tco6MD4CNYSRsE EFqv2w+iKTAuMwg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.17

for you to fetch changes up to a24cd2f207efa73d7ce8089ce4848aea99f48f6e:

  ARM: dts: s5pv210: Align i2c-gpio node names with dtschema (2025-06-25 16:11:48 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.17

Just few cleanups based on dtbs_check.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: dts: exynos: Align i2c-gpio node names with dtschema
      ARM: dts: s5pv210: Align i2c-gpio node names with dtschema

 arch/arm/boot/dts/samsung/exynos3250-monk.dts       |  2 +-
 arch/arm/boot/dts/samsung/exynos3250-rinato.dts     |  2 +-
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts      |  6 +++---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi      | 10 +++++-----
 arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi |  4 ++--
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi     |  8 ++++----
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi    |  8 ++++----
 arch/arm/boot/dts/samsung/s5pv210-aquila.dts        |  2 +-
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi        | 16 ++++++++--------
 arch/arm/boot/dts/samsung/s5pv210-galaxys.dts       |  2 +-
 arch/arm/boot/dts/samsung/s5pv210-goni.dts          |  2 +-
 11 files changed, 31 insertions(+), 31 deletions(-)
