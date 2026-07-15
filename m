Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE833B634E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jul 2026 16:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134173; cv=none; b=KtOZcpF8TLiAQrcNXU8asCIH0HwwUAskkctjYqqgEcCwn2jKEk0dDybJZEnatCOo6D5fcqLjaL6wwBRDspQpGd8UnPgtuL+VhMIpImRiC51//YaLBu5d3SeX71QLvatSFSlVBsxQGPngwMiOBVATsCIprBcjAqj6pasFjpIPr2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134173; c=relaxed/simple;
	bh=iOyrxp69QdLhWc2/B5xsEVQ2nZcA67hZw5d4L2vQAmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=esjtmXqY0KNAgX6ftNqx/DKhApZak1P7Y0saLe9+ftS7pRAECuncXpQ5nkH9zyOxLnwf3mkYEGysHCiFbNefAGT6fs4Vkv1Bed4Z21Txj5w4sY/AnijNaR6U3sarbr8RcMH1bUdgBJv6NcQvHtdKcyZtW2lFPFObEQ8slOgNASA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C6PUDysd; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C6PUDysd"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9696570e34fso1692729241.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jul 2026 09:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784134169; x=1784738969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWOXu6Fzc0IzSZb9XCVBSx5nTdI7maBQu0X7nhEWxe0=;
        b=C6PUDysdJn4qd/QXkmrAVK7wb4khutdfmXeyrEEfyuLFMfI7kFH1O4aLMM39MEjDqr
         fKbGZWfWEcNvBMAmfZS4R7yrXJ3YxxAIrVWOAhVssHrD4AWG0BEMw8J8ESSNsCWTeCis
         /yTZ/A88PW6RxVG2NKpe6D7OYew4+GVlmRbwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134169; x=1784738969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWOXu6Fzc0IzSZb9XCVBSx5nTdI7maBQu0X7nhEWxe0=;
        b=OikKdbsreiLaxOnrikQYa4Ufkrm+StnjMV2ayjw+/GozouDoglzztphZsnyBlFa1Ez
         wwW4L4pbHAOUQZDx2Og1UpdlqI9E1EXIVhVj9u1pHZHhSiyD5ElZAYiB54EbfJcKke6a
         pZ3bWtfIRjysgcCWX3O5F767pYY9OouY3eeZ0vAjDHpg3jXwpAUSkFZT6x0CoiwWctof
         NCjPv5AkFPM6YNjAnCW4zPzOmSl/3mJI24U7ts8c9CptuxS2/cr6LQd32LyYXLy8EVLH
         6k+GeE+uQ7u5/rJrH7W/QnqyQLpvztuNKU+fy1CP3M85hLOqkSB3EFab8ixX3gH1J6Ke
         mSTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqbq1IihZ/f7gTu13QLQJbAUr2zBqVMdmaSaaui7p2YTvAc0X2gfJ+CBr8iScsN4Lijp6jrcGGF9qm4K/eFierX/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPR+NOeZuKEW8B/0PoCdpbR9OCHdPh8HxCiflagwF0ybXfBJ6T
	+RcdSYqq5gzGGXuppjJY2uvYSlCiX/3Oa8nvuVrELfM40/VtlLh5WGTAQaUtem/5mUR4LM/fKDp
	jDmw=
X-Gm-Gg: AfdE7cmPdR3adF+Wiy15q+jDbafPLAF88X0Aq2IDb8aLnB7F3PV8mhqOpw5CHuOki+v
	ItwnnO9wTTCDqJohcJXagv0j8w2rvv0lSOlPQYNhVYpYhnNczYqoNkPCDOw/BLm9cy5i6yr7alK
	bul4cDC07p8wDSZZzZ9zalGjavWAJRVAC3BP3MBPt/Acs1O4WchSyKd1LP5f4drTXiIttez5bjE
	aQqg25OMFrbfUmRRkKyHoZ9bUxSSbBqtmSLt2cuquO3z6N0DM5qT+uSxndzUvzH5Ws4SoNcwSWn
	mFGViyYTK0v/xO28z8tMuHIMXo1twkFTKtRh1/URe5n8gW2mPNQ4jRZei5XCldNaNUFGEBiqXcH
	WAVFmUMFA5PYkwfYncBVWX6g38/830ZNgngoGaDN3nBz9zOeFs1uWnS2DiVnRMRCKQdCEdp4fTH
	eyNIOqknTEx3yZAkP9aPpPocdRoL/AQbHda0T9P5d0EwGBqGTv5ELdYWM=
X-Received: by 2002:a05:6122:2c34:b0:5c1:1690:72df with SMTP id 71dfb90a1353d-5c137514c81mr60889e0c.9.1784134168882;
        Wed, 15 Jul 2026 09:49:28 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfc655c77fsm7318190e0c.15.2026.07.15.09.49.27
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 09:49:27 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so2250450e0c.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jul 2026 09:49:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq4Mv3nhPu73hrhEdrMfoy9fZS8qYqEJiZjdx+lrFZlTEEIVL3O5mms9q0paRFyMwBnWwmVTl+Afi8sum9xR0lclg==@vger.kernel.org
X-Received: by 2002:a05:6122:4d15:b0:5bf:7812:3e4a with SMTP id
 71dfb90a1353d-5c1372dab1dmr154635e0c.2.1784134166272; Wed, 15 Jul 2026
 09:49:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid> <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org>
