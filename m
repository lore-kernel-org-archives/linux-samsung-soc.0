Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BC139C00A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jul 2026 21:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785358996; cv=pass; b=dC9jvZ2jbcJgmsR8BIXkbkpQyt2xVho1gcpstYf6Jt4GxDxUq+SJaepwhpT8Aiy3UQDX+pLkr/y2Ywfzr762bZbdgLLJsSSVLEkGnkRh4r5GGT4hR0wjWG7lCn6prTtsFLmILGV+fB5BSSIrvJtfSQ6JaDPBp2Q1XQc3KTcDwIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785358996; c=relaxed/simple;
	bh=g318k4aTVUNemyX/qfEfcAL4FBNIpHVejXjEULHegwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JO+w96xnubFynosZlI5jG+5PNEr7t9H7pWvZ7EOelJNIWViiCXXGm6l1J40IPD0xaClMr8Jgrn1Mj6Dxa1vH53C2GbYhmaCemQVvG88H/57rjGtrVyNkcS2CSwAN0Xa8VzfWz1ZZmtn2Mxy2YfZrX9Ri13p+AoR3egvmHhYaIqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhLEVgpZ; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhLEVgpZ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69c7ab350e9so2318112a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jul 2026 14:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785358993; cv=none;
        d=google.com; s=arc-20260327;
        b=DwsPKWvH9IUkK/i9h0BXTFJCoaF4o39532KvzQwN5tVI4vaRE/J9aBUcZBMrorY0n3
         ieSihUtXUzqjkNpfIruPg/uauBXiD/OKtGRToR5r6IgC3qBp5e4keT3atSuFkD3O3miU
         VwSzGzROyvTGbzrfOZZqr+0YP1fOJJOXXxAa6+u49dYwT6yWga7zw3BMjHd16Tvfo07z
         FotlS7mFR6vnHr6izEocPvydZ4WkYGefgWYK21MdRJM9Y4dzHyIGRiFP6ZGJZURJgr4J
         lkv9QRuyeh4jI9jOVWOwXDnr9pCNWhoTpici3T5A7ItF/CHTDzbrbsjyTWEyUelYB7e5
         QRpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g318k4aTVUNemyX/qfEfcAL4FBNIpHVejXjEULHegwA=;
        fh=0RoEhfo/N/HMiU9oPWpEm/eORk/pmRqIeBXsZDFSV3c=;
        b=PpHHa+/NOraetgw/3g0tHoIxRlEMR70T21+04IaRNh7tboePVTHDU/3EbZCUPhiEA/
         HnSNOBc+2oThkG+qCoRepvQU71KdjtNm/te/brGaMoKmoQ3sb8OfMe6KqQhJJjCtFaOp
         VHeIETp0ZBbCrwDYqTrjMM3pYXxOrJte785F/G86fyxMZlC3GPezS36KZM4cyJidENRs
         4XCtDrKZ0YQIXWqmyO7Jy8osX+L7OlzkUvy/58n0J1Nml1HdgGyqmwGPcC7OZogKuJH8
         1gdfTX/GzvUjbL6n96yjaB3aNW7srZt/PV6/MQmp853evNHkG1JZPFGsge35HsNbqvFn
         x27Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785358993; x=1785963793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g318k4aTVUNemyX/qfEfcAL4FBNIpHVejXjEULHegwA=;
        b=fhLEVgpZEz8wXvNjb/K8L8hZq9GjIlfcTdIsbubqKv2jjsRhzPFuR80pdEpGZfOntJ
         z3jD7A7ke1nxhYxrd+Gl9Hp/kJlDP6K7gMGgD51XhJLBcRd/ZeYkxZIXavmLMC9MiqJu
         JHk1qphZDbwTJyomZL37deKroWdrR4brF0QJqc7NobeD0lI/N4pngWHl5hd5J61r+zDO
         P31nlBNX6JOWUyMcWpBVSipWZ0F/IXOm4Bfb0Bms+U64JU4ACde/H/cab/Ru347YLmJf
         mFaj0xLvAIBO3E7E+WJvzzhFqrHc69NGoJZT1mAABlovBZEAMJ9t2shBkMw6kdfw593E
         99iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785358993; x=1785963793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g318k4aTVUNemyX/qfEfcAL4FBNIpHVejXjEULHegwA=;
        b=MJ718eHx82EdWA3MfO3k3unduXT6wHimNWi0a7kG+nq5jxf/ixlq43eJSRXfKiBnF1
         6xyny3nKAc83uH+bqydCiB1v3UR4s2KObkptV5pmYKNl9WjZB95x+DD0WNsr9COLALta
         JmYJxsgSjEI297yn+ctJsvNptrziWrQCkOYjEhhxlpcjb4RKnbrVuY83o82IuZkku/V9
         /LSh6modM0BzZExNVh3iuzxf+rLn05JgfDbp1F4Gb+zqUQyg2vuBstwhLaLtuXS2OwLK
         RRv6vXPOcmynNc5o5pUmNOJSPKy3wxMRBsJJQp1crZekUaoc6baBOAnYuGRHuAb0U64H
         g5eQ==
