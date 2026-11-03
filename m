Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793673383;
	b=bcwApTVtPiw9JEndj+eyAJqrVn1WZ0hkmvGL+vIGKPRqt9DYE3TWoK/lUHfzDSAQSbWo
	 9i67Q9fKurF4Q2oshSb67EzQtafJ50Zkanu0m0ewltci+g6ctOG+/s33zdU9wVluL09Sj
	 weQOL3q4bh8qa58Zuad/rXZwZDGmaU7p0W3Rajxd9V6EZCIZMmGlo+mdHKK+TXbBYR6E1
	 +HFVrYgTXzuq/AM2cwM5gqxqeItf9FENtkM70QjkvUmeg5hqOjb4FmggcL0G5pC9N0M5h
	 3Oiu31MSlJsBMIE32z06PJ5BVIbxY8xkvjwripGY7/uOXt5GoGkELP5y7IB5IwEIpSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9Jlikt+rNAof8xPAw+Y9FynKuu4c36ojLvpof3Ekays=;
	b=VVb8UY0WHrfHblpAbNB2KmLk7KlBW9s1rWWvNZAwXaMof9zmFjyB87M012YZur5NsA2U
	 ITXhJWRUNlDBMHDdb2rrAB7Ol5soz71YuUg/jWQwNqLb6wSmovgBCDv6lHDICCUu13dYk
	 VIPoprRYzAw9wmvpIo1LunFpSnQGNg1ksFThVV3Mgs3sIjOAICI0zudkgse6pWW4XJR32
	 /L/EruZwjm9vXnerJie1SVlqTON2Mykoi7etkDzEHg9DEMmnGgYkXUZXJYDmbL+BJzVek
	 jNxp0FAJyE0rkkGhnbbfQlVRuclIckW3NXATDRo2PCAyCYZv0vKZso9rDLvHV0jGovw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a4TvgsYw;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D37A606A32C
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2026 02:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D37A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a4TvgsYw
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so5117224c88.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2026 18:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793673381; x=1794278181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Jlikt+rNAof8xPAw+Y9FynKuu4c36ojLvpof3Ekays=;
        b=a4TvgsYwUyyS0K9tedfdNHQcVmmTszna7pZdCPWDEUtUfS8eazt+3tw7+E0fRMUfaS
         fbpUnYPgGgifY/ZvHRVF5OLPg2c30UiopXSfMUiyig6a/tRPEeKoYjvQSV6xLBEBDqii
         FCwYWgrkpqBCRUi49rZFN8p0cYjDCfC5cmtpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673381; x=1794278181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Jlikt+rNAof8xPAw+Y9FynKuu4c36ojLvpof3Ekays=;
        b=MNYeS/tHAM7bsAY96dKSwER61aEoSg62uWfuuLYy/HO/dECptz210sWhfCha/aH7NN
         uDn53n4ugpUGd8rxPdTJTzuYfzOvrJsOwea4lXFaKcTWo/M55wPqM3UD34PKLLAjdjVy
         QxHCLXvKIizs6cas6ILJxPO1+KhIspqSNkutqx4BeBzMAu20x6plfQVRm1JhEJO/YXXG
         n3MoAfru0T+LqacGRaog8IKYcXFwF3VynN4TB6CwCTMs2JSpuoI2jzy8XZx6QLzSOpC+
         XiGjK921bWMe8jWu35ATxzcTuKV91G0pgDlIpST/78VUJn8mz91Q/MFbH9715heq/FXA
         ArzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzngW1GzNd2cjNalAG3G9LqW28h8qtDTeZ5B6UsCMUaqAYz9eiUwrnfI7/66x1MADsjqiooVt7aBRL5R03WRurkTA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIofVytILDp7mq0R92UUgev7VtzTauZNvpzjNNIoYAluV882fP0
	lC4nrSI/dBV2c419/CgefZ+FdBk5QQPPMrrdI8i0oA/a3F23ZnEEn01mRMxtwrbYUg==
