Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13B079F4
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 02:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706235491; cv=none; b=uNKsO3dJibBQvluL46SHNwo5OJKYX9WeFJOSWzkTnojmYfNVfr+ZMlmQgPwC61tqDZM+q+jNN9XI1+vhAkI+cgJP9e8O/5lMtOupKEgPzpVj9b1R4XxUCYoZiTCTohqKf6jT2iR5Vp4+74DQgby6yPrbhHgTjkDBBH5b4vWYb/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706235491; c=relaxed/simple;
	bh=NWgWSc1tbHFCTQWb08E8XCGNA6z9K0AsPcVdKD6/Igs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I0GJ9JMPKUydZ9sOWqRKwTfqVEg/VrkRABWdyvwZGgkCTpVnSbJ/pzF5zXGtQF5CzHxmaZWjp1PdUlkl5o3sde3eQwgXnKhjj1F5t+0Eyx3MDaIp7aVICefamUmkaN8j5MZHABWj2f5asLiZG+kfI4tFQXAIZHDSSzx1dLpCF+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LTMM4X2b; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LTMM4X2b"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-429d2ebdf05so139551cf.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 18:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706235488; x=1706840288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuLzj/hx9VSSEVjlKcWaPA9n/B9+8S455KYeXEEPh8E=;
        b=LTMM4X2b/GZrYtNOkXrQO0pMryyHMNsqftk/tGPfLydJayJLRjbgDJSaJuayHP6R5W
         ykcdoKJE2OBFAh+0Aui2M9icB3oyFc0qnE+a+84RyXTA5tYtgnAN2g5zvRyk5/RndFYF
         hZ+2OjMp5O9I7nEm3zb70pRiKZ8iKwCV/Z7qJNNniUS6saj1Em/obiVrtWzIOteRmjtN
         FeNuSrFDWBoEyTKA5Un1WRx/ogiCmMxm9XqrQni5YU97pepIRxzZMEA/dInW8nCdwME5
         3arPMSWv409N3thRID8mYUMd2AYwqv3/z9AhSMrOGVRRrpzjiL3oXVEO4taL5tY7WcCw
         SJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706235488; x=1706840288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuLzj/hx9VSSEVjlKcWaPA9n/B9+8S455KYeXEEPh8E=;
        b=soLA50MAag9QHyoxEKdKUKIBulqCszsdCGF832ZVjZyRWSRxG1Wxc2b2ZeUmJuGame
         aVYksu9JRISIGjHAWZdkn2a29CY6Ro7QMeOZuNFGrKQqrHg6Kh9dNg8ZpxFvwllKf7B+
         6lWpt6A7d83qST2vW/NmRLCHUotGVc8TK/7REAV+TitGHhOiC+LQYl6tGlJmYUOkkSiV
         45YVuf5/PBHOE5ELw7e3tComZLFTVMfs6ttRdH+C/WL4926ok+lI0eSb8Q7H0CB4XjUv
         g9at+YEF6eS/Tz1fntcGoR4G9jBAMoS9AtXKv28Xm3vztB5S+FOHtMIKElU/1dbrADcR
         zNIg==
X-Gm-Message-State: AOJu0YzlKTE43Bn7rk0FMrREDVPNXvsfstXz1w7kJSyogI0H8rmW42gk
	BNGWlHVmPbw8vZUhiy0YrxpPdSymYrKXb+BoW2X7XTuXZgdxAKdgXpGU4yyqtmGg9m9YGg1HYJp
	O9CyDm7MlFUIMP8tve7ri8R72ohzBUaz9nu2m
X-Google-Smtp-Source: AGHT+IGcJwnmXx8I+WCK6mjvsBsu8cXw8bYsU2px9BMQeHrp8JueHwHVr5VRUi/AS2FDE8OcC1CcyA2PkS+mDrFfOoQ=
X-Received: by 2002:a05:622a:a13:b0:42a:11ed:c1fa with SMTP id
 bv19-20020a05622a0a1300b0042a11edc1famr102360qtb.7.1706235488000; Thu, 25 Jan
 2024 18:18:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122225710.1952066-1-peter.griffin@linaro.org>
 <20240122225710.1952066-4-peter.griffin@linaro.org> <da30a68a-e29f-45c8-aa73-02955255a457@linaro.org>
 <CADrjBPor5tMY4r0jOy7GH36auCU7dWn6Qn4ct89bsSMW4vAQOA@mail.gmail.com>
 <6c72a521-1048-42eb-ac74-d8f718a90723@linaro.org> <CAGETcx-CCpaV7R0O0HpDpoX6KxQBuJiMmKdWA8nDE-5Qj2Sa7g@mail.gmail.com>
 <f4d3aa5a-e01d-4ef3-8004-b6eac4461184@linaro.org> <CAGETcx_HGcuGQTO11tzX0EvnuLEaKYc4vBse1CRP0JwPqMJdQQ@mail.gmail.com>
 <04411aaf-6f2c-4f43-83b4-aa0741ccd25f@linaro.org>
In-Reply-To: <04411aaf-6f2c-4f43-83b4-aa0741ccd25f@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 25 Jan 2024 18:17:29 -0800
Message-ID: <CAGETcx-LtFAWvs6+=1BBP8LVJuBVJxs9+qHSzhdk=Uip_rRAEg@mail.gmail.com>
Subject: Re: [PATCH 3/9] watchdog: s3c2410_wdt: update to use new
 exynos_pmu_*() apis
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, arnd@arndb.de, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux@roeck-us.net, wim@linux-watchdog.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, jaewon02.kim@samsung.com, 
	chanho61.park@samsung.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	willmcvicker@google.com, linux-fsd@tesla.com, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 11:37=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 24/01/2024 22:27, Saravana Kannan wrote:
