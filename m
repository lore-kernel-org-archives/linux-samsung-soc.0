Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929AD3CF47
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 12:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705926060; cv=none; b=TPyOXfXB6rohyWkaXH9QgYPcEX68YcWcEQ5U6UDmLJ6qK4NA3D/0C8lJgW1JgjlSj6WChGil8CeSZCtUCRrT984moI3Z8lI6aVI/NHdwQp06mfqjmha1y/u8txxZvNH+Z52LM3yz8sIl6biBltmA3jMeStywPMRUbMp0Bl/NA64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705926060; c=relaxed/simple;
	bh=YZ1z2j1kI4ddtowX/6pc2qFb6DJElIuVdVyPI0aRULs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i7VbqzDYya1DGYumZN3ALICpJUGmlX8HKpefXuePfMSuCkovCueVdjC4Ti+1cKwVcbPhdDTaZD0RZR+twwZ6mu7dRziy1CHJ00i4jBPT83PZSF521mPca++qk47J/P0Fwg+62InybHQEGI8be0n5VVBbjK1AZz3NhrrJXuNOSjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IaObIRu2; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IaObIRu2"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-337d58942c9so3347468f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 04:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705926057; x=1706530857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kABQclCWxHgPnu9QJU5EL2/wY8bNoLCbrJHvsKEUK0g=;
        b=IaObIRu2LGHDgBjnVeOjxwqm2b5YccPLyvTxj1G16DYPhRyhEMEkJN1wWToBIjpYy2
         Glf64g2ijuCgXNjrA6VYzE8Eva9guW15yCdBR+t/o4R1VyFDF6GSuZ6dG+FFihuLxYz1
         gnlAYQbMOu9sWzjyBSwLYBvjwrGUFzdr5l/LQEZXmu//7bp+uijA/bJZkIfAJuoqYEDW
         fKprjcjkFJZRdoHY5TSJf296I6BB96HtTLwkdmktn4gIFUj2TztSEyc7g7DQiAqwoDx2
         IwZzqauTGZidfT2w6oKjymJEBovlFPW7EhxXqultjXu6CO2GmgQya1KDWshqUfpPa/9M
         kl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705926057; x=1706530857;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kABQclCWxHgPnu9QJU5EL2/wY8bNoLCbrJHvsKEUK0g=;
        b=KbwxlKWm3z8pKnosVjnxC5C9RtD0VvEDT7iaRQ6OvaH6hxOCEJqtF7s6vPrtCRYXH0
         Nvtfx+qW9DUAmq4TFbUNMSuHx2gtSTwVyaMnL82/MYHeR8A9vODPxRmKko2QtRkaTz9Y
         eJwkulf70B3NECn4R6rwG3C2nT5tF0Ofm34rq6T7I5U0ykmYRnznOGGD/33WzrFXttNS
         6VwzJFDEpX7Af6OZJwVni/WYKrDvVPukqpZ0s4ERwnKtC1P+jsxTCC/GOwG74+LYdIvE
         3hTS5MfR+U6YKueHeqVSbXmm3Efb5raGQZ5ES1kzJ2qk/p+atbLwhy4mSSARK17iJvfG
         GG0w==
X-Gm-Message-State: AOJu0YwpPXKThJkXGvwyf1/8JBSNSRW//KpWzkJ9Bpy6DHjhrzH7KtHd
	+B0IDP4t1PgHaxDv6wcjbLTnVYSIrpjXTGaCDlz2D/N+Bvt6xU+wHRlQgD4muYQ=
X-Google-Smtp-Source: AGHT+IFhqjuIwtg+QmXyJ4f9r6mNt1zxG6VLayec6ocn6/EHmN5XOjRCUa+vR9FMXnsULV8fzYl/Dg==
X-Received: by 2002:a05:600c:4d02:b0:40e:49bd:a2ba with SMTP id u2-20020a05600c4d0200b0040e49bda2bamr2368821wmp.86.1705926056443;
        Mon, 22 Jan 2024 04:20:56 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d5091000000b003392d3dcf6dsm4585801wrt.0.2024.01.22.04.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 04:20:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
 cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
 semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com
In-Reply-To: <20240122114113.2582612-1-tudor.ambarus@linaro.org>
References: <20240122114113.2582612-1-tudor.ambarus@linaro.org>
Subject: Re: [PATCH v5] clk: samsung: gs101: add support for cmu_peric0
Message-Id: <170592605426.49653.1635174301896899185.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 13:20:54 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 22 Jan 2024 11:41:13 +0000, Tudor Ambarus wrote:
> CMU_PERIC0 is the clock management unit used for the peric0 block which
> is used for USI and I3C. Add support for all cmu_peric0 clocks but
> CLK_GOUT_PERIC0_IP (not enough info in the datasheet).
> 
> Few clocks are marked as critical because when either of them is
> disabled, the system hangs even if their clock parents are enabled.
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: gs101: add support for cmu_peric0
      https://git.kernel.org/krzk/linux/c/4bd800aaf96f880d45b1a28b2f78549a0f5a3a1c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

