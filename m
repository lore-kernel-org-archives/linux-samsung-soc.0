Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1990E26562D
	for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Aug 2025 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756646898; cv=none; b=nUb6deIQUybleQpyM4ktEiiQQl5Qly8CRn+WEk4J3c+Ej05McF46Kcza2vUUWXTOv8XeaxoLWp95tNo83ORT+IfDOpk9Ts9NZ+qldzoYCfpxw9kGDWi4gJN9+uiJvA9r5IUCbVRDuwSCsZv8BEf4HEtOYpIGQQU77le1YLa5Ss0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756646898; c=relaxed/simple;
	bh=4724Qznr91+tj8Y9/XUYmvNyXil/j8ZgBOQhRyA1BqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S0LgyssnBOhu02beSKk5UUDx55jxwTZ9neOROE0tVubaMkQuuAAU8KiQD+HUWUqoGc3mtDLGLQRXnIzIZe543e8zcAAYct6MKWjXQYFBaA8cDQrUhKPvIDRDuf633sfc5n2BqAKnHUIwVbm35SAJWsO3N8zPIMKlh2W/4XZJSig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HaNuscYa; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HaNuscYa"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3cbb5e7f5aaso499378f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Aug 2025 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756646893; x=1757251693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mD6lZo1DYlhz45rUzy85fH782HipOjBn1uPVn9HDDvM=;
        b=HaNuscYaAfd8V7+N5pjuxFbkoakg48me+ZqYI/Jbe3/5ZX7oCiCYvCL7W0kDbxiI7S
         BIEmpdcmgyCuvrzWTE6tdkJqgS1uK+b5YlfA3sgEPbIZsUOL8TRjPl9Oh3XJL8/SQQEe
         GvgHzDwRw/BbKXj81qoKE6zXn1UH8bG2hlvGUp6wx51WZAjWzm6GfuW+VpZsh/NOQmPa
         tYbSJ085hnPQAdFUn9axpHudtVyalArUx/Mf1EEQKjqsAHTozrhz15H8TgNUOjX26H1j
         KI470sLMfNfHHd4UZg8LdxEYl+HkSgMozlav9qyI4ZS2R0M2Cw1O8Lj6DJl7ZYMioqDz
         HaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756646893; x=1757251693;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mD6lZo1DYlhz45rUzy85fH782HipOjBn1uPVn9HDDvM=;
        b=uJcQNcepK13oa8ca0zk8bGbUq2VjAUZooYdM383UxY4hG9lbtMIUE/kyPwa1q6l3sa
         /wKUyDG9CD35WeTmTz1Dhu88YpKQxkE5tSnnvExc0Eesef4v8zZuy4J4SGFvWS6FHZ5N
         o7I4FtuU9dS3OsuzpDlVvzgT6Wdr2xeC/6qylTD49lThqyCnhks+hCO0jZ5Ul1C6PeBq
         8RMIZIrZwWwrIebaJT/MbcGWhTn4Wpx5K31nOATXWdFiqaS25cTnRJ1UYTw0SeC3jsXI
         KaiOPCoZT1XFgv6ubOc25LcJzkTwovI8PIIYfLZMZDVvw50ioo6oa5LvsBZhwGlAgo97
         tP+w==
X-Forwarded-Encrypted: i=1; AJvYcCWEhyjQRSOM41ScNPRUyO3DWmixlK7iC9Etg9YZ3SYKvx7PfP48gQymP6ozxacfIV5NPxmVChwrLfQjlzO/X3qM9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5aIi+sgnk7HfKJNZnHhNiPMUQMociUQ2doBrsdCCcWfVbatWB
	SCAlQN29WJb8/qscao2Driz00eqbaBg5A3za8yzjqc8qg6FJK4Vp/QOkmrw8NTsHaYY=
X-Gm-Gg: ASbGnctC1fmYaky2G8sRZp0y0ul+l40iqhSDQfKMMbQSEjSr6BtWpG4/hRozFzRujPI
	64/05e6FG9J3FoAvNfR4ZLR/QucsP6SACyAYdPfwXucjcmorUjq+cUaKG5UnrxvU/Os5CCeUvv3
	TW2P7xu6knPH/d17rWjwmTdeuD834480QPXu+cPOiCw71YXOFnBqXl3akVOGOmJxY3zSmFqKR2d
	3s8z6PTLU7PJadMIRVZr092gB+pkerETEgMY928ujUf1Duatn3PwwatzW2S7goKewSz7kqQzmVg
	KC3hjDwTfVBU7D4+su7H8KT1JZ/zhwmZX1LgfYP6YpLi4ryjusyCqBAirWsBrOy9ulq8W2lV4Db
	e6CC+JTCo60lof6v/GmNyBHFgad+gR7p9wvgkvUNHUTtJOQ+0uA==
X-Google-Smtp-Source: AGHT+IENOgSWDvrR5me5DMoY53wRwsPVCOq3Mq4OdX9AjWmXw0wgs5GSbqe1NiXMSDlX3rSsquKhHQ==
X-Received: by 2002:a05:600c:4e0f:b0:458:b6b9:6df5 with SMTP id 5b1f17b1804b1-45b81eb0a80mr30834275e9.1.1756646893387;
        Sun, 31 Aug 2025 06:28:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b3900dsm29956925e9.0.2025.08.31.06.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 06:28:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
 dj76.yang@samsung.com, hypmean.kim@samsung.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250825114436.46882-3-ravi.patel@samsung.com>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120704epcas5p37385c913027d74d221012c4ae1550c73@epcas5p3.samsung.com>
 <20250825114436.46882-3-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 02/10] clk: samsung: Add clock PLL support
 for ARTPEC-8 SoC
Message-Id: <175664689125.195158.15680456692339310248.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 15:28:11 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 25 Aug 2025 17:14:28 +0530, Ravi Patel wrote:
> Add below clock PLL support for Axis ARTPEC-8 SoC platform:
> - pll_1017x: Integer PLL with mid frequency FVCO (950 to 2400 MHz)
>              This is used in ARTPEC-8 SoC for shared PLL
> 
> - pll_1031x: Integer/Fractional PLL with mid frequency FVCO
>              (600 to 1200 MHz)
>              This is used in ARTPEC-8 SoC for Audio PLL
> 
> [...]

Applied, thanks!

[02/10] clk: samsung: Add clock PLL support for ARTPEC-8 SoC
        https://git.kernel.org/krzk/linux/c/80770fccb7f60b0bc795852c154273e511f296a0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

