Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C183859DF
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772180232; cv=none; b=n23bXDCFOXU0LqdV9XpF1RvK1ulfVhEHTVxWjzj2DRosH05z2P/hUcVhbmfBl4Ld1oBWxkCXroSpSI923UqqZzWeFFaScuAc5R/xbbTZ3zI8j6hOw8HHwsCr54+MpTujl++MSe6arEN/ybGLY84Oh6YR2RIoa4GApBIy7eB2s/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772180232; c=relaxed/simple;
	bh=m1v1NON76PMqrwAK+QogHbEEQapfrZUSwmgoYwLysaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LVknN60dnCbLy6FkmjSK+wxFHfYwPXMMlOMJ19JT8q2XInUHNvAjNSDleD/8+sMfVqzAgL2SFCVgR5c6C3JE2dIcqKXBUJH9IwZXB3iQvveD1rEOiXvzHflDZDYGWXyc8qugSKa60S0a1pXtiKUlx/KaOqWU55MJ6w2urikGx10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a8da2faf4so1482469e0c.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 00:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772180230; x=1772785030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRbyV6rB0ACPTuZRlxL65vpkYib9H0d5lAlAjAED1c4=;
        b=cChNk2gtSfs2Ik16Qe8AGRwbnoaUWUpuefvYdP0n9F9BwfQBss3IwpebzoRCAF0H6/
         +aY0GzUUvm3POsO14xUuTlS0szpYDGbGVSmL/T/2WBr4ebEkefjdF2fPchphfXRILW/F
         YlnCo+TB11D9rxi3JGjPujvKTowzF0Jz5wgqwN27zZFWYo1s3IGmdWFKfLSAxeQ7eWWZ
         49YSYyGhRR8AyID8jba5t7opJVIlumrNTJ+r0vPd4sbqnDBSVFgMGVsfQwkDiKgMjOJL
         YuB3tnwW8fGrkmMyP1gMWkQIroWN4d/hwBjget97La3GhZltdgF2Y+wtyQZJ+BxdkXOW
         YKnw==
X-Forwarded-Encrypted: i=1; AJvYcCXSk9W3pT5QhKmEl+6KsUjY9lYOR4pEFPDjvvFR0Ri176TWKclhKlJdLqmNIdECQBzHJfRpSasb6hKC+0f+hJuBLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR1qCHsz463g11jmkSnGsrqAgwE1QfBo3VkiT8JdpXAdAANt1Z
	nGUJ5LFEDOTByxi5gBGrhIN7EW5bJVPXuYBR21vWHnpxkxCZCP0gYS8PLyyJkh0ZHpk=
X-Gm-Gg: ATEYQzxWugaCR0BJX4weLKP9QKg72a3bgBRDDS9Kj+71RRcOoFNvCuqEf5LQZ2UB6Jg
	yvEm+uKNbxueg3zIL23abBiYBSCRxddUIg0RJmwcCPFok0CrcgBXYqtXfBgV+qw78+QGVG2FYDE
	geZnS2l6YiTAaIMT63loN8YoyyIdnjG9srtrKYCYN9IFZNkkLvOwxGUScV2mFAfjsp3WckxsExS
	x3lXsmZGm6tqJau47D51y8zL0uv7q6HWeYWEmhH7U2FZ8oiuL/Wq+58C6u7II1Xtfjrvll5vRwS
	pm3HWz478n1ISlPY/L+ABj6sgX+TAVHggApqZE0CXqJIaoX8d1zGxF8HxcwXyXMYz7zrRULIqcK
	fWmtVzHW7DRtPgfVixaGGGd8EcLcYFtCwEQwxJBx8/fkWeaI6MKyC6Zj9Vu7l1Y3a0PabRD1k6X
	xQH96qhdmy+O1ePCw2gIZ9jna/iPrsqrNQltCXsEM+AcdsA9VY3y4DEbBT4SkD
X-Received: by 2002:a05:6122:20a5:b0:559:ed61:4693 with SMTP id 71dfb90a1353d-56aa0a78973mr1339789e0c.10.1772180229902;
        Fri, 27 Feb 2026 00:17:09 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a9228d776sm5350606e0c.18.2026.02.27.00.17.08
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:17:09 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ff1703cb94so1017469137.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 00:17:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPCqPEcdKMZsaRaArOKnKA6UXwLp+b8dlj3Ll8/izGEuIPhw6z8gyB59kGZNW0vV9KZMsaficZ+7KL4+QrWKr5gg==@vger.kernel.org
X-Received: by 2002:a05:6102:3747:b0:5f5:3619:8bd1 with SMTP id
 ada2fe7eead31-5ff32494193mr1107329137.25.1772180228608; Fri, 27 Feb 2026
 00:17:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com> <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 09:16:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
X-Gm-Features: AaiRm52todzA8Sr5byokA4vkDZ2E-x17wtaWy3OW25tgrEahH799QvmVZU00ayM
Message-ID: <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
	Andrea della Porta <andrea.porta@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

Thanks for your patch!

On Thu, 26 Feb 2026 at 19:17, Brian Masney <bmasney@redhat.com> wrote:
> There are some clocks where the rounding is managed by the hardware, and

s/hardware/firmware/

You got me totally confused, also/especially in the cover letter! ;-)

> the determine_rate() clk ops is just a noop that simply returns 0. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
