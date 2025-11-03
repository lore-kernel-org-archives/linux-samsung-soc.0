Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2313168EA
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 16:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762187122; cv=none; b=Yg3Rx/5Dh7fPi5Rt8yyicmbavoGlWcEwPH9c6IPSo34rQN/nPS81fgVjug+BEmPj9zulfnMOm8L2xwU8xftnHLmzRYrlMx7Dy8MHzq5aOL3mA6+Yt+XoEJUGO/1DRDORrK0oZ0xi0x31q/KO27N09Qku9FSvhIdEw0TF1eaueAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762187122; c=relaxed/simple;
	bh=Ie1ztFzxSPbpvqpKsuFgqxlGSxkGlpXE2rRP2x4OnvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=STUZzg8FESuj/xM0QckxB3Jqr4V4sZ+B3xd3c84voWu3SnQI6dXV9FFbMTL5FCNH/JUR8Kyyi1h3JiG6LPJD/UKWytQwO8YuWn+cKqfsHtUzwIrffKvZTI8UmF8Z5aHJUzpLGJJzCQP5H1eEaMPK3KzwMD2e8xsNq6Y1jRBxkXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wELhL0L4; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wELhL0L4"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-443a7490a54so2297156b6e.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 08:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762187118; x=1762791918; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTAlZXiaIMnwUZVq1sutIXo1v8ID+rDo5kChNciDhpU=;
        b=wELhL0L4Upakilxpc3Lsd82TXgci/esRq886yqUYBpMG797GnezHaJ/fykDuzL73Zd
         cyrLatGEQozgTblxCoyIphwZS++7BH7vc9nPcxZiye9Y0aACvBjYHHmh0ylw75a56WQs
         X9azuX58kFoFN2RHn0Qy2a4c8Xlzebs1uOB0zgwLbouTeHJXHxDBEYf/DE5Y1olh8rUQ
         Tvv4xYeTy/KikdvtDWOqXPwBxiCNbml/4HtWRSId/LuMsX6yG3DQJx+MUeDR2LaJymxJ
         ljrpjoOEW+j+AT6155xo/Z7BOQtHbOrzbUqF3Y9mPdVwwIu4oJh8aADrwF3xfUK813RB
         7/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762187118; x=1762791918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTAlZXiaIMnwUZVq1sutIXo1v8ID+rDo5kChNciDhpU=;
        b=oTqpwvt7Rd6VoQ53f+YzEKEGEH8T5Z9sG1a9uUcx0VhkEuIFDsw0tgeiN8iescfw5h
         vlCicyW3bLoIOGiwsybM7Y/AttuFBdzKEfG+ywSGkUCavX6228iibkiDbC0ci1OWnMbi
         h+BQYg1fUXWLZCCPSJcZmL4nRNz2W5CgLMRdzYHNxdYehoVdED2mw7k1j4KSrcWskSRZ
         V6fRiHumfUHIj3gpuvpX5yopto1mbVraBBV0FYOZzWkhuKCd7sgTrgPie+yA4q8ZHo1Z
         wR8dVZTwNRnRXiABxgYdOWBQpGEpcUXyzpKXj2nNORZdKANhUyIjWW5Xum7VE5v8rASc
         ntTg==
X-Forwarded-Encrypted: i=1; AJvYcCUUeHbOHW3LbXzKkD3xDhkbZDI8cJLbMe5wVgS4a+mxuKXE8qKDU/uxIb0j2sJQh/b9axsosoTycKdEqyiFZeJRWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS9yLGCA2HBHYcbPHP267uS9eTIpKiLNgnXL3pMQX7rYU4XmFT
	0sI+JR/3CFNWzEPYvQvXOcb3eOghlQL/4NNwoNVPg/Fm4Yt3mgssJUK0ywI28pyyRMuSd1RhGBv
	EOjoZCE8umlew95UKZkf3NjztbUXXBIpV1COgqjuTBey4g+IsuXSwb2I=
X-Gm-Gg: ASbGncuv8QpJ8C4j1GZMKqjpSBBYEdSMtahd5GfDZcIlHiTCFLDay58s7tbHkAstJtV
	w+pR08CGiJt/c/PLy2C5V7dlznov1+MMPgzgNJEVSG39v0HGbbxeGyG52fx74FEyclejEhdtOsz
	HwJRSZdfVT0Dhw3LGCAvrhoXHCqya2T9Q2d44zpKPTImbDKckptdkZKY0LzdfL/2UbZJ2Eo4IBj
	bPfijnisYFb0vsOG8uxr3S5HXmSxAEEMyMRv7Ea1LlpmJ7orpz7qfgRspVBiQ==
