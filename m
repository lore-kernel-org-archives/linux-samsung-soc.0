Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ED4194123
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Sep 2024 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727083184; cv=none; b=g9nBE3OPW32vAGBcX19B1ypg7uvb0p1xyBAGh9lBCw9J93HxENRvhnjhnSMq+9uMJW/BtsFi0LOLNNU+O6w26iLFJ9jBo0w9PaxKXD5TcDnagm3wv5FZqrSdyIm8nZJdll6qw+mb9eE1yebF9SoWOOFc0JHtI1HREpTuQYjJOhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727083184; c=relaxed/simple;
	bh=HbqLKOB9xBC4YcqZ9WHS6O6Bgu6BSSEF109W9pv461c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rr9oMzif6kmCO+piaZsci0d540SXE8DTf/WqYdBpLQhdXaRUDWyOUsGLRflvyFRr3mnUmxKYHKrAz42YED7DYYw+zcuhlzEdzbeVy8AZU+FRt5ElhTAXYVrtaOMSCTcxiPNDihnXk1FRl65ZNefCkb0rrOtjgKkzhJl3c6cfOE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dUHtDjqY; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dUHtDjqY"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f754d4a6e4so38488321fa.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Sep 2024 02:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727083181; x=1727687981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbqLKOB9xBC4YcqZ9WHS6O6Bgu6BSSEF109W9pv461c=;
        b=dUHtDjqYlOr8kpmIf4INscMeuPuy/TGibkEBehqkddXcesdMteAm5CbFv1CjGQAhMf
         lebb1SnoIdxiQFoDOcwnGncWczWunpY15YDvwDdWmdU5wqyv18Od5jltcvHV0e37PEux
         gEuEO88Nk7K/w2rilAWm7HsKN4IGd1RTAJscE/2De14DfVNnJA/hu+9R0ijC14WS5IEP
         FAW3yZzpe4W8WOHnWBXH0RLHBpLjIkPk0VELsdNxXop36GJpdF/WIF5TqpLvSb0Jdb0B
         dX+naykkKlgvDL40hiBnvETybwhvZJxUoyn9DVzIaBG5cSoEUD+9dTeBUioZcZ15VbVu
         EGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727083181; x=1727687981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbqLKOB9xBC4YcqZ9WHS6O6Bgu6BSSEF109W9pv461c=;
        b=ftpjoFok4Vi7MHC6xdaUNvDcthgSmgWUJvMTRvYCl2xSKx7B667twKngewetH8eUgi
         xdqnOsx8GGEDgeQ4AuOecNJ1uuz12+4zBTuJbBFxlQGXbQtW8miG3kLaWbqpW7yFvAP3
         F8G2o2M5gUXPaLAmjv+EiFmmWYwXX47F6DkQX2G9uMYP8Y0zt2oeQwqF7PqMlKKqM9U7
         Nd+7P1BfsCh8sTfMXUBdHXmqmKgAzNISQCxIfgHoH7alOIFqS7ijIg0MR5PCcXlTpjH6
         iisXXi91+wCH3HLQT1I8Heu2Ma/oApUqxKumLZa6JYF6wQTY45S+6g9YuGAzvf35N+SY
         8QKw==
X-Forwarded-Encrypted: i=1; AJvYcCVJz08Z+AZkGjxHRgbwdW+Bx8hg/4MZ6lem7ZkdIA6a8dUy8blOUr2RUjIFbKpeFpv4uKf0cUnEFI3n9p7bA5B21w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIFmRY2JU+KX7U6hL4y+0T50K+TunUb2qn1qA+mn0VmUAsSYhk
	CI4MinliZj/DZwh+A+YRSC2SRe+I0a6SOnQHDUWbU75o6ej+Ls08IaXzkJ5TsfNOnImAlXVx0kr
	ByW+DTQIf2kiZuofwjcxKSEu7LJwvISupHXIblg==
X-Google-Smtp-Source: AGHT+IFbnNUzhyuTeh31UmTh58QKRDJU5vK7TVaf97G8j3XcTVc7O/NrrT0g/ySQvM7uYWrGz4NvSm3Q+S61lZ6eSEw=
X-Received: by 2002:a05:6512:10cf:b0:533:45a1:88fc with SMTP id
 2adb3069b0e04-536ad180123mr5184682e87.30.1727083181276; Mon, 23 Sep 2024
 02:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com> <20240909110017.419960-6-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20240909110017.419960-6-ivo.ivanov.ivanov1@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Sep 2024 11:19:30 +0200
Message-ID: <CACRpkdY=Q5JyLdPE8EdhaKE+J2j5DZMvf2Nan79yB6x5RWFusw@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] pinctrl: samsung: Add exynos8895 SoC pinctrl configuration
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 1:00=E2=80=AFPM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:

> Add support for the pin-controller found on the Exynos8895 SoC
> used in Samsung Galaxy S8 and S8 Plus phones.
>
> It has a newly applied pinctrl register layer for FSYS0 with a
> different bank type offset that consists of the following bit
> fields:
>
> CON: 4, DAT: 1, PUD: 2, DRV: 3, CONPDN: 2, PUDPDN: 2
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I expect either Krzysztof will queue this or it will come in through
some other tree.

Yours,
Linus Walleij