X-Gm-Message-State: AOJu0YxReIhdBL04cABcYGO7+IUjALQ5v6qa9Wz5KeJD5Yhq3H/S0zbE
	4yA+2MxuEy74CVpq7+ah+Q25qIunF3munnaKGBtCwHMA4IAiPCoHHyEni5QyFRNBeTkgLgVGnOo
	nDIrHNMKz+yslfRzuTqVCUKEa7A4D9JI=
X-Gm-Gg: AR+sD13o9xoRif3CGlokvlqNgInSQKdjgQXPpKXIZUAhDAccvWvhdNpxKEJBBV/vHI6
	TQS5qX4KpRBgJZN02FMbtNxt+4wb1Hkmgg/j3BcSAxonuHx6RbXZkSUy4TOV4OrxA1dHTZKSaiG
	+xDZbtEdJnndjQVMspiU69vIFDKzUn5A/x/SxUlYWkvd8gq+kRnTKltRQ/BPqlIKLgL74mQA39G
	sBgRZqV2ZnCU96ilUgpyZ5HDYeb/ZFw+JrEo86xH//rGTNMsRZSvywdo38qgeUmJ1NVH96ohrhG
	GLKlsXV9mEfZS3eUfEO96zpRbZmSbOY8MV1QJg2l15ATW1b0pAwIiF04kIcyWXGtpdX1+HissQK
	es3e2CKdeT6vbDNBPBIuC71Epi7tPv3/d6aCzyUjSL0pryEen3ndY1FM5uHsMHVihKL+t0dmORz
	fqnPXuBpva/FbAxOItR73uV1matPGneOW592ZT61KiFox4h6YUZkYPBGI=
X-Received: by 2002:a05:6402:51cc:b0:698:6084:db7f with SMTP id
 4fb4d7f45d1cf-6a07b7fc1admr21670a12.10.1785358992379; Wed, 29 Jul 2026
 14:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727194836.11689-1-rosenp@gmail.com> <a9a2caab-f93b-448a-b846-7e739c143687@kernel.org>
In-Reply-To: <a9a2caab-f93b-448a-b846-7e739c143687@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 14:03:01 -0700
X-Gm-Features: AUfX_mx4flmj0fEXemuqhYXtdVH7XNcN1VvGWawpVJXNy6WEVYqTNmVDorddp_Y
Message-ID: <CAKxU2N_bPw+_Lw6mSYF9Bj1KT=-y7oJ-_v2rhPBmULjU2p5KyQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: exynos: replace irq_of_parse_and_map
 with modern APIs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
	"moderated list:PIN CONTROLLER - SAMSUNG" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 11:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 27/07/2026 21:48, Rosen Penev wrote:
> > Replace irq_of_parse_and_map() with fwnode_irq_get() for per-pin IRQ
> > lookup and of_irq_get() for the muxed EINT IRQ. The fwnode-based API
> > works with both OF and ACPI fwnodes and follows modern conventions.
>
> And what is the point of ACPI here? I see no point in such conversions
> of one call while leading everything untouched. Add proper ACPI support
> with valid ACPI tables with ENTIRE driver converted, not one call.
Avoids having to call to_of_node. ACPI in the description should be removed=
.

As far as fwnode is concerned, fwnode APIs are used earlier in the
driver, probably for the same reason. fwnode_irq_get didn't exist when
this driver was written so of_irq_get + to_of_node made sense.
>
> >
> > For the muxed EINT path, change the error handling to propagate the
> > error code rather than silently returning 0.
>
> But why?
of_irq_get can return -EPROBE_DEFER.
>
>
> Best regards,
> Krzysztof
