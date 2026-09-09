Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD43955D865
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Sep 2026 16:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971669; cv=pass; b=LDNTT5ZwqC/elidL/kJqd8kNEGaBuTngqzIvpkBv6zvZG1slT1GGGX1OsLXclF8Dmi/kllUaeP0cD3hDH/zyfWikFN2zpZ8LvaUnk2ny3EPdvJbMjnMuMjzb5zdWYxHHasD5vk/iH4rYCO/G9PuihQkbBSADmjcMj+CZ4G4WvAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971669; c=relaxed/simple;
	bh=3vInAeTbwaD+UWn7imDpgnRsQEzj9TNCNzSkTEAsOl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NIgx+YXCWqkAFy1ZFROxLTAsL8vmutAAk991/F60MCYpQ0fWDa8oD/mArUidbv7OgcYk1pfAliMtbLzZnZlPecX9VfKP5l/Zpm4bf+42uN+UFDQpyy4KavjMGjwco7ymWiQpnzClLoqn5f9QNSduD1AmPPeyjDIIhK0NPLvO0Pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWC2BtFG; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWC2BtFG"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9b2f1dso1421324fac.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 09:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788971667; cv=none;
        d=google.com; s=arc-20260327;
        b=mhi1aSCLjKiNDv55d9jMXv9fo11KsVrA+w743yv1OPUBV+4BRLFebbVBXgXsPuWip0
         Rs/zRYhQmEsQ8Vs6pGuH6CkNQOcgOotZ33HEiB9NuWLmpnLTuV3/AUDgifLLmVCRoZ0i
         UUBwIzfHw5fe3fgr0v10hGeG2n2gitZpOdk+2jOcorJjkiDeflPYvahK6yKTQUFKt2zA
         tsEE30OhYbE7lGnGgUXfMrE0iV9TQdWUyffyZ/W8XRHBsTUedKGbegT/4oeAgceDqh1L
         IR5FD8LX+zZ90qnTzJEdWgWZbVxVG62uKRFNryDYGKMM8pvSXMttfsTHr0VN1h+77Oxo
         edDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8OXeBHBySyt3qw2NquXER+mKJWf4OrhxS7QKJQxlO1U=;
        fh=+ZZdZ7B2ewB/YNf7Bliy/5GZccDXuwu8MrZBRmV8RAs=;
        b=qQSkcO5gk0YbKR5r9yGE/W+4skzrKIkUPSklOSN5314r/tl2Kr0zPbQQV12fUExp0r
         wOXSOdbAmH0yyUPBDYduzSWBPkflajDljiA9eS7UZyIS1wXCdpq0RbuxZw9vCU8Pw9Bv
         DmEKU49jMhA+mwANjX4Vm4+5rFEF/xOoQ5WwGUawU5zisk1419NHPkimoQTt7TXPAenw
         l/7uZaaGtZ/oDi64MpInAjIPt7ZOMgFb9A4F8+OYPbjqlqyqXQrAlPgaMrKvNocyAfC5
         xeruuscDx/wG4doEz5RS0ILJxmIDrz604dAHixZf4uTRdU12E6NA4f4JKCJmTe9SF8eN
         OQ4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971667; x=1789576467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OXeBHBySyt3qw2NquXER+mKJWf4OrhxS7QKJQxlO1U=;
        b=lWC2BtFGIu/Ig4lV7uDLB3jc6h8kJBiGHiIqWiZ28AJUs+5yM6XcBpB73qcPsq2y+H
         GFNL5qd4ioJovv7AQy7EtlbAAvi1dMtsUwmgfLTiJiSXrYcBMQPfBjMTsqE5Dxg9EfM/
         WnX0WYITZJ00mlLyf4DpeVYGxWB/JWr6BkSMEvQPKEpnKzRa4fSH8U3pnUxhFpciaqGN
         coPfKSLRaBbSqlda1rqm+nvnjfUrp+MJWBRhwCL66IS3iNC51kZNq6Omb6xx8frXPpP4
         p008zMcfr0Xx3xI6uEDkcTOc7n1IDEycFwWxpuVuEvxg2f4N9l8Wjc1CnSi3FO7NRbQP
         CZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971667; x=1789576467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OXeBHBySyt3qw2NquXER+mKJWf4OrhxS7QKJQxlO1U=;
        b=I36WKuZIVpVqDX4L9HsRZf39822wDBa62X3Z3RbsQmsIVxTiLOBE35ILYzkPjyvqDd
         gzz1mUO3VyH73S12dSi7g8fzjngaM+iRI3YI8rSwM3Cyum0qULBNGYaioAMViK5TrY3g
         ntiIWEtMcQIyBHb3iOWWIGopJZFo6SW2cV7Bl6++VIyH2+kItkyhMrsLKaJSL0BAx43d
         1Aw+Dx1sy0F/NRZy6kGvX2DUyksoLmz7kvlGq7PpDqkS7JuJVitVwfO4HE9Y1SW44HIA
         DKDS2X+C1mhLrTdxvyfAXaQjJyD8r7pTQ6Yc9dkz/1bEdtB9FCwW2epuPkivpwyDwMKQ
         SpOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzl79Sk/fCKJ7PLW6V/GWkePwJr95qfruTEtGe54EtrDV/+Otag4QttM102WXq6lxFHuicXIsCwMlr/K21EpqwEwQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mTLSFj4qDKxKzeHKWf9BH2M6E+yYA731PKD7klYRxi/A7k61i2
	ORQIPAElGSOSGpnzZxrFxHYwy7bueWbC8OouMK4tAFPZ2wF8KqC+9LIjEaMBzI3LsPlBC8RWKPX
	G6f1NtnjSG8GK09TuCFMfu6t4oOItyYA=
