Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E6B270ECF
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915498; cv=none; b=JGuqACw7yRLZpKuQTMePsABSVCHKmiD29BD8df7E98uU6NyAS7Hv0MYt46wOIb3ZrHBX//eQBplEI5UUkWW2JKxVqISRxHg4T8s6QJo3yZfjWrQV7Ek/Pe0LYviwd3KekMkCxT7oZJMNQPOK0PxRQsu626NAMLSkCp8jul+1C98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915498; c=relaxed/simple;
	bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKpjIsbn3SJEuWj16VRYTsZkEZFf+lWTI/jfGj6SnjGSmMRKWyrS7YtkNvf2YmxP4CGuFkN4/t+djhWFFvc0OTbcZSnzG7e33zigKyOG0bkZEj3XHdll2Hl7NzcfFs6H3UWknwpfPVBV73Q9QO+aga2EepIfA8pHxn4a+9ubR4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kgfkFngT; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kgfkFngT"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-31062172698so59895981fa.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915493; x=1746520293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
        b=kgfkFngT99U37cDcTimcj0eBfZU1V/wgcNATyGtPXehLnEVmGSUE0LU3wq+5ZjH7hG
         EnzsgEizMSscxt7wEpR6A/FDTu9ru6KCnm2WawOoobl/AfOKVmj/Zixx4SOiIAQaGXF1
         1UNZHLkqTg0oyrUf7ezNnbx0rGSVAlRVfUMAszfezTwjOKhPfzdmuT5XJ0sHSRvt+P3A
         YsUEZ2TdJAHzA797v7glxk+EbHylXUKTBGxWN5cA6RCFA8gOniDGir32XzLTQwQiuBy/
         nbYWlni9+vITWDvbo48cIl6itlAHj3TXtZfuKUps43G3m8fPz4cV46DWM+1FD2MGAMQd
         qyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915493; x=1746520293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
        b=BzCd2ZuML0EDxawIlkYXiulVVf1i5CF9s7qZWQYOFq7wHTOloccGORWSrvWkOLU8/i
         AGC/So6xKK+HVfAZxg+y2kiQDdxK3tgIFZBTDUzFyHPiIQjtWOMpg72QylDRPl+O9/Ne
         WcO2VkgiCCrHjsyDQOx/X5X/cwv5ddxdR+xsM97ms4WpdDr1MXXjLgJdsgXNcrTw+oh1
         sB7pB2ouCwIVKEdU6Izp6rP7dgWKRqWGrb59T81giFjH6GEU/3EM7/wY9T/TsBrur1aO
         TgDZEBZWqBp8AAHn9xdwiBJBOSGpKDwGu5mzLrhaU06wh7ZVVX5yN10b8vvji2aHY2UC
         FPOA==
X-Forwarded-Encrypted: i=1; AJvYcCXmASTmBqv30uKv+7CqYU1LqTNtBNHETzRd75H1Ccb7AaYNuEnLvGd9P9YRWiI3c3wlGWgJ5+cjTDVGHAVyzrAhng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzdpRNrysttTaMpIOqeXI6fSKFxOA/7+cdHW0U/acxbewlu+DM
	n/msrqfiHrCbT7DhT8FHzfVP5LUDRZ+wzj/OsP59rUTJqZkgmXtcW9xa0/JV11nfMHQ9aX2NW7z
	GQLfj1Vr9qd7p4/B1fOriwhn7mjMPUvjTn+Nx5w==
X-Gm-Gg: ASbGnctTc93l2axFpPqs0ULVjbh8eBHeOzBRn5NvzwTlmLcp//LijfpuMR7N1qSolPS
	PDxMnPcAIo57ZFlRdFLJ+x3r9fbgoUk/WoSz/MC0l2B0ABk1mWH4vRr3G/doqSTu4pOyRjVb/RF
	ABsSSRb//vkETiQTNt8D/TuA==
X-Google-Smtp-Source: AGHT+IEQGZYoiDX6agThY6MEttiXW/phwPHOzvMp4EUn15NcMCCtvMBuCxgvpSJ2KIlE88xdOI9ul/LqAjmdMjo0Oj0=
X-Received: by 2002:a05:651c:b08:b0:30d:e104:b67c with SMTP id
 38308e7fff4ca-31d36ad1ac0mr6506481fa.39.1745915493462; Tue, 29 Apr 2025
 01:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:31:22 +0200
X-Gm-Features: ATxdqUEwnjlawzkertE2U747LwGdYLhBGRSu2FbSCTDtMI-ddocvoVo9dn0tQa0
Message-ID: <CACRpkdYbf4zSrkzrGLn9+Sn0Wh5LvZxW3omCdMP4w1VdFf-iZg@mail.gmail.com>
Subject: Re: [PATCH 00/12] pinctrl: convert GPIO chips to using new value
 setters - part 2 for v6.16
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Paul Cercueil <paul@crapouillou.net>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 10:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> the another round of pinctrl GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij
