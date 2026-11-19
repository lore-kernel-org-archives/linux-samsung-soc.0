Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795117762;
	b=NNthq/AU8cTUSWuy+DR3+BcDirSH4aqL42wwZ+GJlwJMH5eMKUMJofjtPwWZf6t4f3EY
	 /4HXuK7cWOKhHMXS9GIxRXTFBeLr6a9JaAyAup7M7nl0RdsrYxAA05f0Gco+3GrJw+A0B
	 HHpJ9BMPtpMfqzmGqoaHq4hSOSB24Ex6ZqWnVjTO14mG3DEVxpZlb+tkE6IdReLeWD6Mu
	 mjFIy4cht6aVsbLtoYMafGiJuhMCsaUuFQU6JcOmDkQMYxxVHMRXPIiTcxse2PLEpzIWq
	 cnVhJb31LP5bzXNASO49dby4mNZX13CohRVQg16wsA3lb1MheYCUj8KVyeqsMG7aobA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117762;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=3+49QTDjm/vKqS/Wcu2TETTUiKiVb5Sph5ntAgUjO8g=;
	b=2PsCuuZ91s1p0w0t3KEUjeGUZFpmTfS7UgUmupYvHNEBpojKWi90CcszuFT5D0Fz1hKA
	 lVhQwNkJFW0gYJjEbuIyrKGvOU7ztLrnpDyLSs+2fPXBSZMrHoENA1v9zHnByxntvMlYM
	 s12ALujAtxD3PqYh2tLrZfWkkqbEnUOk7+es8z0iEKVc3U80mT1sVFflEQPDiTWApFNVF
	 2cklQ9CoE7C7hNCH6RNOrwoun3GAB8VvMTLTD5/TE8e8G9KR6mOCWoQyozbMJH7JGmYG9
	 zjnzr6q9SLPN8mz+kkbI4Le4R9iPwdrS1KKLvB7boUOJ14ZVlot/xGsRot4PqIIXhfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vo0hJsNJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40820606A324;
	Thu, 19 Nov 2026 19:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vo0hJsNJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795117761;
	b=TwP3P4RqGtTF5Irho9PrA5dHJLqRVX2fgjo/8zvBqU88AmDOGIVwihCE7r3OED/sR0Io
	 qiKWjldpx/bZlaWIXqRkbIdBoJAzQv/50Qd04gjgdGgPhUAAWb2BEKGCC0eIQrELZf4Sy
	 szAxZTYJVwgCku4vMcKv6kzq+FPig1VlzFqc3QVjhmOdHvnFe+LbZLH6Ddz7P3bGSq/ra
	 2cbLgIK2vEoKsVncVW5aTFw8aJMqGlriBzyB1htVn658nmETjkfIRJ+Ho23l3GLURd0YH
	 Eb224ZbPG/vhXPFgf0TCerWNUZf1BEmu4VJ37SayMqLYRBJRVb0JJt8XgcRhBlyO7oQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795117761;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=3+49QTDjm/vKqS/Wcu2TETTUiKiVb5Sph5ntAgUjO8g=;
	b=w8k9h0DDRHLDEfsc5XlcL6cYupKzAQFwMLA57T2gncEkC5gpsfo5CmXrg6cahql3b+29
	 60h1wCLREUwfoUzJY7ss+/cyAue6x16JYS9ga/4D9cGbC7eHooC9LmQ6Q7Fd2Md7FHPdz
	 CBK2ADb2SPCejmV7Xuf2n0vHy03aOFZLCwZZOTOIDvwLHXeGyHrIlfNhVCxnTuCors7m6
	 vpn42U8PVMTY1h8E7BoE+fOXYpzyDalh8f9tDNjY7VkNWL+JypT7IFx1U8KCU61dLo6VK
	 1c6HWCq2obVKQV+sy03CA69DQwby8rpsiuJTrZ7BSPNweunQcLX5vSqYaG02N+K7R4w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46C631F000C5;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117761;
	bh=3+49QTDjm/vKqS/Wcu2TETTUiKiVb5Sph5ntAgUjO8g=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Vo0hJsNJlVDFRsdVjfsd0RHe/k+Ox6HSa43+JUz8lFrgi6eUnlO7JU6yN08HaPClD
	 y/1P0k3bOduEguVMKjCnvMzX/Mk75OI865fO4mXvyNu7jIzzyRejILryn2rbXtu2FV
	 iZu2Hpg3Ik6GVi9prhxDvjXvFWf2pbB609MS51WQRBkFlACNuLX7p3vc9snrAQGphH
	 KK3J18wx/itrEj1/BeIkqHUQIBNVBrkSnh3OxnJUgp4DRk35fLeQmsVKXhrkPMIC86
	 obiCB/kbaJSuluC3MKcnemo8Jf70bGS+YoiErfVUP+M+yureJeCxIV1fwWvgKAsjrm
	 AOrrHETXnfQQQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 992A04B400;
	Thu, 19 Nov 2026 19:49:20 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Subject: [PATCH 0/6] Add USB support for Exynos7885 and enable USB and FG
 on gta3xllte
Date: Thu, 19 Nov 2026 19:49:16 +0000
Message-Id: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTuJRTDUqxgWLfziGIKmMxgI4
 e5WXX6L9zZSJIHSpdgo4S0qzynDHQrq7mEawNJnU3ksz845z4OF0zKOBp41cgxmSCtHX6PqGx/
 Q1JTbV8JNlt/32v6tc3ygs++M9v0DH3PPq3kAAAA=
X-Change-ID: 20261119-gta3xllte-usb-battery-b95e4d89ae85
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>, 
 David Virag <virag.david003@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795117759; l=1828;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=yfFFDGO1vosaycRHkyMq/ESVrYzVjaRTqRdxrfEOlRU=;
 b=DOUWCJC+nGAPnXyDeJyc7GzcvtXM33vcEfPLeUGUDgC34VJmZIADaL8pMrRRf0Q+kEdHuXTF9
 pScKDNhyaBXCo8FM/p5Xk8rvTEEKTBTi+pjQnkEozJPcCyD4Te1NT4c
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Reply-To: umer.uddin@mentallysanemainliners.org

Hi guys, this patch series adds support for USB on Exynos7885. This series
is based on David Virag's work[1] I had rebased it onto krzk's for-next
tree and tested it on gta3xllte. This series also enables S2MU005 FG
on gta3xllte, which is also tested.

Please note, I did drop enabling USB on jackpotlte, this is because I
don't have the device myself to test the changes personally and I didn't
want to risk a regression on jackpotlte.

DT changes were tested with make dtbs_check W=1, and the dt styling check
scripts with --mode strict flags, both of which returned no warnings.

Best regards,
Umer

[1] https://github.com/VDavid003/linux/commits/linux-6.11-rc2-7885/

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
David Virag (4):
      dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
      dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
      phy: exynos5-usbdrd: support Exynos7885 USB PHY
      arm64: dts: exynos: Enable USB in Exynos7885

Umer Uddin (2):
      arm64: dts: exynos: exynos7885-gta3xllte: Enable USB support
      arm64: dts: exynos: exynos7885-gta3xllte: Enable FuelGauge support

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  2 +
 .../bindings/usb/samsung,exynos-dwc3.yaml          |  3 ++
 .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 50 ++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         | 43 +++++++++++++++++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 27 ++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  3 ++
 6 files changed, 128 insertions(+)
---
base-commit: 397f550f3c8551b3ffbf3f45a571b58448514988
change-id: 20261119-gta3xllte-usb-battery-b95e4d89ae85

Best regards,
--  
Umer Uddin <umer.uddin@mentallysanemainliners.org>


