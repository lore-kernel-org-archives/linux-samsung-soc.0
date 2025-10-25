Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54D31A0BD6
	for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Oct 2025 00:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351945; cv=none; b=cDhz8MAkFIaGOjH89f3r2I71hD7J6B/eiEERUen6pkFFi49OKvXp6ICIb4cCNR/IcwfoccKJB2ti0QHm0R7juw8rILHPLN88YdPjH6qDysOiq6hIbwujVZ8mVkv5YAGzs6QKERgwoYTI62hW4aJXpb7FPwcNJqTDI5YTuiBB1oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351945; c=relaxed/simple;
	bh=ccDSWsDcv1VgO5FQCNboytqw8BM+lSa4xnjDL6DygK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lh3VWYFHfi/5onM/sCr6CklnKlZNDThkRKo19bne3UVOEVZZGB7LtaIoULsEc1owsxx8gMbo30ecXDaoqdg8/oqUIWuJDSwrUTZRDO/KaRrLkxSG/Vsc/+nuXqPgAPrV8f68NU3GvbwM1/5fixGP055tyJO/1yDjsgt70NMSvyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bsg3BHhN; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bsg3BHhN"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6cee846998so1744648a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 17:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761351941; x=1761956741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9yYHTI4h25yt43JbI8zzKxRC8DtBUXLI6AUZFTgumw=;
        b=bsg3BHhNfDpQpmzv341EFW64bYEiEeiobWE1zm/f9dPo6rw3FhM/RdcXQQF5JrQV4f
         GRn/KO6DNTEJlRY9RFIzoYJZHu3Oo1f53emj/zyKAOAuvKVlyoAy3JR2Gu7SFBgz3DVE
         OkfUupxGP+E1EBAOnGUVH/E3vWv/Ln9vQ3AL+T5Dw+TuyMGcrfveTcNFI+UpjGt1JqIe
         QKEtRF8X3fHSJtlVpdB3ptvBEvyV6QeI0CefPeXWNF1nmdGl4xVqM5x0i+E7vZnouMuo
         7M9Nb/l0MdxJplTLHZyOeloCVbT8RoXUOg8AP6XZlCzJn0xB54rsMk2kPgbwe2MfOByo
         XB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351941; x=1761956741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9yYHTI4h25yt43JbI8zzKxRC8DtBUXLI6AUZFTgumw=;
        b=iqw1gL0B1YFz/lvE1RqrKf38OMUoGPEeK3qZ5u5PTfxxc+40iLPqH5AcdyVmp1vkXl
         4bNd0nA3N96cEAi7/wTMj67jwDvGVQPUR89TMQ4yJKyHR5O6XQ4MLjxklk2WqkTeLth+
         88EMEU/41eZWGOkH1gN1dIxjns9JW2DTkZaAOxRnwFdcjrZnX4sIrDWwlDEVhMF1xtRO
         mfhJ9EXdYMkLSgHa7aruswIW4CBvszbgZ9yqGVKtrcgxOUHFnb+XUI/X5osjnlsMiNsn
         B6HX2lt3L6fhSnuStLPOLtsNhfew+toUcNwmIPgH6sURU81VoF8o8UbtPJImPuhd1SOI
         F3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWoDNYf9ZVIW0NrmU+cFqBzSQEnG6XF6z6iH8k0Ec7lrHcyaPg1zLXFJo03nORYQwGo54Cx6R+g3nnUUSqOXSmDOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/CkQE4v4qD0dgQBkjSJtXtx6Ojs/HLWju7BereiE/Z4wK+C6p
	z+XJeHEu5wCxP4m8o1xXxoOyOYZksvTkyU/7696thOSCXnxhNMu6iExL2FxD0KQVvCazoL2euCi
	iiOd5SPaad+nEcmJ5xW7bl7+3i6rzzMkyUMVmJ7fs
X-Gm-Gg: ASbGnctZylYDiAyUmBubMQA53G+zGoIULVTW8DKUEc4IwDCUWoz2zvvSK2BJWiLBd02
	yi8UgDq/qhLIgcvDrORyIlqA7R/nvzdAuBhD6LHjybhVpwZvuiHcBr+m05qRqTznYdO3tWwdJO8
	iEqBnW8XIr6TS4Y2JFF9oExaNR9sKiaYCldy8jvdcxbf2Y0cN9fWEfFAfje7BcCEfqpRmV0Dq4W
	RxKlTjRHn18L9Jjza8yv10u/FAX3Kb5p/7rZLwN1AYKGY1yXTG+Sz7jfbXZ7DGbwVcSrfTP4EY8
	4t4R6HSMFrlBJA6Q8HwvtUhGbvqNSsJVnPIrd3o=
