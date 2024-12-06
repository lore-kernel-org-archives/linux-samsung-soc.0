Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBF620B80F;
	Fri,  6 Dec 2024 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499728; cv=none; b=Xmth//bBrinxAPFxaqaQU9BOMgW2k5kBZXv2xljbu6NXj9rpBkeUmMPdDLH8boRZqZpddiaszZnPxCKFfmVjtNdSktJ4wk2n5f80TpKJTpvnBaTTQscfs/EyU/NCQ/ymK+Kw9G2UYnKvYOCi4VubEkegbJtYN7ILwbJ6pau3a1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499728; c=relaxed/simple;
	bh=neTaqtoQH8oCbcDacsjTmUKBDT+DBo5JmI9hlb4ud6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rCb4idkQCnjUYVmmeEJUJDKQOGiJ+fOlXnQF1IeHAonfefKmVFVsirmPQ+pCKVVusZG9PKT8zfYronrukq+/L+KtWwI+mdgw9sYcteroe4LHEXJ5Z1ht7HNVdZEvAGDXCrVn4RKO5P2xtE5UEHPGbkemGeSKwMZ2wO5gTWqSLic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=ORHIgFas; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="ORHIgFas"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y4b9837m0zGpQK;
	Fri, 06 Dec 2024 15:42:04 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y4b902H5Qz2x9C;
	Fri,  6 Dec 2024 15:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733499719;
	bh=neTaqtoQH8oCbcDacsjTmUKBDT+DBo5JmI9hlb4ud6Y=;
	h=From:To:Cc:Subject:Date:From;
	b=ORHIgFas6siPawcjiGSl2faAqI+z1ld32cdyiu0NhLFcW0iK+nqnRcxSLbb+DYaDn
	 3p/U45krUVZfEi62GEvmQF80XtoaRD5eNJ7uGalOMs89OJZTn44fITUWRqi/ptXxLR
	 oGHvL/IRGoKeIoPq+3oBgI5z+D5XRZf+adCotywjwIlSgaGD2oM0+52nR/GDmnfMAs
	 Jarc0cfE/E/PErAeCbpppys2ttxfyF6k9ct9rzlE/5WjF5kzM0ewnxd/pacv6ekgwl
	 U778b8tBQtw1hyA0XCo4Z42zPWv8a4GzEx2cUXgP91TNhTnnCoTKgeZ5E39SOglkz9
	 UYoCQovZ9o0hQ==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v5 0/4] Add minimal Samsung Galaxy S20 Series board, SM-G981B and SM-G980F support
Date: Fri,  6 Dec 2024 15:41:45 +0000
Message-ID: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series adds initial support for the Samsung Galaxy S20 Series and also
initial board support for the Samsung Galaxy S20 5G (SM-G981B)
codenamed x1s.

The S20 Series feature a lot of similarities in their configuration
and internally Samsung named the common devicetrees in their
downstream kernel 'hubble', please note hubble excludes the
S20 FE series and Note20 series. To accommodate this, I've
now named the device tree common's matching the codenames
(x1s-common).
The device trees have been tested with dtbs_check W=1
and results in no warnings.

This initial bringup consists of:
 * pinctrl
 * gpio-keys
 * simple-framebuffer

This is enough to reach a shell in an initramfs. More platform support
will be added in the future.

Just like SM-N981B, the preferred way to boot the upstream kernel is
by using a shim bootloader, called uniLoader [1], which works around
some issues with the stock, non-replacable Samsung S-LK bootloader.
For example, the stock bootloader leaves the decon trigger control
unset, which causes the framebuffer not to refresh.

Device functionality depends on the patch series from Igor Belwon:
"Add minimal Exynos990 SoC and SM-N981B support"

[1] https://github.com/ivoszbg/uniLoader

Changes in v5:
 - Fix dts makefile order

Changes in v4:
 - Rebase from krzk's kernel tree to accommodate
   for the merge of r8s
 - Rename exynos990-hubble-common.dtsi
   to exynos990-x1s-common.dtsi

Changes in v3:
 - Fix oversight in yaml
 - Decommonise memory map

Changes in v2:
 - Add Samsung Galaxy S20 into device tree bindings
 - Add support for Samsung Galaxy S20 as well as the 5G variant now
 - Fix typo in Samsung Galaxy S20 5G commit message

Kind regards,
Umer

Umer Uddin (4):
  dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B
    and SM-G980F board
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series
    boards (hubble)
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G
    (x1s)
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20
    (x1slte)

 .../bindings/arm/samsung/samsung-boards.yaml  |  2 +
 arch/arm64/boot/dts/exynos/Makefile           |  2 +
 .../boot/dts/exynos/exynos990-x1s-common.dtsi | 98 +++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts  | 28 ++++++
 4 files changed, 130 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts

-- 
2.47.1

