Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7493913F43B
	for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jan 2025 09:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736068952; cv=none; b=VUmDG448+DMCe0k1wNkT/gvaIOFSzLqsfkA/IgS0ZalsHvwSIm0ZHtoVdBpS7w/Pam8eZmZy/mTOuN1YUj+0S6kli/MDRcL9J+z4Ugr1Y8GUKnRx6cR1ZCo80x3W3aSVoI4T/a1xh0rorUoaf1ZRTps51ddwMrOLUfPIUmfFbxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736068952; c=relaxed/simple;
	bh=/7T74olyLTMsnICKNiQMvJ7x8TpDCCveLq2c360v2BM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=piwyp2m0Tc0Rw7tioP3xpBrQFhK7+F90ZsRlBfTaz6m2QEX1njUxZBKPP4Sse+VJ8CcyZ/qlup9MpHfWSfR3uuSH1DTsyXNTy3GQ2Qf/v8baHCCZXdnhsU6xlmEgzC7el1ve6tnzSDHWB0vX3T4iRZF/AoK8iIiALQK0uKK+v5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ihmy4dvr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ihmy4dvr"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3862f11a13dso1630778f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jan 2025 01:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736068948; x=1736673748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nelteoiqxNRf7ioY30lP7anjKbjLjK5qZE2TjaLHA9o=;
        b=ihmy4dvrRZzUEzcDj2VOFEfrjJ1Zd2qmj8Fjam54nSvwURn7/N2mkc43Io2Kam18Hr
         x5XgBZJF8Jmr/ZrKjsgxel0iFTUfXrfUbRO+VbU8LjHfMrmctterJrZMdqGjMsKViDbN
         /H8ZOLH3B9QKFQm64Fc1jh/A4vQ/QQxyocinv85afpSeTu30hFU6YUgB6AbJ3wMw2Ffg
         qsLWoHTB5veyN5yN07Fkuvx4xGSDBaMbRySsHQJgJbzrcra6gWxTuspbMXAIORfcE//y
         tlAv2iWxk8MB1xViqGLvPGDiSeofMlDuD9ePVwn+Yq7zylcprVZ3EfDdufen5U9s2tkG
         kTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736068948; x=1736673748;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nelteoiqxNRf7ioY30lP7anjKbjLjK5qZE2TjaLHA9o=;
        b=FiB9vWA8+WPWD1Zeqiz28tVCtZaYHzZ3Td+r23MLTidV64TnkxI9quEwbBDS4PNVMs
         wxL2eqvx2Xc5EBxcS8DZyFLvIfzsaihQPBBXTSUqMBVY3OqSbAdnRTLWs81AiCISiEXD
         rCDSUauFroykQPVIhQjkDDtvvKfFlvJxj8KkjifBpFmpfk7/uCSmnUoABOZU5NKz9f92
         +qXZ7IMijiRhuHcRhlQOt26UQiuPoEi1jfPmaCDxoIkEZy+ijUR4d5MYglPAitCawlSK
         pHMQyBT4P0MGuTX2DGFmZoql6SlLuYIMAykYyElkiunL2EXG3ZEmV1Nh6kbmviO/F5kc
         D67g==
X-Forwarded-Encrypted: i=1; AJvYcCUXAnnGJvrjA/la9hapg4OLNUkA7fzGwd4+ettSpszhN8QfcEZEB1SakyiQj4kFxFUh/t2kATouF23EJnFeihvfuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWz0bCu22YXWW5PpuLvwbqvN/jNJy9pWJENifh2rQpjbDDq7Gw
	UGAta7OFpIYHTRiTTEYqy7ISlqeVLyRBWe78KlD8s0UWWhGXX+5PW7RFtOm5G2B4pzQ4ugm7PWj
	e
X-Gm-Gg: ASbGnctMVqvMUHNpPGljPUlxzGcVs9r8URbSE1DE8Cr76cN51Uf5QEW2+K8uXGYTha/
	b+yBgmxjK0nMb7NOvK/SnvBW/9suIBrvI7qQvsejvwqjQDlyqXHuzKVPE6PNVx1UuTwo+i1MIKX
	/WjOFaajafRpc2DmcSInjs6AemIejWA5/oH1MOJwj1yf04q29yAVBEYiwL99yNg5wtG/eSGVSGE
	mpzB+yohPSZKztcU8+B418bk43HipfEgM8cdGPiCtV1K5QF6cnq9oLrrmUZW+p0Te0LMyJZ
X-Google-Smtp-Source: AGHT+IGDynZTHl8e5RBLJUpj+lO7O7uXhax+G2o9Ltlfc8YfdRjCDTeADBI/fQ0DJuPgpHoXHMUDKQ==
X-Received: by 2002:a05:600c:5127:b0:434:a339:ec67 with SMTP id 5b1f17b1804b1-43668642e65mr197803305e9.3.1736068948502;
        Sun, 05 Jan 2025 01:22:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661200ae5sm533469405e9.17.2025.01.05.01.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 01:22:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250104162915.332005-2-ivo.ivanov.ivanov1@gmail.com>
References: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
 <20250104162915.332005-2-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: soc: samsung:
 exynos-sysreg: add sysreg compatibles for exynos8895
Message-Id: <173606894714.9463.3099242543235588769.b4-ty@linaro.org>
Date: Sun, 05 Jan 2025 10:22:27 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 04 Jan 2025 18:29:13 +0200, Ivaylo Ivanov wrote:
> Exynos8895 has four different SYSREG controllers, add dedicated
> compatibles for them to the documentation. They also require clocks.
> 
> 

Applied, thanks!

[1/3] dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos8895
      https://git.kernel.org/krzk/linux/c/38405d3825d883b9e6ae680c14b530f79709533e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