In-Reply-To: <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 Jul 2026 09:49:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
X-Gm-Features: AUfX_mwK6webxeT7JT0ytuEP2uAbvjNKVShoZc5WhE6zMIAHOXS5JrDgWdomMxQ
Message-ID: <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Joonwon Kang <joonwonkang@google.com>, 
	Subhash Jadavani <sjadavani@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Lucas Wei <lucaswei@google.com>, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 14, 2026 at 9:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/07/2026 00:21, Douglas Anderson wrote:
> > Introduce bindings for the MailBox Array IP block present in Laguna
> > SoCs (AKA "lga", AKA "Google Tensor G5").
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  .../bindings/mailbox/google,mba.yaml          | 216 ++++++++++++++++++
>
> Filename must match compatible.

Whoops! Will fix in v2.


> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - google,lga-mailbox-array
> > +      - const: google,mailbox-array
>
> Don't use generic fallback. Just the SoCs.

Sure, if you insist.

In general the "mba" hardware is designed with enough identification
registers that we should be able to autodetect which variant we're on.
Thus, my hope is to not ever need to reference the SoC-specific
variant in the driver itself. It's not the end of the world to use the
"google,lga-mailbox-array" as the generic, I guess...

I don't suppose I can change your mind here? If we take
"google,lga-mailbox-array" as the generic, then going foward a few
generations we end up with:

properties:
  compatible:
    oneOf:
      - const: google,lga-mailbox-array
      - items:
          - enum:
              - google,next-mailbox-array
              - google,nextnext-mailbox-array
              - google,another-mailbox-array
          - const: google,lga-mailbox-array

If we keep "google,mailbox-array" as the generic, then going forward a
few generations we end up with this, which seems nicer / less
confusing:

properties:
  compatible:
    items:
      - enum:
          - google,lga-mailbox-array
          - google,next-mailbox-array
          - google,nextnext-mailbox-array
          - google,another-mailbox-array
      - const: google,mailbox-array

Sure, it means that if someone unexpectedly makes a new Google
mailbox-array that's totally incompatible then the
"google,mailbox-array" sounds too generic, but that doesn't feel like
the end of the world. You could call the new mailbox array designed in
the year 2037 the "google,2037-mailbox-array" and things would overall
be less confusing than using the "google,lga-mailbox-array" as the
generic.


> > +  reg:
> > +    minItems: 1
> > +    items:
> > +      - description: Host registers (not accessible to client)
> > +      - description: Global registers (not present on newer IP blocks)
>
> You have only one SoC. One SoC has only one IP block, no?

Nope! There are several instances of the MBA IP block per SoC. I tried
to explain the situation exhaustively, but there's always the tradeoff
between explaining thoroughly and providing too much text.

To answer this specific question concretely, there is one MBA per
remote processor. Looking at the downstream DTS, I see at least these
MBA instances:
* AOC (Always On Compute)
* GSA (Google Security Anchor)
* GDMC (Google Debug Monitor Core)
* CPM (Central Power Manager)

Each of these 4 MBA instances has its own "global" registers.

To provide more context, each MBA instance can support communication
beyond just the AP (Apps Processor). For instance, the AOC's MBA
instance could be used to talk between the AOC and AP and also between
the AOC and CPM. Let's take this as an example. In this case:

* The AOC is the "host" of this MBA.
* The AP is a "client" of this MBA.
* The CPM is another "client" of this MBA.

The AOC is the only one with access to the "host" registers.

Everyone (AOC, AP, CPM in this case) has access to the read-only
"global" registers describing the MBA instance.

The clients have access to several banks of client registers, one per
mailbox they can access. The host (AOC in this case) also has access
to the client register spaces since that's where the shared message
memory is located.

The overall MBA instance is best identified by the address of the host
registers, even if the client (the AP in this case) can't access those
registers.

On newer versions of the IP block the "global" register bank was
removed and the read-only registers that were part of it were simply
copied to each client instance.

Does that clarify?


> > +
> > +  ranges: true
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +patternProperties:
> > +  "^mailbox@[0-9a-f]+$":
> > +    type: object
> > +    description:
> > +      Each sub-node is a single-channel mailbox.
>
> This does not look like correct representation. You have one mailbox
> controller with multiple mailboxes, not multiple mailbox controllers of
> single channel boxes.

I spent quite a bit of time debating this when rewriting the driver.
While we could certainly hack things into the existing "mailbox with a
bunch of channels", IMO it would be a worse representation of the
hardware.

I discussed this in the wall of text in this patch series, but
re-hashing it here:

Each "mailbox" in the mailbox array is more like a full-fledged
mailbox than a channel within a mailbox. Each (single-channel)
mailbox:
* Has its own client register space.
* Has its own interrupt.
* Can have a different amount of memory for messages.
* Can have its own conventions for communication.

If we tried to represent the mailbox array as a single mailbox with a
bunch of channels, each instance would have a different number of
"reg" entries and a different number of interrupts. We would also need
an array describing the communication conventions for each channel.
Can it be done? Yes. Is it ugly? Also, yes.

Further evidence that the hardware design intended "a bunch of
mailboxes" rather than "a mailbox with channels" is that the IP block
is called a "mailbox array". ;-)


> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    soc {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      cpm_ap_ns_mba: mailbox-array@5240000 {
>
> Drop all unused labels.

Sounds good.
