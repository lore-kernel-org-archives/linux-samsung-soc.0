Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868AB1F0987
	for <linux-samsung-soc@vger.kernel.org>; Sun,  9 Mar 2025 18:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741546573; cv=none; b=cnfEq8PsiRO8S2z3YowXd69XhmpLFA4IQwEx2mt5KgqyMPdU5iAtx0KCRG+BIM6JATr3x18gpexGUxKMkG1FoP4Es9GzkxaUqB9txqa7ByG/eFr/5p26DXPGDQU1myqoNtVDy1OY+L/+0BD8eSSXkuD08nI5JZXpl5xxDsDQVIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741546573; c=relaxed/simple;
	bh=PMxfEyfyZ/xtzQEVKECKbubBazRu2cYpgYqd02Y9UV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KofTgwE0DdFBDfpfdVEGBOnIcLVIxBHaHnRsmjwK+h4zgqhonCoPgUiLfU3mDlWtj8KU24zjEdP8akskevO3OuvDLTIfZV/bt7Ev8BTpj8sLMsX9FNhFWzWyeSicxni4WBJI8i0rW5ZnRM/NcyOF/0DNzzuGW98DXZ/1FJJt+dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FePMpa+e; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FePMpa+e"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so616575e9.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Mar 2025 11:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741546569; x=1742151369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKRLg92c6C6VQuMYXP20YZZyOfIPnqquJNnWGRCRNdM=;
        b=FePMpa+eZGb7wNEQN6WeyzksAs3Bt6YDyQo7FLS0wDGJp18/bILN+vuxJoLVrzflw5
         rUfgg1Osa/LEVSgVTvvxAeFpQl4QU9GuI2jdZAwLgllh6EA8CHBuqF+uaR0zJ2Oyq2Wd
         KcPwn9LHljIJhfXruhnrbM/Te42mj+5GjlZe+4oU7hM3HRF9RA2uwPU21Pyc/tumF0Kq
         8tJbxMXEQknrqAN/ogd8ZX8Ki4RnQ0nC3j8J3dbfH8bKKZJKyTjI2/k+Ozkxh2+Tgb9F
         F0c2KsZlbS4lE2821gtwtFrGzspeMv0vRPeeuukiI7klF3GNiWfRiKMSX+Sy3qaBMVEZ
         Jm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741546569; x=1742151369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKRLg92c6C6VQuMYXP20YZZyOfIPnqquJNnWGRCRNdM=;
        b=BRrzVOmOgEzPBEk6M6crM7+G2hsrSwkfo/2sbtDefr3dLRNSMgbLodPWjZRTE27WwR
         kjjgti/yV7HgqbcA3/5wd00Yh+0wh0qlNVa0ODWp8bBtfysYot7mm90pABJvyd5kZsYx
         oOsFTO6ZuFIKjxTYg1Kr1Im38skZ4jFPNiARYpVb2NQIxB8jkibYL0l4cNxoY+H8KVwX
         8BSrx6Xf5GBz8YYp3IV/o3SJ1h2EzH+usyyBNoXrNH2uLRSxN2ANFS6/JuRHP4t9ZXta
         BdiUeNxu71nVGnMPKyNduT1jZ/HEh9gOIyZBKuS/yBCCNVZyqRyyWsoz6qsk/MEALxqO
         oyIA==
X-Forwarded-Encrypted: i=1; AJvYcCUW023h+Z1Uq1ZQ3HLuZMeSw5XutLo/0v9otge4QKMBzdncaJn+5s6yRKDsg/4j2FaJQc9PRCX03fQ8rMp1e8OtNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMP/WtvvLTIZDhkXCCTgxddqRDQRIhmBpBnguxqz8tFHghqMmF
	s9X0FGUckwW0BAo5QxHTM9wD3g9eDTcKMERsNKKDo6eAsENe4KAafMY0MAIgujk=
X-Gm-Gg: ASbGncu3UPRB/GbWz9VVsxm9bPMwYIes71E+3EEnmlrDm7PQh7AV+Ne7YMMEC7L0Fi9
	Aowqs++5I2md9ueLY8Af54kasf3Tsmb9iqudAMD5XG/mRfhXMux5074ZNH7AaKQ+HKWg+Km4Gct
	Nuq7LsNJvSeqos4nYg7ac1TFFcl3BMGx7z3WZ3kYAJvrwlfpNk38JxIVdGMtmzUe1tDaDE0cMTb
	LqN05e3eSRz32uZXeE2UmT+jfArgnUTWvzUr0t19sdT9t4Cepa3n7OlwWNkE/tGjiyRNfuWrrS7
	F8xNa7mDCNvezhZzaodscTey4mmFiqpd4008OKlrPHqZ7gh9+y2NLFzvVnc=
