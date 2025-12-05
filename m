Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1027FB2A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 03:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764906701; cv=none; b=EBDzrWDvqQUZIaKP9XVR70pwQ5C8EUnOxhyuApows1WxaISIGkZl9gk5R3P1Qcv00FeFCAb6v1dR6Jq292/JJ3oqZIV1Lf1srb6mQltLW7oDJH6eIY0pNk4XMA+36F159GQpKvc4dnlQkSkTMUPvo97SJrgFkXhLvmXVwubdwy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764906701; c=relaxed/simple;
	bh=slZlQyYOBEOT6lxmCRYIokb9RadnXPM5nRxrSoFVCew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ooBKRx1GhL2t3B2fIoVLhd+68czGo+7rOPlYBWWtYFbsnJaVCxFVmSL5+d6I/ymKm6suogCLc+Pe7ytCqkP5Ny68/rHIEcDYWJ4xODAUFx+UqnAjt+SqSXDn2ld1zdywNQ5gUD8fU4nR3avTEg+rUElngEtjy0/twBZad4T5ajk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wUFbwQSR; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wUFbwQSR"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7ba55660769so1480331b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Dec 2025 19:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764906699; x=1765511499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WezX6hNbQA28AqxZ2YLg6gysDGXXgYStXFDCsVPlTbo=;
        b=wUFbwQSRwx6owW2UU91/f7WsQhFBmS6A+lnq61AjvmT0Lm+rHxv+d/YEMQwnQu8AgE
         U7n8CcAAHpH2jMzaPq2KnUWFE94vO0Z5/N7jKfSbsVAG30cS/4kkQdTZdQGMOXWt1r3z
         jv8PHCThFqS+DGFS/bQjI0PwYdyJk7t+WFHPWtZtxTZH76BTWwSasNTXHeGRobrAcziJ
         Cs7cboZpF39Hi8Oy4R6QhpsQYLLXJMt0G6RkzUG7ZHCuesr8PRZLu1VwCdayzLmbbs6c
         4Z19ZoPF8ntydDpPQGKftkzMMWCDO9I9UX4Z8a/kMdJUibTllExlR02p92LVpCJ9Al6N
         f/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764906699; x=1765511499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WezX6hNbQA28AqxZ2YLg6gysDGXXgYStXFDCsVPlTbo=;
        b=CMApxk+lcEF66j/zziQPSHAOAMzYg5g8QPfApts7TTKNZeWZ3mNfvZOW5oBg/9nN5v
         Aptl6z1WnmH22DuDsoNpwvirNWJcU86MI3buqXOOBg38J6ff/qVGs3sUg4Cq7a4QloaS
         lRCG2ihCApSx/rSBMG9lxLer9H2iUThdzhCDO/Lo9Yb4lBPCjIarJrm7ylSUOaPt5+oO
         BxUvReGBlLG2UsExJmAn5o+pfNw2peWdF0u4UYFUW07QdkLcpdTsdVoCZOoGOzi32i8F
         OfcRBruL7Meph2FLnCebhaZ7vzUGpCMdh7F+UDkZrdK/pVSI+STBns+IzsoTX9S2KxDw
         sf4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxD2IR7QPG01Lj60kfdbRN0lVZacYTQE6gvi+8O46bwcSHlWtDIPtpAZkPWH35pjrT3nfrbm5adte2LFHnj/OhaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQUi5NCmWRiWdhnUjDxDJEwRgL8JAgAW88IZerf2n+rqli1Yjo
	aZ3eDQkwHIiIPAwAt09ty0ozdI6/6pgRRmImXKTyKyHqU8EzHEjiIywljSPVYOgIUTOz6ptAYsa
	yzdjZh8yo4WQjZ82T0g2qvOC2DO1J3cT6iQGWsqu6
