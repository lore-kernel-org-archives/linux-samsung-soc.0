Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616627;
	b=Opgl916MHXse20D7TlNu4QPkNLvlBSnzS7g8DJgy55yahobJFtTkbKGPLtpWox4ZeEc2
	 12bdNP8Yqb6bamhWLCODjPOOwEEBjqI+C3tomuB0rR0bJGvqHdwfkmRGJQSkZ1i/KAi87
	 K/nmCWhK6iZWMGl6NABz7N2VwTLugo3UuDe/lP+TbCwGjo0cAEYojcoIFkm0eFOP/6rXk
	 dU7/FbcIqNPHUUvjyIPIhX568HkAUK+jQwWRqHL0IVXmraPC3P3AHnXxH/V3svpqC2R1f
	 Qz/wyGeDJWXKazGgUWLOTm9/8Ehr+o5lLnNaxwgA+xOcILo+tPOoLFWDheLMRBPYK+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Ny39IB2+v/C8PeHVkJtEArwIrXSQ2C53NR3LzL5C2wQ=;
	b=KJQ0pzGwv+mee+6AzDWV6J9HIYD/W8gwrLlLhHwFyy2YgnfsDVZNF9vU6ll1PPN6iTb1
	 lwUstRCRTg0lHKpd6dPbZm0OOQUfh9X5liVVEgmUmSU7cFknz5Q97W7JowamQy39jrFxf
	 Q4tw34kCORc3VMam2s8PvaHFpGeOb67mb58BBTgT4NsT/ItbzNUd9lm7srXw6BPXDR0FM
	 1+yuV2BpGLCR34kzS+8i80eOExdhcxQTuZsX5BwhuTQxfRB0ToXEcQuF6P053wDOnvYR+
	 2aiNHJUwF2avaFUisCu7MiTu525zu+eHgglBg/fx2o6riaDO6z414zMpB2au2G1scsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=izlRGHSP;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F313606A327
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F313606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=izlRGHSP
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-498f5fa5103so3476884f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616625; x=1796221425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ny39IB2+v/C8PeHVkJtEArwIrXSQ2C53NR3LzL5C2wQ=;
        b=izlRGHSPk22Pur8KnK80kIAy9Me7FWkb05DdT2sFdYCSPlI+/bTGF27iUjHjw+Nipc
         X3MKhms6E4YCZM/I2CdXMBy83WPurlDASiPn1RsO/1SKm6EWYtxJU3VY0Rj2/3ygjY3i
         FL4gzAG9koSN3qQF8HhR71CAz15ItOYTmdqwUUe7x0d112vku2Whlbnm33QUK5oIQVjM
         9pcCFBCvZkfdTj7yUOcLOjwWvevosMHHPyFThtM2vkA8ZQ815jFJGM8LHyoGJwZiB/fh
         eTrv1LCuV37cVTlZKdIvzsBd4W3tTw1AwjMF721yFpJuQqn+HNoVREFfR+Qtc4j242/c
         SF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616625; x=1796221425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ny39IB2+v/C8PeHVkJtEArwIrXSQ2C53NR3LzL5C2wQ=;
        b=KPDikwdF2mQoZ1pinkOBYMqxcaWNtDJ/WDa2fSVGTXkdRKKkogpBz4ieZ3ZpgmA5KY
         j2Gd+CS0rHQO+8uYUUkUR3EZ1nnGEhN2gRyhshmOvLlVnMxeAOZDc9nx11pTUYNZkT/w
         oHqHlYJQPfttloXHmltR29Zw/ia8cwbt5+LGPX2WgVRwwLVL0xgO5oniwiRoT0LHf7SI
         yjuo0qlD3T3lrjjCxXTS6/W1kH3DxE7+Ug7rVRwQ1DJo0/TFRG1QMhTU6eVaHXvfuM87
         pHNn6WDtvO3oq/mLsIspCYsoIHYpDOUbiBZpeBlI8b0RyEd28toIg8gJDPeS4U64VN+C
         NZ0g==
