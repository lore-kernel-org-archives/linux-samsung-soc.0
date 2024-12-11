Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30C21D6DA4
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2024 17:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733939652; cv=none; b=ROBafYUm/EjzYqBtC9+wtWmFXRQ7odkzR07/4NjjutttqpsjEFRwULKcwgN4Rou/ZjaTaXKzGoCO+2BEn5va3JK1qxTCCXoIPFaLaJG+EzDnxkih//d5GVlmWM4e/iOXwjxUjqv8InljLeP9V/bPYCJh9ZxS/YYh5kbGXK4RvWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733939652; c=relaxed/simple;
	bh=SBAUUgHHCorAYYhe1b/RpcaSfhfVVFDNGT3lM1F0Fxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jnn0zLrKPCWPvfEtO81VFsrhn72AvQbQYNqe/F23UV0iTIjfN41e0YXz+u28y3wJPSHTFi+Ks6Jb65iYNAsciGoEN9uJ3e5Oek90B29krFq7BGjrCFGZbS36SXf5eG9pcMgKcF9G7fHc15ryw+9Vak8geQcGci/8eFCff4aZ9CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hs3m8neY; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hs3m8neY"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3eb87127854so288305b6e.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2024 09:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733939650; x=1734544450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBAUUgHHCorAYYhe1b/RpcaSfhfVVFDNGT3lM1F0Fxg=;
        b=Hs3m8neYcFQmat+Z0mFFTxjDikX4Mwuk94t3ojvAnoHxDlMkOyFWNObjPHOCG5MBa+
         ya+3ODDO+leNdv6Yo9xCwY8vFDcdBNPMFPtjkWX4VFh2SrDXk4sZDdF36QwkZ8vvXVLk
         my5MYV0ekQxnqq+Z+HHut8SjzCRyMSTGzota/MTmkbEEWI5AFsuhwNwhfxARLw2rfAUW
         9EZb7jd6ysQL1upHb/5Hqm7QpWJV5KFIitVk53kPXHAtl/dEf1XRSF1gJltGMH84Z6bS
         Bn6oOE9ZXzO5CvX+XLRRDpGrG5HjEhUhrkNHgRVUKkNBtTrAwirc+5EAPYHARiCw1UhX
         j4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733939650; x=1734544450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBAUUgHHCorAYYhe1b/RpcaSfhfVVFDNGT3lM1F0Fxg=;
        b=cSJqwLEbnnB5sWpaDg+w5MyMC0fK5q3a5iz0hZzwU/CJG5P2NKnrw3ljreRrg3GGaw
         QrSe7l7gsds+xRSou+uMOzTuh9ugFwTCjlLRlt7f8xtPaYR0t+zUqeIVq0L9ucqQpMmt
         kqGpn6e/qiwsBqhqRUvy+JsJQSD10dO9mV4ZEH0e0ObhbD0pcxnAWV1EtoIqVdGjED0l
         aIT1Zl74Fg4JmOjenXUFXnwcIHvDAB85Ku6APh8bELhNAmoxH4L8uzVuGjWO+2cNdvEg
         WWSnC6ufzdr6IeHC0vzZBvnZx7UmL7gaoDyMiuR0IMr8LIUJxLmwMVAXSC50APSi4txa
         4prQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/DFSmFdpaCvPI8ZYm56UlLQNXnquba9glviXMP5pRGw77z305ZRqh42bW+WrktTF3BpmTy6Zq26SmI0fUiAEQzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5QFnFYc6Cr/l7D2vrYCOWD/M/n8V+p6cf0KLrs3bMLXHiM0OL
	yaVjLhS6+8Tc96H3RhdCf+hLqGvkdUNWZEN3VcfSHlbuawRbxWSyll1/YFavT0W1PXjyBlXwQkf
	S7m1Zfe4Vk83kugP7icN5VVadwRkmYVLzdxpT+g==
X-Gm-Gg: ASbGncvyY1tZU2Ztq91Uqvo++Bvz5ebVtQjgmai04leXbw0GdgZzYCUrd+vA9LkzNme
	Qrh21ElLUIFo+XRH7U9VdTkCxVhL68dq2vtQ=
X-Google-Smtp-Source: AGHT+IFfj39z5VsWFUtc547a2JiE2gqj7fMrc6Hgv7LJC75wfYKzbNhVcat1Y4z8nTrgUp65iUPhRZVJvBmlgSE3NeQ=
X-Received: by 2002:a05:6808:1304:b0:3eb:3cca:8829 with SMTP id
 5614622812f47-3eb85d14a42mr2424138b6e.34.1733939649689; Wed, 11 Dec 2024
 09:54:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-7-f5961268b149@linaro.org> <CADrjBPrz1qUxbEVFR8OT785xLPwWmu3_ZThSne+EtpS8_NHEEg@mail.gmail.com>
In-Reply-To: <CADrjBPrz1qUxbEVFR8OT785xLPwWmu3_ZThSne+EtpS8_NHEEg@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Dec 2024 17:53:57 +0000
Message-ID: <CADrjBPqW81kaK=Wco7wMg50APTXGRwhnfFjbnogrSQ-T_mWnUQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] phy: exynos5-usbdrd: allow DWC3 runtime suspend
 with UDC bound (E850+)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Sat, 7 Dec 2024 at 22:03, Peter Griffin <peter.griffin@linaro.org> wrote=
:
>
> Hi Andr=C3=A9,
>
> On Fri, 6 Dec 2024 at 16:31, Andr=C3=A9 Draszik <andre.draszik@linaro.org=
> wrote:
> >
> > To make USB runtime suspend work when a UDC has been bound, the phy
> > needs to inform the USBDRD controller (DWC3) that Vbus and bvalid are
> > gone, so that it can in turn raise the respective gadget interrupt with
> > event =3D=3D DWC3_DEVICE_EVENT_DISCONNECT, which will cause the USB sta=
ck
> > to clean up, allowing DWC3 to enter runtime suspend.
> >
> > On e850 and gs101 this isn't working, as the respective signals are not
> > directly connected, and instead this driver uses override bits in the
> > PHY IP to set those signals. It currently forcefully sets them to 'on',
> > so the above mentioned interrupt will not be raised, preventing runtime
> > suspend.
> >
> > To detect that state, update this driver to act on the TCPC's
> > orientation signal - when orientation =3D=3D NONE, Vbus is gone and we =
can
> > clear the respective bits. Similarly, for other orientation values we
> > re-enable them.
> >
> > This makes runtime suspend work on platforms with a TCPC (like Pixel6),
> > while keeping compatibility with platforms without (e850-96).
> >
> > With runtime suspend working, USB-C cable orientation detection now
> > also fully works on such platforms, and the link comes up as Superspeed
> > as expected irrespective of the cable orientation and whether UDC /
> > gadget are configured and active.
> >
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> As mentioned on the last patch, in my testing cable orientation
> detection is working, but Pixel is detected as a superspeed device in
> one orientation, and high speed device in the other orientation. So
> you should either change the wording of the last paragraph in the
> commit message (assuming you get the same results as me) or make it
> detect as superspeed in both orientations.

You can disregard this point, I had a typo in my test setup :( I just
confirmed that it is detected as SuperSpeed in both orientations.

Thanks,

Peter
