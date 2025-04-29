Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE6527F747
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 08:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915732; cv=none; b=aK+go90tEnm/Slu4GLExB6EVk5kcjW8+vCa4i4sRj5h67hfv00tehFsxUbGBFGj1x2gTPVHx8PKYOP4dV74TifL27cD4wFXYkzBVyUX2HFfhDu1qznr/66LVJTZ0SFjmZ1HrzrLuLOKvcF+Ut/PZHA8U3ZUgJDz+tpNwa+ggY/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915732; c=relaxed/simple;
	bh=ydLDKnQ91OvT5IwY/23gzsrsTpAlhEMjzxMQZcD1sso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crsc9KKFPlLOP2XgwbX4XAgQGw2Y/8bwC36HdeFd9iKNuDrAg8kJWfJUfYzn0/7jfg6ukEzWG7wJcL8O5rS+GmLc32ITnDLhIAJG8luK5ewUj+TL6asSpClfB/RzG/YamxWzCxr2ir+0sK2ySS7rbohloJQeZf4KgBmrWoJ5GKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y91tsDSK; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y91tsDSK"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-317f68d0dffso60742561fa.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 01:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915728; x=1746520528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydLDKnQ91OvT5IwY/23gzsrsTpAlhEMjzxMQZcD1sso=;
        b=Y91tsDSKXNbUMxI6xm/s20eo7WOsAA8RXL4vNxAMz7frt90kBek7h/Rt5h4cqvxZOn
         TzvpyPsA/VjTr+A7J0JPaZ3bdahSZxMZnTPPTAUXSXRDVsy+R8UBjn4AL0kxkzWo4/j9
         +h7ohyMRYO3wWSLDexJCcDgBif8Bc8viAGJtZD8qisaIOVE1ehewiDfhgBznmPajzmFR
         Lxq6/+gk2oRojzZ1ckgPWF0jE/sb3+VNlM41cHQmsw7vvOWwhGEZTinXHovXO2FK3Wz0
         yNqM564AknHtSjn8Yi7owQehobKHjwl5jJQ8kEiwvi9FFBI1wbpxrzvTqsD4y1qDTVUq
         r9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915728; x=1746520528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydLDKnQ91OvT5IwY/23gzsrsTpAlhEMjzxMQZcD1sso=;
        b=taRYueCG6Ws6w0iDNXh3KZYNV35ghU/n0GfUFUQT6X05dwMqkTiDjJVGZpDHqe9NIF
         RbeAlDMh8NeVLfQi3bsm8UeJoeASPzGIdZbhpd2oFi88ruYyuop8dLmdX6XcCiHT+CRJ
         IreSLoj9PPNvTjgDdm64NyVAnCSxcu19vN/wBdMo5e0yTqCaxxHLmbrXCSy2zodz7YEI
         WJV7jkD9vCVqQ30y2NsAUa6xuFYepTmfcUg+aYMesYD3Z9NXCT+Qki6T6+k2WX7NCHYu
         dsOGE80GyL4z9DwYwTuTDxJXYPK6xHTMpMdawsYLze4rqAQTP8BRcJITkUntlwVTv4nu
         fiAg==
X-Forwarded-Encrypted: i=1; AJvYcCXa8Z4CQKP3wdhwy2AKlUQw41q1nJI3TFE63p6IEFg638HHq6zEOWgM8KKAmUFnhc9KZm5ccEHaDFB5TSQGTk3xTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjcu/42g6uZ5e52hOfi23lxOzu7tByDJMgV4PTFaSJTXlSl0v9
	u/e1Ql6+CIJ/hFucAjrt/oj6xmkpjLrgbXzqWlcmvPrC/N/vZG+OkPJ4gsNG0XiEiAlLNZUtmJw
	vFW9Isyss/o+Uy4j9DBi2O1OcpmNaBay+zvtExA==
X-Gm-Gg: ASbGncslQJhN0SqTayXxa6iNjxcAvSOqw9vKUgryQSxCXYgHv0w4pGxB11pjb6qxz2Z
	ktGcW51wnKHCX3+jpiBVqQeaywkFAWtyZWA9qaAIZ5vSV7vPo82wfnYEO1AiI3wcipJCvvZJAuP
	+7dz+IHoIP+9HdO1oxhYbUXQ==
X-Google-Smtp-Source: AGHT+IEsezp5muMVAY/lE/H7DEdH8WV2VmTWB3mmT7yKNRZ/0B58jZOoyjXMik/+mxI9FIbD9XZIJdk/S7T9DrPLhZQ=
X-Received: by 2002:a05:651c:30cb:b0:30b:b7c3:949a with SMTP id
 38308e7fff4ca-31d5b13bdb9mr4753431fa.18.1745915728423; Tue, 29 Apr 2025
 01:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org>
 <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com> <CAMRc=McmRB8iNPrTztoSLbEXX2WxNp5d3t5--AAqzqU2LQ+FGw@mail.gmail.com>
In-Reply-To: <CAMRc=McmRB8iNPrTztoSLbEXX2WxNp5d3t5--AAqzqU2LQ+FGw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:35:17 +0200
X-Gm-Features: ATxdqUFfjlFyz-8zlCBHswKX86tkhKgqvxLDp3L8XiORh1-aFhf72vJ7elWy1Tk
Message-ID: <CACRpkdYRCx8_zLa_OtcFwjmL6_pCsU0hcUe0_PP3=EbukbM7Jg@mail.gmail.com>
Subject: Re: [PATCH 02/12] pinctrl: axp209: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: wens@csie.org, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
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

On Thu, Apr 24, 2025 at 8:55=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Thu, Apr 24, 2025 at 7:43=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrot=
e:

> > I guess you could also drop the curly braces, but otherwise
> >
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>
> Right. Linus: can you remove them while applying?

Fixed it!

Yours,
Linus Walleij
