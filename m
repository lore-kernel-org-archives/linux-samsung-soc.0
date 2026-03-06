Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CCB349B02
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 21:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772834148; cv=pass; b=W+DTyGaFVq9L1miCMa1EkfmWDBFBstUKbx69TA5g18CUS1PlUIGBpiOnQEdYsht6Sh808GsvZVnlNt6xOfiAZVzoQ5b9V/VMyld+h2fZ1knS8BkrJsEUl/XbP+pLe9l5Mlx+tT/WmKqKyylyjoJ729LyyUuyhMnCk50hXaoPbv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772834148; c=relaxed/simple;
	bh=xhG9hJVGCwxvhBOCI8BEdtl9CEQQcCjqSQegYbtplPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpjF6T5aIIZRP8VppG2tpI3RwlEsYjyMyId6n25EkBEVw0o7aMtRV7lW0282QDTUL86nG/tyRMXpjm6Kam56WRL8pUZ9TYQEiPfhi5dzlmE78UYgGGoQxZHgE8or6t+lZsukIIjWH/ziSCrDkKJzN9GFdlJmjodx/LZJHpUC+qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xf+ZQVrV; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xf+ZQVrV"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-661b08b04deso974434a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 13:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772834144; cv=none;
        d=google.com; s=arc-20240605;
        b=Fpe8CMSE6W3f0pfqR3fOH97JEtsB090tgLQ0+uKcvyhmkg2yiw3gbLRAcIy+ZK4T48
         uVbAiDZeFrC9zM1E0kWfkhaRFn1aRoCkQYhL/VukHd9OYBIVECz2MeIf4P/AV6U99Cfi
         wSqQPczDYQWgBGSS1CEss7HhPYvvabzOg0akyJ7JeG91TMS8RvaRTvEt/4emb6mZtD4a
         UmnjKSuwdpKJdnZ4CCbcRbERpnR4geZJ9njH9SkAOS/raGT+lJY9w7F7DY8XrcX7N2WP
         woAu4HuIAsc1+em6kKdFN6FnfO3gdauV9cNULX6I1otkqs0VZ0Jm4h0ST6LEqeqxQmWL
         BMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xhG9hJVGCwxvhBOCI8BEdtl9CEQQcCjqSQegYbtplPY=;
        fh=MYrPO54rGFyYl6CBGww2EnXFaf9OYObd7yhL0NABHPc=;
        b=URkCaKbdckRdQBsWB0b3lilfAz2lEH+rDf9DKpCeJkOf1U5y5NnLDZ1H8roRSjNLMT
         pSswElELEo3Uut0nTUghE9+IVZk8xlQkeBUCLu8yHxdZL43EgSbMjLujSbnMWt0Bt9Hi
         Dl/DNKhgcukoho1JGq4i741xF7ey/HsJo0fzrXNEXe/wb/C8K5JTEGeg9W7qM5pUdC5t
         9m6xdfXGt64nJRIVPgOCmTOFW4m+xkmjV9PVxUzG9ZdXT4/eSy6Pp689F6vqP0ObLUeh
         +h1uPI8gGWaHTCan54KouIpRznWHg0EbfVL7lqs4jtyWlt0M1xPStxdsIrEJvZ47CzI7
         ieOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772834144; x=1773438944; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xhG9hJVGCwxvhBOCI8BEdtl9CEQQcCjqSQegYbtplPY=;
        b=xf+ZQVrVylrn1ciQwh6ZrN28d8zJVHiVFFokjYypCrYbinN8+60kbj5bxds4+lQht6
         1WkHD/d+8qCA2kQaM6pPDQ2Pwb11vbP0zzeA6TPnlQQkMQo9gjhemEoedcNa+h7c46YD
         OO4CvuzZtg9si8Vf+WBK5vjVVBHydzLdc7AKzQtsTi8bKTPm5nvpcsbEJggF0gP2YG9K
         52RXxnBjyouOSXbHIz35mIt4ZkOPupqR+NxUst483RU3rC3tEaKwPPFuK574kmr6HT6S
         p40rosK31JLxOX8dN+KTVCbAcYPvGD9LM6STj47SyuUNQVEFtdJdO0yP27GQNeZuGuK4
         STWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772834144; x=1773438944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhG9hJVGCwxvhBOCI8BEdtl9CEQQcCjqSQegYbtplPY=;
        b=t/YQEkAHid0N/DNeBbGbZYuud74l89Hvtr0sE3nsYvdXMgGUjSXMB9zR20Z4Q+GVEW
         YRtAnrgPMt8MjUuEPJRpoCavIiPOgw+RmQrW+UTsRmsKnDVE7tP6VdySe3hlAYylBeM3
         Wo9mgrb5w+D1/IpwjSWy7GJLPZZB9vpGna5iZ1PIZOre1L7BRdJwKs8649LMGysYDDBq
         rmimBXX5H0WRtDI5Yl8KSIJtsOgi0UkVlrs68DxPsM1aknD8PalEbnKc+rroRk1C/0nR
         eFOvPP4ksp76UtWJSVL0I7L7nc0mzSMlKryncZ6RPGO7oeRYanV6pl3tXOsqjLSDsCwV
         8+aA==
