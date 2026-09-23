Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15E623E325
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Sep 2026 00:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123034; cv=pass; b=ltr1j+Ag0SHa62nnJUXobvrygTeuSNPAbz3Qi0LuMkYtTXPvNY6/+IlepMkuqDQsmwraDcE1sVuoua0I+JaF7qvVVDNCN0SUeiOAeOvNAteuDkSFJRq71LpMnXSCCmVtjvRoEQT1JJ1zLNskltevBstMzTn1xRWCshYoHg2cL2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123034; c=relaxed/simple;
	bh=ZoYV32dTXi9ZJnHfaMy4Lq50Ir7R1nATl5hsAaNKaJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zh8pZtMnkaNL4V7lPkpgxdASOWFsus8hsMvAn9+AyntEvMwBA4kLnLKqiMasi33EAX5XMhnrNfgAcq/Rm6dgjHEOLs1JffFst9itI3d0AD8beqT1Wlk1mUvpdSAMQKDndPI0b1L5NPVzVz7S2NemfFx33ZVkPoEqckPQ8Ox8EZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S75OwzdD; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S75OwzdD"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9b2f1dso181135fac.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Sep 2026 17:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790123032; cv=none;
        d=google.com; s=arc-20260327;
        b=G0O3tXgDCShctbWpfjB04yO6xtP+lh2s7v1Upn/dO97fFBdM4c9evUwdhKEBE4Mu6u
         DGMC5f3fgcOJs6kZ/cJCmcSpae+6E7Dxfg8R6XFeRt9Z2XzvqacaQSTybVCQ0RS87NTR
         cYjPvqfWD8v0mGpEMpTmAZrAUFlAs5r6UTMQnPMT1jHa2yupyckbmq2bH4xynyounvQa
         b03tKUHhK/MaKx7zjqaMbwc8uNX7ip023gWbIpdYUmNt1Q0Rp5lR7a/uQRNBzCE9uyrN
         LSmG66mYGrG1Q/vCLOs+4MEAKhJipu91b9pf2fh6/tlOsXjgBlO/HpQ+ZDIsgVH2McE7
         /V7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MKhsSlXyOKCVGmRz6Q/baoJt9IU2et11gsxgBLOMA5I=;
        fh=ErNzctUyerHF1tZ5/SXSiO7ZegM/c8Pu1Fk1WylcCoI=;
        b=emdbqf7BU4nxZKQK6quUFiGcVbCsM0xVzdE+7zUWyXrsIiXSX7aZ+QHSUb/K2uEM6V
         hlLrCPo3U2ROLRnd7ZCe3GOWlC5fAQIfkMP2A+rJs3FdoaeRAdb+egHr0lwQwqsjggwK
         Dr6O27cR6E12hl464c9BORKDYJb9x2bia+bBfNJ+Nk3QPWKI5skwyApcQncP5sGALRrB
         ijqUoFsFv2orFn5Sy9lJHncZ7t628jGZUzPEqMQwji2e06WC/nQu3EJDcqucQrephjUN
         OB1seJSs2kPCe7aFUTajwh8lb+8he+ca1yKMxotOnBBTfFNLtzOSlMXJEZzgwVVSr6rj
         qwiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790123032; x=1790727832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKhsSlXyOKCVGmRz6Q/baoJt9IU2et11gsxgBLOMA5I=;
        b=S75OwzdDxY0Xk781XxdkCFA6bm5HZJu9iAOxBqX/2TEZ3iReqXCyHeoOMUj4vLC7lO
         CUCboKQAp2YIuqweWUriQID0aDrJ7DljRoBplPNrpjqbcDxiWsSQQkRq1nTwR0NPha2W
         mu97XQfuq/5SmKJFRxBzs1oLL/YFNQjBfg6GIFXBcT0V7gCGjGrFwr46akvk9YM8FQsv
         tvtm+iGY8rQlASxwyIfSffHUxzifrUT6SCU/AITZVMLqPUWuAhgHVHm6Qp3G/uVUodj9
         Wua6fwLDLhRc29u5oYhttdq0C2xg8oy+F8tw+mLW3pxWdKRx3pyu0DbaYffiKgj+PSwe
         JAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790123032; x=1790727832;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKhsSlXyOKCVGmRz6Q/baoJt9IU2et11gsxgBLOMA5I=;
        b=sKTvROTMBY1NW3EIJhIvxwnqZdOc7qbaXET8kn7jQuKGzFClyX5mW72vhQE9KAiEcZ
         LW/IJvlHyatYlFlvH2cEwK0dUcCs9oabYdwcbgoEsbmHvUe++ZDQGvH+A6UP68cNopjU
         OOPyCd0nmFI0Gmj/1jnOLAR2Sqi4aO4U0iaJ1qVdATs70ZV38qs1Mlxq6UA+/sRGYtnx
         F83F6FgvCHs3uyzXj7TnSBT/gvn5IU7kHUOf4YSH86DbqEdLGy4KAytqksPtq19JVH14
         FWMvKD47LJ8E89WA+JE8bnC7tidG8DnJ2n3VfRXtuin5jMLtdX1v5/cG+nSj8+SPrymG
         lyKw==
