Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795559486;
	b=2/KnFeiijMnInkvIKiC9ZODB7A8fUmcuhjI8OFokX3+vO1HCsdhCa9V2Tn2+ZyQAFYlM
	 kRVdSGkOsBU/ysJo5zEPnKOLjLzgLWZU2lYlWuERH0iQtg4CBQ3qU+ym9lWa+kVZw4Dbm
	 xofTsyY49i5gWQkN+IQIRKtDclscAZfiMoUUj375dN+Da6Jq8vU47bbKxv6f9JNLXtX69
	 dFC8c084vwoTcNsUa4EDxvdz2oM06Z8JGelwsVN7qT2cyFPC/P57eHNF/BTCIjUS72VoY
	 vV/N0fCDZeB8fgsTc3QN3kG8Xr/zoQc+sgt9BUFwaYVcwSsqJgaBYc5oRICb6qYnaDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
	b=abnyYye3KJTBbnIwLWSeU9920OM1R9+IpjVf8Nz0T23/+35HRqSq5+JSoNL1v9jMAfou
	 NalCvOLpOlMIeJGiB1Jq/4L5KOTbzlHX085YKV7VA3hx/lDmmHlSdn1r7P3S1YgKThxnY
	 6jhg0mFr5KZ5IrVV8AC3ctCm/IcvHqQhJBVl1Dvhtq1xBecPKsXHzVpF7578eRVs8WHrw
	 RgN7djhSV6Inwrl1Cn6HrS5P3KljbsoSLA6c1C0UCIunTWKDrBIbA01XYxWaPiZzkLorK
	 joWDRMV5bYUubVdFyWFP9A2jZG5ICSBI67scngrgyz6QsodyuBJ1BNTWaPP66Wwsbzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pq6hYJqL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EC2606A6A0
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Nov 2026 22:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2EC2606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pq6hYJqL
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50a4a2132cso746683666b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Nov 2026 14:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795559484; cv=none;
        d=google.com; s=arc-20260327;
        b=jmwGMBE1Y0QHwix3zHYIRuieB44FqWR1O9FwClO1X8JeMv9p2jt9fP+JVOAED2cpO2
         jT1cDqSsbSMLMJ06/tj7vnRdzHOo9k/Vtd23b2qcrou2/+qzvGuIH+S1gs9q4ApQP0sG
         T+/aFJ95LBU0v7wZNVh79sDGKd2T4iLm22mwkefi4uv2UysdMI9zg3rRQNg2fg4QMqf9
         VhxNWwQMGV1hQ7uFRl66ga7BMC7USQm51dPIH6c+2DE0TwILOxlWrZSvdwvGu/ie17mV
         yYpuOjGzsQMK+FdwBWreZIPFwQWb+hggwXAgYNuyJkg6Dq+zc9thGP/dLkn0PpOxQrSM
         KzLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
        fh=sxoryTg3SseMRxYnlScGXIxbwYQCwFRKoZlRx2rVyPE=;
        b=SwX5wqtfAkFh4jUdmk+1pvwDKWzuHARYjceUTpQooHMZe4O3UWPaq2kp+pAy7JFIBz
         wHYynlO7RR/qC/ZS9ezmKWVMGlGwk6w4KFdSkpILUpNfYT8UMYQjmieVkdtIpK7IeeX9
         u5HYG6O6rUcSX5+6m1N9QR3IwY5neAq5IFRhGdC+YDypoAbx7vvIT0bXLT/eSXnjHSHj
         vFWfNw+l3QGv57DRa9PwTCw5AdUhy+fQbFRPoqGjTboN4Yz4hZKiwJX7APZTXP9Hn/Bn
         dxfsN0wYzKdNq/FEuM5M5rUqoP78rBj3uNnshGbK00C9OZL9rUZ5owWy86Kr1k+Mlwb8
         4vew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795559484; x=1796164284; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
        b=Pq6hYJqLqfjmwjq6l8NZL/b72FkWDY7/prko4BQ8KEWZLjnZPHCUw44AYwkS+F8DRi
         EUeoUtNsUmpvMracnT4N+GgMdEmq/lLExWZTQz/1x2gGNuR3gColGwjZifwMrkotSzq1
         d6CELz6FR9caGvQ5SJQ8Y9tQVYlF1B8Q2XaCePiSHWZdneDCgaC0t5wk53jlieeZPq0K
         Xr/gKY4gRbr8NIvfHqVM+4o2vEDZGfOtkWKPxClj2k43yKXLUk1wVQj7s9WACrQQEpw0
         Q98XJp/kNzbRIEqZyr+UWynhvWGPSRNCMolaQERiuhRGVt3CSC7buBUx16Xoa3CNaJR4
         u73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559484; x=1796164284;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
        b=uDMpHDi2EohrQeNb8HghxMgNnSRIxyydlZOVm+qd4kuCDK9iO9dMO9g/awaHXzhMAE
         vEgAgYS0FL3ZqQIeAxD3h8EN9zoKIMCfoO7NivZcE85h6f4XtC13O3BdwGSmMdngHUF+
         TNQQ4Sov/h0Hw0PZfyECDIPUgWXWhHmtG86XZUKRXVkZiVvcYC53OwtdFn1qgrLCYg8Q
         GQlqQjJ+oe2h2gkmh1+gsF0dRSSqBLSKKURF+Z5YqrZAcuQSfIEY5ieRLzE9lKid7UA+
         Ys/4iSY1kKsRz9Q44fCTN3Jr7fx+RoTY9yOchr5H9KNxvnAhM0bDqFCnNQEMkpVHoB6o
         H4Eg==
