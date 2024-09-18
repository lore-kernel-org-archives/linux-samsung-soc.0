Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CCC1C2441
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Sep 2024 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726671174; cv=none; b=FrH+rsQ6tcdRbcXCAMlDLlNrjXOmsCgGdPRtgghjdUKD3bXheRDoniO/rHocbOKBvwz2dim/41iOb4I4idznNB0NIEkzH20JtTtg16cHzmZ7hDoNlOO+R0/kNf6hptFh6poiygcCjWGXqFgLp7bmSWKDvm+EBwDzo/WcIwQ5IVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726671174; c=relaxed/simple;
	bh=YwYGcA73as0nxEUAf9dOfWfED1MHnlo9lGhvxzvtXr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLB//LrYX5RrHCMOWt6qb/x63GwDFzKJ5+LGxcxmCpe7YUZihC1oM415F3Yxcqgxz0RnyIZgxQjb3cJ10vH7Saiyvdqika4oFHyjoDxnllYcQSkWoa+4LqqOQfQeeB65XtTsEoI10PRipNEww+LTIY5nZQhliU5gJ/Z1b+Pr2sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SyEmCWC0; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SyEmCWC0"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3e039666812so3338191b6e.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Sep 2024 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726671172; x=1727275972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dg5TUigQcGHTM+4Y9DdoFWJ5Q+abMrsddrXpSw+MndU=;
        b=SyEmCWC0ELG+GmRYld21jAfnTlL7h095YJNswQB4tfBXEp+o/C2FJ+RwPwXSzQZ4gq
         Rs8CwMU5A/j049rQ3ufhqZJjoruqEQKd+f0dh+26ynLogcnwRj+fjAK/1PnzuQMeUhao
         izCAw4u1dulO/isiv9QvlivJwW7U8x8w9e3RUa+4ACThvHAGLPlMxcFuXmsBXDmGazzV
         1eQmjUusRsw0MbfOREYPw0B/LjC6XF/xFikAdKXjo6VvCsGLbnW29r0IbJrQA2EDFj1a
         OnSYSof5XW/5IqV+8ieVBOrny4MbNiaDi2cwxspGw3QqibeXcQEn8YEYNTl4l7ixMfvG
         s/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726671172; x=1727275972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dg5TUigQcGHTM+4Y9DdoFWJ5Q+abMrsddrXpSw+MndU=;
        b=MNsq7fKEhAxWQVouMCFwwGhKsMN656OT0HED9G991k+zolm6uicvWeSTieVE8zeD5N
         dpjWwm7rLjgaEu1KYKiWiHHaH94q+/oynS2WZ+RCCDyUP2zzVATQJmMnD3ZznT4Uxibp
         beADkmAfcle1e0cvFpt6ZVYzV5ZgA5cgxW8Xg4UxCxktlIt0FVIS57ceJh9FgIu0rFX2
         qAGs//oVLNZ4fK5917lMmEtKYHvI2IYrfOvDHaBfDvXzqEr2KwcvTCiXIUl/4+2DS5Je
         dYTSfg2EFhbYiUPHx58DQYq33KXtqtqprVMZsvkyUUhkN8TxbkrPT5oOsg3CFc6xt10A
         ommQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc5/WCP2bbrfpDsJoItZM415EfImrf6FJZjk7uvhwIMsn78ab7Ptrvmr+ekL+9LNy2m7h0+MOnCgn96doJQ4je5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YygWT+vSdz0whNYEmYDuEjiNlXtCX+i6YINkcGl/D70gW4HuS8j
	jkeDXmefqxcwI8EVAC62rJO+Q9srC2d0hI9AUv/jHsRIKbJAtTkPf1731xHaMoLRy4him0ThEpD
	Ns1dxu6NU2+m/4G11JU+aMMW143J7scDV1Qs9JQ==
X-Google-Smtp-Source: AGHT+IEER+FXbZLQQX4Gs9msTScTSDVTczlbz0lmxLp0o5NgibVsmppgq8EMmYdtbzgX96TYKhAF6yp4Ywzl9gXi0VQ=
X-Received: by 2002:a05:6808:3a1a:b0:3e0:73b7:36ca with SMTP id
 5614622812f47-3e073b73802mr15662325b6e.40.1726671171845; Wed, 18 Sep 2024
 07:52:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916-max20339-dts-v1-0-2f7ed7c24e83@linaro.org>
 <20240916-max20339-dts-v1-3-2f7ed7c24e83@linaro.org> <CADrjBPoOZu_79OaXaq=5KzUT=eEhRdESwK7Np74Nsjx7cTRm8g@mail.gmail.com>
 <20240917-pentagon-veteran-952cdac50e6c@squawk>
In-Reply-To: <20240917-pentagon-veteran-952cdac50e6c@squawk>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Sep 2024 15:52:40 +0100
Message-ID: <CADrjBPpNpv-xaWri1KuFPN+7BAAu90Ti9t=fVth7_cjXnuj4Jw@mail.gmail.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: add myself for Google Tensor SoC
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Tue, 17 Sept 2024 at 22:19, Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Sep 16, 2024 at 08:42:03PM +0100, Peter Griffin wrote:
> > Hi Andr=C3=A9,
> >
> > On Mon, 16 Sept 2024 at 17:58, Andr=C3=A9 Draszik <andre.draszik@linaro=
.org> wrote:
> > >
> > > Add myself as maintainer for the Google Tensor SoC alongside Peter.
> > >
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > > ---
> > >  MAINTAINERS | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 2cdd7cacec86..b6edb21b4f2d 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -9669,6 +9669,7 @@ T:        git git://git.kernel.org/pub/scm/linu=
x/kernel/git/chrome-platform/linux.git
> > >  F:     drivers/firmware/google/
> > >
> > >  GOOGLE TENSOR SoC SUPPORT
> > > +M:     Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >
> > Please update this to: -
> >
> > +R:     Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >
> > The definition of which is
> >
> > R: Designated *Reviewer*: FullName <address@domain>
> > These reviewers should be CCed on patches.
>
> I find this email really weird. If you discussed something off-list and
> Andre misunderstood that you wanted him as a reviewer not a maintainer,
> that's fine - but you need to explain why to the rest of us.

Apologies for the brevity, it wasn't my intention for it to come
across as weird.

We have a small handful of files here currently, so I don't think it
requires a team of maintainers, it's not particularly high volume.
Having said that, Andre, Tudor and myself usually CC each other on our
patches for gs101 and Pixel 6 so it makes sense for the tooling to
include them as reviewers on patches that may only come to me
otherwise. Other ICs like Maxim 20339 on the board have their own
dedicated MAINTAINERS entry.

Peter.
