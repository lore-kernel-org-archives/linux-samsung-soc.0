Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A47B32B985
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 16:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762964240; cv=none; b=KyjfmonIzbi+wrKzV0mSkC1XnvGkQdIyBAOrHLZfYbqlck0fxEaO/24VqbK0+h6PWRDTNVB8jjHDSq0KzeqXMRDNjJ1QKu2lOBIW0G3duRyPupAK6vlK0cGy2yBl1fxQQFlf0lavAaEPA4S8E/FXttTC4XMDy8+OHolNxeLprso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762964240; c=relaxed/simple;
	bh=thLeYsmvUb/JgavOrdcC/1uELN8ZrLnaCGB0hQzFcLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bD01yYdupn9RFDdOh+cinfXyooc3FPTiXcTwNTr1si6mZ1PMSs6z66AoGso1fs5YTi2A2yQRfRyI8OMSlwVWkoBi6tIJUZTnrQXxZ57BT4y/KLhHWnSwdkMn63OUL41v87mkuocvyOC0ew+pW4FyCprJbVrALt1CoQ/3ayNYcpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pVU8gTQ1; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pVU8gTQ1"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3e0f19a38d0so615084fac.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 08:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762964237; x=1763569037; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8VMCABcDQg3bj1MpLgUPb6hZG0b0uHbN8RDXsa01+ho=;
        b=pVU8gTQ1772fztDyH2UbsxuA1//phf7Xrj4lEoSuGPQnmB7fPDCawyCA9yRiDVhEx3
         E5OQwn7B1QvvT6KtdM6cUU62OP0jSWuJd/aE2o4Hdq0ic0XojUXfcQW2wqlhPU1uV//C
         sed6Ugoqio6+pBZI+5Mp0pQ8AKalhVV4ymAXD+xVhgQ8klL3pYQiWcKggYvOrctfK1Gg
         sVGdtA89ITajjH/FR9Kp8SmCUTWVVk5MzE3azza3+ziCQiBCZM58JhacOY1mMREg1OCO
         Y+Uv9iscC/0oRlPj9cVs+NmQ/TvTgJukiqTlVU8u/b3Q1+4GaMmzqKieMUNIiLzDl1nP
         xs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762964237; x=1763569037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VMCABcDQg3bj1MpLgUPb6hZG0b0uHbN8RDXsa01+ho=;
        b=ah01aM9Z3CwFnja1CI9YEwRXm51RuKbNK0f06chH/xaQP8O/HO1FhFHpEwhn2nK0b8
         yqNj9vACvPLxhYDq50hHXIIU5rSuWmn85N1FAw+BwK8CWN75XSbwlEupyECT2H6xxOXo
         zJLfOLZiVdTWhbtMmVIy+f6SYibJqxAgg11m0J5ilzi9r+Sbur+kjnOMm6WzNm6gzswS
         9m28T5KAnrVXl+nSazKsX8hI1x3LdqOMZzdOk7GMIS4/eqMFNGAdbaka/9bPc7d6jFRn
         ht9+nwx3wE3ceEKS5ktoYx50t/NBW5pfbM1+3vmwHf7zuolGzUuwU76EeIPc1YB5wa7N
         wbRg==
X-Forwarded-Encrypted: i=1; AJvYcCXAmvTY8zN3pBebmUDmCS7K4GlE49u5AftzkUXVM8pZSv4P6sKWk5KQlo7oyIx0FvQCPSOApkTYOo+CSf7aCGFcgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzS/mMnvUUibe2qDZG+FHfYnUZQU+4aa4aeoLIjn0Mb3cQSP8o
	bMSE317cK2gpnBL21J1w6L/AwVbdT3608jgModLqHyEj9S6BzHgAER51sfcEwCDxpFTDfvjO+Gm
	91YMiF3luzsVPtCcfucDnCnwkkkFZvZVVrEM9Eaa1jA==
X-Gm-Gg: ASbGncu4ZISEz+yUXKNX2M+Ho9nl1CpeMpO+luTwV8sbmNjkhsojlR4kZyVzwaspRwj
	v560lI6ndKIS5mGzI2aYoB2HJkPe7driOhllmfgicHJaRZLNs06tdv1D1quuHuvuyqcg87zuT99
	IkBbmYwxVZ0fTMJXAoLf3fgkpq5vAVNEpZXYX9hRlh5HiGQ0jsz3FNQGqnAFWcJD70SyCqnSEsP
	twYAfqJyXDqSwOeA4paJK8PdsiRhMebUs1ToRDUVdFrjpF2yj4NxeeMsd3kEA==
X-Google-Smtp-Source: AGHT+IEsUM5mecSa8OvDA3eHi3Rt//Ce7dwGX8jwgmu78EO/L2nrGwzBPId/luKJz03aDcGKbnhMLH136z6/UVOOfm4=
X-Received: by 2002:a05:6870:5694:b0:367:6cdd:8c52 with SMTP id
 586e51a60fabf-3e833fe5841mr1730179fac.14.1762964237482; Wed, 12 Nov 2025
 08:17:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-phy-notify-pmstate-v4-0-717d78009d15@linaro.org>
 <20251112-phy-notify-pmstate-v4-1-717d78009d15@linaro.org> <aRSyTst8Vd-Qb2Ha@shell.armlinux.org.uk>
In-Reply-To: <aRSyTst8Vd-Qb2Ha@shell.armlinux.org.uk>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Nov 2025 16:17:06 +0000
X-Gm-Features: AWmQ_bmeUqnv9Axu23X8v5l7CIA0NkBrp9BKset-SthjnPv3fEKplJqCJGUzBUo
Message-ID: <CADrjBPqPUOQThv+KmeYyUhMA1S5HL_F8FwTa_srcZM43P4GzyA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] phy: add new phy_notify_state() api
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	William Mcvicker <willmcvicker@google.com>, Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

Hi Russell,

On Wed, 12 Nov 2025 at 16:14, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Nov 12, 2025 at 04:05:58PM +0000, Peter Griffin wrote:
> > +int phy_notify_state(struct phy *phy, union phy_notify state)
> ...
> > @@ -255,6 +266,7 @@ int phy_reset(struct phy *phy);
> >  int phy_calibrate(struct phy *phy);
> >  int phy_notify_connect(struct phy *phy, int port);
> >  int phy_notify_disconnect(struct phy *phy, int port);
> > +int phy_notify_state(struct phy *phy, union phy_notify state);
> >  static inline int phy_get_bus_width(struct phy *phy)
> >  {
> >       return phy->attrs.bus_width;
> > @@ -412,6 +424,13 @@ static inline int phy_notify_disconnect(struct phy *phy, int index)
> >       return -ENOSYS;
> >  }
> >
> > +static inline int phy_notify_phystate(struct phy *phy, union phy_notify state)
>
> Should this be phy_notify_state() ?

Yes, that's a good point! Let me send a new version fixing that.

Peter
