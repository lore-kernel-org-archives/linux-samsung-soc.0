Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B4D1A9FB7
	for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Nov 2025 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763816419; cv=none; b=sTUBJlynukkEiIUaMmAsuqENaOA7NjvEjLqzAvBlaEeLzrXgdZZiT7IrHBUSYT0To8T4AnMRN8dffFWWvD5bj87Nnf7OpCPUdYbXR+cgnf68+UbyR6QwS9fESbQzz7kWxmWESc0NJeno7eXneGGkKPhKujgi5pSjyeedrfoGe2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763816419; c=relaxed/simple;
	bh=4SJqsNqEC1ikm16NffcXgYdxYhJQBd/iOeqcJJhYHLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldw0wBAh9AfuMWJ5YvOWF7BnFm2rgkNawB+M8+H15MNjr6kP+XyxE43aJGFGCSWiZpAdQ7t2wD/QL+vrrxv+oBt2sEB48EHQ9nvxCbd74JVKF8821ynTXm9PFA/MOltRFLQI0CQhNOYQ0PYczVpX4yQMAOJoWMh7AvSl99k6m6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=os9d4T2d; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="os9d4T2d"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8804ca2a730so40470426d6.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Nov 2025 05:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763816416; x=1764421216; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D33saOqa18RCkbxGkW6RKN+23lAQ9LGSuB2LH3pnMFs=;
        b=os9d4T2d+So6Rpy/YaGnb1tA9gdaArBOX541V9BVvTY+Eps0B7VAyliAPxsw1r6mRW
         JW6/wJPp+ANKs0Y/6rBNIij8fvtZ9gmkZSpzflZUYpYd3NYlGWYAunAz/jNwiTHcHtZ8
         FfG3SoFh0cU+qpKTXw8FI+p7Ua51QwphDNeid/pN0Z+Aokyg5ufG3jTzoZKo+abE37DI
         u74LarExgH/Fkj4FY/pBJkumzJAmxrajxf3kLSmFOctBZw7z7K/GvxXL4dXzLMBeFtrY
         D9Rr43293QJY3xjCcA9HLEbpWQOvIggTBby0cgi12cFM7oiK7Il23wRhKK8cL/qfQs6G
         cvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763816416; x=1764421216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D33saOqa18RCkbxGkW6RKN+23lAQ9LGSuB2LH3pnMFs=;
        b=Vq35mDATw8jmSxzpcHADfEFL81/056vQ0W7s/uix1wR/v7R6e5+ENSRv8q+H9p8b12
         Cju43v9zy5XXfURnmGkffZ9oKTq1oDRPxXBVdTDJtL22vE8PKeRT9nbQRQ676irKVV9Z
         gorChfpVJE5StJPuxQtgJqAg4oJjca1FKKA6f4YgsWyJR4PVGjxaFaqSBeKfeF57nRMt
         Z35FjpXVDZ19lfl3LMZ1PLM4g2Y6mMgwOXBJ3G1S33+WwAvNTPzpU4+cxHx37RDps5JI
         k7UF40EsGBf8lNEj1lnguOvWvD6pq1mXEybWNLETlocPxXB9XsCUb99bzgA6BPukS4WI
         AZRA==
X-Forwarded-Encrypted: i=1; AJvYcCX7neAOGUWdZsG3h/GNaG+vLFuZnWnYmaKT6/97CpyoCMST4mWf5mseBvkZGJTNRQq1T0Ee9Cj4y0LmNAyqcUB95Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJwV1fc0isS/pnZVIePSjydfSWP9aTg4XuGDywOSMbxdLhJzHy
	rbuNbxTOkUbQOL1uhZJ1GLqLuq0HcWWBhk6eBP43llkKCpk4Fn2zT9xfBGYz1ilF5vvz+ZmMJVw
	Fzu2q53Vlp5ilOKb/jA+Wyk8ZeBPRmXFjMWwTDZiiRg==
X-Gm-Gg: ASbGnctsBVzJH/NGavsfvGm/LUjQUtED6lz3FwMxq9S8UTH0w7QzZyJI4h2C6ri1+Q8
	RlU7NOjJGdeEjUv6HoxbcR1TX8Lrdkok/FHlwocBj8A7Z/gm5xdXqbzsK+/Y4o2Kgek2CDS4YLB
	9vBwZ0Q71Ld6V/G40ukKz5mtoNWZIBmzTMI/QzdZCM4ePorNt+ExQ9Ors082IT4gZ1PYhTSM8LS
	Os6gwgappmlw7OYkZ4AUnBaHssjGLQO3YK79fOvjaMQw4SXBLI23RudPeDVOapMtRaCeobXC0wa
	mZ+V4w==