X-Forwarded-Encrypted: i=1; AKwUvBwViBip6oB5bJxF/u3fYp3qAvqRXTgVHQuyLhTF/rEEWgeBUJJFaYwogp0bbVqSVxKXI1gicFMoyer3pMM7UIcjZQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mlwiogk7n0BCajBQ8lDm8HSDut/fGztzfQ7rNFQKx3nsPB9jXA
	q3QL7Z37YKZ2nqCDLjq5DF8hy+UM1lamOez1kw68mMyUiVu6NLrs3sXINbBpcatGeI3rMj1gx27
	a4SLit5hmrngczsxvyO7b04yuxas0j+I=
X-Gm-Gg: AYBFou3Ue1hDm7CVZ+UMjyiQ5ISaIW+Ew7j2RcYiB2zB8hj0f5R0nvkYLkLv7A1/bYq
	JwyYWayz/c1jn7hg4XEfQ2AEK4cfY4xQbzlUOpFBKxR/q80ZxxjchLeZc3O0nxpNt4JIB8ESCiD
	NhAWFOdP2URAgV2AyqCsqxfJbpDfbBmRrmTc12Ib/U03odssWBV9rIzfW+JRnxU+mGP6e1YOCTp
	ypnlu7bfhZZiQBum2VX0WE9f1IO6arynnVs+5rcLZBf/Lr7w66KD+bMvJwUqyVyx6ck6yqPy01O
	zP7JzbOCJlb13lX+0My4WDnq6BKaM/K5zyalELtfluOBGJk9JJpvZgU=
X-Received: by 2002:a05:6871:3a0b:b0:48f:e0f6:bfec with SMTP id
 586e51a60fabf-490923b53dfmr917708fac.24.1790123030632; Tue, 22 Sep 2026
 17:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
 <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
 <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
 <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
 <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
 <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com>
 <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
 <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com> <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
