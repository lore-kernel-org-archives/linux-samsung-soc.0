Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604182;
	b=NOjWren0E0cIzaiW5DXTEXBjttzw9yUwZOzJE8SZCwRWKIA3nvYaPMYbUqcgOgUmj9P6
	 zjHKxRT1/SWb10bMp1pAtjvIC1TH01xFI6YFeZ8eHrImXAttPXXCwukcv1l4DT9CkK48T
	 IF4B0mupDJJwSo1MMskuUhNluWhxOee0+4qLtU73aoP85ma367sUKL9I1p+06wFqF50b8
	 9Lcz18X33XyV6sFzHqlSnDtDZS7qj6hed34RwWNTt9LSoe10nibbbcH2O/1aav9TTuRLv
	 SpWYcOB/Gtgy2bt8SHDRVJOhywVeqTjcM9VbquSxVefqfivktQ2gI8O3vY1Wljqxq7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
	b=bWAodEV30uQEb8PN2NrkgtomfkIY/KAMjKQob+wD4t3mdc8tSeUPjLkXqG4BzeipB9eE
	 G6U/LaLuYlDvB3QlGuktk5vT2OjeIJwxJcgl2BtSrOUxb2QUnNDKWYF5zatjNQc0YJvb1
	 5mWw8JgbWQ56fYc3EHng3mwQeRYi3FL3SaPaM/7nwUkTAYbqIel/SUILZuHp1hfMFmrmQ
	 DSPbAlIxAIgjJJXQZVkpPtly6Fb+f9xAxkO3LbK2JYXgcm0HLHyYlagqjkVhxfir1I1Kx
	 yQW1RA/s0RFAuNCqiEGBpZ75h+AEBiORk9dBNsdaxeJgY5MfU7uqYxCT8l6t1dwvu1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mL4bWoI1;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B8C60A3834
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 21:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B8C60A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mL4bWoI1
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1035544c88.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 13:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604181; x=1795208981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
        b=mL4bWoI1mpeMMgydl8Xi9d2krbL4oJdwH5dCeLzhcLNDqmkJeCUaFBJPwG5csoTBCA
         yQosIHGXgtHK3esf/hwQtiVpDpS+LeYZsaNYU9xQunGvp3H22PUO/6SMho5UbuXCpeCD
         weIZd7D/MGUjs+KEXZMU/C1/MVZILtvH4SRvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604181; x=1795208981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
        b=TVZfclMrCYBPXiiJT1GqWAKTsIQCtr5tWOm980NwgOgg7L06FiuG4vIQD90Bbmkmdz
         SMFNT0P7ZpKt6KQzBEHPiGOXyMEqNU70iP0JjQgsQ0z3AabxOk3IWy8I3Wt7ZBQonrZB
         8NcsP8DPqfUH7dT/H+QacpLKjf2VyUFQanWvv6eOFksE5y9k0Y5k+v5IM/wwqx0nw9Ct
         i8xrT88hzDK0bAeDDE9G/opf+M+vKAfN6u8mTv7gFFgSY8wALJJ1lSQqSMYklafMb4IM
         90Rv0ykpCcl6PBiqNmIo+NdllOsSJ+nSZsDifth3ZNXfHZcYZ7H7GuQxpMcIjI4uxD1c
         kiaw==
X-Forwarded-Encrypted: i=1; AL+hErEel0VubmCFd2/WsLMWFlqjjIloQBzys+nB15qCudcxkB6gbNWLShs9S8vpFkqmZwKE8Zzuo9E95g3IfusSmyphsQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+tpv6g6qBpc1yenfMzc6aVqze6TEnRcBUgR8YoyUradeGQj5GR
	QTij314XAcgRkmHiz1zb7wtgDgoyFPolzYBrjHoY6t6cAYhOhIEHg9Gnq8/yuFoarA==
