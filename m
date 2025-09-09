Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D149F2FC88C
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Sep 2025 18:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757442244; cv=none; b=mNBoaNTDtCDtNSArJq7ORSJKdp9Zk9AJBhtVlZhqNQ5ajCrrrO4d3ZYSv4FmE99DNBUkF0wmDOK2+19yA1R0DFw76cXCyMZ/u4LGZILZDkaJvtE8Hd4JJVeaf1X4ORs+iRIhVgKhRp0d0RZVemu5hgsxt5xsbumwoeuJrumNwEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757442244; c=relaxed/simple;
	bh=PYpuE1bg3M8RrfKVn/z5QPHZvCyw0Q4F4OFmwIUXtHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HO3S/xmd/tyJrnmWjBhT2vJeU0QJX8PMdXNqilPV8zFg1nSJ1OPRKdgBVnqMDSPtjguTD7uvwTgHwI4KemBVzaHF31FUlA9r0CvgDFm0pghNvnjnGjKW9J+IfCANpBP/EaBw+yb2sctnA/WsOb3U2HGzX/dGHhO+vQBxRUcMlSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xzuqNp9o; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xzuqNp9o"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55fc2236ce0so1110194e87.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Sep 2025 11:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757442241; x=1758047041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WWPK6qiwC5pY+gvwfZR7zxOqiXiBtA6mSbWCJx8aeqw=;
        b=xzuqNp9oqvc7OsbdmnMzIjQ01w1yndPRuc9R/gAg1YwZG/rRF6tj2LSkhLJ1j30olM
         bhT7B2wls3EafIP7H785zroYx8dUPbQi4rmOsYj4tKT/E2Zdyw/fKwOkkxs2EeYS1CQn
         ILPhs0Fx5KvU0+wpnA9l10KNQDxSZ8UHdKPyaEmffnl9pYGi8yZPG/d4ouf/uEpBxRBB
         irjuDG0B3W+NHtzQfZAlBjPkTh1o/cC8vfTf/OL14O/AzQ+ZHgvxlJFnSENPcJ380rtl
         HUImEDOmtop+YVmksVXk15nzlSTupf/PL2EGaZ4SgrlwsLNWHwPBoQXuhYmjM3+QG56Q
         Udcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757442241; x=1758047041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWPK6qiwC5pY+gvwfZR7zxOqiXiBtA6mSbWCJx8aeqw=;
        b=fj1lhJA6sZ4dmdcCcuTKUuNZxnZFizFxGOldtXcb9QEHwlbIN6HEoJx602FMto6cvL
         m39qBqPtqjB9HxNZj4sgXUWrSwv+NrHPvGm+BJdFYpC3NpOOZDuKBtnqAXI/14llHoDl
         VnMGZOCf/PoNmzOycHF5dEhmyqtYpVFORShFzVK6DGWDV2Q/NHEqcOjtcNDMfEHe/3VN
         WaJTACZ/HB4JWNCthsMbXVw5v+BRL+o0lcgzHpMlZsExbfLLIDOikGkwD0PiPKhIM0/a
         2cprXMUhMDCvvZRJ/Zm9eEAlTh550Hb85JNDp+UJDWeFUQII46HzoUhe5SKT+jF8KiGV
         jmdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHzRMrZUQ5mGi/FnGVlFWQ0dC35m9yw/SyZ0Yem+oTH5D0vt6utkbQMW4yYzWqzw0PEB3YsBpUMvUfj9UnAO4ySA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYLihQ1a+pyQdv/eC4sYJxARQacmlwSVCOgkqs00k8iwDrwFEJ
	2iiNpDYKwEDpc2KhTUKZ05xHdCMBfmAr4ORYw6uhEEElxAvuF6kFZ5OCVVk3PQBb7zc=
X-Gm-Gg: ASbGncuOnY+VwbTmkWBALVHWJ5fUDwAqPXg8T3NClfiOSU2DKV6EUGeES2WszgXK+pz
	epWRCsasIHd3F+IeU6Ef+8uxLFsP0a6QqxbXB9/PzjFFMmN7wBxV9mfZCUXb3h1vVwhc+ilMyFC
	LZ9X/vdZzJaQTy6wKjBlnpQzMu0KCGf1RiIkvoaI+uVv+0pcSXWzxbNmerzDVOM/FoDPOY7wvG/
	6V9vb0uaYTVtDTrqAUsCK9xn1tKeJKJ1O8rz1vSojyI92EnBMhC7m6IE7J9codnPPyW4cIdGvbd
	Z/jqdAseXHO00qfi/nVnATouy3889NN/GNOljYuUycKRKt0bwfZdADJ7crCscyYciW5JWBHiQL2
	ANSHQ+T991mijOnhsgeJIZOszQ5cIAP3ACA==
