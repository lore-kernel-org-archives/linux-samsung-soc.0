Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021D44D9579
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672222; cv=pass; b=mCNZ0LvKDKN79qCRq6j7YgUVy+03AqhJkIgSd8r/rHFyzwfPWIX8u6q64mWK+0wFn3yQmekFV5AY9vZMs9wKZY0rg8UTrwCfMmaIlmR5ed30cEW1Cv4/s52EqxHpOeiY6YIhAYG+yu13AcZKsTy32Jo4ZUI9T+JaxhSFexYQnIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672222; c=relaxed/simple;
	bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvuvKeIDl/8miTKaIeByorjJ/7UmEX3U7nIGmN/hev4yC4Pc0yX0VOxwffizXj6a51z7qG6tL0Th1dI7EZrJ+jd2c8AP8t8/mF0tf+xrVmPgFhh1dYOT7w2WIDPjktuzpuT1NBRmWYebyKkaJUJEqnYosPeUtoX1+NgcgB9GIqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=egkX0bpL; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="egkX0bpL"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so6281885a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 01:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790672218; cv=none;
        d=google.com; s=arc-20260327;
        b=banGynF4Uo983WR3rc6M9bdvfN6zFnExu9qxrN2UHPvlbQqYllY9EWMYEb3t+vJFKf
         DlSJdW8P2sH+0xXqeZKxy5dgOsBqkm1KfVwNioxoOAi5N6PTfXClT45AbiwqQIarY83W
         hhNHsnJOv+7o7xCeDb3NNdtPzgN3xIbZUIEQ2maP5afGkdJ6muntqllLeGw5MX5kVfOL
         +PUWwC7khXiutmXlfC1vXMvX0x5oC4CtqcgW4jTSf7mfhkSfL8RNfmTS9h2B346MsVkW
         RHIWhs8yTGBrHLKPADPjN6MudFOitQGv07vriQpqqRoTjtF1f41UU45KmVp4yWF+mN0S
         Otqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
        fh=u8bWGEvzt/v2YwCmj7kRAq0JT5SD2u/wftY/ogyUD7E=;
        b=Oxl/FUWoolSIi0JLBnUK6dDFleL3Y0O6Mlv1lYfi0JSeNM4HkxY1KYOOV6wCiGhCi6
         Kc91hexEZf8m4FsY5DZ9skE+zB1NdwUh91CoFrGlfGEXWmKOvdYqTg/NKBetPpPbpNxb
         Bey7CXtGCDyOiieTQPQSoGelJYzKueOPavdvVWjVNad/YzNUrA3/xYgtMTUV69x85333
         YFmjzmAttPIDkcSpivPzIdbKmoAQkgkXoKobFhFH9K6WBvg/g6iZwbE4SBk0NpsKrBjC
         pUSrN5G7a2EZsi60UL04mpdJPw6/8XK3fZhPkBZjTxPAvHUVr+rfgALQq9D+8+oABZ4i
         5JAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790672218; x=1791277018; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
        b=egkX0bpL6rutl34raL6Zr2+yA6+NRhsfdwGss+M1PG3PmWtN5xcj7wyQzmXZM8tOpE
         k3YPGc4I0soEljUWJp/bjCcfLCFwHPHk2tDNe8OI+B6RiY+zCl+94iHDaEtdMq7pOjq1
         FA8AWwOZmBiEGsGzDNSpdggISx9rHbM1/OUdkm2fbzMb6hy4baA0vcmxCboLJrha9BhX
         tbHLJ+AHEr+mPjt3RVqTWMxSKWJoYlz6SpnhUn34zJZFb/XjNTtVk5KfA7ky8NSrWWFx
         rEbcckJMr7quxmO1VpZon0Lx2Q4p8mq2yGPe/E0pVtpsHe7VgUrQsSjXous/G+/5V2b7
         f3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672218; x=1791277018;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bTzNqAl7bOHEFXynD4y2LmlWSn2p5vLqLneAHc7FfuA=;
        b=1KJgFIq0tI5F5mCrJvfQIm46Se0TEcfdMfTCjLkDwQp6MbIuJYY7/QrSI+y/QdGLR2
         ChXxIbFTnotEtECCb0HMVQgBt/iJn+exPYlS7qDfyhuVOXSYbgcQQboqgkTjzwxdpsZY
         6TDxDjO3HaVpOjsy8wKdTUO00M0Fb93raJdbt8MAtJjuBGjn2KuWsmoh0ah5+pGdEx/b
         GmyRD/Zk70lNt87SJbyicaGo4xLYmYM+9GYE/qOly5uWc/7jOV2QcUC0NQoXde98JT3m
         gJeyPHYLG+lWV6hW4LLNebtLkJ4+NjxRwbUbCEcdUxkfR40xVrXfoJSCeofZTAsObI54
         vUOA==
