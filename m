Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635090;
	b=tbQpBuWthE6JA1EpMxipmM1W+IUuAweVPB7eNFb2/lAFz76xL7ev7O98qfBBE8Cy8xUe
	 kAAzQH2LbE0MY+PcDvcDz1vQmlBQQg9NZN+ZNYKTV9xxw4S1R33S2BwWMU6fXbp2cUsqd
	 5Y7rGtdg880Qoz2Qu4geS6VT/lskShFKlSVH19fwCjRkZ78RNdh2DzCYWzFoyirakbGA9
	 PgdXxzE1jqlsnnH0PQ0ED5joZVeo+ns3czMsFe6bQZ8MXPGdjT3tqevh5b8g+/73KDezA
	 i5LPMiqe+hOiUSHqBTsZ+ZD46lVQS4C3U7dE8ax5HeXG6FWnFYX5hjmnCA1q7iWhuIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=U1oBw4U+gjNk3iM5j42wuAngnRMfL1HrI9OahKdf/KQ=;
	b=2JnKav3fOKQh9BNVbV6fAPUgPCYaXkfIJT57s2y1PuoPxRimeJvNSOKbf8SqugU7sfZO
	 sNeCxYw2Vr1OU0wUhg3jrqFmSn+zG5LfO8aIR12I8RKv6gtUBhgtVPg/YRdQ+Sa4OLE/S
	 18JDO6wpc7v05A5XH0TDXuyxRNzXB7SnR6yO6OWiXSFdhQhQuhjgYOHXhquqCJQ+xYODQ
	 /qDqDgWFpDNcc/gcHd5UcghRpHSFwgtX0Pg2hVU2m+fP9aYYK0Y7nrTeE+S+c6yVc0vJv
	 2aNYAZvMe1mg/8xCKMCF6RndrIEbuh4HTcciT0Ct763gB3mbbpe6ODi7gFeXTOTtsKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nHMyVEo;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9854606A326
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 19:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9854606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nHMyVEo
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so7297491a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 11:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635088; x=1796239888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U1oBw4U+gjNk3iM5j42wuAngnRMfL1HrI9OahKdf/KQ=;
        b=0nHMyVEo+cHSBg/yZjo07YS7lm0nSu5aapXced69byeyWvlod6eZOHh3vHqbFwviLr
         fXpsJZQXB8MYqRvheUfHH+u50BUewnvIXigX2sGoh1oBv0F9raAp1hdMWLRSKGQZGQI1
         SQQk+CCM8hEOeYgk00xfrypTvmXRqtcUioIBzk0/arl1DHjQmysx9hYsi5u3I063SrFG
         +8kYHx4giGHRVBYzeGw5tjEcknNPOtd1dXh2UMhaEQzFdLNIZyhcgBRDqr05SI1pzSPq
         E5lNpN7bzrTvZr0k975+r8Blji+jn/Y2ahr5ord2EOCxrBjaO2ytOiaWdGmorD2eF3Mx
         PhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635088; x=1796239888;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1oBw4U+gjNk3iM5j42wuAngnRMfL1HrI9OahKdf/KQ=;
        b=vK8xzOA67Br7iNeDHu6iDhy/cpffUU2gRudAvI0BZH3O6Ef+yOy/QOHKrzirUIsFZd
         ottXCpg4lfF7UNBDAhwjeyvzIZUNNnYoiIpk8HtNt1r3EaNY6NW4lAaQri38Zp+hCg0z
         ssEC0T3EUgN7yy4+9jIZxFNfhqxAglBaFPIyj2t8dLaMvky21J0X/M47rkCJfxE0JU2J
         MK5hQPpZQVyOpzb7I/56b+0/sjtW5KdQd2t5lmsiIaBDSIw/7HBLCL/X7XefEBtoCQH1
         ZD3THjgx3Cq29aDMNKfHpWaqNYwVKNdybyuOtWSGTCaOJpy31TfG35kZfHT8mTIR9sHA
         qe0w==
X-Forwarded-Encrypted: i=1; AL+hErGj07gtad+5T3QQRQbKPhWLCUNiL1pCpguY9CqfBHccfbx1C1faqJ7QfSFWxqAZsyjYy8w+d5BDqxdZ1+pxISpnyg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+WIqA1nrX/7Z7at0qpEfOFplIQVDmVX2j5bVr2h2mkhzTirzcE
	0P3vUSNuIrq/nEBQfEkcwNwvJZmYj8WsJT8ftBKV184ezzWVBuaIJO6W
X-Gm-Gg: AZFdTZd70B31tE95WAzZSzWtJfFQ2IDYL2yKLvSSb2F9GmbXbsfHZdWssArLID4xKb1
	PtnHEi+L7GvNV3o8os3B0y+wTnNQLYT6pVigIcHYvaHKUJIcuZG8aD4OqeBBv4wO5zYwiN1r/UC
	Ngxy6RXVmcqpnvWyIAeadBExq+kW0MZqjTeB2/VH+z20t7R2+n3SxVXF3x86z4SKwN7WPVOwJwE
	8Qxo3jSOK1gAYsvn65yPwcRGn+4F1g0n9k+rRZtRmOlzWbGT4ORU45AOn+d698RnP/dpDvbfx8k
	9WKegBPD6vDmqUiH38npTYdGd4JIpXOtS5Xc+FzltVWq2pfNJ1qJMNAvm12Vqaw1bR3bMa1oG0y
	Y7DP2Kjau+L6v5ZrdJbfGYmNRSaafbD47gcNZnalMo0Erk1Oe2C2NBnMo7S4ASjxNbJ6WILk4tV
	7BgcNY6Q4vqxa0V+6poF6eh+J+YLtSxuxYoLGkMBS2YHNB21wBFNlFB3D3ucKjGC7CFkzffYDQy
	3vAAzYr6CkPjh5Ot5BqwubwIOoeepRb+ZxELlw3NkAMgJkCgvX/bupq1VsDjOcdoXhnt4fkoYvf
	eFCojVXloU00/7CN41W7u/Wy9W+Fxd7BZDgC/fLR4Ij/6as=
X-Received: by 2002:a05:6402:1f4b:b0:6bb:1203:487e with SMTP id 4fb4d7f45d1cf-6bb12034b21mr4236672a12.6.1795635087911;
        Wed, 25 Nov 2026 11:31:27 -0800 (PST)
Received: from localhost.localdomain ([195.155.168.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba371072f6sm8924419a12.28.2026.11.25.11.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:31:26 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Exynos850 ADC support and soc thermistor
Date: Wed, 25 Nov 2026 22:31:23 +0300
Message-ID: <20261125193122.747908-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
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

On Wed, Nov 25, 2026 at 02:23:32PM +0000, Alexey Klimov wrote:
> This small series adds support for the ADC block found in the Samsung
> Exynos850 SoC and enables the Murata NTC thermistor on the WinLink E850-96
> development board.

I tested patches 1-3 on a Samsung Galaxy XCover5 (SM-G525F, Exynos850),
with an ADC node equivalent to patch 4 (same reg, interrupt and clock)
and the board's three NTC channels.
Readings match what I get with the vendor-style sequence (re-init around
every conversion, SOFT_NON_RESET after reset) to 1-2 LSB on the static
channels, the NTC channels follow the temperature, and 200 back-to-back
reads per channel show no stale values. So initialising once at probe
works fine here.

One small thing: channels 8 and 9 always read 0. The downstream driver
uses 8 channels for this SoC, so MAX_ADC_V2_CHANNELS (10) may expose two
channels that don't exist.

For patches 1-3:
Tested-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>

Adil