X-Gm-Gg: AYBFou2hv1vUxU4WliA7XuHdelTRyQ2T8YhcHGmVNQfgGsK4KP2Rmf2Jqp0SseCHe4c
	BRDuJFRtuehcYDMiOh4yIGJ2NUbwsVOsW6AWONLmEA+Es4e1rViz3GknVgMjCNfqXIQYmsirhtg
	WKDaYRsRKHp4AWwvFYLA9Z7n5bcZ+c4dMInFYNleckZDTo6s7hF9nZKaq9rrDS8Qki1fsi4++Qc
	mg6mnZPL86JB3Vf82K+6lK53Bsf0aC+/LxuiFrikzfvSfg6H2wGSFioqSziqPPJIWj3uLypTW/+
	+6biVugdctUgITzTtpU8iJ0drWHhdfNwc4z3pvQr3/iCXidTRqkrxb8Y2kCHccEoozY634505sW
	/O1ol7jSHIHTmKk+EuHNNI5y44GTtsx1QNRlReAZ8fCqJqzakD9oeomsg8O3BMP4X5lTkWnETTY
	fhDjaC43fKcmOvvkH4KlAgwfaK8K/U5PInyq7+ZX3W+esxHkxoeYzrKvLgeixH80Js3aP6Ke/vc
	NcUzilFEIcMT97I0TTz7TfiVz9UerMk88kTm+0oXKgJZaGGIODEkytZXyXT6Jc/Eg+uN+to4PKZ
	kksuAhvSOR85WnWIgxtiJrTf5OQIhTt66FcK4+xtP1hZfrJk/oCzu5SnBpFPtGHPAaA=
X-Received: by 2002:a05:7022:1110:b0:14d:c9e:a356 with SMTP id a92af1059eb24-1ac59dd07f5mr17524614c88.12.1793673381373;
        Mon, 02 Nov 2026 18:36:21 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1ac1abcd6f1sm37000499c88.20.2026.11.02.18.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 18:36:20 -0800 (PST)
Date: Mon, 2 Nov 2026 18:36:18 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Subject: Re: [PATCH 2/9] dt-bindings: soc: google: Add Google Tensor CPM
 binding
Message-ID: <aulIoq2oVjJ3DVzL@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll>
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
In-Reply-To: <20261028-rapid-daffodil-rat-0adc6a@quoll>

On Wed, Oct 28, 2026 at 02:19:23PM +0100, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 02:43:40PM -0700, Brian Norris wrote:

> > --- /dev/null
> > +++ b/include/dt-bindings/interrupt-controller/irq-cpm-google.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * This header provides constants for CPM IRQ.
> > + *
> > + * Copyright 2025-2026 Google LLC
> > + *
> > + */
> > +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> > +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> > +
> > +#define CPM_IRQ_RTC_ALARM_NO			0
> 
> Keep naming consistent. Clocks has _CLK suffix, so this should not use
> prefix.
> 
> 
> > +#define CPM_IRQ_AOC_MIN				7
> 
> Anyway, ABI constants should be indexed from 0 and incremented by 1.

What do you mean by this? Do I need to make up names for the
unused IDs between 0 and 7? On an initial search, I don't believe they
have any meaning at all. Does that mean I should make up some kind of
"RESERVED_<N>" naming here?

Between 7 and 156, these are just ... 150 different "service numbers"
within the AOC (Always On Connectivity) subsystem. I can name them
AOC_0, AOC_1, ... AOC_149 if that helps.

Or are you suggesting that I pack the actual use cases (so, 0 and 7-157)
into 0-151? I thought it was valuable to directly use the firmware
indexing where possible; if I change those, then the indexing loses its
inherent meaning, and we also have to add another layer of translation.

> > +#define CPM_IRQ_AOC_MAX				156
> > +#define CPM_IRQ_AP_GDMC_WAKE			157
> > +
> > +#endif  /* _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H */


> > --- /dev/null
> > +++ b/include/dt-bindings/soc/google,lga-lpcm.h
> > @@ -0,0 +1,54 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +
> > +#ifndef __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> > +#define __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> > +
> > +/*
> > + * LPCM IDs of each SSWRP.
> > + */
> > +#define LGA_LPCM_CPM			0
> 
> What are all these?

The binding doc says:

      Each reset is specified by an LPCM ID (cell 1) and a reset ID (cell 2).
      See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
      <dt-bindings/reset/google,lga-cpm-reset.h> for reset IDs.

and

      Each clock is specified by an LPCM ID (cell 1) and a clock ID (cell
      2). See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
      <dt-bindings/clock/google,lga-cpm.h> for clock IDs.

These are the IDs used in the firmware interface to talk about these
things, as many of the SoC resources involved (clocks, resets, power
domains) are grouped in this way (by subsystem (SSWRP / LPCM), and then
with indexing within each subsystem).

In reading again, I see that the definitions and explanation of these
terms and the SoC organization are split a bit between the pmdomain
commit message and the binding doc. Where would you prefer I elaborate
more? In the binding doc, the comments here, or both?

Or are you suggesting these IDs should be allocated/structured
differently?

Brian

> Best regards,
> Krzysztof
