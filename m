Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795526381;
	b=WGDFfOSIz6bo/trdHAmnQSi4cUQIdnR+LvjzswAap13PUQh/+CPr8ydMKQvwlKMe+AFW
	 hem+GTJyaWt3B9actxqSq6fDHrYktyTLJvUeuFOBjxFPag81/CFYWQoWlsRiN1XB1qNuJ
	 T1k9hA44h7RLJhF7dFhSPg8SgOLIRZrO8k89yq0wh73hyHfViM9Kw6XqdqEHpFx5hJZt7
	 afWOcqu93fSfrWgWZZCzBH+Cxjv1a0ucGrULMuz40brdH4lKLBapDEUi0tzpHVDZHjhCn
	 xJ77H4nWio8lITG1zy5PCWq8jTDPBZRD8S2olmy6HkGZIa+rrFeCyS16mqDBrYXhVJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
	b=ERuAr4A9bvUZ5mFxJ4kZymmBakJ1utIjG3vV0C/ExOjXOmlnpqbTeQVC1daQnHSvRN0Y
	 79WN+Wqp9i0c2f1a4DMJzDUuelUmwNboqtTRDGpLs6kuxCx7dr52HITSCUtygYCqTggnp
	 9iYIfPmkSNlogD3eZUFGhyf7ql1kzyISZ4WVxQCHMroQ7CeiIzKpZMT/L0EBif0zqB691
	 Lh4j4HjaQLehA55dzcvXKcwEScti35nAaVpj3bMPGE+ZY+0D+H2QDqyIsQ3MZBn9etsTH
	 za36zdVdrNqXxRs59PemObZdEHUdiJknnzxnPfgPlzMQRuREt0Yh0eZaxbwznb/voDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eBYWubu2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148B3606A322
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Nov 2026 13:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 148B3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eBYWubu2
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso5186932a12.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Nov 2026 05:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795526378; cv=none;
        d=google.com; s=arc-20260327;
        b=qgQqSYknzxW6GBJXkrZgofQGZT730liTWHF0wmOPw6f/kEGjfJgcA3xAP3Cg/vFf3H
         usap+AwmcSQFHT3b+IsrIOj9qLcWB7Aabk9vSpttkc+ILz+Uu27A8DJzWITKxNZSdFZs
         3RPHe/Uzjt5UntvKJ35j1UrQoWWRBIk60dpb+pwuUe3RLq5uHb6b+HO5UYOy2IdBLEHD
         BfYXzAfCQs2EQsm32f2as3TQHLNh7D53sUMpIt183dLYMa6cSdtyaMpmfZubDBBAIim1
         I37tzzILVFS365JoqKdQ7oMPEKO3WMunpuudKGCA15sJbJDNdyrsU4324f9s6taP/FcT
         j/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
        fh=UFqrd12Lcyq6HNdX+7CzH5K98bAew7YU08EaogCVQO8=;
        b=p1CJhoNQDmei2TfsFm949fgXS37n599pB/ilbM+Cs7092D67+ggtMtgSpzp8widA/h
         aZcwUUOlGrFKrAZx84MQX8ouIWBfV/W4BOk60q58AR/A7KjbOcyVJW3Tx186rOqq255z
         2/PZpAMBdl2VSntxyS5ClTMbGLh1DEVQW5vI6pABLZPbYSr3YbNZx5JJG4itzIE0+Jtm
         oZM1DEKfECxAklQHhLcJfNStXMxp6FF2BT/LgeVEE5uixvFhjySjVKY7jOBiMxSIVBm1
         1u0DSI0CXGrwRvkpy3Jbu1/n1WNL8jYUuDDTzXPu9DAYtw+cco++xAJSI1Hf1Qhqxglq
         ZVEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795526378; x=1796131178; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
        b=eBYWubu2GiEXhpZu6NdOBq+vSwbV2FWVHzzO6RCiBLF3DvcP2g1JrmnU+BQv3R0zGN
         kvvTgrQIAxANAxro5Oi4eaxN11YT4WSo0OGv3sRSFgIFtpq2En16+JONirIcUEETALNQ
         lRVCNoT0kNT2qPFD2IWuVCxhrYBnh5jAlemWaTyIE7hEjR7KV8NybKjN0kUWJdA+sB4w
         QCdLvsMub7B5jXdqoCYHrijtJ+6czKn3vhUqvkpfWmPyXwN3GWPgW6exGBFya7/YtS85
         mfcSZbYjUeSYDWzqhY5Mvgb5gdQiAC4XUEToNNz56GmU6lGixrXnDd5LM/7NDwcPiHOn
         69aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526378; x=1796131178;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
        b=Ivrk9Hi1Kj26AUQam+4tyoGR1ISbFx2Ajuca7/nmkpEGF9Xh/SqC8Rheg7vBtoDhpc
         H7LwbF4OodV4q726bYVAL/PqYZnsrvRo70ZmwU6bYKejf9oWXYlfxtW4UfNYBiOHd7HX
         yOGHor6qylffnLeHNmZ0OTU6TbzpFsr8cPpssN2OAN9WLfLJ7eEA7qs3pboBiqySmqcP
         1da6q0awZn2m2hG0gq4rKgatNTSdJdTf+BNFNjcmxHpLo3KiyNpJ609bN+VxiifIccB8
         NgbSxPhoBCImpg9lxceUiyIPJAWut1yBui8JcHo1lKUPl3U4JVMpzhPXkI9qgDxegCTD
         kadA==
