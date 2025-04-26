Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B57B19C54E;
	Sat, 26 Apr 2025 06:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745647920; cv=none; b=K5ADmV8cvM7x8VafsmlqEfho8ObRN1iBgob5ZyDmDD24hm68qlvm7ubSdy8GzpIt+R21Ueoxlaak5jExbt3O/Ys7/I7PuZKoQBzLhbuf0WMDcH9FPLvIHweQxN8jSz4wdkQPwQwiadCN6cj0D+Plb7R0I65jqWVBea2r2cIxWoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745647920; c=relaxed/simple;
	bh=aT+xGUchroXRoD/b0GsZJMVUJdUJhkoUaF5UPPNynWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqpGVUWOuutQz8QVowq2u8AjYfhFLXqv/GRX/1YYbyCjDNOCNTWl4xO04WEut2GudptVhfLd5CWvsWQGy0vQHwbCzpQ6frHAzZ6eTCUozyuM8rWKQ2ztAGqcqqwcyT+XlS4NmdxMlNBz/S1RXbvZKFjebRoyQwZPuM8PCw2tdPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckK6Tm3E; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckK6Tm3E"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f4d28d9fd8so3683126a12.3;
        Fri, 25 Apr 2025 23:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745647917; x=1746252717; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P38FO6+njKGYbNLvlE2BiPsC4uR35LU84o17Ihkf2Ts=;
        b=ckK6Tm3EYnZhsVi23zIgs0il6x3pZNa8oEF22+4SDf65dKzBWlPWY3Di21mGKgWVdN
         BHjFKoRUAL/usqNNAYb7HPveym7e69lXhUi8gPvb1IQRSQEcCFeSm9t8NvrtA76jwZ2L
         0T76G01AWn81m1ycoi2/zNQJ2lm0fSlEmkNUnqR0Hd4WwQOcYcp88Iduj+J5AGI8+KFp
         05tKmMppdC+DuKM8wsIqpZUdDMiszmeauldCZ+akgR3jUJpag1x4ganmCYLAgbySQ+6s
         vxiv9qCIrvLLMX0bTPcwkT4hJlzTr6/b76ENVhDLeoVK3dp+WSauRdOtvj15vUvkHVeM
         O3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745647917; x=1746252717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P38FO6+njKGYbNLvlE2BiPsC4uR35LU84o17Ihkf2Ts=;
        b=wKmZF+DN/2FktAeA5x5lZn8BBzcFNbGWW/p9tWGlTHkKMiPSGHi6hQrBCkEk9YWzi6
         WnTAMKT+VDzIjPgPvG8KvdWbCO3gLoIFTiXyWHFtq84qtd4iIQMaciTkyqAtmQIVuScA
         gIy9oMi24JyUq7KyJapWU5xRIjblB8Fzh8yVwcI8b5mG1e0CJzEc0FndTaJFIXBz38Da
         4RO06KyOfwRyXE6AVi2Tmkq1SShlNv9YvtXztIh6DLytKREMgSJJQGxNkuSRyg9FZMNn
         ya2CgtbwKlRVxPkGePTyKDmiYvV4JS/5xknJ2X36DTNk7QdKL1a6y2XWGtcAsQtH0AmV
         i5Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUQjmbWiQwwgw8dTtlgdMjBppH+YkP7rrCh9zdM8DA79ADWzeRiSWR1t8wGbzTPaoGgFAgHbYoYz6DR@vger.kernel.org, AJvYcCUtTVXAfO3iUuODU9KDBtyJD2VyJ45o+Mlwru9YeUACE1QrcwxfT58QgOkVwPLXetJaZr7oQ+G82tt91/5GtiFnIRU=@vger.kernel.org, AJvYcCXSfM7rx1eG1cw2HkQHA2UzpaTQryH4sDtNVxsDQCq68seUzX9sdgV8S8PhutDn1LHc4C9OLH6GyJEOQwfm@vger.kernel.org, AJvYcCXcfntMSjMFb7KuXNKyvLYJrAio1Cvo+2ZJdXL1SXrTrOV82WxTpCAUQVkRlgWYFrM+PZdPe3vWuGnS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2x48zI88s+VpWxytDzSPMK8JqQLb/dHHxHeL4Wl82zHVPHpO6
	Ds0M+5k4VVTQufLeNWq8JIxn8jvj+PVIYmn06dP4TEpuYWCA3ERsbgXcdY1D4/fAUYh/yz1umXF
	4MyvA1sCzr3D7UuDS6a/brPBqTC0=
X-Gm-Gg: ASbGncvZ9Yf2yw5weGg5YeuDP2Sh0aP9jiXlSJFXeWx33TnM547ES1fA+MpbfhnTU12
	K6trnBBMKdsKGRwnH8hD5yiY7BX+9GBxU6/UseqcaB2GlKtKhe/qA2+Z3eRDfF9irHLB9Ah7Kj4
	JImPRn9qXhfMgs7oUeCdBl
X-Google-Smtp-Source: AGHT+IHU2LAHVM0ylRli8MpkgrQDDetTqppf6CoDV9/WpYVkZ1mZ4e/r3+sZhdqb/QIeFysUMK1woTg4zHQWOMLWRkI=
X-Received: by 2002:a17:907:9483:b0:acb:b5a4:ba35 with SMTP id
 a640c23a62f3a-ace848c047bmr165437266b.2.1745647916581; Fri, 25 Apr 2025
 23:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425132727.5160-1-linux.amoon@gmail.com> <20250425132727.5160-2-linux.amoon@gmail.com>
 <34087c68-442f-41ec-a6c0-dd063f6d44d1@kernel.org>
In-Reply-To: <34087c68-442f-41ec-a6c0-dd063f6d44d1@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 26 Apr 2025 11:41:39 +0530
X-Gm-Features: ATxdqUGVUzKx6XU_cLPV7j0MBc0wnh_fXqMndtXtKNtM0VKtPEyXHniD99OhSmo
Message-ID: <CANAwSgT+ZXacTZJzVbu0DQfYQYUUjMc41jKnn7E_E1wnhY1L6w@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] dt-bindings: clock: Add RTC clock binding for
 Maxim MAX77686
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO..." <linux-kernel@vger.kernel.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Fri, 25 Apr 2025 at 20:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 25/04/2025 15:26, Anand Moon wrote:
> > +
> > +  The MAX77686 contains three 32.768khz crystal clock outputs that can
> > +  be controlled (gated/ungated) over I2C. Clocks are defined as
> > +  preprocessor macros in dt-bindings/clock/maxim,max77686.h.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - max77686-rtc
>
> So you claim RTC is a clock, right? Did not even think that RTC has a
> bit different meaning?
>
> But regardless, this code make no sense and was never tested. It cannot
> work.
>
> It reminds me previous approaches with whatever patches you found in the
> downstream...

Okay, I found the MAX77686A datasheet that Hardkernel shared long
ago and tried to interpret the information in it.
I will remove this repo once this is done.

[0] https://github.com/moonlinux/Samsung_user_manuals/blob/master/MAX77686A%20Datasheet%20REV00.pdf

I have gone through MAX77686A the regulator and the datasheet
If you have some improvements to the code plz suggest so,

>
> Best regards,
> Krzysztof

Thanks
-Anand
