Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1015E334C26
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 15:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763135688; cv=none; b=jxeWOcq5DK3F7h1J2UTIBBAl3R59xjXTGpQ0hhDNUxbJ2XhbMBxQzv+tQ1pZCXPX/9lFhZEDHL8E2ZE4Z7Dps8mvtKoOqZdInrbseTYVsTAvwpwlslG0qwaATdrf/9xkREoMgJHiFRHEA3e5/T9y824oFLwef4223UkLRPTGugw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763135688; c=relaxed/simple;
	bh=Jk5JSmxEp0HQ6Ptor41fJeYFMKyH+DMMft/X2zxuyiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/xHnbQtAX9OTXy2x3cB1vKqCQFdPM//k2W5R8KdI9p9pLwA0pvlaInuGDYqy2OLceALMjOmYPKlcs+EtRzH4N50WcPGiqg/EWsSAyboDOdnZOYkLi/SUpAGBTIbuLqFTvQy1upp/NItclTbRj3RY1rPNo7r5l9OXn03a8doSOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgBmdEKT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgBmdEKT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E65C4CEF8
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763135687;
	bh=Jk5JSmxEp0HQ6Ptor41fJeYFMKyH+DMMft/X2zxuyiw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UgBmdEKTDGiYVfpy2hkvCXfk3uWC4J3SK6oa1txw8z2OVO6PN5nu/9tj/T32/w6y/
	 BhzL+kNoREA3BP+kJrpg356lrtpmPYQErhimKRw9OLNHU6g7+lzGm9/55a3uOZT3H7
	 GGnzo0mnJVopBvjTd9l5h4T1eR/hCpnGeoiyQt9ze2CYTSeu3yQZnxvX/12ijR7laR
	 oDfeK2iuJED+uWkdIuk8aBjkc+//IwnsqHLxkOEvb2Ej1VA2isGXiNPFbfmGiRgF0O
	 IXKRayKW6fWc2T1fm2kslUudIcL85uCJOWtQE/WXucEft5bMt2MvErrZ1WWh6xxxjG
	 1xguQz98wgNGQ==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6419b7b4b80so3109138a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 07:54:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/6E7zUqFTzopWBMafKrBLzqVJpkMq01wSMmYYrK7aSig2yCC+vgKM7dEfuMsI77UoQWBezKUj39ZGx4LQVy8grQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0RPcw/XNx+uQN77wYB0eDN33Oza0v/9pGtv2FSuVdw33o/5CW
	l2gc+V3elfg5OHJpAU/olNAI8B/YQ7chx+/U//pyvBRBK5uw/lTBtOO4yN7c8FMbR3NRHHHVAiU
	HQNIi7gwSdies6G5L6vPKU+9TaMWTnA==
X-Google-Smtp-Source: AGHT+IF49BCOAXcksr6jxI1XuHeLVxsuwlCSI/U4/vtzUjKtf60KEEkA0yjf+Awa59L5KtlnwetAifVA0/77G7MfGqs=
X-Received: by 2002:a17:907:94d6:b0:b65:b9fb:e4a7 with SMTP id
 a640c23a62f3a-b73677ed936mr342085366b.9.1763135686164; Fri, 14 Nov 2025
 07:54:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
 <05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org> <CAD=FV=XXWK9pmZQvNk6gjkqe6kgLXaVENgz0pBii6Gai7BdL-A@mail.gmail.com>
 <00ea821c-5252-42cb-8f6f-da01453947bd@kernel.org> <CAD=FV=VSxeKgGcsRb9qiXq7nsbOWZjPvzmGEOhFA+pmABWdknQ@mail.gmail.com>
 <6490f20a-2492-4ee0-8f34-d529e0df0bad@kernel.org> <CAD=FV=Us7SU_OifVkS4mdfVhc=xGYSBiBpBk9aA1Ki0y+iYBpQ@mail.gmail.com>
 <abb77afe-c285-46ba-88ac-08574bd67712@kernel.org> <CAD=FV=VcAbgv41tjgWQN4i8Wqk6T6uvdpQ261Q_hcKM4AMpGEw@mail.gmail.com>
 <20251114-elite-refined-yak-bf9e64@kuoka>
