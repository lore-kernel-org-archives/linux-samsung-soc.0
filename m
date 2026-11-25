Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616622;
	b=2J3meQusI4O8jcWCXldR2RJs1ggarn1w35mcaKqFgNLqzxGOR2huGl/fww9p00hwK9WA
	 xW+EUHztr91GVHkrFBPrBmnI0tbZK6w75D+wOdpVt851x1dqMl5TOV1GN6bJUOq+/aou7
	 +krjpQyd3fujhtUNsUIjDdno2g8yIvybSQU+JhQMoRn48ssW/Vq/ffRCVNI+MjDA63sc7
	 QVPmARg3okbZe9xk3BghtevN9Z1ipM+c5cUr9dMvPcZg3DZV1FQ3o3Z+gGAZUtCbrDE4Z
	 rcOKKEXGRYXnZKTB6mbIK20HLa7myO+RIL/kvYnac0BNDnU9SDmIzVgm1BxLmITTeaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=50gSt9hp6GSAIpuWnVDuHjwFxVGn5eyqx3CRupQkIy8=;
	b=JJLijXrxHfuKvlJLndPpTXp33XC84Lh4QFro1oGJrBUGUzkin7ugQfjneJRAgxPPcZ/v
	 ICS/5sZ8Tn94jB1PgXEX/IGopf131gjLjDtycqkMWpBABtf4slnaBZHaiIYKL8+gvzdM2
	 1lUU7FwOMCPLf7KAtiZk3N6ecIF1ohI/itjYIyO8KedpMqqNEABZYYe1aw7OMH+AQhk02
	 ylcgnY9i13u16NW6jpSOORaERS+CL9bd6Od6cb5KjdkzTHb+47MCV+7zhwf8f+Ry28pdR
	 EEvp8kwyW/wnSZAwSHBjHftXcJd+T4ul6kyVb3cibRQDproP5nj3vxLveIv7wUZ3tNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L1FwDLp3;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4B8606A330
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C4B8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L1FwDLp3
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so53453935e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616620; x=1796221420; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=50gSt9hp6GSAIpuWnVDuHjwFxVGn5eyqx3CRupQkIy8=;
        b=L1FwDLp3wHHSO7OHNJzAMqbMI3UzxX+e84R2IhF7FhA+JeTZBxBjUpwtiC4W1qd0jQ
         6/P62yQTbdXtRzJ/Chi1+ZzOPqKzPLTswybBmQtyQWMvqZrkX6njoV4qLwo/KuXFaPMV
         YP9bxcFGse8GqHNYMQfFAH8iONsqJ72HnCi9lmW8FWUD+rvAf/X4Kc3irkcnSyY+VfmW
         PCee0ToykhFaayyMrnwgg0VGw/RYfzR0BeM/9aHsX9CpVscUFq3rPcwoMAEjNhOFW8E6
         q793a99AUX52CWkhfNi2ZOiooz4UqjtVZHsdmGkJa72PfIVtOOYl20UWfx1uKGOzOjDL
         XKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616620; x=1796221420;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=50gSt9hp6GSAIpuWnVDuHjwFxVGn5eyqx3CRupQkIy8=;
        b=Qotc7uPa6IRon9yrVIzUEm2WxwgGKQakv63PW5HCfwmMqKtFahlM0cPWloQjTo2Rib
         sZjtn6xRQPp33kHJNB2G11wqb/PGgEzrQm5bUTk0UtHvVu6aDMo/QUTdTqwX727lg9JA
         egkdn5Otc0yrUXJ8+3RQH2cVDhrKhYx4q5kK84e7YaIcRz/hHTU1fUUbOcw/Qdk/ZC4C
         aRC9l80W+gtnf1XWNLYiW9rM2i0RNP3ue0I8GvoU9LPnJxDGUWa0EYUTooDb6hCP3WL+
         3cQSmPlD1Sgu7vJAojA6EI+GogwP9yZRRZAyVlUx2gfM/Puvckc1CUFDJEW3mSnOQzvN
         Xogw==
X-Forwarded-Encrypted: i=1; AL+hErGkhCnimr828MI1V7A+w4+Jhdm8CUuX93j+k3BN5NB7F8y1kVZxxieoSJK1bJ5t+fJi39pRQ061dGiYWhQMboasBA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Yzo9vX9LjGXA1LgkuoyHnO1Z3nqBLPcEkIoW9u8cJtR5/B2OB
	LeF/kjEKyMD0yiD8+dD9dMdRdOWtyMsmEVGYH0AaY8b+k65lLqnaaPSzTL3K+R+s5+Y=
