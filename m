Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897073;
	b=ZSYzFyZmAIwiQY/zbzGa/T8IM6998Z/ziUfhYb+CM7o5a07ndLTzmF8rIImc0n1eoXvU
	 6+mmBYtHkiF3GOaXFzlAFvyHmB8/+5pRreOwT0XVQ9jW8n+SMfx7VeQSeHWxLJZstAwNW
	 KreO+5JYYXCGcPZ2GbM/IwR5rWnAka5NBNTsAnfbiJEcL95ZvOCD4Hem9MwL/lLb2bE6W
	 CAPI9wpmMufeZ22HsuWs3GJoW+R50R0X/Ukxvdnob4GMk4QZSRINHcvGim0ZABN+xs/xH
	 151fF0AwKgX+CsTKu2JVIhLsXMmJKcyYT+2OmWHMbsBSiV3YeV0xKPNSBUQh4JdAVgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=yC83ESjOXOvwycANDHqMUIA/nyL5tEqJwdOrO5/UNYc=;
	b=WeyaUI6QWpycO3NPPF3JQI0YJ9YuV77O6Yhab9n0D2lSOGAOjKwgk6aPtYkudgOWRw9x
	 yzAwWAmSsNm7oVgf9gKmcYVRbKtkDUEsP50jVx/3uwfM4JFjnc6nB6LrEjZVZLgvfe7Si
	 YaV6AlVsxGIi2HdWmhZgQiSBEjDFkKeGDB5Hxe5PeQzmriHT1q56hj/k54BoCCk5RX1Y3
	 3NK3nzld+nGJJ4Zm4wbUXVG3fkRNEW70yFMovkwM7p0fDj8N+yX1F+gVdpAHC0FsrWwvo
	 9LHURoYz/vDEG/or42OG7ivRvL5rtICQyJ75DVuwgSr6YABBphsDZdB0ibxNk36RAsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xfIfLYcP;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC99606A328
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 16:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AC99606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xfIfLYcP
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40e30c26a4so181594366b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2026 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793897072; x=1794501872; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yC83ESjOXOvwycANDHqMUIA/nyL5tEqJwdOrO5/UNYc=;
        b=xfIfLYcP64DFbq+WXEUe9TYpwTOFTkySIMUElL9UJ0zJsmsGjdUUciQoXTGP3wKcCo
         1XYgvft/Fv/0vFCllUsu0rxITDqYRLwtlkrRR7lIvP4FEHCYwhjN3uVlvnDpoqXCTdyN
         796+LDnAGjm+fL5Sc/0IWvBT8ZuXds9TSREtvCM9VKinLLCn5CVRD8puQMFZIfIpsyxY
         DxrA4lYIWf7bvJINbPD2tmaONSHIK0aPYwRxhwRUeH8y+C8Wkj2JkauvpVoHxozWKDnk
         nV7NMzCd0VIT9n6AQ2vl2kNPmXustP6x5H/QcsdvSfm9ao9GLQvFQHw54wGY/ZXrDpOQ
         zuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897072; x=1794501872;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yC83ESjOXOvwycANDHqMUIA/nyL5tEqJwdOrO5/UNYc=;
        b=oyLfJfXLy9XKZredGqrj/7GMRS+mLSiNwhvoUHC+hfFAZT2t3D82jeSw0J7gF1encL
         pfF6AboAVo9Qzpz4/r0/e0G+iflZQArUPROFK5gylk3bbUVAB+UdLdKVHdjtZ5jT0O0L
         ZAUt9yYOyXsjeyPDeOzKmjzEH/KUf5PR8UaU4iGhvK10nFII59n6nCduvD2J5AdlDIcB
         gvR9xohbMNiPiepyuC/X+2rDBxX0Mdz9gi0xYsV0Rfr0EuT7L1ie8k8vYIaRQ5rt4y6L
         GhE6LrEM3K/h3ZhDBiM0QGM5j+MG9vNto/BH95k8C2yD4vD/VShBkfbsUGQdl9j6od1B
         40Cg==
X-Forwarded-Encrypted: i=1; AKwUvBz8WqxDI8RKE8+kiGkw3dVx/8yGpy50HpftptNN7NewXQbVgL9BzXgJxUXXriUjZ/K6DvLwz64R9oZD2X98qKJcIg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/NVpX4Y0cVb7WtUDTtVSLe1cwEp2tq3wITyjriXh7K7JpmsOr7
	DgEKCNRK/2FcsDRKTTc71g8BksSCCo1hzbbnT+65XNP9T7vWJ3GCwT3goAn7CM5VmmOSAKPveXi
	ipo59Utc=
