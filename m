Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E441EBFEF
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705305; cv=none; b=f21Z/rd7/n8rNbKW/nlGGrO8ZS2m7/WYvkC0mqHonRx7O2lsK7FNzquhQvxrpQSRpi3OJk/KiKfrk/iXmS5WvIuiuxyQYkxZ51EO6T5HdjQ+yc0orvIWAVf9GXaNimrr70NmG433v3b71pMrQzNyaxBvPRcvlDBR7n7lH32cwhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705305; c=relaxed/simple;
	bh=LYkr9r33Y5XKXLryrepschQpm2XBjm1H7bQnk6ENV30=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ihWsdm/v6FvORKd5g3CYMCfAspb9UPfXe/MjNvUamKnZrDLyX7rlguyCUnSxbgd0ZyvqXF+ZV89Bqcjjg9ySFx6CypEruOw9NLbcEGBZxC6Ud8L5h7WaTSlYjQU7gdCze3hwkcmhd2mjQrZ+GP7/xbyXGlfBlyT6uvzGlZdpI3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kI4G/oGp; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kI4G/oGp"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cfd2978f95so9196892a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 03:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705300; x=1733310100; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cBZr6b/b4WAms1NkzQ7R3CufwwQCxtnEtvUYSb5nf9M=;
        b=kI4G/oGpdd3nQMinjYs4IwQOVXqxFP7b4S9fakKeT1EN2p1X6TLXOzVb/tQZCd6ncR
         Rd5fCsaXUVngu7wJQ1x9SU4PMDB7PKhbSZkKYh9MOwkn8xxWvWEeuqQFGHomPm2AzNdn
         0pB9456I/YiEWbSW1GVFvZwwH2hRheiMfAMp3aDF785o5cUqYjaqfCxvfUqxsQhI1qbl
         LTWWIUsdKOvVS0hAifU0Om5JEoMEFwW9OCnRcbiPBgRhkAw3iuTs3fWuSBAfgeD3Wz1F
         mrzqW/D/Myi+d+U6fuWlOv78+LU6XOyf/5G715QgckKJ+o9lMhmyrBv5kTPoiin0y/Vj
         5JhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705300; x=1733310100;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBZr6b/b4WAms1NkzQ7R3CufwwQCxtnEtvUYSb5nf9M=;
        b=OmHZwUgkbwRUvWrd7lox2CVhvRNl2+ALDpDDESIuerTwFPe9P05dZfHvt+xJZzGFKl
         10t3xjsb2RgYeQEv9QTH/5ZLZynwGXYgTPYXbthqVgYLQemFwaIsVPyGuJB/9WsCVx8h
         fwWGOVEPDq3c0fFHNp0uWWXJA+IU7dHo/Z+b1YjS5t6fEcG24bnFxCzZoqzmIFCRJX/T
         Zc8wUH8z0FNGMZTxM3JSi4BsUcfAcd1J0kSUiBpeGLkBYG8DcleUhbiMVQnoHbDvogYa
         6Su+S1cN28ffCMY2ZOkJrLTYRBPZwtHhXgfDh37lCW9OruvciQS84bM8kJ/qCp64IEu/
         McRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfSjEfVbSX4fRtR5P/ImgCaSZzJnmniEdkDN4Fb8A2pu4QbHA6vy01NMcSkt7mDLYsFTSB32Fb6GoMYOfsXlIn7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcLKRrhSp+O8l8atd0uvcETYh3df8HqM05L5bvKE056Ap1uPVE
	kjtDYATZUXcbGa1XTNsKFSbUCFcz+eFcJEsITnk0xtM5ax85t4MtfYh2znFO8k0=
X-Gm-Gg: ASbGncuzqw1Gt+5sQKvkrBd0wla7xyYLwiw9lAEuIxFkiD8HpkTv/XJ/tWh9ln0C0ln
	/NAfrNYveYUb9FvF6H47RbbcIQuKLzKD779HhGq53vpbAT95Vpl6qRR9uL/8lasYEPsTEtMPw0x
	5NG4Bc1cMzr5ee5tOYcZfBb88I3+nmMm1yUW7YkP32K4QnlX9gKIzTfe+piym6ElnaR0gzqdSbJ
	UCNL6OcnppfS7cHK70RzceBssXSgwHAtrVy8FnRXMvX4Dw5I2c9UzbF874N4xUH2j8RDxOc9C6b
	jhk0JMVn1uCA5l6+TrW1Sqs5/ALnGXoZGA==
X-Google-Smtp-Source: AGHT+IG9LM9nsHo2L6pr+d8lMcVcqFeZ9vngEOtHUmqHJbBLX24wsz6VfzC5liy6xxjFk86MjURtsg==
X-Received: by 2002:a17:906:4ca:b0:aa5:b32:6966 with SMTP id a640c23a62f3a-aa581076b11mr207938666b.50.1732705300206;
        Wed, 27 Nov 2024 03:01:40 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:39 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/6] Google Pixel 6 (oriole): TCPCI enablement & USB
 updates
Date: Wed, 27 Nov 2024 11:01:38 +0000
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABL8RmcC/x2NQQqDQAwAvyI5N2CCRepXpIewphooq2yWUhH/b
 vA4h5k5wLWYOgzNAUV/5rbmAHo0kBbJs6JNwcAtd0Tc4+zUEm7Ljl/J6riGnqvU8HCqji9J2nf
 CiZ8JorIV/dj/Pozv87wAXVvef3EAAAA=
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Hi,

This series adds and enables the Maxim MAX77759 TCPCI for Google Pixel
6 (Oriole).

It relies on the bindings update proposed as part of
https://lore.kernel.org/r/20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org

With these patches, we allow the usb phy to detect usb cable
orientation, and we make it possible for the USB DWC3 core to enter
runtime suspend upon cable disconnect.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (6):
      arm64: defconfig: enable Maxim TCPCI driver
      dt-bindings: usb: max33359: add max77759 flavor
      arm64: dts: exynos: gs101: phy region for exynos5-usbdrd is larger
      arm64: dts: exynos: gs101: enable snps,dis_rxdet_inp3_quirk for DWC3
      arm64: dts: exynos: gs101-oriole: enable Maxim max77759 TCPCi
      arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-opmode

 .../devicetree/bindings/usb/maxim,max33359.yaml    |   8 +-
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 104 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   3 +-
 arch/arm64/configs/defconfig                       |   1 +
 4 files changed, 113 insertions(+), 3 deletions(-)
---
base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
change-id: 20241127-gs101-phy-lanes-orientation-dts-9ace74a2c25c

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