X-Forwarded-Encrypted: i=1; AL+hErE1OCEFLCbrifEFJJ8hHjWUp6Hj1EUKcfPHxdboeuVundv5SXKKfmF/gF6rgWWvVlWeH343yYNLN4m7dvQ07C9uXQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9XdXYXXVqTYW9XHiUiNJpsSeF2C609coZljLiMruhJozajDv7v
	K26incEQtDOPJj0G5TwAiX+6Jj8cvBn/gcUThqH+eVul5CSBKDIq/8a9rvBzWNe+Ruw=
X-Gm-Gg: AZFdTZdmTYrgBVKdo6GdFMAC9ffOmuQQVtvQjBRAqYctaQHOPgiKWAD/cjMbfL3ChMY
	0a0M3d0q4k8KsXYfCbFx+4hPARNWPnwfSk9i2KsSG6TH1Sfa+sjofkD/JvnoRNUTjeTO0N1U8Sw
	yDlx7b/+YY5ejwJ8rOyBNU+yLNeJ7MARqaEOr8HERIKjYjsyY51RmykiLHOxsv3mpwhj36jr3/t
	vsRnDe1zdGfBwkgf1P/ZUHcW6spR0okLe6q6DlZ841HckHz61kfvBaPm3t/qAGsqNkdAOkcZ2JP
	JMQtdPsqscnU+2iloONxids3SNKjOUOUjA12sfR3yDErAOiV6lGQAVAuuuT87ejNx98qQX+s2+V
	2zALw9wGCkUc/zY9tk9I8qnM6T0ZwHaRRjDuXGVg8W6w9yPnvGdlMq6xUI/gTDDle2TGxtCpLOb
	tkhpfnnBz1zUenhz0a5X+m6avlU+w8nm9yF07D35vAV4SyGWBo4qIzHOs5amUaYEibvREQ7xh3P
	rsI638Ip3UOGmAd/buAR4zrArhTiaJf/LmOMPNyMbzlzv57LNyQYr+44VNnHgFd+siS00Pqb1s3
	n8WYZM6QnkMlEz+arJv9VWXBqUq59e4x1VUa2ofvFzvyjIhdeNUy3N9bcfeuU8RRYgDT82TqTPq
	B4sVUrKq2sCPoPZeHrCg5Fg==
X-Received: by 2002:a05:6000:2883:b0:4a7:a52f:a2be with SMTP id ffacd0b85a97d-4abb3678d88mr30767537f8f.13.1795616625424;
        Wed, 25 Nov 2026 06:23:45 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:45 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Nov 2026 14:23:37 +0000
Subject: [PATCH v2 5/5] arm64: dts: exynos850-e850-96: add soc thermistor
 node
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
Message-Id: <20261125-exynos850_adc-v2-5-26de1c6f1717@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
In-Reply-To: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
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
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.3

The WinLink E850-96 board has a Murata NCP03WF104 NTC thermistor placed
near the SoC package die and connected to channel 0 of the CMGP ADC.

Enable the ADC node, define a dummy 1.8V regulator supply for ADC, and
add the board-level thermistor node linked to channel 0 of exynos_adc.
Regulator is represented as a dummy one because we lack PMIC support and
should be replaced with a real one when PMIC support will be implemented.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
index afef32ad4ee2..1abae8b9fa49 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
+++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
@@ -126,6 +126,14 @@ reg_dummy: regulator-0 {
 		regulator-name = "dummy_reg";
 	};
 
+	/* TODO: Remove this once PMIC is implemented  */
+	vdd_1v8_dummy: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_dummy";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
 	reg_usb_host_vbus: regulator-1 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb_host_vbus";
@@ -166,6 +174,20 @@ rtcclk: clock-rtcclk {
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
 	};
+
+	thermistor-soc {
+		compatible = "murata,ncp03wf104";
+		pullup-uv = <1800000>;
+		pullup-ohm = <100000>;
+		pulldown-ohm = <0>;
+		io-channels = <&exynos_adc 0>;
+		#thermal-sensor-cells = <0>;
+	};
+};
+
+&exynos_adc {
+	status = "okay";
+	vdd-supply = <&vdd_1v8_dummy>;
 };
 
 &cmu_hsi {

-- 
2.53.0

