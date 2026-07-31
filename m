Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F1536E48C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Jul 2026 21:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785533113; cv=none; b=k/KxKv2Z9KuL2uFgpOQN1Wq0NhKV8QUBSvyLnKOtuuSq5sonwFEFvqeGGfpOiQT0MRI7jnQxL41IEkBHiCESGegAXN9qlqogsicbTOK/zaoxDpYyh5oqOBQbnIOsiXlAOMGrbqYWaXdGyGndW0YOx19ardoqe5c49XmCH1fc5iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785533113; c=relaxed/simple;
	bh=1zaxBmYVK8cE2/bwlVBSFSqNhFysAIWZF9qGc5utEW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lO6bc3mMdAOueeNGT+pxCCD1upAfTfLl+60jkjEIz4HH3oW+mPbR4owoOQ//+DgRtisqOmVrs+2kI1xX6cr0ORrp9UJ/7hHzpSpUmN4zYvkaqyXSfw7PNzGkV2Uv3TNYeDU+9m5yfCzgDq9YuPGgCTkFAPQTfdPWwxhH3fOTsiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HteGhrZD; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HteGhrZD"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7466771f1caso581776137.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Jul 2026 14:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785533111; x=1786137911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WqGuhJc0lvZLrjwGWLKB/fYoo0jzM7wM4K/RxlMWzzA=;
        b=HteGhrZDhgYtDG7Ry5RJkNaKkseDZzFVxtwhwFz8TDroVhTte2kS0Xh7E2ILfofkvj
         sEQt0Jaqsn+pZIj6Lwhr6SR8jTHyYHHJl09RzxgrPT7eWtFCkV0AJTiObmkvW9BbA8eL
         62muN9aEywZC1yO3oIcBlRR7yBlBMvj1IAokM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785533111; x=1786137911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqGuhJc0lvZLrjwGWLKB/fYoo0jzM7wM4K/RxlMWzzA=;
        b=h9nvNm88CXF4ODzy0DyAtwrwVTNJ/eXVGoVT4/Q0ZswHkHvpwtq2eKACFQ4uFF4nNY
         JwtDCOjR3wbIWegO+sAX8IjQfFfdQ4Nyg9+jo7tTxTz/EQgrIYIAoEyriDworz6bgNej
         xatug3FoWm3WhNmH660Zg7aNQQbTaHWVY4jBLYlR/nHl53sn6ihjwWJNLfhiX9/MzVX/
         VGnImDrfbg0NaM05MbTieCpB0Vzu4wjWqQHSvgnfpwwiclgyFfTxCYfuVO0ykB3NzTmD
         1AeS9Wd4B/kcJvQ4z4aLAguG/y3MgTd/BtslKiJyM/TDcPVM7tZuY/dTbbqa3piw0flg
         GWlQ==
X-Forwarded-Encrypted: i=1; AHgh+RojIdWrkcAu6wLZblUse3iv6GyuTF8UPMRvDVm6VIHJHCVooFHLhWEE+TuciI9W6Xvm3I/7La59DyMO9hVKA2+Uvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbmyUCOfg9ad/53NT9UhMonKrIExVs2UByW7Rs8xuKmlmAhuf1
	fvLf53iXRcQKN4TYd3PrQ5ccH/bS7v+GF5WOQW4cnr6KW0XMLPtbivuN7oKKyrIPXKK26hOQASW
	Wq5U=
X-Gm-Gg: AR+sD12zjTKdJAJqdAa3ARuZ4mQzfeQn63CPExorew/ylm9jAtJ7FBtOtJ5+jfzexdH
	P/z8kw1Tp6vizhMm0rA3RMUuYj7Z7Evq0GFlRY8mjJPeFmqEqO3q8D0u1d5co3OMj2n8NnS29Q7
	hOYNFrUvSCU6HKLI2vI2mWFOxdp7dIw/votwCYKQmmtAqj+bknLQh8D7O/RJp6jVQtYtCGP5+pu
	h5LyPbOk8cXnX04VJVv8KkC4rYKmo8rhhB9//d2m9j4eHP9m3irzSYVHmeTqXuIgrJbGD9dW0we
	2eihhjgEGfeopl7IXQfR9Jn5pbwHNl1OMwKCcIJ1VfrzsH31/FQ6LIqqBeZj9prWCa0O9kT2p7J
	IcBPYMvQd6Qn7CBXbtDUzq7y+fpSH/NVpb8d1x5MHFOXf7ojgUeJxmqcleZo2dCLi5s/jZpW3Z8
	vD8oWqaQ1HwSuyzEKZUBPv5xM4G0cSsIj0wdwK615ghkHfIJSc4N9cI90K2WQbatTEbvkXHxsWd
	i/0iET6N33YWB+6wEREBxtxQy+bLZ6mJAe54A==
