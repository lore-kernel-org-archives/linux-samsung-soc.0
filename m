Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B8921B8F7
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 18:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759860524; cv=none; b=bejn+q6wa4Ilh0h/PXK8ggT4ovVkUaKRQUKxt3K6KdpXYZqnnCSVp5ihFAXd+rBpfaiVHfDmB1LhNwDBIpaBnXSagETY/zvwPHWaLCzXwSP3cBzlPU4Py1z2fOtC5QowU1v7wKz9FmyaE6frZ9cw/zzZQ4htmsCAM4OMMiNVuww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759860524; c=relaxed/simple;
	bh=DdMubapTXMy8f09aBLB03n1BAuAnQzfNmEYSRJnl3Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSc8bHGcK22Ll3TTMoxYCmMVCR31ndFJ+FEb+l/1KsQ4cjViMzllgO+5GF7qTQgdVgCDu98YZ/ODGP/syvw70StMhUZRbc67OhKUzB6R9cGO+CvIMwf4V8Gf7nMsegzQCJqu/QJpkYg+3eBTxQ5lK1dVb3WU0e/jzzMucDC+Z8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oh+dhSLi; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oh+dhSLi"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-781010ff051so4632960b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 11:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759860522; x=1760465322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kL83avgkPvebmqUXatcd7knV9g++K69fYPgzIIAyVds=;
        b=oh+dhSLihmfWkm2eLdGtE6JChTUU2JpnZWia0V3vWDG2J9XEKP5HQlMEHNLV7CDGEH
         oY3mWLlBlDC4fYUzslih8yi+8LBjR99Y73Q7zwpizvNeaXaCQtvuT+62j/a3hmApx4kT
         jdq+sVamUVgbOg+HqLgQIcANNR/0cns9ireh/v0f/u3Cgst11nVwQdrwxtuUfLh2sOdX
         TNvNet1nLklS3nFkA3SJU9L6gTKmxME9cziPdVI8RndmLQ6HU/vfAkYx58KthzHuhmEZ
         itFAWEaPsa6VUE3J15/l+L6PuRGGXk69hL+Q88W05jZULPZqaxADxhwz9lSab7Zc3qDd
         plFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759860522; x=1760465322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kL83avgkPvebmqUXatcd7knV9g++K69fYPgzIIAyVds=;
        b=vPsED/zsIV08AkGrPzVRklCvyRnqRYmJ0if8qWc/sbF1drXCLVlhf8HmJrWVNndlBf
         7V500DAxOKVWsaO/9QgbUmqiKClsjcjvxzTuJim6ZMQTyHAKpvEbWeIECB7y6gUKgF03
         QrKRgPq1AM4yujvxbIo9I70v3TifPoeFkkZ+jFgEAQa6AfYf96U8CVpSgT/UVQ3LD8R6
         2+PiNGFqQE7sT3++iNPm2FmKJFd0eQNWex4YV+fnWsggZwz9BW3R2U9iDFg6OHY9udot
         YFDy6h066UOpEHQbIFWzcPviLCyqy7M4cY9fFmWLBb3IHW9i7eDHY53zZO2EOCkjPiie
         N7Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVk8ZqB+fk7+13/UV+Wqar8jBA3HClKCwUKG1nRt9mnck+sZRYNSX33vFWyM2yspUFh+bz94KofoUXMb3FdZt2NfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWYXzCl4z7HCZAAx0Ta+g/uqvXPNUW7GHTjb32AinveOzOTYWs
	z6qlvmphPUfcfGhyBl+JTcX27/bLMURWQc2AS6EmFAt4XCOw6hpWJMM9hbPNMfBcqYYUXHgEgV8
	ODTpAw2I8T3uQ4EuUYE+Q6gl1D6v0RjKnoFi4wMVq
X-Gm-Gg: ASbGncvSP6nFXG5Q4fok5nH/QpE/va1vMxIJF+9suIM+ANmmRw4CtBFLwzq2GwEgky1
	O7MPi9wMo9KF4EJg43bwR2PyP4vRSuz7R+zZm3Yfr/0wPJwu7RnzS7sltGTyrFwfXXXopAALjNa
	ww1FnZH1dbwsZmdBCGr7L+02rtmH8PspazEl5OW7wZYOs/+8zve7x5aqQbIVc4UBuOfIL51rYlW
	+PsDwl/P0kzcylXWXbS81KDhm5fdBXqD5jmI2kFRd5SA2nMJb+3CBhdfUVMLk2M6UgI
X-Google-Smtp-Source: AGHT+IGS0kErmJQEsnmkmk3f/fOEYFz/5xrVmbiZTV6hLQvnRLUwNPn7W+mzTIzummLCCaPUbPxoaoxxuABS/7SFA1s=
X-Received: by 2002:a17:903:46ce:b0:27d:6f49:feb8 with SMTP id
 d9443c01a7336-29027238ecemr7876345ad.16.1759860521582; Tue, 07 Oct 2025
 11:08:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com> <20251006232125.1833979-2-royluo@google.com>
 <5c2c298b-b0c3-4fa5-97aa-75b44084248b@kernel.org>
In-Reply-To: <5c2c298b-b0c3-4fa5-97aa-75b44084248b@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Tue, 7 Oct 2025 11:08:05 -0700
X-Gm-Features: AS18NWAJZttVCngV-whwmJ2b6zMeUXBnJ2src5pRyz7OavFl88Fb6cD_LbEK-Hw
Message-ID: <CA+zupgzMmgNA3uJiHSCY=5GqYf1RcSBdniJeo5VQnUnsyzY1_g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] usb: dwc3: Add Google SoC DWC3 glue driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 5:46=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/10/2025 08:21, Roy Luo wrote:
> > This patch adds support for the DWC3 USB controller found on Google
>
> Please read submitting patches, how this should be written.

Will use imperative mood in the next patch.

>
> > Tensor SoCs. The controller features dual-role functionality and
> > hibernation.
>
>
>
> > +
> > +static const struct dev_pm_ops dwc3_google_dev_pm_ops =3D {
> > +     SET_SYSTEM_SLEEP_PM_OPS(dwc3_google_pm_suspend, dwc3_google_pm_re=
sume)
> > +     SET_RUNTIME_PM_OPS(dwc3_google_runtime_suspend, dwc3_google_runti=
me_resume,
> > +                        dwc3_google_runtime_idle)
> > +     .complete =3D dwc3_google_complete,
> > +     .prepare =3D dwc3_google_prepare,
> > +};
> > +
> > +static const struct of_device_id dwc3_google_of_match[] =3D {
> > +     { .compatible =3D "google,snps-dwc3" },
>
> You cannot use compatible before documenting it. Read submitting patches.
>
> Best regards,
> Krzysztof

Will change the ordering so that the dt binding patch goes first.

Thanks,
Roy Luo
