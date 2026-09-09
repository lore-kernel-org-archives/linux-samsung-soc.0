Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7694257D214
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Sep 2026 16:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973031; cv=none; b=I+AyxcAAJ+MSR84Of303DlJkUd4Jg+IrBnLoZghRMH00lj7arzC//aTot0pHpHkyVXTuF5KjWIfMrpSurTzsubMRWYoGW+/I2O7aTuC2iXX8GM7cGn4fDLuTlPOiN5ka9V33QTIK0MVyWqIc1ejFXuwAgnQLDAv6xHT5BXtUr/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973031; c=relaxed/simple;
	bh=+mndSaO7EOm/QRmteyLUtnEpZJMGXpFkzLWAzwkFSxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H1xkaVs/61uDHS/WnC5HfCxozcuBE4VHJfI9SK9szNLC9ziGSJlV2pNjoXtf8YENTnS/WPV8r7ymLqW4BI9QtfI7iAdaDQCtsh/YOVl+kiS7wixbrL8b9KUZbR8baJc56vif3qaRQRSqSN6Eih1Vr6Yity1WhCbYCkSzqcB7Stg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gkfW3pqo; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gkfW3pqo"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b76679c0f2so987810e87.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788973027; x=1789577827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2CR/xuPBfJUaIkIrsi5gmAz0JqvQr7Lu6iPE454B+34=;
        b=gkfW3pqoSUOO1+gyWtM7G4sf7SI7c2NwVKFd72THcDEaSWNj4c/dXWhI8CUdy6N+8A
         C2gM2UPcjMpLfcb9Qq2hOLHISw6fAbh64m2a/tvgnDAp1LWXAszIl3vF8wc4Y6BjAX3A
         lUUXYpmJsNMXxx/kC7ZZWstqnN8PjYZ2Ku6QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788973027; x=1789577827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CR/xuPBfJUaIkIrsi5gmAz0JqvQr7Lu6iPE454B+34=;
        b=pjFXZ4jLo/DVvbxCGzJcB5xhfpQcWBHC2qpTVYWAPGWD0BF74S+RxG0VibKyZCk5V7
         FwiWJF306HpLjSeUrpgnKOxAUmr9vc9htz2UpAdmPn+c8a63N/bf7VB61E5hxFVBThPJ
         aQ3VcfIL+ouv2FLtOpvBUxPmWwbyAyLHjH4DwMrc0AWHcxKbeRrwMM9QzqoImlpZZeXe
         lbuHEgj2Q+/J8s8fszpG6vtew+97pwRGdA/Tg+RUJoTe5RQ/SpP8sGyixMEPuSBG1Ski
         VBqe41QTqRfN/SxtOE6/6hdCYofQrcD3B3WJf3Pj/4MJ8UimkHtclkbfzlNKn3BQl+OS
         dqQA==
X-Forwarded-Encrypted: i=1; AKwUvByBnO0Cdn3eYu77QNHLuvTldp9qThbzmrHl9sRlchkD7r220Wf9UJNmeFjRMWfey/g11Aakd8af4etOMoD6mo2KSA==@vger.kernel.org
X-Gm-Message-State: AFuF++nX1ZTeobg+G88rUVD3rXsWmue4uw9esXU99AnVG69C1XBFg1I2
	JIJutCcqnwZbQ/rjdkV2jrzX/urRm0cv1K9WyE3Tzx7xmqssASJ2cHFZwg1kiMawBuniAbnDpfN
	1KnWPtg==
X-Gm-Gg: AYBFou1wy9Lebvj3drVMtqOVopNH7x6gN9f6QjjtGAgk+6HQ3IeKFl335+s1CM2LGpB
	5Y6LN8ABVbbnr8wSmbaDHiO/GRQ8AvMa1/+sgYWCh5jKqWKagphCqWxp0RT//hgxLMdpUnVEP39
	k/g1C7XENyvq9MeFU9PbT5dpw84j5NYVe7/K05cYuxv8smHynTA8A++4Pd6NjV+iN0oibOMu9Af
	RJa2eb8uPgljwaahvFFrVVPqv/VYJvDtHlNlfNKCan1o35wv+tZycQNmdFviP9KYlxJ3ZyKX/O6
	v5sesHMgwbWyYXJi/HuqD94Gq6uzkDitpoAnPHPkFpWFZP0Q4JBmJq9i9zNdu8N2IJCA8qutg97
	AOReLFG5gzV53F61IFjg5wHKOrZ6zpQ8xFUrpVF0wFz2RzcZ4sh01tYTS8J1R7YH/3r4Cbd1Sgx
	kYwIhnM7Atlri2MfyD5cV2PXvJZJXFeaoMOrdVkFq3Yp95Ua4zHUgHTsIPwpF3DPgSMFUNotS/5
	aYyDwVWFypgo7/Q1djNtkzxEI+Pl1uZZbKA6Kg=
