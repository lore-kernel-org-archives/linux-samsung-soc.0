Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0261D28CF45
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jun 2025 13:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944322; cv=none; b=NIDlDBR8dsS0NwEdKYBeLDUVVju3fPbHj2Xzh7bUn3/UVQHceLv+Bt9OImqBuDnLY0g8Bx0Tj07YlcVeyTcoERhv/4MS2GponGQTvpfIBmw6FAh6Kb78+/WjOz1/xENQWjZbcHOeki+Cqn5rC6DPjJR6rHuUQq7135/ITM9erNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944322; c=relaxed/simple;
	bh=enT5vO2ALcAa/LZ/Y3Lm+uixPZpZ0NB8EkbAOpe//TU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jN5LQAy+R6QUGKz9o8u7le73mWojp4BWzNyh+4xvAG8ykWpWaRZLra8C1WWa/scLoTWIieu9ffT3Unzvnch7CtJS41dx4uL37qA38zNdnTThqtVn+LisGqRmZrUMrVKPci3R0b2T1ElsvDC4XN47WWOGexvFTlpPJFArlAiNfbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B2URa0mm; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B2URa0mm"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b544e7b4so1017983e87.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jun 2025 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750944318; x=1751549118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLwSjoUY7m1Ln7Qu4AWMnTKuJMVdB5FurphkXRXpBRw=;
        b=B2URa0mmUHhnUjza7rK4696DHHQRqzZPsZe5TYKZKfgX+wCd+wRPV2jMDwS/ZdKSLd
         GG29e4E2LuL+S6ctn/2NS4m/6ZIE2g0iPL6B8QpKy3nOO5WwKcDTr8e1HuUw2uq42BYs
         VwDUidPE0YGep05ZnMAO/6qTkLMKYq6p4E1qlVkEwyO4CkhyfQSXd88NMQDxTBba7RWJ
         D5CmwT6dZt+QP4retuQYMnXxS26f5thUFxNkgLK4Odj+9rxPKwiziZ0xMnrF9a75+8aH
         7x2ei/oncy3TeryRSUA3mkUn6WU37Lr9LqHWN9rimDXlFPf9y4NV9WSUoJgn5+gYBKG5
         ic5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750944318; x=1751549118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLwSjoUY7m1Ln7Qu4AWMnTKuJMVdB5FurphkXRXpBRw=;
        b=bpU5EH9l7sa723+drEoOvxUoD8RJSR5G/czOxhsqyoIuvbJJDvXk7KHTc4sE7omYm3
         XHushcHN585AGOBOLnsp6Ne8t7lRWXmIHtrudCx7L4kwKzj3MnPAhcSl3M/jxRUqbXF1
         5WKVJiBvN/3IELXDY+zN/3gxQYRBGL57Pdxdbk9pDGEorzMbsQYLCflQnyp800uz6mxd
         NFfwzJD2I36v1UQkyPp+2rWLz+oF8VPytrgiQ8ShLyYDDMRPmBA+SxZRm3n63AVXRPTU
         2wckMcTnH80y7v7oHNCVcSmo6yTOXFPcV6ijwQTZGsnYgLC4J8g1iK5nL4AUjrGRjOey
         4L3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUI9GS2JQla4vKJZtGvOx4SYvwrdbnsVm2PHN4e2GIjP+UJzVS+u3A+1jpWBR0a657ZRFX+ydJ9+BiHlPc8Ike2Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxg2+dbd5fmT2X7pSkdEySOzOpDeS8pAY60ljeOeKL6SiOixil
	NxUba7SyiIXQj2jE8aUBglNiOYP7KWrNul9pK4rhYRQSc69eCuS39c00DRXQb4cSM6QKxcBdoQy
	avMIf7En/w6HL/0IQEoci6e+hJIbLkOZd1RcxKID9bw==
X-Gm-Gg: ASbGncv+LFNEVm/kTk3LykeD62HEtqeIhJwEhRkmi26IkC/xytT56z13DiO7vx7tc0o
	v49xlfJFJu8a4Jo478xwMoJCRVza+dWXu6u/9K1yii+XCxHVctiXYowHzblVkjwZcu0jCxeGqCa
	P3xQiE3Ta6oQxEdAsNa9EOhASB3EXKQf/bztql6B4AYzQLDX3PCYjpBC4bDtUPUtnjw1UJ8V6b7
	g==
X-Google-Smtp-Source: AGHT+IFZCHpg6dN8jQOP4LGMeE8N6TdaxL+CR37n8aEWMLkZ46xkrupRdz8U89iquKgLZ75BaGxTbVJfXxSWy4Rbayg=
X-Received: by 2002:a05:6512:691:b0:553:aed7:9807 with SMTP id
 2adb3069b0e04-554fdcc531fmr2571744e87.9.1750944317960; Thu, 26 Jun 2025
 06:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org> <20250626132257.GE10134@google.com>
In-Reply-To: <20250626132257.GE10134@google.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 26 Jun 2025 15:25:06 +0200
X-Gm-Features: Ac12FXw9b1Ua2nskF_gKsApdHRnQVgOC-Rscq226tK5vt_NGX_5zRRRras-l-hs
Message-ID: <CAMRc=MdBipydUjEKXDufMAWNZjMA18RKj0XcNofrn1oR7bXTZA@mail.gmail.com>
Subject: Re: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 3:23=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 24 Jun 2025, Bartosz Golaszewski wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Replace struct bgpio_pdata - that we plan to remove - with software
> > nodes containing properties encoding the same values thatr can now be
>
> Spelling.
>
> > parsed by gpio-mmio.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/mfd/vexpress-sysreg.c | 46 ++++++++++++++++++++++++++---------=
--------
> >  1 file changed, 28 insertions(+), 18 deletions(-)
>
> Can this go in on its own, or does it have depend{encies,ants}?

It will break the MFD GPIO sub-driver without patch 1/6 from this
series. It would be best if you could Ack it and I can set up an
immutable branch for v6.17 if you need it.

Bartosz
