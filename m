Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078CA26AF3
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Apr 2025 16:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743524886; cv=none; b=YfK0ftpUEFHYJeSK5S+NTK83R2+VZx+xv75YD40GYw+9m/PR98Fh67+cBn28FAWHTONz2d5OyoZa0IReMoUT+0a2I8k0JFwwbYPyLROuVthpSMNukL31AZoNZeNusIiOar48uqbcGuOAswcLpucG6p7D6XGsIIUDaW+jl+t1uAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743524886; c=relaxed/simple;
	bh=QyvPwe2n7SMJQvY20lH5qrJm2IZrAH6H92ENM40f7x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3jUS0UmtxZfzfsZXKkAWTbjItuibAHZfK/Z0awyPgAhxK7h/CcrtsXkkHU0nJ7ZtYb+2i+MHVv7F6xAqTi8kN2xJDD/FaYBf0skMB77TYwR9uQl0RRtu3sVTjCAgF9+oteTOYY+oJBQ2gUvpOFPf/ru7ZwiwJIU7iRta3u+RUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G/Tl31CL; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G/Tl31CL"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-226185948ffso112420895ad.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Apr 2025 09:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743524884; x=1744129684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sEr9LMvpLbHE893cIqhG/JU8h0Dt2xG4p+araqhsX+g=;
        b=G/Tl31CLaQf9aFz7+CTDTug+UVm1CNVsHhLnpWq57mdwnmnAOORtjDSe5bqeniH/Li
         61CeBh6vIylSUqtFueMX0T1ZzVommA5WRDHoLCxy8wPi+T2+/zeKt1KWsYsWtewxEND5
         56OdweU6OmmQv9R9YLsYJf4FLnq9r9n0dW2RKIU71IFJKiThjMYj48ZvR7mbvapRBK92
         9xAzRBM0YT0dTAtHdOyhC0eGJOd1u/nFOHnSYTauAzEQ3ZFqsGV6pS+rAHLwI+R5Urq5
         1XhMfrcA+nddSbsFs5fBXLKkHvuuLgdieZbPQmt43fMHKg1HaJuKNAwtBCyXHRgoY4Lk
         G9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743524884; x=1744129684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEr9LMvpLbHE893cIqhG/JU8h0Dt2xG4p+araqhsX+g=;
        b=HpM3NXL1QaO6tOtuKYMNtGbhS4Ig+VLzy/EQpZHZ+7GsxlCw96JZfNDbxL/VImAM0z
         TpYap35ZApHB1bGaNGjnaapTOTD41tZbKvsot7vHD+00w6eppZqEgKCn/SvM9X6d4Wxg
         MJRmJbi/So0lHgZWFUbhIy7wdlTLkgTwOVVeNWv3u4jl8WqkcpsoDoiTyvyzc01RjF+f
         ACrhnG7s3IV9TbbbO70exTUsSDIlAH6G1xNb1yhoCSrNTB3W4FR1K7FKJsjv97lNYmXi
         T6iMrxoyEfFLuTTLItbYvpgkX3KJ3xegoIAqZsiwHV5dm0QBDwYkXkCBp06rsgNC3ozZ
         x8lg==
X-Forwarded-Encrypted: i=1; AJvYcCWtLrWedcZqzauhjV2Z5BE63nhc9Y7rAyNM5iHeswLL+sfPljlS7JDtZ9aCWyg5/JfCU8Y9lm8BoacHFvjcsD6fxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBhLi1xtk+gOBEB+D//KV27M2LcHG2ORNfiswc8lOrlG3MBGC1
	l+J51H9HV/w2JnYRiKGFFH83Iaj4B2HwHuVADvMoEM8DyfIysOnJuMf2v8qVgA==
X-Gm-Gg: ASbGncu56AFa37N3F3Jz1FOkmhfzEJH/uznhJproHbc54gBA6+rzffdeZXJaZ9NEKr1
	4oQ+2AKgBjg8Vd1R7yygZtkKjL6ol+BjIU3cpThNhj1kAYn6vWxcUD0OgjZUU6haAItCO+C2b22
	mUp+g644nGRQkPR/1KUZgdKzCmEXeCbGmplbR2SqFrlDI3BDP4CkxYbhfD/N6Fo3S4Yw2jT90Q/
	g86FFnpW7dUvPYGKJav4pHkj6HZSqc5VuMJ3Q0K8fc9fmZQ9Z101Wg0ky7rk+bxTbSWz2QYXtkI
	IzyHmpxSKgxmtDkbFW8yMslXbGO1U4TtpuAwCE2jw1BSeAZZD1hrUDjXb7RJUZvewk8zTgviRU2
	25U43Mocy03zRcMM=
X-Google-Smtp-Source: AGHT+IEyaXPv9oHXzdX7kp5aOc8Pw45evlmKNFGJN69UA0/YokAg60Q/XphIOEUon7k6t8bnNWSYvA==
X-Received: by 2002:a17:902:ea02:b0:224:216e:332f with SMTP id d9443c01a7336-2292f9fc054mr220540675ad.48.1743524883898;
        Tue, 01 Apr 2025 09:28:03 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f7376sm89939395ad.245.2025.04.01.09.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:28:03 -0700 (PDT)
Date: Tue, 1 Apr 2025 09:27:59 -0700
From: William McVicker <willmcvicker@google.com>
To: Rob Herring <robh@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Donghoon Yu <hoony.yu@samsung.com>,
	Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [PATCH v1 5/6] clocksource/drivers/exynos_mct: Add module support
Message-ID: <Z-wUD2GGMRfJwhSu@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <20250331230034.806124-6-willmcvicker@google.com>
 <20250401023001.GA3186122-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401023001.GA3186122-robh@kernel.org>

On 03/31/2025, Rob Herring wrote:
> On Mon, Mar 31, 2025 at 04:00:27PM -0700, Will McVicker wrote:
> > From: Donghoon Yu <hoony.yu@samsung.com>
> > 
> > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > boot (and even after boot) the arch_timer is used as the clocksource and
> > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > source for the arch_timer.
> > 
> > Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > [Original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > ---
> >  drivers/clocksource/Kconfig      |  3 +-
> >  drivers/clocksource/exynos_mct.c | 47 +++++++++++++++++++++++++++-----
> >  2 files changed, 42 insertions(+), 8 deletions(-)
> 
> [...]
> 
> > +#ifdef MODULE
> > +static int exynos4_mct_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *np = pdev->dev.of_node;
> > +
> > +	if (of_machine_is_compatible("samsung,exynos4412-mct"))
> 
> Your root node compatible has "samsung,exynos4412-mct"!?
> 
> In any case, add a data ptr to of_device_id table and then use the match 
> data rather than comparing compatible strings again.

Ah yes, you're right. Thanks for the suggestion! I'll update on v2.

Regards,
Will

[...]
