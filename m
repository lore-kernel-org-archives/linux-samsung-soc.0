Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA46278161
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762981196; cv=none; b=K4sInrMRpPSrKsmHgvot8U0fbjpFWcmkbRj+CMpamiFLc9gsZKBjscZKu/FNXWe+h+qMZMLiVfaWPMA4+HpDuPl/F3HJxPpx4Q08aQRPXQBn5WV6PBSvimlLQKX1EJbz7CKfzlhD+Y5EbMXfiPYXqnDu1jBc/k85nCRgn5nMHns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762981196; c=relaxed/simple;
	bh=lSM8TUPBcAeqeTcRKSUm+acFgYjnvWEI/RvmNCSBz+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUUpBv5U2d3+jjr/gyRnvqLwOYMTQ/50w9KqlVbnAaAAr6MjZda4U+eTrtAQS5kR01iFIh5/TQjJrzUfVvwlZurOAsFc4NYDtFO0gzzHwCuagWmp0UHucb1T2yIM2iqVy3s3vViMUePZ0VVP0GHN+NTj62W5+KUqP4hgOEwTsro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dyhhmm6E; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dyhhmm6E"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7321b03aecso7685866b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 12:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762981190; x=1763585990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uIncMys0gzBr3R1k/SsZNnB5Fy2d3cOf2SnN1h7VDg=;
        b=Dyhhmm6EQZAisfusq9eQcBVTBkftcDMNslUJl2Fgl/qvnPvzxci8vY7adZ6EMYKaip
         XisxfiNDnJOLZ8CzWKrP16LFgvBVTvJlYZvEL++WooSbXivTgIDCVgDBbxxMh3JUCG/c
         lhnhoHy0o34VkZiOhuKhhodVpspr0h8c3Qj5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762981190; x=1763585990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2uIncMys0gzBr3R1k/SsZNnB5Fy2d3cOf2SnN1h7VDg=;
        b=hyhnlbMgzJ77YDcdMteGCvSVltq+XYp8f6+EaeRABNjLB3BYiTUk85CLEVWMshIaGG
         m+UV6o6enm8v8jGaGY6LquU5XAI1JwATC3fDw7j04B6zKWhkNyADW+LGNRv54rXmyHPI
         BtpcwkbhRKSb88pBUzQuVVn4kG0fiELfHb4fPDr5ugq3lponf73JADh+k0vL0lsu/wkq
         dqKq6qO66zE31GXt0KZmuE8QF3Ke4JzLWyeqP0ebYPd7iJUFoetyKsLTqSss92tu77+M
         14LkkBB3WujM6OBmGbIMbE/Jyy/qw5NSmtaAm4Wzt1wGEn4LJAcNRRrJl9xMEH1lt7fr
         89DA==
X-Forwarded-Encrypted: i=1; AJvYcCWjxDME5zGzrKPCaq1Q93mBAUgfFLTDoJM5C7dPGbCn/MPCc7gSx9+AGZ23kOPVkarPkZ4wKDmc0w38Uuvq9BG4iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysOgvXhgkVqNoOHU3ZpRwFvV6CSTuOSNN0wdWPPhv3HNXDFjSr
	voXXqthn6fPIZJEq4XSzYmCoPVBblV67r5HdKZXZNoddriFR8N5mpIXYZfMCndNr1dcVOrQqWFW
	/MG+if4tx
X-Gm-Gg: ASbGncslCN4f/I/mzMO2hzIwQRilZ9AvEzVUW5Qf3AeHTogR+lqoEv29/hfx7ZVJK5x
	HXe1ohgxWITz/Zn1oSlAZYyfzw2IoNQ2EY+wxNpq2VgKplk8KM3jsafTWL89RiAdcjzGeJVPEI2
	H8JB1qDXqf4EKoRbVPUlCF7xvlYgVZhQuSbrnwUVW7jhcNK2QkfoPPWhgm+lvWhuz8dqcs4Rfil
	ooLmbHlPmIdmAtgIYXIgXWDI0MLm1URr2O7CxDG68txK6vJu19GUTF2OEp2RQG0BmlO7QnpVTKi
	7UHVWd8BlXwyGk4/TZDmugHG0L3Uq5Lo9a3T959BpDlqGFmTR6YVl6UHNE4jQN2aTqgBdjSPyka
	AGJbTPFvMi1jPnxH7SjblLnL669ApCxGoDCkzl25hIpcYMZt+vWB/rq7bxnl5OYxzkMcQBY8ikc
	qmRbWE60SdvsfCbc7w+yseLlahOwX2KMKEcCuV69tkKG308HXPpw==
