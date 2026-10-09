Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526C33F210B
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 08:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535336; cv=none; b=q3f+Zt209f5qr5k7rG/EgtPzc/NLCD2+qjCMifgl9HOnEO+EXnRTsKF5wd6RYe0Kvjlx1bCDZaXKrY9Jdg9/ZCG4PqQOMqbupjSn0DRkkME85ZmBQoJrSHTpp7CYWwRkE16J6mkGwCkg/UNBg3Xs84hBZXkGUmvj9hmiphxCJs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535336; c=relaxed/simple;
	bh=iQjeIeuE0TrRXjzq/4BN2JXwMS5sWSC0KsOOoHnJAa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmACklvziFn2yeqbz/LFeO2E8cMO4M3g0rJopNwT+8OY7B8EvHFxJ4SDWwNzPj54f5IfTAWhem7OOv1UU4eD/gqnLDV6p8ODhICKdxp3SCl+dw5nV0HqQdga99LD+y1Deed7Z+CKLKPzw16jIzUbZl0Gw2gE/7W4FgLpBU+qNVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SBIPSvD/; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SBIPSvD/"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so9058829a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Oct 2026 01:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791535333; x=1792140133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TpL9JdRnQWjZohyDj5gd2hk16XdjjZ4+ynUw0iwS7Uk=;
        b=SBIPSvD/rJXg02G30MHmAvT6nPeNgpb/ZfXgAmAUEVRNVA99Ipi2BM9PICqmX6uUAH
         hxBKrHu1/uy7WlG1dWzhXRvuB2iuUS0PDTwcirKdtJRUr59UQB9T6tzJxWiJMo0kKKGI
         AIKqLW/ko1a6jsfPykbeAz74/ha0JDYtDhEjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535333; x=1792140133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpL9JdRnQWjZohyDj5gd2hk16XdjjZ4+ynUw0iwS7Uk=;
        b=ua2YbHziPONwDJt0TPt9WHXsWMbLuY6IPkXtjKEOtKbS/ZMWGvb7QqBAP794iEsyii
         SvNgw6isoQYdLKRDB02w50gGFtOohi937Na8miis7fNgOgHWnk0j7C4BM70Sa9H1OtCd
         7ayU5G2dSyctsHnfXx/PoNGOLumzd+dpKazwCGaVLa5KJ5EpdDnpUe7remnq4TwyQILx
         wfpvIux3XMTMdXbk+O8WEDo69jLX1TkDt5lyONdOQFb38F0R/QyJfLc/kcahhEpM4Pgu
         mXF0ELV0zwtvOvRUkQoI5r8OXtWg47+BCS236O0DbAFPw/eTJNQVMiumWJalml091n1X
         8G9w==
X-Forwarded-Encrypted: i=1; AKwUvBx9phMAMq5LEeC6K+V3+cQ8tRKL3exMJH6s9tKhdliEZ7y/0OG6W8lRmKW8sZNAjdGw9koJengBSHKbSaXKCqrPrg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKjV88bAOIJ6ybG3WGavRYIh3UNOO23RoBpo9cLHUrr9yfKmCSO
	YLqkfVocajw314nHlx4Ud8Q1TSXLjj2UzPY6ZuX3Dsx2KPzHPdgsNquJymW/v3o49GLW9Dwrwlq
	vyGmbDA==
X-Gm-Gg: AYBFou1XFH8teOTbL7bgnuLEey8JiZ2rWipXl5OdD8sYLeW2+twwW4vLYi0Q8O/Tf6r
	Wd5wA8xVrgpYB/mUZTB3VG7WSGGVQaV7pqmIYMB+XLYg49wxa/27kS5CZX25LcyoTRob1Jdzofz
	DpdIvv8b7oTlkb0PY5NiyeXLefUoKHxIiVJWE/zasOw3+jQa7bqDHbyZ0YUUSVo+7PElLmXmL4K
	MMg1skE7z3NDacZtJ9ZkgHwfG+C81daiNaqtlOAW5GmDmF9/x6Yhawpwn07CjE7G1iEcgIaC7ri
	l2Sqn80WoLVqAHHtjf8K2e0MEMLxUTVhPUyo3Yl+aTOQYJPIUo+13JHCBCeos4/OSQPKGa8A3nQ
	a7OC5ifSRhA5tlnTm/bC/HnfTi8OzPiCRmmE0vyTdYpAgaezAcu/Il5Rnk6BD3cDzbFGURfviGu
	bLE5CqOV8tnOw9P2c89N92F05g1cIH8p531+4jitQkqm6Df6TwJC+gapd2r5O1oJXkVFQ9kZuqK
	Dk14sTsxHXPqNEtDTcXAXbYfBvZzshOUBdfwA==
X-Received: by 2002:a05:6402:3226:b0:6ac:77c2:c418 with SMTP id 4fb4d7f45d1cf-6b17c1e0c18mr864399a12.1.1791535333244;
        Fri, 09 Oct 2026 01:42:13 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1783dc9d1sm793730a12.0.2026.10.09.01.42.09
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 01:42:11 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afe75f055so5506910f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Oct 2026 01:42:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz8afhx9rZQ4g2z88nQfKYqI99RQaMSHVvH2BUSplNQzu+nUH4IallOrxZ/kqRifOLO+VGjIPU5nYgj7Jc3D/uJlA==@vger.kernel.org
X-Received: by 2002:a05:600c:4ecb:b0:4a1:6916:798 with SMTP id
 5b1f17b1804b1-4a18e4a3f69mr19100085e9.14.1791535327953; Fri, 09 Oct 2026
 01:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
 <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
 <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
 <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
 <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
 <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com>
 <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
 <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
 <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
 <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com>
 <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com> <b1f088eb-7c77-4079-9b05-20729fcfd612@kernel.org>
