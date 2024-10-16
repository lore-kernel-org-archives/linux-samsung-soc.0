Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941F11865ED;
	Wed, 16 Oct 2024 19:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729107314; cv=none; b=mkZi2UzZnqBoqjjFdru/2/tMezKhXG3kXEX2BOXcSTTlguISjLC/Ok/HyzX6SsIh4NfFbf6dBhMCiB3FZVgYSHls6CM8FMyyndzQRmiSUDIthnQWwXnhhiuHGEyjYn/ujolM4ffcingIrOSIvBOkG6XEE1zA1b91Bde259HOwAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729107314; c=relaxed/simple;
	bh=T4l6T1sfFxbPh8VEQWEhe10CmWyfl0ff4FRyl3jXy4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g2BPF9X2geWj/JoRCmL2j4SA6mlo50CL1LlZievnWAJlDixpI8vCReW3P//3PK0FQ7aldbZ+WsNZj2zoffim7bhXWUg8gLgfFQb7KD0ZQysTikSnnim3I+JMjz1ajupFxkTk4NooW5O+kkEvpju6j9q1pmNi9n73mlqaj4u42xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=lQp8IF3q; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="lQp8IF3q"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XTLlg38MYzGpL4;
	Wed, 16 Oct 2024 19:35:11 +0000 (UTC)
Received: from l-latitude7390.lan (host-80-41-166-50.as13285.net [80.41.166.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XTLlW6k5yz2x99;
	Wed, 16 Oct 2024 19:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729107306;
	bh=T4l6T1sfFxbPh8VEQWEhe10CmWyfl0ff4FRyl3jXy4E=;
	h=From:To:Cc:Subject:Date:From;
	b=lQp8IF3qZaHvQ1MX9jUuOgvpU8k060Isb22a2/dOqqN7wE+G4zTPBlbuUlZffNx7z
	 G991PgpJt36KJqC3GbX1yYwbq6NFuj0zJ0YClxhogoPBlr0VZj0FIF4ZMATzrSJtp2
	 cSI/7m+v3RCmaqnqymQjnwsHhoclTM6pWXEcMzGQXBjpeHzt1jSmTf0Zg49ZvH4R1d
	 XSXjpcKXzFMjqtKlHwUn42uUJY9P8f/IieUxu49/KPcaLpDuzp1yc96pWFbn6yI9xv
	 a5bL06Kn+4pbBlDT9JRbxrPCKED+AVXA1hLbKuP66k4WITU2Mw3p5lBQ83NKnZUrM+
	 n+dqLe4oatdGw==
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
Subject: [PATCH v1 0/3] Add minimal Samsung Galaxy S20 Series board and SM-G981B support
Date: Wed, 16 Oct 2024 20:34:48 +0100
Message-ID: <20241016193451.28897-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.0
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
S20 FE series and Note20 series.
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

Umer Uddin (3):
  dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B
    board
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series
    boards (hubble)
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G
    (x1s)

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../dts/exynos/exynos990-hubble-common.dtsi   | 109 ++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts  |  23 ++++
 4 files changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts

-- 
2.46.2