X-Google-Smtp-Source: AGHT+IGPFjTurhBrslpSQSlDKMNu0rbVTT5t9ln5zpaeNAFBH7dve4CHcxADVJ/+Ca/zMQ0ZLD0onA==
X-Received: by 2002:a17:907:9717:b0:b72:decb:f868 with SMTP id a640c23a62f3a-b73319718b9mr474024066b.2.1762981189913;
        Wed, 12 Nov 2025 12:59:49 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad44b4sm1891366b.28.2025.11.12.12.59.47
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 12:59:47 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b427cda88so76536f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 12:59:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVD1IcctBXDROKHVxUcqgirNRaTFVIy0nV29C0ffdZcR8+kfsNmGqo18zEdB6LGXF+nw/NVJwk/KDHNL8AnXXkZzQ==@vger.kernel.org
X-Received: by 2002:a05:6000:25c1:b0:42b:41dc:1b5e with SMTP id
 ffacd0b85a97d-42b4bdaac86mr4128064f8f.30.1762981187099; Wed, 12 Nov 2025
 12:59:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.4.I5032910018cdd7d6be7aea78870d04c0dc381d6e@changeid>
 <40e67c6d-2430-483b-b4b1-0220ffbd6418@kernel.org> <CAGXv+5Gx+skrUR3PXt=RSL8YyKZYeQCkJ-3qW9wtrHrr9aqWAg@mail.gmail.com>
 <312ca473-77a6-4b95-b558-bb121294fbc9@kernel.org>
In-Reply-To: <312ca473-77a6-4b95-b558-bb121294fbc9@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Nov 2025 12:59:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W3CTMkWPMN5GqGg_L_bUT2Q9vLpc43p5kWAf+j5HBEGA@mail.gmail.com>
X-Gm-Features: AWmQ_bksI8oQbHqO0tKCB6fGhils4SI8u_vpu8lWPsuVYWGsi5YvtKpP0DRmdHE
Message-ID: <CAD=FV=W3CTMkWPMN5GqGg_L_bUT2Q9vLpc43p5kWAf+j5HBEGA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: google: Add initial dts for frankel,
 blazer, and mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	William McVicker <willmcvicker@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 12, 2025 at 1:49=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> >>> To avoid fragmenting the discussion, IMO:
> >>> * Let's have the discussion about using the "dts" for SoC and the
> >>>   "dtso" for the boards in response to the bindings (patch #1).
> >>
> >> That's discussion here, bindings are irrelevant to this.

Ummm, OK. In any case, I'm going to wait until our discussion in the
bindings patch about whether SoCs can be final compatibles, then if I
still think extra discussion is needed I'll respond more on this
thread.


> >>> * If we want to have a discussion about putting "board-id" and
> >>>   "model-id" at the root of the board overlays, we can have it
> >>>   here. I'll preemptively note that the "board-id" and "model-id"
> >>>   won't show up in the final combined device tree and they are just
> >>>   used by the tool (mkdtimg). We could change mkdtimg to parse the
> >>>   "compatible" strings of the overlays files (since I've put the IDs
> >>>   there too), but official the docs [1] seem to indicate that
> >>>   top-level properties like this are OK.
> >>>
> >>> In order for these device trees to pass validation without warnings,
> >>> it's assumed you have my dtc patches:
> >>> * https://lore.kernel.org/r/20251110204529.2838248-1-dianders@chromiu=
m.org
> >>> * https://lore.kernel.org/r/20251110204529.2838248-2-dianders@chromiu=
m.org
> >>>
> >>> [1] https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/Documentati=
on/dt-object-internal.txt?h=3Dmain

> >>> +     board-id =3D <0x070306>;
> >>> +     board-rev =3D <0x010000>;
> >>
> >> Undocumented ABI, which you cannot document because these properties a=
re
> >> not allowed. You cannot have them.
> >
> > This is part of the discussion I want to have at Plumbers. But I suppos=
e
> > we can start here.
>
> Then the patch should be called RFC as not yet ready for merging. :)
>
> >
> > The Android DTB partition format uses six 32-bit integers for matching,
> > as opposed to a compatible string used in FIT images. Two of the intege=
rs
> > are the "id" and "rev" numbers in the example above. The remaining four
> > are custom and left up to the (vendor) bootloader implementation.
> >
> > The values for these fields need to be stored somewhere with the .dts.
> > The compiled DTB is useless if the user cannot build a proper image for
> > the bootloader to consume, and that involves putting in the right numbe=
rs
> > in these fields. The android "mkdtimg" tool can either take the values
> > from some known properties within the DTB, or have them fed to it
> > externally.
> >
> > So if we don't want these numbers in the dts itself, then we should com=
e
> > up with some format to store them beside the dts files.
>
> Re-iterating comment from Rob long time ago: adding such new properties
> is fine, but they must come for more than one user and be universal
> across these users.
>
> And of course the ABI needs to be documented which did not happen here.
>
> I indeed said incorrectly that "properties are not allowed". The
> properties could be allowed if we document them according to above Rob's
> comment, but that did not happen.
>
> Adding these properties per one SoC vendor is not really allowed, like
> qcom,board-id and qcom,msm-id, but maybe you intend to make it generic.

