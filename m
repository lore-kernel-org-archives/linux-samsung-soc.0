Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4C92C3258
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759828184; cv=none; b=uS6kLSwsL6bXkTEHwv9Ofo5M4/yaFwD5aExw8IF8HFLn7Zg5uMIago8GZrDVqlLehuvaAhKFZX6brK/webD5A6ImzOdeoaF1Yf2ThxtaVNAa8P2DKgUYHd1ZIyCcX0oSnkWWdiCO0CD6cKTjg08WEe4Rh3GYQ+g50FKdzn4f+IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759828184; c=relaxed/simple;
	bh=1yfqm08lPzP84DqSlgtHVuQqNXB/UVXPe0ZvuASpvXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=neaIz/3/pg5Yd8og1/mNrjweE2TOxNHWICrtNlxcv0bfMEzNIMd7Gu0CyhM2DprQkln2WqUfjP5U6O+cclBIOQVbPzXXZYJq0jbvxqzfxXejkO5d7jTm01X3AegZ7cjf4Icev0nvdAMQPzpUw2Al90nCorW68MBFp7/3FSy5TKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HPetP9p3; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HPetP9p3"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7a4a993dea6so1911947a34.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 02:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759828182; x=1760432982; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k5Gn50jfOxZiiSgXxR/gre/tjvhockNBFkRAG2DI30U=;
        b=HPetP9p3Rcyr+4Rerd3eUcPywk0U+/cpJZQguNYVaEhi7UH/pho9dG27K39tRbutjz
         a0msZ7YzoHLi9+3ghjpUAlBzlRx6+1sWCr2Z4KhFtLX4tG9M982U9qdv5bud/9NTZUGc
         351joCL0Y7gZnCKbdSccb7ySAXAV8ceGTLNjziRVI0+G/nNVs8vYNsF24q0n2UgxGcOZ
         nbfZD2kF4gB6fqOPhtOSkqLJOStWZQS6yLLezTzyhXtrNt9fEk7uQTEvnwX7yWUWGrAm
         MGXAG3D/dEvSMMgJst7VT5SiBd9mDvh+2KcQ9W2vfZG3031A+yRAa6o6hOWlwfecydVF
         OLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759828182; x=1760432982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5Gn50jfOxZiiSgXxR/gre/tjvhockNBFkRAG2DI30U=;
        b=cNNv7nMMoirpIuP4e6hOJhRlj9VEBEdwK0NReGQrc2Bb9Wd/3kSzx0UYD7yMcKckVP
         wLt/ysMuej5UF7iNQ+QsA9JU0oI2sddnyMC1EcUmUROno3Jg1CIBNiMomEEcgLLde9A5
         14cS0dzyU7w/IVMrYA1UgdSUGFEGGKAWz0mV9i0Hc6ZliNmWFqaK2uw9gNYdhnhyRQ9F
         4Ufz5ewHhva4o0JtSvwqQmeszQKhCncPA59fxhP+P0AqHd2ELY/neAZ7Jd0YCrQs5gsG
         IHY1203Cv/KyzT/hqMxAFzINNTnkhIPoP9AEyYfddcJrD3zpn46EZJj6Dzc8B1L/6+Vr
         axhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTQuU3pSkX256oOiOodFX+kvhxJp66Hw8/b52Emv2KY2QTLdchjxP7Je8Lj78vC7zAMH2lTHu0tsgHD86u93rFgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFJCxTBdbk6NteF240tyTcOnl5wXYy8V3Ws3WW2UMpQLJSfYJH
	z9a2UCqeA2JsA+7XORVNuEbuUAOkmozqFfLmPtwBc37hFEI0c/dB41jFZiTdvWNTKnQQWOQ83MI
	48iupjHxvkzPzG/5yN30AyZYGo/+NIGCdlri+BdGYgA==
X-Gm-Gg: ASbGncvflhNYwaPirPbLo8Ogk+hMkl4RMzB3u6wb++2CyxnDw8Q8uVT7Nf/NcgMlvh0
	Y3DT1aIcp/9lakDTcdGsgTbt4GYuI0lB7/0t12qK5zJhhlESgAzs2NUvRgLNrchSOYeLiTJPucE
	e4dk+ElVjsJnX/zHb7TzG2XFRgbtMdCEyxdW0dMzf7gTSw2zvPjhYgTmfMkdRVJHA3vl5PF410c
	CVMwifDJYuh6RPPK+ef75GpVIvtCrlQTlTklA==
X-Google-Smtp-Source: AGHT+IFtOrLlwJK0/TEgM+f2IS4t9o4gV7fAIVv15sfMLe5yqLK9nGKna5+x4B1VTMirLjZ+oFvqM3iKI6ns6JfL4hs=
X-Received: by 2002:a05:6808:3096:b0:438:2907:2ead with SMTP id
 5614622812f47-43fc18a2091mr6585032b6e.50.1759828182026; Tue, 07 Oct 2025
 02:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com> <20251006232125.1833979-3-royluo@google.com>
 <8ca61364-df47-41f2-b0d1-f2a8a74ec728@kernel.org>
In-Reply-To: <8ca61364-df47-41f2-b0d1-f2a8a74ec728@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 10:09:31 +0100
X-Gm-Features: AS18NWD7ktu7qt-H0DxecJcoZK61ZH3ap7EbdS2ccz0Z-j7ffn7elGuijfKqbpQ
Message-ID: <CADrjBPr7Jp_ZyGv2Krv6iLG0avgFWpcWJEO-Z=cEkhwEY-+z5Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: usb: dwc3: Add Google SoC DWC3 USB
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Roy Luo <royluo@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof & Roy,

Firstly thanks Roy for your patches, it's great to see more Tensor
support being posted upstream!

On Tue, 7 Oct 2025 at 01:44, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 07/10/2025 08:21, Roy Luo wrote:
> > Document the DWC3 USB bindings for Google Tensor SoCs.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/usb/google,snps-dwc3.yaml        | 144 ++++++++++++++++++
> >  1 file changed, 144 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
> > new file mode 100644
> > index 000000000000..3e8bcc0c2cef
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
> > @@ -0,0 +1,144 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/google,snps-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google DWC3 USB SoC Controller
> > +
> > +maintainers:
> > +  - Roy Luo <royluo@google.com>
> > +
> > +description:
> > +  Describes the Google DWC3 USB block, based on Synopsys DWC3 IP.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - google,lga-dwc3
> > +      - const: google,snps-dwc3
>
>
> There is no such soc as snps, so you grossly misuse other company name
> as name of SoC. Neither lga. Otherwise please point me to the top-level
> bindings describing that SoC.
>
> You need to better describe the hardware here - why this is something
> completely different than GS which. Or switch to existing bindings and
> existing drivers. Did you align this with Peter Griffin?

I think (from what I've seen at least) this is the first submission
for drivers in the Tensor G5 SoC used in Pixel 10 devices (which as I
understand it isn't based on any Samsung IP). Hence the new drivers,
bindings etc.

However the issue is that none of the other base SoC drivers on which
this driver depends currently exist upstream (like clocks, reset
driver, power domains, pinctrl etc). So it's very hard to reason about
the correctness or otherwise of this submission. It is also likely
that when those drivers are upstreamed things could change in the
review process, to how it looks today in the downstream kernel.

So in summary I think to progress with this we need to get the base
Tensor G5 SoC drivers merged first (e.g. boot to console with pinctrl,
basic clock support, reset driver etc). Then we can start adding in
some of the other peripherals like i2c/spi/usb etc and build up the
mainline support from there.

Thanks,

Peter.
