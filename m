Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21AB211A1D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743148261; cv=none; b=RssOO/X33MM7EyUNo5VWvDNA3DxiqdJANTBONE8JgshISMoc/hcdNHl7aMMPlLs6LPYzQ3RgRg/9/QokNV84OMasJnnu0XMnb62FihQLRt9tlihU1YbJ4MabSujV23v42FVjim2auRNnVtKQka1ZF59UoGWuQ3ylw4YJwoxTeUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743148261; c=relaxed/simple;
	bh=Bp20qO40fgduH90YbAXMSJkPgrjllUsyzwuKVLOfjh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7QvetkwcyoqRaFeWZ8nOo2O4K4myOKLWuR0fgPEjwaxRjZfPsZ7gsOOvciwhKKSklRtsPdHoDScj+NwsMG/u+1uqMsktszo4JYBuWQY0NSJTar8GQelAAyjcdma6nvmhS2sg/FtnHGvcHJw0Qck8+y5H7aawzcgnXyynBGsbNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j0SNjDWR; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j0SNjDWR"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499e3ec54dso2066945e87.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743148258; x=1743753058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bp20qO40fgduH90YbAXMSJkPgrjllUsyzwuKVLOfjh4=;
        b=j0SNjDWRkElFp6nitgN0/gi9OZ+iJeydAwb4fOciqT23LBBJcKeqN6OMdcqq9R1M9R
         WiYd+BPfBTklhiOWorMpsc5Icr4T5W6dR5ESCbW+RHauJAPIqqjvT0KJekQ7B32lQOXp
         26VcSn9ZAGb59FV+KTvNiOUJXSGxxkQaCTahhTXw4n+Iby/BzEqtejjs+2rciY0qXQ0i
         jFKiTzeerLuOVqarJnDYo+3EjTRuGCrN28OrQYa3WjH4SKifZ8nTt1ywk9DGfRg+ErXq
         ng5GSkto8TVj6dRuxSQ7DqOX5yTY5yyhHNyC4r/D1Vajjhj+GFtk3clSwyAPkvIkq/pf
         QHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148258; x=1743753058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bp20qO40fgduH90YbAXMSJkPgrjllUsyzwuKVLOfjh4=;
        b=a3B55+2y2gT4ORjmoBJF8FDlwjyXh5OwgakSLirsq0kbd/Hr7DQ/RJbNuq5WM0C+Si
         d2LBncUIlb/LqY87I3dMQOE7ITrrJ2nJLw9qWeaetR0En3RsfLdklZi5KQV/OpkZCTHD
         QdCVval8lDr5zSLPEg9WGrrQYsKrIsoS/1WqUFxMQUEq4xFy52mQZZbXmlELyFdnFnkU
         JAmYaS+9mOJvowRqLdJgAGd9IrbJpz52rPe74Wx34N7O2pEiXqqxs5ISRIt7XtAUWiFH
         tS+KiZb0LxU+Fz1q2MbLqc8f14sQ8K/SGhnTqKlKU3lyih2EkuIS1zeoT2Lj6n6spkvQ
         IkRg==
X-Forwarded-Encrypted: i=1; AJvYcCUUSwpoqyX1d/9NqwTmr1f1RDEks4kGVbIel9fP++EZF6wLH5EO7jM1zPr/WtqJLH3w8OjUcyJDltd2OqAcMtdgdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpan4s10zNZAOnL6RBYjcLotpHmUZ0TmdD2OHIW5bxF0TAtedN
	D+g7kmN57CLSjCgGtvYe/gdZGMGFFIT6TepH/p3dTVUuJthZloVceDKCAtAW7TNoBlpZW8VOUVI
	7Ief32B3mS86Osv853xnM3RndFqmvY0rTygmGEA==
X-Gm-Gg: ASbGncv3UFDEbeebV4YsoOUBPxN4gRJWV3GObNLGprz+q5OoueQdKnv3NNYzI9xWtn1
	bTUMCQGsUKOmLI+LXQGedwfqkRH9NZ4FogQQbLaJpk4JT2GSe5oRET9lmxNnfplK3aEdRnXDGqL
	8hagC1maJCiFnMyB5+7sa92GgW3Um7x4lO6g==
X-Google-Smtp-Source: AGHT+IHL97IFoFHdmUomdi6+d9psXeOGxZaODIYnk2/zI5sJDSAilLWx2geAZLmq49kMG3BjZmtKdBJNxWJvaiG7uyM=
X-Received: by 2002:a05:651c:511:b0:30b:b7c3:ea4d with SMTP id
 38308e7fff4ca-30dc5e21b61mr27657321fa.12.1743148257818; Fri, 28 Mar 2025
 00:50:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327004945.563765-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250327004945.563765-1-peng.fan@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Mar 2025 08:50:46 +0100
X-Gm-Features: AQ5f1JrY_w-ZK0hNuiLg0Fi4CMfpsjTOrVjrzmqoINXb482Vi9yc8xjZe4FvqNo
Message-ID: <CACRpkdafqbwy0zRbPrVdQ7=tKtfU4wz2_5+tfthcD=ETgHBnWA@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] gpiolib: of: Add polarity quirk for s5m8767
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: brgl@bgdev.pl, krzk@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andriy.shevchenko@intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 1:50=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> This is prepare patch for switching s5m8767 regulator driver to
> use GPIO descriptor. DTS for exynos5250 spring incorrectly specifies
> "active low" polarity for the DVS and DS line. But per datasheet,
> they are actually active high. So add polarity quirk for it.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
