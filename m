Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ABA2727FA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 18:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763057109; cv=none; b=m3Ua0rcoAKVMXfWufA/HIcpKVd73O5Ms5lqiI55ZdmjnKKkvruy97CJASZQZ5ZFQeGL5SR08QaQiz8FsbwvaElzPKtixdhJyUOhyAWf5g7ng9weMEtkfUfVpS7X38x6yCWB2m94AbQaVu8PrT2OeL2+amU2dTuWgYVSfUmMVvw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763057109; c=relaxed/simple;
	bh=pf1IXO1BZpdM2zhduHtSifJzEC4zT6MOU9JeXX7SMOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DESaDMLvpm4v1c2YV9t5bT7eJAzfzOoJEcSOCaO0wn+59vcGRMwMZO1RHBgBP0cyB67lLxNFTYmuORKNLxZNDYbPPsCCL4NlF7mkJ3mY0KmW5kjbY1l6/gm0ZXTHlBG2c/wUiWtQRSwVrocn1FMbgXtcubjvLb1DDm3bb/Bb+ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T6pR1b1P; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T6pR1b1P"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so1945478a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 10:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763057106; x=1763661906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6uac0xj8a+6k+KJ/TLozw+bMuDmR0K+Bzcv/b4RoLw=;
        b=T6pR1b1P43ZXj2puR23sy3uk231sNkZLlH9DjDeelL+u5ZxhuzON6s/1n/6yCpS2RF
         KwM1T1w9Y7KAkVAK1Q6D3rF93A8mrWkQ6J2jjuKzB8KNKjZ2nHLZP+w3QqDP3Xhc5ERc
         3vjMkwYWPk37tu9bCJqzVoJVJxG5aP05q8tmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763057106; x=1763661906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X6uac0xj8a+6k+KJ/TLozw+bMuDmR0K+Bzcv/b4RoLw=;
        b=DfZIsjNWZDWW9ohLYoa4SMvTvrdetw6i8WhHFH+CUh03IVPzMYsqiOZYbhARCikhkp
         CrM6l3WhQ3KiXnYv4k1J/AeESLBCZ9QXQohQRDhZDUQfofiKbBxq1lAqh05HB1GlJj+K
         w06dm42642X3XvHED28mZlVo5/fHC0QKSjOw7PnIvA5EBmS06DrpNsckuV+Y3weSYUTr
         wMXJqkxogpsL+VdLC7OD79zkAIv9Exs6Lncd2ExvV6Akx1pICUL38ebGEYZggMQdzpMB
         5T4n49jnN+cO8B1fPy2F8EwYMRsrJAKvak3wYhHxFElNU9NX6q5Ya5FKl4REEFNoby4d
         YK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7IPUiU/+s8thqwxuLI+jRRrFLO7Xkgm4jZfCpuHGYN7/p0HGnjPxVZRgQgwg9QSwT0bmAF2REcyaRIdoNev0f2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIx6UJAt26/rSHo6SXR6YCntB/M2UHnHFBfO7dELVWX3u/bg2g
	5bsRD3QEHlY8ck1m2tWDBZh6ZQpluRVysIQdH9tF4mYMma7P6gAYvRlRVr9t6/3mfVn1LUEAPiL
	NWUaAb7V2
X-Gm-Gg: ASbGncuRPOcs+AS94OGP3JEhDjzqp8WXgTp+zHCJWJHuPr/Aj585b09tRmSEEmVi9Ze
	JBeQDivKQHvea0UljefvZtS+PFi47Xnh2P1TggpCazXYE+G9Bt9Gfjia6HH3lGr7QIlk/ajLuOq
	xnYkZJU1IKvzqDcauyy7bQHIaI1KTcMKkVQVPa1bdfrAoPvgX9IB9Wu0La5E5hIKmmqXkGhyTTS
	9zzq1Cz6C4hkr9WDHrLc2B3XzVPghkmy6HyHauSoZY3tZvxbKlKF739F4i9vnbKSXJqfqLRkcwZ
	GyBOJO/twN1X3Y3c2JqYRikNyy8T127Wx9E/9kX52ZZn8FJNGPtY8UiRM1qtfV1M7+WQR6FbjlQ
	izEH1C6vmwU4Jv+Ufl3w4XU9b7C+gY724jqE/2v7Io6Rs1QsfTzg8G+9OVAnWJeoGbbGXQbFrhK
	2vwYc1pjXE7v/8RrMn6qDIGzGlPwLP203P3OmoPdpDLqhgyL/nwxQSEjWBEoDQ
