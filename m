Received: from mail-ed2-f39.google.com (mail-ed2-f39.google.com [74.125.228.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6779047A86F
	for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Sep 2026 21:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789940409; cv=none; b=ryCaNhCsp+Xed69gL1XP4/LLrQT++2vm86vvtewMDigS/LBmm0Q5YKeNS7KC0n4KohB/SFW3odJzfrvSeG6GTRz+dFT4xitaRe4w8fy2L+dC6wTrRJIotyi+jrE6ChgGkIvGad8wdWXYW8nb30L8pHoU1zqijDXo3BKubxfV8NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789940409; c=relaxed/simple;
	bh=+LmYPmWKlLU3Nx7bE5RMlXCJrar6BMVIiMrMMVP9sGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgT9vpIs3Wwl1sgKVaYTBI0VHlV11mQ5V7LSzcNTG8aidndXTke/dqD4rvL0W4NQHhhhfPk4xgLBlMcNzL0swILSxj+b7jN90MOorpjV2H9jH6Nqv4ia80h/t4xGiKEnFfLJSi65WqHWAhk6HqIGhJrWelFyUv1qnyva8SpCEuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U+e+MFCH; arc=none smtp.client-ip=74.125.228.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U+e+MFCH"
Received: by mail-ed2-f39.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso2678458a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Sep 2026 14:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789940398; x=1790545198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+LmYPmWKlLU3Nx7bE5RMlXCJrar6BMVIiMrMMVP9sGE=;
        b=U+e+MFCHbrQrICepCIeuisfvt1n+Cy5vyhRju0wVW7MPr2gBAuOGMU8UpsaCxgvLI1
         PP6qCuI4owNSTMULuez75smWEFWEY48Rs1n3R5YOj+VgCaWgh2Mnh06g2Os6FCqlkaqC
         v/NtTqQTiTAlrsfTXxFparZzeXnsqFEx/ccf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789940398; x=1790545198;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LmYPmWKlLU3Nx7bE5RMlXCJrar6BMVIiMrMMVP9sGE=;
        b=uyZMWMlfNId3TaeC2eZF0l5sFoXT/5BBsaQyN0JzDTQm8rL8GyijieSi8XxLCKzUBO
         dBiBZnklI47nFxW05WYXHCo2l7Dg2d4aSwD7XHKNpXyXCJ3gQ4N+8iAq7s6Yp+W6wZzM
         KEGHX7KFsEpK+ABtR2saX34szX9Xk3g2b5xYOzBl14TpQmDgTCG1l2hHew1gdSmItOZa
         n81eKKY4ZglvBOSxKkzgXoYcc0/+9U+iWLPjKmOILQDZR5RhSnkyyCUwjjtP58Xsx/0Y
         0Km75JOC+e97qv/AS3Q6jpVUgNFr23sJNirHobj6G/DCfqjIdSvfwC7ZS6F1Oh0O/9c+
         207w==
X-Forwarded-Encrypted: i=1; AKwUvBxPsPK0/vLut+Y7y6ItJ0pJPrZlE5J/UW9qiGGrFWvvfNe3eTwoM4ldp5gwHdRg7sLunQz4d9zOG1m1C/OjDbq33g==@vger.kernel.org
X-Gm-Message-State: AFuF++mhCK6N21VopujgI9+N7zrMEZEl09i8T8AeNQWaGXxBQJQ1Beun
	UddyCnIcBbkuGBJMm2JoKa0cmO5upeCYwyqUTckWRWQ0Qf0ic0M7cCeT59RADZyEm4oCZbtdZM/
	By+8=
X-Gm-Gg: AYBFou3C6m2SYmdBtBEBVSSjAbhwfX7HYMWZAF/nnZXbQAYD/8b+ybcgSBFDq9EUZzt
	Rv4jJ+8W9hlkaRwXiJPguZtmIoP+qY7gNG/EPC4uKte2aNZGRSwXC2bxO5sxKRqm0EEdqS2lmMM
	+RFLWD99dOhQEh1n9Qb3+N3fJzLg6g1WmMpq9qZoZRJS1DRalXlkPbl4Uon+/3J6iIu/xcL4EPu
	tiEJfarOgJYfpo0VkFQ8U3cn/elBnXsS0++aflWjEgbxnaCa+T8Rw0Hp3uYSLIySWS83sHNFxKk
	4mLplPzhqGB6uPjpw6UhjNJUuWwZguEObAG/3fg7Om4NXftAM62DAYmxshC6TSx9YyL+gHYt4Vp
	C9LQ9fl9TABOmeqXg6c6JMNhijqDtypTU28n3HHo4ISGnADdKlXJPyokHB6cJeHrSP482fQZfV1
	1ZtjBe6W+oxfN/yMGrlZnXnGvkNX8jArWyLcNMJwFs2aSehlYWY62VafMJpQheoy7bdrgFn2VaW
	MH2BoeBeFg7QQXhuHIiu/Qkh6T4r9isdacck0c=
X-Received: by 2002:a05:6402:354f:b0:6a6:21d9:541f with SMTP id 4fb4d7f45d1cf-6aa57808b40mr8875026a12.6.1789940397808;
        Sun, 20 Sep 2026 14:39:57 -0700 (PDT)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com. [74.125.225.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d817bdsm3071819a12.6.2026.09.20.14.39.55
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 14:39:56 -0700 (PDT)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso31802395e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Sep 2026 14:39:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxI/WHqrZ0LiS73QZxAqwCa0uooVobD9zhJYq3IAIBfFYHgvU8rP9QoxWiT+tcJLkC3POwhApF6sJ9bYBU/JU5RMQ==@vger.kernel.org
X-Received: by 2002:a05:600c:190d:b0:49f:bd3c:bc26 with SMTP id
 5b1f17b1804b1-49fc574f069mr123082215e9.33.1789940394146; Sun, 20 Sep 2026
 14:39:54 -0700 (PDT)
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
 <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com> <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
In-Reply-To: <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 20 Sep 2026 14:39:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
X-Gm-Features: AcwNN1UH8b97yz1z04sXG3ndNvqg6dtJI_UWqOQpPbCqwLWaK8N7A5wagZvhlbg
Message-ID: <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
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

On Sun, Sep 20, 2026 at 1:30=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> On Sat, Sep 19, 2026 at 3:40=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
>
> >
> > Imagine we have three clocks: They are: "clk_i2c1", "clk_i2c2", and
> > "clk_spi". The "clk_i2c1" needs to be turned on when we're going to
> > start an I2C transfer on I2C bus 1. "clk_i2c2" is the same but for the
> > I2C bus 2. "clk_spi" needs to be turned on when we want to start a a
> > SPI transfer.
> >
> clk_prepare() is allowed to sleep, so any path, that includes the
> call, can not be expected to have low or even deterministic latency.

Sure. Essentially anything using a mailbox as a transport mechanism
needs to be able to sleep, at least if it cares about "txdone". Even
without a guaranteed latency, though, that doesn't mean we shouldn't
try to reduce the latency.


> > In the i2c/spi drivers, we've got "clk_prepare(clk)" calls to turn on
> > the clocks. The three clocks are operated independently by their
> > respective users. An I2C or SPI transfer may take place at any time.
> > The I2C and SPI drivers need to know for sure when the clock has
> > finished enabling because as soon as the clk_prepare() calls return
> > they will start transferring.
> >
> > All three clocks are backed by a single clock driver. We'll call it
> > the "clk_mailbox" driver. The "clk_mailbox" driver takes the request
> > to turn on the clock and encodes it as a mailbox message to a remote
> > processor. Let's imagine that the mailbox message looks like a 2-word
> > transfer. The first word contains a 0 or a 1 for enable/disable and
> > the second word contains the ID of the clock: 0 for "clk_i2c1", 1 for
> > "clk_i2c2", and 2 for "clk_i3c3".
> >
> > Now, imagine that we want to turn on all three clocks simultaneously.
>
> Why? (not that it can't be done) I2C and SPI clients run independent
> of each other.

Right, the whole "independent" aspect is what I'm talking about. I'm
not saying that we're _trying_ to do all three transfers at once, but
just in the natural state of things there will be lots of clock calls
going on at the system all independently of each other. That means
it's likely there will be times when several clocks are enabled
simultaneously.


> > The "clk_mailbox" driver will see 3 calls to turn on the clocks and it
> > needs to convert those to messages to send the remote processor. It
> > will then call mbox_send_message() to queue those messages with the
> > mailbox controller. In other words, we'll see these three calls happen
> > nearly simultaneously:
> >
> > mbox_send_message(chan, &{0x1, 0x0});
> > mbox_send_message(chan, &{0x1, 0x1});
> > mbox_send_message(chan, &{0x1, 0x2});
> >
> > The LGA mailbox controller knows "txdone". That is, when the remote
> > processor "acks" a message, the LGA mailbox controller can tell (and
> > get an interrupt). This "ack" signals that the clock has finished
> > enabling. This means that the "clk_mailbox" cannot run the state
> > machine and it can't call "txdone" itself.
> >
> > Without my patches, when the above 3 mbox_send_message() calls are
> > made, the first one will go straight to the LGA mailbox controller and
> > the second two will be queued up. Once the "txdone" for the first
> > message arrives, we'll queue the second message. Once the "txdone" for
> > the second message arrives, we'll queue the third message. This means
> > that the messages are not being processed simultaneously. The third
> > clk_prepare() call will be processed much more slowly since it has to
> > wait in line. If we had 10 clocks enabling at the same time, the 10th
> > clock could have a pretty significant wait.
> >
> > With my patches, the LGA mailbox controller is given the second and
> > third message even though the first message isn't done yet. The LGA
> > mailbox controller can queue the second and third messages even though
> > the txdone for the first message hasn't arrived yet. If things are
> > fast enough, all three messages can be queued up before the remote
> > processor has even started processing the first one. The remote
> > processor can process all three messages concurrently and acknowledge
> > all three at once. The LGA mailbox controller can get a single
> > interrupt representing all three "txdone" ACKs and call "txdone" for
> > all three messages simultaneously.
> >
> If your remote (host) can actually act on multiple requests parallely,
> you need a way to map ACKs back onto the requests. Currently you
> don't.
> Looking at the goog_mba_handle_tx_interrupt() implementation, consider
> the situation when 5 requests are submitted in the h/w fifo and 3 are
> reported ACKed by the interrupt after some time.
> You assume the three done are the first three -- which implies that
> the remote handles requests in the order they arrive i.e, serially.
> Otherwise, say, request-1 may be wrongly completed if the ACKs were
> for requests 2, 3 & 4.
> So it seems mostly an illusion of parallelism - remote is acting on
> requests (or atleast sending ACKs) serially.

It's more than an illusion because all of the slow paths are
parallelized. For the remote processor, I believe that turning on a
clock is trivially easy: just set a bit. The slow parts are the
interrupt arriving on the remote processor and the interrupt arriving
on the Linux processor. Those _are_ parallelized. During a single
interrupt, we can see and process multiple mailbox messges (or
multiple mailbox ACKs). I can paste the example I gave earlier. Just
as you say, interrupts are processed and acted on serially. ...but
because we can parallelize the interrupt handling we still get the win
because interrupt latency is much worse than any of the actual work
that needs to be done.

0.000000: Client sends msg #1 and mbox controller initiates the xfer
0.000010: Client sends msg #2 and mbox controller initiates the xfer
0.000020: Client sends msg #3 and mbox controller initiates the xfer
0.000050: Remote gets IRQ, sees 3 messages, and ACKs them all.
0.000150: ACK IRQ arrives; mbox controller sends 3 txdone

...so all 3 messages are sent / ACKed in 150us.

Without letting the mailbox controller queue, we'd end up more like this:

0.000000: Client sends msg #1 and mbox controller initiates the xfer
0.000050: Remote gets IRQ, sees msg #1, ACKs it.
0.000150: ACK IRQ arrives; mbox controller sends txdone
0.000150: mbox core notes txdone and sends msg #2
0.000200: Remote gets IRQ, sees msg #2, ACKs it.
0.000300: ACK IRQ arrives; mbox controller sends txdone
0.000300: mbox core notes txdone and sends msg #3
0.000350: Remote gets IRQ, sees msg #3, ACKs it.
0.000450: ACK IRQ arrives; mbox controller sends txdone

The numbers here for interrupt latency are made up for my example and
I haven't personally measured them, but I think it's not completely
absurd to say that interrupt latency (on both the Linux and remote
sides) dominates the communication path.

> We can keep the core
> unchanged and the driver much simpler if we simply use the buffering
> in the core.

FWIW, the driver will need to contain the queuing complexity
regardless. This is because the remote processor expects queuing. Even
if we don't queue at the Linux level, the driver still needs to know
if the remote side uses a "queuing protocol." This is because the
remote side expects the shared memory to be partitioned into chunks
and that we must move onto the next chunk between messages.

-Doug
