Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B35A7FBBD
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 15:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707320305; cv=none; b=t14zLAzjbNF9l3JIf8JKLwi/eJB+hAu0y9x8nKu5L5++ejXDDEdY7MNGf7ubx9jaSBXhhxrHDbuTFCMfeSnrtZkomAT9nkkTVhmmeLA+bfaabktQKbxKBJSZg70HZ/zw1NDxDAKrWV3WJur6EWOInByMfCLcd2zrmltLAjcreUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707320305; c=relaxed/simple;
	bh=KhZJ03dYipjwFcqVTi1aSAQlv0cbuqRmx+mNQPbXxok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QEecoILFxhqlAF5Ja87iriWP80GZ6YucHSkt/s2e3tG9sfTcu8CCPmpqMFlZFGj9fsTDc2Tg3oDQq9uTl5Mb1qM6wNa8wY+z9/QgBlbpvv7l8ChKltKYn6iWRB8/cnTgAJJ1iYUj4DbIVrMKqNCPBkfYNxmi7SCwoTD2BCKbipg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AnPQZ8K6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AnPQZ8K6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40fdc63f4feso7077115e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 07:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707320302; x=1707925102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GUUCb3BOvWfecXmlmaJRx8wdSzPZcj8prq/Fdr2cU4=;
        b=AnPQZ8K6mSSZh2RqnYVWy/kPHlw8Sr73Mk5tMwIKo1B8jwQDlqeSYN2FoAHeI7QUk9
         WoARVxqtFeEv2whGonLHlylXFCyGoKeLlpuRCXwjG+PvO3Rpn++nXC6cy6Xo2hwBWgbn
         y9ui73UK0vC0W8dsT3EyJ40Sc4nf98ccWZ558H6Oib7hc0wJX9MlN9+JrfLlEMo2sWxK
         foAf0LM/2AthCHMW3kam6MDYTQSFIhfjb5cv5+wFC5laCo0hbmycFyut3TSxov+YzNpk
         /eOuhh9Op0qWBtZ927zXOS7Ahb1jqcfDnY8tIs2mb/+cZbXJfbE1ESL/r4w1fPDHB/tn
         it9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707320302; x=1707925102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GUUCb3BOvWfecXmlmaJRx8wdSzPZcj8prq/Fdr2cU4=;
        b=rlue5ZBjx1IaX3vD+qAayi10BNk53IjJHjymI7BIG6RNyxE2NozUZjkhfAVumPV8eW
         FkkIUI5LuAEqrqVRiC6+A3qQ4hfMXGYTlH39g64Oqu36ie0naYklhuvdBJ7BbS0N9uJT
         mjEuVhjaolpul2NSpnOHMAN9CnpJ3e7cvdjRk/qVf5GMiY/iTSk7u0gMJZtExCHWbPzP
         9QHmhOL0xam5GLHv2HUof5KtyTzhtEAGnX85p4Zd1QlBShKiGJl3vMwYI/LAZ/fjyf+2
         zXyXPeil/g2YWByl3WMoYblgexrbLCMt0vUP0fQDi21Zly0dnyDu2C7LraYH0P2hio7w
         uppA==
X-Gm-Message-State: AOJu0YzWX5OmJPEx6Qxp+WzA2Ok/DXZOkBev2yzW7J+6WE2C9IAo7QAr
	9NHGaRWPyecB5vJtlHSF1dfIjVymK88g1MPAAqr9Y1+uNEOqFZcuCILh0nUm+F8=
X-Google-Smtp-Source: AGHT+IFNe5BAiXH74TaiJkjNwAjofMOkINzBP22qj+S8wmzlXjXr2ul8Vxmmm5X/bUEuBFGP89AFmg==
X-Received: by 2002:a05:600c:4509:b0:40f:b680:3e81 with SMTP id t9-20020a05600c450900b0040fb6803e81mr4577721wmo.4.1707320301803;
        Wed, 07 Feb 2024 07:38:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkuqVh1j0IgfHABk6TPPxsEpPW0wqyUJ9/Kr8IIU0qWjsGVueNXbkuADv+kdHmFoUAMtLrBKb8F5wNuMcMT5h3IVq9CXUFgtWQN2b5+F1UrxbLScfb4eeb3uSWNG1j1VQG6MMDJqusFeru+pzvwvafK3LX+D4KguOqKWs6FD5JrK2sv3FqJewYJMIIJZEc+6dGvsSKLJKIri//2mS9OiSM3ugYkxYYYzuHiu6OG3MJX9cueqItiIGVfqAifBP3L7l6PdEOBfpK+h8PcdV7cX/YNeGmencZwam9Pwrocum1skM1ijBlYpodCbNK3MzW77kJ6TyBH/HSTsu17q21lOFXjLOLzNjNdpxAM20C/nTUQZFYy3ECtuVAav12APpMwSFsdUPLSsOouYgRTj6brjQjqq6UzjYB4z+AlIk1d4TrWE0fUgDuE4ncdrpapQjUhpvBRkGEEtL5tMRttvW31THtR6XR7P5eYJXGbY2nFhad6o9yFc4CsdHDAphBP7vO67gOckV5adm69q4Nm/n8t6Hd7JD1GVrhwuo+uci7NwieHdQZFiXBF+t5c+SIqgsVQ0MlK1HQ2UL3JsgPM6iY6nsa8JbZ37XY5kepMQehonn2UgIZF/mcTwrMys9/Xu4B5FK3lm035KKEKWW2v0R+Ij3EtxdQ6yDtqGxvIpnO8UkGOiU=
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c024700b0040ef0e26132sm1307678wmj.0.2024.02.07.07.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 07:38:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 1/7] clk: samsung: gs-101: drop extra empty line
Date: Wed,  7 Feb 2024 16:38:13 +0100
Message-Id: <170732026216.120770.3894842773933291237.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201161258.1013664-2-andre.draszik@linaro.org>
References: <20240201161258.1013664-1-andre.draszik@linaro.org> <20240201161258.1013664-2-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 01 Feb 2024 16:11:37 +0000, André Draszik wrote:
> There is an extra empty line here which doesn't exist in any of the
> other cmu code blocks in this file.
> 
> Drop it to align cmu_top with the rest of the file.
> 
> 

Applied, thanks!

[1/7] clk: samsung: gs-101: drop extra empty line
      https://git.kernel.org/krzk/linux/c/d16f237bda057b7432f8e42f86d23da2cf088a2e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