In-Reply-To: <b1f088eb-7c77-4079-9b05-20729fcfd612@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 9 Oct 2026 01:41:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSSEZykDpu48XVwDzNWKAhZjsPm3PNweTqeHv_DxiykQ@mail.gmail.com>
X-Gm-Features: AclHuK_I9OeBRY02WEee3vuFJa_eA7foPBEu58USBohXW5y9EM2eolVWe-MVbbg
Message-ID: <CAD=FV=VSSEZykDpu48XVwDzNWKAhZjsPm3PNweTqeHv_DxiykQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Joonwon Kang <joonwonkang@google.com>, 
	Subhash Jadavani <sjadavani@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Lucas Wei <lucaswei@google.com>, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 8, 2026 at 11:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 28/09/2026 23:34, Doug Anderson wrote:
> >
> > ```C
> > static struct mbox_chan *goog_mba_fw_xlate(struct mbox_controller *mbox=
,
> >                                       const struct fwnode_reference_arg=
s *sp)
> > {
> >   int i;
> >
> >   if (sp->nargs)
> >     return ERR_PTR(-EINVAL);
> >
> >   for (i =3D 0; i < mbox->num_chans; i++) {
> >     if (!mbox->chans[i].cl)
> >       return &mbox->chans[i];
> >   }
> >
> >   return ERR_PTR(-EBUSY);
> > }
> > ```
> >
> > Then the client loops around and requests the same channel over and
> > over again until it gets -EBUSY? Like:
> >
> > ```C
> > for (i =3D 0; i < FIFO_MAX; i++) {
> >   client
> >   chan[i] =3D mbox_request_channel(client[i], TX_CHAN);
> >   if (IS_ERR(chan[i]) && PTR_ERR(chan[i]) =3D=3D -EBUSY)
> >     break;
> > }
> > fifo_depth =3D i;
> > ```
> >
> > I _guess_ that works, but it still feels like a bit of a hack to me.
> > You said you were worried about people abusing the "has_queue" API.
> > The above feels like it's abusing the "fw_xlate" API, turning it from
> > something that is normally a "lookup" into an allocator function.
> >
> > +Rob, Saravana, and devicetree@vger.kernel.org. DT folks: is the above
> > something that looks right to you?
>
> There is no allocation in your xlate code above, so this is not that
> terrible as we talked on LPC.
>
> >
> >
> > I researched whether other upstream drivers use of_xlate() /
> > fw_xlate() as an "allocator" like this. I did find "exynos-mailbox,"
> > which appears to be doing something similar. However, upon deeper
> > digging it seems like "exynos-mailbox" isn't using this dynamic
> > allocation for any compelling reason. It looks like, really,
> > "exynos-mailbox" should just be returning one channel. The client
> > (exynos-acpm) could just use the same channel for everything since:
> > * It actually gets the _real_ channel ID out of the data.
> > * It doesn't care about txdone.
> > * All it does is ring a doorbell and there's no queueing.
> >
> >
> > In any case, if using fw_xlate() as an allocator is truly the only way
> > to proceed, I'll finish my prototype and send a v2, but I'm still
>
> Why fw_xlate() would be an allocator? Can you extend your code to show th=
at?
>
> I think doing any allocation in xlate() is calls is fundamentally wrong.
> These should not modify the state of the device, so no allocations, no
> device_link_add() etc.

It's not _calling_ an allocator, it _is_ an allocator. It is walking
through the array of channels and returning the first free one. Then
that free channel is "allocated" to the client.


> Why? There is simply no corresponding xlate_destroy() call. It's also
> confusing, because the meaning is to translate from one domain resource
> to another, not perform actual resource allocation.

In this case, there is no leak because it's relying on knowledge of
how the mailbox core will be using fw_xlate() to finish the allocation
and then relying on the knowledge of the mailbox core to free. It
works like this (simplfied, see mbox_request_channel() for full code):

```
scoped_guard(mutex, &con_mutex) {
  list_for_each_entry(mbox, &mbox_cons, node) {
    if (device_match_fwnode(mbox->dev, fwspec.fwnode)) {
      // The below "allocates" the first free channel associated w/ the nod=
e.
      chan =3D mbox->fw_xlate(mbox, &fwspec);
      if (!IS_ERR(chan))
        break;
    }
  }
  if (!IS_ERR(chan))
    // This finishes the allocation.
    chan->cl =3D client;
}
```

Said more simply, in the mailbox driver, there is an array of channels
associated with a given "fw_node". These are "allocated" like this:
1. mbox_request_channel() grabs its global lock.
2. The mailbox driver's fw_xlate() is called to find the first "free"
channel associated with the fw_node (a channel with no "client").
3. mbox_request_channel() sets the "client" field in the channel to
finish allocation.
4. mbox_request_channel() drops its global lock.

Does that make sense?

Is that a design that looks good to you? If DT folks have no
objections to that, I'll send a new patch that works like that.

-Doug
