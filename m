Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2329228E0F;
	Thu, 14 Nov 2024 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595020; cv=none; b=SXxc2TT/G3e5NZEEP1X7Z8ZqJ6teJFuN/jf0LYBz0vwJ1tmVcmAYFJplDFSgRGrgCcmarLhy1rFT/pojMfBxbYhU6+chRH6nUgIGgGRO93JnRnKrtTpUac77Dejlnk+u0v+UJQqKrXatvGNASQQ2V4pRhtzvgH+WomqACmUBDM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595020; c=relaxed/simple;
	bh=Xwn4H9qApzG7awBMynaaWajEpLRY+haOstdbvOHl1Zo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aRJ4s/+7VCbdbi522PQf1sMMJnz77BRTkwG0mWrfEKQ512gpWQwjTaVTZrOXf7oI3Madn4bU2iYsm41NGYOugkbhYyL9tUe/YcRuY4B2awe/mGxPapXS0tVXFkLVw7od9NyZT5tOZB1v101QsdwNhsy70o9vHSgB//nwzMGZoL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUFvRcm8; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUFvRcm8"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-295d27f9fc9so425566fac.0;
        Thu, 14 Nov 2024 06:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731595018; x=1732199818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9QgoMz2gXE6CCus76Pqiv4l7faAk9fgsWt0YKAGIKck=;
        b=PUFvRcm8atWbTB0EEOOdqsqdQsu7IBsD1wruTV9UK7Tt+68VbB+cHMH6gWGabK0eMl
         7zIuEbpcJ6tlfnuMWBK8gfzD+Bifvt9+oLj0EgRL0NJ6Sc+a0B9XIM+sVVs1W2FeDhuT
         GejIkM56tBSw26A8NH9sbdeV0m+U2Qwt0HMnKm3T4GgOFnkj2xa2pK8DHBc1n9QO/XAl
         C0XZ3hSEqefquYGKxLn6hOl1TY1PD7t11uwZ2/Cw0ygWHBq2aVipdw+68HmLh1PI1xv9
         1C8Ni5QQGG1HIT7ywieUoY1Flmrbp3dZpV6Dvfk/mqOkkStDwWo2pXaHVSgh8i/5k2/d
         g9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731595018; x=1732199818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QgoMz2gXE6CCus76Pqiv4l7faAk9fgsWt0YKAGIKck=;
        b=XgQE2pUJODTBkdMKP2/oWAlUGkznPUfBODAnSoUcrInA7boZVAPwFL2J2iH6+BjvAc
         hvT4YN5oxOAQXmYa0EJyt+WyK6Y0n5K+SezkIQckfjzFR9gHOXneSGlkEVNEnuBQgoKT
         IHtqqrPCyrjeNXcnYL7PilnEqjzkUKb90kyRL/E4wAW9mDuBmOvXJEhM7jmoPiS5E2fG
         VxOrYaB2Ye/IBsyUauRMnFZ41zk1DSIaS7MbBYuigUjUg+DnPDdhxjU6ItQkTq5YxfqZ
         y3owVtLo5rJeiMMD53oMiaO/izIM6e4Zyzv21F0feYqVQWDUhNLZtFm2/YWXiwKRE/H0
         vM8A==
X-Forwarded-Encrypted: i=1; AJvYcCWBK5Yy85UvMYca3UdrIFKCjeR/BhwVvi9PHcmlsDGqiQEM5oqNIpSyZpUWCBWafE+p1PsXF4fD24resJhUDspeDKY=@vger.kernel.org, AJvYcCX9dXexb6Pj/LgVVLISbLvl44Ql6bijhOxhKkEadOAyNNVnmSlOpiJO2s5tAjxhqkNWgH32p9LPInBwiLxO@vger.kernel.org, AJvYcCXDWIVeWJUvtW9Cg51M99AW4Riai8x598xnezEgCGwX1/Y0TnRFyrDWFxC2m1rF0oBWTmJqGIdFCPd+@vger.kernel.org
X-Gm-Message-State: AOJu0Yywodu+tcgxYaMySREGGH5GsHh+TZOA1DBC+Akadyv6sSfOIhYL
	8yfCeT3p5RXa12N/Mh06mn0lteKY1hQJox7UetAB2xNiurzAtIHO
X-Google-Smtp-Source: AGHT+IFI3nlf8wAL4X0Sj5OS273H3/gWwdE9mh3koUy2pzCJuGW4ZTDW4qZM59jCbcJpseZpxiyxmg==
X-Received: by 2002:a05:6870:1b05:b0:259:88b4:976 with SMTP id 586e51a60fabf-296106d1d16mr2508059fac.43.1731595017861;
        Thu, 14 Nov 2024 06:36:57 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a6eaeea60sm393294a34.43.2024.11.14.06.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 06:36:57 -0800 (PST)
From: Sota4Ever <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add support for Samsung Galaxy S20 FE (SM-G780F/r8s) [SoC Exynos990]
Date: Thu, 14 Nov 2024 14:36:34 +0000
Message-Id: <20241114143636.374-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denzeel Oliva <wachiturroxd150@gmail.com>

Hello :),

I'm a newbie and I started getting interested 1 year ago.
Well, that's the beginning,
until I learn more about kernels and the C language,
which is important in that.

Well, bluntly, here it is:

That Samsung Galaxy S20 FE device is part of the Exynos990 SoC family,
I saw that Igor supported that processor,
I took advantage of it.

It has the same functions of:

* CPU
* pintrl
* gpio-keys
* simple-framebuffer

Just enough to reach a shell in an initramfs.

The preferred way to boot the upstream kernel is by using a
shim bootloader, called uniLoader.
Changes: - Simply add dts from S20 FE device

Special thanks to Igor for helping me with that :)

Changes in v2:
- Change author name

Changes in v3:
- Adjusted value <0x08 0x80000000 0x0 0x0c000000> to
 <0x8 0x80000000 0x0 0xc0000000>
Honestly I was wrong in the parameter and the other one is
not necessary to put another "0"

Denzeel Oliva (2):
  dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE
    (SM-G780F)
  arm64: dts: Add initial support for Samsung Galaxy S20 FE (r8s)

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts  | 115 ++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-r8s.dts

-- 
2.34.1