In-Reply-To: <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 22 Sep 2026 19:23:38 -0500
X-Gm-Features: AclHuK_wE3olgCkrkKIbn1PfIdgGUCx_17H17uIHjPsLY1-Xg-W7zy_0cWh-1As
Message-ID: <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Doug Anderson <dianders@chromium.org>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 11:01=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > > > If you do have some real numbers and think it is worth it on your
> > > > platform, then maybe expose each doorbell/shm-slot as a generic
> > > > channel. clk_mailbox will request a generic channel, do the request
> > > > and free it. The same effect but without inventing a new api. I can
> > > > share a draft if you want, but I suggest let's not make things
> > > > complicated without proven benefit.
> > >
> > > FWIW, the downstream code in Pixel does what I think you're
> > > suggesting. I can confidently say that, while it doesn't require
> > > changes to the mailbox core, it is much more convoluted and
> > > complicated. It also bleeds into the device-tree representation, whic=
h
> > > doesn't feel great.
> > >
> > > Just to be concrete, I'll document how the downstream driver works. I=
f
> > > this isn't what you were thinking, please correct me.
> > >
> > > Back to our simplified "clk_mailbox" driver. We'll say that our
> > > "clk_mailbox" driver talks over a single mailbox to the remote
> > > processor. Let's say each message is 4 words big. The message space i=
s
> > > 32-words big. 32 / 4 =3D 8 which means this space is divided into 8
> > > queue slots. Downstream represents each of these queue slots as a
> > > generic channel. That means that, in the device tree, our
> > > "clk_mailbox" driver looks looks like this:
> > >
> > > mboxes =3D <&cpm_tx_mba 0>,
> > >          <&cpm_tx_mba 1>,
> > >          <&cpm_tx_mba 2>,
> > >          <&cpm_tx_mba 3>,
> > >          <&cpm_tx_mba 4>,
> > >          <&cpm_tx_mba 5>,
> > >          <&cpm_tx_mba 6>,
> > >          <&cpm_tx_mba 7>;
> > >
> > > Then the "clk_mailbox" driver is in charge of rotating through each o=
f
> > > the channels. First it writes to channel 0, then it writes to channel
> > > 1, etc. This works with no changes to the core, but...
> > >
> > I was thinking something like   mboxes =3D <&cpm_tx_mba>
> > clk_mailbox simply asks for some channel, gets allocated the next free
> > slot. The mailbox controller driver keeps track of the channel-slot
> > map locally and is responsible for managing contiguous slots and
> > completing the tx upon receiving ack.
>
> Hmmm. OK, so I guess you're saying that every time "clk_mailbox" wants
> to send a message, it calls mbox_request_channel(). It always requests
> the same channel over and over again, but underneath the mailbox's
> fw_xlate() function returns the next distinct channel? Then once
> "clk_mailbox" sees the tx_done then it calls mbox_free_channel()? I
> guess it would need to fork the mbox_free_channel() into a delayed
> work function since mbox_free_channel() requires grabbing a mutex and
> tx_done() is called from atomic context. It would be up to
> "clk_mailbox" to ensure that it used the interface properly: always
> send the message on the next allocated mailbox, always free the
> channels in order, etc. Also, "clk_mailbox" would still need to
> implement its own queue to handle the case where there were no more
> free channels.
>
> One thing that is important is that "clk_mailbox" needs to know when
> "tx_done". If we didn't need that, everything would be vastly simpler:
> just allocate the channel, send the message, and free it right away.
>
> Did I understand your suggestion correctly this time, or am I still
> not getting it?
>
> Assuming I understood correctly, my thoughts would be:
> 1. At least this doesn't bleed into the device tree, which is great.
> 2. I'm a little worried about all the overhead involved in constantly
> requesting / freeing channels. Maybe it's not as bad as I fear, but
> those functions don't seem intended for constant calls. Even if the
> overhead isn't that bad, the extra overhead needed to fork the free
> call to delayed work doesn't seem great.
> 3. It feels like trying to manage this from "clk_mailbox" is going to
> be a bunch of complicated code, including managing our own queue since
> we still can't use the mailbox core's queue.
>
It should be a lot simpler and neater than you anticipate.

I agree we should avoid channel request-release for every transfer.
Not due to overhead concerns but because that makes code cleaner.
(lets not forget the remote handles requests serially and it is just
the latency of incoming ack irq and programming the next xfer that we
can and want to avoid. So acquiring/releasing a channel should not be
the bottleneck).

So I think clk_mailbox can acquire all 8 channels during probe and
maintain a list of idle channels from which it picks one and uses it
for an incoming clk_prepare(). If all channels are busy, the
clk_prepare() will sleep/block on a wait-queue which is nudged by
tx_done of a transfer after the channel is added back to the idle
list.

Regards,
Jassi
