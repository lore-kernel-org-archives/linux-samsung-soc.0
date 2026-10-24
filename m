Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829818;
	b=Msy7OrqmlhT8G0ckVovCKneAQcEVOXWTgF3WX0NW3df2Psm02rVEbRcrM/xBc5Ga8WWU
	 1m2GxbTlfX46N06PFkErWWT7+ESshDZCgalBa04wU030wtkYpplXqSsph95M51chswuds
	 hhNFgr7BhldJSNEhOhRcFQQk2EAFlFaUx5vmOkGolvMFUZO4IveRddw0HGz4HfhKyzKf/
	 KIvf+U32Mle2rgKNjvO7+rv+KRks+zkH40+6q4me2VkMR4p/z1qYDsNNgF5lDqJR61PXr
	 RWPrXuZiM673UzGKTNKqZ6FDa761C59Y3HbgponohEBqU/YCy1uECVBiOL2zT/DMlSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
	b=R6EIsbksR0lEgcnvEqOuU3k9e5JtHi/onDoIRB9aChpvvfEjCg+ZC7OrVRjLreLj8ghn
	 0T43QjMs5OzjKD15jgik62SwjEn2oRxi/10j05jlE8MyWEYsjjzDMzuaoc1WfVeKGb1aj
	 xHy7nDOr88wO3xiC/cuJGs3cZy7GXPcGanf14QQbdoFAjFGXkfPhcR7roQnOhec+Ovuzx
	 BvgudhgnLrz7FG0jYuqBVgU4BZ28l0aLaH3DMTa16XvQ8L2t+wHpet8ZOs+3GfhV/jp69
	 mNRVpJ1IsSUxE912OClksuBUtzRpUctoXgl7MY1AizXoFvMIuMCUXifMLdd6c8PxvSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J7SknmwT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D580606A31D
	for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Oct 2026 08:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D580606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J7SknmwT
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so226355166b.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Oct 2026 01:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829816; cv=none;
        d=google.com; s=arc-20260327;
        b=KVPKhYE3zeFIeUDSkRq5awCE1rxZscJrDY4BTnK5oB96MQPhq019aX7V+phs/N16+7
         nj21xrg/SMF2z5RpYetvt/1D++3yVLAUgRuOJOdUaYddzfFYZRyy3mmS4U9jtcz43vyR
         Ugt/m+VRbwdhLKxUOwz/PVbQjsmEHDsDxAPpbs06szW8DmpegQFHlxUg5CEaNBqbpsJD
         jAiyWSR5YbXlekYd8lz2b0CqWz+R7xpLr29F308gdypc/rq7NIxglx8ZxAjXe0OmJa7j
         2DH8LTyr94snC26oX1cPQ1VHv4gAAG/upEYdRY+CbpbS/dwYQsmHmNX3zLG892uVNJ6T
         +Skg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        fh=55p6qdPmICDQgKaJQROzU+aPigByeAm1lH0gEZbP6Is=;
        b=hCDlCd0iN2Ajd2T//JH+MaAGHmiivDpAK4i4AHroXaKVLeIz/1Piq7nvYSpyqgbHSH
         FmYWUrOTwD9yfdXjZTeIdCUgE/ftI2VVzXvKi7snIp1axHAivqB6TowjpmqJ0JN4wS36
         c05gEY9nwwN4USIzokkyNWLWKSuzO5GdFZM5TYzpjnFn9dAuWgPT0qJph/6Qx6ikYKt4
         KnxqaCQYpgHpZBndeXmngj0iXEywrBwVdvqOQc7hUlSMkMjFPpwLqOifLdMCIv5x5dHK
         3WshLTxANVBMzMOJECOBA4KUXY6ZQ+v4bv6WBM4NqP5WGehD2LDiTeozZiAn2ewJd0Fg
         w+1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829816; x=1793434616; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        b=J7SknmwTTzL7ECy7vAoxuDafrONez3XeCWql0X/0YXhgvAQE2BfBECDlTFWueGZ8Jh
         klrfah4NQphtxV5+spcx32j1zY8Lj6vh+cJFzrPDn1Ptw8VqQ53UpyioqrJd6EaGMvWO
         eSd9MJuHBLn7s+f0x+KjG9NHtf+4lfLEvhiOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829816; x=1793434616;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        b=VscsGBZmbPYW/ceDY/XblEBbPzkt8SsbLtLg1nsk1IjLGIXnyHvCPdDfj1VTv6cxCp
         xzlnnp+T4FO+Xta7LewEC1pFMWbyM+J5Oj1hTKZKZM3A6cjsBG513jL6v7KQf0aydOVU
         0V3iwdiDImareWEpbpQg7rUZTHCkVA8tprRJVDkmS5MYUl9+1niu5s90ZaWXqECSPK5r
         uNbShBtg9ABogkW5wzwyVH2u4KFeofpO7B6gyYlEYiLEGJyBdvuL1TjEjgqCH3SEEnrZ
         fxDMgn9nR1/1EJqskjryTa0y37bUujB0oyY8czUQ0RP3TVJwwpLpXSJ9Fv6tA+mj0kF1
         9b2g==
