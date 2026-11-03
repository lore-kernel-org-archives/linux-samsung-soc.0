Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726359;
	b=a4pQ/sl7MRUKYyfb7H1anDDT83p0/TNolkc7ZFmTZ/3AGkdV/mRX0vr3/Evv+at9qX0N
	 A2bpqN8U7h46Is+FjCilqHPPqFzhE9dQkpwAp+fSnCZMnK6qwMipc/nfQGt2D51RzTu4K
	 Mdzbz0BvAlT1FTna/HTlKX3OcfnpCaKTBTtrwRA/sp0gCY4qYXvv6OLILbX0Fstuv13ig
	 +5j5AAOWhWq3UYUDKk70gjHti2MtZi9uqFG9Jj77RIXtQlYK5mVZnHfExiJQW3k+pwYKc
	 33Ij8A8ZOyaIhVhWmLTEVlrX4uDZmkCwhQACkOUn8yZWzQwRY5+csRNU93l/5GbriRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=E1AIQqXxMElr9XYHIFcSfJejuF++6x4Nf+fj72eanNY=;
	b=B4S3jkr+wNQUvlr3nlP50SU8GobYLH5+scHrp2ZmGDIAfJHmBweYc5BrTqVB8eEJlKOw
	 ncVFHhaACQSz8/EVwReaRGd1mUoLm0FT7y8UWsZhQGMxdfoqSY28AZ29hysDYUocwbEPH
	 NZUn0vhy2mSeV5jxzenvnlyQQ4+tfNTJsIY2m1jVofvbLHtyjor81tyeovYQ2qJkl81A5
	 +/9gz54x1HXxRRafDNgN/tLpc3+CJ4BOSkBpP5N0e+M2PIyvyGzB4asCWYtBUbYaHc4m0
	 1Sg4dFC2DfQJbduuttPaojWCQ9khieIBXy3u2KjeeVUKheqL7B6CDl2dgFxFohO1Wgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="R/YhAD4c";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86E9606A32E
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2026 17:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D86E9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=R/YhAD4c
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so2436363f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Nov 2026 09:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793726356; x=1794331156; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E1AIQqXxMElr9XYHIFcSfJejuF++6x4Nf+fj72eanNY=;
        b=R/YhAD4cjF5HWZDS12Mmaz+AKtQwFDm5TTdP7WOfrT+BN86ErsKgMJuuD0p6wMvdgb
         uqWg9OIBWW/0jQlOjEM0nHsDOEJKBU8o+MrsPV8Vz862UFKNSEW/xRNOO8aCGJroh5fA
         KuX0NmF0thJd1pgxQzW3+xWBCAPflB3KiPmww8fLaPznA8ilgAyad4tCLgjsfN+etHaX
         HhvCLHebKXO5C2YdHrvuPZ/20HTlx6rRE1RcliE+Uyy3yrjmdv+ESzBlTiU4kGZbNpa2
         X8QEbssT0s+tVG+09Si8g+Ae5Jqrd8c4s9zoCAdw6JW1YaDGxc00om1YhvkHkUbMj0AK
         BG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726356; x=1794331156;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1AIQqXxMElr9XYHIFcSfJejuF++6x4Nf+fj72eanNY=;
        b=S4MJ7XdmAY8j4/3ZQp0WbNVQbGIDDREr6hUltRq/2CfTimogdl+Z/fxADHXdZwB48Y
         yiOfMjUES0r0nRjNmXsG1EeUfls2/RMcYHFYNSs4YKsOEa7azG0q3ElR7nycMrWinsqI
         3g8eDpyYZS/grK/ue7sLJlZfnIQuvNagJIakh7zI6QGjRiDrcY2kNByn0rxTQ6W8yn6g
         H26fVmjjyRfQZ7fjXaE8F/74CmwV3Cg0adXj6py3eWMsfVeWFAalyXUxRGoFMDTs+uR9
         zp5fXpthNa7ABorOaCw37rjhouokX1YooVgxNNjQjQft7rHmJcMeh/xejv/QLHNq8hQs
         td4w==
X-Forwarded-Encrypted: i=1; AKwUvByY5Khb++A2Eixk4xWtDxfuLohEHhe/lM/HggL91dRxwOVmAer400YHg/MJiP3QaFyJDbgGHdTh2t+HAky8H9cjLg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8lZ2NSF6Tevxr8ApjOBCBXGLEufRzSgwPz1Gn5/vqYoS0MASSd
	3O86JdigOX2lkJFrnKugKlgo2HHn2R/bMKZQPOT3K0PVzEnN/+TnxV/9c83pk0JGap0=
