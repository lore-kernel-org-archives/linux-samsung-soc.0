Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A807E107
	for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Mar 2025 09:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743414624; cv=none; b=OsgK4CfTuBT3SBXgESwHXZU1O3w+VD6k8gI1hg9fKA4WJA36VZrmNnQQJDyykYgcsU+uAAogLHS4UChdXPXY5LkFXzQujHG5MgUPs/STX6XtblHkIo64n2fTHCeBQZJ/GtLmH7oTkErJlDa2Udmfl//4RKMjYyFAViJjxt844t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743414624; c=relaxed/simple;
	bh=WfQTWTf6PwJHc84otuP/3Oag7lcNdI1Qagn5HFWHEVA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IBXhXjJiKciyZGnq08s8jQ03NMdPEzjGmESyLH0/FyeDkJC8iv4g+Jf/VkSrpLWDK+UWSiPsgbLGrtqRN9DhM0wK2weukCa44ig+0Vw9P/drAK1NcfJV3/k0XPYo32bTkq4yLnn+/q2ZIWC9noiG+GKOP+UYrSZXbklFy1EhOrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUU6uazw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUU6uazw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf848528aso38103855e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Mar 2025 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743414621; x=1744019421; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WfQTWTf6PwJHc84otuP/3Oag7lcNdI1Qagn5HFWHEVA=;
        b=sUU6uazwkA8HHrSIhWW0uNQTB0VUfOY2iGiD1yr3zKrJq6Q5qz6eJD2ixgC6PhSW20
         h7JbOgEGrXvNmf4uwQJRL19QH+U/v6LzXmlbrM6dK/nO8rklxpZjjXk+OYy8vO/z7BwV
         qFijTuMGEE4MK22fGGoACtnhOObmOubIOMXev5K5lRIlkTzfnltNisDwVv1j1X5/qA3G
         EC/lTyZDPlKHNOCR0hZFl1CeUbBGsjILXNp+Qu5QcOEIuZzJNeLHUjcIClNURtbWaIX1
         DrGqTbzGSGgjWTKjZgYqSw7dJCGvPZNz6cT9xvUF0NfZcQOyx6qQdspn7zLxemIWAJav
         hFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743414621; x=1744019421;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WfQTWTf6PwJHc84otuP/3Oag7lcNdI1Qagn5HFWHEVA=;
        b=DZYW/qKlA9vuwZY4qyIySwlVG29CHoiv+8d/H++glh5sEWHJCSbKA7BcdNc1+9NS25
         +WTqUEH+RY/K2vb5sPTwBNr4j37YongRsJrXpfYIEjFfCej4gBgiAiegPKuoixJPYKHl
         96pq9QzcRtU9P2+Ou6/SiIcCJfXr9dTgTxI4us3voj8F5+hGuAch6ZzTniPWuYF5ClT6
         qsBixKGA4lm3jhpdRzUVI2BaDJOlkFZvY6CLj9ypeyk9Af6JkPhIVXuKDHJKXxvE6+S7
         rJSsNErjbXa1IDkBRERxiuBBNtxfttl61Ag+KWUM+3ZWHsiaHNGrkFsuq5+V5ozg7YuE
         4M/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIRfvOJgZOZ7J2RoBDVOfXrlDeeeZTYTXyra8odpGtnyOrf4YhaSSv4PT7ckXr+qEgNHb2k78VVlo0zo8iuMHB1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpcUQg9dfPUUqq24CszQ1s0LKw1jAst6QvBu3FOWtyRJ2hV3wc
	YN4QhV//r2xTY/FaaovwzTUENeUeDiEymvB1atdrEm0pD+nIEcPk1dhvmWLcHH4=
X-Gm-Gg: ASbGnctxHPXEQOzV6L7lv3HiZSPvVJG9JlI1B1jdpiwp5cz6jFf/J7mxpyuqo6qElss
	rvKGMuXS+U+81/QDoVcgWOwJ3ZJf2n4oVNabc4aZ7/dGhoYF8eTml+3Ez8qEvEDyQZlTRGH66BW
	GdAqpzhE1cvzkGNm1j/rDoFaosSZbZoWH3EqIuPLhaFbmjXEaLNIIGCZThLIbvG+LidyiebSVq9
	P6TG5M9+1rxCaLnqIHSR1CqGVdUPwywD84IThMhkg5H6DD5N/u/ljgFZaCP+J2qFOLoAfPFtHNa
	DqIfozCQU8He5na/rWEPr0fpZ28ZAOvbw5TcfovEBePm7qnh
X-Google-Smtp-Source: AGHT+IF3CJoa5gLjBiJodD+/fcAKbJi9kK8EPGZgsz0yOn8C5Pq2tbjitNJRw36ftrGGInm9OE4Ezw==
X-Received: by 2002:a5d:47c5:0:b0:38f:4d20:4a17 with SMTP id ffacd0b85a97d-39c120dec24mr6778714f8f.13.1743414621425;
        Mon, 31 Mar 2025 02:50:21 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff03715sm117091365e9.31.2025.03.31.02.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:50:21 -0700 (PDT)
Message-ID: <4d8d0d479a1ff19bc3e3a8f5832d924ab822f13a.camel@linaro.org>
Subject: Re: [PATCH v2 01/32] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo
 Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette	 <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King	 <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon	 <will@kernel.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Date: Mon, 31 Mar 2025 10:50:19 +0100
In-Reply-To: <20250331-prophetic-convivial-dinosaur-efb1af@krzk-bin>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
	 <20250328-s2mpg10-v2-1-b54dee33fb6b@linaro.org>
	 <20250331-prophetic-convivial-dinosaur-efb1af@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Mon, 2025-03-31 at 09:34 +0200, Krzysztof Kozlowski wrote:
> On Fri, Mar 28, 2025 at 01:28:47PM +0000, Andr=C3=A9 Draszik wrote:
> > =C2=A0allOf:
> > +=C2=A0 - if:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
st: samsung,s2mpg10-pmic
> > +=C2=A0=C2=A0=C2=A0 then:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg: false
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samsung,s2mps11-acokb-groun=
d: false
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samsung,s2mps11-wrstbi-grou=
nd: false
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - required: [interrupts]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - required: [interrupts-ext=
ended]
>=20
> Drop, you should require only interrupts.

As mentioned in the commit message comments, it doesn't work with
just interrupts. It appears that dtschema's fixups.py doesn't
handle this case. With just interrupts, DT validation will fail
if the DT uses interrupts-extended. There was at least one other
binding that specified interrupts in the same way, so I went with
the same approach.

> OTOH, why regulators subnode is not needed? Commit msg mentions they
> exist, so they should be required. Binding does not change because you
> added or did not add yet some driver support.

I wanted to avoid DT validation errors, because we haven't started
working on regulators yet, and it might take a little while until
everything is in place.

I'll make it required in the next version.

Thanks!

Andre'

