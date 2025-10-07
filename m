Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B876E20C461
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 18:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759860234; cv=none; b=OGA5eG/nZ2cynx4MswKcaa4u/S4PoW28yjEIaQH5msBojU9aTJ+5bHfWmfFZa4JE1aL4KB0IWtEXbZ+bL3uSajHmYCshJqkxVO5T7W3HSd2chh99GYEIS+fRnBFLWh8KwBZA3DhpU8Puv1AYLlb/OfWCQhBhyeLBBY5tpqFWNj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759860234; c=relaxed/simple;
	bh=NHEmrtJIgEleCWQcevq6nqZY7xNB77jO7eLNYiB6sEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szdwqhWtkoe7KwyoqF8LD6EaCp/h+gJCfbrCj97tUG/gPZBz9hQ1Yf5UVkbd7A5JnxndFI0HMWGWJTCLXx/zwpCarZ33bOLUGfodZ76vitDYOVEGSTcGTEf7UloPJjBpJ2zYxRCFXjhHxqoLDXBaV0oWw09UpsH9HKHR8OT9bvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YDGW7iSt; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YDGW7iSt"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-28e8c5d64d8so64418435ad.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 11:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759860232; x=1760465032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoeUTdyH6Ho2hK/WV0Pq7ReoILwQzxKPA2QdB9ZFVa0=;
        b=YDGW7iStLghTCfJ7+MCFpdhgAbzOjwWdGzzI4+L/86ppjDjIEg1yv6gMYK7LVKlQyQ
         A62FUxwi7lyqLo86FJjSoCt4Cxl4tlO0fCBif7yXNu8b81yfL6+NpNlMBvDELrOz4KVD
         Mp4yh4bsPfcGIXLH+lA7B/v9L+KcJsb0YxXnrsQuPpXPe7MF7chjW77QqwsBWQENainV
         SJ7yKYtzDCRymEeRt44ed1JSClqUNeFjqaFZkerPO885JnyLV+4lo/2X9BHI3g2q8V4F
         wm5F1GT8MSgfQGG8KePscMiHadq35L2g5kGW3vkcIM9+NuZVdcIgraWFc+UXAqJzXYQe
         4OsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759860232; x=1760465032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoeUTdyH6Ho2hK/WV0Pq7ReoILwQzxKPA2QdB9ZFVa0=;
        b=ITSDzLu8zSd/jz17XnlHtPCm7kaLedxcakY5tRSAjFmRR7UaxjFqshUOeixQFuzgPW
         aZt0sk0sVN+OKSD/5cpl64mRsw8fUJwsOpLypVv/EpCAvXn2YzJNjHywse9QavUpoz6W
         MSzNbB5rv6AFf8tJXZlT8nsZFeSuuEUeNAMADk3AsUmhTDDbBcWQ9U2WHlhnW0JujY4y
         T8zYSZ40UyssGUgzhQPdypbIa824SepgVdefC8RncxybhQmjG6u8xUlIxCIbRsSdGush
         S1qFcBRsWZFb/FgDITAmO9n2W6LhUjD5q+dLLPXlPMoh9ZqvvHP8ai8ZzGlZZzOddwfd
         h+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWHfrEf9u4uwEBjn5dBGttZRFq/YadWGvGkcHIpCd2Jwu6wikRDHVbzxRX0Cg1BV2t6GE58yC2Zaf5uJ01jrhNCVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHPGHQqgE/7VEeLoVxXTia4KrgBVGlLcDawRN647GODl6RX9GC
	tT/eKUyw8Z7cBR+iM8m6URAmvzV2qAqYtUIoxgcpmNFMn5gK2ZXPgus1CA1Qa7IxEB6wqkwzBrx
	mxTAZ8w6m/hBPVbkJypRl74aSKJjJVc9KtQImAYdg
X-Gm-Gg: ASbGncvqVbaWNFJUB29Af0rSoxxZ4nh6QRSyzMR3fyOI4yZ91S7w0I/3p+2pb/qVJNH
	b3qqgOI7GlaY4VWEhZ0I2MBlSCsgRGt3vgH2A+WkTWWPtmmFpNaDNiJJIO676Q/BZG0U8IsAWss
	tO8KaPSUjINyYtDeBky7s0xMhEhd+58XYRHkxOPRxJx3jmy1422c2QMW+8sdfU4XmjfaePr7Pdk
	gIZbaAthagxSv6u5PzUDyz/fWOsCE8iDkqhESm5YFF5HLRNe9WiIwfO+nIeMe5VVbyQWhaCdQ60
	sRj5CdXFKg61Ug==
X-Google-Smtp-Source: AGHT+IErqs+kJVv5rsWGTN2Z0xZ0ickiFqF1IQ4SpRF/lYWHEWgJPEacLea7fTefk87mdvoXJ1AdDn7lRgB9V20xPD0=
X-Received: by 2002:a17:902:d58d:b0:266:cb8c:523 with SMTP id
 d9443c01a7336-290273ffe89mr5647285ad.48.1759860231518; Tue, 07 Oct 2025
 11:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com> <36068ca3-912e-4e71-b688-8689ead8194b@kernel.org>
In-Reply-To: <36068ca3-912e-4e71-b688-8689ead8194b@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Tue, 7 Oct 2025 11:03:15 -0700
X-Gm-Features: AS18NWA8U90B63ffP5jXdkUD5e6eOAqItmxz5SXEaQputDmKkvJD4mEmS6I0ARg
Message-ID: <CA+zupgyLx8q23b-ecrLhYAU27HV_ZFMiH9XR81Q2MKRmMwpcNw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Add Google Tensor SoC USB support
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

On Mon, Oct 6, 2025 at 6:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/10/2025 08:21, Roy Luo wrote:
> > This series introduces support for the USB controller and PHY found on
> > Google Tensor SoCs (G5 and newer). This includes:
> >
> > 1.  DWC3 Glue Driver: A new glue layer for the Synopsys DesignWare USB =
3.0
> >     controller (DWC3) as integrated into Google Tensor SoCs, including
> >     hibernation support.
> > 2.  DWC3 DT Bindings: Device Tree binding documentation for the Google
> >     Tensor SoC DWC3 controller.
> > 3.  USB PHY Driver: A new driver for the Google Tensor SoC USB PHY,
> >     initially supporting high-speed operations.
> > 4.  USB PHY DT Bindings: Device Tree binding documentation for the Goog=
le
> >     Tensor SoC USB PHY.
>
> This is useless message in the cover letter. We see what patches do from
> the patches.
>
> What you are supposed to explain here and in the bindings patches, is
> why we want this driver and what is Tensor SoC, considering we already
> have one Tensor SoC... IOW, explain everything which is not obvious -
> and duplicating SoCs with some generic name is for sure not obvious.
>
> Best regards,
> Krzysztof

Thanks for the review. Will remove the redundant info and ensure the next
cover letter provides the necessary context on the Google Tensor G5 SoC
this series intends to support.

Regards,
Roy Luo
