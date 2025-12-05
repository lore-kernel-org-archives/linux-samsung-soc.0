Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356C0280A29
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 20:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764965979; cv=none; b=HG15cMF2Radfu0n+AEyr7WTMt8aSL7IOlY6NfU6bCJofprrfFrmZ41o+b8jaj4a3mzWmmawORwEMOwDeR8iSlwSpfUBz19W0kAtw4N7q1IHMgnOfRbpKh5Eh2mKTWos/bWyJSoxp2tyG1dX2Qow3pxIBmi4cxlwM/pmUTSmaPRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764965979; c=relaxed/simple;
	bh=QvV5ac3UPAUOpNjnIM4GRf8TjdDG2xguqUsq832Ab1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UN+LPM5ZxylPkMesoD04WX0LiW7o0x1xHsOl0oZsYyWVNq8WLaCL9sW57/G+nZaZKsX6Uj/qasLjZLGk7iHeDnaDUNwYpXqG6W4HMtJ76db1wAGJPMGDiZkvsIBdPJ/+tPFAC9M5LgMvosHqz5kULY5HfiiFUQdvABhbq8jWCho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DjbUlgjX; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DjbUlgjX"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-298145fe27eso38146065ad.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Dec 2025 12:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764965976; x=1765570776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvV5ac3UPAUOpNjnIM4GRf8TjdDG2xguqUsq832Ab1Q=;
        b=DjbUlgjXYXJj4lHFUdRr0YqPIWG4dB0mWJEF8W4TmQGSJDq8ox+rqq3fpN2VfuwNpY
         2gY//vvDyCP01xsqROTifzAbCW3p+xh0tV+Q3m9D7nZogxCVOVPS82UHGy7Fc0WD+R5m
         cxAKjF1jo5ivIkvgttn6qRHsKVsR9hx4idmOhCd3jiNWjjjU1Ph3MxDt+hF4waWozMzn
         XeW0svASfeSAV9uhI/JC+4ijgaPwsnChyb7AU08wXeg+H6jDfYytfIcfPe3B4pzkAVsd
         Zrlc2+gos+TI5pGvP+z1plZNLAnvOvTKlx+GaMVjWGE4xXDrLVgRSNmS6phSYF2sa9D8
         qkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764965976; x=1765570776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QvV5ac3UPAUOpNjnIM4GRf8TjdDG2xguqUsq832Ab1Q=;
        b=M+OqkC6ANKuz7fOkMhZ1K8S1+N0x5dIfsV4r6hApDxZSJ4GorTFwaZaZSXp0fXpw4o
         KdjaJTWug5cB3LUT8m6VgOWrqCTFUboMI7h6OCB3wloB8kwaXgj80zfhNS99JI00rZ0k
         TS7SxmqNsCXRFXdSYQAgmI/uch8N28UgZqxr9aS92dhifuXsWiB1dbv5fP3MmF94+8+A
         Z6EkGMqBHb6El9RnWLB7FIDMd9Mxb0yYiYj1yRfWWQt4+059kwVENaDZ+frJid3vwb0T
         oR0HMcMzjqG42JhgzBgPoZvt+66YNRJOSLg7EN44BPL6CuWlH5INpQD2tlaNYLrp2sL0
         udlg==
X-Forwarded-Encrypted: i=1; AJvYcCWDSrF5D6VjOu9RibtTmXm3KqPG46u/fuZuroR3takavYiBAyhNBTnlC2mg1/HpO5WVX182WDThbUgLGQZgvHQLcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvdRKP/hkIcp2DNk83mwTabKjcV6B3+076RH/v0iiv8eF0yVGA
	Upcih8QjGmsKIeDVEYWy7YMfDZkOQDJOuGkF07rY4k5MtzYdhdQFtu/noKjfKsWsfvDYHwSZxlX
	I1cHTVxcUvLwr7kChseAg1ImaWCmDCjH2+gmRU+VE
X-Gm-Gg: ASbGncv3sCunNr/Fz2T8f7RYcc1NMO7lbXddTeboHXbFhLjsM3ejoi0+iYzj/fkUmOy
	dEVUCr4jDXVU5eZLSx1zFt+6kwdgBcjnlisCdFUt98bcUuJEWLjbyGzmuqoKN1a06XBaOLx2HjK
	uy+Na2b2MF5jQgZWDiKa+gvXjCFvYv4U+1dfLcZyG2bFsJg9jQ56hI77EZIAcAAKTJopaxvvWhO
	GQYzEMmsnCMLxrBs8iQd/AgQUNbnanLd2J9u9nEcvSu1BgLzoOcKJu2NUAmxTBy3hcbBmMmR8VL
	1kZ7s5yXZAtQYEsbyhrCf9Q04WY=
X-Google-Smtp-Source: AGHT+IGbi66b69isMZCCE2vWfm2l3aWjIU/6Jm7GoDCB7TYGbRrZY7LzGOWLW8ndmCQQy2C2xov9C9hN/n0jZy26kcQ=
X-Received: by 2002:a05:7022:b95:b0:119:e56b:c74a with SMTP id
 a92af1059eb24-11e0315aa31mr278198c88.15.1764965975826; Fri, 05 Dec 2025
 12:19:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205-phyb4-v8-0-c59ea80a4458@google.com> <20251205-phyb4-v8-1-c59ea80a4458@google.com>
 <18eeb1c5-d21b-4505-b6a4-472f6e191864@kernel.org> <CA+zupgwa+m8Pa=+8shORaOA1OO6zoo6zYEojFS2UDuP0doBq7A@mail.gmail.com>
 <f32e0810-56f9-417e-abf6-0cc7b361bd15@kernel.org> <CA+zupgyxQisYBnLj9_3DtcN3R1Ugfv+-p-wimFp-hnqkhrrgyA@mail.gmail.com>
 <988b3fcb-44db-45ca-823b-5ab13206bd04@kernel.org>
