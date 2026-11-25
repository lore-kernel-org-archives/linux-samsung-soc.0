Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616622;
	b=kck8XFNralyj25HZIFS4kk+CTci81u0HKKN8k3EeGMstdW2PexVe5oVq0nlgZ8TnZGjV
	 bzTT9zr9/e3azBQm3T7KbmBbZtaW+8/DGoYLrme2nuvR81IHxn3L4cZlItqKUMsmqN5Ig
	 iMoBG/bY97NlVSAHyK01IbH5fe3nNn3/c+N8TXXFlvgdHekY6rThc22QBk7AJpVjcw+br
	 DAH8dHszQU26/IIRVOeRxVHnQHyzR1fVwIkgNDKsc7wUSNA8g26DgGvhhXq2wIjoomu7u
	 Rh0BLH3DeNoQMXSHJapiiyr5iIOYtl0PBSeI4SzqeEUmIFeSVf2U4fSoZw5R5lFfVCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KKiLkuiHStesk5TE8OyB7f604YZ0z47hf89flcQlAyI=;
	b=AP4yU1PW9vKiOSlvA5XjOEWkzTZwTdZ+pxGuy9Grb0/S6Fa0buftfhU903G6UqKQZuM4
	 DSGyQ4Cm/halQb6hb541bDkxNgYUUreHuA5bPGveelaUtbJbbStxEhnz18wku9N0GDkEq
	 jGpN2xk/6g911dNMEyEc+kvFfQBGAwK6h8+ys6BtCtvZDus1Jr+4SQLJe7f+5c+EEcd4G
	 SChseZ7SlT51Bluk3DlT0mVnrVjOz22naijtEkLpEAOFtTvWEIFt9//7FsL5DQdZwK1tf
	 9GwIYt8Jj2X83/fPq+Jj1KMag34j9nPZpmMH569/dkUpAxOn/NalXmlnFBlZHLYErgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="gg/btqQS";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD23606A336
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD23606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gg/btqQS
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so4796950f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616621; x=1796221421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KKiLkuiHStesk5TE8OyB7f604YZ0z47hf89flcQlAyI=;
        b=gg/btqQS5JggZWL3TBR5DJZDXCrqBrKtiCDjEW3U1VgUBoIKe/l0584+imxrJZ3Qml
         GW+Z9qFJDUSQolFMA4ISs3sWUKXpeKX4V44CMTWwUCKE7KcjCoDktCxaEDL4ZXV3wjA5
         kLOVWN2tWPwrtu2uMg6xL7whDmSwfN9W1sOYybgw2bDqmm3K8EbEgaVPdn1jSJJ2NVkX
         ajq+L0ei0ME3Pf99yPOR31DhDDyp6wweFXm/hvGih1zNycY0kNpgKzhOVzHIrEsGyjIM
         YPJ8gzEZ83xabgHMKdMnKX3d6JDh5Bp6MF8ktuthl0nK+liF8D5D9xyjGKqmkHDqaWGu
         UMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616621; x=1796221421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKiLkuiHStesk5TE8OyB7f604YZ0z47hf89flcQlAyI=;
        b=ZQDj95Jooal8Qf5KF61PSa6YqeyBuL01DfY9YXxJuQcZF4eObslMObJ8gClCeF76UX
         Ehaa652Pub3t0KY+UNAzcKkDosRj375fgDtBVLXMhX/pjWl/KAd3dgGj46ryjw4GlmfK
         ZjAQumfQCInNCPRZRlUZF3cQUbYUBHrjbnJPWPkbtvBrx4Swqb7lz8x7wCP2/msGE5KB
         xKtd1JSGYprugz3pn/rppaawWWDrkWovUopxMPe1i8md+nWwtTXAjrdyCusQIPFhlgT9
         ZMgNm3Xhh/vSs7vt7x0A6Yu4QqKNQaotaBiF95kSc8ppowALBxN0ckD6FecPkmOlegqA
         6FUA==
X-Forwarded-Encrypted: i=1; AL+hErH0YJ18wmsK/TWs88Tqby6QuF7u+3PLg8jISKBiacZvIcn1NjP9dj5KWnTpgtnhf2K5a9taQAFHQKU8pSC3c6waxg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9HbYQ8VVKh+dswgIcD0nsnVKruD5mIVOG2f19aDfxrr1YG6CNg
	yu2BBFOb7RbzBrRW5c/YymvoXQ4y/3vsJ4T9DhciCsiB517iV7pNM/00lx/H2M0A0TA=
X-Gm-Gg: AZFdTZcfOeDnZxpjk5TRVg9EXmlld47sb/ww3H8pYp+OidzUz9dCfs9zz0qSWefAU/3
	g8PCzBzceUZRair5Fi+y16qxWHGa7tyS1/qBqW4qPbOr7gmziGV05ssSAYkpMqR4ihHUGw8R8MX
	qZOE/Mlk++yP5bGkjx03AxON4Xf7bGFnVprvpyQqa3evmWaaD4HBuwvlT8hIvaMQm0CUWl4Uo/I
	2k7FXrbemJ1mkpbm5HZkRYHMNnJwZSMrYKmyX86AiIcMW8hKFaEEsHD8TooAVYDIfA6WHdZIcXc
	orlcGx1sC17xORq4bJ8+bd7Gop+zBfJux0KreFdJtEfSWBvjdyyXk5ZKHkKoC7qPLUvX0WtKswi
	41sGfhtKxYbPGlIGiBr31AfPVkVAEBbeQG8ogOf06fLOJh4b8kWgtZRnscoItB2140CxY/I+++Z
	jwjPHH3SSs3gCQk7q90V7szfKZ+VYLj5GuNfd3XrqHBLptMo7GAY/NCxy6bCBGxWOTSiMW06YqK
	tnOsVBm6+NVUfocCUPkcNcTaSohqRI9m+n6/iAjaweAXoy2I21EG0BifiWsov+nTtvfmq82x9LX
	wQPKc6VQm+ESLAKVwDgb05xPVIGY8r7SK/bVzhWLOM/qd6scNuRuo3C8uqKMDGnrQxi0VUnzEqL
	EApEbn19Tw+fVYI+D0RNPCQ==
X-Received: by 2002:a05:6000:41d2:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-4abb0c5d65amr34428066f8f.18.1795616620901;
        Wed, 25 Nov 2026 06:23:40 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:40 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Nov 2026 14:23:33 +0000
Subject: [PATCH v2 1/5] dt-bindings: iio: adc: samsung,exynos: Add
 Exynos850 compatible
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
Message-Id: <20261125-exynos850_adc-v2-1-26de1c6f1717@linaro.org>
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
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3

The Exynos850 SoC contains an ADC block within the CMGP block.
While similar to existing Exynos ADC v2 blocks, its data register is
located at a different base offset (0x08) hence a new compatible.

Add "samsung,exynos850-adc" to the devicetree bindings to differentiate
it from existing Exynos ADC variants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index def879f6ed20..90a220e3b78d 100644
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@ -18,6 +18,7 @@ properties:
           - samsung,exynos3250-adc
           - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
           - samsung,exynos7-adc
+          - samsung,exynos850-adc
           - samsung,s3c6410-adc
           - samsung,s5pv210-adc
       - items:

-- 
2.53.0

