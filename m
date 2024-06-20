Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C211D175546
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718884438; cv=none; b=d5cl4YYec1KHPeLpMoiGpwGqMixxqYyfJfF8ZlKfArjK6QyhSgWBrLg1PqqNC29D//OeNlEk4Oce4hEN6al6tXs9R3PCeNIzHQgWirwbWfJ6uZoIxw0oBFizsyibly/+/lkrjI2uY0E9zXOn88zy5nvPhiye7UhtEy187OrQR8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718884438; c=relaxed/simple;
	bh=x+qABZ4JfmfGmpZHBp7+niF77ec63+ZO9qrC0sEi3ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ganGkBsJ0apmrkzlRFhgTlN9BG40gCIHw42VwmDg341wWVd3QEGD3Y0PT8oo4ergEy5IEVyJfkS/dN0LAOI0ynNTe62kckVAttk+UrucylXVi4jSVAtBc/ZAEs9ZwyNgUrd/pPeiIgHKWQCw/nLCbIOdLS8ecjokDgruesRVQh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GomE+gFF; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GomE+gFF"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5b97a071c92so312536eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 04:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718884432; x=1719489232; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cjrKq/3Qh8NTVOb/zVT+vutzDEvUB3oaVogbIVhMr70=;
        b=GomE+gFFDiArOQ6PzL6cmvRa9sNcRK+dUWsWl+FnldHpwvHsicv73P3A29jvy+o1u0
         K3VszaSDXKfY9zMfoyAOQidukLCtmrXx1UEey/kEUVI/UfmQPBPIB8lniI3ThArVNXbg
         R2B4Ui+G0ZHiT6KJ2g0adm6Oee922hlnFBqvxbKeQRXt1bX5U8Re39LMUmOGH34YjiDZ
         E5rHSIiXAMVdEuH96GMWiIgiI3cfghPeZvsjLXFvtmClBWQ4MH/pCDBzq8qA3h5GIxRm
         h9SD+41CzwfVDChWHnG/GR88tF7/WHMqT5L1KSV6ltN8zhS7w0mV3HLSpZgOQDUy3aHX
         h1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718884432; x=1719489232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cjrKq/3Qh8NTVOb/zVT+vutzDEvUB3oaVogbIVhMr70=;
        b=JWTrauE8MP1qCwbED+JQCvgiUgJdBKyThtUcTlq/lkcd1ijaCNblBwpiwy1S7U97Jg
         IjHQcbpM4imM4YjJj3QZnPBzib5wB4Rjal1r8HxNH+dvQv9TIFQDOwSMCKWnKrZhkRNV
         d1hwtW7vaFF2ncUUUd+r/lPzbe3xdxZtgRPkxZcBC9lvjJwrTdQ+eyw+tSsw8IOiTGYZ
         VwsHwlXEAx2eqJSVYUr/EMY6lji8QEAHXc93ANUsRN/VZs9YwmomMOLwfGVXdemS86oV
         wPCpBva4hEtAit73hst1YkY9uB+v39LCkFQW0+uXVpb5QKDqRNT5TEcKU3no0R58yGQn
         0s7A==
X-Forwarded-Encrypted: i=1; AJvYcCXYllmMaVW5YN3/KpMbmE54O9dAlYcquR4EcAhUc/9YRGaV2tKeTcO/4kQOYybkFAPfmWkwCjJBGxZe3CgNZFVI0g+1VAMRF9iemw7Qbjp/KhA=
X-Gm-Message-State: AOJu0YzwnR0vB57QrezR1sDtbwrYaNIkRXE+pBHg5R9u+8i7x0FPloj3
	8ZviXGQyakSt7ZR0Qr6RN7NToBMGYY2lkk2412TO7eegTKfG9fMOXXZfJdK51pKJ+IM2LO1Aw3/
	+7q3PB4OgFESW4jG1gN3/YO4jwr9DlnttNxagYA==
X-Google-Smtp-Source: AGHT+IFPx+/U0MCQcAmhqRdoRS/mrygvKBapXgwNhMr/lYOA6Js+H/0uIcES6GdbOZI42Bp3HEwrbbkdplWrAB8inzg=
X-Received: by 2002:a4a:d285:0:b0:5bd:c0a2:c349 with SMTP id
 006d021491bc7-5c1adbeae27mr5662760eaf.4.1718884432634; Thu, 20 Jun 2024
 04:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620112446.1286223-1-peter.griffin@linaro.org>
 <20240620112446.1286223-2-peter.griffin@linaro.org> <73d2002a-9afa-4cfd-b835-6908d64586d6@app.fastmail.com>
In-Reply-To: <73d2002a-9afa-4cfd-b835-6908d64586d6@app.fastmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 20 Jun 2024 12:53:40 +0100
Message-ID: <CADrjBPobNnneOy2EuT9jNtJAxa+Cz-a-Jcy-==LE55PbOo7LMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mfd: syscon: add of_syscon_register_regmap() API
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Saravana Kannan <saravanak@google.com>, William McVicker <willmcvicker@google.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

Thanks for the review feedback.

On Thu, 20 Jun 2024 at 12:40, Arnd Bergmann <arnd@arndb.de> wrote:
>
>
> On Thu, Jun 20, 2024, at 13:24, Peter Griffin wrote:
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> > Changes in v2:
> > - Keep syscon lock held between checking and adding entry (Krzysztof)
>
> Unfortunately you now have a different bug:
>
> > +     /* check if syscon entry already exists */
> > +     spin_lock(&syscon_list_slock);
> > +
> > +     list_for_each_entry(entry, &syscon_list, list)
> > +             if (entry->np == np) {
> > +                     syscon = entry;
> > +                     break;
> > +             }
> > +
> > +     if (syscon) {
> > +             ret = -EEXIST;
> > +             goto err_unlock;
> > +     }
> > +
> > +     syscon = kzalloc(sizeof(*syscon), GFP_KERNEL);
> > +     if (!syscon) {
> > +             ret = -ENOMEM;
> > +             goto err_unlock;
> > +     }
>
> You can't use GFP_KERNEL while holding a spinlock.
>
> I think the correct way to do this is to move the allocation
> before the locked section, and then free it in the failure case.

Thanks for spotting this! I'll update as you suggest in v3.

Peter.
