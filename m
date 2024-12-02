Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99AC2036ED
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Dec 2024 14:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733148135; cv=none; b=HciY3xEIxY/RMmj+o7i0s1p0LEA7kKIvaUyNoG8xXEeCkRESTQ/wJW/k+eQmq2iaUy1cVDlUEe/Gvl6e5HJzGEMs2WvSJF/ebyLP4mM8nQfPF0Q36/e0XlA5KEuc9Vqmk3J1D+kCmWBtqCn0cpPiDATG1WF9lYgSImB72pFZMuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733148135; c=relaxed/simple;
	bh=jJxlcqRxB873knVtlY401xtr37Z90jDtvx8oMXlNiPY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FXfTqk/17TTPppZHd6LF0wLVVFWfEdmXoiqOP937j2v2bAk+sVTvc5PxE5ebTRGQ5H2UuJD5hVjKLOqtUggMLRJajXTQ+xfePRrpnrDm2oXRO8dPepkyBMA6QTcTnUhG2FeV0AOOZbC6JDwU9GIny+ElkvUbnlchSql8r6TLMbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cPbXcQEp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cPbXcQEp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385efcbb523so74536f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Dec 2024 06:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733148130; x=1733752930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt9rbvg88W4Mm9rufdW2t6Ewrnb3f/HKBLkJJoL/hiY=;
        b=cPbXcQEpR+v+1F0ESx/yn6K016tyOZ90xmHzKs9eFufHLPd/Htwmp6RwU0C88/Gxgm
         SOjGNkibqUK+/0kg7uqcxYkq8iEUCgylj/kGHOf7+7x4W1H3xbQGUuFwMzbSYoZCmV3p
         V4cisD/L7bMH0glRxcu544Upj48fQeUjQK9V+PY+oT5sMgyIlSt25+HUOPaNpuxKr33L
         babHjzUafvf3OZPDDVmaqD4q0etRFuepSxM4MgzPDUvpJU3x58GfwiZNTq4d8DPAeaPl
         C1UVFquvJ8iul0YnjxNr0ghq3wNX+h7BBpnCD9yGQkvciChcKhrUaJr5fLKtlhNP1E2Q
         VF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733148130; x=1733752930;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bt9rbvg88W4Mm9rufdW2t6Ewrnb3f/HKBLkJJoL/hiY=;
        b=nYmSyhICJlFikNdiBpRvemx4oyodHFLxLlRJ/HzQ2BQsuLDCRhdLfZSdfxw3j9wJVg
         8e52Y9AdDJQ4UCX7igsRfB+8GhdCxw0DneFu5uMc8yfRn9GEh2PgqwEmoDBDaBQsWg0+
         xdvm2FBOeKjrRh++J5bDlzOoxLMON0qrrua9+oC2sNl/qlTbmnhIaf/NRlTOpQ83indZ
         4p7cyL7KvDwp5zwYnKU8gt+UlijeVNAcq60bpMUc0ux7NphnRPuInoVegVUdkRfGDjiH
         lVH9e/3FItzGrGdBri13k5fm6zJ3x/Sk0BhuAFnov/zngGcDJsRGPXIs3yVola5xOs8D
         bdMA==
X-Forwarded-Encrypted: i=1; AJvYcCXWDAxBnrap+Q8tg/KEez80bv9C3AT6wfBU7dmN1inXDU6beWOhVdOqN5B3kjDEpAPwmAIpTxPy+IEWNcuKCo+WpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaDpGFU8PdRGK3DN3bLOkk1HtSTBjgyg8nP96eqh2TZfACCM70
	BR1KgshQcQHDF5id9Y5MOW/oaGFuQkrI2J5jLmIjUSw6iyJ2FpQYPAXzTmTUr1M=
X-Gm-Gg: ASbGnct01ImOiwfHlyjIGrHCBThr1B5w5xAjOlrqJ9Zydx5Dtu00dSsMYPyaBg3jRGP
	rtzXyX0KA76zuP75E646yEoBZaSHv7Ni3qiRCfnfPcUjyltwbnOtkEXjEMPSAfR68phVcfx7aJw
	FBuu3ZDhCLG3ss62v/QQDlTvBw1nA3jyLhul6jqizn8PX4LbZzaTx/75K6dY7sMHkN6+y96TXuM
	quw/9iQ1ZReSaewHDiPAjn89ejdWxOPlOUfOyefFi8px8qp6CF5VKz/1ew73Ygv
X-Google-Smtp-Source: AGHT+IFbpzvvcbBvcWNOUYta+EWWguWeH07ZXYUdJCdTYkzN3I9OEgPah3/QG+sVL8wvnjrRt4H4Kw==
X-Received: by 2002:a5d:6487:0:b0:385:e9ba:acea with SMTP id ffacd0b85a97d-385e9baadf7mr2382448f8f.10.1733148128320;
        Mon, 02 Dec 2024 06:02:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385eed2510esm4232260f8f.69.2024.12.02.06.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:02:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
References: <f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] pinctrl: samsung: Fix irq handling if an error occurs
 in exynos_irq_demux_eint16_31()
Message-Id: <173314812685.47615.16378245073169097611.b4-ty@linaro.org>
Date: Mon, 02 Dec 2024 15:02:06 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 17 Nov 2024 13:03:32 +0100, Christophe JAILLET wrote:
> chained_irq_enter(() should be paired with a corresponding
> chained_irq_exit().
> 
> Here, if clk_enable() fails, a early return occurs and chained_irq_exit()
> is not called.
> 
> Add a new label and a goto for fix it.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: samsung: Fix irq handling if an error occurs in exynos_irq_demux_eint16_31()
      https://git.kernel.org/pinctrl/samsung/c/f686a2b52e9d78cf401f1b7f446bf0c3a81ebcc0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

