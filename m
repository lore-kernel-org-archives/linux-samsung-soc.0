Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAB3224D4
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2024 08:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718785066; cv=none; b=Pa9iXWyhVSwseZdSHUlzzQCbwcf3F+t8KbBtvvivfc2U0lW6FChmSv1j2g730oRB/5CLi7jZJq8BfuuBW28dekMnm+q+yvaE+gvg0P0Ek+IMaJloAzTI5a+0rM9oSVDCgaHiUmQYD+pbHNtNwpI2Xw/CaJopXw8sAv1erAjQu9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718785066; c=relaxed/simple;
	bh=Kul4ZPewJpKlw42/XRu1y2BrrpjeqmExBHAtC/YfsE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ph+73364ZdJbDQwZaRC9myts2mvojaLGe9niY1VOKbe5F+8attj3H/DbdDlcCbnSqwq2BMdmWlmcipsJz6wTkfgxQyoOlyt6sXQsZR7Ebk+c+KLboaPk12tv2tPKZ2zEWqhQudCvY8ZdO/WB7wPphRrc3f6Mlp0K8Ss5HnyHIgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RZG0LP+/; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RZG0LP+/"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-25ca04d24dfso146164fac.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2024 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718785063; x=1719389863; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sc1RZubOxjRz9khsYbYWs4fb617BxGLfhuFOmPcsviU=;
        b=RZG0LP+/1qy8bPyWmJQtqyVCq57RxlO/EHGqyQjhZQBTaoc+wwV3uiwdB3F7ixE1ng
         n/YUNJmPKR85Bksn1zON8/0IMOrQr8t/wLEJsWDmw5aFPvQODxxxRHbQD/SDXMi+TiKK
         oqFy8hMzsoBY7TpEURbrn69hZbNdDD+uz9zul234C0ZLTpZfxPKXccC/FLz3SUQSTp1a
         pv5qONgsNSHCuTxTRtx5I7mhJ+UfaW6n7hFOd71egfUxRQgzHKU4xjt2PCflrKzl82u+
         ZyM5sUsmtjblS5dlgl/0dL4TS8PkVSdxiq7Q6DyqKLKOjCvTwgnCuFmNCO1IBNKSeSG7
         LJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718785063; x=1719389863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sc1RZubOxjRz9khsYbYWs4fb617BxGLfhuFOmPcsviU=;
        b=wtGvCJ8REEjcJHAUfORtjFooQYiFeG/baOz5mm0uELG1RJmDq3RExoRV5Pr+WTPYC8
         m/gVbkTI8y4nufPe9pLFwXwrUUcvAPW+LuX1aeoEEMaUPLo8tC78Xb/f2ajDJqol9EPH
         JnTWm4+t0INTeEbpYmSseD0r2Abh5Hnhq3WLAgpoRzOG8As9knVl9ap0rDIG5rRXsT2x
         rBrFdRwnpfKhxR6yJTTXXr8hS/MqzRe3++Apzw12rRjIxxWiaPswfevCcN9c9AAQsWkq
         lpPcdn8o1TPl353hgxbLm9k6OvA5kertpPZFcEE2pt1+w0IFplN8xAwP7LvzBKbF5UvZ
         DGaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtsI8J+s1U64C3N2R2ErwbAAfGAPse72E3z4jE3UfTdvhdPsScAGo6YqY61jzSOA4h9ek1/6bmH0k8qbJ33utjRPzfCECZWpIBwkTSNDiHVo0=
X-Gm-Message-State: AOJu0YzJy6k9RUCPW/PbTVuUgeJVLD7QsYi6QUOLoGAwWW6Ai4MbqLBG
	ns6Ul55VMTOMzw8n8O6QlYHZMmKFgDZXcLhDFeXpSVmybHGpFwzqBXadNnNacwOvnTc5pFGT4hc
	GoFzH/Gh+9T0EV5MIoKyFhUBT2LDpzY/173WOUA==