X-Google-Smtp-Source: AGHT+IHJrCgIOLl4o7NWWLpx4hV5ffDAfX6bvndBUHOzhVwN3Sh2SMUBYCSUaMSJYcN7I8cF0AZYPeseet0woJPXfmE=
X-Received: by 2002:a05:6214:19ef:b0:880:53b3:a9bd with SMTP id
 6a1803df08f44-8847c48694cmr88775616d6.5.1763816415832; Sat, 22 Nov 2025
 05:00:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com> <CADrjBPqPsPBBSbhx8ZFreFWX2tRxaATT=azS-b1H2b=TJoVAAw@mail.gmail.com>
 <2025112248-spoon-waffle-a508@gregkh>
In-Reply-To: <2025112248-spoon-waffle-a508@gregkh>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 22 Nov 2025 13:00:04 +0000
X-Gm-Features: AWmQ_blyAPM0LR0XqdHlXvnT72Nj6YIaIeoZyPTuWF8E9Zu5nwZOromhbyVp9eo
Message-ID: <CADrjBPp0icwChpAdeK-CBEqvV__ALJ4YO=cp5uhXEUu3nqL4UQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roy Luo <royluo@google.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Greg

On Sat, 22 Nov 2025 at 12:35, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Nov 22, 2025 at 11:58:39AM +0000, Peter Griffin wrote:
> > Hi Roy,
> >
> > Thanks for your patch. It's great to see Laguna support being added upstream.
> >
> > On Sat, 22 Nov 2025 at 09:32, Roy Luo <royluo@google.com> wrote:
> > >
> > > Add support for the DWC3 USB controller found on Google Tensor G5
> > > (codename: laguna). The controller features dual-role functionality
> > > and hibernation.
> > >
> > > The primary focus is implementing hibernation support in host mode,
> > > enabling the controller to enter a low-power state (D3). This is
> > > particularly relevant during system power state transition and
> > > runtime power management for power efficiency.
> > > Highlights:
> > > - Align suspend callback with dwc3_suspend_common() for deciding
> > >   between a full teardown and hibernation in host mode.
> > > - Integration with `psw` (power switchable) and `top` power domains,
> > >   managing their states and device links to support hibernation.
> > > - A notifier callback dwc3_google_usb_psw_pd_notifier() for
> > >   `psw` power domain events to manage controller state
> > >   transitions to/from D3.
> > > - Coordination of the `non_sticky` reset during power state
> > >   transitions, asserting it on D3 entry and deasserting on D0 entry
> > >   in hibernation scenario.
> > > - Handling of high-speed and super-speed PME interrupts
> > >   that are generated by remote wakeup during hibernation.
> > >
> > > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > > Signed-off-by: Roy Luo <royluo@google.com>
> > > ---
> > >  drivers/usb/dwc3/Kconfig       |  13 +
> > >  drivers/usb/dwc3/Makefile      |   1 +
> > >  drivers/usb/dwc3/dwc3-google.c | 628 +++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 642 insertions(+)
> > >
> > > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > > index 4925d15084f816d3ff92059b476ebcc799b56b51..f58c70dabf108878cbefe0abea88572d9ae81e26 100644
> > > --- a/drivers/usb/dwc3/Kconfig
> > > +++ b/drivers/usb/dwc3/Kconfig
> > > @@ -200,4 +200,17 @@ config USB_DWC3_GENERIC_PLAT
> > >           the dwc3 child node in the device tree.
> > >           Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
> > >
> > > +config USB_DWC3_GOOGLE
> > > +       tristate "Google Platform"
> > > +       depends on COMPILE_TEST
> > > +       depends on OF && COMMON_CLK && RESET_CONTROLLER
> > > +       help
> > > +         Support the DesignWare Core USB3 IP found on Google Tensor
> > > +         SoCs, starting with the G5 generation. This driver includes
> >
> > consider adding: (Laguna)
>
> What is "laguna" and why should it be listed here?

Laguna is the codename of the SoC (mentioned in the commit message).
The dt compatibles and proposed dt files all mention Laguna (as
opposed to G5) or its abbreviated form lga  so it could be helpful to
have this mentioned in the help message.

See https://lore.kernel.org/lkml/20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid/

Peter.