X-Google-Smtp-Source: AGHT+IFKUMj2Ann+5FvQWmTru0FFpd1c0y5YYx+6dgpjzz3R0gwegHovdsmJzRrG+FbV0JmNIFTadw==
X-Received: by 2002:a05:6512:61cf:10b0:560:986c:9b4c with SMTP id 2adb3069b0e04-56262a40f5fmr1551769e87.6.1757442241028;
        Tue, 09 Sep 2025 11:24:01 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5681795d757sm676071e87.82.2025.09.09.11.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:24:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] arm64: dts: cleanups for v6.18
Date: Tue,  9 Sep 2025 20:22:56 +0200
Message-ID: <20250909182256.102840-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=PYpuE1bg3M8RrfKVn/z5QPHZvCyw0Q4F4OFmwIUXtHo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowHCA48KtemWMzw1tyv2NmUMBfo7b8GHRTLSZU
 QGFn/XMqgyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMBwgAAKCRDBN2bmhouD
 1wcPD/9nMH+muQgC86bN7iFNvLm+8O4InFbUmjf+AamXpj6CNoZ81ArlR0OgqmaG696pZh8+RKz
 r07DvRWDwSg2rSA1iAc6r45EvvPa2RCLFujMCLgp5llAixbu4GGVn9xvr9/bjUtqYIMcv7l8Xt7
 VGZouaW2YwL+t/wgOuBuA4dBvO805/I3XOwpXsADwrBfXtUEEH5Dr7dYeULkMB6HyQTYUWqaU8e
 mhnxKqrpUeF46mWVV1O7SWPswl7ieI60I6pmfFmn7eWbis0K4ihsCE3VcM9wsbT+OxkWcO5F+WE
 Be4c1TzYiMA6vEzRkiMFo4egPhwxfdYp3eaO2DyXBTCoNjJmmc4Ymfy+pKvCxTJ03sl6rEpsbfQ
 rOJNaon/J4sU0pz7pvecYodoADx9U8Y2RKpCqt6S/215BEOneyXDfIu9lMIEgoa2tpomeo4aVi0
 NSKYCbqjowjxRQsEwXDTmRteMjDyLAXgu517Frl5nz1B6EquOMKNecVjF0m+rJ766gonkY3frfF
 /TcJulsVdCrV90Nf/NCGpvCfa8WGrCtjAOO5oiZ/SkppfPy7K+PWIcdONYAwDIKJ8jwOhg4Loc2
 t9j2UuQUUXiwx8rqagzMLmCpJGn+Kud/g1/etDtKEWAtVHXDKZiUSX7zUu1KftuvbgsMH6AsvX0 KY2NQzSXvxETe8Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

Few cleanups which were not picked up by their respective SoC maintainers.

Best regards,
Krzysztof


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.18

for you to fetch changes up to 7ee0f223cabe9b9384250024fec577c731cbcf72:

  arm64: dts: toshiba: tmpv7708: Add default GIC address cells (2025-09-04 15:50:47 +0200)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.18

Add default address cells for interrupt controllers to fix dtc W=1
warnings on Amazon, APM, Socionext and Toshiba boards.

----------------------------------------------------------------
Krzysztof Kozlowski (6):
      arm64: dts: socionext: uniphier-ld20: Add default PCI interrup controller address cells
      arm64: dts: socionext: uniphier-pxs3: Add default PCI interrup controller address cells
      arm64: dts: apm: storm: Add default GIC address cells
      arm64: dts: amazon: alpine-v2: Add default GIC address cells
      arm64: dts: amazon: alpine-v3: Add default GIC address cells
      arm64: dts: toshiba: tmpv7708: Add default GIC address cells

 arch/arm64/boot/dts/amazon/alpine-v2.dtsi        | 1 +
 arch/arm64/boot/dts/amazon/alpine-v3.dtsi        | 1 +
 arch/arm64/boot/dts/apm/apm-storm.dtsi           | 1 +
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 1 +
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 1 +
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi        | 1 +
 6 files changed, 6 insertions(+)
