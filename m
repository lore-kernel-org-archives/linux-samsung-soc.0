Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABF82DFA24
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 18:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763146442; cv=none; b=f5mtCmB8SfFQlRG7v01/2XTt5h+GDoPAGxYuXEUkV0fydGrvbeOUQIuCawphYKm7GFxMjBUt0eWiu3fb0aXkbLv55pMY39vC6HpKDEGG+RoD7r83Y/SatejozDkq0RAJI3pOtcCdyWETKd5vNuQXBT/b+1D+GqEWYisPou4SQQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763146442; c=relaxed/simple;
	bh=8TO+rU3SAwUBFqXZ2q0FkqFTottvFyTgXl9sDHim0/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cKHxxz+K5lgchPyTmrR10qXqlbyKO/CZzQBxowb2UV5l9av84ZUz2uiQHUJREypGhGTPhvJ0NaZLZmgg4Lxm4MFP5TUs53DO14u55NJPQzcQFrvsIs9JUqEw5LJa3+VxLAhdA6yMFqYaAm33/sYYtA4rfeosd+2z5BCWFvWRrlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dlQdWLma; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dlQdWLma"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7277324204so306391666b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763146434; x=1763751234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbqPFpwRTAIoW3wlPa8y61lf1dLEt0wfuDryfbMZciM=;
        b=dlQdWLmamHiSA7nCIDtHcRK2qVsGO6neTfc7nm3zUvi6LA4YcCBuvU2jn3oJY9ppRW
         M4QQr9T8c+Y+EwGd22JFZPEdImQ06th5EO1fVJ8inI3tFKFvuimz69H6VrjNXhESNR3D
         +cFBWye11s8J1dL770aWJLM2zwUuIyUovpzBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763146434; x=1763751234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LbqPFpwRTAIoW3wlPa8y61lf1dLEt0wfuDryfbMZciM=;
        b=cYGboYhrT3f4UzpZsU5pTj3+Z3BAdm2tIlynuRroVicy/FfAnnzaRSADDeDs6UxqTl
         qKpYJzMRyvC/ps8XSsCJJ7LZfEX5NSfLg56EoBKeOX0EW2rAHhCnDoWYDMKwq/f6moE0
         7lnoJvIDyXXS01NeYz4umptcgac+7DtbgSdRsb005FLziT6EL7antUYe5Q8oB1IV2lqB
         5T5e7PqHhYQsPp5o1Kchn/WMuvT985GgZqHNAx5/NL6Vxq7VVmX22dTNA4YezP/zt+N/
         VCZSJAojeQadftQeYIF0CijlnXv5uy5QVvHftcTiZgZUzZmGN0ILFaJWZ5n8d1YeordA
         gr3A==
X-Forwarded-Encrypted: i=1; AJvYcCU+uLyxhkWAk/NwQcZIFNetMlXjVulxlU8wz0EpbPm2MjVVfoH8BQKZBm+PHMqTsnDkS9KHzwPh+c67nogAo9CYxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHuBxsd+iWMQTzzm+J3rRImIlQWzV6JfJvOU52CC6Z69UQ8nJZ
	pQoi4u8o1aZMlgLn0wtBCl+27quPw7A81Y6U4X9PMY0rahYa2A6d/bHDTHJCUMm1mFlhCmniJ+O
	RlTysPbln
X-Gm-Gg: ASbGncuJ3BNQpq+aSct+UU/vokw9F+DdVlBl9nKMsCuyunQa5jz74anbGmlTJvKsalY
	3B8d18mMWdZC8xW8R/OYo+liD0qn0HXqh1q1uWHpatvy8cqb2KqKFVu02uvE0h6Nk17Y3YLIeD9
	RdZvc0SYyJJkpwSX4rwwFXox9RPryQbFWa5JsHUjVy1CIPu5rbbdqnfT2UYPM0/4/ZJCiHrq0to
	iTMNTKJPbNICp6HWiMbsQks1usRtWgNow/5YDH/K6uhERR7b+I2HZYsc0vY+UDo891S1Jm1ekZI
	YjygkDMwZdMic8SE2GpS64c+IfeWvU0pgbKsohYlzOtv9WEtMZXkLUNpKTwakngsgXBlCFb7UuZ
	xIE4FLiXAM2ctvfUOk+iKKO8P6JPFB0e6SHjR54k0Hkv9+bgchDsgiRaDk/R/g23s5k78n1orZ5
	h20zsJXNmucmS4oMQOYPyl9xgSjUFlGOMthJSkrfWGOU6ggSVMrQ==
