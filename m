Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2908313D89D
	for <linux-samsung-soc@vger.kernel.org>; Sat,  7 Dec 2024 21:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733607090; cv=none; b=J1ILfk9+6gygK5T8paelt8jzQeVGekj+NjY72n6Ti/cP21OjYJCADtZr1AKhxdm9GHXCznyMnLCuLECTagBTyHBlqaMubzAUxZpeNjruFSpo6aD6Ja/y3/Nc3MHDOUanhf5/W78ZStFNBkG6ga6whJxT1Idz3lshgk2RwYBUt/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733607090; c=relaxed/simple;
	bh=DjeQFZwSMhqCtQ8nrVJXyzDK26ogxEag7xLAlAfoY5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ocdNiLPhJkdYWvtF7bsXUCIS7M3UW0dVn1q01iKLmQGXb5d8unccGVpo/X22AsKWA9GF5wdTdHc6WpZxEsnEK9E/qIH9JVjHb3fOGYBuUl9uthaNwEb8UBTKxy8KP1nUo2J3ft00s+rI7tcPKUsqv+BfkN8t2stHerA4ei7H9mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SI1C6Npk; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SI1C6Npk"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5f29db2614eso326146eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 07 Dec 2024 13:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733607088; x=1734211888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfKGW0QrWsaa6qvorIS98f1mLt8WgB4RHKxY9T6NNQ0=;
        b=SI1C6NpkD+LU5+wh5+pkFBGAblR5BmjLldIzP6LmHMNS7c4dOOMkrinQsojR76TQxh
         VHbrrZUUlLtC6x1fxgTY2yDmgflAqtHctrEO8BhpbTiPKaM0O0r0KMIT5fsY8rhF0ELx
         Li0UeEE0kXFdHd6gpTtDIsTf8G1jQpfLDuqOYtq8eYvdwJJOJSArU1jpZTOzytN/Oacl
         OAFH9HfXTBr/xveAmsPD7kYLcBDLXNrjYCm4PUM6rOzUwwg2fQfEXh4xLvW6kNDzOal6
         1cnLJh9vcu3ywts6de/vAY7Y5pikJHiJxP+BEjqHHBfgRYFnLgV9Av6+B3CJtwSMQQyA
         WLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733607088; x=1734211888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfKGW0QrWsaa6qvorIS98f1mLt8WgB4RHKxY9T6NNQ0=;
        b=eRK0Eec3G+nDLM4FQD+Zp3R7mt9/lTEv6QmgvaK4zPU4QWWORl3cTqSo7CVyHAdchQ
         6UyrWqLwogvmNo3itpjzorA+olikgHGO7VHifrNyIon2xqHojXaNFyKzcWEJxzvNa649
         b/jLWOQ8NujQnAr4ZcJiZuUm+RjvmhOzbfwykjdulB53LW4nzsO+FXvl0yuGJO2E/4lH
         sJAO10pYHpqMmY4KE/ldiNpxm+zlOQewC3k+6xRAxvoILIS3X2LPqOsiud12IYmmlRFc
         pojbunQyy/FcFmTRWhZanMpwTUJsiilwoeiVk9DUEFUS5BtAZVvBGFK9Umk0MtWPjpaY
         TTtg==
X-Forwarded-Encrypted: i=1; AJvYcCUX3Q3MftBxJsVQ54mnzzb7ge6HlJdnxCch8qw/Q/U25KayVtEAIYXdSNDlcizGo2WkstZ4qk/ByquHChFgEFKG/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlxbfaLbV1MbxDqDMpmtmw37FUTR32SNIwf/hPp07y/rLWb559
	ZyMLGllvKrqEED0yvyQyRnghyK6/hGa2cE6R9QakPrikMJ78LTLaHnb8RROKSUi3fa55QtGL0LU
	Zt4hLlCTBxtrlO6z54upq82tCkWYGL8uLQvn6tQ==
X-Gm-Gg: ASbGncv6sOR7hSqBpaCz4sB8guBmU2Q3Y3C6r/HMMworRzo13JcXYOsa/wZy1KfbWFY
	l8Jd5C0EvE1SVPK0/XfCCnJ7y0DOnRqo=
X-Google-Smtp-Source: AGHT+IHrxIKj+TInrHyVvrustF8TDSTRjzN9vK1a1fqIMmmjrvizhO/kVBzPl/ZHpL1kwxUVz6dUbaTqxj9Qq62lNHQ=
X-Received: by 2002:a4a:b604:0:b0:5eb:5eff:afbb with SMTP id
 006d021491bc7-5f27737f2a8mr7037701eaf.1.1733607088103; Sat, 07 Dec 2024
 13:31:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org>
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 7 Dec 2024 21:31:17 +0000
Message-ID: <CADrjBPoZqbAM=2zOdgXD_dTrgh-J7yE+OX_JSVJ42Lmzb-DPEw@mail.gmail.com>
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

Firstly, thanks for all your work getting USB on Pixel 6 / gs101
working upstream :)

On Fri, 6 Dec 2024 at 16:31, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> gs101's SS phy needs to be configured differently based on the
> connector orientation, as the SS link can only be established if the
> mux is configured correctly.
>
> The code to handle programming of the mux is in place already, this commi=
t
> now adds the missing pieces to subscribe to the Type-C orientation
> switch event.
>
> Note that for this all to work we rely on the USB controller
> re-initialising us. It should invoke our .exit() upon cable unplug, and
> during cable plug we'll receive the orientation event after which we
> expect our .init() to be called.
>
> Above reinitialisation happens if the DWC3 controller can enter runtime
> suspend automatically. For the DWC3 driver, this is an opt-in:
>     echo auto > /sys/devices/.../11110000.usb/power/control
> Once done, things work as long as the UDC is not bound as otherwise it
> stays busy because it doesn't cancel / stop outstanding TRBs. For now
> we have to manually unbind the UDC in that case:
>      echo "" > sys/kernel/config/usb_gadget/.../UDC
>
> Note that if the orientation-switch property is missing from the DT,
> the code will behave as before this commit (meaning for gs101 it will
> work in SS mode in one orientation only). Other platforms are not
> affected either way.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Notes on testing:

I tested this series with the corresponding DT using a Pixel 6 device
with 2 different USB hubs and also plugging directly into my laptop.
I've tried various combinations of plugging / unplugging from both
ends of the USB cable and changing cable orientation. With the latest
series the disconnect/reconnect always seems robustly detected and
Pixel is enumerated as a USB device by the host, adb connection to the
phone is possible even with the cable orientation changing between
disconnect/reconnect.

One thing I did notice during testing is that in one cable orientation
Pixel is detected as a `SuperSpeed USB device` by the host and in the
other cable orientation it is detected as a `high-speed USB device`.
Which suggests there is still a latent bug in the phy
re-configuration. Although I think it is fine to fix this
incrementally, as prior to this series the other cable orientation
didn't work at all.

I just tested my personal Pixel 6 running the downstream production
drivers, and that is detected as a `SuperSpeed USB device` in both
cable orientations.

Thanks,

Peter
