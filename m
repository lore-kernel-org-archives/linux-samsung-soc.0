Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792648333;
	b=Zdm4GcltdPTo6OlNrqxiv/FiS0f6QYZcbLXNu6fZ4zfB2BgdwlmLvGHKovKOKNSmbG++
	 iJA9/p0gNPJ4hUMLdh0qK3fZmRLjsAYL/EuyvWigWsQe5f9EuCevwLrrxA2hFJ1UFtB3h
	 JcJFeefUdJDE4K6gQyjo7qElArQ5kwmGwDe490yi6a7gLbTZpaIKBiAe4luB3BU/fkZRR
	 /eBkLIxOWNNSoSkBR5/GYUjR6edKzSKfbNuwIOR5FUcjzenyivzBxNipxUmBDatwsC2Qr
	 01Lhub7/1wRJ7EAZ6G75WR2VOdKTCna10CNOdHa1oi+hlIL8wCqZz30IGt+NGaBIBMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7Krj8OjITAThRkCGGSj2U5wCQS4PajnQVLbEtv8Y+ws=;
	b=j+321evg278+ERlEf0mf2658toFUwk79z3CnumPfZSDK2/ySGi2Ns5nis+RkVuprTEwR
	 jYmLU9Q6SpySWMzWootiFjJkXg2ll1poeKqGgqibCnfOi1KNccQ2t1WbiYzQRWh8uuBJ4
	 Y1vTsdukeq65Ys4/e5vQ0DoXbM2NHNKCLP6xlWo/JgvO2mnSmgBOKHO8SVzpYzRBzd5+e
	 QGfd4IUW00g1vU1xYKsRtg9+KQSh1CFtfbfu7+phiow3kLZ47RfyW9BqcHUGnehP/wM5z
	 pjNujthYbwMt8NSOMOYSjiI6JGaqX4MIl7Nls6pvy0jPMFbUUFB5pOHAdXuibIDEJaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I6z+2ZtJ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75976606A31B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Oct 2026 05:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75976606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I6z+2ZtJ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso14788855e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Oct 2026 22:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792648332; x=1793253132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Krj8OjITAThRkCGGSj2U5wCQS4PajnQVLbEtv8Y+ws=;
        b=I6z+2ZtJyElO0G4znh79MonwNy9aQb4oBy3+qS7jn+iBMoi60vxjfYGFWTG+1qPBDy
         oZvzN6qu4lX1wu98RPB/cLf87ioHqodcdNM7jMSWKpw1eaUbfMa2vxxno9Txh9Ae08i+
         zaCGLpbcSl1aVD+qDNNNxL/pIDKAa16YdhNzlk3U9w0gkl7xxj5x7VOCIyDSJ1hb5u5t
         LXOBLDg3ygAtmfMpIDOWeR6ootfSjPEwW1HxZSVivOHN9IvCxj1sOOKpO51qKgTMX4ZE
         paXzF54WrKdZJ5dkg0SsfKsoF6Bj+zKrV2Cw5KFi3a3AM6Az5hWwoeYWJdypBs3wZLuZ
         lsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648332; x=1793253132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Krj8OjITAThRkCGGSj2U5wCQS4PajnQVLbEtv8Y+ws=;
        b=kbwCoOuc+466LU26zW2w+wfxllTHFlAucQrm5JMSrCIpYWQlihk9pUpQpqCCys49tR
         VHPPc7+6DQkcrXOE1yfasKBY9iLfRod8kUX9h0DB4F4mVLEWguK1heuGEDp4jLQV4z3A
         PfQs21oG9hxl7jjq5rqxrxI+wl+LSkpW1Wm/jP++bHcOygAy1XBrt20TZs/A+q4PijyR
         lsYltPJfvdpK5WgUzQsivfM/PhyyPQA7EUVusTyOyyq61S4BtnYlrBNT6OGp42mkrmCT
         uXXfAWdEBZ/o1SgJozUEItZ2t1wzIRdN/6KZAp/k4Bz1oyqBneAAdqZgHCfXs7ThQPuj
         jT3w==