X-Google-Smtp-Source: AGHT+IE0ixSREhQUvN5eJnWW9Xk8iJSE1fZIhLG30c5VfbIU2Yt3R6wQL/fEwoMuEV3yK4LcIg4YwQ==
X-Received: by 2002:a17:907:3e22:b0:b70:7cd8:9098 with SMTP id a640c23a62f3a-b7367b6e96amr371638966b.61.1763146433164;
        Fri, 14 Nov 2025 10:53:53 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80841sm444208866b.41.2025.11.14.10.53.51
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 10:53:52 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-429c7869704so1769447f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:53:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU95ZrzQt8PqogKI3Byri7O0mcQAWNh71aA4iI5WTNtkW/9ntloI30XZKPjcqhwFdlYMINlddeMKB9ZMBffwHvREg==@vger.kernel.org
X-Received: by 2002:a05:6000:2913:b0:42b:394a:9b1 with SMTP id
 ffacd0b85a97d-42b59382378mr3447749f8f.37.1763146430499; Fri, 14 Nov 2025
 10:53:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
 <20251113022719.GA2281498-robh@kernel.org> <CAD=FV=WUXK_xs4taxs8Q4kxqvkNYE+Ftk3N=N7Nm7yKEvUMtAQ@mail.gmail.com>
 <20251114152005.GA893333-robh@kernel.org>
In-Reply-To: <20251114152005.GA893333-robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Nov 2025 10:53:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W5=AVYeZvz_LxC2-7U83yErY0JGc2nZQ37Pf54FH8++A@mail.gmail.com>
X-Gm-Features: AWmQ_blaQNyngmlbZLa3H09wQNzECeksQmL8BlRH-m0SJuISOZbTHr-JpmObilA
Message-ID: <CAD=FV=W5=AVYeZvz_LxC2-7U83yErY0JGc2nZQ37Pf54FH8++A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 14, 2025 at 7:20=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> > NOTE: I don't think this is a novel problem. There are already
> > existing overlays that mess with the top-level compatible...
> >
> > grep '^\tcompatible' $(find arch/arm64/boot/dts -name '*.dtso')
>
> That's empty for me...

