Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD73D3115B8
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 18:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763059339; cv=none; b=m1+Rx4dat9JfAFWhRuARjga74Q2tWaVoRziqOj5TuuGeZj/ZU5sxN3G0KfCLECCq/8vWRm36sKHNKbc5Oo+l4MNqCjjqHhnZqe7gVU10RfNVkX4z4W5Kg2tFC4w2rPXtaSQXPyKa1moAjGhvzfdt7awb5WmJ4e5eDFeA8cSxgS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763059339; c=relaxed/simple;
	bh=VCK4+5C8NcYq0P9jDNeakspMs/yrMuAbxdcuxCnWLok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJq8oEUu3pp7efITX/4DmVH7qFdisBeyaN+W278LnSgC7F/77pzjeVr3HfAljKBUrG3G3xf1KnUxPYDiIDdnyS1EaPyd+SHJScQZHs441ZCCTQyJPnmqeSHzB1eT6AFSm89koIghfPJPuX/Rfq9dD1jzOpj+EhAvTISHeZ7tDmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bnGkFVTt; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bnGkFVTt"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64165cd689eso3839535a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 10:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763059333; x=1763664133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pXTM/+Sn5ck0pJjBV1Lup/KQT4FwvuZ93IhS694xuE=;
        b=bnGkFVTtCtjkDf5Sylwe87NDeP/ppuTINA2Xml1EmXzZOyndAD8WrAB00c3Fxk87Qt
         xQiGvmeKx8IC55iY6/yfvwcq+vEOmvOsRzflfxLFi5soONEM084KcIEECNN18SAw6vhs
         CS9kGxRCjHP1oDhms0c/hNoSIohfGhCmMrUr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763059333; x=1763664133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/pXTM/+Sn5ck0pJjBV1Lup/KQT4FwvuZ93IhS694xuE=;
        b=MN0KMH34UvtowdBSHqj/b/xWOQV6VFb0K/e2A/hmirI9yMmKoLFIDoaBRm0eOdt96m
         NyO8U8X464Lz5s+ioNI9EDc1cyGb1/SYGR9MsjLZhxHpR+1r3ZFpYKxxVI/zjBYfiZBw
         IAbHlij9Oz5NqQq+y3LedKXZnf/RBufolRa2OMIX3FZ0cjHGnvcxF9IGiJfPSDcy6jo4
         jgCAb5Wa7G9RQMj5j9hi+c7JxfVWGS6l8/5/NZ1X5iGHzqbn4HxcQGjH9TnANOx7/rR5
         25bGB17iv/XYOB72rnihtz/Y+VVWV8gIIF1JW2PjkYMaoX7qquAhKnVFjGW5IgDi7rFO
         4l6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKC7O+s0Sagm1QD6NRqaXzE6ycT37kgzuYsL3aCL5HExTGjnaWaUoDLNVjHLm9SSAq/l4Ye8MW3WDKiAjFYZpQlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIMSZcfLtuyC6Kx1pqSiqhS8sUK5oZ0cwCdRNKu0SqbXpcijDU
	uN33JlETIHBNBjTC5VQg6fSarqS94U/C2pYdINwiAWtiRDJDg8Zfl875Ea1JTAv8ONNHE1uSnLv
	VYo69vbdW
X-Gm-Gg: ASbGncs9vVwF7UeoulDlfymLq77r2p5BO6bJfrEqBAbsj7Gem03b4jIFVfDlRv9wfuL
	vgWV/6XFuk4ac3qewWQTD64Ut74NqL83rilb7D2rJawRGgbHchKvRbMpzrOthpVp7gW8gElX22Y
	FkFeR3qJS+6MO6HAMjX3BumNxsZxCuKfNGBiunwiBMMwNJIN/NdB99uL+KGt1l413X01rsqSzPO
	5VTcLULLNwQHlOYVRVq6U8T30faYQKjL6C1ata6aW+UoG9nImYjVBL/1uRkErkA/VMrWxBbxEED
	s64CjABCNjGnoLEUq9DdYBMaQB+Y3rpK2+/uI/m9J8fDds0A0jdjH4fcNOhguwvgHmZf6v6KrNX
	EL/lcoB4n4ZHGTCEympZRbTuAHpXRqDRudR4bvKwu8e4hHmgtyPPgquw9H6HwuJ/NECcC6dRmIr
	NmzDD6hYf528esvW+/pu9TVpckN3lOjqtyfrHVN56Us7t1ANgr3Dy7/myJCWGW
