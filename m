Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350BD320386
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761313879; cv=none; b=hhr6gdXQHsqSxyNVVKaL4nIGB1t2/CbVj3VYjo2mjMbbYNo0HaQ3HQrm/j3LYDJNcpajIXNEU6RlbRzYRgeBP1QXbY3yl3+4sAKOucEZ7ZxNmwWM8d1HVXAoVxWTykb7t72G/3S0asJzBea8oMJmPLtAP0jnist3PvYZq4qbxTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761313879; c=relaxed/simple;
	bh=2Q+hjtxKQeLXbLBHNqlPoIllo2+ofr0q84sy/acEdSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N8BjFBmvb0hdG0nFWJA4Usjc2upN+RwDJQ5esJM6DXGY7Nd2M3a0ImV/G584+2CZpWcSVDoHbL1ETHJhrEmgt/ANq0xtDOJZ+RiAcEKdMFIPKiUWJmhi6eek9ayR7/yxT6RDPdKNylUNvR77sAVKK2U2xMWRHzooJLJULckXxyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kWYXWVxi; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kWYXWVxi"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-3c987818958so728435fac.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 06:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761313877; x=1761918677; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Q+hjtxKQeLXbLBHNqlPoIllo2+ofr0q84sy/acEdSw=;
        b=kWYXWVxivPJor3zO1cbb2JfDM3Q+uUhUTuRs0dgQeyId3ffk4gJBtcxNSqzhVOaGi4
         mAnR6XE7iOff1lX8im1+I5QnUMdBbg7I0ddBLjOnvJ64t/4CF3K9BILAW7Oh4ymerJeq
         QCci8bQb8mS/fIOlROkcfwLiz7mBpoNPyLh9mGyAhiBkfTTvXmnna0CYQIoK5qidJX3q
         d2ZGdAnFymZOsIXPtcQ0JNDb8oouvlNF/LTsMHrUyvBZ/CbPUYjvgCk9WXE9pyhHKctS
         qQEG0jHQWN0mpU5m09RFzDsPg5f6Yz12NE3MD7sL/dFgVvYeDnDfvjoOXqWvtrQUu2Q+
         bZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761313877; x=1761918677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Q+hjtxKQeLXbLBHNqlPoIllo2+ofr0q84sy/acEdSw=;
        b=keQqDDgYQQxVSpKUjp9jdOx+NS1akYqLJx532aeSQNq9zz0IQKOjfVyIezEtUOuQoG
         mIb0WeXbQTRXA7NK+DAnoU2cNhzkHLNiniPcRG+/FaqK6qvy/TYO4x+JTTARAt+Z8Vzc
         dhDu83Q5xIHVgV4wjdUq5dvIhc6cr79X1tAg1dRQHxI1nv5T3DLJHaI/OyoGbRSec/nm
         5KbAHa8SxNE8mBhprab+GTwjHoe5S/l5mc+unVhLb7GGpyhvJaNPoGvWGJIR/JMnk0DU
         BQ4wasuBmLgA+djoBldQtiwI8JzT3+mq7/Ve2rrvJNEnZSCz8IXCq0bV0ddcw7kvIoNV
         IK7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVe65zZXdoaYbD19PupEJUViPDI+HBnZINUY3znf9haV6I0tLuQ8LmNEIR5EcpRFoVe/BboucA/1vNmHfisKcKwMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOj5wtK4mRo0IjvZ5dP/CDyuB9dqSYH39jNVrA/cXhkdsrnvNm
	OIGbuZHnrFaO0Afo9rly4/K8jb5WpIC/DCAoyivudcOofi+AZQoFW/0sfayL8qX0L+ZOprGFCyI
	ZRxrMMwgSqHhh9tT+7qJy0wugufIPsCOxSxT/xFmAJA==
X-Gm-Gg: ASbGnct1ICaN1z6XXe1XP6auu4jH3VzbX0GJcK3ZlCX9stj88/TuPkjANX6FsddZ/VA
	mHvdfF9lnu5h1y/ZOfTb0RxiBl47ePKcHmb+7G7klepBgL1XspGtEzdrFvi4qK4DheS34QNJ5qa
	P6FZTgSLAOqS4hG/+MmVEPvgO6udWkx5AuyFC7PyJ0N7e6KckOwfN+aMPpoGJouET6CLLTSGeI4
	QN32Po4IJstm/5W6XcbMUbZ0X0J+rWkSmxxkkP97lN3UvDe7gkJ79iV66qXYQ==