Ah, sorry! I didn't know how to represent the tab character in a text
email. You have to replace the \t with a tab character (Ctrl-V Tab if
you're in bash). I should have stated that.


> > > My concern here is largely around validation. Can the SoC DTB pass
> > > validation, and can we still validate the whole thing at build time? =
To
> > > start with, it's not great if we have to make the schema allow only a=
n
> > > SoC compatible without a board compatible. Then suddenly omitting a
> > > board compatible is always valid. Solving that with an entirely
> > > different SoC compatible as you have doesn't seem great.
> >
> > I guess, in theory, we could solve this by simply not trying to
> > validate the SoC "dts" file on its own. Is this as simple as giving it
> > its own filename suffix? Do we just call it "lga-b0.dtsb" or for
> > "device tree source base", or something like that? Then we add kernel
> > rules where we don't validate that on its own but only validate it
> > together with overlays?
>
> We already do that with overlays. They are are not validated on their
> own, and that's why we require them to be applied at build time to
> something. Though that's hard to enforce and I'm not happy with
> extending that to the base.

OK, fair enough. So the requirements for the SoC-level tree seem to be:

1. The base can be validated on its own.

2. It's obvious that the base isn't "complete" by itself.

3. We expect the top-level compatible string to continue to be
built-up until we consider something a "complete" device tree, so we
need a scheme for this.

Did I miss anything?

Those feel like solvable problems.


> As an aside, part of what makes validation so slow is N boards
> for an SoC validates the SoC part of the DT N times. I'd like a way to
> have a quicker validate all the SoC DTs.

Looking at what's downstream, we do appear to be doing M x N
validation where M =3D number of SoCs and N =3D known boards. I'd agree,
that doesn't scale super well. That being said:

1. It's not expected for the number of SoC to scale up very high. I
suspect it would be super rare that a given board could be made to
boot with more than a small handful of different SoCs. Here I'm not
even just thinking about the needs of the Pixel team or Google, but in
general it seems like it would be pretty hard to make a board that
could handle a very big variety of SoCs. I think even if we scale this
to larger things like SoMs, the answer still feels the same. NOTE:
here, I'm only considering the problem of combining things until we
get a "complete" board (one where we're no longer expecting to munge
the top-level compatible string). If a SoM has enough stuff to be
considered "complete" (we stop munging the top-level compatible) then
I think we're back in the pre-existing overlay problem.

2. Even downstream, I believe it's really only the dev boards that
could have various SoCs plugged in. While it's possible someone made
the choice to build half of our "proto 0" boards with A0 stepping and
half with B0 stepping, I can't imagine that happening for more than
one board revision. Thus if D is the number of boards that could have
more than one SoC, the validation would actually be (M x D) + (N - D).
It can be noted that this is the same number of device trees we'd need
to validate if we gave up on using overlays and simply included a full
device tree for every valid combination, like what we did with
Chromebooks.

As far as I can think of, the only way to decrease the amount of
validation would be if we declared some sort of "interface" for the
SoC tree. Then we validate that the SoC trees provide that interface
and we validate the overlays against that interface.

I can't imagine something like that being specified manually for
something as giant as the interface between a board and the SoC that
would let the board validate solely via the interface.

I also can't quite imagine a tool that could somehow analyze all of
the SoC trees and generate some sort of unified interface. The .yaml
files are allowed to have complex enough rules about properties
depending on other properties that it doesn't feel like you'd be able
to succeed.

That being said, I could imagine the idea of manually specifying an
interface for more constrained uses of overlays. For instance, it does
feel like you could maybe express an interface that a "cape" needed,
then validate the "cape" against that.

I'm going to _hope_ that solving this isn't a blocker at this point in time=
?


> > > My other concern is whether this is an ABI between the SoC and board
> > > DTBs? And I don't mean just you, but for anyone wanting to do anythin=
g
> > > remotely similar. An ABI is a problem as we don't really have any way=
 to
> > > validate each piece separately. (This is already a problem for existi=
ng
> > > overlays.)
> >
> > To keep the problem smaller / easier to think about and not try to
> > solve all existing problems: the only case we're worried about at the
> > moment is when the base device tree and all overlays are generated at
> > the same time. That feels like it might be an easier case to handle?
>
> I know you don't care. I just don't want a mixture here. And if anyone
> wants this to be an ABI, then the pieces need to be validated.

Hmmm, any way I can convince you that the problem is different? It
sounds as if it fundamentally breaks down into overlays that need to
munge the top-level compatible string and ones that don't.

Overlays that need to munge the top-level compatible string are likely
doing very complex things that are very tightly intertwined with the
tree they're overlaying atop. Yes, someone could pretend that there's
an ABI here and someone could try to build an out-of-tree overlay
against it, but I would argue that it's an unstable ABI you should
expect things to break.

Overlays that _don't_ need to munge the top-level compatible string
are doing things that are much more constrained and it feels like we
_could_ define a tight ABI to validate against. IMO, that's a very
interesting problem to solve, but it's not the problem I'm trying to
solve here.


> Maybe
> everyone is tired of us beating the ABI drum and will be happy if it is
> not.

I certainly appreciate all the work DT folks have done towards
validation and also to making sure that DTs are clean and sensible.
:-) I know my thoughts on the sanctity of overall DT ABI don't always
match DT maintainers, though I certainly understand where you're
coming from and why it's a problem folks try to solve. In any case, I
don't believe that the rules I'm introducing here would interfere with
the sanctity of the overall DT ABI.


