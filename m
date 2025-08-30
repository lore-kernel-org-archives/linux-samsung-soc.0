Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DADA261B99
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756545604; cv=none; b=jkTSZl6sclWhP+D0j7fOcG4XQBkg2qMKLUlRnbXFWrfEAMeE/ktTzqwZRw9GgbuL+65VLDRRuiug8Hh0yC4pU4jTmnEva/pyK5ye3bXee61OrmyLfv/YW8+9lVIeBoy/yTJGBNuJawXqryyDUjEpkzXKZapBocsBjG3uJDS3c7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756545604; c=relaxed/simple;
	bh=vKZxK3WqSG869YK1ejnNRrbE9AJOdCdAIjU5uTihOao=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bK6/6xehEZnACsjTCW+te4di/OGWyFdrlm1klKyOZxEyufBTHTi4Kw+bNI1yaLCFSYE7sa8KsvqUo3kGpybdJUIuKzvkhj33MK49s4fMlKJf83bjOtqdn89GtuUkSP4477bP5mFPuDNqA2bgub4e+7FumetAMumWMixc+DY/hcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c85Jnuhg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c85Jnuhg"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3d323be1617so3577f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756545601; x=1757150401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18xNVcTt+Ut2Li1HIkvZ7r0gYk2tthQkOl8QvQYyxWY=;
        b=c85JnuhgFQUT+JCfsBEPePhJ7BRwIpFnWifWiLtlAEQNVHK1OTjQ28z7e0PNFDEQul
         ZWsv6tD7u/t2dSbKSBfQNxV/rzQOvWZmE3dn9zJ1BLBVUP3pVPQhnZWykqhMwEPYovmd
         93D+c5w9rx3vhTsh32MNa/XpTlM0atuMbZOhH2/1St/6DmXI36jOpfUtxMzPGzIHrjqr
         CySNcsaPyPr0wCtc8RTfWMnh13Bx2PwEVapXdo9l8M6OQWCyMaNvYeET2k/A64gszMnS
         qknlMJTr35Szsnuv3z7YC5x+DcG+xLJ5jnbkja78wXVNnw1fhtzFMqm85jbfGr+zxEzz
         TyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756545601; x=1757150401;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18xNVcTt+Ut2Li1HIkvZ7r0gYk2tthQkOl8QvQYyxWY=;
        b=NErEv05RJZ7OoCZVnkswzVVn+56VrhlZFeXi/bZKcMB6fHwxigAgQKnGB/vr4ajC2y
         66IMnfvekbKEGJvGMfZk6gKV6uZsU7fwojy2/lmJWVPQnKHBmnwCWozf3pNbR2gFNjqB
         vSD1qKmYRaD93LvAD5vjSFLp0+KPth3crRMZhJrVIqPrY7bWYj4myZ/h/JfyezEjBaH3
         4AHUAZ9otfJrLoPi0jXrpAXXCe2oT3j1Gv8EWStuoHQmI/e/tD5ADuRCyQhO7fsI0yq3
         ErWOSSITr5QPWO2gUdNxAaIz+ytquAWae/OwMFjl0kQ3JiIwG3eFKOPYyjh5l9TIPCvG
         kitA==
X-Forwarded-Encrypted: i=1; AJvYcCWFRSUxpmg6LzI4scmRSMshj4vBPG3gx2OlOBMpLR1DON9BXjAPeAjD9cDR5YrI1KLWLTm/aLEuQyKITyxyrWOiLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylCaHL9Ae3HfUIZAbTC6j4rQA4lUEKgZ6qKeaKXGzqSenf4XSM
	AiFyVYxjuJ3iBb6+qSOf9edS3pad0L2Nb6VSOhF3D/uIMe1shuiIw3tkUeMV8Dz6Arc=
X-Gm-Gg: ASbGncufP+eEUlYNtiSwRYcbqgAwBU/FPItfV8cEoanta1XiH83AjV8lzraaWGz4ItK
	GnNlQb0mFGqstqsIwB+XA9wGPcFzOr0F2VhXCB21MCxH9xJ7S497jTSSqaAWE8KPMQc/fE2t156
	Dor0svo6xyxC9HY1EnE0L8Mw/P2sWoWnwN8sQl8VZiVviOe/TdlnbpfJWI62sw/jgbFzMYNw7kE
	BUp2Mb+DesFb2kADUJxFmsfSBUbXCmA86KRGtmiKaPp3gy79vDp6i/6cK13upinpzRZSFreZrsD
	pktsFmbSOGJB7QbYL5ePl6DxmkoAf19U4yYZ/wFWSzK/Icorwad2uYVhpar49TL3fLB867NLkH+
	NVxjswcVXJz8oVAq10a+VLWgadHTanSbSvEi8Ifb/cv5m3R3aSw==
X-Google-Smtp-Source: AGHT+IHwLu3eO3G/g09J4U6BQtf6Smm47bmXXP9dfIdI1vYcv6TcxL9zbzWeDgmZ0/d3DtuvTitzvQ==
X-Received: by 2002:a05:600c:1c9d:b0:45b:75d9:2363 with SMTP id 5b1f17b1804b1-45b8016df84mr21110275e9.1.1756545600887;
        Sat, 30 Aug 2025 02:20:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b8525a94bsm21186815e9.15.2025.08.30.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 02:20:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-fsd@tesla.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250822121423.228500-7-krzysztof.kozlowski@linaro.org>
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
 <20250822121423.228500-7-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 3/4] arm64: dts: fsd: Add default GIC address
 cells
Message-Id: <175654559953.10738.12020984387702262826.b4-ty@linaro.org>
Date: Sat, 30 Aug 2025 11:19:59 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 22 Aug 2025 14:14:26 +0200, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to GIC interrupt node.  Value '0' is correct
> because GIC interrupt controller does not have children.
> 
> 

Applied, thanks!

[3/4] arm64: dts: fsd: Add default GIC address cells
      https://git.kernel.org/krzk/linux/c/a874b387213bd80b1288884aeb427cb7599eb5ea

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

