Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853F75013CA
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 22:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633269; cv=pass; b=h93bvIQlCDzK5Hlte4r8xsVE0ZhyAK8qXxzgr9rsGCmI1tcOLcn5GK3yoYyvd9ifCa0B1zlGJLkeBoeheoH8x9S/likCX5OKMLk3LV+FewM0L15sPGRtIObcTl7Naur95FnxC1OxBP0boLCeKxV35qryXD9eBhDADjr43ZZfwYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633269; c=relaxed/simple;
	bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQn89jvXt3R84GCTMQ6ilLHMbw10WbTlPVXBO1ytKQvzWeFqlfrQUKwxdS3bl8VhWOp6rcro/bJFG1u1tJm9WoETRtqPzmDEUYvutLZq7bTzGFxCnNGp8jGIjefFQ0qIFwLVcDcKCEWEF8CcUh68blGIezVnFtOEDPiNx0AxLr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I5Skv06P; arc=pass smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I5Skv06P"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97ea1a712deso773977241.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 15:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790633266; cv=none;
        d=google.com; s=arc-20260327;
        b=Kee4CokNIe6a5ihxKU6zVVYUxaJdu6y2s+81Tcda9rP01kELHnJ5w9b8VKJuJpw8+C
         3aaxykOWejKZS6hao1wmVPEJm/8bJWy3FbiEUrxERkkxaAYkA1bhuzSpgxp7H7QQUQbS
         Y6hdkXDUX9C14uAelQ6Bd0QqKVuT0wEuloRTaxCgNy/tIHduaCQ76nqvgGxcLZLBSlxZ
         8LdIpD+Zkde5DvELcLwik9vQF1bdvSITP1zVp8atHtIAYslQ4q/kHUzB1YH0ovXJDPeu
         qkOfGWHQ8tVZnoaawIpqRrvYutx/oJq1ZNNpnyFPV/HAUVsJwh7aqePXdZIVhjOCZNu+
         abJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=;
        fh=tRc95SEFV6zJY2dV9pMxJb18gj1IcVShYs/arMdbP9Y=;
        b=NSagE54Y5QnMw3XFQJMnbdJgtPGBbAmMxohn1Y03tjA8J0lk3FPQnBoMKccgBZVzs4
         pHFEszH2LU15op1ewi6NpYc4Vqb8zjS204z8skfedizUsIXroGB02g2FmfTOyrfq+DqR
         SOv9iVz8PFMNaT+VR3IhpM8RTmSpGLPiAM59One4k/0EUZ8ZCDRQzKqUZgeuttTBQdzM
         N5uBoOGs/8ak2JvMG0+c1x19RPm9sD3OpW/hvqU91EDdfXqeGwApcvnuccJIyU2DXzC2
         Vs4l2Zds5Ew7ru0cNP31xOpBGuLSTwGIq9sx+0ZPO5yiY6SLvohxPFZq8VCxhTuvwL1R
         Skog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790633266; x=1791238066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=;
        b=I5Skv06PdP80elAdgEOkV7u7P5IFmWePOSv8be9nurQoyTIkpv8H94neikY8rZnjfQ
         4tqVeM3HgJi6ymwkm46Up929kx0IfhfD7GXz14YOnlTl71KbU+jbi6p7UNwgoiL5dzki
         agiJ8kgWocCor3z31dPAAeS7DiTk4FPj4P5GQv0Nm8pD7jCtrUWmy1jxo4dqkJsteJLJ
         tP5zcWdJYFjnus+viEBajEGX5GHO8mFanZKdnWONKEMpmneGcAx2BVfpdQiUeNmU+FjU
         QavbkDL670yrFJBBSMnDDTy9nDoJvrn457jJQsoUZHW04B7BXerbwwpHgOYdBnT/JM8d
         h8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790633266; x=1791238066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=;
        b=y0/g5pAc7NHa9SUBhZwna5qNZ+2Bd+2CtIUZOhYQfgQSJRtbzwW/nxycAw25+XQBVH
         MbJcd/LyEqQCG8U9eOqcKj5H++6RytohZoJF2Z+T2x7J6Td8Rgs58hF581BeoQ8bUo2+
         Ps+O0spmKutPPwlN+argSb1b8GrdmEo+nCk816KkEckPo0usBwEEe24aXyq2ymr6IsqP
         D6htRHsekW5F+KkuFyp3m8LzDBFt+IqRg9R2E9fkSC8p/WGXRviNzFSITPVrUz8AJMrf
         ueQSgNBnDKU+vs1yxR2HncMPpcYsOVoFXLOdS3AzARbpwS+NTOJKKjpnqPnsvFZJ40yM
         Em0A==