> > > > +              - google,pixel-id-070302-rev-000000  # Proto 0
> > > > +              - google,pixel-id-070302-rev-010000  # Proto 1
> > > > +              - google,pixel-id-070302-rev-010100  # Proto 1.1
> > > > +              - google,pixel-id-070303-rev-010000  # EVT 1
> > > > +              - google,pixel-id-070303-rev-010100  # EVT 1.1
> > > > +              - google,pixel-id-070303-rev-010101  # EVT 1.1 Wingb=
oard
> > > > +              - google,pixel-id-070304-rev-010000  # DVT 1
> > > > +              - google,pixel-id-070305-rev-010000  # PVT 1
> > > > +              - google,pixel-id-070306-rev-010000  # MP 1
> > >
> > > Should upstream really care about anything other than MP1? I don't th=
ink
> > > so. Which ones are useful in 1 year, 2 years, 10 years?
> >
> > I suspect that nearly all of them are useful, though _possibly_ some
> > of the early proto devices can be removed?
> >
> > Specifically, engineers at Google will be supporting these devices for
> > many many years to come. Newer Pixel phones have something like an
> > 8-year support life during which engineers will need to continue to
> > support them. From my experience on the Pixel team, unless you can
> > demonstrate a need for something newer it's common to get assigned EVT
> > 1 or EVT 1.1 devices when you request hardware, even for older phones.
>
> Okay, fair enough. I would drop anything you aren't certain you
> need. You can always add it later. It's also only really useful if you
> have DTs with the values *and* you run validation on them. If you do,
> great! If you don't, then upstream is just carrying dead code.

FWIW, my plan was to document all the compatible strings, but not
necessarily add support for everything. In this series, I added
support for just "-mp", though I'm booting the result on an EVT 1.1
device. With the barebones device tree I've added so far there is no
difference between EVT and MP and the bootloader is OK picking the MP
one since it can't find the EVT one.


> > > > +          - const: google,lga-frankel
> > > > +          - const: google,lga
> > >
> > > It's not clear to me how you map boards to SoC revision? You boot up
> > > using the SoC DTB and then select the board DTBO based on?
> >
> > The key here is that combining happens in the bootloader. The
> > bootloader boots up and has its own (non-device tree ways) to handle
> > things. It then looks at the SoC ID register, looks at the IDs that
> > tell it what board it's running on, and picks a base DTB (representing
> > the SoC) and an overlay (representing the board). It combines these
> > two and passes a single unified device tree to Linux.
> >
> > Maybe this is a key difference between what we're doing and what
> > you're thinking of? We're not trying to boot the main OS with just the
> > base.
>
> But others are and I need to worry about both. Conceivably, someone
> might want to do both. First combine the SoC and SoM DTs, and then
> combine that with the full board DT.

Fair enough. It's something to keep in mind, but I _think_ this case
should be handled by my current ideas.

1. If the SoC, SoM, and board all need to add to the top-level
compatible then they use my scheme. All valid combinations need to be
enumerated in the kernel Makefile and no stable ABI is intended
between the SoC, SoM and board.

2. If the SoC and SoM together make a "complete" top-level compatible
and the board doesn't munge with it, then we just need all
combinations of the SoC / SoM to be enumerated in the kernel Makefile
and the board simply falls into the existing "it's an overlay"
scenario.


So anything that is an "incomplete" tree (doesn't have a full
compatible string) is marked as such. TBD exactly how. Incomplete
trees can still be validated on their own. All valid users of
incomplete trees must be stored together with them so they can be
validated, and all possible combinations must be enumerated. No ABI is
provided from an incomplete tree to an overlay that wasn't enumerated.


