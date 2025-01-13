Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1191CAA87;
	Mon, 13 Jan 2025 16:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736787183; cv=none; b=hxtPxMyu49JVS7O548LOSSV6h6qOHOJirCRLYZUOh86NQiO+R8Cbs3c/pK6kETty6a/RAsfwvknR9uJnRltq4oQrivL5+WCLqnK8G42SY5MYMbUEyXAhE+ZI3GyBlM+tsqwpTeZoVJHtbA3BaWnW9FJvz0PgNfZRU1imXij1hY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736787183; c=relaxed/simple;
	bh=KN1E8xjSvwCYCF7pLmvTkPUqcSPh4pz5aVIuZe6jmSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMp18Ta080Y9zd7kVEtCagD49qt5ckzMuw+XzRHsJbGXUdvUMsLcZrrIxrEJ6GUQR5kntgxrX7u6RPfjdP6MNbn0P3i6molrnMlrbzt/XirYHJsq2g7iJFJL/K1K/XoI/yHAL6Kng77apJNNECu8Bilahp9z/WomzEWweseTXwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/Cjzwn4; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/Cjzwn4"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2689e7a941fso1486979fac.3;
        Mon, 13 Jan 2025 08:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736787181; x=1737391981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xyt88DTwvTCEU6IZGu6Ff5eOVi1/kjHctehvZyzlhzk=;
        b=S/Cjzwn40nmZoY6MFLjkN8BkdMm3xV6NYjr9HlQu3mFtr0ATKUEqipr6JpxjheBXCC
         q59XX9WHrYnHvpTjsoRrYTqRlOjBvY3Ux2P9Glk5nEVOI4KllHjbtSV35h+Q/OfpR4T4
         e5srxdVscelz9A3cfIV5VJaAYDWY1mgSsQ61epzb0to8tLUln/raSXPTwrw2WJWwVKeL
         lCgB8v5SS4nEqXG/MpyZBfTfOX8N+ZTsluLE5ZuyOsqInfa4coyF8ZVlMfSFI4mfxE9r
         3b3wmOV1j+wgOQ2+JM2MpfQ2F5hhn6PyvvPo1i3YtwMPlk0eAqrkUaXvtfWHXcOmyV/G
         hHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736787181; x=1737391981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xyt88DTwvTCEU6IZGu6Ff5eOVi1/kjHctehvZyzlhzk=;
        b=lkYZgO50OSvQUxbruA0lQmgvTS1x0+7yyBmkTFV3eYTwZ5vlIQ/43u6KJgK8PKYjGE
         OtafMeF7S6HwXbB99NvMchQvPKLvIFxa6jpHPW9WqZbghqYEdDuyhpPaZnL2k8N/98jT
         tj/BxMlw2E6Fg/3UkCstYEZ4+BifMehR1UMD1DbkbFhc0R5mbYMbh+A8/i4yON4AJn2F
         ueq4DYVH9VASFen+mdMq/9BhkfbaGwIDqbUYjcysUEcqnwnNL2o86SMP7u+o1AG0lwW/
         N+hO9/r1jmpsz4zO2c80EMYWGKP9YycfFjfm9S+hWj3k0g7nC1TS9GWjeWXTLs/KBMNz
         DVTg==
X-Forwarded-Encrypted: i=1; AJvYcCVApCpYUMH1wCPKwfQxX360WOCa6+YICeQvd3wD5lbAUsK7VGHJTi40rLxKCMBYYB+mlkQ2SoNCzp5l0eqp@vger.kernel.org, AJvYcCX4KGE/1MZuWz7JhIfWwGYRGWx7q8ichioEMCilvCn4OXIabwPBWZWiNztxB4Zb3HMNIRRHLsaZwANGSJCjV/9CIx0=@vger.kernel.org, AJvYcCXeyrCa3Hc1ZpIglsbu/l+5wJ2SKYGal1fmCRnZ2WV0l1D3zlQf2VUjc7JadYKu7FOpGHxCHrkVjMtK@vger.kernel.org
X-Gm-Message-State: AOJu0Yye7WDWy6qbBA6DcHo6XON2KgN+S3j5MwJd0g6cpwk/zVO9c+JC
	hb2NNP5cjQ4laO97KwfnwMQUqvbaaixjRox6WodeYe7lOf5TdKusGaDE1ciliaBrxiieOfq0RTe
	tbHbFFkOTkSMkZGRH2SKiiyJSkNM=
