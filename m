Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794525980;
	b=qW3mRVJ6R3oGS6GdL8HT1VZkhhJ1Pe8o8wLm2LQvw1vDozbNVG+uXv/8Me3BaYuhOcCP
	 d6YIIehM1YmpdkObWvXPTKfKrVdYmQPsvkWk2hycImlGTNZMrw6rZ2VQzHsJbfLEJyAuL
	 bFExII56x+AL7NLZUPHFlAKQJizgHqTdeNx3AwdObSGzE8UVdkqaqCqC7tjnJhz592kDe
	 IHYvT6UwcUALYz2IquV9/pFzTJS0YXi0OH3jsnoO3q/wKpyWPDCBmIJM6k43jiPCon7xx
	 IXjgB/SldWPxek1I+4pMXz3+WB0DEuX5BRPP1KoJtxSwZs8fHlYJKccioLXoLz6r0Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794525980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=meZuQntashJTcd7s3yiRtBHxVh9sQmthI/UbfhQzfC0=;
	b=qBGO9s5j08Pr5tUvCPOl9gNJEyYfcqcostcmArIUP99WCm7zWKEcXFRvMtdz92E2Oulu
	 y3rQ+nZfNYEiLQv/n6WFnVNncKkxp7ZxRdZ9CbyVv2CRrBTsmsTtar3KpDjhshrmHjIak
	 z7jXIQlfU1Z3sSiIfY5G9LR6T0gKNOI35wWNQubxQ8Xx+28QGhSIbG4pWVkJc89jOBTPB
	 U+H12HJYRfWluIDoVQKY2z5eDzTupQYwshtEJhllmOJDdlg4jQ79DqCzjttLgM6+Hz3zV
	 B8yBY15VThXjXIFEUa7a7BR/arasuO15M7S3ae5ja8XkeH+/wgWDOZ7ArWsVX1kwezg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MieY4qOQ;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5356B606A32D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Nov 2026 23:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5356B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MieY4qOQ
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc758830601so518535a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Nov 2026 15:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794525979; x=1795130779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=meZuQntashJTcd7s3yiRtBHxVh9sQmthI/UbfhQzfC0=;
        b=MieY4qOQ6pZCIr5Q+lFQVjXxwPdVfoiH5Y7ie0qONvaiteOGiCfww5p+6jOvUxjJi/
         i6QJTbx3moiDt0L3+PJqL6CYnAMPOi8AfnlB7SFJvPN6+n2dywupbWkGGew0uyqFtqb5
         9GF2qkhHJ+rQK7uZ3IcX2rxFEGjwg2CttKgzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794525979; x=1795130779;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meZuQntashJTcd7s3yiRtBHxVh9sQmthI/UbfhQzfC0=;
        b=1NBIT3kLFkPGFSsJQYSjbZ1xBNSD84b40KrhA22EqBkSn3dQXDPnCoDczE2kAQFMLw
         h3IiCBEWl1BaSCKPyH5iSFT6KKNDPzi0gbHQEdwNBsVaAhL68LcF1dVUctbnDLwTxO4g
         4Q9fsg2PdkSXpzGz7BwDLvWoO3T32n9SIeGJMoJdT0VQWKEhCaWrP9rL5ArHbJh1Cpwz
         sBP2i+B6Dkh15VsOfuNhmS6tei+yJsLfox1/atlL0JNk0ksMnRiS9014s9dylPh9iUOw
         dwrAqJJhlDS6FCEBMrP+xTA5RL4rzqUcriEnF2dNBj4jfPBKirbdBRI5XdM+RkWzbNgT
         dODg==
X-Forwarded-Encrypted: i=1; AL+hErHpmey2xj44faMO1eGFRQ3QLgGSt2NeB2MKAavwgqYIWdN8w6/R1Sltyxmf9a9W6PBEsxqRD1qLRcF+lKYqLzLeVg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+AXPzU9EqpFVmpGNI4G5bBlplBD8/MQRmvl4PL4l/QSqBRyGCK
	Q1tbXjCuXcra2QSakGswKW6ls0CXWcf98FckkCL2namNMSpX5iGJ6JUGwTgK5fL/0Q==
