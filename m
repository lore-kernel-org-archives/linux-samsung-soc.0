Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA10051C07E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Sep 2026 22:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029158; cv=none; b=j36ltKmCTzaBF1LhKBPqWGzqOAxJ6CBocWP3g0ALYb4gG8e9ZbqYQ5UO7zP/R9SEoZ8sWbkkQ1qrf8FkMFFor6Kk19DG8xPEg7NVsJf3RphVZY4GDmmr89YjI13MfWs6Xdq73rP92G7kvPyEDYqJqOEs4YuvkYIPKxHw8VUWzs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029158; c=relaxed/simple;
	bh=8RtgzGRsQ9p0Umg2p6w0QgnSvfqxgxj+owooXspqwdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ik9yuPllx3HN9coGHZfH2Pt9KJ2INZJBJN7GepH9KiClpDeIN7V/eK3SlurNa0EHd/lCsdSJUSTbgzWaBrawPqsBh/e0CngcG2XVMtGTC7/8ZJqpdR6XY0iudU546H56Wisoug34zjQ8CQ6c9IrX5NQ/O4vp6GLqfBoZtSU4O/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SfnxBP4b; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SfnxBP4b"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59bc470d6so30325461fa.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Sep 2026 15:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790029154; x=1790633954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JdiAI3S5IFlWRld+QCl+TVH/KRSfsDODBqxz0rWOFkI=;
        b=SfnxBP4b+jFWbfZRsBW6wpVyTVOt91cJOl8K13Io8/rY/VDj6us54bheluQXqoSrzf
         71aVcgRTeq/G+tvFe5BT76/bVUJyQjzBCcGlWNqcTeW83mAU3Dc6V3lK0AGtA8HSOtig
         5H1cWxKaI0RXx/K4YXQKIWUJ3udnVz4EMn18Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029154; x=1790633954;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JdiAI3S5IFlWRld+QCl+TVH/KRSfsDODBqxz0rWOFkI=;
        b=gWPEQe+WisX0R8o4xRk0vGvskxRmnT9Xl2Nhd61qHymTsVXajmCakzdWb6fW9gG0Ee
         gNYR0dOob9b9wQRiKHqaK6QXpCcINgpL8SgHnIzVkl7JIxI3JKts4Jnd0kClQ/5ALTt+
         WFZS7m2EkArmh8LvdZfhpFAwDEyAfmdMJUlqyn/F3dV8o34IA4mfvv3YqSVIC6JiFWBg
         tDJNX/i/I6dojrDGOsEfLnDVWHJKPLR575NAiUJQXfeWOGPNMsPDdzYBc6R/A4T6ZxZ3
         b/rrPoc+VqmkHTPnp5EwcQRAfroCdg/q3IjXhh0GS2BkYSKpJsIcnb7IXAWpYysUlomp
         FjyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpuQ9CTxBhWaRyJ/y/Eyz9wQXqypgZgRsBm3caU0JkgQ2p6wkoLMSYWkj3ho+jldXYHc9bEjNa83nq6icLqqbE8w==@vger.kernel.org
X-Gm-Message-State: AFuF++k/D1bPKMVp5eVRwjeg5xch5g+14wt7e8tOhzEK82cGj5+F1SEp
	b6AXQiFR5AjvbKOYEqpugov2fnAy1tW4qkcYeW/ZZ7qI4XQ49TrGtiFKm+MoRjGaAuVOpronItb
	qMbX/Cw==
X-Gm-Gg: AYBFou0kR5LrPPN3Ib7YlQ5PbYN+ojDou6fiy8//49zy1gFfv1Gcq8FVpTKm73EjTMy
	sApcX7nElFikIwtmbrWoXPMuJqwai/Q+HwK9s9OsWgiVsAlNhNP8VG+oyFhNTXBAgIPxxeECLR+
	SHlaPeoL0LNQJrm+6NkpIAS7sOPW7PR/eP52hEIYPm3iZHdUS1TwI92zEyBVqPaaBoNPtgitGHJ
	5QySfeTuZcJeut+mtHi97+AdozEnbe6PgN02HqpRjSELueI5F5mme2gXVS7wU3jqSt/C+PvW3Os
	czTzpVp5Pog00qwbXUEhFV7txh4AHiwHdM/bjvJgtUiLeHjzYXIaTcLNvZs7gXwfyALNNxPqfJC
	I71CKvZ34YkBwKtqrHsfa5ELnr0TA+qRmQGs3+5tvjOE7wvEXPVtObKB9WmeJqcSbhTG5/tO1Uf
	PnOjU0C3vAicweWUATSyMARashETfcE7sDiIGBxOGIdhL062pZ2EbM/LHYmR34+jMl96sxj6AGk
	xEHbRPDwC/dYwdO4kDiOlEX5jRJuIpWWvxpWQ==