> > On Tue, Jan 23, 2024 at 10:27=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 24/01/2024 04:37, Saravana Kannan wrote:
> >>> On Tue, Jan 23, 2024 at 10:12=E2=80=AFAM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 23/01/2024 18:30, Peter Griffin wrote:
> >>>>>>>               dev_warn(wdt->dev, "Couldn't get RST_STAT register\=
n");
> >>>>>>>       else if (rst_stat & BIT(wdt->drv_data->rst_stat_bit))
> >>>>>>> @@ -698,14 +699,6 @@ static int s3c2410wdt_probe(struct platform_=
device *pdev)
> >>>>>>>       if (ret)
> >>>>>>>               return ret;
> >>>>>>>
> >>>>>>> -     if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
> >>>>>>> -             wdt->pmureg =3D syscon_regmap_lookup_by_phandle(dev=
->of_node,
> >>>>>>> -                                             "samsung,syscon-pha=
ndle");
> >>>>>>> -             if (IS_ERR(wdt->pmureg))
> >>>>>>> -                     return dev_err_probe(dev, PTR_ERR(wdt->pmur=
eg),
> >>>>>>> -                                          "syscon regmap lookup =
failed.\n");
> >>>>>>
> >>>>>>
> >>>>>> Continuing topic from the binding: I don't see how you handle prob=
e
> >>>>>> deferral, suspend ordering.
> >>>>>
> >>>>> The current implementation is simply relying on exynos-pmu being
> >>>>> postcore_initcall level.
> >>>>>
> >>>>> I was just looking around for any existing Linux APIs that could be=
 a
> >>>>> more robust solution. It looks like
> >>>>>
> >>>>> of_parse_phandle()
> >>>>> and
> >>>>> of_find_device_by_node();
> >>>>>
> >>>>> Are often used to solve this type of probe deferral issue between
> >>>>> devices. Is that what you would recommend using? Or is there someth=
ing
> >>>>> even better?
> >>>>
> >>>> I think you should keep the phandle and then set device link based o=
n
> >>>> of_find_device_by_node(). This would actually improve the code, beca=
use
> >>>> syscon_regmap_lookup_by_phandle() does not create device links.
> >>>
> >>> I kinda agree with this. Just because we no longer use a syscon API t=
o
> >>> find the PMU register address doesn't mean the WDT doesn't depend on
> >>> the PMU.
> >>>
> >>> However, I think we should move to a generic "syscon" property. Then =
I
> >>> can add support for "syscon" property to fw_devlink and then things
> >>> will just work in terms of probe ordering, suspend/resume and also
> >>> showing the dependency in DT even if you don't use the syscon APIs.
> >>>
> >>> Side note 1:
> >>>
> >>> I think we really should officially document a generic syscon DT
> >>> property similar to how we have a generic "clocks" or "dmas" property=
.
> >>> Then we can have a syscon_get_regmap() that's like so:
> >>>
> >>> struct regmap *syscon_get_regmap(struct device *dev)
> >>> {
> >>>         return syscon_regmap_lookup_by_phandle(dev->of_node, "syscon"=
);
> >>> }
> >>>
> >>> Instead of every device defining its own bespoke DT property to do th=
e
> >>> exact same thing. I did a quick "back of the envelope" grep on this
> >>> and I get about 143 unique properties just to get the syscon regmap.
> >>> $ git grep -A1 syscon_regmap_lookup_by_phandle | grep '"' | sed -e
> >>> 's/^[^"]*//' -e 's/"[^"]*$/"/' | sort | uniq | wc -l
> >>> 143
> >>
> >> Sorry, generic "syscon" property won't fly with DT maintainers, becaus=
e
> >> there is no such thing as syscon in any of hardware.
> >
> > Then why do we allow a "syscon" compatible string and nodes? If the
>
> To bind Linux drivers.

My point was that if your statement "there's no such thing as syscon
in any of hardware" is true, then we shouldn't have a syscon node
either because I don't think there's any "syscon" IP block. It's just
a random set of registers grouped together for system control.

>
> > "syscon" property isn't clear enough, we can make it something like
> > gpios and have it be <whatever>-syscon or have syscon-names property
> > if you want to give it a name.
>
> This could work.
>
> > 143 bespoke properties all to say "here are some registers I need to
> > twiddle that's outside my regmap" doesn't seem great.
>
> Why? 143 of these registers are not the same.

You could make the same argument about clocks. None of the "clocks"
listed in DT is the same clock across all devices. But the idea behind
the clocks property is that in DT we are representing that the device
needs clocks and in DT we don't really care how/what it is used for
(the driver deals with that). Similarly "syscon" is a system control
register needed by a device (the why/how is left to the driver).

-Saravana

> >
> >>>
> >>> Side note 2:
> >>>
> >>> How are we making sure that it's the exynos-pmu driver that ends up
> >>> probing the PMU and not the generic syscon driver? Both of these are
> >>> platform drivers. And the exynos PMU device lists both the exynos
> >>> compatible string and the syscon property. Is it purely a link order
> >>> coincidence?
> >>
> >> initcall ordering
> >
> > Both these drivers usr postcore_initcall(). So it's purely because
> > soc/ is listed earlier in drivers/Makefile than mfd/. And as soon as
>
> Oh... great :/.
>
> > drivers are made into modules this is going to break. This is
> > terrible. If you want to have a modular system, this is going to throw
> > in a wrench.
>
> Best regards,
> Krzysztof
>