Perhaps you have a link to Rob's comment from a long time ago?

As per my comment "after the cut" in the original patch (see above),
for my use case, I'm OK with removing the "board-id" and "board-rev"
here. It wouldn't be terribly hard to teach my tool to parse the
top-level compatible. That being said, it would be nice to allow them
at a top-level like this. As Chen-Yu says, there are other interested
parties.

The official documentation that I referred to in my comment "after the
cut" says this about properties directly in the overlays:

```
/dts-v1/;
/plugin/; /* allow undefined references and record them */
/ {
    .... /* various properties for loader use; i.e. part id etc. */
    fragment@0 {
```

So properties are clearly documented to be allowed here. When I read
the above, I interpret it as the properties are "whatever the expected
loader of this overlay would find convenient".

I am more than happy to document which properties my "loader"
(mkdtimg) needs if you have some proposed place or way for me to
document them. I'm happy to do it in freeform text (or markup) for now
if that's what people would accept. Maybe that lets us get started yet
still document things while we figure out what the needs are?


> > On a similar note, we would have a similar problem with FIT images and
> > overlays. The FIT image format maps a (series of) compatible string(s)
> > to one DTB and any number of overlays. If overlays are involved, then
> > the compatible string cannot come from the DTB itself, and the mapping
> > must be stored somewhere.
>
> I recall, although cannot find now references to, a email talk on the
> list saying that such overlays should have their own compatible, thus
> solving this mapping problem.

If you have more details or if Rob wants to re-iterate his thoughts,
I'm happy to discuss.

In my mind, I'd rather this not be a "compatible" but I'm also not
dead set on that. IMO, though it can be made to work, having a
"compatible" here is sorta backwards from what we want. We faced this
issue in ChromeOS when we used the top-level "compatible" to pick the
device tree. Specifically, the normal usage of "compatible" is to
start with the device tree which has a list of compatible strings.
From there, we pick a driver that matches. AKA: we start with some
"compatible" strings and find a matching "thing" (a driver). When
using a "compatible" to pick an overlay / device tree, we start with a
"thing" (a known board) and then pick a list of "compatible" strings
that matches it. Hopefully it's clear how that's a bit different.

As I said, the problems are mostly subtle, but this is how we ended up
with the weirdness on Chromebooks where we had a pile of all equal
"compatible" strings at the top level and that made all the DT folks
grumpy. See, for instance, the sc7180-trogdor-lazor-r1.dts file where
"google,lazor-rev1" and "google,lazor-rev2" are both there. We'll pick
this same DTS for both revisions.

It can be made to work, but IMO it's not a perfect fit.

I'd rather us just pick some standard property that documents the
information that the expected loader should need. Maybe you could even
handle more than one loader type?

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
exactly for various loaders and then properties that they need.

I haven't tested this, but I believe that since the "loaders" isn't
under any "fragment" that it will just be ignored when the overlay is
applied, so it will just be for the consumption of the loader.


-Doug
