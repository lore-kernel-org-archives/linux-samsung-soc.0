Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980154E80D8
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 15:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560615; cv=pass; b=GhDwi8XNq1k5dy/lHjXJpK3Mk/fWtkCF8Vn3SxHb1dKm5yiNmT1jlSaE8hnMCoFVBlcezD8uhCPFmdpsySpHJ4K7c3IwNcyj4ml5FF/TLSD83vTyn1a3FUZwFxBrdefXK2oYicuL9o8P+iFwr3+crxY56yq9hCjW4vtl9JpvQgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560615; c=relaxed/simple;
	bh=zx2j5RAhzB4SxO38lj6J7oJt413F43gvw2W6oYAdPvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MU3Lntt0jwgS8BmumucM/P+0Y9EMhIwQsYt2EQDG0DSjpfN0+jqa12ORgm0Kj5hEOUad+HcIcWxte5+CQWWEILf9U3DHeU5muetBTQmpV+ArRkpM6AA+jSa2+Aysx3eVjGTSbsf235WbduXEPIlcCHicG2T8k7k7fjU69rXJXBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2CjXMyh; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2CjXMyh"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-81ba09a5d23so6347754a34.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Oct 2026 08:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791560612; cv=none;
        d=google.com; s=arc-20260327;
        b=QXqOFV7Kpc9MrcDWoR3fL1fZ8wppS1iWQ+agAOmErgy4nB3+zE5ZQR8o1mduwMVVRH
         yhTS/pml+5rLrZ/ntINTPgh0cyh04Es3lAdMUhDZeFrBarQg44oYdxeVHydI6Th+IMb5
         46FL3dMkIuWzfnjY4LLSRvzEhYv53soPMqM95MAQg0ZT5NYdd8ZyN06udVZXI7FX+My2
         EV+syFi8FLrMqnuCi9pzy4ABWaA7AMRyn2+pA4hRErBNYFItch6NP5yfd2LmglGwlxt2
         Qtg2Np2TfMLYPrbz2LLW/RW7dAWFNHl8yvfjuWgPtBautTEi15ZEuvjcNjb2QJCj01tB
         h+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=30V3aYAGacnfDe5Uw314wkUS1h4m5vyY1WpctMWa5as=;
        fh=AnBnJlkOWRdrnkEtCZNZB9uZmIFIig/NsW8FK7KKj5Y=;
        b=fydca5AkkPSjQHfgAn9Wp0MlHXMw+lRcpnijhZDcATu/hwa1jEw4OStn4U1ghtKn/V
         gyl+cHgOaboVbRA8hxpcmpraMcgrmI0nDqqwC7q/A8C+K3BhIi9s1LRXz2xadEIXVcVQ
         MsF1YQuKrrrj3m92wJArnFvPdWlPesyP6hYkWJ01eBorknCRzpq/ldsXOz27DVOgd+Ph
         IT5hr1YNWcxB2gkI8dcuFj4QWJKpSiYARVartBsOS45UoAfTmsKzahYBxQCQMIv2UFiB
         iczcl+uJfapHyaLWdPwYPCA18k4lwxlSQbuXmxm0T7Y/4SYLH3Qu7NILd07J4swhmO4M
         Vx5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560612; x=1792165412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=30V3aYAGacnfDe5Uw314wkUS1h4m5vyY1WpctMWa5as=;
        b=H2CjXMyhqCC6QqV+f0sWmmLR3zKCPMX3+pvSiwM2n7GRHZ85zFjFRh0ei2srHnnGk8
         oDRum1EF/wgjTZcwm2eyrGYXB7CSITG97li3/OBebvwFflNoTAjJXdNdEK9Gp8W0DZKp
         d6dKPCgesx4Awq5FJzNBLcOGd5ODjTwRu24VY+5ediAvqG5L48kwhPxmR4wSvHGU1NVo
         k217LVDV3i3Sl4+/epWLnxXY+5q4PnwaPrtaDRFlh1JHXLQReaTi21IHHlNw54nb6jcA
         0DlynOtM5h6pfHHPsWMHGkdhpoVeP5zKf43ymkrldxvc0DT+xW+Mjiuxu8k43/mNO745
         FUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560612; x=1792165412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30V3aYAGacnfDe5Uw314wkUS1h4m5vyY1WpctMWa5as=;
        b=DpBn0u0CvEbZSR8C4OsQLslGyvmUAU8cUO9osa1FhEapTdy+bucN8BCf9QPkxjqcD1
         KjxHV2XgC5FW2joeK7Z1sAglCOGnY90Dq4vCoD4XiWyUtKHuyRRq+MsTmlfn4tCrcrZH
         0jRSgFbSw9PSR9KU53Cuiakfccr1cbfCdkt1fwDYgtdbHRHEPv5Z/FqGTiLo3bsDeO5X
         num4eFKd4Yq/u78/yK54W6vrJ3F7iTfJ6poAKRwcbqKi3HbER2VHMEfa5czcqUPkCNXd
         TIeIKD8VojHdLj7++ygTn5vwg2vdg2KXWFc/1gG9lHOfqg/7mfefnNiLgF9BnmuIm+Q7
         ZOnQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5KW9zy5DsFS6AHM/txJGnQ7bp3iTRmsI7zLQsfELmkO9Bx8ps2c6jI+iVGQBECqLxb8gNEuN5+Jp0Ocvl84G+dg==@vger.kernel.org
