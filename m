Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968D35803A8
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Sep 2026 15:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969236; cv=none; b=lp82CwM7uxRClRmeO8dMGVX4VAtxAaN9mxlAoA5vOHivpnxRfTKrWlM3dtX30TiNNSeG7b5L9EgZfZSxVswaQ/dEkpZCiH+u6UDMfi+XbspxpaJglKFV6G/xMIzSkqtY4TaN+QzKGsJzxn7eUbnUniCWTHE0VjXPPa1gl8fy2M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969236; c=relaxed/simple;
	bh=ji9WYJgPEsD0oObrb9vGLlirQa8xSklSxgsAtuPp4EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6diotzOoSPTqZih394MUQ9UlRyb4D8hue3yHkIFUCL7iElGH6urHs4bg6rX9nontK50km1TivPj6/vNGcQeZXKyjHSjL2okcC0oXouf8lboWzBrpz+F+/z3ufeKFE8+hSziGsNhQemA/5bhg4iILWSKVbMarCxZq0rSb53FChs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TPhqw4ZE; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TPhqw4ZE"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f13so1250407e87.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788969232; x=1789574032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a9+VNAcoJZM4aq0tQI6V+NRSLAdDW0QhBOB3oGupHtM=;
        b=TPhqw4ZEcn7Wneai2L4v2yuFztJ9KtsSGo6Ibbp1Ov+CCd+l3nXvqyIGwLcn5PwNs1
         G010Nk4LCBwMEKL6+AcNhW8ACKn8XGgalrHnol8ZJN2e7Ih0kgDdbALx7XGjJvj1NR+z
         4zzc/JW9GWGIngNcYVXrDLN7JR2oXc/+iQ5SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788969232; x=1789574032;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9+VNAcoJZM4aq0tQI6V+NRSLAdDW0QhBOB3oGupHtM=;
        b=FY5gxh2us7lmtT/l+Q1FPFc62R1LoH9/DuHf8oBMGtEpWVHG4RBjWcNO9x/t99fAi0
         XCAcaflvwbiUK08CfP3A6AtAtecoBpXWBGOTFrIxOPccg6zrztyNnB1TheD5CngnD1AU
         93ddikv2DrfGzTT7OSqmseUpBY2BLZmQ0nkKIeDWeX4Hv8VwFkQHsbnxPEvAmdLvtDug
         dGurgeZYF2pkwh0InvVZ35oMPjj14TeAguneto9ItfXGww/RoWyfdXqYE+dwQt7dp+jO
         uAFLxzQkSLJzqbuApoaRHklCm9odgIQ7dyPH/8x/EYRyDdSRyQEvwpf+zd4852vHSpQ3
         rbgw==
X-Forwarded-Encrypted: i=1; AKwUvBw8S/hE+nK5kbDfXxFnmHMb/iz0s5PU0GAOJs4ApW+3CRwVVeu/hAKDaH2rcTu3OyF+QD/7zOM2JaeTo0Dve+aWXA==@vger.kernel.org
X-Gm-Message-State: AFuF++nSRWQ59sNm2whXCEnvxgvsQEM8kw0IxWxMGNrb+zyfJu3t+UxP
	inbLhvAS+OIOcBA1MzvkM4/T/U+7eTNpZX6b+Vc3CmOI7EsnAJ+GzWwBM7zywdQQLcZoFKpp3pj
	eJ5akNw==
X-Gm-Gg: AYBFou3FteLRIMMDYg8basEoT7VRdNlR81lH11ufxSsu4gEpC4sq+SF896wfyRflfqW
	yiBN0osk/48cgYxWy0/p0iaM74sML+GSYVyurZ6YZKoDCyQ0O4gqKWbUr9D/vNOhINba6yO7SXV
	24KVcpjoWCxbtuyAv9W5VWrdS/poXGdkWZy3tNMlo7PFttu1GZAFVQWLMnsn0WTD7BB+YIwJAFV
	KbRjDL0xYuRrsb81feMeHDm/EkcMPrnwdxvwFeBmHGh2ywRBzAYCZbAfvv7AMXpC7xjNRtvJBGM
	v2gHaicnQYkjGz7p2FHad91l/cUJhqVN10NNHAlv8wsHYX4+3IMFcIMDUHCM/Lheey8zvNdTV5Z
	8Eg78de0SJZS/gPzjdtiSFuz4+4yl86l9xA4nLcWh6UdOIqDBL345KI+mj4TKsO8O9HM1DNENEY
	/bB9YTfSQAdMRHSCdf7VGARgFTS39+YdLThpsLCh0TYXqQn/FsOqnxsMMjVVHS71bmK17drmRHq
	5VopzSbW1UBe8bWLeU5RN+d+viqcPQl9ISEQA==
