Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E921720408A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2024 17:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733939737; cv=none; b=a3ops8qhKcW71arSGzU7liTJU2woIXUQ4xjxZBc1k56AEMZx9SqDVYG49h0McC5gyXxjTHZXh3v994duNtsuKscOiotbCy2NWORAPfN4en1DaWd/uzKiP7WfhzHKKOGhwgpaj6C4kwDqiQcP4m6wdRi0EAxqQcaWgep0Mdtyamw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733939737; c=relaxed/simple;
	bh=kDPd8U5uK5R4uekTRa3wapZvJ0AawT6vwbSHt7TAt+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7vlfjZ/KBk2X4w4eUBfuUdVeZ2QZ2IikRmupAQj+hZrB1TNuotS6ULVmQxPimaXxtPAGERUckjlVw4gRdFJmudaQ1PU6iSrp8IxyZbCO7CxstpU2gd8d/5aXneTViymj41kbDHjpUnV0q+EmWfoCOT4Obc0Ab6090MIV0Au2JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l5IIFg55; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l5IIFg55"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3eb4ac63dc2so1929065b6e.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2024 09:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733939735; x=1734544535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NxV4GoHK/ahyIflRv/mOazvo62QwExn028Ncg5fkKE=;
        b=l5IIFg55BcHfsKZKMfFFC1xMkRFJlHPIzqDAy0AeLEKD/XacZuS06CGwGSMFFoOyNN
         NDCWoaNbAEOflz8e6IEoNhh5ryh3GBbswZvzGmsYC52N7YoRCTbco25zsMW6WWqEr9VO
         gfHjH8KSINNuT/SVVx4jGyMHq3BCPMOkEHPI353CQ0S5PotmBmhS1HbOspmC9dRwYBGB
         s1Ut/b4dGWhiv3DY1KqjG+cJW1APZ7X1CTr+TU5wkZb6pFWl2ubF9i5s/jr9snibtRd7
         BjG8sSg/qmTl5MKcAw7RZ56ZVTZeTT5dW8cfMwujOs9c2u23giLJ086sfocEgEMm9p0K
         B0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733939735; x=1734544535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NxV4GoHK/ahyIflRv/mOazvo62QwExn028Ncg5fkKE=;
        b=QQKqaeIvzq26OgkTGwQgKpZHVqUVn6Gj92rpiPTf/DdRKFsXo7wrvZicd3toLsUayU
         D+/OYE7g2b6jS46yQLwmrradaEquFelTZXHmxrY6Rj8FKeQq/euTOuotIL7KUU6mbaLJ
         kTN3bUIhVxVu8zn2OR4EMjdMPkBBwWdsZd1LuZ7RkDOIwUdmjENN3j7pXs5dnoucsqoU
         68PWXCH7sge8sGAADz6DTgQpmA+mO81qUt/NRnvzeQsq0KEJZ0REbw2jRzOkNJpc/ggH
         AWQovUU8ipZUvr7ebGRvY5iglc5REDul3U9jCFCjSWitvBzfxVbgVRfjdQL/vhkKZL+H
         PPkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzzDBsJVQnPcwxn/2iiB1xScqJMT02/81ZLKGw0V5kOruBzGL7W3Gpo6FngoJ4KKur4HPSG8hRYiWzG/TC/axq7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUMXH2zQ+ok+ZOcSBLn4zUcKZOPMHXgQDeWf9z/DPQ8G70aYgB
	4BF80A4ZpeQfooVcr/C2rIwrAQrwVwbecTlIG2DwWoLmKiMvwCo2VQwxqCN/FBcPl7LaJq/TRf4
	rIoPicLutkixLr9BoszfMlcxZukVi/gtfItPsaQ==
X-Gm-Gg: ASbGncv2oWiJJWXgpt1b9U7pbjhOYzX1OTK+YuqX9MWbnX5/QwBUGfqqldlJwK+TKwl
	5rPkbf0Q0PXdTe5/s0BJqHSVKXuxzPXFCzpE=
X-Google-Smtp-Source: AGHT+IF4vtTjbxANqGCquCOW86vWqQwnJkVwBIy0+PKUY3mXo9+jIK2tbaAnXdNFAA6ijnfwpTtlzsC6XGNl2/h4Y9Q=
X-Received: by 2002:a05:6808:189c:b0:3e6:6097:847d with SMTP id
 5614622812f47-3eb85a8b199mr2732633b6e.7.1733939734907; Wed, 11 Dec 2024
 09:55:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org> <CADrjBPoZqbAM=2zOdgXD_dTrgh-J7yE+OX_JSVJ42Lmzb-DPEw@mail.gmail.com>
In-Reply-To: <CADrjBPoZqbAM=2zOdgXD_dTrgh-J7yE+OX_JSVJ42Lmzb-DPEw@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Dec 2024 17:55:23 +0000
Message-ID: <CADrjBPpv7Y-v4w-ZjsM52wPXM1G=v028BxmJA=_zb4ksDq21EQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
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

On Sat, 7 Dec 2024 at 21:31, Peter Griffin <peter.griffin@linaro.org> wrote=
:
>
> Hi Andr=C3=A9,
>
> Firstly, thanks for all your work getting USB on Pixel 6 / gs101
> working upstream :)
>
> On Fri, 6 Dec 2024 at 16:31, Andr=C3=A9 Draszik <andre.draszik@linaro.org=
> wrote:
> >
> > gs101's SS phy needs to be configured differently based on the
> > connector orientation, as the SS link can only be established if the
> > mux is configured correctly.
> >
> > The code to handle programming of the mux is in place already, this com=
mit
> > now adds the missing pieces to subscribe to the Type-C orientation
> > switch event.
> >
> > Note that for this all to work we rely on the USB controller
> > re-initialising us. It should invoke our .exit() upon cable unplug, and
> > during cable plug we'll receive the orientation event after which we
> > expect our .init() to be called.
> >
> > Above reinitialisation happens if the DWC3 controller can enter runtime
> > suspend automatically. For the DWC3 driver, this is an opt-in:
> >     echo auto > /sys/devices/.../11110000.usb/power/control
> > Once done, things work as long as the UDC is not bound as otherwise it
> > stays busy because it doesn't cancel / stop outstanding TRBs. For now
> > we have to manually unbind the UDC in that case:
> >      echo "" > sys/kernel/config/usb_gadget/.../UDC
> >
> > Note that if the orientation-switch property is missing from the DT,
> > the code will behave as before this commit (meaning for gs101 it will
> > work in SS mode in one orientation only). Other platforms are not
> > affected either way.
> >
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Tested-by: Peter Griffin <peter.griffin@linaro.org>
>
> Notes on testing:
>
> I tested this series with the corresponding DT using a Pixel 6 device
> with 2 different USB hubs and also plugging directly into my laptop.
> I've tried various combinations of plugging / unplugging from both
> ends of the USB cable and changing cable orientation. With the latest
> series the disconnect/reconnect always seems robustly detected and
> Pixel is enumerated as a USB device by the host, adb connection to the
> phone is possible even with the cable orientation changing between
> disconnect/reconnect.
>
> One thing I did notice during testing is that in one cable orientation
> Pixel is detected as a `SuperSpeed USB device` by the host and in the
> other cable orientation it is detected as a `high-speed USB device`.
> Which suggests there is still a latent bug in the phy
> re-configuration.

You can disregard this last point, I had a typo in my test setup :( I
just confirmed that it is detected as SuperSpeed in both orientations.

Thanks,

Peter
