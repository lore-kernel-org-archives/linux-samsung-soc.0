Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293253B8BD9;
	Mon,  5 Oct 2026 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195426; cv=none; b=nI8dceUWodIUkpM2/1Evb/y4qzY2V8jxiv/ImxIzHWJQWWsSERx+e4oo6z61Y1F20IRs2tjL9AyV4u1xKWlQizasuWByIik7+lQQ9aOsTmatBh995qH/eZiX37h8kpvRjLePXM/sqULfWVEB0lTi/XeHgecQW3dD3DedGhEN5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195426; c=relaxed/simple;
	bh=cKhxjhjZPy5BthbsxNGJBD3mR+z9ZrRk5op393gV9VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q0Av0ycLSBlaRVjtv7MufjmTGJAKkiQUDkPXxigElpqAXGXhKDSOE/RYgTmFSSfz3JbgqzZWMYxuGz3agyaH5WdjoZKYfDpiYQaoBWhVrA5B4ZqbNlxbzNE+YB8rO/mIFXsjJmGF0OFQaoIOQTcT0DlunU7uuJDcM+vwPTpEj/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnbg9qsa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnbg9qsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C1C1F000FF;
	Mon,  5 Oct 2026 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195424;
	bh=mIyNrxYji7RcIsIgOpeC8k0CsXMP+tzrbGGH8eNPUTg=;
	h=From:To:Cc:Subject:Date;
	b=fnbg9qsa5b7tl+Ceo8yDct4/j/jPORTmoKxCytmi0l3aPtL4VHi/C+vqxUm0kPefy
	 AMbbKr+vsa54FCZ5ZQxBY1lT2up/QqfRKXy4HeVt4/LSBCMBSJTabQNT5wxwO3/Bgy
	 rkf8xoT4hNwkP7Hwq6eih97XfAXiv+5UwllVJYrWiqUQl25Q+mKw+pwKYAuwxbBINJ
	 hPXh+7XOnmMBXNOJGww//BOScVfoaHwiXoi4x8r5eMOUNjSzQFZ2pZq7ZLp2H4t6t2
	 PzZDrcuFsIXfQMjEggVWii/w2tlXf+jD/wJLBw4W4Q0ZqD5wTg4n/SN4khqjKAH16z
	 Eo3+yMfDTsI+Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64: google: New ARCH_GOOGLE for v7.4
Date: Mon,  5 Oct 2026 12:16:57 +0200
Message-ID: <20261005101657.34571-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2681; i=krzk@kernel.org; h=from:subject; bh=cKhxjhjZPy5BthbsxNGJBD3mR+z9ZrRk5op393gV9VQ=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqw3kZDwh/wvuX7RuHobbirDjbjOtf/zBNzhGtD GsikyiGAaWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCasN5GQAKCRDBN2bmhouD 11omEACKI16QIkVnwofkj2xe89Jsjul9o7318uzEIXFvlizQ7cnqh6d1U0cHZgg+YyNsMRWCzZZ wuMoUEx83uvzt2RtM9yaDCMsXRa5mPYNqypv7c4SgFzs3+SBljesMiyf95AUOQtbZelrstrpM4e axJWfhI60PcchI4/H+2Fz5TFZ7zzFSMH9RHI9cx+A1282DAsd+pOkQ3PkfW0X3io9QDrEUdfwJQ OJmfxP5792FbfhCrGaDWhtDQEMeL6Vgk6jM2AXMqrft9DglHms1dQqDWTOpsaTmQAcphVAJOHXe x9VsmDxkKZptgjsN6e6DtxGOmd0tuxvC6fn6xdUyHJG1FiZIQ/DZ8CRGi16p+p4Z+84dZXWPUpb cdndKlq49VhpxGjvS8svS6IgCKVVcdon27JyM+z8oInal6W9B6UCUGkEL9K2pqCmZ9xICseZu/j UoKQrcDuEI95ugIMLlW8HpG/S3SI8xvI5R2sCTsHurqUkTJ780p6iihwTIYoXxJUxNataD2LNgQ SjZTmTqNbZpmGAz7VquYpKBQ2zeBKZTsO0Q5Ur8xjdsDl9aJOOPrGAg3VyDkm574Ku0tdc0twBH KfIZDvmnss4eFiGtISxp4yM6dEDXxOogMMdu+AZ1S9px4tfH1fVB5iwq2nP1NyDNPtNBC1PrS4v R+x65YlbXeyoyjg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Arnd and SoC folks,

New SoC platform, in the future this will be handled by Peter Griffin.

Best regards,
Krzysztof


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/google-lga-7.4

for you to fetch changes up to 18686b294c6f6ba778cba66eccf01b9fcdf48988:

  arm64: dts: google: lga: fixup #size-cells DT warning (2026-09-30 07:21:35 +0200)

----------------------------------------------------------------
Google Tensor G5 SoC family - new platform

Introduce new ARCH_GOOGLE for the Google Tensor G5 (Laguna) family of
SoCs.  The very early designs - Google GS101 - were derivatives of
Samsung SoC, thus they were grouped under Samsung SoC.  The G5 however
went its own way, so no commonality with Samsung and a new ARCH_GOOGLE
symbol.  Currently upstreamed SoC is used for example in Google Pixel 10
phones.  Add basic support of three of their variants (Pixel 10, Pixel
10 Pro, Pixel 10 Pro XL).

----------------------------------------------------------------
Douglas Anderson (2):
      arm64: dts: google: Add dts directory for Google-designed silicon
      arm64: dts: google: Add initial dts for frankel/blazer/mustang

Peter Griffin (3):
      dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
      arm64: defconfig: enable Tensor G5 SoC family
      arm64: dts: google: lga: fixup #size-cells DT warning

 Documentation/devicetree/bindings/arm/google.yaml |  48 ++-
 MAINTAINERS                                       |   1 +
 arch/arm64/Kconfig.platforms                      |   8 +
 arch/arm64/boot/dts/Makefile                      |   1 +
 arch/arm64/boot/dts/google/Makefile               |   6 +
 arch/arm64/boot/dts/google/lga-blazer.dts         |  15 +
 arch/arm64/boot/dts/google/lga-frankel.dts        |  15 +
 arch/arm64/boot/dts/google/lga-mustang.dts        |  15 +
 arch/arm64/boot/dts/google/lga-pixel-common.dtsi  |  22 ++
 arch/arm64/boot/dts/google/lga.dtsi               | 411 ++++++++++++++++++++++
 arch/arm64/configs/defconfig                      |   1 +
 11 files changed, 524 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/google/Makefile
 create mode 100644 arch/arm64/boot/dts/google/lga-blazer.dts
 create mode 100644 arch/arm64/boot/dts/google/lga-frankel.dts
 create mode 100644 arch/arm64/boot/dts/google/lga-mustang.dts
 create mode 100644 arch/arm64/boot/dts/google/lga-pixel-common.dtsi
 create mode 100644 arch/arm64/boot/dts/google/lga.dtsi