X-Google-Smtp-Source: AGHT+IGyTtoYKuRKxOkfSfGh+ltxud+u3eA5nAEuH55YWb8UEm4SiW9Kt+A6bTeld3zZlPFxILTiAw==
X-Received: by 2002:a17:907:6d06:b0:b4a:e7c9:84c1 with SMTP id a640c23a62f3a-b7365749f00mr73441266b.7.1763059332793;
        Thu, 13 Nov 2025 10:42:12 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed80f0sm211276866b.66.2025.11.13.10.42.11
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 10:42:11 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4774f41628bso12341685e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 10:42:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVseSRGziJzd+jxN/tpVj4jHJCzS+RzEkRdnrSrqCXAlg8ccIFwz70M0DhKkjEGGnpS+Ollrg56AIlHteemb6jttg==@vger.kernel.org
X-Received: by 2002:a05:600c:c87:b0:475:d91d:28fb with SMTP id
 5b1f17b1804b1-4778bcb36d1mr39940165e9.4.1763059330721; Thu, 13 Nov 2025
 10:42:10 -0800 (PST)
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
 <abb77afe-c285-46ba-88ac-08574bd67712@kernel.org> <CAD=FV=VcAbgv41tjgWQN4i8Wqk6T6uvdpQ261Q_hcKM4AMpGEw@mail.gmail.com>
In-Reply-To: <CAD=FV=VcAbgv41tjgWQN4i8Wqk6T6uvdpQ261Q_hcKM4AMpGEw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Nov 2025 10:41:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X4bV_YdeqymOMb5dphZwW4T4tASJo6hbuCjDMykVtYVg@mail.gmail.com>
X-Gm-Features: AWmQ_bmy1aehQ6uhI85I3Z-_qkNj2-reqpyxguooVv-yaJfHf2TNxdZyFa3FBPw
Message-ID: <CAD=FV=X4bV_YdeqymOMb5dphZwW4T4tASJo6hbuCjDMykVtYVg@mail.gmail.com>
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

On Thu, Nov 13, 2025 at 10:04=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
>
> On Thu, Nov 13, 2025 at 9:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > >>> Yes, the complexity of just "hooking up" the components on an SoC i=
s
> > >>> an order of magnitude harder than a Raspberry Pi, but it's still ju=
st
> > >>> hooking it up to external components. In both cases, we are modelin=
g
> > >>> the core "brains" (the part that contains the processor) as the DTB
> > >>> and everything else just "hooks up" to interfaces.
> > >>
> > >> You mix the topics, so I don't follow. I speak here about bindings -=
 you
> > >> cannot have the that compatible alone, because it is incomplete, jus=
t
> > >> like compatible for "transistor" is not correct in that context. You
> > >> speak what could or could be DTB, different topic.
> > >
> > > A "SoC" is "complete". It has a processor that can run instructions.
> >
> > Then show me executing any piece of software, which is the consumer of
> > the bindings, and runs on the SoC without the rest of the hardware syst=
em.
>
> Show me something that runs on a Raspberry Pi (the models that don't
> have eMMC) that runs without hooking up power and plugging in an SD
> card. :-P
>
>
> > > In any case, maybe we can approach this a different way that I allude=
d
> > > to in one of my other posts. Can we just call the SoC thing something
> > > different and make everyone happy?
> > >
> > > 1. Rename the SoC file to lga-b0.dtf (device tree fragment) and
> > > _REMOVE_ the top-level compatible. Problem solved--we're not adding a
> > > top-level compatible.
> > >
> > > 2. Add a special node at the top level of the "dtf" file describing i=
t
> > > (so someone could figure it's useful for). Like:
> > >
> > > fragment-info {
> > >   compatible =3D "google,soc-id";
> > >   google,product-id =3D <0x5>;
> > >   google,major-rev =3D <0x1>;
> > >   google,minor-rev =3D <0x0>;
> > >   google,package-mode =3D <0x0>;
> > > };
> > >
> > > 3. We can compile the "dtf" file using existing tools into a "dtfb".
> > > This looks just like a "dtb" but has no top-level compatible but
> > > instead has "fragment-info".
> > >
> > > Now we're not violating any spec because we're not adding any
> > > top-level compatible.
> >
> > Didn't you just describe an overlay or DTSI file?
>
> Sure, you can look at it that way. ...and since you're happy with
> "dtsi" files I assume you're happy with my "device tree fragment"
> files, right?
>
> The difference here is:
>
> * A "dtf" file must be able to compile (with dtc) on its own. Contrast
> with a "dtsi" file could rely on labels that are provided by the file
> including it.
>
> * A "dtf" file needs to have "/dts-v1/;" at the top, unlike a "dtsi" file=
.
>
> * Kernel (or other OS) build rules will be happy compiling a "dtf"
> file. This is in contrast with a "dtsi" file.
>
> * A "dtf" file is _intended_ to be compiled and hooked up to an
> overlay. This means it will always be compiled with "-@".
>
> * We can document the requirement that a "dtf" file needs to live
> together with the overlays that it will be combined with to make
> complete device trees. This means that there is no need to set a new
> ABI boundary here and we can be flexible with what labels are exported
> by the "dtf" file.
>
>
> If that all sounds reasonable, I'll get working on it right away.

FWIW, I wasn't terribly happy with the name "fragment" or the "dtf"
suffix but couldn't come up with anything better. ...but then I just
had a realization. Perhaps it would be better to think of this as a
"SoC Tree". Thus:

* .sts: SoC tree source
* .stb: SoC tree binary

...and a "SoC" tree it always intended to be the base for a device tree ove=
rlay.

This also matches with my assertion that really anything with a CPU on
it should be able to act as the base here.

-Doug
