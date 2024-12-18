Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7261F0E40;
	Wed, 18 Dec 2024 16:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734541116; cv=none; b=dxd8eZ+r95QuF0UEjDtmM03bmat+VtN11G0hT/cS5H6m48zx8xv0VT9fTJCwwQaD/uy0sW/DBbB5XpOnSBPL999rvo/i/2c6X5nzkkv5WJ7ncaD1v7sUL+KuIpghEFEagqKsKswSDVadrakroFTUxlTbpwLW7BsluYNCY8e2uOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734541116; c=relaxed/simple;
	bh=+N+LpUq64TZzmtBK5R6fW3Dr0MHVHydwIB3XVv653Jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHlMg4GNR6aRsrwTFAsrN1jmf7HdJSn9/yySxhSL1cMq7w5CSUuSgl2hZLS0rL8xRUt3caF1YqVs3fmfy1mLQlBrdHGk/YFjqYuOnnH3aCCODUBYKr5ktndelY3Za8UstJi1VmubZzLEa0OnGf3B5UFGSF8jcixPU6gDj4+MxBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMdhp7Mq; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMdhp7Mq"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5f3397bef34so1170778eaf.0;
        Wed, 18 Dec 2024 08:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734541113; x=1735145913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHxeofl98UpJxEPkYUNcU87+k4nJIUS9VT+0N18/vOs=;
        b=RMdhp7MqWf3aV+W0O0NxIMcZ5y7V3jed4seHbtWZZn5UFiooxyjujK3r8FsRvubCG2
         CdBm7ZiYVkw28WghgH0gjULGV5cQmpm/DR+Y5k1bvoRylMoQUQm26Q++e5pBBCVVnVAX
         Ann8jHArQYYO12Y0ib9Sv5zDHhwWKMiVaVx2sn4O6MtDcRhqTzajpqHZnt6UnoD4v6Wf
         H9Iq1ji5gXAazUjypTtSbSFgrCzcslE4qLvfYJRRuA2ypj6brGFX3AnPBbK8Gn+mPphn
         pbnjA0VOyISPu2AXsU/BSbcjBDjs0aRLUM6gu5STXxbcwXGGwtot22neUffgh1suQaWQ
         dOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734541113; x=1735145913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHxeofl98UpJxEPkYUNcU87+k4nJIUS9VT+0N18/vOs=;
        b=dOgLH4kAdO9c8DndVO/e88/vBWrf1XBE1OLn/463/suQ/iTVs0Og76bKwpw4E4mfI9
         MujUU0TZ88Y/biA+IO/n/z5y9M/G2VDHC3bDF7UB1M2VX9vkfxFlJZ1+ecE17eRFWnXU
         Rhg4mZ+PnN+qm47Jyu/KEBbU1C4Vr5a4Q6NxOdCknsa27/3rxl1CVNEB7t4wgnxNi74S
         Nsdr6iwc9zzobcZltlq6HfryYvs8XFwCrjdK1MaQ/vL/Hda45JPJL6RCBv4pxglTxShD
         ogeLE0n6R039q/qpb5q35Lgt/At5RWeQWCswtrcU9RP6JRFKnKtfEMk5bA3WatlSGJ+a
         ppXw==
X-Forwarded-Encrypted: i=1; AJvYcCUuyyoa/vPf57NC1RW4OfHYhalyqoXb2mY1eTu6MHIAR76xOWJR4zUBnNLChlOpGwi8poJZbtt3t3hjK4A/@vger.kernel.org, AJvYcCVyE/n5EsoHpFdSYfUpNXXggbnJ6EPOiHQF++knEPQ0es/lCXjGVRP8tRKsKXKURft2UW2HF0MjAU5l@vger.kernel.org, AJvYcCXzGXKdynfcSVcAR88hQUn6eVXYw+yQkVjmen+HkVdv9l7eUUqqKqGgVf/b9GQMv/Udxz2aIo1LLxOklny1hXpTUyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW8ePdbmfP3EXK6b9HOxfRTgQFKnKu/q4VHFfVM41aG7Wk5TDz
	IYRJ+BdCZNCjEu458LAqbFPbRGMDkCSJVPacDdRRIBmA1aBI2oG2TmJezlHfX5ZGd2eRnuprehm
	lFEwaARAZ84E7dmjhhQllH5d2XI8=
X-Gm-Gg: ASbGnctwTPTfoSqa7CWJ5Xp68JV4or0qvf/3rY4z7fOW7kD8j/qBo1SHUmj82feO4pF
	V8zirmyno41PfIDzmghqMeK57sxCgzaVvuscx3s0=
X-Google-Smtp-Source: AGHT+IFwpZKhrVSIb2dpXxrrnWJbLQuoyY9JFnJrMzPrGSzl5sIBF6BA/u364X5aMpPKHy+UN0YRV4CS/l9z91ENjAA=
X-Received: by 2002:a05:6870:b4a6:b0:29f:d0bb:618e with SMTP id
 586e51a60fabf-2a7d080b687mr60544fac.25.1734541113322; Wed, 18 Dec 2024
 08:58:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org> <20241217-acpm-v4-upstream-mbox-v5-2-cd1d3951fe84@linaro.org>
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-2-cd1d3951fe84@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 18 Dec 2024 10:58:09 -0600
Message-ID: <CABb+yY1W7HM1pry+wf03HFur3F3YdZwpRjrdtZ6aJtWQ2Ed3wQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] mailbox: add Samsung Exynos driver
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

On Tue, Dec 17, 2024 at 3:40=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
....
> +
> +static int exynos_mbox_chan_index(struct mbox_chan *chan)
> +{
> +       struct mbox_controller *mbox =3D chan->mbox;
> +       int i;
> +
> +       for (i =3D 0; i < mbox->num_chans; i++)
> +               if (chan =3D=3D &mbox->chans[i])
> +                       return i;
> +       return -EINVAL;
> +}
>
Maybe simply return (chan - mbox->chans) ?

Cheers!