In-Reply-To: <988b3fcb-44db-45ca-823b-5ab13206bd04@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Fri, 5 Dec 2025 12:18:59 -0800
X-Gm-Features: AWmQ_bkSdeahcfk9MTu5RJ__-7yt4YnGMQ_a-ehzxXaIp_XrZSBLGUDbWDooSxE
Message-ID: <CA+zupgzi55svWK4gHsFtdQSD9jFKbxHx_0GE2R1R5DafmYyGNA@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 11:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/12/2025 20:11, Roy Luo wrote:
> > On Fri, Dec 5, 2025 at 10:52=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 05/12/2025 19:47, Roy Luo wrote:
> >>> On Fri, Dec 5, 2025 at 9:13=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>>>
> >>>> On 05/12/2025 04:54, Roy Luo wrote:
> >>>>> Document the device tree bindings for the USB PHY interfaces integr=
ated
> >>>>> with the DWC3 controller on Google Tensor SoCs, starting with G5
> >>>>> generation (Laguna). The USB PHY on Tensor G5 includes two integrat=
ed
> >>>>> Synopsys PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort c=
ombo
> >>>>> PHY IP.
> >>>>>
> >>>>> Due to a complete architectural overhaul in the Google Tensor G5, t=
he
> >>>>> existing Samsung/Exynos USB PHY binding for older generations of Go=
ogle
> >>>>> silicons such as gs101 are no longer compatible, necessitating this=
 new
> >>>>> device tree binding.
> >>>>>
> >>>>> Signed-off-by: Roy Luo <royluo@google.com>
> >>>>
> >>>> Why intentionally dropping the tag? How are you handling this patchs=
et?
> >>>> Rewrite every time from scratch?
> >>>
> >>> Hi Krzysztof,
> >>>
> >>> I dropped the tag because a new file is being modified in this versio=
n,
> >>> Although it's just MAINTAINER file but I thought you might also want
> >>> to take a look. I wasn't sure if modifying a new file qualifies as
> >>> "substantial" so I erred on the side of caution. I should've called i=
t
> >>> out specifically in the change log. Sorry for the inconvenience.
> >>
> >> 1. so just squeeze that change into second patch and no need to ask fo=
r
> >> re-review
> >
> > That's a fair point. I will be more mindful of the review overhead
> > going forward.
> >
> >> 2. You did not read my complain fully, look:
> >>
> >>>
> >>> Regards,
> >>> Roy Luo
> >>>
> >>>>
> >>>> <form letter>
> >>>> This is a friendly reminder during the review process.
> >>>>
> >>>> It looks like you received a tag and forgot to add it.
> >>>>
> >>>> If you do not know the process, here is a short explanation:
> >>>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new vers=
ions
> >>>> of patchset, under or above your Signed-off-by tag, unless patch cha=
nged
> >>>> significantly (e.g. new properties added to the DT bindings). Tag is
> >>>> "received", when provided in a message replied to you on the mailing
> >>>> list. Tools like b4 can help here. However, there's no need to repos=
t
> >>>> patches *only* to add the tags. The upstream maintainer will do that=
 for
> >>>> tags received on the version they apply.
> >>>>
> >>>> Please read:
> >>>> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/proc=
ess/submitting-patches.rst#L577
> >>>>
> >>>> If a tag was not added on purpose, please state why and what changed=
.
> >>
> >> Where did you address this? You dropped the tag silently.
> >
> > Why: a new file is being modified.
> > What changed: MAINTAINER
> > What's not changed:
> > Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
>
> I don't know if you still did not get the problem or you think that I
> really need that clear answer. So no, I do not need that clear answer, I
> understood with first reply, but you kept explaining instead of
> admitting that your changelog needs fixes. So I still do not believe you
> understood the problem here and you might repeat the mistake.

I admitted that my changelog needs fixes in my first reply.
"I should've called it out specifically in the change log. Sorry for the
inconvenience.".
Maybe you think I didn't read through because my reply was placed
before the <form letter> section, but that's a misunderstanding.
I did read through the paragraph, that's why I mentioned the
changelog in my first reply.

I also misunderstood your question of "Where did you address
this?". If you were asking where this should have been addressed,
obviously the answer is to address it in the changelog,
but I thought that was already made clear in the first reply and
you might be asking for a clear answer.

>
> I think you need someone in Google to coach in this process, because I
> even gave you the exact link describing the process and what was
> expected. I even pointed specific paragraph, so you don't need to read
> entire file!

I appreciate you pointing out the specific paragraph, I understand
you're going above and beyond here. I did read and understand
what should've been done instead for this patch.

>
> I assume you understood what should be done instead in this patchset.
> Anyway, my previous tag applies if there were no bindings changes, but I
> wasted too much time here to care anymore. The expectation from big
> companies is they do not ask community to coach on basic submission
> process. It's quite unfair to my spare, personal time after work,
> considering how much big company is making. Big company should invest in
> this coaching.
>
>
> Best regards,
> Krzysztof

Thank you for the feedback. I understand your frustration, and I
apologize for taking up your time. I will be sure to be more thorough
in the future.

Thanks,
Roy Luo