X-Forwarded-Encrypted: i=1; AKwUvBz1XeF78AvOP54aszdiNvuixMr+yFN9WszKsXq6rLZacV68I0bWtyPh6Bkp+KdyXQIl0gFCUxcwnon85rZubFelwg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIKNz0Z3xyoZMI36hoxPxD7u7hstRhih9ydVomHl0aclnI+82Un
	ZGM3+qGoWsteXtpJfKi5QmN+/LDF2amkwVGlqIN9J/vrCc4pJoDfH/aMiRkSmbFG4XFkyYxVdFW
	iBeNiMBNiy+E6krgoiDOy/2NHNTNjhOS3GeRM9/W/Dg==
X-Gm-Gg: AYBFou3f0yg6m2fHA3QYJFpXKr0QUYsOJQh/P2HfYP4hjgWR1KyCQDdFLoUsodJ0M1w
	OHiB97600mA73W+YCU5+aWzAmlWSMLVLv7r/qKi/JC+rAfqp4blQmetgVMhpPX3ewiwLxb6b9CP
	gpPjbJYzuHPy6Abjl9pWCrTjyLsrOsjv0Y9cKH8rySEDaDntV+e8NxQIvdo2KZySXJII3Rvo6ng
	Qnv+lKq3CJiA9RUi1ll6oYt5DPr85CZP2p4kR9zd+v9XaI7yBmclCD7LeCupkJG2omUg7rI0L4e
	TFnfVuyCd3hLKjirID0bImpCmwMAMbywjyWb55r7G80hPoKQKMFgFJqUigcJ+W8RnR/ZPGm++n5
	REAqig+gIOtom
X-Received: by 2002:a05:6402:1951:b0:6aa:f14f:556f with SMTP id
 4fb4d7f45d1cf-6aaf14f5874mr8695635a12.43.1790672217943; Tue, 29 Sep 2026
 01:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <20260918-contrib-pg-pixel10-initial-dts-v4-3-745eaca28b1a@linaro.org> <7553dff6-004a-46a7-88c2-728651366113@kernel.org>
In-Reply-To: <7553dff6-004a-46a7-88c2-728651366113@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 09:56:46 +0100
X-Gm-Features: AclHuK-S5lTQAo2phJ3ee1A6qOipGEmCVgzdBHBpPtrnraavkUJzNtrZ-i9YXbY
Message-ID: <CADrjBPrUr4+oa2jFJw8PkFbO__Ov91Do7A-h8xp3zdePGQcMKg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
	RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-serial@vger.kernel.org, Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzystof,

On Sun, 20 Sept 2026 at 16:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 18/09/2026 21:05, Peter Griffin wrote:
> > From: Douglas Anderson <dianders@chromium.org>
> >
> > Add initial device trees for frankel (Pixel 10), blazer (Pixel 10
> > Pro) and mustang (Pixel 10 Pro XL). These device trees are enough to
> > boot to a serial prompt using an initramfs.
> >
> > Currently only Laguna B0 silicon found in mass production phones is
> > officially supported. Further revisions such as A0 silicon and EVT
> > devices maybe added in the future if they are useful. As of today,
> > these device trees boot fine on EVT devices with A0 silicon.
> >
> > A few things can be noted about these device trees:
>
>
> I actually forgot if you intend me to pick it up. I assume it's not for
> me to pick up, but nevertheless let me know if something is needed from me.

Thanks Krzysztof. If you could take this via your tree for this cycle
that would be much appreciated. I will then look to set up my own SoC
tree moving forward.

Thanks,

Peter