X-Forwarded-Encrypted: i=1; AKwUvBy9b0BTOp+sg5j8Lw80k+JAydioaG+GvU+tPM06C/qybRfIYutRcytnrbw439IZdOoqLWSVp3IKzrxX0LweA5os0A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLFfz1Mo5mGG4dmGXrka6YfNp2gjQcdwcZU4J4mPjdtS4+EN9dF
	1kXnVlCFTSXVBKqsR23zznWFkEIxd07VQm5MbZBRWzaqK2jAFrS0d1Kbtx3zfjlqSKmQQ8XiJAX
	b9pN1uXfRMuzEFU5wsoE/VbACldod4aWf0nCMws/a
X-Gm-Gg: AYBFou0c3CSjUYnJru4kFBL2n416dMVIdMYf1xQjjdDCzgSLj69AcdT6ct0aBMgXmAX
	dOmCScEWh2+WMJevbdkaWV1J5t/0IP5hIQER6iULzjjjESlR133vbVKHsdogt38Aq4mfHclxqs+
	PCS5XRey+/gTNe5/vD4kdRiXHqQW1BIvKyShO442KmWLCNfa55skI6/HADm6EJvuLL0CNfYG5GZ
	+Uhlt8m0YtGlkI+PRVgwMMSCF185t3t6Aa9cYn0AyG1OIYxN0WooqUz6ZGOU4pl4osBO8D3B82+
	m6o91ZqAlNrcujDMi4SqnRW4t+eXagfHgue4loeDvhT8kNVyAM6pRjKnG4Xt3V6QEs0K9nmk3b3
	+mmluRkpb/Twlpc136keqH706oYIoFl1p6xU=
X-Received: by 2002:a17:906:9f84:b0:c44:494:692b with SMTP id
 a640c23a62f3a-c46bde198e0mr151110066b.22.1792829815874; Sat, 24 Oct 2026
 01:16:55 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:54 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:49 -0700
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:16:54 -0700
X-Gm-Features: AclHuK_VJyuusU7nyQWEvJVdBRj5rBge31M7RaY0GTXZjSe04p7xrEJjqvNNRK4
Message-ID: <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug!

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:

> 1. It uses a checked-in .its script to associate metadata with each
>    board's devicetree. Other tools can parse this metadata in order to
>    craft a package that the Pixel bootloader can understand.

One thing I'd like to check before this goes further. In lga.its the
metadata is a string packed into the configuration description
(board_id=...,board_rev=...,soc_id=...,soc_rev=...). The FIT spec
treats 'description' as human-readable text, so this turns a
free-form, undocumented string into an ABI that bootloaders and
packaging tools must parse. I'd much prefer proper properties in the
configuration node, defined in the FIT spec [1], so that every tool
can rely on the same names and types. I'm happy to help get that into
the spec. What do you think?

> How does this series help us?

The FIT_ITS path is a second way to build image.fit alongside
make_fit.py, and much of it repeats what make_fit.py already does: it
puts the root compatible from each DTB into the configuration and
compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
/incbin/ paths and a shell loop in Makefile.lib to do the same for a
hand-written .its file, and the .its files repeat the DTB lists from
the Makefiles. Have you thought about extending make_fit.py to take
the per-board metadata (e.g. from a small file next to the DTs, or via
FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
logic, and trogdor would come almost for free.

The new FIT_ITS, FIT_FACTOR_DTBS and FDTFACTOR_ARGS variables aren't
documented anywhere, including the image.fit entry in the arm64 'make
help' output. Please can you add something, perhaps alongside wherever
FIT_DECOMPOSE_DTBS ends up being described.

[1] https://github.com/open-source-firmware/flat-image-tree

Regards,
Simon
