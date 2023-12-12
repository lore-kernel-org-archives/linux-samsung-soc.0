Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vfa2gim7"
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78059DC
	for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Dec 2023 01:31:13 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40c2308faedso56422785e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Dec 2023 01:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702373472; x=1702978272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RT1JrNd7Xh9affKUYGufSKLnRgO9NCJPK/+u/p2YNSU=;
        b=Vfa2gim7NK2B2H3TZJyCk5KWH92vMvX4xcgvtduEVvE3t9oAOHga556PMvT1GqmQ0K
         HLbYS1ExJEtDLIgNYq6tmonIbzwbmCIUK1hSlUxDO0GOn/0vh0313XqBltuTfsVkPYLa
         oJrmoPmTQn0TKF0/vQiff7OOKQW8lWy3bQYqCE5GYuZophdffj0qR09t9mNzPTnZuoGZ
         g8iZ5cwP6MyuP9a2y/t6DH0YfpmAzhlquo9AncSBanvRqqzHkI3nFdWYWLDLTsDcermr
         QNwnluNpGZiB3B0Vk9WJPdRA6KMDI6l+6JXBeYyvPHE5xY1X1hXOxF9lzREcZgv03rKw
         c4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702373472; x=1702978272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RT1JrNd7Xh9affKUYGufSKLnRgO9NCJPK/+u/p2YNSU=;
        b=WpWj018SwLVt14nU8V69C9bpwB52IjGM+vTVzErTx9dm0aMqIWWUpVXFWLdCnlY9Px
         L/IeY0JU92ecJJLov6mGP5Ttyo9Vmm8aG5XA/24Y6AyH37Dd+i8LDJblvwnZ/Cq23Wcs
         P91HZyISnWntJKBUpkvhbTr7WlsnqMGmOiLNwHeYMfijn9P/MgduJEL/Q6doYikpv4Wc
         HjAA8KhPM271yXG2aqcXvXBCO5ReBXQZ5R7bbM9A/wDORb26rfV/Dv51VOcrfHr+1cYC
         CF6jo7AaMy+RHDJOkXC1FBJR6TcnFmEc0npndgaw/UVe0oBRkOTToW9ciNNarjDjeRsT
         MzNg==
X-Gm-Message-State: AOJu0Yxq9RA0tTtWOoD+6jTlEwYTkNgp/Yx0lJKLLtnCN2X7D+gHx2vq
	3N2/9R9pkcVtJcU1EFLpy3rqbA==
X-Google-Smtp-Source: AGHT+IE+ZwU5DBKg6w3fcvGqVzKaj0LTIv+2OhyE+F2zWYVgLYYHgVdm+n1fqLqXnuQ5cuFqTfN99g==
X-Received: by 2002:a05:600c:2d52:b0:40c:2ba7:ee30 with SMTP id a18-20020a05600c2d5200b0040c2ba7ee30mr3122570wmg.165.1702373471932;
        Tue, 12 Dec 2023 01:31:11 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c46cc00b0040b4c59f133sm15799711wmo.1.2023.12.12.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 01:31:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] ARM: dts: samsung: Samsung for v6.8
Date: Tue, 12 Dec 2023 10:31:05 +0100
Message-Id: <20231212093105.13938-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212093105.13938-1-krzysztof.kozlowski@linaro.org>
References: <20231212093105.13938-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.8

for you to fetch changes up to 50c7cdc9a4d2d21373c1ab52c131109ab30c53f5:

  ARM: dts: samsung: exynos4210-i9100: Add accelerometer node (2023-12-08 20:42:17 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.8

1. Exynos4212 and Exynos4412: Final fixes for dtbs_check warnings.
   Replace duplicate PMU node in FIMC IS node with syscon phandle.  The
   old solution of duplicated PMU node was not a correct representation of
   the hardware and could have concurrent access issues.

   The DTS change depends on media FIMC IS drivers changes already
   merged in previous cycle, thus it is not fully
   backwards-compatible.  It is a necessary trade-off in fixing wrong
   description in DTS.

   With this fix, `make dtbs_check` status looks like:
   S3C6410: no warnings
   Exynos: no warnings, one undocumented compatible
   S5PV210: one warning, one undocumented compatible

2. Exynos4210, Exynos4212, Exynos4412, S5PV210:
   Correct FIMC IS camera ranges and IO addresses to silence dtc W=1
   warnings.  No functional impact expected.
   After this fix, there are no dtc W=1 warnings on all ARMv7 platforms.

3. Galaxy I9100: Fix 12-second hang during boot by enabling regulator
   (real cause not really known), add touch keys and accelerometer.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: samsung: exynos4x12: replace duplicate pmu node with phandle
      ARM: dts: samsung: exynos4: fix camera unit addresses/ranges
      ARM: dts: samsung: s5pv210: fix camera unit addresses/ranges

Paul Cercueil (3):
      ARM: dts: samsung: exynos4210-i9100: Unconditionally enable LDO12
      ARM: dts: samsung: exynos4210-i9100: Add node for touch keys
      ARM: dts: samsung: exynos4210-i9100: Add accelerometer node

 arch/arm/boot/dts/samsung/exynos4.dtsi         | 26 +++++++-------
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 48 +++++++++++++++++++++++++-
 arch/arm/boot/dts/samsung/exynos4x12.dtsi      | 22 ++++++------
 arch/arm/boot/dts/samsung/s5pv210.dtsi         | 18 +++++-----
 4 files changed, 79 insertions(+), 35 deletions(-)