X-Google-Smtp-Source: AGHT+IFgAZkZaPTg34kk+B+P+zg3fnOit9vmY6MmBLyv17DTPt6JikKSZWSxHbdBl0XNWFJgN8f7ow==
X-Received: by 2002:a05:600c:1da2:b0:439:930a:58a6 with SMTP id 5b1f17b1804b1-43ce6ef2478mr13617275e9.8.1741546568817;
        Sun, 09 Mar 2025 11:56:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cee22c13fsm44263945e9.40.2025.03.09.11.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 11:56:08 -0700 (PDT)
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
Subject: [GIT PULL 2/4] arm64: dts: samsung: DTS for v6.15
Date: Sun,  9 Mar 2025 19:55:56 +0100
Message-ID: <20250309185601.10616-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
References: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.15

for you to fetch changes up to 056106b030b73c7d53749469bd1cdbc89b4d2daf:

  arm64: dts: tesla: Change labels to lower-case (2025-03-07 16:05:35 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.15

1. Google GS101:
 - Disable GSA core pinctrl because its registers are not available for
   normal world.
 - Add APM (Active Power Management) mailbox and the ACPM firmware nodes.
 - Add new boards: Google Pixel 6 Pro (Raven).
 - Enable framebuffer and reboot-mode.

2. Exynos990:
 - Add PERIS clock controller, MCT timer

3. Exynos8895:
 - Define all remaining serial engine (USI) and syscon nodes, add MMC.
 - Enable microSD and touchsreen on Samsung Galaxy S8 (dreamlte).

4. ExynosAutov920: Add UFS and CPU cache information.

5. Various cleanups.

This includes two topic branches with DT bindings, which might be shared
with other trees depending on needs:
1. for-v6.15/samsung-clk-dt-bindings with Exynos990 clock controller
   header constants.
2. for-v6.15/samsung-soc-dt-bindings with Exynos USI serial engines
   header constants rework.

----------------------------------------------------------------
André Draszik (7):
      dt-bindings: arm: google: add gs101-raven
      arm64: dts: exynos: gs101-oriole: configure simple-framebuffer
      arm64: dts: exynos: gs101-oriole: move common Pixel6 & 6Pro parts into a .dtsi
      arm64: dts: exynos: gs101-raven: add new board file
      arm64: dts: exynos: gs101: drop explicit regmap from reboot nodes
      arm64: dts: exynos: gs101: align poweroff writes with downstream
      arm64: dts: exynos: gs101: add reboot-mode support (SYSIP_DAT0)

Devang Tailor (1):
      arm64: dts: exynosautov920: add CPU cache information

Igor Belwon (3):
      dt-bindings: clock: exynos990: Add CMU_PERIS block
      arm64: dts: exynos990: Add CMU_PERIS and MCT nodes
      arm64: dts: exynos990: Rename and sort PMU nodes

Ivaylo Ivanov (6):
      dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
      arm64: dts: exynos8895: add syscon nodes for peric0/1 and fsys0/1
      arm64: dts: exynos8895: define all usi nodes
      arm64: dts: exynos8895: add a node for mmc
      arm64: dts: exynos8895-dreamlte: enable support for microSD storage
      arm64: dts: exynos8895-dreamlte: enable support for the touchscreen

Krzysztof Kozlowski (5):
      Merge branch 'for-v6.15/samsung-clk-dt-bindings' into next/dt64
      Merge branch 'for-v6.15/samsung-soc-dt-bindings' into next/dt64
      arm64: dts: exynos8895: Rename PMU nodes to fixup sorting
      arm64: dts: exynos: gs101: Change labels to lower-case
      arm64: dts: tesla: Change labels to lower-case

Peter Griffin (1):
      arm64: dts: exynos: gs101: disable pinctrl_gsacore node

Sowon Na (1):
      arm64: dts: exynosautov920: add ufs phy for ExynosAutov920 SoC

Tudor Ambarus (3):
      arm64: dts: exynos: gs101: add SRAM node
      arm64: dts: exynos: gs101: add AP to APM mailbox node
      arm64: dts: exynos: gs101: add ACPM protocol node

 Documentation/devicetree/bindings/arm/google.yaml  |   3 +-
 .../bindings/clock/samsung,exynos990-clock.yaml    |  19 +
 .../bindings/soc/samsung/exynos-usi.yaml           |  99 ++-
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |  72 ++
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         | 956 ++++++++++++++++++++-
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |  92 +-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     | 138 +++
 arch/arm64/boot/dts/exynos/google/Makefile         |   1 +
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 267 +-----
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 294 +++++++
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  29 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  66 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |  26 +-
 include/dt-bindings/clock/samsung,exynos990.h      |  21 +
 include/dt-bindings/soc/samsung,exynos-usi.h       |  17 +-
 15 files changed, 1721 insertions(+), 379 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-raven.dts