X-Google-Smtp-Source: AGHT+IENqgrQ5f2BxF5x62anwa0H0qv3bzV0oLjYkWyZE3Ts/zIhwmHCRIMAEbW8uYM0cCoqEpnUBQ==
X-Received: by 2002:a17:907:a41:b0:b71:1164:6a8b with SMTP id a640c23a62f3a-b7367869c44mr16832666b.7.1763057105750;
        Thu, 13 Nov 2025 10:05:05 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda8d69sm208014066b.50.2025.11.13.10.05.05
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 10:05:05 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso674416f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 10:05:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDkZaXKEkV/TeR9B/WeIvpV9+cirSl1yCQRal0fmXPHdN3ugOMfg87OVLtmOH5SQvbf7WH7BtPwXW2KjOqxQTzpg==@vger.kernel.org
X-Received: by 2002:a05:6000:1863:b0:42b:3023:66a9 with SMTP id
 ffacd0b85a97d-42b59367802mr289626f8f.22.1763057105007; Thu, 13 Nov 2025
 10:05:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
 <05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org> <CAD=FV=XXWK9pmZQvNk6gjkqe6kgLXaVENgz0pBii6Gai7BdL-A@mail.gmail.com>
 <00ea821c-5252-42cb-8f6f-da01453947bd@kernel.org> <CAD=FV=VSxeKgGcsRb9qiXq7nsbOWZjPvzmGEOhFA+pmABWdknQ@mail.gmail.com>
 <6490f20a-2492-4ee0-8f34-d529e0df0bad@kernel.org> <CAD=FV=Us7SU_OifVkS4mdfVhc=xGYSBiBpBk9aA1Ki0y+iYBpQ@mail.gmail.com>
 <abb77afe-c285-46ba-88ac-08574bd67712@kernel.org>
In-Reply-To: <abb77afe-c285-46ba-88ac-08574bd67712@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Nov 2025 10:04:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VcAbgv41tjgWQN4i8Wqk6T6uvdpQ261Q_hcKM4AMpGEw@mail.gmail.com>
X-Gm-Features: AWmQ_bm88XdKzAi5IStwbrVdXDDrbTXMC9ViB_9-mq5L9vr4mmyrArKaiYvTgn4
Message-ID: <CAD=FV=VcAbgv41tjgWQN4i8Wqk6T6uvdpQ261Q_hcKM4AMpGEw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


On Thu, Nov 13, 2025 at 9:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> >>> Yes, the complexity of just "hooking up" the components on an SoC is
> >>> an order of magnitude harder than a Raspberry Pi, but it's still just
> >>> hooking it up to external components. In both cases, we are modeling
> >>> the core "brains" (the part that contains the processor) as the DTB
> >>> and everything else just "hooks up" to interfaces.
> >>
> >> You mix the topics, so I don't follow. I speak here about bindings - y=
ou
> >> cannot have the that compatible alone, because it is incomplete, just
> >> like compatible for "transistor" is not correct in that context. You
> >> speak what could or could be DTB, different topic.
> >
> > A "SoC" is "complete". It has a processor that can run instructions.
>
> Then show me executing any piece of software, which is the consumer of
> the bindings, and runs on the SoC without the rest of the hardware system=
.

Show me something that runs on a Raspberry Pi (the models that don't
have eMMC) that runs without hooking up power and plugging in an SD
card. :-P


> > In any case, maybe we can approach this a different way that I alluded
> > to in one of my other posts. Can we just call the SoC thing something
> > different and make everyone happy?
> >
> > 1. Rename the SoC file to lga-b0.dtf (device tree fragment) and
> > _REMOVE_ the top-level compatible. Problem solved--we're not adding a
> > top-level compatible.
> >
> > 2. Add a special node at the top level of the "dtf" file describing it
> > (so someone could figure it's useful for). Like:
> >
> > fragment-info {
> >   compatible =3D "google,soc-id";
> >   google,product-id =3D <0x5>;
> >   google,major-rev =3D <0x1>;
> >   google,minor-rev =3D <0x0>;
> >   google,package-mode =3D <0x0>;
> > };
> >
> > 3. We can compile the "dtf" file using existing tools into a "dtfb".
> > This looks just like a "dtb" but has no top-level compatible but
> > instead has "fragment-info".
> >
> > Now we're not violating any spec because we're not adding any
> > top-level compatible.
>
> Didn't you just describe an overlay or DTSI file?

Sure, you can look at it that way. ...and since you're happy with
"dtsi" files I assume you're happy with my "device tree fragment"
files, right?

The difference here is:

* A "dtf" file must be able to compile (with dtc) on its own. Contrast
with a "dtsi" file could rely on labels that are provided by the file
including it.

* A "dtf" file needs to have "/dts-v1/;" at the top, unlike a "dtsi" file.

* Kernel (or other OS) build rules will be happy compiling a "dtf"
file. This is in contrast with a "dtsi" file.

* A "dtf" file is _intended_ to be compiled and hooked up to an
overlay. This means it will always be compiled with "-@".

* We can document the requirement that a "dtf" file needs to live
together with the overlays that it will be combined with to make
complete device trees. This means that there is no need to set a new
ABI boundary here and we can be flexible with what labels are exported
by the "dtf" file.


If that all sounds reasonable, I'll get working on it right away.

-Doug