X-Google-Smtp-Source: AGHT+IHu4kdsSjkGyKzbpXZ2TIBj+GIIW/W1efhV7pWpeQ1s1hpYUiOZD98wqs6aYcg0O6aeG24kPa7JH3Xg+GVtW68=
X-Received: by 2002:a05:6870:6114:b0:24f:f282:2411 with SMTP id
 586e51a60fabf-25c94cf4f4emr2088744fac.47.1718785063530; Wed, 19 Jun 2024
 01:17:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240614140421.3172674-1-peter.griffin@linaro.org>
 <20240614140421.3172674-2-peter.griffin@linaro.org> <d904bcd0-62e3-47b0-acb2-0cf864fa33fb@kernel.org>
In-Reply-To: <d904bcd0-62e3-47b0-acb2-0cf864fa33fb@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 19 Jun 2024 09:17:32 +0100
Message-ID: <CADrjBPry4Pqk4cKmEccPQB3qJ0uOZ+C1+f=FdZAtzfW4N9Bvcw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mfd: syscon: add of_syscon_register_regmap() API
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, arnd@arndb.de, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	semen.protsenko@linaro.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your review feedback.

On Wed, 19 Jun 2024 at 07:29, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 14/06/2024 16:04, Peter Griffin wrote:
> > The of_syscon_register_regmap() API allows an externally created regmap
> > to be registered with syscon. This regmap can then be returned to client
> > drivers using the syscon_regmap_lookup_by_phandle() APIs.
> >
> > The API is used by platforms where mmio access to the syscon registers is
> > not possible, and a underlying soc driver like exynos-pmu provides a SoC
> > specific regmap that can issue a SMC or hypervisor call to write the
> > register.
> >
> > This approach keeps the SoC complexities out of syscon, but allows common
> > drivers such as  syscon-poweroff, syscon-reboot and friends that are used
> > by many SoCs already to be re-used.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/mfd/syscon.c       | 48 ++++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/syscon.h |  8 +++++++
> >  2 files changed, 56 insertions(+)
> >
> > diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> > index 7d0e91164cba..44991da3ea23 100644
> > --- a/drivers/mfd/syscon.c
> > +++ b/drivers/mfd/syscon.c
> > @@ -192,6 +192,54 @@ static struct regmap *device_node_get_regmap(struct device_node *np,
> >       return syscon->regmap;
> >  }
> >
> > +/**
> > + * of_syscon_register_regmap() - Register regmap for specified device node
> > + * @np: Device tree node
> > + * @regmap: Pointer to regmap object
> > + *
> > + * Register an externally created regmap object with syscon for the specified
> > + * device tree node. This regmap can then be returned to client drivers using
> > + * the syscon_regmap_lookup_by_phandle() API.
> > + *
> > + * Return: 0 on success, negative error code on failure.
> > + */
> > +int of_syscon_register_regmap(struct device_node *np, struct regmap *regmap)
> > +{
> > +     struct syscon  *entry, *syscon = NULL;
> > +
> > +     if (!np || !regmap)
> > +             return -EINVAL;
> > +
> > +     /* check if syscon entry already exists */
> > +     spin_lock(&syscon_list_slock);
> > +
> > +     list_for_each_entry(entry, &syscon_list, list)
> > +             if (entry->np == np) {
> > +                     syscon = entry;
> > +                     break;
> > +             }
> > +
> > +     spin_unlock(&syscon_list_slock);
> > +
> > +     if (syscon)
> > +             return -EEXIST;
> > +
> > +     syscon = kzalloc(sizeof(*syscon), GFP_KERNEL);
> > +     if (!syscon)
> > +             return -ENOMEM;
> > +
> > +     syscon->regmap = regmap;
> > +     syscon->np = np;
> > +
> > +     /* register the regmap in syscon list */
> > +     spin_lock(&syscon_list_slock);
>
> You still have window between the check for existing syscon and adding
> to the list. This likely is not an issue now, but it might if we have
> more devices using same syscon and we enable asynchronous probing.

Good point, I will update it so that the lock is held throughout for
the check, and also adding it to the list.

Thanks,

Peter.

[..]