X-Received: by 2002:a05:6512:3ca0:b0:5b6:423:9fa7 with SMTP id 2adb3069b0e04-5b8c1845600mr3924285e87.31.1790029154286;
        Mon, 21 Sep 2026 15:19:14 -0700 (PDT)
Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com. [74.125.230.99])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46acdadsm13085e87.4.2026.09.21.15.19.11
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 15:19:13 -0700 (PDT)
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso27544511fa.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Sep 2026 15:19:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxuXeRXNwFXK1GeQFWLEdWHqM53Vbvg+JF7ueEiUooWXnpFojzLI77sKPMSWTajnt7Q5FdWYhd64SekmWIOpQKqjQ==@vger.kernel.org
X-Received: by 2002:a05:6512:b98:b0:5b6:19c9:d7b7 with SMTP id
 2adb3069b0e04-5b8c1814255mr4028488e87.26.1790029150490; Mon, 21 Sep 2026
 15:19:10 -0700 (PDT)
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
 <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com> <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com>
In-Reply-To: <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Sep 2026 15:18:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
X-Gm-Features: AcwNN1V6kQ7of-lsLriR5A35-myaUs8Q-G0l-UpMuitcBGX2Lt6tWNIn6ScdgE0
Message-ID: <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
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

On Sun, Sep 20, 2026 at 3:46=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> > The numbers here for interrupt latency are made up for my example and
> > I haven't personally measured them, but I think it's not completely
> > absurd to say that interrupt latency (on both the Linux and remote
> > sides) dominates the communication path.
> >
> Yes, the numbers do look biased. It takes 50us for remote to get the
> irq and act upon it before ACKing but it takes 100us for that ACK to
> get back.
> And the benefit will be hard to achieve - it involves three unrelated
> clk_prepare() requests done within 50us often enough. When the stars
> align you save 300us on a clk_prepare()
>
> It feels you are trying to optimize a non-issue. clk_prepare() is
> expected to be slow and anyways shouldn't be frequent enough from all
> devices to give noticeable benefit.

Fair enough. I've jumped into a pre-existing design. Let me see if I
can find old information or gather evidence myself. Then with real
data we can figure out what makes sense. OK, gathered some data...

FWIW, to explain things clearly, I have been simplifying by saying
that just clock prepare/unprepare goes over this channel. In reality,
there is much more traffic. On Pixel 10, the mailbox using queue mode
like this connects to the "CPM" (central power manager). Looking at
the device tree, we see the following things using this mailbox:
* One of the main clock controllers in the system.
* Most of the power domains in the system
* Devfreq controllers
* Thermal controllers
* A GPIO controller
* A reset controller
* An interrupt controller
* A RTC
* A pile of other stuff

So basically a whole crap-ton of resources are managed over this
mailbox. The team designing this Phone apparently decided that the
mailbox is one of the primary communication pipelines in the system.
Yes, everything that communicates over the mailbox needs to be able to
sleep, but that doesn't mean we shouldn't keep it fast if possible.

On an off-the-shelf Pixel 10, one can spy on the CPM mailbox like this:

echo 1 > /sys/kernel/tracing/events/goog_mba_ctrl/enable
echo 1 > /sys/kernel/tracing/tracing_on
echo "" > /sys/kernel/tracing/trace
cat /sys/kernel/tracing/trace_pipe | grep 'process_q_t\|send_data_q'

When I do that, messages spew by pretty much constantly showing just
how busy this mailbox is. I can see instances where the queue is
actually utilized like this:

cat /sys/kernel/tracing/trace_pipe | \
  grep 'process_q_t\|send_data_q' | \
  grep -C10 'eqs_completed=3D[^1]\|anding_msg=3D[^0]'

If I do that, it's quite easy to see the queue being used. If I use
the device actively, I get several hits per second. A few examples
traces (using sed to shorten them slightly):

6946.884142: send_q: {0xa0016969,0xf,0x2,0x0} tx_q_wr_ptr=3D4
6946.884496: send_q: {0xa0026969,0x7,0x1,0x0} tx_q_wr_ptr=3D5
6946.884851: q_txdone: tx_q_rd_ptr=3D4 reqs_completed=3D2 outstanding_msgs=
=3D0
6946.884880: q_txdone: tx_q_rd_ptr=3D5 reqs_completed=3D1 outstanding_msgs=
=3D0