X-Gm-Gg: ASbGncvS/zHEdTXMU9RuQ4ms+j4VBGDi639xIYjWLhBdLlllk+g/4i0nr0kYfWZyjlA
	8kJTl2h2DzUTH3a1VpOs7uPuK9L4mkcP3D5KDShHsmHgV61ESSb5PufY4EKTXda+fLYD+OEZiAQ
	oWSWPTa9yj80W7NC856YPYsAHmzIKSVDeRNLVeQcnzKzxgCya7VSlXOMCd7usvrr5JfqeDuiT3P
	vLp/M4YFJ5pak57Q1fw1n46h3rcv0f7+FPCzcG0YRGYy0Oa8uo2+wqpLrDr4bcL9pG9nKJAw1Xi
	YRSAtCqjXR+FMHWPx9HyVFNGYVlu
X-Google-Smtp-Source: AGHT+IH7GWuDo91VkkxlEQ1I2pmrwkMqe1WpyJDLcRf2GJbb70zopeBu3Xn1bmW37Gs5MbOfJb8chhFABiGk+XWPpXI=
X-Received: by 2002:a05:7022:3841:b0:11b:c1fb:89a with SMTP id
 a92af1059eb24-11df0c3d70fmr6132695c88.32.1764906698269; Thu, 04 Dec 2025
 19:51:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121-phyb4-v7-0-df644fa62180@google.com> <20251121-phyb4-v7-2-df644fa62180@google.com>
 <CADrjBPpLn9qzg1y5_c_0CYL2U8p6taMWtPOw5RykAO4=4uNeUA@mail.gmail.com> <1a53d473-fc13-4ac5-ba52-4701d95e3073@kernel.org>
In-Reply-To: <1a53d473-fc13-4ac5-ba52-4701d95e3073@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Thu, 4 Dec 2025 19:51:01 -0800
X-Gm-Features: AWmQ_bkI3gBipBfIh3J4uywjnOrs9760E4xYx1DdnhCprCkAyhSf6HmOxRGOWVk
Message-ID: <CA+zupgw4_o7Po_Zw1qT13YU=PGXoJ_RAPKiAwFpt6RRyO14OAA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] phy: Add Google Tensor SoC USB PHY driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 22, 2025 at 4:49=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 22/11/2025 13:48, Peter Griffin wrote:
> > Hi Roy,
> >
> > On Fri, 21 Nov 2025 at 08:56, Roy Luo <royluo@google.com> wrote:
> >>
> >> Support the USB PHY found on Google Tensor G5 (Laguna). This
> >> particular USB PHY supports both high-speed and super-speed
> >> operations, and is integrated with the SNPS DWC3 controller that's
> >> also on the SoC. This initial patch specifically adds functionality
> >> for high-speed.
> >>
> >> Co-developed-by: Joy Chakraborty <joychakr@google.com>
> >> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> >> Co-developed-by: Naveen Kumar <mnkumar@google.com>
> >> Signed-off-by: Naveen Kumar <mnkumar@google.com>
> >> Signed-off-by: Roy Luo <royluo@google.com>
> >> ---
> >>  drivers/phy/Kconfig          |  13 ++
> >>  drivers/phy/Makefile         |   1 +
> >>  drivers/phy/phy-google-usb.c | 292 ++++++++++++++++++++++++++++++++++=
+++++++++
> >
> > Please add this new file to Tensor SoC MAINTAINERS entry so it's
> > easier to review future patches.
> >
> >>  3 files changed, 306 insertions(+)
> >>
> >> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> >> index 678dd0452f0aa0597773433f04d2a9ba77474d2a..af14ec74542a9879c856de=
e8236753990fdf3705 100644
> >> --- a/drivers/phy/Kconfig
> >> +++ b/drivers/phy/Kconfig
> >> @@ -101,6 +101,19 @@ config PHY_NXP_PTN3222
> >>           schemes. It supports all three USB 2.0 data rates: Low Speed=
, Full
> >>           Speed and High Speed.
> >>
> >> +config PHY_GOOGLE_USB
> >> +       tristate "Google Tensor SoC USB PHY driver"
> >> +       depends on HAS_IOMEM
> >> +       depends on OF
> >> +       depends on TYPEC
> >
> > Add COMPILE_TEST for build testing.
>
> ... and this probably should depend on your ARCH_xxx || COMPILE_TEST
>
> Same for USB DWC driver.
>
>
> Best regards,
> Krzysztof

Peter and Krzysztof,

Thanks for the review and ack to all the comments.
Sending out a new version.

Thanks,
Roy Luo
