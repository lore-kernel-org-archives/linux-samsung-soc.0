Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1DF35C194
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 17:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763054183; cv=none; b=m5A1s9/95LArNkq2fPkZKIq08QeOLPsJrkALnhIojw/frF95X06+dok0149yJ6+UTJ56qkcDPhdhrOZ5iHqRfyRoVLF6Jq4UmiguJ5C8zS1ld9YUsYKjLZpm+X4QyrP6AgKi/jajw7UIEKxHh8pJXmaZS9fn7BAjZBRywBmA5bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763054183; c=relaxed/simple;
	bh=tpZxITtR8on+zNUed8tH2yMPgEN+COBsuVSgM6g49d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTgtBrWSIeXiDhRUFsDgW9ZzlQZY6lCwVoPVLJQZEhuTADZyDKA0fktYPXx4m7RCWFUNS+nXh0/1it2VSOSqA952ma0M/awY9ykzbgXMR0hrXxTu4L7/C2v9Hl2HB3/Jh0cVJuROChSrs7lPhFD6LiQjfNn9+i9odmi2banmo68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bdzApcgy; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bdzApcgy"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b727f330dd2so151620466b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 09:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763054179; x=1763658979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtyftZQVY4swvTgixLURevtyRejq31WTYbhe23ooHsw=;
        b=bdzApcgy193UVIEepsnESzC/kya5QX1Frvs/aQNIMb1jspCcMCdUnUUnObrYZb1w1f
         4ls9dcos7+ObOAUJC3ot0P4KYR7T6eYciXaI+lz6OmOqsOdv7zn2sPXK29JekXC1M4n3
         czYv6IjvVaWNT9ShAioH3uOtOXJicg05wz/Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763054179; x=1763658979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WtyftZQVY4swvTgixLURevtyRejq31WTYbhe23ooHsw=;
        b=cmSlooIEeVEXjK6xbDIv+R/yPwjmh7MmXxvLnuVCpWF7n4/Snd25nKqAup+TApfwFS
         b21lHIpylIFGnBwRYqgcZ7KDcUdCUuW1w1QYiWZFvk/QLNr3dUcAGhjwr0QBLqOPrmYI
         6RAu771Atf8m6PmuSJF6S6YIfl4yuewM3E5dNzu2D8sU1cTaKJXoKBUlDlZ0VtXMbB4w
         R9wVVwRnRRgzI4JXWvwQlYrN0WAcUpPP9UY3vegE9ThpWG08mviCMKC+APTfFz18mQpk
         ILJPqxjnWyNiIleqB/QoObXaf4mranjbuIHzl1yxDvt3rmbIgMzLd14RiWLRxya1mhDW
         jprw==
X-Forwarded-Encrypted: i=1; AJvYcCXl/7RG60SHva8yQPcGz023c21ffhcodwsIYG6y9vA64UrKmdnfdzHi/ZZXwgFsKzWzB1gQPGZigdAr8GBAR/zpiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyupT7v+/OrrJBJd1cs5RGYt04Hn0FKPUBuRX07UZ6nupAfTjTo
	64Tx33fWi37GzWjFlj8jucDx/v/qCP+a4MB5YudGnnIoOoE+P0i/nMhullD+14yFn5dHiNKkE09
	6KxMgzOKn
X-Gm-Gg: ASbGncvmEYOUEFDw+cPzMrwLPGXSEjfTPmSmKD9l1ALtJb5CQLX5fJ1cxjKCFO8VLDT
	fwIKJZqFWmJUdrVqdGjmT/QJIUrtYIhZvWEzLnoL3TwjeEupVC76/SaqcuKCuPdlcrsjcqHHgQ7
	u/yuY5aGuSI0Mkn3lC3fuJTij1Ab4ZqvTgYvwnHx3SGJ/yPKvOjoOjlJyzJFsseFqAQpnsZ5Eui
	sDqrjkaNCTT3zesLanusjwDHqFDyVfdA1dAc0CzCdA0uVPw62iHzKIHBexu1ut9lZAuYOPHb+0B
	ZlJXlI93McgeZ2c7WMriVIBoqtEd5DTKgurexZ30EobrKFd3lvpoQm+6H4PTlCpkx232V3hov2Q
	uKu8mGB1WyWlpqdenh3QsnhJhVhfIAW0RORnHLc+xP6gKZrJqHEV7QFcIbenkDJUevukmlXSv8n
	r/1LNT2E6SJAOhD5jFLKTTGpMJNBaN3vtNkoeEvrGw1bw2JPuSLnoYM6Dn3Mv7
X-Google-Smtp-Source: AGHT+IFfFX6ta8cnKaSj97scR90Jwd91FdAhN+TUtxdXSvUFp2JEqGDFybqfD/gknPdrF8dsrHodew==
X-Received: by 2002:a17:907:7fa9:b0:b72:decb:f868 with SMTP id a640c23a62f3a-b736789cebamr408666b.2.1763054178715;
        Thu, 13 Nov 2025 09:16:18 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdaf6dasm200214566b.63.2025.11.13.09.16.17
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 09:16:17 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-429c8632fcbso815989f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 09:16:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVadx2wCAiLP6KvbnqnnruRujTuY6ATcwnWKLFYd+CJld2HZqXrps604SR7sicfGzr28cfu87WdiBNg4hj14C7AOA==@vger.kernel.org
X-Received: by 2002:a05:6000:4008:b0:429:c54d:8bd3 with SMTP id
 ffacd0b85a97d-42b59384951mr167096f8f.53.1763054177127; Thu, 13 Nov 2025
 09:16:17 -0800 (PST)
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
 <6490f20a-2492-4ee0-8f34-d529e0df0bad@kernel.org>