X-Google-Smtp-Source: AGHT+IHlphEUHdTlTQJtVbz4Rb5yJO5rZyVkkvYKLNT5GKPiTAAZeQLOg9k+GYR4etbv9qcFfzt4GYI8LyWVmzZyT20=
X-Received: by 2002:a05:6808:1907:b0:441:8f74:f44 with SMTP id
 5614622812f47-443a319d493mr11540703b6e.62.1761313876914; Fri, 24 Oct 2025
 06:51:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
 <20251017161334.1295955-6-ivo.ivanov.ivanov1@gmail.com> <20251022-savvy-sly-auk-a60073@kuoka>
 <CADrjBPpXStuuvbaPZ+knb8fiGQja_hdX42PKfj=bTNCdXPCN9w@mail.gmail.com> <9594fa0e-22f6-4412-a967-6d5c1374da48@gmail.com>
In-Reply-To: <9594fa0e-22f6-4412-a967-6d5c1374da48@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 24 Oct 2025 14:51:06 +0100
X-Gm-Features: AS18NWC4v_lHSaYSR7559EcFNWgZxeNNJqRfIGOSzsUX6VCSF3TlMbDJY2BWrMY
Message-ID: <CADrjBPpmUzu=g7RfJShC_2VNnvAt9Ur5NrGbyctssyMQ0nPkmg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: samsung: introduce exynos8890 clock driver
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ivaylo,

On Fri, 24 Oct 2025 at 13:34, Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> On 10/24/25 15:07, Peter Griffin wrote:
> > Hi Ivaylo & Krzysztof,
> >
> > On Wed, 22 Oct 2025 at 08:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On Fri, Oct 17, 2025 at 07:13:33PM +0300, Ivaylo Ivanov wrote:
> >>> Introduce a clocks management driver for exynos8890, providing clocks
> >>> for the peripherals of that SoC.
> >>>
> >>> As exynos8890 is the first exynos SoC to feature Hardware Auto Clock
> >>> Gating (HWACG), it differs from newer SoCs. Q-channel and Q-state bits
> >>> are separate registers, unlike the CLK_CON_GAT_* ones that feature HWACG
> >>> bits in the same register that controls manual gating. Hence, don't use
> >>> the clk-exynos-arm64 helper, but implement logic that enforces manual
> >>> gating.
> > For sure it isn't the only upstream SoC with HWACG, gs101 and e850 and
> > probably lots of Exynos SoCs have it. Whether it is the "first" in
> > terms of release date of the SoC I don't know
>
> Huh? Samsung hasn't released a lot of exynos chips and you're free to check
> kernel sources if curious. Exynos 7420 didn't have HWACG, 8890 and 8895
> have it. Exynos 7870 (roughly same gen as 8890, but budget lineup) doesn't
> have it.

I'll take your word for it!
>
> > , unless there is some comment in
> > downstream code to that effect). Your CMU registers do look like a
> > different layout though.
>
> Exactly. First implementation/gen of HWACG == lots of room to improve.
> Which they did, and this is what I implied here. I can word it differently
> though, to be more clear.

Ok, that makes sense. If it can be slightly reworded to make that
clearer, as I found it slightly ambiguous on "first read".

>
> > Just fyi gs101 also has Q-Channel registers that contain HWACG Enable
> > bits. The reset state of all these bits on gs101 (both for QCH_CON_XXX
> > registers, QCH_EN bit and HWACG bit in CLK_CON_GAT_* regs is off). In
> > my case I suspect the bootloader doesn't initialize any of them
> > because of the CMUs "global enable override" bits in the CMU_OPTION
> > register (which is initialized by the bootloader).
>
> Well, to be fair, without any documentations or bootloader sources there's
> so much so I can do. The vendor kernel also force disables the qchannel
> registers, hence the assumption.

Sure, I appreciate having no specs and only downstream kernel sources
is tough going. I think it's great what you folks are doing under the
circumstances! I just wanted to point out that having some HWACG bits
in the QCH regs isn't unique to this SoC (although it would seem that
having to initialize all of the registers possibly is). Maybe the
HWACG "global override" bits is one of the things they added in future
revisions of HWACG.

regards,

Peter
