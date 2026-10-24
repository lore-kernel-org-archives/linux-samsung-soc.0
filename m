Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874895;
	b=G31ZQ1uphFlPD3bxnZbBWZB0krSYDFNsk9PSGaSSQDWETKNsi4KBYgQYafrUC6HhsvuR
	 vaa9qDhTH3svI9aSoolOwUsAh8IKkylQ+G3FQAqRQdeQVzN1W0ZLZKXN2TwzxxQt7k8EF
	 FwmVNI436+4Djojko4q1mzSCXxQrH9cC4RDsIugWLlKnVqU7b/LuXjhYYS7/8RamsYOlh
	 kDMpjE5ZpsUCtveZVLxP62OeIk9YTnnmO9v7jPx3Rbi0S0q7HWq/74Anh990W1xwQeOnn
	 EgxJvkAi4/Galdsjugw+gYrXMaO5bOPrPs0nxbskQghGFEZ7jTuhBSo3V5V0meGnX5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=jHvev2DHjFHkJ3V6zZIDP3Luuvx+DUDiyJHl84mF21M=;
	b=TbSnmZWZlFmf/qiHzcpVpVy0HX8SI/sABhwUEQj/ueJHRifedJSwNEmT/eRGs2CwCwlj
	 NUZ+wchafFeDd/gSc1Cz+Qche3gt1uVJSfxJLAeYbywEorMCbY98n4R+ai4lhm3Ehgkk0
	 hkI4V2/4WWj8ZG056V22fVUWPQ2U029ePT+hJSt7aUbSxBxaHUmyvq0DMQhNuJFlLj7uV
	 ZoLegMWj0lZlnS0XGXj/l7gUF69aqASIXZKlEFOpTdcYDrBmmjsx7sZQITCKtDBjE54I+
	 UXOpApEK0z8tUEWrBLgJ6RaLDLs0pERo0tUjVedvu7uOxJ3HN2QK3OMmvR9Q5gmKG6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kff1vHAP;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB199606A31A
	for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Oct 2026 20:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB199606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kff1vHAP
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1067756f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Oct 2026 13:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792874892; x=1793479692; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jHvev2DHjFHkJ3V6zZIDP3Luuvx+DUDiyJHl84mF21M=;
        b=kff1vHAP2Nu0zIpudBmNBHn5KX0VBdzJXu4jvP58vSoo/pHneUWZCK+nIdNMuxPvmd
         MMKZ9fKFKJ598ZVVeOJxR2XhwwlrIi+xTcPZLuLSYi9hw+QWQaRrGxZJX4Jd2/9vvNJ8
         HRnEH0V5yPdn7Bw1r11dowTzcM5iZmlnh2ripLAHidxKlyxKokb6G2qRHcQfDDtnJXcK
         kuA9zRcem1KIObpVQ6cqQJoDckpwyFj/Qxa1oC9rPRaYv5Cr4HjZMdUvWSNdXnWbSkPT
         iw9YPGRPKMg1b/5GtNxGrHqmt+j9A+kbxt69Px7C1m49FxTKJLe6p3aTq+JcNmEIACw8
         qQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874892; x=1793479692;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jHvev2DHjFHkJ3V6zZIDP3Luuvx+DUDiyJHl84mF21M=;
        b=gyieYOdNQMZ598R13hsVgOOlfFAlQNkYggG2vDK0IZpyvCzl03sFJDSlKb3+djIY6/
         aokxoCBksU9JnGfkS+i0ep+/nvVPPRI0M2x5ET+x/ikZVK1cHAnR6nE11uWPy79vwLg0
         o6J/ce4uVb5GtqMmdCI+HySG14hBFWamlabrUoDXxiEISu7RJsxmjrkQFtbZqsw0MKDr
         Jil9kouR/vyRppOX9eD55OyW2wdzmIEr4tQdMzzSyKM8PVgZ0/31LEGsTC/2vVGxJkJW
         2Y2lAfKo8HYGSqXzKyzi8A0A/+P/m3nxDQ+wo29QsN2fjlXM/SO5zxFkciET/89uGr7y
         DMAQ==
X-Forwarded-Encrypted: i=1; AKwUvBz43KGFpeR6nB7cdn/AG3iCteJOvO9M/y4bwHGFNSrXKSDDO7XCkmw7xJXKyoLoKHPGBxRqosZ3ms5edTQ+VhPF8g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLzAzAPmdo3gmjpbuw26dRh5vKKUtUqVeXRsAM5zIBI7ONcp0S1
	2L19J/01EV55fLz2Nr/lG3bKa6QkR82QriR8HUVmVZXYVC5KHF69YmdxSuUmMix8tcOv4uK4
