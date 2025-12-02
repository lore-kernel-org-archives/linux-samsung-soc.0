Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E9D27FB0E
	for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Dec 2025 16:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764692727; cv=none; b=RBlElb0hVbQpSIGx+tiyc9g5NVGqN2v1DkdsXiBKbifnxgRnPly7AnjeXUoqTaV1PerfE6n9sCzJq76r4N8nvfFDaU2vjIO1Oh2dsYTD3zJsP3CPtzKrMEg05vYsnj+Bsa4XWf8FGAqsLhpvsD52KaUfJ1a1EBUjo6GuUW88wJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764692727; c=relaxed/simple;
	bh=nZdtivljgxNkSnyAU+uPi1o13Tk7h3FCZtl989MAkTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sb10xnkd5BZhOogW1MHCqD+PHbBGUKvYyF/bFne39UsWz5XS1kTWQi6QSyewXg4u3ziZD+K2MtyhfF+WKOy/Ln8ZkLaB83+7RJkQFw4xYaqvFpzl9OnZ/eWbd3Qq69XvbuBucKPJkLyKp4tdVxzdZKNpsgkgRuUQd34c6T9VqN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0qAAYlaL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0qAAYlaL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47118259fd8so56093905e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Dec 2025 08:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764692724; x=1765297524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CUlMgoqtU94MhEJOHiTF0drSAqmoR7IifiR5EWvc1M=;
        b=0qAAYlaLYhBKcbotCxlVIUQUaJSAXCnrTbG6ElPD5SkhYU0J3w5k581lAPxiM71yYu
         KhTibt2Upn+BS7+zyCz2zjVweKOhBm7mrxFz41KkdQIT88VBjR58IsZhjpUQHiG1PPM+
         P1D3hIlPyZlB/ULoenNZTBsYTneqRdMeFZPUw5jihbX7dSdfs5kyKmS0y23tCHy7UXn+
         sUyth23bw0jZHko4eaQicnBPZ8cC9nkLW9cnCgV3kh4WnIQfKZq4xgfldJvb+D0uhU0q
         kUweWAqtga4m2ioKgQQJ4Q9JsIMNGHG/Lpa79xnPTURgdOjjYh6OHifQMsOu6p0jOCQg
         LMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764692724; x=1765297524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9CUlMgoqtU94MhEJOHiTF0drSAqmoR7IifiR5EWvc1M=;
        b=oOsI+AfDJVFFTjuLyPw+hSRlCw6yHm1zOVXMi1EqoUdgGj9osTeOFFtmOCHxeIwmW5
         7z/BRi0M1QTs9RJrqWj27fFOKAa+YUK7RZrlAwosCJpf1o1D5skSlw5L+YtHCekVnLY9
         1rtYURqPi2r0pLvwatwg2pO/sj/WE0QCZmu+rhmVson7NYvLdstO4F/REI2KQU/iouQI
         DxF5DkL+UUllvPp5acxtIdquOnHCiJgfdL0JDC2p2WqcTQ5y9thSd/J3ai0uRn6AQFsL
         u5h+CZ9N43X28SXQqT1kw+R0XzvsD2uyg4lQ53qNU9IN7i+DbTErMO0JlLbNdl7GzumG
         fh1A==
X-Forwarded-Encrypted: i=1; AJvYcCWrgZF6x2xgki1+Fk14rZ2gFcLZY4xFJNrD5SW9mEvKd6Q38TRgZZdBXElB5MCt6CirXDzlIEQ95/JBze52fm0LkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv8m+R4V4NkAEfeUUj2wrbFKHFJcF93u5BiDSUQH602JBdve6e
	E6tCrV7eVNXF4/5gV3XjLEp9lYB5c6dMlxioIvq8Qe+4fa9CDFw9LMahlrotvowLxRgoWntSDuu
	zqtIyuB/q21VX6a2fuKmLe7b3u3x/x0dZQYiA7R7v
X-Gm-Gg: ASbGncvmhGPLHhVozKObj+m891YW2Tjs4lZB5OwK6+Xh1yqBzQv5Ew+N44+DXRo+mRo
	ic5jBq1041lcr2nLDxRMJ66P17kxwfsDt/Wd1rq+acXK2UgoLIPM2npFwhKFT8wNQMabmZB7fUo
	IMlX0mQxXMEO4Y2w2GIW87y5TI1M2uhxGDc/oebGsqTnFSal7l/G1XBF5NbVlJyV4v0npaN0jcW
	w14ju09X7L1Qg+JH15/OoP5DepLGO4wk9vqp3o9l4homKCBVLFM+ZVohq8mTHYgS03ioOEbWr0k
	mISeEUDTDVIr6lSgUGRlYDvMcj+h0CmIpNj7