Here you can see that it took 709 us to get the response to the first
message. ...but, luckily we didn't have to wait for that 709 us before
sending the second message. That means we still got both responses at
once. Note that things aren't always so slow. The next messages
through this mailbox only took 42 us.

6946.885000: send_q: {0xa0036969,0x7,0x1,0x0} tx_q_wr_ptr=3D6
6946.885042: q_txdone: tx_q_rd_ptr=3D6 reqs_completed=3D1 outstanding_msgs=
=3D0

Here's a pretty big usage of the queue. I assume the CPM was busy at the ti=
me:

7751.863328: send_q: {0xa0050708,0x1020001,0x0,0x0} tx_q_wr_ptr=3D7
7751.863619: send_q: {0xa0060708,0x1030001,0x0,0x0} tx_q_wr_ptr=3D0
7751.863850: send_q: {0xa0070708,0x1000001,0x0,0x0} tx_q_wr_ptr=3D1
7751.864123: send_q: {0xa0080708,0x1010001,0x0,0x0} tx_q_wr_ptr=3D2
7751.864329: q_txdone: tx_q_rd_ptr=3D7 reqs_completed=3D4 outstanding_msgs=
=3D0
7751.864338: q_txdone: tx_q_rd_ptr=3D0 reqs_completed=3D3 outstanding_msgs=
=3D0
7751.864347: q_txdone: tx_q_rd_ptr=3D1 reqs_completed=3D2 outstanding_msgs=
=3D0
7751.864378: q_txdone: tx_q_rd_ptr=3D2 reqs_completed=3D1 outstanding_msgs=
=3D0

A full millisecond before the first response, but luckily we got them
all at once.

...and this one is pretty interesting here:

7782.321344: send_q: {0xa0040708,0x30001,0x0,0x0} tx_q_wr_ptr=3D4
7782.321481: send_q: {0xa0150708,0x10001,0x0,0x0} tx_q_wr_ptr=3D5
7782.321769: send_q: {0xa0060708,0x1,0x0,0x0} tx_q_wr_ptr=3D6
7782.321799: q_txdone: tx_q_rd_ptr=3D4 reqs_completed=3D2 outstanding_msgs=
=3D1
7782.321813: q_txdone: tx_q_rd_ptr=3D5 reqs_completed=3D1 outstanding_msgs=
=3D1
7782.321842: q_txdone: tx_q_rd_ptr=3D6 reqs_completed=3D1 outstanding_msgs=
=3D0

This one is interesting because we can see that the remote side first
ACKed two of the three outstanding messages. Then a short time later
it managed to ACK the last message.