X-Google-Smtp-Source: AGHT+IEAtGIYzz5GuE7d802lxFu8k5RTtfyNbMXTlexm9n6vhrEfMKv+0UkqmDG6uDjac/PGpPAozKneZs4s+CDi2dw=
X-Received: by 2002:a17:902:f78b:b0:290:ab61:6a5e with SMTP id
 d9443c01a7336-290c9ce0ad2mr375635765ad.27.1761351940750; Fri, 24 Oct 2025
 17:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017233459.2409975-1-royluo@google.com> <20251017233459.2409975-3-royluo@google.com>
 <20251023224302.vdiryshblnkbtsfd@synopsys.com>
In-Reply-To: <20251023224302.vdiryshblnkbtsfd@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Fri, 24 Oct 2025 17:25:03 -0700
X-Gm-Features: AS18NWBOci17zFtbnd0-kPsMTuRFIm7KB3V_utgPg4fIqx_Bi1ldRxcvUNvrXRY
Message-ID: <CA+zupgx9QjT2faWeGtAy_oZffYfEXupPG-GDU9aLisrMGNohdA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 3:43=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Fri, Oct 17, 2025, Roy Luo wrote:
> > Add support for the DWC3 USB controller found on Google Tensor G5.
> > The controller features dual-role functionality and hibernation.
> >
> > The primary focus is implementing hibernation support in host mode,
> > enabling the controller to enter a low-power state (D3). This is
> > particularly relevant during system power state transition and
> > runtime power management for power efficiency.
> > Highlights:
> > - Align suspend callback with dwc3_suspend_common() for deciding
> >   between a full teardown and hibernation in host mode.
> > - Integration with `psw` (power switchable) and `top` power domains,
> >   managing their states and device links to support hibernation.
> > - A notifier callback dwc3_google_usb_psw_pd_notifier() for
> >   `psw` power domain events to manage controller state
> >   transitions to/from D3.
> > - Coordination of the `non_sticky` reset during power state
> >   transitions, asserting it on D3 entry and deasserting on D0 entry
> >   in hibernation scenario.
> > - Handling of high-speed and super-speed PME interrupts
> >   that are generated by remote wakeup during hibernation.
> >
> > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/usb/dwc3/Kconfig       |  10 +
> >  drivers/usb/dwc3/Makefile      |   1 +
> >  drivers/usb/dwc3/dwc3-google.c | 608 +++++++++++++++++++++++++++++++++
> >  3 files changed, 619 insertions(+)
> >  create mode 100644 drivers/usb/dwc3/dwc3-google.c
> >
>
> Sorry, I've been tied up with some internal projects and haven't
> reviewed this in detail yet. I think this change deserve more time and
> attention, and thus the delay.
>

No worry, thanks for paying attention to this patch!

> One of the things that stood out is that you're assuming the host
> suspend is always hibernation. While it's true that xhci suspend would
> go through the xhci hibernation flow, however, that needs to communicate
> to the glue driver here. For example, if the xhci driver is not bound,
> and the device goes into suspend, we may go through this hibernation
> flow when we should not. But maybe that's already handle? I need to
> check.

Actually the host suspend doesn't always go into hibernation.
In dwc3_google_suspend(), this driver follows the logic in
dwc3_suspend_common() in determining whether to do a full tear
down or enter hibernation.

| static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
| ...
| case DWC3_GCTL_PRTCAP_HOST:
|   if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
|     dwc3_core_exit(dwc);
|     break;
|   }

The glue and the dwc3 core have to be aligned here as there's no
way to enter hibernation if the core has been completely torn down.
As for xhci, I don't see any logic that's conditional on hibernation
so I didn't pay much attention to it, please correct me if I'm wrong.

>
> In any case, there are multiple players (xhci, xhci-plat, dwc3, glue)
> here, and I need more time to review. Appologies if this will take
> longer than usual.
>
> Thanks,
> Thinh

Looking forward to working with you to land this patch.

Thanks,
Roy Luo
