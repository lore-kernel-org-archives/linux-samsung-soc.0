Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793561696;
	b=4FsZNxYR1SCjZEoU/VznR/pNBE7KBbzJAFQIZHjmexEqJYQzPVXZihafhFccgOCeAuJs
	 8Yr8s270eOTbbBqfjpRS94ZklTYvxgq7c9xOuoMXN0itonb9bGwFzKvUx/s/4gDWUYE+x
	 CjXqWPYy21Rl6VXBB7EE7JrIYNXy5HLR3GGdukqBVjaSqupF0eIJMsZKZ77N8w75t7yB7
	 v5gKAURHrhuAY0bOKlRlJQ3A2m3zFJ+WLyg9da+ZqEuoTWAWhegM7wqP9+fW+15seBnjf
	 EhekUjOttj4XRyv1o1RnoQ4eitHis5WzNSUdgsC+0zyOjTLM+p0uutuH1Mg7/bwoFYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:from:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
	b=w+s4JhoMTgyyekNNGIuaMd/h3wmqiPlNgn1vSYqxYzKPbNTjH3R6yzZbwC2lj0whsq/i
	 y43fgC9/mknFJXRVLiX9M6CFAYg/onMMoiKAiatlhe1O4U9jzZDQQCtXtEMnN5vHiKkrY
	 +uUb2PeIv1wnFSpQ6uhY6lqbB/KO9DADcwjUhI5fKJ4vGYllItHoBHD6qu9ZBiuF6SjSM
	 3FPbaoC00Dc/nXvELw7hYOzLSRxLfmNE6HTHSaqRlLiUyLlbkHaETtkT8xWy9DpSjBTyV
	 R+JyejObutoxhln9n0QKUdVazXIUyA8zARPWlDJbCjYN/4f2zXTmHuL9DoChtwSViwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Lfqcc5GG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4172606A329
	for <linux-samsung-soc@vger.kernel.org>; Sun,  1 Nov 2026 19:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4172606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Lfqcc5GG
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so3192932a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Nov 2026 11:34:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793561694; cv=none;
        d=google.com; s=arc-20260327;
        b=OL8mmZrB/5BwwJ58LV7iTOPqLCniNiO4kGfFcezUtLWjazAecEvSEjAcfMPTN+/Oin
         SbbQ8DdhxmnyJsvP2vVGVMNKxs9JQg2G6ejx3W3A3h8zumbE77fhoMBFj9y1C++PJoSL
         bBRMfB1xt9w7cqMRYbOYapjiFJV+LmL5KQQkXsSruV+MOlU719JhXAlNOV9K9cX05i8k
         eP+DKGG1CXE0ww35dXckHwwMY4uNC44t/g+0k6lLqsMHkjREiI0ct4ytwo2//HXNcJf6
         3AHYug/WsdsE2kimnJDJEqkKBcDrfmnapVqJ4GS2g8M5nddn9LL8xSxL/ZZCzuobtY6t
         IRCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        fh=0avlaGVCfai4Ps83I4pNskedo8enTFX56Z+/9Dwnlm4=;
        b=e5tknBD7UcPgYwLRdWcc8v3NZmNSuGoSIpPkz1kbvQaPSMNd5GW99Jmvzi/TSG1t2i
         Z6z4pKQ9nKGwN1ak2FZDK4l17kW/v1VVN/0hL9O3UsGNF+YQzrdMHBnuB2MACPnQpjtY
         HMZU+XjoDxsAXxo0y5BrZyYoSimWkDW1qmFvuScWLfWQKZDw6lve0OivIgiJsH9ujj4P
         wK+/pcDiAvr/WV1Eo3lr5Jcboa3ou+QpJyep+QnulAtNECdjg2PQEEM195zznHcNnck1
         eOVSwT4nNBAwOJTPGYeooBCV6GPVrIObKlNjd6wfmu5rSlpZ1QSNYtTTlTSz7fyVwfrU
         Chig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793561694; x=1794166494; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        b=Lfqcc5GG/SwjR7rhF6i9wN+51zewpGS58ukrmB9LGRdbbpKdip3M+YroJNl6U5AaZ4
         rF//L/DV6VSxmy/1UQsFeJhmoDWwkPFReDLBiC+oRpU55av1FrMnZVBw20fY7l4UynL3
         HVfRKiNvpd9FUkbDQyR76hW+g1Owj32N3MUEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561694; x=1794166494;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        b=L+3RfUAo47vNy4hUVWpO4tfu0GbExGNHKvAf+OdPWWevZIOAfQ3EjqXEFD7tZbz49t
         czoLSvaKr17mbTyr8tbc7YXdFN/P/mAPWUMOwnpMUbMNniSNl8aeFjbav9oTlMoW1eY3
         ZOdMhH8zCB+bE3ZeI3kaQQcWCew1iSghAj65XAQ1OxRJrx8NiQ34i/5D5EXg5BDyNuHZ
         agD282273THwluKunZmHPWwjYrMDujB7YARFtV/leifYuGL/c6EgkyOUkfXgsE/ty2v1
         MYiI4mcGsZMwAnEWTmf/kXETZi0QaMAj+lqvXsvLK+6JbglHCqS1LU502ZiSr5rL3Aej
         zpiQ==
