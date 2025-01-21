Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F9D16C850
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 14:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737470824; cv=none; b=VnK4R1Yxv8iz2pxdxapJ0OW0CA/oimblhVzda5LbTjt7gTKOZUZFBHqEa92F/ndeCmIENNZPXKzMg0bbGW6rZc8bHsh8W8FydEuuuGxwJOt/1CVfAq+w0QNsbKrVI6vKv9Y8BTECrzS2AUlwiyv3EMecQAUcKqgbmEnW6ZbRYGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737470824; c=relaxed/simple;
	bh=JfCvWoTbEzO0kpEF22PE1hnnARbvLJyT/vQ54PthHdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FsjOwqpBdvIRzo/QtCFeZpMkN4AfrWR8kedE8ThPQQkOAp83fKgGFVhhlLrcrGcPTIMp1BOKvqxv43RmRSm2DA/kAMqQZ4UAPs5rhCf+x9XOHGpihBf4QyzUlLNdtzPVEydVTUOKlNCgedcozpk7oTnDH4jMxqBaTAnqsXlZpfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IuEWPewm; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IuEWPewm"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3eba583fbe8so1703590b6e.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jan 2025 06:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737470821; x=1738075621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yhhp0mRWZvKHvJLLfnJ0LjeNwmaLDCHbk6JWfbHtLI=;
        b=IuEWPewmSQrlZNuc73cjskf0rmI3u2H5NLj0ztn+PLODJPv4wApCWIWU+njwUuyRwa
         wMNPiDW6GRLYjBzDov8f0h9reAtHm9oDhS/J5jKsC97icN41N+5jp7HhFxYfBRwk0aWq
         mwXRGkEDx1BMCeMUYe4LrvVypN5jkthaSrgHPgiyYjxpi6M/PRxOWQax4DvOPJHoaSjC
         i/lwbkSnlgdChPOwF3U6vOa965uhzvr2zJubxOTv6MVKlnitNLOnwsdWaBthlf3nHjow
         hrcAdIJeMX4TOt1ygnBsF5mttOhY+xpN53X6K9mws5ahGTkBpX7B+d3nzrP4q+uoPJeg
         xlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737470821; x=1738075621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yhhp0mRWZvKHvJLLfnJ0LjeNwmaLDCHbk6JWfbHtLI=;
        b=Jz5RMV6AA7Na3VPG4XGc/zb16PklM8MseD00S0y+Z1I/jQFYaz0X5CHwA9HU4QExzP
         sSHSOjYhGS4IgBYEs1HH4iFKF4J2Xf9uiQOuKpCTI9Te9nA6Tz8mOUvqwXCNRgfd0rYy
         bbfE50O0zFRWCVKs8+NK9zu6xdocR552JxaCy2WDj3XAnEbGZF5KZbDsUZN4cfM6y+Oj
         cTilXVZF631JuA6bzA6bkih+knWX6znysplYzXHrI6KiShdVvSCn4BvjYNx0/e/jlEsu
         N66FFTAYVxmIlKRfOkXi1bPmb81v91weTHfwz8mayjFvtVgtgQ5mbBxcNL4jeyhIIGfa
         ABxw==
X-Forwarded-Encrypted: i=1; AJvYcCVP0BJd/Lxa5qCU5mB+NyCFqq6W4mlLwtjjudaEvnpZZC8YyZlrnxT4iw2Xq5hIj73K5od8PUqrqucZJR+y9h0f6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpkvYDOsR/K7m96H5qjtieaNSicx06uC0MUWhNK72kdEenRIOB
	kxdkPWRbk7KP7ypEJmffSLiPnlMaC1jCDGsD/PFcSy6pz2M5yqY+bMXPlb91Rv19LrjwYqGHL3C
	SRgYu0b6W4BOr4DU2sS9BGqYeYCbIO0Ifga/QLg==
X-Gm-Gg: ASbGnctqOJrSdzGMEdYAenJ57UFwTKH0+VEK9oPSu8Rf5rlnvYCRhDeB+SZfEg3YeZ9
	+Nwe967MmWbzvVyPiEZQAGb0DPg/4UpQtu2938GGsx+EGn/Zfb+4S
X-Google-Smtp-Source: AGHT+IH2CfYbF8hfXPnykYK8fykXtjqZXBYffL/Pjc2tKlK1mKKJ7qDc/3PPOkRKkkj5qhUhL1/Cyh93nu3VEPBCrq8=
X-Received: by 2002:a05:6808:800e:b0:3e6:1ea5:6b30 with SMTP id
 5614622812f47-3f19fcc1560mr8171055b6e.24.1737470821566; Tue, 21 Jan 2025
 06:47:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
 <20250120-pinctrl-fltcon-suspend-v1-2-e77900b2a854@linaro.org> <4ac64a481d80785973d038b9292a05781e70a670.camel@linaro.org>
In-Reply-To: <4ac64a481d80785973d038b9292a05781e70a670.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 21 Jan 2025 14:46:50 +0000
X-Gm-Features: AbW1kvYEUqxUBeGd3VHQBBcdayPXs-zQHZichg4BXm23UKs5sRmwc2OmOQH-Bg8
Message-ID: <CADrjBPox8ZXRPSAsAxbPqoib0dgpgQXQF+5grPguujYjoOiy7g@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, jaewon02.kim@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

Thanks for the review!

On Tue, 21 Jan 2025 at 11:20, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Hi Peter,
>
> On Mon, 2025-01-20 at 22:34 +0000, Peter Griffin wrote:
> > gs101 needs it's own suspend/resume callbacks to use the newly
> > added eint_fltcon_offset for saving & restoring fltcon0 & fltcon1
> > registers. It also differs to previous SoCs in that fltcon1
> > register doesn't always exist for each bank.
> >
> > exynosautov920 also has dedicated logic for using eint_con_offset
> > and eint_mask_offset for saving & restoring it's registers.
> >
> > Refactor the existing platform specific suspend/resume callback
> > so that each SoC variant has their own callback containing the
> > SoC specific logic.
> >
> > Additionally we now call drvdata->suspend() & drvdata->resume()
> > from within the loop that iterates the banks in
> > samsung_pinctrl_suspend() and samsung_pinctrl_resume().
>
> Maybe split this patch in two:
> * first to do the refactoring plus adding exynosautov920_pinctrl_suspend(=
)
>   and exynosautov920_pinctrl_resume()
> * second to add gs101_pinctrl_suspend() / gs101_pinctrl_resume()
>
> This way, it's obvious which part is the bugfix and which part is the
> preparation and I believe it'd be easier to read.

Sure, I will split it into two patches in the next version.

Thanks,

Peter
