Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F191E0493
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 10:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223017; cv=none; b=TZIf7Gp05AYJC3eyaFoAKjMQbLZO/hOGwnz4UZVFznwl08yqWTNnEUTqfc+d+RwaZcp5/pXWWIEQOn9ERVuSQS+xbJQWEviJsXMrAfm4y6pxY8opcIiEMkmGW3nE4KeVZMvH7d4alxASTF4zZp4vukTy3PjUp3r5Y3Ed7zjE2R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223017; c=relaxed/simple;
	bh=98ftpuMeK4F0QiTziuuOW0dTROC7kMdWNiliS5y9pJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=faO55XHWFQSFqWwH9F2gEzp1kImamSjizQnOVH4iNXrzQZVaMrO/rtnKiBqxI15uJv/es1ToWIYC5MFSKzw8lu2/m/UOab0P27HOPDIzaGzy7haLTDDe5OHY8XQdJbmwYa6bgRjdBz2BkOn+s04EE5zMkwXvICJRXjyeHfefyE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yluj/b15; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yluj/b15"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5f1dc7c6c67so1656101eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 02:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733223014; x=1733827814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWr77EDc2Z7gY3B+yvZy4AgnqNFf+hQfwnlqUX6OkHY=;
        b=yluj/b151KhkBM5Vw7x6LYATjQHvKTXPwmTujGvQAV0heTpWUx6a2zefK1GIwiIURK
         9M5vAnZ4PZTOCJBB0EkmDSr5zzUjCYjO7zz1VGRzZNJjIHOA230n/3qRLgZeSD7G+NDQ
         lvt2oxnCFGTITwdbgKTlDyO7iuUyctBq1IB8R8Kb33Ivc8JHxVJDoq1+0hraiqMLd6jX
         B4JW/Et5vyWmQtrIfeGqkhSWTbZx9+ZPU2hJfRPMfzqY7pbV90Q2eh/I/4irizD7baFm
         Pdjj29oUKfwvTzdnaabol9kb5Y97rGztWw/ftqsQfxRPAugPbvHqkg7XeUPE9eEEX5xs
         fBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733223014; x=1733827814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWr77EDc2Z7gY3B+yvZy4AgnqNFf+hQfwnlqUX6OkHY=;
        b=SC2KZGmdi7vnM2e4wn/v6TblqtO2co8QfLrpWzbBDbhdqwvNuEkef68uORyfOWSpE4
         h03yjwh3rqEiSkowpwCdSJPqZghLRr+W81VAxB57FVSvLv4OckKblDk77JWtERjJsmL2
         5z0eqN/A/zvHB3/MsmGD+dpZ5ULD48kcKJt8ElUGhoPvI5orgWhFk6a+5YcCnYHejzwQ
         bsU2aQW+zHf02uuG71u4B/EoKddDV3qmGRHgqRj+SfyorW4wQb1ZS+Is6imD/Ijq3BYT
         KhpSM5tNudvOVBV56cI/BMUOD+sQcAzSugb/OWAF3MOoBLD8diTYMpyKkDMDKJ8uXPa0
         JMxA==
X-Forwarded-Encrypted: i=1; AJvYcCXTmKH9Dp9XTxKVcd6QhzXLmMg36GPi5gY6TDCKrYbe/t82DYCzZsQe1HqhxnSTqqoUMUgkPLtlgEBJWabfIAIwzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YznJS+CgDi7UtkPL7Ud7qupJ1l9b9r3Uw7XuCu5cPMD8wmWregf
	3jmL+MncawCvKzMVKto/ej5CinOkz+2rPVpaof2IL7jxAoYnlPLboRb939pR6ifYibrXb1V82Tf
	nD5mMxT06iy1v4VcSiFWGDacIHUdWEnxIlk5otg==
X-Gm-Gg: ASbGnctckl5Usj3uLrwFpkTt4v1leaX+JrqLJZkyxrA291IHoplT0TqaUunvzrg58sL
	6m9RdK/rJE+pYbwrYFZHSchjnAC1tEDhhhA==
X-Google-Smtp-Source: AGHT+IF1X9pJalmvVAXH13ENlZykUB4j5mmSDDLGmjaOd4tjIVZTwW8QMjDLXMkDeOEvzXU9CTNWdhqVoZO1TnMeLqo=
X-Received: by 2002:a05:6870:b14b:b0:296:f0be:ebda with SMTP id
 586e51a60fabf-29e8871550fmr2075227fac.19.1733223014149; Tue, 03 Dec 2024
 02:50:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
 <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
 <c377f3302c6c282ad826211c859e2b65bb1222cb.camel@linaro.org>
 <9387c0cf-d291-485a-8cd1-1aced7eba14e@uclouvain.be> <2883fb0dd22312d5da9039d4fef869276a0bd430.camel@linaro.org>
 <bce22ca8-aed2-41ae-b2ef-fdc71266709a@uclouvain.be>
In-Reply-To: <bce22ca8-aed2-41ae-b2ef-fdc71266709a@uclouvain.be>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 3 Dec 2024 10:50:02 +0000
Message-ID: <CADrjBPq2TbP6aZ+9Y1Mg61wPfisnXPsgGjnXJW2724hmox+78w@mail.gmail.com>
Subject: Re: [PATCH 1/4] power: supply: add support for max77759 fuel gauge
To: Thomas Antoine <t.antoine@uclouvain.be>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thanks for your contribution :)

