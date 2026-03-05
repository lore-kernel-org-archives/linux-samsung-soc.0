Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C171E7C23
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772712938; cv=none; b=flntq2WUgDy5LsGD/tuona9Frkv0z+b5MjpQg47Iw9a7mOCHg+B1Btv5PAF3jEb2/5v8+PyO9r+dYLj1gAxIn8mOyTfnLrP+kY4nZodSr4pkK4JyicT9cIhe0Qff0+1AVP5iMBei2nUATs9qE0+02MzoADBg+wz1VQOFNe3UfVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772712938; c=relaxed/simple;
	bh=1N9rpptCfEGuKF24I3MO+ctQKVCjB9J9sj4YNN7+SI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOKoCycoWmwu9YZq2ign1pcsRz/mCExFU+WDKI15aL/2N6NTwrmfMYktHuI6KoTGt9+RX6nieTGmzrkSKZmu/vwmas70yT95WKu0AOm9ro0Dyi5sJuNiYPHJdhgAwlW3S/Ajc2uWq6O0IRGxSpFd2nalAhwPjRj/SEzKzjDiFVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35691a231a7so4896008a91.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 04:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772712934; x=1773317734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yS764krKV6WfB8kOxjvP29bXooB1nm1bNBDNiujlO4g=;
        b=bp2ucieTSE04vsbhVUIAH1bKDarqcslPRhEZS1NuGAxr4iuIWKYeoYqdZHWCJlKqYB
         fB/FiJQy8lo1TlrqEeQEAsCyk+QshjhRQnKpsH/Loan7NX9MT+3fsf1INZxSuBeh57Ba
         hZaL3CjOzX+RWbWZQNCpzLl7W1chR6mQ9ixWQV0hbmQVIpOIawULNaD/HfEX9rbZIv+r
         nJ14Y4uv+c0tO/dn8SqiEQudquaKOIUrpQR0Zpsy4aYZCxtkYq/oHthegOGtEpksESxe
         Mb4S0a5RxkDsCOiZ2ZUWM0wdfZXLkF7grnS8cb/JqCVqueCKdDweQQjles7TbYDrusPm
         wAFw==
X-Forwarded-Encrypted: i=1; AJvYcCUOcfxPSAZX5CwpNkTzvBM1evmOLHEgVMfWtSt3E7oP3iie1hKhvRRE0I8OR8yZ4pR9SlwTn+uYcPLUnwBY+iaG1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+/Pdf125Ipk4eYKW1U613RPEDTzxwYv7lPNAeS9agaQhgB7ZS
	qG2HaJ+JBmYZq9OUzFZnL0C8gVJIw2mj284Z/1wHN35toIjm6hEavV0zR5POura/MKKoXyDz
X-Gm-Gg: ATEYQzyybry3C9kMkLbZ8dBfoOAU+sq7DK94iC3WUMMxvJ7YCMwHrsxnufyhPmBgnWj
	ETWTvGPiXAKbYjdjaNbJSS65vSPvHbJDht+6k4kgkclKC6YwCOgxErEWgDT5sheZK0ereP5UJ7B
	A158erbTtMTiMyLMC2D3/hivLT4mLl09dJftWuetCBkUl2L/emWFJJ08EzswPfZ7M6ffnHPv5JO
	iGZ9Cbr47pITppNSB52LKkVvWe3/D9X5IbbwweaGW4VgeCVVCgGnouy/1IYVuGBDNcuSVtqoBcf
	jfBjcvUL/A8GDGsUNZdXWcAnjZhgWVdaM4Hu26QOd+CXg7LmOwTCwJacigGsMhIDHOhM5rjP3M1
	rYodEZYz/lCcktffBzEthWQlVdvqg3ecqeCcGyCBVg6sA6k2MFiSMy+Z1s7sIxd3jHVsemD2fYf
	jGlwvB9rOoWAInXAi9Qol6E+JKQ1neTYAxolm97rY0Gva+tg7Z+inq6SfbL9G3k4Jl8+KuGb+Mr
	td0Vw1vBTR1l2zhwgz90/87iBcBWjKj+z1xVgNqHlGcsD5iHrArwJxxaIalXw==
X-Received: by 2002:a17:90a:d44b:b0:34e:630c:616c with SMTP id 98e67ed59e1d1-359a6a92750mr4210979a91.31.1772712934483;
        Thu, 05 Mar 2026 04:15:34 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2c1daa6sm2391359a91.0.2026.03.05.04.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:15:33 -0800 (PST)
Date: Thu, 5 Mar 2026 21:15:32 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305121532.GA1649635@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305114352.2f7btqixg4tu5bzl@skbuf>

Hello,

> K:	\b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
> K:	\bphy_(?:create|remove)_lookup\b
> K:	\bphy_(?:get|set)?_drvdata\b
> K:	\b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
> K:	\bphy_pm_runtime_(?:get|put)(?:_sync)?\b
> K:	\bphy_(?:init|exit|power_(?:on|off))\b
> K:	\bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
> K:	\bphy_(?:reset|configure|validate|calibrate)\b
> K:	\bphy_notify_(?:connect|disconnect|state)\b
> K:	(?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
> K:	(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)

What about

  F:	drivers/*/*phy*

or something along these lines.

	Krzysztof
