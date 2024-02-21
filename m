Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118B3127B67
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Feb 2024 22:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708553245; cv=none; b=piod4hjG18RFKbPlqUQ1doV23Q8xo1It6KLL8E4agz2x/5C+8xPLOHZFI1AVSprt4IpXGbm4MoQdZysGii5DJWfgftstDKPtp+gY7rcXmkp/075VfWavTnctAYyn/DV3QEcbW4yXT+SEV88bI6moCV0Pj+Q5aYIVXNLOy6ImZSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708553245; c=relaxed/simple;
	bh=iNidW3f5wsCISbKAXdYoDRvGkkbi4875RfDnKAT5TGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=It9Jk4emL2F3YIGr2rTGdvDLvOVGkJLzD+WYvM/jQ/zzHcTyV9W8p+prQsWfvJkjXVo9vId1uONhIRyE6MrTNkHqNOYPfl0gXa19swO9ozgqBd8C/bPVAgRFSKOhQaJmvt0TO5J/DyQd+5JLSNORQT1BLgjSw5GDO0Tk500gTT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tE5CbTty; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tE5CbTty"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60495209415so70376047b3.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Feb 2024 14:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708553242; x=1709158042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cIdAj9Rc9YrdEZf80SuI9gbBcjMeYE4blz3NlBPNkk=;
        b=tE5CbTty8JoVcAb7WjBqLRfrAV27yaXE5g+MkmfL2vfm6VD/EBCADX6YbvvGGvfWqE
         ECkjUVRifnTAdb3lHfrQP2o4c7YOr0y1RfN37DQNm8QSR1XCDDdQTQw7ynSRW6rQGBi3
         4QGRhIwUT7iAJxV6VznNSo6iQ647Dagfkp3tyToU2dkjSo+Xid9+Mrn1lO3Qv9yu0iDE
         5uM2bl5B4bj+nMG/ZTKyVQVwIxtNBvg/W8GlZzPCR7hnyiAsWBvPrEnNNUoSSq94txlZ
         RAmC1Bke4WkKePOkoeR5bLH7FC4vvBfo+x7+zVTLs5OCMRtRf5EJUKfq9XLLa1JUupMO
         nO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708553242; x=1709158042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cIdAj9Rc9YrdEZf80SuI9gbBcjMeYE4blz3NlBPNkk=;
        b=O1O8nGH7Q1X31oJL/vhbzvo1liae96uTAucIsG6neRlUr3SC3nkNO5P8XtrR9z4WTG
         Ly+7EACGiy7KzeT3MTRO3gaQBVLPPghnGH41yPOV1GBQNmdcjFGfxetS7K705RkeG7EX
         FjZWzWab1FNrAR7jTVuPugfJ7ggszg+2+jK8YumW92yugM08CZuQ8+X3OssSz2E/AceU
         KcIb3jsTdGpQ8vTiIfyaJoDuf2Om+NLcxvZCNU61hv/VP3wXvQEupfYHZinq9CZBkV3f
         ArznVMmFq3eVQZYXgNnmTO/hiQJsrSuZM1KuPDy7XE5oX1+jPvp5+8HMtO7/oqf1J49H
         6wYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc63HdWO/juOqJhuxt/HTgEETvrFmXWUHh3XOm98A+I3BsJrmJzuiDPTFDTR5W+S6O2IzL8Il4ACoxEG6FTsT0DSq/qcuKfZaTJNgvtp7J7CM=
X-Gm-Message-State: AOJu0Yxhk2ibo/+dlVUpYSnU1hho6ODTnbv0MPD7fB2TFYOeHy9sLR02
	hDv/oSh0lxveId8nCos2lY9rd5IqT/h4g4/iUxHfozV2AIcu+eKYJ8dG4ZNQIjjjy/e3n74eCe8
	CVLXh2YN5AgnQHZOldDfubajS8NJdQx2qspo5ug==
X-Google-Smtp-Source: AGHT+IHcXCkZHHGUkDm2xvIgiK6VurrE3eAJdP/r6uC/vcQd0YLTd8DmYtHQlaiiKrj98oMZezfQEBryKYUS8JEchGY=
X-Received: by 2002:a05:690c:86:b0:607:d9f7:e884 with SMTP id
 be6-20020a05690c008600b00607d9f7e884mr20419761ywb.4.1708553242109; Wed, 21
 Feb 2024 14:07:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 23:07:11 +0100
Message-ID: <CACRpkdajVH4Y2K5W+o5XAoiEr57ObVbaR+9QdFV=Cp765B+dfQ@mail.gmail.com>
Subject: Re: [PATCH] phy: constify of_phandle_args in xlate
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 10:39=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
(...)
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |  2 +-

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