X-Gm-Gg: ASbGncsblk+zZf0HuiD1GCzXjGKmFtzsjNm7KrZ9szWmSh0U2iO5650R75dPuMjHvFc
	BWejgeKz3jK7It38n21hvsO9a9N+mlBcyefFbht8=
X-Google-Smtp-Source: AGHT+IE5cxXt5JR2u+4N8NH2RBAsVODsNa5JluDfwkyKK+baKOF8L+HdL9nECoJbbVjINZwSD4iihC1AJMlo6/b1Pu4=
X-Received: by 2002:a05:6870:2a42:b0:29d:c5e8:e424 with SMTP id
 586e51a60fabf-2aa065478eamr12278674fac.9.1736787181336; Mon, 13 Jan 2025
 08:53:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
 <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org> <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
 <eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org> <CABb+yY0AkpqC_P-3cHeuWDu-gJzxCnarsNFNQWk45+tHKrDLmg@mail.gmail.com>
 <4e97b33f-b4a5-4875-a65d-9e25bcc5a46c@linaro.org> <8f21d5f2-5327-488c-878c-a62d85857240@linaro.org>
 <CABb+yY0JMZfwR9xQ8s80Kmg0gE1DRDJ9bHB=eMnw70uw5nBshw@mail.gmail.com> <7dc02926-905e-430d-91f5-e1ad7af7135e@linaro.org>
In-Reply-To: <7dc02926-905e-430d-91f5-e1ad7af7135e@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 13 Jan 2025 10:52:50 -0600
X-Gm-Features: AbW1kvYv4JplEEr5H_7RAD_-cm61d0McdldDJA9WpeTQeMp8PAvtnMQYQCFpZzc
Message-ID: <CABb+yY0k7rWoJ6foQLHqxsvZuAiE1XnopP5cOceFgNocygQhSQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 3:34=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
> On 1/12/25 4:59 PM, Jassi Brar wrote:
>
> >>>>> Then I updated the mailbox core to allow clients to request channel=
s by
> >>>>> passing some args containing channel identifiers to the controllers=
,
> >>>>> that the controllers xlate() using their own method.
> >>>>>
> >>>> This is unnecessary.
> >>>> If you don't pass the doorbell number from DT, each channel populate=
d
> >>>> by the driver is just a s/w construct or a 'virtual' channel. Make u=
se
> >>>> of 'void *data'  in send_data() to specify the doorbell.
> >>>>
> >>> I think this introduces concurrency problems if the channel identifie=
rs
> >>> passed by 'void *data' don't match the virtual channel used for sendi=
ng
> >>> the messages. Do we want to allow this?
> >>>
> >>> Also, if we use 'void *data' to pass channel identifiers, the channel
> >>> checks will have to be made at send_data() time. Thus if passing wron=
g
> >>> channel type for example, the mailbox client will eventually get a
> >>> -ENOBUFS and a "Try increasing MBOX_TX_QUEUE_LEN" message, which I fi=
nd
> >>> misleading.
> >>
> >> Shall I still use 'void *data' to pass channel identifiers through
> >> send_data()? I'd like to respin everything.
> >>
> > Yes, please do.
> >
>
> What shall I do in driver's of_xlate method, always return
> &mbox->chans[0], as bcm2835 does?
>
No, not the first. The first _free_ channel. One way to identify a
free channel is by checking mbox_chan.cl is NULL.

thnx
