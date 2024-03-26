Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3724CE09
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711443860; cv=none; b=VR3WRKRsF24Alj4NnpzqA6VBg0dEwpm0+e0HE+Z+eAdo0iFn/1fkcgdUvkw7ga4e/LBBAG5TgEv3z5OdU4ufn4FXK0a6wuxRkhdNxxlLlx9TNS1WmeLYj6DQZ2YA/9SWFtpZnLvUbkq8FxWgHqS24s6MQY1RHLBt8AOFdkwbN4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711443860; c=relaxed/simple;
	bh=ZyvDnyVdYW8mApjviyCj1pFwuScQjCQKI2BuXx5sgvw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t5sGBiDU1dJLToV6ZiC3cxfYCz9jOxWJMV2uQ5dvZ2nS3TntPgIUBruBbx7GvvC9sOyg6m/DeuD3UYskL0fCZlrZB2++dd96SOEWJ67/XSaCJawZenMG9SleaDakjekdRecGA3MCnBjidruo4fkwimuL3sYSto+7CiWGXyn0+D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rQKmnbqd; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rQKmnbqd"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a44665605f3so610290966b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 02:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711443857; x=1712048657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUHFACxolYxK4dRg3Sf0j2U2n01l+uu5n940mo+Zokw=;
        b=rQKmnbqdQHO+Fh9QJXQIwp+GKUpps5x6vM70tfJF9zDSFXS0GtRyEgMBkv31/aydew
         TXgih7QesKG83xi49w7ZJUIl9UxoR6RkvRQtDdiRMB4hG/oSm142JKY7UDe0uVlBsnhR
         6OzU9ur+fNWN97qWDcXnsYnDW6ps3qCuW78wagPNtLdbD6q9W6QAeNDitIMCKEULqFlB
         ZW7yX3Z+SZBy9rNIeY2gtYbCKuLBpbvlJWeumLMZoXgDbAGA5cUOryOqQPkQJ337gGCb
         uw5iepJ7qwIdWBRJF6kQXdvPXUmEnQd3wcSdvEC6SduL5WKBr237kCbMRA0El2WWs2Tl
         Mpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711443857; x=1712048657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUHFACxolYxK4dRg3Sf0j2U2n01l+uu5n940mo+Zokw=;
        b=s/eobwj2C6es2gbHY1x6aQo/pJiVQJr/VFtga3/25a6SJNzCxq5SF9TeLj0QzZH3Ln
         ee4sfGOdl0EoAwajRl1LDqY1VU5V7lDmCj+YQRdtarfnmzO/PUfa37JW0hf0Ykc8rqZ4
         p3cDH0cD3JZGl8TVP//f1dpdbYi15loUhmq977MQufvmroZhtQfjEy2iF5SzVky9XiCD
         NbxGK33USbqsVdsWletTiY8aSWSBLbupTh09U/JiQF1woE7Jylm3DsrW0+j2R5bRRsfk
         Y6duNKiMT7S7th3yTZSPi6wYiPz29GxT+s2HopTJQryzlg2Ye9erqaGQFBHzIQeBzejX
         +maA==
X-Forwarded-Encrypted: i=1; AJvYcCXvigHs/klc+aUMxfeoiq75+xZTgMLJG5r6Z0TJ+ZWxvvFEVnM3u5dz7454IjZCh/HPqWpgcGJ1foiaVLt7XGx00kbFZrbgXN56Cz+TYhLNLNc=
X-Gm-Message-State: AOJu0YwFKa7mZ7QWA0CKTVMvKzYVA39ynwM14+xparSxC2kqH5viNyub
	t7XVaiJ/3aL2gJHhar4eMTeWpqfYyms+Sn4XnR5TF2ttccmrCotqbJ52t64v6GJmTZI6FZITmq2
	S
X-Google-Smtp-Source: AGHT+IEvHcy6UDTsdaGFobIClvyRxp2fSbGk49oVaAThiZZUGAXxspDnmzsU3qZha76m4QuIBn8YEA==
X-Received: by 2002:a17:906:3e0b:b0:a4d:f999:de2d with SMTP id k11-20020a1709063e0b00b00a4df999de2dmr86359eji.8.1711443856748;
        Tue, 26 Mar 2024 02:04:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id ao18-20020a170907359200b00a46aba003eesm3973097ejc.215.2024.03.26.02.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 02:04:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: clock: samsung,s3c6400-clock: convert to DT Schema
Date: Tue, 26 Mar 2024 10:04:13 +0100
Message-Id: <171144376244.95623.15251693618331114140.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312185035.720491-1-krzysztof.kozlowski@linaro.org>
References: <20240312185035.720491-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Mar 2024 19:50:35 +0100, Krzysztof Kozlowski wrote:
> Convert Samsung S3C6400/S3C6410 SoC clock controller bindings to DT
> schema.
> 
> 

Applied with description changes as Conor suggested.

Applied, thanks!

[1/1] dt-bindings: clock: samsung,s3c6400-clock: convert to DT Schema
      https://git.kernel.org/krzk/linux/c/2125459ced054218fa8cf0170a116e2eeaa0f276

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