X-Gm-Gg: AYBFou3iQZWXu5UwS7T1JyqF77eHs78InG4LxOLw1tuUaURySDl/FzopY+ng8E9zTXT
	U8akI16RF2B76QRW2MLI7dk2hXaEk9s/4P61z6wlvqKp9P2EzLsK8RQk0aCJjHZczczdP0/VAD+
	zqOfR25srBHK2I8JF5NN75j3OpzjwQg/EcWTiTyVHr7UFnZuIP0N8Z+jjugY9zbsvMP0XVfCZhz
	/a0JdGrE63r5rISPWyrgpJTCjVbVNufIVBMnLvrRi0Fowuv5Krv+0yZwvtwlu5w3XbncMOQIfj3
	bL50NO7FtYFqvanxNf0CwDBlA5CiQchIF0tmxlZUuYhZCEs0IkuNMkhy5allgb0NQlH4GpSmSq5
	1dGi1KsKhnJ2b12vvgb1txd2XMw4aLUZ3MaJwHTzJkyNn4qd82+cyxzAYpq4t9NFsxUR8kS57S5
	7itzu+NZtk/m5y5/Kz6qWb0bp1Vw4jlNmgmqZ9CwMiZPiVJt46FHLPHhmWIKLZ3XYfCN4tLOUpz
	sMc3kqukALNppomf5FzVUQjhYja9jwzGh5o3X2iSNbuptsedDurM821tJqGyR37BifhVU8by/yy
	2jw16jgCkgzTDkOBVDcWfzAreXI7nJZF7JUInoH5xFfO09qp
X-Received: by 2002:a05:6000:4711:b0:48e:2371:3835 with SMTP id ffacd0b85a97d-48e6e309f7amr31462901f8f.51.1793726356301;
        Tue, 03 Nov 2026 09:19:16 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm27856601f8f.34.2026.11.03.09.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:19:15 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/9] clk: google: Add CPM clock driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
 linux-arm-kernel@lists.infradead.org, 
 Mariano Marciello <mmarciello@google.com>, 
 Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
 =?utf-8?q?Jakub_G=C5=82owacki?= <jglow@google.com>
In-Reply-To: <20261026144346.5.I82dc05365979021379fe730d6d52792a87ff15ed@changeid>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.5.I82dc05365979021379fe730d6d52792a87ff15ed@changeid>
Date: Tue, 03 Nov 2026 18:19:04 +0100
Message-Id: <179372634472.2573818.17532943286609086157.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2561; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=fqTcKnieuf7JekGsRwrFzLg18sNZNXRDB3ktfvrRuF8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmvxLvWxKwtTKye09bOcqL677Xz98LyWeKzJO0s975wd
 7Ja9XReRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbSsICR4VV9nuzFk3pBi2Zr
 S330mea5O3JtmtSmJXnzDHZHnFB9YMPIcPdp827jZbrejwUizdSOlxd4HP60etnkLR9Dtthb55w
 N4wMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Google Tensor SoCs (used on Pixel phones) manage many resources
> (including most clocks) using a Central Power Manager (CPM)
> co-processor. We communicate with CPM using mailboxes, abstracted in the
> cpm_request_client(), etc., API.
> 
> The clock tree is largely not represented fully by this driver, because
> CPM hides most of the divider, mux, and parent details, instead
> maintaining its own internal table of mappings for divider and mux
> values. The one exception is for some of the DPU clocks, where several
> clocks and dividers are exposed directly, and the firmware API works on
> divider values instead of clock rates. I attempt to represent this
> properly with dividers and parents, although I don't have the full
> display stack running to verify everything yet.
>

As you say, the clock tree is not fully represented here. Beyond that, CPM
owns the clocks themselves, as the driver acknowledges by setting
CLK_GET_RATE_NOCACHE.

The driver keeps a partial copy of CPM's state in the kernel:

- Rate tables below hard-code what the FW has (or should have) instead
  of rounding the rate, even though there seems to be a ROUND_RATE_OP_ID.

- kernel handles PLL parenting and divider math for the DP clocks, while the
  firmware can also switch them to what looks like the oscillator, out of
  the kernel's view. So the math is likely duplicated as well

This middle ground cannot be kept consistent. CCF assumes it knows the
topology and computes rates from it, but the firmware makes the actual
decisions. The DP clocks already show it: the tree can report a parent the
hardware does not use, and .recalc_rate()/.determine_rate() can disagree
with what CPM programmed.

I would advise to follow a model closer SCMI. What you are doing here looks
a lot like it.
(see drivers/firmware/arm_scmi/clock.c and drivers/clk/clk-scmi.c)

 - Put the LPCM service protocol (request word layout, dst_id, timeout,
   error translation) in the CPM firmware/soc driver, behind a small API
   shared by clk and reset. Philipp asked for the error helper on 6/9; the
   whole request encoding is common, not just the errors.

 - Make the clock driver a thin CCF adapter: each CPM clock is an opaque
   endpoint, and gate/rate requests go to the firmware. Get rates from the
   firmware (round-rate op) instead of local tables. Model no topology the
   kernel does not own. If parents must be exposed, the firmware should
   describe them, as SCMI does, rather than the kernel hard-coding them.

-- 
Jerome