X-Google-Smtp-Source: AGHT+IHbOCEod+vwr0o0M8EjAvwtvOa1OmZXrzktC3381lHRz22GKSeMqt33exVl0j3qBsMsZ4mZpgJp76VxYZBMPkQ=
X-Received: by 2002:a05:6808:1827:b0:44f:6d9e:5355 with SMTP id
 5614622812f47-44f9606a6a2mr6120804b6e.46.1762187118611; Mon, 03 Nov 2025
 08:25:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251103085849epcas2p25cfc49959513dadc59aeaf166aba236f@epcas2p2.samsung.com>
 <b467a9dc-3953-48a8-88ed-c8a3361006c8@samsung.com>
In-Reply-To: <b467a9dc-3953-48a8-88ed-c8a3361006c8@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 3 Nov 2025 16:25:07 +0000
X-Gm-Features: AWmQ_bmbWgChC_bEY-3U5XXOK4CUpqZfilmDT0HkFykCTWRojeoS4jt4kh1iB9U
Message-ID: <CADrjBPpsd6k3HLBfiE2qp9F9LrUxEYK8y3Czxq1z76efoKRcNQ@mail.gmail.com>
Subject: Re: [RFC] pinctrl: samsung: Consolidate Exynos pinctrl macros (incl. GS101)
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzysztof.kozlowski@linaro.org, krzk@kernel.org, alim.akhtar@samsung.com, 
	Sam Protsenko <semen.protsenko@linaro.org>, ryu.real@samsung.com, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Youngmin,

On Mon, 3 Nov 2025 at 08:58, Youngmin Nam <youngmin.nam@samsung.com> wrote:
>
> Hi Krzysztof and folks,
>
>
> While looking at the current Exynos pinctrl macros, I think we can refact=
or and consolidate them.
>
> Today, several macros are used across Exynos2200, Exynos7870, Exynos7885,=
 Exynos850, Exynos990, Exynos9810, Exynos8895, exynosautov9, and Tesla FSD:
>
> * EXYNOS7870_PIN_BANK_
>
> * EXYNOS850_PIN_BANK_
>
> * EXYNOS8895_PIN_BANK_
>
> * GS101_PIN_BANK_
>
> I propose introducing a new EXYNOS9_PIN_BANK_ macro to unify these into a=
 single style.
> The GS101_PIN_BANK_ style seems appropriate for modern Exynos platforms, =
so the new macro would follow that approach.

IIRC regarding the macro naming I think there was already some
discussion when Sam tried to upstream pinctrl e850 macros (originally
using EXYNOS9_ prefix same as the downstream kernel). I'm struggling
to find the discussion now on lore, but you might be better placed to
authoritatively help answer the questions that were raised previously.
IIRC it was along the lines of "what does EXYNOS9 name actually mean?"

>
> The only functional difference between GS101_PIN_BANK_ and the existing m=
acros is the presence/absence of the filter-control register offset.
> If we add this offset as a parameter to the unified macro, we can integra=
te all variants under one definition.
> I=E2=80=99ve checked the SoC user manuals listed above to confirm the fil=
ter-control offsets.

I was aware that the e850 SoC had filtcon offset, but I don't have SoC
manuals for the other SoCs. As you have access to the specs it seems
like you are well placed to do this macro consolidation. It makes
sense to me to add the fltcon register offset for any SoCs that have
the register (and then also benefit from setting the analog/digital
filter accordingly).

For gs101 we have tried to upstream all functionality present in the
downstream pinctrl driver with the goal of replacing the downstream
driver with the upstreamed one. My hope is this will also make it
easier for Samsung to adopt the upstream pinctrl driver for future
BSPs  as well.

>
> Planned patch series:
>
> 1. Introduce EXYNOS9_PIN_BANK_ and replace the macros above. Rename the e=
xynos850_bank_type_ data structure to exynos9_ for general naming.
>
> 2. Fix any incorrect declarations in existing platforms (if any).
>
> 3. Add the filter-control register offset to all platforms mentioned abov=
e.
>
> 4. Replace GS101_PIN_BANK_ with EXYNOS9_PIN_BANK_.
>
> 5. Rename gs101_pinctrl_{suspend,resume} to exynos9_pinctrl_{suspend,resu=
me} and use this on modern Exynos platforms, including GS101.
>
>
> I believe this will make the Exynos pinctrl driver cleaner and more consi=
stent.
> Comments and suggestions would be appreciated.

The above sounds like a reasonable approach to me. I don't really have
a strong opinion on macro naming, but I think you should be prepared
to justify your choice of name when you submit the patches.

Thanks,

Peter