X-Gm-Gg: AYBFou1jrjMm9uvuz7uw4LI4l889E/24ucBIl592Wr4XpsKQTCLpFTbAdr6R2EhISiC
	8/40hYimHPuCO2V+Wg6skb73dy/ymO+U5ieez141Ui9+Qz3swgPT+quAcXWSc0tRFLJ1sna6pYR
	ldsHH7uwWBlny6QpyXZeAoEOI3Ll0QbEqstr5ekNJ1vsvWr97gNGv9hgCmt6hjI01GAYn4grhGt
	5abD+Eu+YJj4gqiRcFQR4pSX3dFOvYEM1r7xVos79keS3ncbH5wT1xlVO5auBd3lvaV2e3GCloS
	OKoYkXzjawuvOGNQA/l6+R0eqO5+TJjcV4icfqV4iU8Fv9vWV/7RVFI=
X-Received: by 2002:a05:6871:73a2:b0:47b:d505:86e8 with SMTP id
 586e51a60fabf-47c97aefcebmr81914fac.7.1788971666583; Wed, 09 Sep 2026
 09:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com> <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
In-Reply-To: <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 9 Sep 2026 11:34:15 -0500
X-Gm-Features: AcwNN1VgB6PY3lWZVGJPLxRB24QIZFj2GUXPTnTbU7UduTBmTljunh-ycSlPZcM
Message-ID: <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
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

