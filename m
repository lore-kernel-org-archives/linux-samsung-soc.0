Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A62314D14
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 16:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764000806; cv=none; b=o57sEWvzD+vNW48Ll1++CLEeNCPjo1Vjd/e2kDGLGSb3C4i05yiVIJpFKxE7C/I0mq2WJD7cAFVrgg4K+SuIcTDIyd+7bYm5x+VFQrfg7VqTF7+T8BEyGFoZlujehUIzf26pTqPB+ej0ZDOVyqOoq/vdkY7Mrfz+H2h2yqCsOgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764000806; c=relaxed/simple;
	bh=s3e2+5ErfhqMPd2m9183lfzRZ3SAL+PNdFL42U93T6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyEwKUAx6RrUMPZWTFU53CqwRpnIiVPVNW1Sr12TBd1k2gX2MVJAqrzQqqHQYyK1sD7Nyog+Bfpv8Ikfj+gHJmQImExFgPiB2C+MYhLtS/ElaR1Y7zXIGSozzF/9rCaiMP8UMtbLh7+QFnV80/XcLfWjm9qvY9wg2QHxWf4mHvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bk0B3ZJb; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bk0B3ZJb"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64180bd67b7so5950239a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 08:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764000802; x=1764605602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3e2+5ErfhqMPd2m9183lfzRZ3SAL+PNdFL42U93T6o=;
        b=bk0B3ZJbVAc7bEpTRf1bsMpozsgOS+lqzhVX1Lh3GgVVgsghCNTfFn7wR90l7gHhOH
         BFmtO/Zk3zKfAd7ycrDcYwTm64+uaYtyPChJkFBZEcnfovOB5F7woV614buOO80ZVfkv
         3sqmU0PQif1TNreBFSbzKYApqPOfxS1ljNHPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764000802; x=1764605602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s3e2+5ErfhqMPd2m9183lfzRZ3SAL+PNdFL42U93T6o=;
        b=AC18Up/lde16rL0BPC86xFNhY5whIqUf6PSmFd0WN7r3o8j3Pr21UxN9a5MuZ/YTJ2
         VqpMeaxmnyru7cmbCWvjPCszL2Ygk4/Xqt9ve4YCj8uABLrX+Jvp5zacWg/PxM1ycjiy
         V0I5i7917ttjOJus7MItlO0PPNSZecxWfNlxlSgeGU0PFtze30elR03K+Yr1ZLdiEd14
         0ER6pPElqbe/Is86RPvVQ1A++UgURMNp3DVJxoks0cVA4ocdxMSnmNcZ/pUyysHyB9Kj
         D2SFlHoTDPveBay0otBPaZzXNbHdK6Maf9OY/QZmNi0VXAzGut6l9QISmc8vA7B+ZsM5
         ucnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxvwdjL/tJ33RGwm5/QN5GCamOVfKGVRx9jpYdPH0/eS6Zb1gEnSba4vpGE+McgsHhaisuBKhaZr4FuaA+x7w3tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQZgLkEA66rdraIeVeUJDF9CrLk6u2ZA+H8SPwkjWPwzsnZQL5
	gsLvGwpFZBkxf5x64RUFi46PQsLs2ufxYpDycJg9ZKhbrxIQs3SD/2paqBCfja/f65NOz11jOf+
	1HiMt0g==
X-Gm-Gg: ASbGncvutasfpfAAaXxHnZ9S9o7P6AYi9Lzm+JiovYbSUFQ+T5pMDLeIkTjiOGwyfV9
	Ds2t4yTyaEHJJFmahYlc2I5C3mR0z3Mv5wNkhmYoHUxSipggSZCcIdfUjm90x/SgI1nCM7fe/FV
	PbrYurv1NpFQXnZIX2Lds5vK+DKJcBc/DcokoUQKrGbj73Bighukx5bozL8XhNwdPnnE2l1v5cr
	vxUeddBqhOD5N8/pAvtBkDcLz/TKCiXjWCGVlgYx1HR+/tLGXEK9WTv5bEv2qMAlZcts0tGIROC
	b0JvBu5KJXr67K8ic0FWVgL0XIVGF5r17yYpPHWSdQ94Kld4HkrHh6ZDWuYEWSQntnFAXefESEF
	hsqGNGBKdctGCazMVZZ9J3tehH5tmEQtQxQD2zNApYTtVWVWfVvEF5nb1RCQ8580+4kfGs+COq7
	TFJzCtpGOyz97UjcuInJCQN8DwMJzMFcjrl/eY+LdkC/LVYBiT8Q==
X-Google-Smtp-Source: AGHT+IF02LfPDmycpX+DEQzMvZgEqffVVO1sG+MFPs/QsX1p8uTdWkfGB9xxxnha5vQ/737RuTE1/A==
X-Received: by 2002:a17:907:3f1b:b0:b73:544d:b963 with SMTP id a640c23a62f3a-b767159e21amr1330613766b.13.1764000801660;
        Mon, 24 Nov 2025 08:13:21 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d54cf2sm1324899566b.18.2025.11.24.08.13.20
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 08:13:20 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b387483bbso3361228f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 08:13:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWh97jG2+chVuG67ViBbkf3UCFGS7TopE8JqA8XPuQlpJg8b6BwkzTgVI6rys+tJ+6kDxk8XXnTBECcVovcPW8A2w==@vger.kernel.org
X-Received: by 2002:a05:6000:2504:b0:42b:5448:7ae8 with SMTP id
 ffacd0b85a97d-42cc1d2d6fcmr12194643f8f.29.1764000799689; Mon, 24 Nov 2025
 08:13:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org> <aSOKS35/huSWd/RW@duo.ucw.cz>
In-Reply-To: <aSOKS35/huSWd/RW@duo.ucw.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Nov 2025 08:13:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WVeiGa6YkRmce4McnePEV9X_n79YA0bywPdNZcZCV=ZQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnTIIDYlcAzuiT7QR2OuZm4XUUvQ7JBRQh8rXJBFJr7sqsbbpHBMlqok64
Message-ID: <CAD=FV=WVeiGa6YkRmce4McnePEV9X_n79YA0bywPdNZcZCV=ZQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: google: Introduce frankel, blazer, and mustang boards
To: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Drew Fustini <fustini@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 23, 2025 at 2:27=E2=80=AFPM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > This series adds barebones device trees for Pixel 10 (frankel), Pixel
> > 10 Pro (blazer), and Pixel 10 Pro XL (mustang). With a yet-unreleased
> > bootloader these can boot to a UART command prompt from an initramfs.
>
> Well, booting to full system with working cameras would be nicer,

For sure!


> but
> this is good start. Do you plan / do you have resources for full
> support in some reasonable timeframe?

As you can probably guess, I can't really make any promises. :-) Of
course, "full support" of Pixel 10 by an upstream kernel in a
"reasonable" timeframe could arguably be impossible no matter how many
resources were thrown at it. There are just some drivers / subsystems
where getting upstream working as well as downstream is working
doesn't feel likely as a short term goal.

That all being said, interest / support from the community helps.
Knowing that people are interested in this work helps motivate folks
at Google and (hopefully) upstream maintainers.


> Please cc phone-devel@vger with phone related patches.

I will try to remember.


> And... thanks! :-).

Of course! Hopefully many people find the work interesting / helpful.

-Doug
