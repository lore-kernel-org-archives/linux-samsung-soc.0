Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33C21E32B7
	for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Mar 2025 18:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740852759; cv=none; b=FZ1SI27M59CSDHgnTw+qSZKx6wakUSiWrIGmlI5sTTuK+IyWT/gqO387jtpKsKkMgDlf54px8vENQ+zUIAHCmDf8fBkPcWRFyHQJLuXQPufHrWCiJPgL90BfaZK64f1vJeYAu7PzBwPzsVLWYqpmMWup4098tNBelGi87ggO1Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740852759; c=relaxed/simple;
	bh=hO09TeiGW32giSrF/zFbXkUU8toE5ieO9mC6ZpO9u5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BsRWFEflkdsQQJg75ezmw40pPGUTzNW7HmahojwBkRaTJfP2Z3omekI9okXMltXdcKVL8hD48PFJV0aLdKhbb1zH9mJJ+PL9yRQFlCXrPaIINZrF5bLaRT8V9Owdx2uJYLWnHNeMbOBGusMz8zutUByUNXF/veBnUkXBwVrow1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rk9EL8sJ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rk9EL8sJ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5495888f12eso1074578e87.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Mar 2025 10:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740852756; x=1741457556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hO09TeiGW32giSrF/zFbXkUU8toE5ieO9mC6ZpO9u5A=;
        b=Rk9EL8sJWfHphK8pAqqnLFiAHzMVDeMtVes6WZAjupVQUUWkh8pLEV6O3AfNeOj+a7
         BIDGekmxSLeB44mR1+0XEj6z9xNy2BD5nTLkPwB6bDV8Ek7ZkIo3ABM2yn2+4jd8sgzD
         PQMkjHFloi2MEa0e38WFpdpnSGBNBw3UNyGnQ/DfhdC5vKlVqkN+xi0W38qsCztb2kqh
         9hsQLsqovLDqMe2zvzGIHENJssBR6AdYu0/v3b1wRjD00ok6joz9gWPtfZZizW84yuhm
         eZ0hbvy2VHt4BsvJk/pBt1DlNe8nvE9TeIN+an+ivHIGtt1AcNkHmj6Ss+h1+khbb35H
         1AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740852756; x=1741457556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hO09TeiGW32giSrF/zFbXkUU8toE5ieO9mC6ZpO9u5A=;
        b=L+ESDYxGdLhH5jjqkPDIhbFck7YphNfrSSSjpPSClfjrnJCtiMGkYFRT87iQM7OK/e
         FhrEicGIgTkbweIBk3B1ofSItZy7KhDaJ44O2mitd/yZy3RBLslHK+jPr3qE6iyLdAYt
         tALnx62d1uCe9BN2rlVINGCf5OWh+3gdInQ4JQbcRIA04Q+ak8xY/58e+QLZ+XB614Y2
         LMLJMIZWwL7AYTXvf43bjPHnRbDNV4obulmIhu+2Is5ws8MFlBs8+bCdPVm8NYlaiJCH
         fzAGact5oATCcmfsBl4Z+b2//YgxNWUKFYU47FjAJ3GRTDqhq99ewN0H2hZmcaCxpNln
         YX7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWp1/RyxgYxqVKzaPurX0V0wZFDC6SzFjauepcWipjm/Pw6WXQsqYcUNVhjTU1x/P39NhEs0g7IYUTlPXTuj7k3JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBGvxo/0Fa55L2qOeJMLjAutjjQEX78JompjenaBiSlx3bH74e
	MS8sOAfo4v1wyPjdjgWXicZIyYKPk/KjGDuAR6QTltuUndZo+iGVbzKC2HVDejysF7/q7c+JC6p
	dlsopaLVnwIwUSPKzpWj6qroddX3Ot/OjFHSMOw==
X-Gm-Gg: ASbGnctC8GyFJH1p9awLQc4HsKbiYKR4Ywwe4b5QSjcndfbKplq4JYCfsBLNCI87Mc0
	zRUawHrZowEpl23oFAlvtv1A0TVr4fDZt8VV7zLif85TobVaaBqKjwM/y/7Y5QVgU4IMTwxbSIW
	+78NBf6EOIF2Y0PiF1WoV4Z7PkEw==
X-Google-Smtp-Source: AGHT+IEwNP6JAG/ImVlBbFKSPeJyF+kN1wgYSyFdUn518Azn4ly4yqI8vygkNmnNaNRO/2W3XMFUQZ4MRvI6PuiQBfo=
X-Received: by 2002:a05:6512:2391:b0:548:f3f5:b26a with SMTP id
 2adb3069b0e04-5494c38bc42mr3507636e87.50.1740852755828; Sat, 01 Mar 2025
 10:12:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org> <20250228-rtc-cleanups-v1-6-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-6-b44cec078481@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 1 Mar 2025 19:12:25 +0100
X-Gm-Features: AQ5f1JrMxHjOeiAFu01e9_js8hUt6QETaY6N275XhvcjrnB0bEBgE0astCzSAEQ
Message-ID: <CACRpkdaWjTiqSUj59YiQZ1jsJWzHZPMo3xS6n4_JwdAW6B_Kfg@mail.gmail.com>
Subject: Re: [PATCH 06/18] rtc: ftrtc010: drop needless struct
 ftrtc010_rtc::rtc_dev member
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, =?UTF-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>, 
	Dianlong Li <long17.cool@163.com>, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 3:07=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:

> The memory pointed to by the ::rtc_dev member is managed via devres,
> and no code in this driver uses it past _probe().
>
> We can drop it from the structure and just use a local temporary
> variable, reducing runtime memory consumption by a few bytes.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