On Wed, Sep 9, 2026 at 10:53=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sat, Sep 5, 2026 at 6:20=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.c=
om> wrote:
> >
> > Hi Douglas,
> >
> > On Tue, Jul 14, 2026 at 5:24=E2=80=AFPM Douglas Anderson <dianders@chro=
mium.org> wrote:
> > ....
> > > +
> > > +/**
> > > + * goog_mba_handle_tx_interrupt() - Handle interrupt that remote Ack=
ed our msg.
> > > + * @goog_mbox: The mailbox info.
> > > + */
> > > +static void goog_mba_handle_tx_interrupt(struct goog_mbox_info *goog=
_mbox)
> > > +{
> > > +       unsigned int reqs_completed;
> > > +       int i;
> > > +
> > > +       /*
> > > +        * ACK interrupt needs to be cleared before reading CLIENT_OU=
TSTANDING_MSG.
> > > +        * Then if a "race" happens and another message gets Acked af=
ter we clear
> > > +        * but before we read CLIENT_OUTSTANDING_MSG then the worst t=
hat will
> > > +        * happen is we'll get a followup interrupt that will show 0 =
reqs_completed.
> > > +        */
> > > +       writel(CLIENT_IRQ_STATUS_ACK_INT, goog_mbox->iomem + CLIENT_I=
RQ_STATUS_OFFSET);
> > > +
> > > +       if (goog_mbox->queue_mode) {
> > > +               u32 outstanding_msgs;
> > > +
> > > +               outstanding_msgs =3D readl(goog_mbox->iomem + CLIENT_=
OUTSTANDING_MSG);
> > > +               spin_lock(&goog_mbox->lock);
> > > +
> > > +               if (goog_mbox->outstanding_msgs >=3D outstanding_msgs=
) {
> > > +                       reqs_completed =3D goog_mbox->outstanding_msg=
s - outstanding_msgs;
> > > +               } else {
> > > +                       /*
> > > +                        * The hardware's track of outstanding messag=
es should always
> > > +                        * be less than or equal to the number of mes=
sages we queued.
> > > +                        * If it thinks there are more messages outst=
anding than we
> > > +                        * queued, something is wrong. Assume nothing=
 was completed.
> > > +                        */
> > > +                       dev_warn_ratelimited(goog_mbox->mba->dev,
> > > +                                            "%pOFP: unexpected outst=
anding msgs: %u -> %u\n",
> > > +                                            goog_mbox->np, goog_mbox=
->outstanding_msgs,
> > > +                                            outstanding_msgs);
> > > +                       reqs_completed =3D 0;
> > > +               }
> > > +               goog_mbox->outstanding_msgs =3D outstanding_msgs;
> > > +               spin_unlock(&goog_mbox->lock);
> > > +
> > > +               trace_goog_mba_process_q_txdone(goog_mbox, reqs_compl=
eted, outstanding_msgs);
> > > +       } else {
> > > +               reqs_completed =3D 1;
> > > +               trace_goog_mba_process_nq_txdone(goog_mbox);
> > > +       }
> > > +
> > > +       for (i =3D 0; i < reqs_completed; i++)
> > > +               mbox_chan_txdone(&goog_mbox->chan, 0);
> >
> > The patchset doesn't say much about the clients but if the platform
> > works like this, I have a strong feeling we can do without introducing
> > mbox_controller.has_queue.
> > Just use the msg_data[] ringbuffer -- we can avoid changing the core
> > internals and you will still get ACK for each message.
> > What are the clients going to be like?
>
> I don't think we can get rid of `mbox_controller.has_queue`.
> Specifically, the queue mode allows the mailbox controller to handle
> multiple outstanding transactions simultaneously to reduce latency.
> Imagine host (Linux) interrupt latency is 100us and we want to send 3
> mailbox messages. Let's say queuing a mailbox message takes 10us.
> We'll say that the remote interrupt latency is 50us. Timing would look
> something like this:
>
> 0.000000: Client sends msg #1 and mbox controller initiates the xfer
> 0.000010: Client sends msg #2 and mbox controller initiates the xfer
> 0.000020: Client sends msg #3 and mbox controller initiates the xfer
> 0.000050: Remote gets IRQ, sees 3 messages, and ACKs them all.
> 0.000150: ACK IRQ arrives; mbox controller sends 3 txdone
>
> ...so all 3 messages are sent / ACKed in 150us.
>
> Without letting the mailbox controller queue, we'd end up more like this:
>
> 0.000000: Client sends msg #1 and mbox controller initiates the xfer
> 0.000050: Remote gets IRQ, sees msg #1, ACKs it.
> 0.000150: ACK IRQ arrives; mbox controller sends txdone
> 0.000150: mbox core notes txdone and sends msg #2
> 0.000200: Remote gets IRQ, sees msg #2, ACKs it.
> 0.000300: ACK IRQ arrives; mbox controller sends txdone
> 0.000300: mbox core notes txdone and sends msg #3
> 0.000350: Remote gets IRQ, sees msg #3, ACKs it.
> 0.000450: ACK IRQ arrives; mbox controller sends txdone
>
I don't mean that ... though even that may be more acceptable to the
clients than you think. What class of clients are there?

I am suggesting to consider TX-Is-Done when send_data() returns, i.e
tx submitted is seen as transferred. You anyway  don't catch
transmission errors. That way you fill all slots without blocking on
the first message and achieve this same throughput.
Without knowing the clients I am not sure if that can't be done.

Regards,
Jassi