X-Forwarded-Encrypted: i=1; AKwUvBwTC5v+avocALhq/hSfXtlNEcg8C0iL2x3ZtAZ1Cf889Be/8T4FCxhpyuHZLYRhApfWD2sSCdZZvngGvYeAUZVEgA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLadlCKiY5YUhFnZ8xwNmMy4RSwQCNbH6c6Pv86chw/i60cbWjK
	y92qkN2uYLZ62V/e1Z7+agzm1l18NYrwispHyS6XjfEGzu2fcMzf/1fYNR+HaG+gc8M4R/7lUOr
	+KZnEV3QQ7+2fzeMSPFVQ4fflXLi/HbE/bmEZ9+6l
X-Gm-Gg: AYBFou1jmfguC3wJlkDMZWP7ChLaPWuRm2MzoufjDpV/lH6a/NwEaJNy0PcKjcyHXcB
	GagRXhw7TBRQoeD1inU0Hht3nspUhHRJAJfij9Iw5JJr+1V4kjdShe8dcFdWmeypHsLJ4aVuFxf
	n3teSyhzzjiZd6D3WhKj5BMNvUJZNLMmP8POr4L9P7uPuK4yPdbNTX+3p4//SUv9bIKUy2jFKf7
	UzMPJugjfpWZBDlUjxk7fqUez24QEyZSD1SQYDLUFN7x7WoypWMnkzCk6/SzgArs/uxU/s1dD2q
	thTcKWOTJ3dAdye/zLvW/a5FYfzIfsw1N+lf/g67blLlfOCnjB3AbSD+Bjo0LphjF8DAoMeo3VL
	aM4qshBrwZA==
X-Received: by 2002:a05:6102:3f0d:b0:7b3:4199:2de0 with SMTP id
 ada2fe7eead31-7b341994431mr2105212137.4.1790633265847; Mon, 28 Sep 2026
 15:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927190758.609156-1-nikitash.mariiaw@gmail.com>
 <arrfZ5CYyLt0vwu5@google.com> <CAGG=3QVY_OGjSYZgJ8i8Nb-EbwHKPOvZsbqqXfcbv+Vvq_wsww@mail.gmail.com>
In-Reply-To: <CAGG=3QVY_OGjSYZgJ8i8Nb-EbwHKPOvZsbqqXfcbv+Vvq_wsww@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 28 Sep 2026 15:07:34 -0700
X-Gm-Features: AclHuK8nlJeFMJ-63_0sQ49qEkZQmIZd_Mx0rQvc5qKTUPlWeM5glCx-vJub4Og
Message-ID: <CAFhGd8r_JfpaBvjod+AA6G3BE5S-L8Gs-nc9xMXrxp6_tLOgVw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: Use snprintf() to construct pin bank names
To: Bill Wendling <morbo@google.com>
Cc: Mariia Nikitash <nikitash.mariiaw@gmail.com>, krzk@kernel.org, s.nawrocki@samsung.com, 
	peter.griffin@linaro.org, linusw@kernel.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, 
	aleksandr.loktionov@intel.com, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 28, 2026 at 3:01=E2=80=AFPM Bill Wendling <morbo@google.com> wr=
ote:
> She's been marsheling some of the strlcat patches I sent to the
> mailing list. It's possible I sent a "v2" of all patches, whether
> there were changes in them or not.
>
> The patch series needs to be separated a bit because of Kees's
> 'seq_buf' changes, which will make some of the patches I sent
> obsolete.

ACK

>
> -bw
>

Thanks
Justin