In-Reply-To: <20251114-elite-refined-yak-bf9e64@kuoka>
From: Rob Herring <robh@kernel.org>
Date: Fri, 14 Nov 2025 09:54:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLUNyMC274cXFcdfY7N6_uY-PrbH5RDiOfrfe2D_OAwjw@mail.gmail.com>
X-Gm-Features: AWmQ_bn39ZgmKmSKZ9R4JlObI-OyA36Q7CJrSlb2twcDbMEmJ4DyC3n98UiHAJg
Message-ID: <CAL_JsqLUNyMC274cXFcdfY7N6_uY-PrbH5RDiOfrfe2D_OAwjw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 3:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Nov 13, 2025 at 10:04:53AM -0800, Doug Anderson wrote:
> > Hi,
> >
> >
> > On Thu, Nov 13, 2025 at 9:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > >>> Yes, the complexity of just "hooking up" the components on an SoC=
 is
> > > >>> an order of magnitude harder than a Raspberry Pi, but it's still =
just
> > > >>> hooking it up to external components. In both cases, we are model=
ing
> > > >>> the core "brains" (the part that contains the processor) as the D=
TB
> > > >>> and everything else just "hooks up" to interfaces.
> > > >>
> > > >> You mix the topics, so I don't follow. I speak here about bindings=
 - you
> > > >> cannot have the that compatible alone, because it is incomplete, j=
ust
> > > >> like compatible for "transistor" is not correct in that context. Y=
ou
> > > >> speak what could or could be DTB, different topic.
> > > >
> > > > A "SoC" is "complete". It has a processor that can run instructions=
.
> > >
> > > Then show me executing any piece of software, which is the consumer o=
f
> > > the bindings, and runs on the SoC without the rest of the hardware sy=
stem.
> >
> > Show me something that runs on a Raspberry Pi (the models that don't
> > have eMMC) that runs without hooking up power and plugging in an SD
> > card. :-P
>
> It has MMC controller/slot described in the DTS and the SDcard itself is
> DT-transparent, meaning you do not describe it in DTS, plus I can easily
> insert such card, thus for sake of this discussion that RPi still works
> fine with DTS.
>
> This SoC cannot work without other pieces described in DT, that's why it
> is incomplete and unusable on its own.
>
> You are right that my previous arguments of hooking components are
> incomplete, so let me rephrase it - the DTS file should be complete from
> DT point of view and completly usable on its own. That's why DTS
> represents board (with the exceptions of few SoMs as explaiend to me
> long time ago).
>
> SoC does not meet this criteria, therefore it is not suitable for DTS.
>
> And if you claim that SoC could be fitting DTS, then I claim that
> individual transistor or one IP block like DWC USB3 could be there as
> well. With your arguments we could create DTS files for DWC USB3 nodes.
> Fact that transistor or DWC USB3 cannot execute code on their own does
> not matter, because it is nowhere said that DTS represents something
> which can execute code. CPU executes code, so following this argument
> DTS could contain only CPU device nodes..
>
> If we allow subpieces, like SoC components or SoCs (both still unusable
> on their own), as DTS files we open the pandora box of all possible
> styles and formats. I don't see reasoon why would we want it, what
> benefits this would bring to the ecosystem maintenance.
>
> We did not document it that DTS represents usable board, but it is
> implied all over the software projects, like GRUB devicetree [1] which
> takes one DTB to load. Only one.

Obviously at the grub and kernel level we support only 1 DTB. No one
is debating that here. Can we back up and stop debating implementation
details.

The problem is in early boot before there's DT used where you
determine the SoC and/or board at runtime and need to load the DTB
from that information. Both are dynamic in Google's case, but it could
easily be only the SoC or only the board is determined at runtime.
There's another similar usecase of booting a SoM with a SoM DT and
then applying the baseboard DT overlay. You could want to do both in
the same system. Your options are either have every possible
combination as a full DT or have a way to combine them at runtime in
some way. I'm pretty certain the answer for the former will be there's
not enough storage. So that leaves the latter option.

The only real answers here are a) your usecase is not valid or b) how
to implement the usecase.

Rob