On Tue, 3 Dec 2024 at 10:12, Thomas Antoine <t.antoine@uclouvain.be> wrote:
>
> On 12/3/24 10:31, Andr=C3=A9 Draszik wrote:
> > On Tue, 2024-12-03 at 10:08 +0100, Thomas Antoine wrote:
> >> On 12/3/24 07:47, Andr=C3=A9 Draszik wrote:
> >>>> From: Thomas Antoine <t.antoine@uclouvain.be>
> >>>>
> >>>> The Maxim max77759 fuel gauge has the same interface as the Maxim ma=
x1720x
> >>>> except for the non-volatile memory slave address which is not availa=
ble.
> >>>
> >>> It is not fully compatible, and it also has a lot more registers.
> >>>
> >>> For example, the voltage now is not in register 0xda as this driver a=
ssumes.
> >>> With these changes, POWER_SUPPLY_PROP_VOLTAGE_NOW just reads as 0. 0x=
da
> >>> doesn't exist in max77759
> >>>
> >>> I haven't compared in depth yet, though.
> >>
> >> Is the voltage necessary for the driver? If so, we could just not
> >> read the voltage. If it is necessary, I can try to kook into it and tr=
y
> >> to find in which register it is located (if there is one).
> >
> > Downstream reports it in
> > https://android.googlesource.com/kernel/google-modules/bms/+/refs/heads=
/android-gs-raviole-mainline/max1720x_battery.c#2400
> >
> > so upstream should do, too.
>
> I should have checked before answering. Indeed, I will try to see the
> best way to choose the register based on the chip. From what I see, it
> will also be necessary to change the translation of the reg value to micr=
ovolt
> as downstream does *78125/1000 when it is currently *1250 in mainline:
> https://android.googlesource.com/kernel/google-modules/bms/+/refs/heads/a=
ndroid-gs-raviole-mainline/max1720x_battery.h#49
>
> >>>>  static const char *const max17205_model =3D "MAX17205";
> >>>> +static const char *const max77759_model =3D "MAX77759";
> >>>>
> >>>>  struct max1720x_device_info {
> >>>>       struct regmap *regmap;
> >>>> @@ -54,6 +57,21 @@ struct max1720x_device_info {
> >>>>       int rsense;
> >>>>  };
> >>>>
> >>>> +struct chip_data {
> >>>> +     u16 default_nrsense; /* in regs in 10^-5 */
> >>>> +     u8 has_nvmem;
> >>>> +};
> >>>> +
> >>>> +static const struct chip_data max1720x_data  =3D {
> >>>> +     .default_nrsense =3D 1000,
> >>>> +     .has_nvmem =3D 1,
> >>>> +};
> >>>> +
> >>>> +static const struct chip_data max77759_data =3D {
> >>>> +     .default_nrsense =3D 500,
> >>>> +     .has_nvmem =3D 0,
> >>>> +};
> >>>
> >>> This should be made a required devicetree property instead, at least =
for
> >>> max77759, as it's completely board dependent, 'shunt-resistor-micro-o=
hms'
> >>> is widely used.
> >>>
> >>> I also don't think there should be a default. The driver should just =
fail
> >>> to probe if not specified in DT (for max77759).
> >>
> >> I hesitated to do this but I didn't know what would be better. Will ch=
ange
> >> for v2.
> >
> > Just to clarify, has_nvmem can stay here in the driver, just rsense sho=
uld
> > go into DT is what I mean.
>
> It was clear don't worry. This answer is related to the same subject:
> https://lore.kernel.org/linux-devicetree/20241202-b4-gs101_max77759_fg-v1=
-0-98d2fa7bfe30@uclouvain.be/T/#ma55f41d42bf39be826d6cbf8987138bcc4eb52e3
>
> >>>> +
> >>>>  /*
> >>>>   * Model Gauge M5 Algorithm output register
> >>>>   * Volatile data (must not be cached)
> >>>> @@ -369,6 +387,8 @@ static int max1720x_battery_get_property(struct
> >>>> power_supply *psy,
> >>>>                       val->strval =3D max17201_model;
> >>>>               else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX1720=
5)
> >>>>                       val->strval =3D max17205_model;
> >>>> +             else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX7775=
9)
> >>>> +                     val->strval =3D max77759_model;
> >>>>               else
> >>>
> >>> This is a 16 bit register, and while yes, MAX172XX_DEV_NAME_TYPE_MASK=
 only
> >>> cares about the bottom 4 bits, the register is described as 'Firmware
> >>> Version Information'.
> >>>
> >>> But maybe it's ok to do it like that, at least for now.
> >>
> >> I thought this method would be ok as long as there is no collision on
> >> values. I hesitated to change the model evaluation method based on chi=
p
> >> model, where the max77759 would thus have an hard-coded value and the
> >> max1720x would still evaluate the register value. I did not do it beca=
use
> >> it led to a lot more changes for no difference.
> >
> > Downstream uses the upper bits for max77759:
> > https://android.googlesource.com/kernel/google-modules/bms/+/refs/heads=
/android-gs-raviole-mainline/max_m5.h#135
> >
> > I don't know what the original max17201/5 report in this register
> > for those bits, though. Given for max77759 this register returns
> > the firmware version, I assume the lower bits can change.
>
> Based on this datasheet of the max1720x, the upper bits are the revision
> and the four lower bits are device. So it could change.
> https://www.analog.com/media/en/technical-documentation/data-sheets/MAX17=
201-MAX17215.pdf#MAX17201%20DS.indd%3A.213504%3A15892
>
> If the four lower bits are not always 0 for the max77759 then I guess it
> is necessary to change this as it wouldn't work with all max77759.

The definition of this register for max77759 is

Register name(addr): DevName (0x21)
Rest value: 0x6200
Bitfield: DevName Bits: 15:0 Description: Firmware Version Information

So I don't think you can rely on the bottom bits always being zero

regards,

Peter
