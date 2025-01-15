Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4712475DF
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736941991; cv=none; b=qNdcH4V+FaYfXgN2Ra8wyQfv9wc5+nlhkQy1Aayz2S06nNaQRZ1cqbm++AoDYszVuzbJIgZa8qsOmTTR45xaDPe8+EGB7MHKXq4N6BWheIhf3+DPT6wJ29wmeQRr29/wy8PJiHGFRwFO8y8KDgDeBqV1rpSALhR1wvOaVpGnoB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736941991; c=relaxed/simple;
	bh=9PW1TOdF77J44g5RTKZ2+cdf9uyr6dz/SQcOrpc6uxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMsHfCSH0GTWhFPlhFLbS8w0vxgxCcAGcBJpdssbjWY2r8TDSxJx3tGsDylkD89wem/8xDdgp4GM/AXOX4JYQYsSFPBbN0ZxLaWuqc6jniomrsEYvyUBm7IP9Mm/Od3k0VbP8Pk0TOcpO++qDr4ZmrQR06LV1hdsjZbodj7DviI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aCiZcSd4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aCiZcSd4"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e3a227b82so5634018e87.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 03:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736941987; x=1737546787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvqSWtzGtHPP8eGp+zVA1xgjOnLlbFcSarz6cYFQfDM=;
        b=aCiZcSd4mmFeg+SaplTCvASHTJZM3iOGsKWxkDCGGvDgvpnMmRtL5+p9yZuGUrRJzQ
         s0fnH6TJhc9pNxbzGLtafQPYwEgWxP/4eLvNcpkXsCxE7oXoyoMWu643mjaiRUdZ8ywC
         a5ITdZ6RF3XQ5YjpCWJDEEMCOyajAesx0xNa9h5qEK8RCVaTakMyhiADKYAkTOopKQNK
         BIn4q9m0e2RHO93RUFfdsipaHRnfRNuIGK4m04q1d+L7xCGE2phLCrdCjJMPbL3Ncc4x
         Xqx5AyXa6LX8XVJvrPkXsGGCAIszuwoukkIChUFcYPCWGuoUFvLsSHQTt6BioarCHtHi
         4/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736941987; x=1737546787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvqSWtzGtHPP8eGp+zVA1xgjOnLlbFcSarz6cYFQfDM=;
        b=mTv//D24SBjiWM2xQ7wR5a4koIJUaIoizvLgJ0AslDYjpc39fZBbrg8uEHKVtXuuT5
         EOAwnfeym2GIm+mhvc47pbF+qG1487OhRvzjNke0uh4cK5g5ScAZ/XkXuJCB3xFoGaDp
         aMc32+nnzGWyGNG/UrFUsKZsoVEXYcbLdkecXwUeS/AOH1J4HT82fILgjj5pQn8hJo+R
         ULYkrL4fMhPPtGKSCWCsxKPy8BdIOsnr1httRm6lSsolHqKbD4ag+6MfMc7SrEZq8JU8
         odcQThaPF65Kanxf5aL60KY58OshE3G0HsDbQlMn03MZeegKOLocLNYhXde1FijgaTnp
         jUjw==
X-Forwarded-Encrypted: i=1; AJvYcCX+zcXxyQ0tOUexuVrIaStslXj5QN7DseVs1nfToYVAsDFK56EFdNIe0ujwdi2jax/DazbkdfrzsywkiMieHy2fDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4dFQ98iUr6BJJG2LZp/0x+l7qrz/Wm5S+0E629RyhYvufpCKE
	h4a9FDFc+LxQKqhFRcbWgknybL+mhpPNwKkXB7BLgT9yb1YDRjUvAhRXMtbmWYzphKAfgbEVT/M
	MOnMD7or8taXoB+ApE5NbxYo1+l7TGvjuEOcNQA==
X-Gm-Gg: ASbGncszS0+B+DfI6OjO3O4NzLNRxJ2VvoSb5F3r/9fDwQJc6Kh2aT5VQbYwoLufC2Y
	4lLu0b/cjJuA6vUg+I/RbpWokAeuaghr20FshwA==
X-Google-Smtp-Source: AGHT+IGBlXrCMYgYKLgZmDqCoCkzk9zXGTEbjg0n3d9TmJW2cjKGPCuhqJcY6YuLhBfY419BlW8MYE5VzPIfrs+M4Z4=
X-Received: by 2002:a05:6512:ba5:b0:542:a73d:a39c with SMTP id
 2adb3069b0e04-542a73da516mr2355986e87.49.1736941987038; Wed, 15 Jan 2025
 03:53:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 12:52:55 +0100
X-Gm-Features: AbW1kvZ-ZJDljU7xDZeyhECu0xIb2cb416ZbrOmY5XJEA2ldhLke2kjbohdh8UU
Message-ID: <CACRpkdYPSprYwCz-Qk8a0CqEeec=HVV1AwgVbRDyv=Vk323wcg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 9:36=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij
