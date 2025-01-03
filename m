Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D148A17FE;
	Fri,  3 Jan 2025 03:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735875558; cv=none; b=s9uJ5HVk6Ut0tLh7R+zHiOMP5dd5DlPBNPKbgkeCF8lep5Qj6MHyRYQ5yy1br9s8yKFSyek+H6ah9Tg+nu8nputgCdCCUkqIKv0cdEeNHTGwdq9+X0k8h3vC0lT1jM/4EMxIaqi6tsZZ/8BdutaAJiR4oUM/8WSk0K3iEZZjMS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735875558; c=relaxed/simple;
	bh=VHn62V7zetOSceH+i+m60C1sUxxhCIAFsdqDtKpzozI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehY5CCX8mKCF6OFMwzd03vnxoJNQUxr1FXRWomM1/qkdohiV9nW6XpV+w33h9I9iVgUzXxxkgnkOMYEGZST422gFQrmgmout4RVZuVU0UEcMGHNEQ5RRfZNsonA2D3SwN6L9Z8nY0gHNv+f6WJXba6vJDmGBU/jbdBHtiM7RRQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=joXG8yyo; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joXG8yyo"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-29fe7ff65e6so4382760fac.0;
        Thu, 02 Jan 2025 19:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735875556; x=1736480356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWwXRg1VmAks2w4R97EeyIv6mOzZzD/tfl3wr1RNSkc=;
        b=joXG8yyoX6Rmv0wi3WGqfbbYAt4pO28kWhQnewI95eqkJdC62lMXuXy8wOVWYRTFXG
         HqpPxv+/Bfp0g1WUZkVKrh2PK8+D0VoYzUMZWmEWV8+Debhgd45qLZTZ0a1D707/9pSz
         Sx218EA9hJRWK/2oiWXAzzPRGoUQUOss791/KKwoWGoXnzcLDA/Pl5oDvleIN2Zi8Ee6
         8c1fjDCqJcMt9MoB2gzQu9m90OhIZNKVSfBXuPsTJeWKcHUxeFti1lhVxCzassP+yjBv
         bcMSbVOKF0BtV3HUhZ1E7fvkJuSv1B+t8bGU/zSu8brNC1rOdhM7X57/Yim+cnxYqV7n
         e8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735875556; x=1736480356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWwXRg1VmAks2w4R97EeyIv6mOzZzD/tfl3wr1RNSkc=;
        b=WdwRpeuBzUE23b834ZFtrd5vRt8Ndu756z5jP669WCQZ+CoIp3mvdXHthrPdpuBvn7
         ppY0W7HK2gjzdquFucRqZN2Oi3yRHuHuC3CqOORfkffTON4uNQCHzb8ySTmiys0FWJoG
         LJFA9kqWWieAW3xJMhtROnvdGkCVRNMRyX9K2QK/Bz1zaZACxUkfVfadEI2rU+ZVPBpl
         X1h7nSyqYlXUtTdyMp7To1sib+4frGbXjoK5qpIQNQLf3Ox1cyPgopEIfx9HiG5XZviD
         jp4l+gEoebp+QylXh2/xRQ9zs4AAasSSDESqT0vxPaJPrXDHda0c5E+3z8NVX8bMVxd9
         Xgpg==
X-Forwarded-Encrypted: i=1; AJvYcCUFWVqNnMsYtSHwEthxiowgTqeLZHZcokAzCwDy/Ku9FGx6QJBFmV/Mdt99ThmnXRIgXzVuIIY45v/ZrAmI@vger.kernel.org, AJvYcCUXd4MxeCB73/aSGqDma6HtQrR00f5nubwfnNYLAeKZDTdniydD9xM8iEEOle7Q5xHvmW0M0xcdx4wMwCB2fSHSS90=@vger.kernel.org, AJvYcCWmFFsJEntLyNrroyDuxN38NWcgpenaGC6aLyUQXQlbVICx5v+1nC4JDRMZLi+Ji3f13zmPNNHW7PFZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwP3cOZiQXSjK5xmIAJH+npZaXibmFPHRJI1ogHX9wQKZmTZATT
	JGD/OqPufBkLd0wcrk3t1uKO3wieR0+RS0/wLMITPuCLlyySJPyMfAa9g4Rs17i5bfjztcDgpUG
	HdX3TN/yCd9e3/gSAGXV/hMMs/NE=
X-Gm-Gg: ASbGncsqxLC273ZLM/AP6uZIRGn1AZZGbKgOfXknaxYxAE27xYNWLMM272BwAPVmabu
	BDr6n6zrHoIjHTPl7qbhhJ+aJvXKzf30GdVNZcgE=
X-Google-Smtp-Source: AGHT+IHM1WCCKkxCeYI87hg9rwTax0tUBhbUiByr3hkQB9kRpKdWUFzlO6HSwMJZ0R/M6soUxC9LGmKn4xDFLQOUr50=
X-Received: by 2002:a05:6871:522b:b0:29e:40f8:ad9b with SMTP id
 586e51a60fabf-2a7fb0bfc5emr24896900fac.14.1735875555689; Thu, 02 Jan 2025
 19:39:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
 <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org> <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
 <eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org>
In-Reply-To: <eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 2 Jan 2025 21:39:04 -0600
Message-ID: <CABb+yY0AkpqC_P-3cHeuWDu-gJzxCnarsNFNQWk45+tHKrDLmg@mail.gmail.com>
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

On Sat, Dec 21, 2024 at 12:45=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linar=
o.org> wrote:
>
> Hi, Jassi,
>
> Thanks for the review!
>
> On 12/21/24 2:19 AM, Jassi Brar wrote:
> > On Thu, Dec 19, 2024 at 4:51=E2=80=AFAM Tudor Ambarus <tudor.ambarus@li=
naro.org> wrote:
> >>
> >> Hi, Krzysztof, Jassi,
> >>
> >> On 12/17/24 9:40 AM, Tudor Ambarus wrote:
> >>
> >>> diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-m=
box.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
> >>
> >> cut
> >>
> >>> +
> >>> +  '#mbox-cells':
> >>> +    description: |
> >>> +      <&phandle type channel>
> >>> +      phandle : label name of controller.
> >>> +      type    : channel type, doorbell or data-transfer.
> >>> +      channel : channel number.
> >>> +
> >>> +      Here is how a client can reference them:
> >>> +      mboxes =3D <&ap2apm_mailbox DOORBELL 2>;
> >>> +      mboxes =3D <&ap2apm_mailbox DATA 3>;
> >>> +    const: 2
> >>> +
> >>
> >> Revisiting this, I think that for the ACPM interface mailbox client us=
e
> >> case, it would be better to introduce a mbox property where I referenc=
e
> >> just the phandle to the controller:
> >>         mbox =3D <&ap2apm_mailbox>;
> >>
> >> The ACPM interface discovers the mailbox channel IDs at runtime by
> >> parsing SRAM. And all ACPM's channels are of type DOORBELL, thus
> >> specifying the type and channel in DT is redundant.
> >>
> >> It would require to extend a bit the mailbox core to provide a
> >> mbox_request_channel_by_args() method. I already wrote a draft and
> >> tested it.
> >>
> >> Do you find the idea fine?
> >>
> > Looking at v6, I prefer this version... maybe modify it a bit.
>
> Just to summarize for the readers, in the end I chose for the
> controllers to allow #mbox-cells =3D <0>; and for the clients to still us=
e
> the mboxes property, but just to reference the phandle to the controller:
>         mboxes =3D <&ap2apm_mailbox>;
>
This was already supported, see drivers/mailbox/bcm2835-mailbox.c for examp=
le.

> Then I updated the mailbox core to allow clients to request channels by
> passing some args containing channel identifiers to the controllers,
> that the controllers xlate() using their own method.
>
This is unnecessary.
If you don't pass the doorbell number from DT, each channel populated
by the driver is just a s/w construct or a 'virtual' channel. Make use
of 'void *data'  in send_data() to specify the doorbell.

Cheers.
Jassi
