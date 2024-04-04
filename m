Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A73C1272A3;
	Thu,  4 Apr 2024 13:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712238747; cv=none; b=gP49IoTKajXGWrHYvP/C9pz3S9QPGbZQltkqZd+87tMATlBUGz4Yuilxp8FWx1CYyRNjKGTodTpbGs49MgZYBM1kkJwkJmeijZdeGW9Rk/ED7JNmJmZXNMYtiT9Q79MsTwknK2uq0JYR/vtHhr/MXLQiUD9+1W2DCxxAsLrxFgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712238747; c=relaxed/simple;
	bh=SyaoC9dGTnAAIwvKQL5lKilmQfKt1cUMZ3Uwe9zaSWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/WWR2xCuJkQHH+ZOFKS3zcRwhT5RNtu5PJ1wHG0l/ZAHyeIPV9JyTwvrTpr4tiauuMUnmzrPJAGzzjjwEERVFZypj/nkqFu8sQv1pHiGaPujqaXqJLlu+bbSBrFMScWPdL+F5GCAsn6cXdtEFcXYDDcB6pebKiCrWN5Ytva0CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvJfP5QZ; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvJfP5QZ"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5a9d93ed063so345255eaf.0;
        Thu, 04 Apr 2024 06:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712238745; x=1712843545; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jn4qrU+tBprHqhbcKEnAjUZjtZ7L2LhdcfMRoTh6EAo=;
        b=DvJfP5QZkUfHdb1tUHjTJ2ZgUhjyXE7vf2znYG6ZX1753H1ET7nQ/SpYvZJJDM0xQn
         8hfrn2VKFUZwezaUQieL8pcf/Te0FJJYkUSvmsHlUtOW1eCBu6UQdaV7Mjo67kZud3Nx
         HGxuWJyHin1t52cLJbfxWRgERiQjhj2Mj80IpBJlyn+p0Ek0p3NBMT71yDY73HYVXvGY
         Aqi9XvXBms8NytmwDjelCSS4nJgAv0YkE+0AnLeNgp+ZlhvfR0oqmHU1wS2IGkAhbf2r
         jA6dxyZfN1HwNx3wDwSC/BInI+OqHkAMzpWAbOREJZafUYtvH5STFreFY1Du5Wo1AqW+
         ZSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712238745; x=1712843545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jn4qrU+tBprHqhbcKEnAjUZjtZ7L2LhdcfMRoTh6EAo=;
        b=m2lLdmb917YBLoLe+fDINTLpmSgj1YCfR7j9pBgzuxL9WuCZU2ww6rzf+OtyPBNtO1
         hLcTkwtG7qTKd/eDdEXR9eLaMI0Uoe5O8SWTCfxBtbwgoGHxS4gbtw0Td/txX2nOpmF+
         Ef4shL8hidyl81xL66wBHx+e72jHnqu3Gt3y0+F++E/9VrokaQeNVtWFMOXlC/q7W4l/
         Ds2Af1tzaCEPN67v3oiwai67IHY3R2dYu/mOF5EYZfVGjlzI5mhmpQ34f4vjQyKrIQMz
         Q1Nhq7NHA4ylLbdyi9ron8MTFlnLgMMt01vzQkIIe8ENCmS9AijcSpN3nkKwr3rRBxc0
         rxRw==
X-Forwarded-Encrypted: i=1; AJvYcCXm87J2kWeuyEdVg6y5gObqzZjRV/ZLjQfF9doL2kdDBNn+Wf4AfjV46ZIVNlS/WIsn8LYjpI80VjTv7d/J0Q+9YF6jSHI6Bn9YMRyITCjOgzCS7gkmk3b+VZhMvj3HA5ffRqJjHWbT7CSr3aIIpwQntF4N9Y+e6/j1yORgfyqvrnzB0h5TIOLEWbU=
X-Gm-Message-State: AOJu0YxQbf7TbuhV7WWUcUXWdPr0/wMW1zNJi6rDzvfwb1bNzUbNpO0n
	+k9bmfaYR/UZ5bOgmqlh2+AOBQSBC0ee1O5s2U2PnHt66r5HYYtZRivuNWRJT9MMt1SWIRw8d7i
	c7DTijCgFXrVHF2J91WlWLyXXmXk=
X-Google-Smtp-Source: AGHT+IFWQpzRCjm7/583y1xcVxsmai/Zw151/uyWqhl68ZTJzk8QXI/NJYa2aT2TnSuca/lXGucPFQgiQc6pJzWxQSA=
X-Received: by 2002:a05:6820:2614:b0:5a4:5526:1740 with SMTP id
 cy20-20020a056820261400b005a455261740mr1164843oob.2.1712238744855; Thu, 04
 Apr 2024 06:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404071350.4242-1-linux.amoon@gmail.com> <20240404071350.4242-2-linux.amoon@gmail.com>
 <2024040442-subscript-detective-8d12@gregkh>
In-Reply-To: <2024040442-subscript-detective-8d12@gregkh>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 4 Apr 2024 19:22:08 +0530
Message-ID: <CANAwSgTpvrUY_H4Q4TzZWF+z-B=rGM1ny9B-pgSZ3dKCn-mXrA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] usb: ehci-exynos: Use devm_clk_get_enabled() helpers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Johan Hovold <johan@kernel.org>, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Thu, 4 Apr 2024 at 18:30, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Apr 04, 2024 at 12:43:17PM +0530, Anand Moon wrote:
> > The devm_clk_get_enabled() helpers:
> >     - call devm_clk_get()
> >     - call clk_prepare_enable() and register what is needed in order to
> >      call clk_disable_unprepare() when needed, as a managed resource.
> >
> > This simplifies the code and avoids the calls to clk_disable_unprepare().
> >
> > While at it, use dev_err_probe consistently, and use its return value
> > to return the error code.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > V2: drop the clk_disable_unprepare in suspend/resume functions
> >     fix the usb_put_hcd return before the devm_clk_get_enabled
> > ---
> >  drivers/usb/host/ehci-exynos.c | 19 +++++--------------
> >  1 file changed, 5 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> > index f644b131cc0b..f00bfd0b13dc 100644
> > --- a/drivers/usb/host/ehci-exynos.c
> > +++ b/drivers/usb/host/ehci-exynos.c
> > @@ -159,20 +159,15 @@ static int exynos_ehci_probe(struct platform_device *pdev)
> >
> >       err = exynos_ehci_get_phy(&pdev->dev, exynos_ehci);
> >       if (err)
> > -             goto fail_clk;
> > -
> > -     exynos_ehci->clk = devm_clk_get(&pdev->dev, "usbhost");
> > +             goto fail_io;
> >
> > +     exynos_ehci->clk = devm_clk_get_enabled(&pdev->dev, "usbhost");
> >       if (IS_ERR(exynos_ehci->clk)) {
> > -             dev_err(&pdev->dev, "Failed to get usbhost clock\n");
> > -             err = PTR_ERR(exynos_ehci->clk);
> > -             goto fail_clk;
> > +             usb_put_hcd(hcd);
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(exynos_ehci->clk),
> > +                               "Failed to get usbhost clock\n");
>
> Why is this logic changed?
>
> If you want to call dev_err_probe(), that's great, but do NOT mix it up
> with a commit that does something totally different.
>
> When you say something like "while at it" in a changelog text, that is a
> HUGE hint that it needs to be a separate commit.  Because of that reason
> alone, I can't take these, you know better :(
>
> thanks,
>

Ok, I will improve the commit message relevant to the code changes.

> greg k-h

Thanks
-Anand
