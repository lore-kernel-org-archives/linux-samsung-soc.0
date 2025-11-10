Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52EE30C378
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 12:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776843; cv=none; b=YWxPsK6ZCxXfmTDgRmBHs9Y0c09BEUPqhfq/dgLxQoYA0nR2+4l0VwNO8oSW2ezvvqEMBr7JOV9qhVIF2wXJ3iFPVNdi6yAqZoBMNDvjVtD2ZwPNh2EwSAEeXeHvd5o9z8v4jy6t4z24qLfk11SBjgiq13dUsxVeYXToMxGeEBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776843; c=relaxed/simple;
	bh=qREVua0utpq+YZvmhL+Ya7K6Nf0fn3TdphYcl7/IDE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sc8qnzRZdVfAbjb7pgoAulVTMeCwcKQXcolDQzTzizkPQ6gwg5ac2XprxnFtgqEL0oHm5zn4lPWX0nNpZm6SEjzqBkGw6+mjnEsQa0zRvf6x2Wkh1rFCFht7yeIALrIYhhRm1psMC/SIHsR6GNDj+pJ9bcWNk1D7LwkfL9VN6NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nU7eUags; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nU7eUags"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b2dd19681so425094f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 04:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762776840; x=1763381640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZYqRjVaj12Rwfz+YvwhOeiNPIo0M3pzZ+YRjVz31v4=;
        b=nU7eUagsZKm7TyOujt7rIPnYo9iYvfr4TbTKv0zjjIQKnieDqhaZB811p2/9BQt1+/
         kiLDtFf6aEuvb5w1jcDdejNSXzo18ue3pHnftIzLjRn9mpC9Vs4cl1itOJuAiUm/+9KC
         9mm0R6hzHWbgEV7VIUg46ugkoWGbrCFegXI6cc76N57hqupMSGuqsLCzxXTb91STq5NZ
         YJc3SiT++dRkHBkmqocCrGajtYkjDCOQho9XiUEaz4gpo5LBZzq5cVKWL54tesDfERa9
         s80jzF2y5/PC8aMezyvbXg5k1V8tMWIHaLgap/K6ka6o9N5xOumK0XVkwkg9PS7gp56u
         5RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776840; x=1763381640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gZYqRjVaj12Rwfz+YvwhOeiNPIo0M3pzZ+YRjVz31v4=;
        b=l9bYtBqduD1eFaCgYmFjehlzAQa+HLpCpNnhmebWkWe7wu79sf6TRD/gGitE5yK/nE
         VVeVoy2/tjOOuARj2Xi6OtCdV4jDTeYeCCrbI2euF1IT7Kd8JLCM0Pc6CVhWDAf29UM3
         Bgh74Wa4RTngJJkDUzIlxYuIi+XescrFg80MnDE8sfPjyt29XghzmSZeA14hQt0C40Ba
         l76zzOaFSNitxT1Fv1K4FB2yjtq3/xbLqTtiF5XqFB4aBAzfJDV4SBzAe0DcmduvwZSZ
         BFUIKw4+pmxDN4dDordqFzEHcr6pzhNgQkPLGoGtcMMdqn3NkTKRytu43vB0ZUvIZ2k+
         gzYw==
X-Forwarded-Encrypted: i=1; AJvYcCWxpBJmnHzlkMgZpuoFRgRaR8bYTOv+8istIloPTSU8y0FEv/3NO16aQ5qtPz88LRQ7dkVUwETU75EDVUqI9FYtMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLhDzfqMJZqtMEeKaTzrYDUaddP3cgLwkD6ILUWUvvRtlLwRVW
	Wr3PmaVt+ghT72dFo6B2e6yg2+++JlYeepyed69bTLqZuGDRvq0AIWrTta2m1iNVZM0=
X-Gm-Gg: ASbGncvkQn0k3kC5K/xPqaHNdxoIdJWd7rVekz2XiOHllaCtltu9SEMqRDAVBnAFa0+
	rZWt1XuYIDbHNEdKYtfOTF0E+v07mBiI+Tgrpnue5FWAOhrbVb8yVSFyajiZRE7+VmXko/taKBV
	oLHP4+1AoI0mEcTyH7g71OZcwSnuAWiQnXIuvGi0Zc3KQglWpkPWIS1C8u0stpzJqwve4pXe1L8
	FIc/WkX5lwWjXwPAOnkfophhKWp2nm2t8FiIE1E8bjw45ZJj2yiYNwrQe2CoNkMKH5IvG2/JuSR
	5w1Wyb5U/o6ivv/vFtXTHP/sDem1dh3Kjk9BZez/1mJxgKhT+cds6BPjwsKCNTTXtH8qePcGua3
	TAhaMJ3SKJ6Ff1S3gyv4ck9Pr0TiWToYsEq4Y05FEqRIgNQlNsioH2c13424eUeUMrecRLH9uVm
	iAUjOnsqHVP65HDxjZTDyZNg==