X-Received: by 2002:a05:6512:6688:20b0:5b8:845:61f0 with SMTP id 2adb3069b0e04-5b8084562ebmr908837e87.20.1788969232543;
        Wed, 09 Sep 2026 08:53:52 -0700 (PDT)
Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com. [74.125.230.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61670b092sm3894463e87.80.2026.09.09.08.53.51
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:53:52 -0700 (PDT)
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a34473d51fso11520091fa.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:53:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwQluuNE1phtTb7mg6DyqIz0otxaER3Yqs+7sFNzkBeoSrFtawFs0mEpuYeMicHNvQB+TnyRB1YWwB2fVacN8UDpg==@vger.kernel.org
X-Received: by 2002:a05:651c:a34a:b0:3a1:4f33:f60e with SMTP id
 38308e7fff4ca-3a49765d1ccmr16262451fa.8.1788969230181; Wed, 09 Sep 2026
 08:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid> <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
In-Reply-To: <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Sep 2026 08:53:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
X-Gm-Features: AcwNN1VMebMlHBDN2oamx6OSXko7kBI4Fg9_efqS3e1qWZ6X4QFSZyV1w6i5DKU
Message-ID: <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
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

On Sat, Sep 5, 2026 at 6:20=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>
> Hi Douglas,
>
> On Tue, Jul 14, 2026 at 5:24=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
> ....
> > +
> > +/**
> > + * goog_mba_handle_tx_interrupt() - Handle interrupt that remote Acked=
 our msg.
> > + * @goog_mbox: The mailbox info.
> > + */
> > +static void goog_mba_handle_tx_interrupt(struct goog_mbox_info *goog_m=
box)
> > +{
> > +       unsigned int reqs_completed;
> > +       int i;
> > +
> > +       /*
> > +        * ACK interrupt needs to be cleared before reading CLIENT_OUTS=
TANDING_MSG.
> > +        * Then if a "race" happens and another message gets Acked afte=
r we clear
> > +        * but before we read CLIENT_OUTSTANDING_MSG then the worst tha=
t will
> > +        * happen is we'll get a followup interrupt that will show 0 re=
qs_completed.
> > +        */
> > +       writel(CLIENT_IRQ_STATUS_ACK_INT, goog_mbox->iomem + CLIENT_IRQ=
_STATUS_OFFSET);
> > +
> > +       if (goog_mbox->queue_mode) {
> > +               u32 outstanding_msgs;
> > +
> > +               outstanding_msgs =3D readl(goog_mbox->iomem + CLIENT_OU=
TSTANDING_MSG);
> > +               spin_lock(&goog_mbox->lock);
> > +
> > +               if (goog_mbox->outstanding_msgs >=3D outstanding_msgs) =
{
> > +                       reqs_completed =3D goog_mbox->outstanding_msgs =
- outstanding_msgs;
> > +               } else {
> > +                       /*
> > +                        * The hardware's track of outstanding messages=
 should always
> > +                        * be less than or equal to the number of messa=
ges we queued.
> > +                        * If it thinks there are more messages outstan=
ding than we
> > +                        * queued, something is wrong. Assume nothing w=
as completed.
> > +                        */
> > +                       dev_warn_ratelimited(goog_mbox->mba->dev,
> > +                                            "%pOFP: unexpected outstan=
ding msgs: %u -> %u\n",
> > +                                            goog_mbox->np, goog_mbox->=
outstanding_msgs,
> > +                                            outstanding_msgs);
> > +                       reqs_completed =3D 0;
> > +               }
> > +               goog_mbox->outstanding_msgs =3D outstanding_msgs;
> > +               spin_unlock(&goog_mbox->lock);
> > +
> > +               trace_goog_mba_process_q_txdone(goog_mbox, reqs_complet=
ed, outstanding_msgs);
> > +       } else {
> > +               reqs_completed =3D 1;
> > +               trace_goog_mba_process_nq_txdone(goog_mbox);
> > +       }
> > +
> > +       for (i =3D 0; i < reqs_completed; i++)
> > +               mbox_chan_txdone(&goog_mbox->chan, 0);
>
> The patchset doesn't say much about the clients but if the platform
> works like this, I have a strong feeling we can do without introducing
> mbox_controller.has_queue.
> Just use the msg_data[] ringbuffer -- we can avoid changing the core
> internals and you will still get ACK for each message.
> What are the clients going to be like?

I don't think we can get rid of `mbox_controller.has_queue`.
Specifically, the queue mode allows the mailbox controller to handle
multiple outstanding transactions simultaneously to reduce latency.
Imagine host (Linux) interrupt latency is 100us and we want to send 3
mailbox messages. Let's say queuing a mailbox message takes 10us.
We'll say that the remote interrupt latency is 50us. Timing would look
something like this:

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

Hopefully that clears up what the "has_queue" is about and why we need it?

-Doug