X-Gm-Message-State: AFuF++lYg5VArD5sv6EJRhCYPTajCCLC7diq3ndl+F/h3IH7bebRwI+A
	jKnVF7b+buH9/TkqgRsylsWYaNlbLizjdfRwCCqV5obODWPD1EWxaUdAPK3aDtapLS5x5SPu7RK
	yyKov+xLtsIQnMTKJEtgK17xpQrcHZ8s=
X-Gm-Gg: AYBFou1EC8AP7M161fWqJYzZWhCV1AzO+A4s26fhcBVLuHn0s8n9ifdb1IF7sqiP7ww
	OCOrMQ6VROUa9GWydDI1Hkyfekdzw86nSlAZMbVMYFiXQHw23fFCkpgZCUNoe37KjSuPrY9w5Fa
	j2iO3LK21tG1qaBZ2kqXVYJbxuXNBMAZuOZZ4hyD0TeHYWOii5Vn8qKykRta+ijpfdKlavGsecQ
	Fa4pHvBcsysUDJXeywkXMur1ksudi85HSvyTWz3qNcwe+jSKwvWPwDUyEsg5FzMRYsM+T7cMPat
	diHQXfQAYvutMUoVN7DOirvvrcE4zCIToSSPpPFcyg4blXW6LAUcz5E=
X-Received: by 2002:a05:6820:1992:b0:6e0:84b2:edb8 with SMTP id
 006d021491bc7-6ef08c7c614mr1702776eaf.1.1791560612403; Fri, 09 Oct 2026
 08:43:32 -0700 (PDT)
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
 <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
 <b1f088eb-7c77-4079-9b05-20729fcfd612@kernel.org> <CAD=FV=VSSEZykDpu48XVwDzNWKAhZjsPm3PNweTqeHv_DxiykQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VSSEZykDpu48XVwDzNWKAhZjsPm3PNweTqeHv_DxiykQ@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 9 Oct 2026 10:43:20 -0500
X-Gm-Features: AclHuK_n4jA48VU427LdptzIuvcXkvRmkA34iUq3fGa6NHmP0M26irsb0xZMW1I
Message-ID: <CABb+yY0yaXZX7=0L8Tt5P4u-GTX=unmgBMePoNTVQ5BHKzLM3g@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Joonwon Kang <joonwonkang@google.com>, 
	Subhash Jadavani <sjadavani@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Lucas Wei <lucaswei@google.com>, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Fri, Oct 9, 2026 at 3:42=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
> > >
> > >   for (i =3D 0; i < mbox->num_chans; i++) {
> > >     if (!mbox->chans[i].cl)
> > >       return &mbox->chans[i];
> > >   }
> > >
> > >   return ERR_PTR(-EBUSY);
> > > }
> > > ```
> > >
> > > Then the client loops around and requests the same channel over and
> > > over again until it gets -EBUSY? Like:
> > >
> > > ```C
> > > for (i =3D 0; i < FIFO_MAX; i++) {
> > >   client
> > >   chan[i] =3D mbox_request_channel(client[i], TX_CHAN);
> > >   if (IS_ERR(chan[i]) && PTR_ERR(chan[i]) =3D=3D -EBUSY)
> > >     break;
> > > }
> > > fifo_depth =3D i;
> > > ```
> > >
> > > I _guess_ that works, but it still feels like a bit of a hack to me.
> > > You said you were worried about people abusing the "has_queue" API.
> > > The above feels like it's abusing the "fw_xlate" API, turning it from
> > > something that is normally a "lookup" into an allocator function.
> > >
> > > +Rob, Saravana, and devicetree@vger.kernel.org. DT folks: is the abov=
e
> > > something that looks right to you?
> >
> > There is no allocation in your xlate code above, so this is not that
> > terrible as we talked on LPC.
> >
> > >
> > >
> > > I researched whether other upstream drivers use of_xlate() /
> > > fw_xlate() as an "allocator" like this. I did find "exynos-mailbox,"
> > > which appears to be doing something similar. However, upon deeper
> > > digging it seems like "exynos-mailbox" isn't using this dynamic
> > > allocation for any compelling reason. It looks like, really,
> > > "exynos-mailbox" should just be returning one channel. The client
> > > (exynos-acpm) could just use the same channel for everything since:
> > > * It actually gets the _real_ channel ID out of the data.
> > > * It doesn't care about txdone.
> > > * All it does is ring a doorbell and there's no queueing.
> > >
> > >
> > > In any case, if using fw_xlate() as an allocator is truly the only wa=
y
> > > to proceed, I'll finish my prototype and send a v2, but I'm still
> >
> > Why fw_xlate() would be an allocator? Can you extend your code to show =
that?
> >
> > I think doing any allocation in xlate() is calls is fundamentally wrong=
.
> > These should not modify the state of the device, so no allocations, no
> > device_link_add() etc.
>
> It's not _calling_ an allocator, it _is_ an allocator. It is walking
> through the array of channels and returning the first free one. Then
> that free channel is "allocated" to the client.
>
You mean _assigned_.
Allocation means when there are some resources reserved that must be
released at some point later .... which is what the mailbox controller
driver does in probe() and remove().
In xlate() the platform just decides which channel to assign to the
incoming request -- some platforms take the hint from device-tree,
your platform has flexibility and can simply assign the first free
found.

I will try to explain in detail your questions in your last post, but
I am still not convinced you need to modify the api.

Regards,
Jassi
