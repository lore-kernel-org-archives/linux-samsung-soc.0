Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63096BB44
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233916; cv=none; b=L+UgpKPxBK2nSFwbz6SFgnal1iCPLCJQNS99H/AdTnbDToTIhtcnk1/7GT9SElSjxZpK5EIh0AG+Q8ujKZT9/I/AemhkqQyNGZGyP5NZA0I8XKnuBG9MlAM8ykyQIbiXdzzZzW+HL8mJQAzCF2FGjmBNHiZKiuUztmIutUz01wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233916; c=relaxed/simple;
	bh=H6wk5JtpIz8kyYF79iQKtOOqzwCWf/ucdKY+aK2YOBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaCqR7WVhL12O/xdrBYnc5g/DzEdWr+s/fACvMTWAQbd9l6BFvUMicHh9BgvMn7reGansi6JRZxFg0dVr+R8lLx4R99bPVdYvTu9/UyVxutbjGU2cEPqouK8/8LYV2rO47zfrR7ldjxyqwHk7Th3lZ0yydBghBIajcWJlAd0RHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xdSUszCv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xdSUszCv"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a51799456e9so141163266b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2024 05:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233913; x=1712838713; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9zoLoSWqRLLw+G0HC4w9EuQnTh1Ywj5rM+D5vilpHXs=;
        b=xdSUszCvf6L12qw0LBWtDr5F2SDxtp2y6tBeXQjJbhLY7PX/nLLB++4rToALw0WpDK
         AcsVhDnCOyvnPv4hXZTE3e29aatHGkSbWbqCRAGW9b88+hyW6EyXFYelryojGngZGTyV
         ojpv5qcKi8wtimyQmjXhaZgb4q+g3/XAKK1yz5bIrdBSBIRKbMUkdXnBgOUX5RzVwrWf
         NQPqiNmfwY9hpveDczXsLcj5jZacUMM1tqBkoFhZfUYE1FDl0O0Cv07V+irbzmdZ4AQJ
         nE1Zalxzr4XFYjX6CZusU1zfcHU9ekgs3yzO8vQoIPD6lbwgzov7thNnFCBuuYJYMZB7
         9n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233913; x=1712838713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zoLoSWqRLLw+G0HC4w9EuQnTh1Ywj5rM+D5vilpHXs=;
        b=luk1oiytxsm4LCPhgLzuK9GH1kx/mgckV8EdGj3ikQB/OKtXTXr7mN56pRsIUPWXbr
         lU/AZXkNmxrinMqu6WGCyoq6jzaK/Rmlc/kHuR7UwtyzPqUbxCOLIo0lJrNkPxshbhSU
         Oe+kmlW7UBtIaXI6EfjoEMb7uVeSI/WDqnNP3E6CRBU9EQAwNr5BLqN+qr5bP9vcjkpM
         PYi3zNw3BCLkxq9nj05kU3Q+Dtu2IC0OtXZ3bfpJy+PA9YV3oBEQFXxq1UbYk+8ZzXWa
         YG2SU8WJbtrqDChKGpz68IUeWNyD75A1aEz0WzSQEGw3IsJ4rMCeAN8Am2XklDJrhS6W
         Ipjw==
X-Gm-Message-State: AOJu0YyXhNw4SAl0aD29pFGRnB+Qpbh+v3vHVCQSQ6Y+8nJmyeCR2zdc
	2101W7MKVSGsBp6uEBzyJmabht+xR0ojN0c0RySZCeQc6gUPSeubetOc8GTa8dowaAlw/5B4e1R
	0WGqR4TUEWrFKkSKWXptDIhBdKo8zNDrfWs9njOHj4uUxmeDzbwQ=
X-Google-Smtp-Source: AGHT+IGnN55RkS2InA47vPJc47+W85HMUGk7kK8ICI0QUOdA4X0OIj3WORug9wF93/s0LYiAK2taYmjnKYk/yezAKTg=
X-Received: by 2002:a17:906:4719:b0:a4e:2178:d91a with SMTP id
 y25-20020a170906471900b00a4e2178d91amr1794422ejq.59.1712233912997; Thu, 04
 Apr 2024 05:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206034502.GA175333@sol.localdomain> <CADrjBPpw4f-GW+dxQMTP4HEhVjEJ19g=eAsYLdzXzzFkTmcVbA@mail.gmail.com>
 <20240207015234.GD35324@sol.localdomain>
In-Reply-To: <20240207015234.GD35324@sol.localdomain>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 4 Apr 2024 13:31:40 +0100
Message-ID: <CADrjBPrLnowwe+GNLmpRJjMUsCv3pqcadsSAhWQE5KPLfVVcCw@mail.gmail.com>
Subject: Re: UFS storage support for Tensor/GS101?
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

On Wed, 7 Feb 2024 at 01:52, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Hi Peter,
>
> On Tue, Feb 06, 2024 at 05:09:13PM +0000, Peter Griffin wrote:
> > Hi Eric,
> >
> > + Will
> >
> > On Tue, 6 Feb 2024 at 03:45, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > Hi Peter!  Thanks for all the hard work you've been doing on upstreaming support
> > > for Tensor/GS101.  I've tested that the latest upstream kernel is now able to
> > > boot to a serial console on Pixel 6.
> >
> > Thanks for testing :)
> > >
> > > I'm wondering if you have any plans to upstream support for the UFS storage on
> > > that platform?  It should be able to use the already-upstream
> > > drivers/ufs/host/ufs-exynos.c driver, but changes may be required; I'm not sure
> > > how many.  I'm interested in this mainly because I'd like to upstream some
> > > patches related to inline encryption, and that depends on UFS storage working.
> > >
> > > I'm interested in helping with this, but I wanted to check to see if you know
> > > about any existing plans first.
> >
> > We certainly want to add support for UFS upstream, and if you can help
> > out with enabling it that would be great! It would free us up to work
> > on enabling something else in parallel. From a first pass analysis of
> > the downstream UFS code it looks like ufs phy driver likely needs the
> > most attention.
> >
> > The last UFS dependency (that I'm aware of) that is missing currently
> > is clock support for cmu_hsi2 (which I was planning on working on as
> > my next task). Also the UFS phy accesses PMU registers so that will
> > require my exynos-pmu [1] series but that is hopefully close to being
> > merged.
> >
> > So I think we are quite close to having all the UFS dependencies in
> > place. Shall I ping you once I have some code for cmu_hsi2, and
> > hopefully that should be enough for you to start working on the UFS
> > driver and phy?
> >
> > Thanks,
> >
> > Peter
>
> Yes, let me know as soon as you have some code for cmu_hsi2, and I'll try to get
> UFS working.  I don't know how hard it will be, though, so it's possible I'll
> need help from others.

I just posted an initial series that adds the cmu_hsi2 clocks, UFS
controller glue
and UFS phy for GS101 (your on cc). With that series applied, UFS link comes up
and you can mount flash partitions etc.

Hopefully that is enough to unblock you so you can start on the inline
encryption
feature. Let me know how you get on :)

Thanks,

Peter.