X-Gm-Gg: AYBFou37BXLtuRYoKv18cIJEqLV3aUZzrizqpn1XBoYfkQzm1Y0oSJFuybN5RFb93hW
	e0s46sgpPmO/oyVBJnargM54gr/8OtIgQVSmibs3l8yx11tiasshw4+R4vObtPwY50OV23Pk5fF
	7vTbTsl9Y2shOselCQnAs7FidqYQZv57VlzS13+gmaqBQ0LGuVwliUh7Uc5ofJ972zau8IpP6zK
	fOAQSxccultxlieqffWgfjaDdMc4VItxYo6AQxhXJneBCO3pJrfzr8FakdXDaIShqqqZbC3BtoB
	OSINb0n1rON3RoQXB31z6eLgnu4Msvf06+Xtjr5KgW6yrgHeiSc1n6i1AOgvPahrzVyNAxfXl3b
	tT6E5OZc5ZDkdBpbeyU67aUpVnbZCk2Su4Ir9ZG2+cv4QBiQOGE+JM2GMV8uzg3UDi5EbyIJAab
	Wen5lDICEITTt3Q36CTXvrtAphgKT2y519YgTuqFvhoqVpYgHcF67c/wbNOaHNYln0GyXp4qtS1
	XH5hytGJB+nCVTPUY96wB+rqg+/pIWlM4kyJk9srn4k8ldFGAuCN5wkXCDuOFi6OpU2tilA2AO6
	R1dZ2DkT
X-Received: by 2002:a05:600c:5397:b0:4a2:a9:ed56 with SMTP id 5b1f17b1804b1-4a35ac99b8fmr44041955e9.8.1792874892206;
        Sat, 24 Oct 2026 13:48:12 -0700 (PDT)
Received: from theSameSurfase.localdomain ([193.222.98.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd49afsm6221793f8f.35.2026.10.24.13.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:48:11 -0700 (PDT)
From: thesame-personal <thesame.personal@gmail.com>
Date: Sat, 24 Oct 2026 22:48:04 +0200
Subject: [PATCH] ARM: dts: samsung: exynos4412-p4note: allow powering off
 the wifi card
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
Message-Id: <20261024-exynos4412-p4note-brcmfmac-v1-1-3d09e496c2c7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIMZ3WoC/x3MSw5AMBAA0KvIrE2iNT5xFbGgpsxCK60IEXfXW
 L7NeyByEI7QZQ8EPiWKdwkqz8Cso1sYZU4GXehaFZqQr9v5SKQ07uT8wTgFs9ltNFi33BhVlhV
 NFlKwB7Zy/Xk/vO8HJtVRYGwAAAA=
X-Change-ID: 20261024-exynos4412-p4note-brcmfmac-68e7c13354bf
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Artem Utkin <thesame.personal@gmail.com>
X-Mailer: b4 0.16.0

sdhci_3 serving BCM4334 was missing cap-power-off-card.
On my N8000 this resulted in the following messages after sleeping:
[305.759883] PM: suspend entry (deep)
[306.514698] brcmfmac: brcmf_ops_sdio_suspend: Failed to set pm_flags 1
[306.671504] brcmfmac: brcmf_sdio_htclk: HT Avail request error: -110
[307.127267] PM: suspend exit

The regression was triggered by commit 8c3170628a9c
("wifi: brcmfmac: keep power during suspend if board requires it").
Midas already has a fix in commit 2ff147fdfa99
("ARM: dts: samsung: exynos4412-midas:
turn off SDIO WLAN chip during system suspend").
exynos4412-p4note.dtsi does not include exynos4412-midas.dtsi,
so p4note did not automatically inherit the Midas fix.

Another affected board was fixed in commit 863d69923bdb ("ARM: dts:
samsung: exynos4210-i9100: turn off SDIO WLAN chip during system
suspend").

Signed-off-by: Artem Utkin <thesame.personal@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 8d52aa13b8..03b514a82b 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -1232,6 +1232,7 @@ &sdhci_3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	non-removable;
+	cap-power-off-card;
 	bus-width = <4>;
 	mmc-pwrseq = <&wlan_pwrseq>;
 

---
base-commit: b47faa6004d86ade16b90d24fa1e1f179e6f7230
change-id: 20261024-exynos4412-p4note-brcmfmac-68e7c13354bf

Best regards,
--  
Artem Utkin <thesame.personal@gmail.com>