X-Gm-Gg: AYBFou0tTJBsHppJoXG9NVvQwMRYdpj/W4s0BBux0nfgfl7lvYd4J1RkMgMQ8WAVcqm
	bRHrI/YozjSf6MVaC8JVMpn22Qqr3rsuMGGk9qC4c6OX+O3pdu5dac1wLhhGriDLPxMnIzLuHyB
	cDLbFqvqrSKBuVVR/gs8qnxahWfqTA1l+Ru8yOLoXyYCz77+M77leb1evtlsuXwgFYjgK+x69vj
	v2QJi7s+0oEX/NANlFJI9Agoa0LGYycoIsp/f897s4ZSuNracX4TEaFs3VwMR/wZ9NJkQyWktk/
	CgY8kG9UUkurO4jGWnCYLakoX95f1KN0AuhGizRW5czHKwlhTAzOSGcNBJHGW/Bwhtkq8bMf2dO
	1qdAa8Qx7RmNzU7w3q/3SLPoYHEjRUW2KxFFMihrwZ2lkQnf/0WzjSAlCUSt26cyxg/JdDrYlCH
	MClrDSE5eyvHCHZzIsFHr4oHDBR5wn+Xs1zV/+hrEHPseRKyvCcsrZ3z6n38ZL+l6eT8/jmgzPb
	9RU/kP3GGgyAU7w9ZPDm0/GeHIq8yA+yIrHjYIoU+QW0JwlJBvXqi2JjBOtZTQ+RE3hB0xufKMc
	Yu7jF7MWuAfY8qFoYNX7XverUwDoC8p0AmDOdvbeQQMck8dNKL4/ne+sWlaZ2OyjAW8wSXxK71C
	rt2zXrYgnHc2mJA==
X-Received: by 2002:a05:7301:b07:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-37966a5b9eamr527768eec.14.1794525979231;
        Thu, 12 Nov 2026 15:26:19 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:616b:3e06:cec4:c2f9])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3795591f4f8sm1521913eec.13.2026.11.12.15.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 15:26:18 -0800 (PST)
Date: Thu, 12 Nov 2026 15:26:16 -0800
From: Brian Norris <briannorris@chromium.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 5/9] clk: google: Add CPM clock driver
Message-ID: <avZLGHs0OPoC_VGb@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.5.I82dc05365979021379fe730d6d52792a87ff15ed@changeid>
 <179372634472.2573818.17532943286609086157.b4-review@b4>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179372634472.2573818.17532943286609086157.b4-review@b4>

Hi Jerome,

Thanks for the review, and sorry for some delay. There was a lot to dig
into here.

On Tue, Nov 03, 2026 at 06:19:04PM +0100, Jerome Brunet wrote:
> > Google Tensor SoCs (used on Pixel phones) manage many resources
> > (including most clocks) using a Central Power Manager (CPM)
> > co-processor. We communicate with CPM using mailboxes, abstracted in the
> > cpm_request_client(), etc., API.
> > 
> > The clock tree is largely not represented fully by this driver, because
> > CPM hides most of the divider, mux, and parent details, instead
> > maintaining its own internal table of mappings for divider and mux
> > values. The one exception is for some of the DPU clocks, where several
> > clocks and dividers are exposed directly, and the firmware API works on
> > divider values instead of clock rates. I attempt to represent this
> > properly with dividers and parents, although I don't have the full
> > display stack running to verify everything yet.
> >
> 
> As you say, the clock tree is not fully represented here. Beyond that, CPM
> owns the clocks themselves, as the driver acknowledges by setting
> CLK_GET_RATE_NOCACHE.
> 
> The driver keeps a partial copy of CPM's state in the kernel:
> 
> - Rate tables below hard-code what the FW has (or should have) instead
>   of rounding the rate, even though there seems to be a ROUND_RATE_OP_ID.