In-Reply-To: <6490f20a-2492-4ee0-8f34-d529e0df0bad@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Nov 2025 09:16:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Us7SU_OifVkS4mdfVhc=xGYSBiBpBk9aA1Ki0y+iYBpQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkZ_nOTQudV33wGWWwO5Hz7EB8FByvmJpxXsQ9PqvC8-S17wTHTwbtZyow
Message-ID: <CAD=FV=Us7SU_OifVkS4mdfVhc=xGYSBiBpBk9aA1Ki0y+iYBpQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 13, 2025 at 8:34=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 13/11/2025 17:23, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Nov 12, 2025 at 11:23=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >>>>> +      # Google Tensor G5 AKA lga (laguna) SoC and boards
> >>>>> +      - description: Tensor G5 SoC (laguna)
> >>>>> +        items:
> >>>>> +          - enum:
> >>>>> +              - google,soc-id-0005-rev-00  # A0
> >>>>> +              - google,soc-id-0005-rev-10  # B0
> >>>>
> >>>> SoCs cannot be final compatibles.
> >>>
> >>> Right. I talked about this at length "after the cut" in my patch. See
> >>> above. I wish to relitigate this policy and wish to know more details
> >>> about where it is documented, the reasons for decision, and where the
> >>> boundary exactly lies between something that's allowed to be a final
> >>> compatible and something that's not. I made several arguments above
> >>> for why I think the SoC should be allowed as a final compatible, so i=
t
> >>
> >> Because this represents a actual device users run. It is electronicall=
y,
> >> physically impossible to run the SoC alone.
> >
> > I'm not convinced that this definition is as clear as you're making it
> > out to be. It's physically impossible to run many "boards" alone.
> >
> > Want to boot up a Raspberry Pi? Provide it with power. Hook up a
> > display to it. Hook up a keyboard to it. Plug in an Ethernet cable.
> > Plug an SD card in it. Without those things it doesn't run.
>
> But I can plug them...

I can plug my lga SoC into my dev board too. My dev board literally
has a place for me to drop in the SoC. I unscrew the socket connector,
carefully make sure that none of the balls of the SoC have dust
particles on them (and we have instructions for cleaning the SoC),
then drop the SoC into the socket (ideally using a vacuum pen tool). I
then screw the top back together which uses compression to attach the
balls on the SoC.

Yes, this is only true on dev boards and not phones, but we want to be
able to support dev boards too and it would be silly to have a
different split between DTB and overlays for dev boards and phones
that are based on the same architecture.


> > Want to boot up a lga-B0 SoC? Hook up power to the power pins. Connect
> > a MIPI panel to the MIPI pins. Connect a UFS chip to the UFS pins.
> > Without those things it doesn't run.
>
> These I cannot plug, it's impossible for me.
>
> My clumsy fingers are too big for these pins.

As per above, sockets do exist. They are pluggable. I have confidence
that even with clumsy fingers you could drop the SoC into the slot and
screw the connector down.

I'm still not totally convinced that it should require the existence
of a socket to justify this but, yes, they do exist.


> And following your logic, we should have the compatible for the
> transistors, because that's basically what SoC is made of.

My logic (stated later in my email) is that the minimum requirement
for a compatible should be something with a CPU able to execute
instructions. A single transistor can't do that. If you want to
combine a bunch of transistors together to make a CPU then absolutely
you should be able to have a DTB representing this CPU.


> > Yes, the complexity of just "hooking up" the components on an SoC is
> > an order of magnitude harder than a Raspberry Pi, but it's still just
> > hooking it up to external components. In both cases, we are modeling
> > the core "brains" (the part that contains the processor) as the DTB
> > and everything else just "hooks up" to interfaces.
>
> You mix the topics, so I don't follow. I speak here about bindings - you
> cannot have the that compatible alone, because it is incomplete, just
> like compatible for "transistor" is not correct in that context. You
> speak what could or could be DTB, different topic.

A "SoC" is "complete". It has a processor that can run instructions.


> > If I had to make a definition for what the base DTB should be it
> > should be the component with the boot CPU. _Why_ is that the wrong
> > definition?
> >
> >
> >> There are few - one or two - exceptions for the SoMs, but never for So=
C.
> >
> > OK, but the big question: _WHY???_
> >
> > Where does it say that a DTB has to be something that can run "alone"
>
> We don't discuss DTB here, but the top-level compatibles.
>
> Why? Because DT spec says so.
>
> "Specifies a list of platform architectures with which this platform is
> compatible. "
>
> And when you combine it with the standard definition of the
> "compatible", it is not *a* "platform architecture" but *list* of
> platform architectures describing this device as a whole.

I still don't understand why a SoC doesn't qualify for your
definition. Even if it did, there is _no benefit_ from excluding a SoC
from this definition. I'm trying to figure out what the benefit is for
holding to this stance.

In any case, maybe we can approach this a different way that I alluded
to in one of my other posts. Can we just call the SoC thing something
different and make everyone happy?

1. Rename the SoC file to lga-b0.dtf (device tree fragment) and
_REMOVE_ the top-level compatible. Problem solved--we're not adding a
top-level compatible.

2. Add a special node at the top level of the "dtf" file describing it
(so someone could figure it's useful for). Like:

fragment-info {
  compatible =3D "google,soc-id";
  google,product-id =3D <0x5>;
  google,major-rev =3D <0x1>;
  google,minor-rev =3D <0x0>;
  google,package-mode =3D <0x0>;
};

3. We can compile the "dtf" file using existing tools into a "dtfb".
This looks just like a "dtb" but has no top-level compatible but
instead has "fragment-info".

Now we're not violating any spec because we're not adding any
top-level compatible.


-Doug