X-Received: by 2002:a05:6512:3c86:b0:5b6:4ae:3ff6 with SMTP id 2adb3069b0e04-5b616f5989cmr6535577e87.30.1788973027091;
        Wed, 09 Sep 2026 09:57:07 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b7a984bcebsm477341e87.34.2026.09.09.09.57.05
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 09:57:06 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e257a23aso4156504f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 09:57:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByXz7U5weZyfy0vmyubzLH41hhWRoEcWe9tGy61begooBAGgBcOMKRb8IT/RAM8jS4srABuPXCMl0AYXxRi5bAfLA==@vger.kernel.org
X-Received: by 2002:a05:6000:41d8:b0:485:8a46:b3cd with SMTP id
 ffacd0b85a97d-4858a46b548mr36544508f8f.53.1788973024061; Wed, 09 Sep 2026
 09:57:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com> <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
In-Reply-To: <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Sep 2026 09:56:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
X-Gm-Features: AcwNN1WrrHTviMXpNF4XGy-eLDipuRr6WDvDf1_K-q05FH7VVpPgr4KG1SIBOUQ
Message-ID: <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 9, 2026 at 9:34=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>
> On Wed, Sep 9, 2026 at 10:53=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Sat, Sep 5, 2026 at 6:20=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail=
.com> wrote:
> > >
> > > Hi Douglas,
> > >
> > > On Tue, Jul 14, 2026 at 5:24=E2=80=AFPM Douglas Anderson <dianders@ch=
romium.org> wrote:
> > > ....
> > > > +
> > > > +/**
> > > > + * goog_mba_handle_tx_interrupt() - Handle interrupt that remote A=
cked our msg.
> > > > + * @goog_mbox: The mailbox info.
> > > > + */
> > > > +static void goog_mba_handle_tx_interrupt(struct goog_mbox_info *go=
og_mbox)
> > > > +{
> > > > +       unsigned int reqs_completed;
> > > > +       int i;
> > > > +
> > > > +       /*
> > > > +        * ACK interrupt needs to be cleared before reading CLIENT_=
OUTSTANDING_MSG.
> > > > +        * Then if a "race" happens and another message gets Acked =
after we clear
> > > > +        * but before we read CLIENT_OUTSTANDING_MSG then the worst=
 that will
> > > > +        * happen is we'll get a followup interrupt that will show =
0 reqs_completed.
> > > > +        */
> > > > +       writel(CLIENT_IRQ_STATUS_ACK_INT, goog_mbox->iomem + CLIENT=
_IRQ_STATUS_OFFSET);
> > > > +
> > > > +       if (goog_mbox->queue_mode) {
> > > > +               u32 outstanding_msgs;
> > > > +
> > > > +               outstanding_msgs =3D readl(goog_mbox->iomem + CLIEN=
T_OUTSTANDING_MSG);
> > > > +               spin_lock(&goog_mbox->lock);
> > > > +
> > > > +               if (goog_mbox->outstanding_msgs >=3D outstanding_ms=
gs) {
> > > > +                       reqs_completed =3D goog_mbox->outstanding_m=
sgs - outstanding_msgs;
> > > > +               } else {
> > > > +                       /*
> > > > +                        * The hardware's track of outstanding mess=
ages should always
> > > > +                        * be less than or equal to the number of m=
essages we queued.
> > > > +                        * If it thinks there are more messages out=
standing than we
> > > > +                        * queued, something is wrong. Assume nothi=
ng was completed.
> > > > +                        */
> > > > +                       dev_warn_ratelimited(goog_mbox->mba->dev,
> > > > +                                            "%pOFP: unexpected out=
standing msgs: %u -> %u\n",
> > > > +                                            goog_mbox->np, goog_mb=
ox->outstanding_msgs,
> > > > +                                            outstanding_msgs);
> > > > +                       reqs_completed =3D 0;
> > > > +               }
> > > > +               goog_mbox->outstanding_msgs =3D outstanding_msgs;
> > > > +               spin_unlock(&goog_mbox->lock);
> > > > +
> > > > +               trace_goog_mba_process_q_txdone(goog_mbox, reqs_com=
pleted, outstanding_msgs);
> > > > +       } else {
> > > > +               reqs_completed =3D 1;
> > > > +               trace_goog_mba_process_nq_txdone(goog_mbox);
> > > > +       }
> > > > +
> > > > +       for (i =3D 0; i < reqs_completed; i++)
> > > > +               mbox_chan_txdone(&goog_mbox->chan, 0);
> > >
> > > The patchset doesn't say much about the clients but if the platform
> > > works like this, I have a strong feeling we can do without introducin=
g
> > > mbox_controller.has_queue.
> > > Just use the msg_data[] ringbuffer -- we can avoid changing the core
> > > internals and you will still get ACK for each message.
> > > What are the clients going to be like?
> >
> > I don't think we can get rid of `mbox_controller.has_queue`.
> > Specifically, the queue mode allows the mailbox controller to handle
> > multiple outstanding transactions simultaneously to reduce latency.
> > Imagine host (Linux) interrupt latency is 100us and we want to send 3
> > mailbox messages. Let's say queuing a mailbox message takes 10us.
> > We'll say that the remote interrupt latency is 50us. Timing would look
> > something like this:
> >
> > 0.000000: Client sends msg #1 and mbox controller initiates the xfer
> > 0.000010: Client sends msg #2 and mbox controller initiates the xfer
> > 0.000020: Client sends msg #3 and mbox controller initiates the xfer
> > 0.000050: Remote gets IRQ, sees 3 messages, and ACKs them all.
> > 0.000150: ACK IRQ arrives; mbox controller sends 3 txdone
> >
> > ...so all 3 messages are sent / ACKed in 150us.
> >
> > Without letting the mailbox controller queue, we'd end up more like thi=
s:
> >
> > 0.000000: Client sends msg #1 and mbox controller initiates the xfer
> > 0.000050: Remote gets IRQ, sees msg #1, ACKs it.
> > 0.000150: ACK IRQ arrives; mbox controller sends txdone
> > 0.000150: mbox core notes txdone and sends msg #2
> > 0.000200: Remote gets IRQ, sees msg #2, ACKs it.
> > 0.000300: ACK IRQ arrives; mbox controller sends txdone
> > 0.000300: mbox core notes txdone and sends msg #3
> > 0.000350: Remote gets IRQ, sees msg #3, ACKs it.
> > 0.000450: ACK IRQ arrives; mbox controller sends txdone
> >
> I don't mean that ...

Ah, sorry for misunderstanding!

> though even that may be more acceptable to the
> clients than you think. What class of clients are there?

As far as I can tell, the mailbox controller is used for pretty much
everything in the system, so latency is pretty critical. Want a clock
turned on? You gotta send a mailbox message. Want a power domain
turned on? Mailbox message.

I don't think we can just drop the queuing support...


> I am suggesting to consider TX-Is-Done when send_data() returns, i.e
> tx submitted is seen as transferred. You anyway  don't catch
> transmission errors. That way you fill all slots without blocking on
> the first message and achieve this same throughput.
> Without knowing the clients I am not sure if that can't be done.

We need to know the txdone and thus we can't do what you're proposing.
In general, queuing mailboxes are used in cases where the remote side
enables a resource like a clock or power domain. Different tasks in
the system may independently turn on/off these resources, so allowing
them to work "in parallel" makes sense. ...but each task needs to know
for sure when its resource is finished turning on. If we just imagine
3 clocks we want to turn on.

clk_enable(clk_a)
clk_enable(clk_b)
clk_enable(clk_c)

Those 3 calls can be made in 3 different contexts from 3 different
drivers. We want all 3 enables happening in parallel with each other
(not one after another), but each call needs to know when its function
is done.

Does that make sense?

-Doug