Aaah, ROUND_RATE would be lovely except ... the firmware implementation
has a giant "TBD" / "error: not supported" instead :(

If there are major must-haves (or, very-nice-to-haves) in this firmware
API, I can see if we can get them added, but that's usually easier on
not-yet-launched products, whereas Pixel 10 is more than a year old
already. I'll see what's possible though.

> - kernel handles PLL parenting and divider math for the DP clocks, while the
>   firmware can also switch them to what looks like the oscillator, out of
>   the kernel's view. So the math is likely duplicated as well

I'd have to do a little more research to be sure to what extent the
firmware actually changes any of these behind the scenes. I'd imagine
that for the only divider-exposed clock (DP), it probably doesn't, but
I'm not sure at the moment.

I get your point though; it's certainly not beautiful, and may be
difficult or impossible to maintain in general.

> This middle ground cannot be kept consistent. CCF assumes it knows the
> topology and computes rates from it, but the firmware makes the actual
> decisions. The DP clocks already show it: the tree can report a parent the
> hardware does not use, and .recalc_rate()/.determine_rate() can disagree
> with what CPM programmed.
> 
> I would advise to follow a model closer SCMI. What you are doing here looks
> a lot like it.
> (see drivers/firmware/arm_scmi/clock.c and drivers/clk/clk-scmi.c)
> 
>  - Put the LPCM service protocol (request word layout, dst_id, timeout,
>    error translation) in the CPM firmware/soc driver, behind a small API
>    shared by clk and reset. Philipp asked for the error helper on 6/9; the
>    whole request encoding is common, not just the errors.

I'll try to do some more sharing similar to what you're suggesting. But
full disclosure: the similarities are still somewhat rare in general.
Within a given service (so in this case, you're talking about
CPM_COMMON_LPCM_SERVICE, used by clock, reset, and *part* of pmdomain),
the protocol is largely shared.

But this series also touches CPM_COMMON_LPB_SERVICE (also in pmdomain)
and hints at some CPM_COMMON_PMIC_SERVICE support (RTC and PMIC); and
there are at least 5 more defined servies, as well as a few other
bespoke protocols. Those each have distinct request and response/status
encodings. (Unfortunately.)

So, I'll try to consolidate what I can, but it probably won't go super
far.

>  - Make the clock driver a thin CCF adapter: each CPM clock is an opaque
>    endpoint, and gate/rate requests go to the firmware. Get rates from the
>    firmware (round-rate op) instead of local tables. Model no topology the

As mentioned above, round-rate is a no-go :(

I also don't see any way to query firmware for supported rates. Off the
top of my head, the best I can come up with is sweeping through rates
on SET_RATE and guessing, until we find something that doesn't return
INVALID_ARGS...

>    kernel does not own. If parents must be exposed, the firmware should
>    describe them, as SCMI does, rather than the kernel hard-coding them.

I also do not think topology description is possible with any existing
firmware. I would think if we were revisiting how to do this more
sanely, it would make sense to stop exposing the topology at all, but
TBD.

Anyway, thanks for your thoughts. I'll see what I can do about
ROUND_RATE, but also am interested in your opinion on the best way
forward with the existing firmware API.

For some positive notes:

The vast majority of these clocks do not actually support multiple rates
(at least, not in the tables here), nor do they expose any topology. So
I think I can just remove their rate table, and only rely on
(1) GET_RATE or
(2) SET_RATE, which will only succeed if you get the exact supported rate.

On some other clocks that support multiple rates (e.g.,
HSIOS_MPHY_REF_TCX0_CLK), I don't believe we ever need clk_set_rate().
We only use clk_get_rate(). So, probably same story as the 1-rate
tables.

A few others (DSI0/DSI1) seem to never use any get/set_rate operations,
at least on any Pixel drivers. So that probably can also be omitted.

I think that _only_ leaves DP clocks.

All in all, maybe I can strip a lot of this down quite a bit, and work
on DP separately.

Brian
