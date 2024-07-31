Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A821BDC8
	for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Jul 2024 17:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722446597; cv=none; b=QNT/86m9qsyJ4psjIhNY6awiiR64xcOV+2zxNXOh8kG8tHkb0vpQ7OkPjCjMzktbl3dAqpUZrg1pU5/AXZGDKlGu40qGytTYmi7R1j/L3WSNOED3nvIsg/cl4sWl3WkzwSv8HvZXxU24io3UG/etz3xT83A2RzxyFrPa4Qui2HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722446597; c=relaxed/simple;
	bh=rliLcujqKUQr4SgTTWdITrbHqM2ESPn47zIyh16vQts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odpVGyldD/OSlwCEemuZBD2LSnr2XFwnhliQFy3hw4uqugP9UYawi5Zqlj4PnsFOxx1POelTRksN0PMeeLGK85vymTxY+w3BacP1bKhor7Fgww3KLU/xnuY+afD3fOYONBg6FaYiR/Yr/hh5O4NqXUEgKf4ht0OxvdJ2IHCL6UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EErxYLWx; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EErxYLWx"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ff3d5c6e9eso16138745ad.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Jul 2024 10:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722446595; x=1723051395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=imdU30e2wccPrAr9O2SqWQleHTyA9Nk9L5d9nSmR1Ro=;
        b=EErxYLWx0dBc3NNLNVxxHMstUfswwV2OWNEi9DxBpmOArJxGDVgv/VOwtgxORoU51q
         z3i57yjL5mvV8Vkue2qsLMVzJtVytKSJZYdqg3SUUfuMhUzis+fEqWXbwsAX10AF6gWU
         oW59lrZwKQy4ofWiqe2E8SwTwrAcDH2AQ/zOpDuy0xaBz6T/Rtx7Hd6yCUd0lIADLzvX
         AIoN5vER7qbb6oh1ksSpK9INuLv6Yh8GHQ8Jd4zkqSrSZzK2R/veUw9C8vvmFSRjr5nr
         C913tUszOzvjg6lB4SeEtOo72JTqLOD04gA8l4BqkgnZPvXn57WM1p9ds8p4NIb5exXU
         3xYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722446595; x=1723051395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imdU30e2wccPrAr9O2SqWQleHTyA9Nk9L5d9nSmR1Ro=;
        b=GOmkbBvu/xMdiwC+qkNVks3ApAOS1dBmU0uWCcLNCezuEuGummLlJK/tKMWlrbiYLX
         G0ZqzZ/wKT9D7RV8irqyJSaXKXcMwroL9DNaagNjpmsfyWmjDhMotSA0g/HhVRWZsfhl
         dN2JpH6uefv4MMREr9UvfrQu7U5uVg0eHuwjvNPPQEB9f/KgoTbjiGg476lrDnr6uYm7
         sE+5Sgp7GmewXbObXOwNLw+2vZG57h9Ky/BkQuMh77+jepiMspoHdwZBZflQb4vCoQGM
         wZb9PrAdYlvOzGgEc/nfZ4R1oEoA49jfN+EGqSs05Tz63LtDEoWQ6au1Dol1NZIzwEOp
         XmnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpi5RSO/xXmU5V+o/FjAu7gDYWB6TGjLbKlPcyfAhWRQyOeAl3PLHF2/R3UoiOkfJ1MXgBeufmGy4ZPfcyryJwlHpuJwmYaY+mU8qT6Fia0Uo=
X-Gm-Message-State: AOJu0Yx1u/5qjyQpuqJ+h/TOQQk8HD8d3T82Nou6JpHttTqgpTA58dWl
	m7aw0AyvZA2tXa8yAoUQX2m8nftc04KCv8UaRo+c5FsbCYpN4+fW
X-Google-Smtp-Source: AGHT+IEJO/Z5akf/b6Uvx16WDSzqCYk4hatFXjzuyK+dCXvKwKozY4yzNurRSHcVxb2OugV86VqgSg==
X-Received: by 2002:a17:903:32d1:b0:1ff:498b:5832 with SMTP id d9443c01a7336-1ff4ce8585bmr64095ad.9.1722446595002;
        Wed, 31 Jul 2024 10:23:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1da7:72de:e91f:aa85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c8d201sm123007855ad.30.2024.07.31.10.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 10:23:14 -0700 (PDT)
Date: Wed, 31 Jul 2024 10:23:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: mach-crag6410.c staying or going?
Message-ID: <ZqpzAB2x1-C7V4AS@google.com>
References: <ZqmkfEijDcE--F0L@google.com>
 <f71e9bfd-2407-4f16-a94c-d80715777b1b@app.fastmail.com>
 <3aa5c9d9-2b19-4797-964d-97e2dd325f3e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aa5c9d9-2b19-4797-964d-97e2dd325f3e@sirena.org.uk>

On Wed, Jul 31, 2024 at 01:10:25PM +0100, Mark Brown wrote:
> On Wed, Jul 31, 2024 at 02:06:00PM +0200, Arnd Bergmann wrote:
> > On Wed, Jul 31, 2024, at 04:42, Dmitry Torokhov wrote:
> 
> > > I would like to remove platform data suppirt from samsung-keypad driver;
> > > mach-crag6410.c is the only user of samsung_keypad_platdata structure.
> 
> > Unfortunately we are a bit stuck here and there is no good answer
> > for it. I think this board file is holding up more cleanups than
> > any other and I'd love to get rid of it, but Mark is still using
> > the machine, and probably relies on it more than anyone else
> > needs the other board files.
> 
> While I am using the device I don't care at all about the keypad driver,
> I don't use the keypad at all so that could just be removed as far as
> I'm concerned.

Nah, if it is still used I can convert properly, especially if you can
try my patches.

Should the warning about removal after '24 be removed then?

Thanks.

-- 
Dmitry