> > > This all
> > > needs to be well defined and general enough any (existing) platform
> > > could use it. If [1] helps or doesn't work for you I'm interested in
> > > hearing that.
> >
> > > [1] https://lore.kernel.org/devicetree-spec/20250911151436.2467758-1-=
raymond.mao@linaro.org/
> >
> > Perhaps I don't understand the proposal, but it doesn't seem useful to
> > me (?) or at least it's not relevant to the problem we're trying to
> > solve here.
>
> > If I had to guess, I'd say the problem they're trying to solve there
> > is that they've got some external peripherals (like an i2c-connected
> > dohickey). They want to ship their dohickey to customers and tell
> > customers that they can attach the dohickey to any of a number of
> > devboards. If a customer attaches their dohickey to a Raspberry Pi it
> > should go on, let's say, i2c5. If it's on a Beagleboard they'll say it
> > belongs on i2c3. On an stm32 it belongs on i2c11. So they distribute a
> > bunch of "dtbo" files with their dohickey, one for each target
> > devboard. This mechanism allows a loader to figure out which devboard
> > is running and which overlay should be loaded. Is that right?
>
> That would be more the connector usecase.

Right. It was the only usecase I could come up with where having the
base device tree compatible name was both necessary and sufficient for
knowing if an overlay should be applied. :-)


> It's more how do you know if a base DT is a valid target for an overlay
> DT. I guess that's an orthongonal issue. You only have one base in your
> series, but in general how do you know what base to apply the overlays
> to? You've encoded that into the Makefile. The overlay-compatible scheme
> moves that information into the overlay so any s/w can figure that out.

I talked about this a bit in the 4th patch in this series. In my mind,
every possible "loader" of the overlays will need different
information, so there shouldn't be just one scheme. I explored that
idea a bit [1] and I proposed something like this:

/ {
  loaders {
    mkdtimg {
      board-id =3D <0x1234>;
      board-rev =3D <0x5678>;
    };
    other-loader {
      something-else  <0xaaaa>;
    };
  };

Then under the "loaders" node we have node names that need to match
exactly for various loaders and then properties that they need. That's
just a quick proposal for the syntax, so happy for that to change. We
would definitely want to add some sort of bindings doc to let us
validate that.

Yes, clearly there could be lots of "loaders" out there, but I would
expect this number to be fairly constrained? If nothing else, if you
think someone's loader isn't worth supporting I guess you could deny
their bindings...

I have no idea what "loader" (other than "higher-level software or
firmware") is intended to consume the "overlay-compatible" of the
proposal you pointed at, but information that could go into the
bindings doc and would actually help me understand why the base device
tree compatible name was necessary and sufficient. :-) NOTE: if two
loaders can both use the same information, that's certainly OK too. We
could name the node after the loader that came first, right?


You correctly point out that I've encoded possible combinations in the
Makefile, but this is more in terms of enumerating possible
combinations so they can be validated. It does nothing to help the
loader pick the right one.


> I think it would help if you described what you want to do more
> generically rather than mixed in with "add a new SoC" and send that to
> devicetree-spec and perhaps boot-architecture lists. Present the
> problem, not just the solution.

Sure, though I think the problem has been discussed at length in a
number of situations before (mailing lists, conferences, etc). Each
time it seems like it ends up being too complicated and folks hit dead
ends and stop trying to upstream. Downstream just keeps doing their
own downstream things because there are tons of people all hitting the
same problem and there's no upstream solution.

IMO we need to start moving into the realm of solutions. I understand
that upstream doesn't want to accept some poorly-thought-out scheme
that will cause long-term grief, but at some point it feels like we
need to accept something that's "not too bad" so that we can at least
iterate from there.

After re-reading all the above, it feels like we're not that far from
a solution, though perhaps you'll read it all and say that you hate it
and that we're not as close as I thought. ;-)

[1] http://lore.kernel.org/r/CAD=3DFV=3DW3CTMkWPMN5GqGg_L_bUT2Q9vLpc43p5kWA=
f+j5HBEGA@mail.gmail.com


-Doug
