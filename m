Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE79D47793
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jan 2024 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y7q0+JSg"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-67f91d48863so16445336d6.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jan 2024 06:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704723514; x=1705328314; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ezznyb8/vx5+hfZyfj88KqUcvTty4zUAzZJ+hlesbo=;
        b=y7q0+JSglky8dwbo7fPHUAJZrkmcEW3YVv3Rqu0PrY+7plPdrqp/9eTiGoaMVdhvOh
         QL/EjqH84hKdZ7UuRJZztsY+YMjLeiXfj82UpPSJWi1mrdGljvKaC6xu2bZtJaFOEKhP
         kQmoZMqrXAV5COSZOL3cAT0Jb56G1loyJF+6aQyCHpCLH/gJP3E5l9tGeqNZsp2PeDSH
         Xrlii1D0+vn9aXLJ2p3LSp/PncI5p4XoA18K3hNg3Kap3Lvknzz8EYjToXB1XT8jlVC2
         5HJnFSugmbo68qKZjuT7zbYWDNptfuM33oznYKMZlVDWoSV5e+Rl0NSog4G/YYwW2L0v
         8fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704723514; x=1705328314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ezznyb8/vx5+hfZyfj88KqUcvTty4zUAzZJ+hlesbo=;
        b=bRj0UboTI7vEzoWXxsf4kTSBz+JPcMSGxQXnXZygm2SvKiB7CafMplDWthTmw1JF22
         Z+eXwB8zGD2aY4oUi/Xeh3CrX8q3CO5ErRdVdW954v37BYzbT4ZbfiD+QINekYISHU2m
         OHsxyztAEWz91gTVbhO+X1Hap7Hg5qb1Q0sPBL0y7Fz4gMQwZY+aPMZalrfkday3vYtd
         gMJLX1o6mCnSoBPVMOXesdCboTPcuc90PsNmnWnSOToTuxAMk/+eIPvR2/Ub9wyzTpMH
         wdV4p5/uZYBHGJ1Ol+Dq1uKW1a7neBv/P/0GlUfq3rQ2cKAcelwsrNkK6JSNHpnwNICF
         eh/Q==
X-Gm-Message-State: AOJu0Yxoh8VpPogH+7lwsxA4ENjTj06IkGhKMGG11pmuzeu5kXz0O4TE
	KGWrtTT5n/YzBMIPLNUr+tqTc/apYet0LFOHMVRpVRcAdJkb6g==
X-Google-Smtp-Source: AGHT+IGPjgYTxHMolIfwDbJJoI+7GNHNxr913C1/eJoHLVLrZVJqXMfjkqYykrGmoMDgJma1CoSyQSccprDC0VfOBi8=
X-Received: by 2002:a05:6214:29e4:b0:67a:a721:7837 with SMTP id
 jv4-20020a05621429e400b0067aa7217837mr4866809qvb.92.1704723513781; Mon, 08
 Jan 2024 06:18:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228125805.661725-1-tudor.ambarus@linaro.org> <20231228125805.661725-2-tudor.ambarus@linaro.org>
In-Reply-To: <20231228125805.661725-2-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 8 Jan 2024 14:18:21 +0000
Message-ID: <CADrjBPo8tARhHjpBJMABV3dqrd6AqhPVASTK5+3rSmoDA8eStw@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: google,gs101-clock: add
 PERIC0 clock management unit
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, 
	andi.shyti@kernel.org, alim.akhtar@samsung.com, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, arnd@arndb.de, semen.protsenko@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Thu, 28 Dec 2023 at 12:58, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Add dt-schema documentation for the Connectivity Peripheral 0 (PERIC0)
> clock management unit.
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> v2:
> - fix comments as per Sam's suggestion and collect his R-b tag
> - Rob's suggestion of renaming the clock-names to just "bus" and "ip"
>   was not implemented as I felt it affects readability in the driver
>   and consistency with other exynos clock drivers. I will happily update
>   the names in the -rc phase if someone else has a stronger opinion than
>   mine.
>

It would be good to get Krzysztof and Robs view on whether they agree
with the above rationale or whether they would still like to see the
names updated.

Personally I like the consistency, grepability and the fact the
current name encodes whether it is a gate, divider into the name.
Seeing 'sss' or 'ip' as a clock name in the driver code doesn't tell
you a lot without having to then cross reference with the dts.

Is there some rationale and/or benefit behind having the shorter
names? The only thing I could think of is trying to partially re-use
this file on future SoCs like gs201 which might be clocked
differently, but then these exynos clock drivers seem to be SoC
specific anyway.

Anyways apart from that:
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

kind regards,

Peter