X-Gm-Gg: AYBFou2KhPn7lwSU0UlvmdShfyhLWhbKRoiKl36HDcNC60TrrwX+nuU3Xgbjdx0yEbz
	f2UgerRNUsAfYqlR99T9UfueVri53Ck1w4avZ4JKBZv3xt1DMJ2m+1TozcsNFuB6w0IqDMhwtq8
	7ZMYb7vVF9BGRT5eZnJmSZQV1NmPhLlLvS2gP/WxLlhC0MfPW5S+SJfADCsevNT7gM3FZvJusQ5
	1EpBk+8aJn4xzrKIXLPFyFV7nlkPkQUVbtTN41KhlfpmU1QJL2idDXQVUCMZkKWfT3Bcv8J1FS0
	lS0JQS8VOhf4BsBAI9TjtewkmRoOOBUkAWAYt9z29G15416eeqKH9vjk5NDF4MJHSQ3CSnufVNb
	RzAPn/OCGJqAWgQVh0gLk2P9pmvJ1gSJ5RWqvoWIlnjtXvdVAWMqMrwRwTbVFkAh3TqggK0fOU3
	i3BzC2EY1g1F8FBoAapglVMeJnM3D+DEcENnYqhqA0pGw31i/EdpkOuYvBUbl5ABO3W2/AaXH9O
	7H8b754ZYWWh1FYB2ief9U56EoUaIZJTiwf1dU/vz5j1D3TEFX33pXo19RVHboY0l8jHASoaOXu
	bWtkc4UxVpdhjItbBLF8ooUbO6i8cMbrWuIHUWOwX1ET7h5260dJCTIkfB90+yu0cp2eK+jpndv
	Qmr02yF7kJw1hNO2SbDzn
X-Received: by 2002:a17:907:86a3:b0:c46:9745:ac13 with SMTP id a640c23a62f3a-c4d207ef40cmr272696766b.32.1793897071769;
        Thu, 05 Nov 2026 08:44:31 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e48d0dcsm186593666b.70.2026.11.05.08.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:44:31 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Nov 2026 16:44:29 +0000
Subject: [PATCH] Revert "arm64: dts: exynos: gs101-oriole: add pd-disable
 and typec-power-opmode"
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-gs101-tcpci-bootloader-dt-v1-1-4b7e373778f2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAG2y7GoC/x2MywqAIBAAfyX23IIuRY9fiQ6mWy1EhkoE0r8nz
 W0OMxkiB+EIY5Uh8C1R/FlE1xXY3Zwbo7jiQIpaXcAtaqUx2csKLt6nwxvHAV1C6hpue9PTQAp
 KfwVe5fnf0/y+H+0rQNNrAAAA
X-Change-ID: 20251111-gs101-tcpci-bootloader-dt-274e58a82920
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Juan Yescas <jyescas@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

This reverts commit 817473b6ddaf9eb5f2bc7d6dce9fa13a921477a0.

The Pixel 6 / 6 Pro bootloader version 17.0-15681480, part of the
Android 17.0.0 release, knows about the upstream DT and disables power
delivery itself when the serial console is enabled. The workaround is
therefore not needed anymore and can be reverted, as anticipated in the
commit message of the above commit.

Since then, the node has moved to gs101-pixel-common.dtsi, so this now
applies to both Pixel 6 (oriole) and Pixel 6 Pro (raven).

With older bootloaders, enabling the serial console will again result
in endless TCPCI interrupts.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index e5736c39d1e0..dc908dd7e1c6 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -662,6 +662,7 @@ connector {
 			self-powered;
 			try-power-role = "sink";
 			op-sink-microwatt = <2600000>;
+			new-source-frs-typec-current = <FRS_5V_1P5A>;
 			slow-charger-loop;
 			pd-revision = /bits/ 8 <0x03 0x01 0x01 0x08>;
 			cc-debounce-time-ms = <170>;
@@ -704,12 +705,6 @@ VDO_DFP(DFP_VDO_VER1_1,
 						0, 0, 0x18d1)
 					VDO_CERT(0x0)
 					VDO_PRODUCT(0x4ee1, 0x0)>;
-			/*
-			 * Until bootloader is updated to set those two when
-			 * console is enabled, we disable PD here.
-			 */
-			pd-disable;
-			typec-power-opmode = "default";
 
 			ports {
 				#address-cells = <1>;

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20251111-gs101-tcpci-bootloader-dt-274e58a82920

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