X-Gm-Message-State: AFq9FYKrkcrDlJRUPmrfkQPKxQE065/q0zdLYY11sANpovrC6B2KZ0jX
	yxJHMn/uhewneYy+m4JYKdIxn7u7HhoVZPw3SKe0eSQMCq5NnFHiGfVJ
X-Gm-Gg: AYBFou1Om4tq+kj8MiIEdazXXdQZ5Zqnv3TUBcNeyjqiCILpQsk+GofbI/8AenOFgBc
	n1M61K2SNHvlht/urVK0B6Uxdu1XPAg50KmDbwUKduwwXXJIAZHxsrOsJsr5fZqJax1Gj9vfakv
	f/VrixHPrAdOvFQPN9c1tSpPtB+10x4OamGBmyI0LaT9sRK3hKb6oMMa491PTWS6RbHVd46zT/p
	xDCK1O+j1mFy73BMqg97VQ5s3M+sCxImnIM8G/QKr+hkDxHFBcR+UWVt2LZVfgZjuKhSDL0ejug
	yplBFAtf3Q6S/FcWFbFJWSO+6/Sl+EH1tMq6w7Bapxsvj4bZM/rpPj8+adpGzmTlE8ONrZas7Gh
	aCPWZZiO/+evTeBBKuB5NivLma8DNS8P+0plKtUvs/F/oJjz1COmIQdakVNYqL+hNYIDZo8QcOc
	6f/NbnAmjVBZBFjT9+c752eickwWxMLDRd2Kk6Dr5wF/D+LRepNSwMY/EewePaLfLNOnj74/6Fi
	aTl6Nhu+LVNNgFh63OTeNcdUzelY97pyrSnhGHDVj51OlmNo+jHYzjYOp3VkqqonJn0gjWcQEW4
	YwFcC9nlHFYX06BzEhAHbJ6SJvf4hihWaD+Sa5UK3kOB5SUXwLiiLc3yKwmRdgRUYR90FBsB6cn
	7ScXi6bSqSHEowEVRW0T4LfmT2fEEUWNb65S6kRqXYt0bj4iL7lt3lESCdOLpQofs8J9rGJwyEr
	k4wNDZ
X-Received: by 2002:a05:600c:6748:b0:4a2:1a:a122 with SMTP id 5b1f17b1804b1-4a2001aa387mr72903845e9.9.1792648331473;
        Wed, 21 Oct 2026 22:52:11 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-a0a3-b57b-feb7-50dc.ipv6.o2.cz. [2a00:1028:8388:a84e:a0a3:b57b:feb7:50dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm41312875e9.0.2026.10.21.22.52.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:52:10 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 0/2] ARM: dts: samsung: Add support for Hardkernel ODROID-U2
Date: Thu, 22 Oct 2026 07:52:06 +0200
Message-ID: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the Hardkernel ODROID-U2, the predecessor of the
ODROID-U3, based on the Samsung Exynos4412 Prime SoC.

v2 is reworked: as with other closely related boards, such as the
ODROID-X2 and the ODROID-X, the ODROID-U2 device tree now includes the
ODROID-U3 one and describes only the differences: the micro-USB port
is peripheral only, as there is no VBUS supply switch, there is no
expansion header with SPI, and the 3.5 mm jack is headphone only, with
an on-board digital microphone instead.

Ethernet, microSD, USB peripheral mode, the LED, the fan cooling
device, headphone playback and recording from the digital microphone
were tested on an ODROID-U2 with v1 on Linux 6.12. With v2, everything
except audio was checked again on Linux 6.18; the DTB is the same as in
v1, except for the cs-gpios property of the disabled spi_1 node. The
eMMC was not tested, as no eMMC module was available.

Changes in v2:
- Include the ODROID-U3 device tree instead of duplicating it, which
  also resolves the style issues reported by Henrik
- Add Reviewed-by from Henrik to the dt-bindings patch
- Link to v1: https://lore.kernel.org/all/20261018124459.3026-1-pepe.schlehofer@gmail.com/

Josef Schlehofer (2):
  dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
  ARM: dts: samsung: Add Hardkernel ODROID-U2

 .../bindings/arm/samsung/samsung-boards.yaml  |  1 +
 arch/arm/boot/dts/samsung/Makefile            |  1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 42 +++++++++++++++++++
 4 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.54.0 (Apple Git-157)