X-Forwarded-Encrypted: i=1; AL+hErGgsZc05EqOJUEKN927X38OzcJJwpRmFqSByarYgAp+AjB5QCPunoIlejhruduWAW61UIc3NPzTlW55Si/7GOlvOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/FN/P9VNmza958jKk4yQqCZioB1xslkHCkl3PK6d3DHevt/+h0
	sPsgzJ3Gy+6vog4JbZx19uizxOGGNaYu3jj/ck4zQcOP6eRTsatHUDPMKVEQku7ybiCjSb1NZwZ
	gFwbiSbxTVEWNfF9RkHrdILps5jFmckMmMa4cXTjrBA==
X-Gm-Gg: AZFdTZfyyouVmaa3JWeDLOiLlDYf4vvYAWuFdh2o/WjiMRCbYQcwS8NicTDQAdftuXD
	FHJ86zdBYhK56tAq0qErpJPlV/c96oOpvhljnHEqbPchvgKlVCaI8rnVdjkvGbCoZxJxkK0CIe5
	tI236vLN4w8SV3/yq7qcQX1R0rmKt78XbuGEs08QOtao6T6mZMyadS+2JUR2tr9aUvo0ZFailIG
	nXoYf0oAS6emoKGUgMUjydlVRmorZ8FvH1+l2/Gpjs7U85LVRY38W65Kt1NNnlfAWDuEOu1X54X
	N9SEsFx31keRiLebFumesz03Mcs6OnT2U+c2KfY7mJNQL4ng6MgJloT5QZ/+3Q8Wy6YeU10hm1f
	UqP3o1Pcwqdqjr/dtIhuX9nEyufe7jQvgsfLiCqo3Zdu5LC3oz8y8tRDg
X-Received: by 2002:a05:6402:1596:b0:6bb:6c8:c4d2 with SMTP id
 4fb4d7f45d1cf-6bb06c8ce30mr940474a12.31.1795526378188; Tue, 24 Nov 2026
 05:19:38 -0800 (PST)
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
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 24 Nov 2026 13:19:24 +0000
X-Gm-Features: Aa3M54ooVkb3f-H5oJfKOqKUsi4VT1Jkh00xU7wD3yuOn0cj9WC5t6c3w4KgoWc
Message-ID: <CADrjBPojS5tSJw+7E99AYec6NY46QLcM6iv=i3xodNJvvxKJRg@mail.gmail.com>
Subject: Re: [PATCH 0/9] google: Add support for Laguna CPM
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

On Mon, 26 Oct 2026 at 21:45, Brian Norris <briannorris@chromium.org> wrote:
>
> The Central Power Manager (CPM) is a co-processor on the Google Tensor
> SoCs, as used on Pixel phones. CPM supports power-management and a
> number of other features.
>
> The Application Processor communicates with CPM over a pair of mailbox
> channels. CPM provides clock, power-domain, reset, and interrupt
> services.
>
> This series adds device tree bindings, DTS, and drivers to support CPM,
> and several of the basic services provided by CPM. These services are a
> minimal set needed to bootstrap many other components on the SoC --
> e.g., I have a working proof-of-concept PCIe driver running on top of
> this series + pinctrl (not included here). CPM provides some other
> components not yet included in this series (e.g., PMIC, RTC).
>
> This series depends on the bindings and mailbox-payload-definitions from
> this series:
>
>   https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
>   [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver
>
> So this series cannot be applied as-is yet. However, v1 of that series
> was under review for about 3 months, so I'd like to at least:
>
>   1) demonstrate its clients (this came up at
>      https://lore.kernel.org/all/CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com/,
>      for one); and
>
>   2) start review for anything that isn't significantly impacted by
>      potential changes in the above mailbox series.
>
> With luck, the general design and DT bindings don't need to change, but
> even if so, I expect any changes should not significantly affect:
>
>  (a) the CPM DT binding or DTS (apart from #mbox-cells)
>
>  (b) the CPM interface (cpm_request_client(), cpm_send_message())
>
>  (c) any of the CPM clients (irqchip, reset, clk, pmdomain)
>
> Thus, I think this falls somewhere between "PATCH" and "RFC".
>
> This series has been tested on a Pixel 10 Pro XL (a.k.a., Mustang) both
> as-is (plus the aforementioned mailbox patches), and also with minimal
> additional local patches to get other components running on top
> (pinctrl, PCIe, RTC), to prove out some more realistic use cases.
>
> - Brian

FWIW, I tested this series, plus Doug's mailbox series on my Blazer
and Frankel devices. It was enough to see USB come to life as a gadget
using the already in-tree tensor USB glue and phy drivers (see patch
here https://gitlab.com/LinaroLtd/googlelt/linuxlt/-/commit/b7866f74743fd6828036bae570ca6d022e23c4ff)

Tested-by: Peter Griffin <peter.griffin@linaro.org> (Blazer/Frankel)

Regarding merging the dts/dtsi (arch/arm64/boot/dts/google) and
(drivers/soc/google) parts can go via my Tensor SoC tree. We will
likely need an immutable branch for driver/soc/google part to base the
other drivers off.

regards,

Peter