X-Google-Smtp-Source: AGHT+IHEd8nZjNA0zksARbjw0PrTkWPT8L56szVOaWlhb9dBQElJR9u7Z9rtolUN4RnI8j0Kd7HVsQ==
X-Received: by 2002:a5d:6408:0:b0:42b:3ad7:fdbb with SMTP id ffacd0b85a97d-42b3ad800efmr1071471f8f.3.1762776840218;
        Mon, 10 Nov 2025 04:14:00 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac6794f6esm24922667f8f.41.2025.11.10.04.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:13:59 -0800 (PST)
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
Subject: [GIT PULL 4/4] arm64: dts: samsung: DT for v6.19
Date: Mon, 10 Nov 2025 13:13:42 +0100
Message-ID: <20251110121344.120785-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
References: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3279; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=qREVua0utpq+YZvmhL+Ya7K6Nf0fn3TdphYcl7/IDE4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpEdb7uVM/PXGAmzuyeG8EiCnmVpLqyqKSsroUj
 d4lkN24alyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRHW+wAKCRDBN2bmhouD
 1xEwD/4wN4mbAz3TmG8Uj2sBGcutI7Unb9l7WLt0y4YvC1DQ46/hGZBDpUg9FYM5ikoyYyk40Lx
 bWpMPS6r2UoFbvdbB8unHQ4mFOrNmaIXe6ae7qXotQg4zx2Cshidw6xwiWfmxb7+qnx4dpK90ib
 51vCNOH5TcTk4FEHfhDa4dzWTEYWjWGudP7ph4OmCUq7syBkI0M7LCv22zeobctueoBS9orqH73
 N8hAXpuzcCaxkaTTNk7tyehHN9cK7CNUmOexoYlbnBnWSRAElltaR57uw6dJF/JzyDc99cvu+3O
 C8qwOgswZklHgy24jZ7c6Z76k0Px+LrxcHuYruhkl668A5JrlkXHqWAOx9U+PsPImWraLTC8Fm+
 pkaLsRZUH3cEjzCMfJLCOudP64x7wkz5F5ZTW6WmvlDJJqdK6Xj46UH6BFDZ6EkMXJ7Tsk0uzja
 1vNGW3T8SWzkptfY3oTNnS8rOsHbdjKT3cLqaJmULk5WkCecU9RBJquVnwCyfyN0Y/KEYcUSTK5
 J1BUDCtobDWXoKLqQHIiFekal9FQ6HiioyzYRf97UrLVUCZI0m+3AIP+sSFzEVULNrojKu3JWVk
 cizhMB+tB9UiTP3cNr+j09PlXRFOfxayyEmlxr1UyeTTACxlSn2X/4mqgYcXjrgNrgtK+b/mycD 3yWl7WfKySy1INQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.19

for you to fetch changes up to cad767a9af055c921e29b7b268f99e83c82baab3:

  arm64: dts: exynos7870-j6lte: enable display panel support (2025-11-05 08:23:56 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.19

1. ExynosAutov920:
 - Add more clock controller nodes.

2. Google GS101:
 - PMIC clock
 - Mark ACPM (Alive Clock and Power Manager) firmware node as clock
   provider and use its clocks.  Add also Devicetree binding headers
   with clock its clock indices used in DTS (kept as separate branch).
 - Add more SYSREG (syscon) regions.
 - Correct several blocks address space sizes and APM SYSREG's starting
   address.

3. Exynos7870:
 - Enable display over DSI and several display planels.
 - Few cleanups.

----------------------------------------------------------------
André Draszik (1):
      arm64: dts: exynos: gs101-pixel-common: add node for s2mpg10 / clock

Denzeel Oliva (1):
      arm64: dts: exynos990: Add sysreg nodes for PERIC0 and PERIC1

Kaustabh Chakraborty (7):
      arm64: dts: exynos7870-a2corelte: add bus-width to mmc0 node
      arm64: dts: exynos7870-j6lte: add bus-width to mmc0 node
      arm64: dts: exynos7870-on7xelte: add bus-width to mmc0 node
      arm64: dts: exynos7870: add DSI support
      arm64: dts: exynos7870-on7xelte: enable display panel support
      arm64: dts: exynos7870-a2corelte: enable display panel support
      arm64: dts: exynos7870-j6lte: enable display panel support

Krzysztof Kozlowski (1):
      Merge branch 'for-v6.19/clk-dt-bindings' into next/dt64

Peter Griffin (3):
      arm64: dts: exynos: gs101: add sysreg_misc and sysreg_hsi0 nodes
      arm64: dts: exynos: gs101: fix clock module unit reg sizes
      arm64: dts: exynos: gs101: fix sysreg_apm reg property

Raghav Sharma (2):
      arm64: dts: exynosautov920: add CMU_M2M clock DT nodes
      arm64: dts: exynosautov920: add CMU_MFC clock DT nodes

Tudor Ambarus (4):
      dt-bindings: firmware: google,gs101-acpm-ipc: add ACPM clocks
      arm64: dts: exynos: gs101: add #clock-cells to the ACPM protocol node
      arm64: dts: exynos: gs101: add CPU clocks
      arm64: dts: exynos: gs101: add OPPs

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  11 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  58 +++-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  39 ++-
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  58 +++-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  84 ++++++
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |  12 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  26 ++
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |   7 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 315 ++++++++++++++++++++-
 include/dt-bindings/clock/google,gs101-acpm.h      |  26 ++
 10 files changed, 585 insertions(+), 51 deletions(-)
 create mode 100644 include/dt-bindings/clock/google,gs101-acpm.h