X-Forwarded-Encrypted: i=1; AKwUvBywuYdNtXHYFFqFCl70B7MlfoA1cL7ng5kgNgT4xHzUgM5b5xccAm+qJ+hBUoBgHTM3sqQ8ZwirQx0Q5IBi6D1yVQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8OSTBOeahonYUnfFyaRCQeoItzSFV3ui74oUPLOAUfodmDkRso
	PaWX8gfeatHP5ISxTOmEovsGk9SA6suEF78/ib+3YpvHNqJMCzus3m0hVT+GWVYKe5QqlF+Yt/x
	9QpqE8mgYUK6d1U92WEiwlVEzoh+8y0u4z3TiK+o7
X-Gm-Gg: AYBFou102Y/kUjLskwZ9DB6IIDVZb5khA0UeIgBIEYoKg4PyB7i+3nfg7M5vIRaWIWl
	sAexCWanXJyBKta3PwXE8c9Et3+/eqp2ci6ElZEFbuD5BOnm9+PhSunG94Ftq4EphC2VP7KxaUF
	WQ62nOTu+klGYqe5dGpQpNJMKg23XWRPiX8xC3BAKRHiG9MZi4XigeTHuYfPghi6EEqiScptANV
	YxQw5fggGiYqIRnhTiaeiDkQI+prUzRvRIjnAhB7sy/EpH3FxOKclhwwg29V2BLg/VXIYqJ7Ndz
	sNTxpzQzqENI46NFnbpkffa5b5/AeNic3cAZB0qKDDsjlj4/Pp2yWH/jb5wrRFd6ihSEFPDZLAg
	BbFk1PDRikqmkTD3PTz5EpgtgCoUJZDpiuwKiqaa8ywXfZ560oa0ZMVeMh2gBdbOEy2JWgF+T
X-Received: by 2002:aa7:da45:0:b0:6b3:e89b:128f with SMTP id
 4fb4d7f45d1cf-6b4d4d6d938mr4052419a12.9.1793561694122; Sun, 01 Nov 2026
 11:34:54 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 11:34:51 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 11:34:38 -0800
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
from: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com> <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
Date: Sun, 1 Nov 2026 11:34:51 -0800
X-Gm-Features: AclHuK-OENc2MfogrHTK6nr_VXdYPKQaHTgRVjZY6Us3vAfjaHxM1Qejmm0CbCs
Message-ID: <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Doug Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
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

Hi Doug,

Doug Anderson <dianders@chromium.org> wrote:

> Putting the metadata in the configuration's `description` property came
> out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
> already uses configuration descriptions for similar board matching).

Thanks for the background. The Xilinx case is a bit different, though:
the same project writes the string (the binman .dts) and parses it
(board.c), so it can change both sides together. Here the kernel would
write the string and the Pixel bootloader and outside packaging tools
would parse it. That makes it a cross-project ABI, and I'd rather that
ABI were typed properties than an unwritten string format.

> The proposal I've tried to push a few times is that it's OK that
> different loaders have different types of information available
> to them, but people don't like that. They want a universal standard,
> which nobody can come up with.

I agree with you here. We don't need a universal set. I've sent a
proposed spec change [1] which lets a configuration node hold one or
more match sub-nodes. Each one names its scheme with a vendor-prefixed
compatible string and carries the properties that scheme defines, for
example:

    conf-1 {
        compatible = "google,lga-...";
        ...
        match-1 {
            compatible = "google,board-id";
            board-id = <...>;
            board-rev = <...>;
            soc-id = <...>;
            soc-rev = <...>;
        };
    };

Trogdor would use its own scheme (board name as a string, rev and SKU
as u32), and Michal's loader could do the same. Each loader still gets
what it needs, the types are explicit, and nobody has to parse
'description'. Please can you take a look and comment there? If it
works for you, you can point to it in v2.

> Should I give it a shot for v2?

Yes please. The DTB list already reaches make_fit.py from the Makefile
through the @file argument, so the new file only has to say which DTBs
to include and what metadata each one gets. We'll need a simple
per-platform file next to the .dts files, passed with a new option
through FIT_EXTRA_ARGS

Running fdtfactor can then be another make_fit.py option, like --decompose-dtbs

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66

Regards,
Simon
