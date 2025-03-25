Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B145C25C6FA
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Mar 2025 13:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742908204; cv=none; b=ldYKa/gaUPTJmr4JoMAN2VGEbHK9kw/Bib3JNdGLTTOIK1jWMFnDsHmjjGiotoGHgOupiGEc2l2oAeyVQQI54UuOENQZPqjkph4ptoBvJO2/DlfBFCFHIO8AP6Tx4MO+sf20ie/FWrjl6/KhZcpFj2x5UU3tu6duZL1j6f57pUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742908204; c=relaxed/simple;
	bh=MrQdnqrQ37zkSH+xmL91qGq72ZTsS3ZvH1TLByFafAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VKkw91jN04qA1g81TXYZYr5brzgEfD4jqY+X8ZyHoIFu40429RuNtCLtZ9/EqgZpLBFiHiWaqlSVo2dAphVM5oM3BPPyWnTwrp23GRp3ToLePGBlTJteM62owPoamU7pwlxWEgmu5aNaSFHc4VHlZZgeRFjr2pZs4SoeBjrmBpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wkgL+9dj; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wkgL+9dj"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so6328779e87.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Mar 2025 06:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742908201; x=1743513001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrQdnqrQ37zkSH+xmL91qGq72ZTsS3ZvH1TLByFafAY=;
        b=wkgL+9djV4oUk8AeK2bW9Bpxi9jE88XeNszTTIS0hjfCYy+t95RHuHjmIM7THhnMcB
         w+1ayyJU+LVdBWfs1RKwcmqiTwYDIdyBZuhTI63VvRyAzHYMTh6NkbPsojI3F7r/Mg/6
         Ug8x/ZGu92v1oEmS/eMIM2MFowZoBrKejnFePJ2ZmoARJEn0r22udhvOyYohh3YiSD+E
         cyohYJs6SHZcSP8Ot3tWHSg6aBLs9erDUPtDo4ixv3jOJBHpCXkYGrWldNQDeyFL4fkr
         nu7g8G3wpDImCShJoWYwxdf0W9bZcaOmlxZIfOb2qJYU2AqP3cqUVfH037/UssWpMgfc
         SFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742908201; x=1743513001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrQdnqrQ37zkSH+xmL91qGq72ZTsS3ZvH1TLByFafAY=;
        b=uqgBqvPkAxn2k+SNDNMgbGg3XMkcAFAPHTpivf+RSQvmj6MlUnmuckmYQSiaGI+GN4
         mG3WigCHnLfFcfyAMKxlqDuCybWafHsF8OFVwIujV5aJqOn1QacRu/1ES7tZgRLX4Tzk
         NHTIhFXWdmtP37Le4o17j48mOCrGQV/CBtzKAOzW8gZ0DyrfucTBEnFMCQDcZQWkv7bm
         7xOeZgEXL7h/XEDSI4qTIjv0O/abiFg/cOHEQkP7UoV4cWeVszjcXAy4LDiT9gQeZ+r6
         dpRAIJRGNIpHKPTyVvMlblRUaOv87A5iknrjlZtfr/JRmgQnCIcwOz6s3MTKQ7lOUAQS
         GuOA==
X-Forwarded-Encrypted: i=1; AJvYcCVnwGXu7R6od1+367vTbMvVYN1ay4JVxOoUcGiO1z2QmJ9RIk4iOvhS5qFm9iQ3jcXcAcFOvqFiqBEYUIcVWbTsdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD6kCxgNxo0l/lNf+3x9K8BXZJWeVPELT1uh09sgU3RT7vNLxP
	m0jmIgsLWegN2S6jmd5IGkJ9VGKKvCQFdquKa/PUQUB/GJ07XRE9hRIGLaomBrKe/+laQPb5KRf
	9zb8IEkxb0CzMAIUPlsVj2HY25kcqE/QT/0+yGQ==
X-Gm-Gg: ASbGncuBlYRgU8RIcdn0Sk2KIS2hNYN27QrLVUfJc0eXRY6fgZDm4oMy7Eh0YxiAwYB
	Vzmb2SHB0oz0kJDBKmVxw2uWtIjl8tSlWmVBvdaLcMhVhCt/GwarHj+Onjym9lRPPxhQA4hXmoT
	OAPljPCvkXgs2FJgYVeRI/Wv0=
X-Google-Smtp-Source: AGHT+IEA8eZg1F5rTtYtGgxFGDqJ7eNk3ccgMGnZd3pLrENcTaD8LN6KiUTpuvzO7iXkBw9qPrcSIjiZ+Ib/g7be7BA=
X-Received: by 2002:a05:6512:1314:b0:54a:cbfb:b62e with SMTP id
 2adb3069b0e04-54ad64f6791mr6320883e87.35.1742908200694; Tue, 25 Mar 2025
 06:10:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318052709.1731747-1-peng.fan@oss.nxp.com>
 <Z9lJETLh2y27934q@black.fi.intel.com> <PAXPR04MB8459A44864B9213E8265137188DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <e3abe8cc-357c-471f-b489-e1a8625933e0@kernel.org> <20250324033038.GA9886@nxa18884-linux>
 <7f22be3e-908d-4036-ab92-97c6b0427d26@kernel.org> <PAXPR04MB8459BDF97DAA5FC1A3A8B7AA88A72@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459BDF97DAA5FC1A3A8B7AA88A72@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Mar 2025 14:09:48 +0100
X-Gm-Features: AQ5f1JrTRSKcnNRqr9tDe943HyISqe1Jb1O_0dxGZ5xxZb_T1URcA8bYen_No_M
Message-ID: <CACRpkdYCgkwuOm5vw8oOSnu7ZVLsC3FDJoA2695gAufwp4NQVQ@mail.gmail.com>
Subject: Re: [PATCH] regulator: s5m8767: Convert to GPIO descriptors
To: Peng Fan <peng.fan@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, 
	"broonie@kernel.org" <broonie@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 12:26=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
> > On 24/03/2025 05:21, Peng Fan wrote:
> > > On Tue, Mar 18, 2025 at 02:48:05PM +0100, Krzysztof Kozlowski

> > > To keep DTS unchanged, we need update polarity in gpiolib to force
> > > GPIO_ACTIVE_LOW.
> >
> > How are you going to achieve it if one DTS has LOW and other has
> > HIGH?
>
> With this gpiolib-of change, to fix polarity as HIGH.

Yep those quirks is what we have done to handle legacy cases,
mostly from old devicetrees using bindings where proper polarity
wasn't enforced or properly used because the drivers would
override it anyway.

Ideally the bindings schema should enforce consumers to use
GPIO_ACTIVE_LOW but I don't know if that is possible, but maybe
Krzysztof has ideas!

Yours,
Linus Walleij