X-Google-Smtp-Source: AGHT+IE4G9icvFTi4G31CX4WGeT5pU2lGVP4hWaU0UtxQPpBaqTsf8OMaEZe1X38AnxII3RFCgHJu8dMtfftlpYsffA=
X-Received: by 2002:a05:600c:1547:b0:46f:d682:3c3d with SMTP id
 5b1f17b1804b1-47904adff1cmr325914555e9.13.1764692723568; Tue, 02 Dec 2025
 08:25:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com> <2025112226-heave-refrain-53e6@gregkh>
 <CA+zupgwzQ5r=-_L79D74=9VRqRO94N0yTApHChM+Nu0cn1ss3w@mail.gmail.com>
 <2025120209-unstylish-john-2a6c@gregkh> <00d75fd3-a796-402a-a1a3-2172862fcf91@kernel.org>
In-Reply-To: <00d75fd3-a796-402a-a1a3-2172862fcf91@kernel.org>
From: Doug Anderson <dianders@google.com>
Date: Tue, 2 Dec 2025 08:25:12 -0800
X-Gm-Features: AWmQ_blwqi9oyEjuzVvnRUnzW3pTAJekeVpgwKfN72pLxhs1IzFYcf2tLSKp3Dg
Message-ID: <CAD=FV=VLOLiGDfQOWXOL0H+M4EnSj1kouYK37WHV=8OVEwt+qg@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Roy Luo <royluo@google.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 2, 2025 at 1:42=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> >> I plan to add ARCH_GOOGLE as a dependency in the next
> >> version per [1], so the "depends on" would probably look like
> >> the following per your suggestion:
> >
> > But "Google" is not an arch :(
> >
> > And really, the whole "only have a sub-arch symbol" is something that
> > personally, I think is totally wrong and prevents kernel images from
> > being built for more than one "arch".  As an example, the Android GKI
>
> Probably you think ARCH_FOO as arch/FOO/ directory, but this is not the
> case. ARCH_FOO in this context is SoC platform, so e.g.
> arch/arm64/boot/dts/FOO/.
>
> All of ARCH_FOO build into one image and that's recommended way to limit
> unnecessary drivers.
>
> It's just confusing naming for whatever reason.
>
> > kernel has to support more than one of these, so what does putting this
> > behind a symbol that no one will actually use mean anything?  Android
> > will never be only building a ARCH_GOOGLE kernel.
>
> But distros will be, people will be. OK, maybe not for ARCH_GOOGLE, but
> ARCH_QCOM we do for Qualcomm-based laptops and embedded folks even more.
>
> We had this talk in the past. The point is that these drivers here are
> unusable outside of that hardware platform, so only when you choose
> hardware platform (ARCH_EXYNOS, ARCH_GOOGLE, ARCH_QCOM) you will be able
> to choose these drivers.
>
> You can also look at ARCH_FOO a bit orthogonal to actual kernel
> architecture, because ARCH_EXYNOS is for both arm (arm32) and arm64. The
> drivers should be available for all Exynos-platforms, regardless whether
> this is arm32 or arm64.

FWIW I don't feel strongly about the ARCH_XYZ Kconfig settings, but
I'd tend to agree with Krzysztof that I personally find them useful.
Sure, it's fine to just turn all of the ARCH_XYZ values on and they
shouldn't conflict with each other, but it provides an easy way for
someone to know that certain drivers are only useful if the kernel
you're building supports a given arch. If I'm building a kernel that
doesn't need to support any Qualcomm boards, for instance, I can just
turn that arch off and I don't even need to think about all of the
Qualcomm-related config options.

FWIW, if you do add a "depend" on ARCH_GOOGLE you should mention
somewhere (maybe "after the cut" in your patch) that ARCH_GOOGLE
doesn't exist yet. It should eventually exist when some version of
this patch lands:

https://lore.kernel.org/r/20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a=
1f1395814@changeid/

...but it's not there yet. ;-)

-Doug