...and just to show the queue being used quite often, here are two
instances right in a row (it's not hard to see this happening):

8521.693559: send_q: {0xa0010708,0x1030001,0x0,0x0} tx_q_wr_ptr=3D5
8521.693649: send_q: {0xa0120708,0x10001,0x0,0x0} tx_q_wr_ptr=3D6
8521.693690: q_txdone: tx_q_rd_ptr=3D5 reqs_completed=3D2 outstanding_msgs=
=3D0
8521.693701: q_txdone: tx_q_rd_ptr=3D6 reqs_completed=3D1 outstanding_msgs=
=3D0
8521.693920: send_q: {0xa0030708,0x1,0x0,0x0} tx_q_wr_ptr=3D7
8521.693956: q_txdone: tx_q_rd_ptr=3D7 reqs_completed=3D1 outstanding_msgs=
=3D0
8521.694171: send_q: {0xa0040705,0x2,0x14,0x1} tx_q_wr_ptr=3D0
8521.694194: send_q: {0xa0150708,0x1000001,0x0,0x0} tx_q_wr_ptr=3D1
8521.694214: q_txdone: tx_q_rd_ptr=3D0 reqs_completed=3D2 outstanding_msgs=
=3D0
8521.694226: q_txdone: tx_q_rd_ptr=3D1 reqs_completed=3D1 outstanding_msgs=
=3D0

...and in case you want to see an even bigger use of the queue, here
are 6 queued up at once:

9223.248560: send_q: {0xa0060403,0x3050600,0x0,0x0} tx_q_wr_ptr=3D7
9223.248598: q_txdone: tx_q_rd_ptr=3D7 reqs_completed=3D1 outstanding_msgs=
=3D0
9223.248824: send_q: {0xa007000b,0x1,0x418,0x7} tx_q_wr_ptr=3D0
9223.248960: send_q: {0xa008000b,0x1,0x18,0x7} tx_q_wr_ptr=3D1
9223.249289: send_q: {0xa0090008,0xa1800,0x0,0x0} tx_q_wr_ptr=3D2
9223.249489: send_q: {0xa00a0008,0x1803,0x0,0x0} tx_q_wr_ptr=3D3
9223.249612: send_q: {0xa00b0008,0xa1900,0x0,0x0} tx_q_wr_ptr=3D4
9223.250046: send_q: {0xa01c0403,0x3050600,0xffffffff,0x0} tx_q_wr_ptr=3D5
9223.250232: q_txdone: tx_q_rd_ptr=3D0 reqs_completed=3D6 outstanding_msgs=
=3D0
9223.250236: q_txdone: tx_q_rd_ptr=3D1 reqs_completed=3D5 outstanding_msgs=
=3D0
9223.250237: q_txdone: tx_q_rd_ptr=3D2 reqs_completed=3D4 outstanding_msgs=
=3D0
9223.250239: q_txdone: tx_q_rd_ptr=3D3 reqs_completed=3D3 outstanding_msgs=
=3D0
9223.250240: q_txdone: tx_q_rd_ptr=3D4 reqs_completed=3D2 outstanding_msgs=
=3D0
9223.250241: q_txdone: tx_q_rd_ptr=3D5 reqs_completed=3D1 outstanding_msgs=
=3D0
9223.250406: send_q: {0xa00d0008,0x1903,0x0,0x0} tx_q_wr_ptr=3D6
9223.250437: q_txdone: tx_q_rd_ptr=3D6 reqs_completed=3D1 outstanding_msgs=
=3D0


This looks pretty clearly worth it. Have I convinced you? Is there
other data you'd like to see?


> If you do have some real numbers and think it is worth it on your
> platform, then maybe expose each doorbell/shm-slot as a generic
> channel. clk_mailbox will request a generic channel, do the request
> and free it. The same effect but without inventing a new api. I can
> share a draft if you want, but I suggest let's not make things
> complicated without proven benefit.

FWIW, the downstream code in Pixel does what I think you're
suggesting. I can confidently say that, while it doesn't require
changes to the mailbox core, it is much more convoluted and
complicated. It also bleeds into the device-tree representation, which
doesn't feel great.

Just to be concrete, I'll document how the downstream driver works. If
this isn't what you were thinking, please correct me.

Back to our simplified "clk_mailbox" driver. We'll say that our
"clk_mailbox" driver talks over a single mailbox to the remote
processor. Let's say each message is 4 words big. The message space is
32-words big. 32 / 4 =3D 8 which means this space is divided into 8
queue slots. Downstream represents each of these queue slots as a
generic channel. That means that, in the device tree, our
"clk_mailbox" driver looks looks like this:

mboxes =3D <&cpm_tx_mba 0>,
         <&cpm_tx_mba 1>,
         <&cpm_tx_mba 2>,
         <&cpm_tx_mba 3>,
         <&cpm_tx_mba 4>,
         <&cpm_tx_mba 5>,
         <&cpm_tx_mba 6>,
         <&cpm_tx_mba 7>;

Then the "clk_mailbox" driver is in charge of rotating through each of
the channels. First it writes to channel 0, then it writes to channel
1, etc. This works with no changes to the core, but...

1. IMO, it's ugly. Logically, this is one communication channel
between the processor running Linux and the remote processor. We
shouldn't represent it as 8 channels. It feels especially bad to leak
this into the device tree.

2. The "clk_mailbox" driver needs to re-implement queuing and can't
use the mailbox core's queue. This is because the remote side
absolutely requires strict adherance to the "rotation" protocol in
order for it to receive messages. It expects a message in slot 0, then
slot 1, then slot 2, etc. If we used the mailbox core's queue, this
would break the protocol.

3. It may involve code duplication in the future. Currently, the only
driver using "queue mode" is the "CPM", but other drivers could
conceivably use it since many of the "LGA MBA" blocks support queue
mode in hardware.


I'm also a little confused about the resistance. I don't feel like the
mailbox core change is that complicated. The diffstat shows 58
insertions and 17 deletions. 14 of those added lines are comments.
While we certainly don't want to add useless APIs, to me this truly
seems like the correct way to add the functionality. It also doesn't
seem absurd to me that some future mailbox controller out there will
also support queuing like this.

-Doug