X-Received: by 2002:a05:6102:c49:b0:737:4cac:52f8 with SMTP id ada2fe7eead31-75b21a66f05mr1597750137.4.1785533111053;
        Fri, 31 Jul 2026 14:25:11 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-977e62034cfsm1591957241.5.2026.07.31.14.25.09
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 14:25:10 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9770fffa5a6so401006241.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Jul 2026 14:25:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrsxPDvuPsGPWKg0KWFBBRqDLO/UW289KtHhEp1jirDFM3/LvbB4xYu9oGTcWqYUK/TjIHF9u6rrZUJyzh6mSiQPA==@vger.kernel.org
X-Received: by 2002:a05:6102:512a:b0:737:783d:1916 with SMTP id
 ada2fe7eead31-75b23356ad6mr1399686137.11.1785533107796; Fri, 31 Jul 2026
 14:25:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org> <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
 <208b12fb-8f6f-4cc4-9517-bc59180aa094@kernel.org> <CAD=FV=XOGjLUF-1qOY=zCYJYq85MzkJ_56WbhraTcyAjU_z+RA@mail.gmail.com>
 <CAD=FV=VtNuF8E3OpV4pAS78-prMpaWgPy=+GtiFaeMVhki8jAA@mail.gmail.com> <CABb+yY05L30Gt9cmF8Hoz2sGwUc1XocZG3vPoKMwEDfRH4tpKg@mail.gmail.com>
In-Reply-To: <CABb+yY05L30Gt9cmF8Hoz2sGwUc1XocZG3vPoKMwEDfRH4tpKg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 Jul 2026 14:24:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XC=rqmRqEvamnA1SvJzx=NPsygHTO0tYrot9AViooP5Q@mail.gmail.com>
X-Gm-Features: AUfX_myXjwKEOJ-vL5onxMR_Vg-RLEVjT2kJyhDho-rEogDtoe-tql5rKnrLXoU
Message-ID: <CAD=FV=XC=rqmRqEvamnA1SvJzx=NPsygHTO0tYrot9AViooP5Q@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 29, 2026 at 6:27=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> Hi,
>   Replying in one place to the two main points of contention ...
>
> 1) Compatible string :-
>    I too think leaving it too generic is a bit bold ... we often think
> it is final but more often it turns out to not be so. But I also don't
> particularly like the idea of naming it after the SoC because
> controller IPs are usually not tied to a SoC. So giving it a
> controller version specific name should be good. I hope we treat all
> controllers as potentially 3rd reusable blocks rather than a part of
> SoC's identity.

Jassi: How strongly do you feel about the above? It seems like
Krzysztof and Rob both feel strongly that any type of generic
compatible string (including a versioned generic name) is not OK. They
seem to strongly believe it should be named after the first SoC that
was upstreamed that contained the IP block.

Will you object if I send a v2 with "google,lga-mailbox-array" as the
compatible string and no generic?

Personally, I don't think this is worth fighting more about, but if
you feel strongly about it then I guess we need to resolve things
between you and the DT maintainers before I can send a v2?


> 2) Single-channel Controllers vs Multi-channel Controller :-
>   Looking at the description of h/w, especially the separate and
> optional register sets and the fact that we are not talking runtime
> ad-hoc links between two endpoints, I lean towards single-channel
> controllers implementation. That seems like tidier dts+code.

Thanks for your opinion. Unless I hear more thoughts on this, I'd be
inclined to send v2 while keeping one node for each single-channel
mailbox.

Jassi: do you want to review anything else in this series before I
send a v2? ...or I can just send a v2 and we can do further review
there. :-)


-Doug