X-Forwarded-Encrypted: i=1; AJvYcCX6KXbkBilHn9dJEAIR3LoREkLjalFdW74IaetOE/DtFfRvF0MO/ybqhH5jVVY3bUgOA8lv3XQfzmq7av19HsTRjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiH5TPool4yYho1pfnWYStZ8JL8dI0OTQtCyDgQx6teLgB9UfQ
	wwaGtEwc0CwdZjGcyubuz1rIDakxWe6l4J47bSi2+HZFZidEyFnZLCraql8iKQBec7Be+dmen66
	ETPxx43R1f8cVV/7eM4uMKm7+33WJk58RFFQIidlTMg==
X-Gm-Gg: ATEYQzxvJRQ4Ny4aA8HhZWkKsag6rJI5vDFHo/RSMUtIS8GUnWI9HAB9+Q+MEtR1JfQ
	vduwbBLDgeSTz9tb2V8eg+eCU3wAOKXeStqOU34SqU54us3lvRxoipee38qwa0Oru+GhqKBpZ3x
	3kXBsskCPKVwk/DbPZzF/2Xee3JLKgSSaLwcXT0XGmqjCWJ+mP1iB1uzLnFKsJkK6PoijzyvEjX
	+vt4iXiUqSNlJdhOwbXtaQ3cXNlDE0ccLEfHmSYkGuZplF/Ds3XOnHZOHEtKxHal40FWYL2AZ8p
	53xVLTD5QUkPmSyuAW8Zx18j+A2wPi8awcF+WaCWhw==
X-Received: by 2002:a05:6402:270a:b0:658:b837:7953 with SMTP id
 4fb4d7f45d1cf-6619d4d3cccmr1959565a12.12.1772834144140; Fri, 06 Mar 2026
 13:55:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
 <CGME20251202093028epcas2p456b6a2bfebfc76384f706a9962266fcf@epcas2p4.samsung.com>
 <20251202093613.852109-4-youngmin.nam@samsung.com> <39a6dce9-ea6e-4a43-9bbc-54d822118db4@kernel.org>
In-Reply-To: <39a6dce9-ea6e-4a43-9bbc-54d822118db4@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 21:55:33 +0000
X-Gm-Features: AaiRm50JsSJm1gZbJFNlFIJjOXEWjxFKWFy2GaNbHIFXw94f1BU7JG5q4xDsnDI
Message-ID: <CADrjBPrLYx=Se8bLrmm+3UEhvsr9Wm0tUi7SLyQnUYa5yPV_YA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] pinctrl: samsung: add per-bank FLTCON offset to
 EXYNOS9_PIN_BANK_* and fix tables
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, s.nawrocki@samsung.com, 
	alim.akhtar@samsung.com, linus.walleij@linaro.org, semen.protsenko@linaro.org, 
	ivo.ivanov.ivanov1@gmail.com, ryu.real@samsung.com, d7271.choe@samsung.com, 
	shin.son@samsung.com, jaewon02.kim@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Youngmin & Krzysztof,

On Sun, 28 Dec 2025 at 11:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 02/12/2025 10:36, Youngmin Nam wrote:
> > Several Exynos9-era pin-bank tables were implicitly assuming that the
> > filter control (FLTCON) registers are laid out contiguously from the
> > EINT base offset. Per the TRMs this is not always true. FLTCON can live
> > at a separate per-bank offset, and the current tables cause the driver
> > to program the wrong FLTCON addresses for some banks.
>
> "Can live" or "Does live"? Adding unused offset is not improving the
> code. The implicit offset is fine, if it is correct.

I saw the same issue Youngmin outlines here on gs101 SoC. The current
implicit offset calculation sometimes results in programming an
incorrect register (if you're lucky). I also saw Serror if it turns
out to be a nonexistent register (which kills the system).

As Youngmin mentioned "Exynos9-era" in the commit description, I
suspect (but can't say for sure) that all the SoCs mentioned in this
patch are the same as gs101, and the implicit offset calculation is
incorrect. IIRC this code path is only triggered on suspend/resume
paths which likely explains why nobody noticed the bug previously.

IMO, resending this patch would be good, as it should bring these SoCs
one small step closer to functional suspend/resume. It's probably also
worthwhile splitting this into separate commits, and adding Fixes
tags.

Thanks,

Peter.