X-Gm-Gg: AYBFou2YKBAJ79RUxZzUp4w8t7jo7540kQdoyKyF2jhtqfztYiIPXFNA+fj3c6AJLCK
	KMd09V272EtNG1J/FuG2QV//3OW2PziU++JF9yAV3HXW9mtO8GFDeA+VYNPi44lj5QVc8tpzDgW
	05Tt4/TUvKnSIUwHTWd+Dpbd59Zn1PRM9/5FG908wFzvUoDDvRUtCnDrQRpjiVjA4gs8D2mYs8C
	LGPVRPG49N20SvclX+ygmocFiifsjHgaz7VxfYa74gUuAjQ4OuqN4Z4K3s28c88AIzT4jfegE8f
	jUiJRwKVysk98VYU8Geqg8g2JyHWCuGrptAU6eX4+3tcTe0PRh8TfO0M1TRLl1K1NsnZU+IXzrl
	mcA+cg8+qyXHiwLE5JcUZt3hjotnC0lh5K5e6qqkO0GX4cz4SQNPduXc1pIs1o/AFAUht5F+QEm
	v8j8x1txmQ9RVa1osK4aIqpAMsK32Z72C9G/D3ha5oF7BFjxpwsGpEtwCJucjXOCjO5+3ePzS8Z
	tUjbfpEV7IDVakZXpjop7wlbZAgidr/bsoyeZ7Rv9MaIKI09xb+8RBa25x26s6li2Zj6nyyGA6N
	3i+hH3dS3GSYbmtS3GbcpTr9vMQTZnf1glL+pfsPTFWIa3QBE4V3X95GJPk7ZmHE+gFSDQh+g90
	k2+JGBgFkpLTd8xqfUEkHDZ/TduKR0YqOgw==
X-Received: by 2002:a05:7022:4093:b0:1b3:b455:93c3 with SMTP id a92af1059eb24-1b5030cf269mr3095118c88.22.1794604181056;
        Fri, 13 Nov 2026 13:09:41 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:40 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH v2 4/5] arm64: dts: google: lga: Add lga.fitconfig FIT configuration file
Date: Fri, 13 Nov 2026 13:09:13 -0800
Message-ID: <20261113130858.RFC.v2.4.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a FIT configuration file (`lga.fitconfig`) listing the Google Tensor
G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`, `lga-frankel.dtb`,
and `lga-mustang.dtb`) along with board and SoC ID/revision metadata in
each configuration's `match-1` subnode [1], allowing the LGA FIT image
to be built with:

  make \
    FIT_CONFIG=google/lga.fitconfig \
    FIT_COMPRESSION=none \
    FIT_FACTOR_DTBS=1 \
    FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
    image.fit

NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
image. However, packaging scripts will be able to take an image as
built above and convert it into a format that the bootloader can
handle.

Each configuration carries a `match-1` subnode (`compatible =
"google,board-id"`) with typed `board-id`, `board-rev`, `soc-id`, and
`soc-rev` properties [1] to identify which configuration to use on which
board without polluting the device trees themselves with loader
metadata. Having a structured (and upstream) place to store this data is
part of the motivation for landing this FIT configuration file.

Side note: at the moment, the Pixel bootloader can't handle picking
overlays based on the `soc-id` and `soc-rev` (it only uses those to pick
base dtb files), so for now we won't be able to support boards that
might have different SoCs. I've included the `soc-id` and `soc-rev` in
this FIT configuration in the hopes that we can improve the bootloader
in the future, though.

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Replace checked-in lga.its with a compact lga.fitconfig sidecar file
  consumed by scripts/make_fit.py (Simon Glass)
- Move board/SoC matching metadata from the configuration description
  string to a typed match-1 subnode per the proposed FIT spec extension
  (Simon Glass)

 arch/arm64/boot/dts/google/lga.fitconfig | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/lga.fitconfig

diff --git a/arch/arm64/boot/dts/google/lga.fitconfig b/arch/arm64/boot/dts/google/lga.fitconfig
new file mode 100644
index 000000000000..fd90b85c2fb6
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga.fitconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+
+[lga-blazer.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070406
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
+
+[lga-frankel.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070306
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
+
+[lga-mustang.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070506
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
-- 
2.56.0.611.g1030f0b940-goog