X-Forwarded-Encrypted: i=1; AL+hErGM6N+IP5jYD3w9iPAyce5PjMKakb81c88p3TyjnvzkrRY8pYNXHr4p5v2c6h/gKRlGjyMaCJQPmIFwesHFFtytkw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9zV6LuC1kIM2/c01JmWWtmzwzqNGLWxGhhU4UkZLLVa5TlznVv
	L/EgO5NsGuiu4SG2FlOdqVuO2kUg/n6cU1/DlQtEau/+cvpxKPVKG0mJdKas73OEdvF/gAeFJNj
	iDfrwcy0MT9Qci1zsGodCNksKbVP/btJrC2xT7FXuEw==
X-Gm-Gg: AZFdTZf/8uxoIhj/WrbqHzJsh8bWF9LleGDy6w7QkGhR3VNIqZXGDyIXQVJPYUHTJsZ
	aLB6grc3l5Wu5tajckymXSdeuQchJ47b5mCpz7P9Z1/2vWZnS7rdvAiy282KxQwRBI8DVdvc/oz
	+JesB/PT74nZN1fu6KNZXGdyaqO51TuOSW5sWhklO4UnJ3Ho3AiQkLhs6guDvOJWvobOXH/N949
	fo5uc14OP9ZegIR1BLAitQTI+iyVFE0wtBCEyzWgky5Gsy7QmYhLJ3bfb5oJ6iX6QZXAvj/6vCN
	EGcKGLnh2pjS0bX2whoXbfkLcLUSEfkfn/42owRDgpyO+w9ndJiOHSFe5HKm1HYmeKul/MD58zc
	mrs2tjJJf+wV938ISWdrtZQM9rSkinXhafRWTC1eHykQ/3f2oEv5/0iwVMCfl2G/t79G6/HkB8i
	URPbYI/qCq43ZmWj/F
X-Received: by 2002:a05:6402:15d4:b0:6b7:709f:85f with SMTP id
 4fb4d7f45d1cf-6ba37ec031amr9043918a12.36.1795559484024; Tue, 24 Nov 2026
 14:31:24 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com> <awXf86suGgKeazZx@google.com>
In-Reply-To: <awXf86suGgKeazZx@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 24 Nov 2026 22:31:11 +0000
X-Gm-Features: Aa3M54olM1DKVBX3EQP9Zt-gD9WnHLwb_Lxu-JjOzcrrRgxAqJXxzL4OnVB7R18
Message-ID: <CADrjBPqG_TLwgOTzQ-o5pM7k1DzkeVxNkV2xDHsU4OBAyYOofQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 24 Nov 2026 at 19:05, Brian Norris <briannorris@chromium.org> wrote:
>
> On Tue, Nov 24, 2026 at 12:28:24PM +0000, Peter Griffin wrote:
> > Hi Brian,
> >
> > Thanks for your series; it's great to see more Laguna support being posted.
> >
> > On Mon, 26 Oct 2026 at 21:45, Brian Norris <briannorris@chromium.org> wrote:
> > >
> > > The Central Power Manager (CPM) is a co-processor on the Google Tensor
> > > SoCs, as used on Pixel phones. CPM supports power-management and a
> > > number of other features.
> > >
> > > The Application Processor communicates with CPM over a pair of mailbox
> > > channels (the "MailBox Array" (MBA)). CPM provides clock, power-domain,
> > > reset, interrupt services, and more.
> >
> > [..]
> >
> > +++ b/drivers/soc/google/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config GOOGLE_CPM_MBA
> > +       tristate "Google Tensor CPM MailBox Array Interface"
> > +       depends on ARCH_GOOGLE || COMPILE_TEST
> > +       depends on MAILBOX
> >
> > Should we also have "depends on OF"?
>
> Why, precisely? It's not actually a compilation dependency (I tested),
> although it's needed at runtime. It doesn't seem like this is
> consistently done simply for runtime dependencies, and instead work has
> generally been done to ensure everything builds fine and fails closed
> without CONFIG_OF.
>
> Anyway, it's a bit academic, since ARCH_GOOGLE (ARM64) selects OF.

I was thinking more if COMPILE_TEST=y && CONFIG_OF=n &&
CONFIG_WERROR=y is set. I'm not sure if 0-day performs such a build. I
guess since no 0-day failure has been reported in this thread, perhaps
it isn't required.

Peter