X-Gm-Gg: AZFdTZeA/TghfOrACibdvqvjegKUP+BmXb0iqdHVpMnGAnPCyFT2PCtvjZDvxDcd26x
	+A8NlLprb/5Efpb0HAJCnI5ft5xTcyUbTaUHj4hZlkIGVSA2Ng8WMmZ9kAyvUMwJT10ykrdP+qO
	P17AVtzAQfqOoWYoQbwlsmpkgPs1xBVc0g3K8dy5B928hsXiK0/wN8XrfN1GN0qgFKpcnofLvDS
	o8HsJc+drm6M0Ml+2B1Kwcpsiu7sEkZQnHWzJ/8ztlhrZ2B5nAnLpZf5g4dRTh/1QKZ3n7DJdWP
	1c9dC2vzGQB4GvlHI42TOb8+w1xyt/kW5qVX8pT9FfaR5uztgSyGf0k4Qtov10R/6WWHludicPB
	clfX+y/PvqREw7iBbSwjW+sFoj49bTd3VKakHgi+A+u53aHXugjASGRqlBf1bYSoIItUim8LcN2
	JjLmZ3clEiYsDQSLW+El6sVvLtlQgzKz4d8dl2e1XglDM3tIM99Fvue7IbwWCYSewUcPOZ3bhPH
	MS526A1PpwZPiWNQTAC7bp14stqeqGn1cbhxi/WKheCo+T44MgD1o+50xS0wzR/+xwKfXktQCdo
	V27qn7/NwScNeicky6dCJV5dRLY3HgQWqZdAGvHR/GP2BpYQ8ArTfpv/Ymnvoly7M/cV52GRmey
	GnTgd9ONeNNW1W/qXahUw8y/EIaPxVBsDrNySTv/k0Oc=
X-Received: by 2002:a05:600c:848a:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb88813462mr315204935e9.20.1795616619785;
        Wed, 25 Nov 2026 06:23:39 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:39 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/5] Exynos850 ADC support and soc thermistor
Date: Wed, 25 Nov 2026 14:23:32 +0000
Message-Id: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MQQqDMBCF4avIrJuSscSarnqPIiUmow6URJIii
 uTuTe2uy//B+3ZIFJkS3KodIi2cOPgS9akCOxk/kmBXGmpZN4jYClo3H1Kr5NM4K7QdSDXaWNc
 aKJ850sDr4T260hOnd4jbwS/4XX+SlPgnLSikuGrsLwqbvtfu/mJvYjiHOEKXc/4AEKyE9qsAA
 AA=
X-Change-ID: 20261118-exynos850_adc-9cfe569acd8a
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 Sam Protsenko <joe.skb7@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3

Hi all,

This small series adds support for the ADC block found in the Samsung
Exynos850 SoC and enables the Murata NTC thermistor on the WinLink E850-96
development board.

Exynos850 ADC is also called ADC v3 in downstream but my understanding is
that SoC names are more prefered.
It also relies on PMIC 1.8v regulator which currently represented as a
dummy one.

First commit adds compatible for device tree bindings, the next two add
the ->read_value() callback and Exynos850 support in the driver, and the
last two place things in device tree files for WinLink E850-96 board.

This was tested on mentioned above devboard by reading reported
temperatures from thermistor.

If dts patches should be split out as a separate series and should go
separately please let me know.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- split the Exynos850 support patch into two patches: the first one adds
  the ->read_value() callback and the second one adds Exynos850 support;
- added an empty line in adc node before status = "disabled";
- Link to v1: https://lore.kernel.org/r/20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org

---
Alexey Klimov (5):
      dt-bindings: iio: adc: samsung,exynos: Add Exynos850 compatible
      iio: adc: exynos_adc: add ->read_value() callback
      iio: adc: exynos_adc: add Exynos850 support
      arm64: dts: exynos850: add ADC node
      arm64: dts: exynos850-e850-96: add soc thermistor node

 .../bindings/iio/adc/samsung,exynos-adc.yaml       |  1 +
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   | 22 ++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi          | 11 ++++
 drivers/iio/adc/exynos_adc.c                       | 66 +++++++++++++++++++++-
 4 files changed, 98 insertions(+), 2 deletions(-)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-exynos850_adc-9cfe569acd8a

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

