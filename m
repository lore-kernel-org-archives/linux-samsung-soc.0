Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF801DC198
	for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Sep 2026 00:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035878; cv=pass; b=bpG5pjMnrNRmIlIKXjDx+XRrOSRowmuwYPyKJwRSzqjSonPCsLBsq2SQjF2lbZZgroq3QDSpi+fS9zlMrgauBaa2b/JaEBMknkJbrHHd1kfrBUA5rHUNQ42L88wdeOhy/UxVTldpsmGP+1hYeIM1p6NpaEp6TmAjB0g8IVvFuSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035878; c=relaxed/simple;
	bh=XZqMyxfXpM4dz5WuAmo7FZ20cXf3ltrI23u9X7txm/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Va+WyIAQhxYOScs2bjumA1V+W/LT9rxiQycxi3n7hx0hPmh+EmDIyCxViEdQ5SJw4jaydYOs9v1dd6RdyN8nDqtL6J/SgkZFX+cE4ek1ebVA2TM/egwEB/Xsoj/Q6El+B5RSPqLx/phxFxd4Bzvrm+iERoZXuJOffg8W+OqO6+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQSZImOS; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQSZImOS"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c206dc8adcso1335421b6e.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Sep 2026 17:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790035875; cv=none;
        d=google.com; s=arc-20260327;
        b=svD1/KrttgyzrLQ7dw1feHsZ5CseoGQmrF0/Jx5KGPH3JdalNx8/USKYHk+CliNYcx
         8/wuOcaNVd18JrESkVAwudC6SLZzutsiXRDpKTh8XDYZPXKd2nICuSiKIstTM9dewNc8
         3uDFn5pQW8qNeSCaz4jfLBLrkqcoTdo85f6PtQpIK2FMfbbIUuU1cv11R2TjflUe4Szu
         L/Aix+AL4+2/ugmuAWxyO2ZvLQn37A07ZOxpLNgyCPqigZdoLDnIBvKWbywba5hziQU6
         ZtTy4OgIc5DYJB1qbFQM+7TaWmAMYngBIGPhTKPBgo3Wlnvl+/vr/5AwEigEtbr5Ulkg
         3Yag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Gr7FFBApV4XH6jYqrgqIyc8MK/Sktc4ULtEkmcVSaY=;
        fh=TveGQx4w1SO0ZhbhL2DXF240ucOKhryVihfSoq5vjnE=;
        b=ToFgU0bFEcT0u02lPHmPHUfh155WOuOdxLO4zDFCqEm/bz+NqWte1KRqI982liAOSI
         sAD7/i4iOgllmNWPTgyBVzGSNYsDf1xGgkPVNHfLYgs7YIxohGHa6EDTqEZuSQD3dKd+
         xZzqCiljGM3fGDK7IETYzH4yQR5iIgMZN+6JV/6zUdoFj1GPKczlFCKreZmbeDlUidu0
         THgC3/gEFYiXZM/QtY6W3yiWHR4PQIQ56YN4H4yr6eiFKuMP2ib+pCyZxQfA3ATEY+h/
         s7X+a15HxEHyy8aDKnC+HETYKj6Gzn/XMPJTMyFN1CCETSfPxjbwcmosK17InQ6hobFJ
         cLzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035875; x=1790640675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Gr7FFBApV4XH6jYqrgqIyc8MK/Sktc4ULtEkmcVSaY=;
        b=UQSZImOS3jkMnK8JEScbkSjYTKQJCwtGbwlGTYFDVfzjAJhN+w371IWCEqW0x8LaDi
         jrN7H81uQpOUFgxJU+1F/yZsgX5ug/xJuWhae0yeBq/n3RW+mHa5MxpnQre0lY1GXya7
         n7eqoa9YoocWE1W6QtoCYmmvnu1Jaxqe07TroD+5bXXa4gxQg7ZfVOmMNgt2GvyMYkAn
         42Fak1iiYuq9DAFaYctlCX6lhhbDU0nbH0c3v2dV7xZTCEbNQWb3Avd6rgku5gKF7Ntp
         TPaaQ2/QYWq4LrbNvlcyOUAq7RBOxLoxpJPpB5uYCVqmepkCfsKObxNjhKh7VMG+haG+
         vG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035875; x=1790640675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Gr7FFBApV4XH6jYqrgqIyc8MK/Sktc4ULtEkmcVSaY=;
        b=LrRKaOK4d6qSDBH7+7GgXx4x9SgrpDRMkoRjtPFee3C9EZ8SWe6uhRgBwU8DLk9Jnk
         mOVtU2dbZxTbTCNKzvgrJDklSJj9VCDoD/M34YkLg7+U96G5CDaLG2Jw92QoAWZps17a
         G1fSLppCH//JWeJ2E0jUDPP4toEvUjg6qxfnuCrYW4geizwvsYDj1y2C64QP/SU/ie/6
         XY8sC3sAaTaqms/8y1KrNuCxPdWvKX9cfWi6sUUX0zySTcOU0N/MPrG4BBaj5FJlFxAb
         P8ZjihDDC5/WqW+ENUvOVbB5c6OGpUhwWNPn2HZDdfaIHs1QdIG+AcUGcyNmxJ7jG3fv
         gTQg==
X-Forwarded-Encrypted: i=1; AKwUvBxFPpl/tt+h5XHMtWjyPcrxh7aAMlH7iVwnZrCne0DGsz+IVzRfHzg2czI2dhJEdL/GYx29FLuo6A5mI1qD5//U8g==@vger.kernel.org
X-Gm-Message-State: AFuF++lGH0iz1IHbuVBMrcxbVHAW1wJaczYsdQrYNgQjVnT7zUX1C9mQ
	u1Ek9pbkwTvRv+OTWrOdaNS7XR+az8JYmc14e/3nsVLjiTmE2fEQI3TC/26DC9Gxs/mIxqxWsgL
	uZIQQkcJyF5V50lUiFNyQPjOj6tOOg+wLRoBK
X-Gm-Gg: AYBFou2AVzTIL3PkflAMCeyE4/RcfkKC9WOlQGs+iLF7ooL6i3TkKtzJVdseJ+wnfSA
	sbEwgQeEhy02qo8FevpfDk9gU3YUPW5HCZQju5eMvo0DlVbJ0WlkYFkPFILEj4fFhnSxxE9Sag7
	Ja6VNiyJnA/Bay/Vj9aTSt0EgkMmm/aK5o2GVoumnI20HA2OpnwGZ8P1laTTpBdYwJ42E4CGOU4
	oxzx5Lc3ehX/1H9wO+FCURqgs8Vk99ZTeia+6XYJOoetu6UyarBQ64/bPYKi8XTaiJonpjz+4uJ
	+verKi3U6dMn7ueQBF/iUeROBvidU/Y1xdYXeDN/B6xiu5HPKlRTlvGrMBZfSpzb0cI=
X-Received: by 2002:a05:6820:4b90:b0:6b1:d09d:6d73 with SMTP id
 006d021491bc7-6ca9a13380dmr11540114eaf.8.1790035875157; Mon, 21 Sep 2026
 17:11:15 -0700 (PDT)
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
 <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com> <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
In-Reply-To: <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 21 Sep 2026 19:11:02 -0500
X-Gm-Features: AcwNN1XZ5MoTljZYH3yCjsHWlUM_5F4f5Rqvk0Vh6rm-kZrbrStI4re6dazWG9c
Message-ID: <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
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

On Mon, Sep 21, 2026 at 5:19=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sun, Sep 20, 2026 at 3:46=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.=
com> wrote:
> >
> > > The numbers here for interrupt latency are made up for my example and
> > > I haven't personally measured them, but I think it's not completely
> > > absurd to say that interrupt latency (on both the Linux and remote
> > > sides) dominates the communication path.
> > >
> > Yes, the numbers do look biased. It takes 50us for remote to get the
> > irq and act upon it before ACKing but it takes 100us for that ACK to
> > get back.
> > And the benefit will be hard to achieve - it involves three unrelated
> > clk_prepare() requests done within 50us often enough. When the stars
> > align you save 300us on a clk_prepare()
> >
> > It feels you are trying to optimize a non-issue. clk_prepare() is
> > expected to be slow and anyways shouldn't be frequent enough from all
> > devices to give noticeable benefit.
>
> Fair enough. I've jumped into a pre-existing design. Let me see if I
> can find old information or gather evidence myself. Then with real
> data we can figure out what makes sense. OK, gathered some data...
>
> FWIW, to explain things clearly, I have been simplifying by saying
> that just clock prepare/unprepare goes over this channel. In reality,
> there is much more traffic. On Pixel 10, the mailbox using queue mode
> like this connects to the "CPM" (central power manager). Looking at
> the device tree, we see the following things using this mailbox:
> * One of the main clock controllers in the system.
> * Most of the power domains in the system
> * Devfreq controllers
> * Thermal controllers
> * A GPIO controller
> * A reset controller
> * An interrupt controller
> * A RTC
> * A pile of other stuff
>
> So basically a whole crap-ton of resources are managed over this
> mailbox. The team designing this Phone apparently decided that the
> mailbox is one of the primary communication pipelines in the system.
> Yes, everything that communicates over the mailbox needs to be able to
> sleep, but that doesn't mean we shouldn't keep it fast if possible.
>
> On an off-the-shelf Pixel 10, one can spy on the CPM mailbox like this:
>
> echo 1 > /sys/kernel/tracing/events/goog_mba_ctrl/enable
> echo 1 > /sys/kernel/tracing/tracing_on
> echo "" > /sys/kernel/tracing/trace
> cat /sys/kernel/tracing/trace_pipe | grep 'process_q_t\|send_data_q'
>
> When I do that, messages spew by pretty much constantly showing just
> how busy this mailbox is. I can see instances where the queue is
> actually utilized like this:
>
> cat /sys/kernel/tracing/trace_pipe | \
>   grep 'process_q_t\|send_data_q' | \
>   grep -C10 'eqs_completed=3D[^1]\|anding_msg=3D[^0]'
>
> If I do that, it's quite easy to see the queue being used. If I use
> the device actively, I get several hits per second. A few examples
> traces (using sed to shorten them slightly):
>
> 6946.884142: send_q: {0xa0016969,0xf,0x2,0x0} tx_q_wr_ptr=3D4
> 6946.884496: send_q: {0xa0026969,0x7,0x1,0x0} tx_q_wr_ptr=3D5
> 6946.884851: q_txdone: tx_q_rd_ptr=3D4 reqs_completed=3D2 outstanding_msg=
s=3D0
> 6946.884880: q_txdone: tx_q_rd_ptr=3D5 reqs_completed=3D1 outstanding_msg=
s=3D0
>
> Here you can see that it took 709 us to get the response to the first
> message. ...but, luckily we didn't have to wait for that 709 us before
> sending the second message. That means we still got both responses at
> once. Note that things aren't always so slow. The next messages
> through this mailbox only took 42 us.
>
> 6946.885000: send_q: {0xa0036969,0x7,0x1,0x0} tx_q_wr_ptr=3D6
> 6946.885042: q_txdone: tx_q_rd_ptr=3D6 reqs_completed=3D1 outstanding_msg=
s=3D0
>
> Here's a pretty big usage of the queue. I assume the CPM was busy at the =
time:
>
> 7751.863328: send_q: {0xa0050708,0x1020001,0x0,0x0} tx_q_wr_ptr=3D7
> 7751.863619: send_q: {0xa0060708,0x1030001,0x0,0x0} tx_q_wr_ptr=3D0
> 7751.863850: send_q: {0xa0070708,0x1000001,0x0,0x0} tx_q_wr_ptr=3D1
> 7751.864123: send_q: {0xa0080708,0x1010001,0x0,0x0} tx_q_wr_ptr=3D2
> 7751.864329: q_txdone: tx_q_rd_ptr=3D7 reqs_completed=3D4 outstanding_msg=
s=3D0
> 7751.864338: q_txdone: tx_q_rd_ptr=3D0 reqs_completed=3D3 outstanding_msg=
s=3D0
> 7751.864347: q_txdone: tx_q_rd_ptr=3D1 reqs_completed=3D2 outstanding_msg=
s=3D0
> 7751.864378: q_txdone: tx_q_rd_ptr=3D2 reqs_completed=3D1 outstanding_msg=
s=3D0
>
> A full millisecond before the first response, but luckily we got them
> all at once.
>
> ...and this one is pretty interesting here:
>
> 7782.321344: send_q: {0xa0040708,0x30001,0x0,0x0} tx_q_wr_ptr=3D4
> 7782.321481: send_q: {0xa0150708,0x10001,0x0,0x0} tx_q_wr_ptr=3D5
> 7782.321769: send_q: {0xa0060708,0x1,0x0,0x0} tx_q_wr_ptr=3D6
> 7782.321799: q_txdone: tx_q_rd_ptr=3D4 reqs_completed=3D2 outstanding_msg=
s=3D1
> 7782.321813: q_txdone: tx_q_rd_ptr=3D5 reqs_completed=3D1 outstanding_msg=
s=3D1
> 7782.321842: q_txdone: tx_q_rd_ptr=3D6 reqs_completed=3D1 outstanding_msg=
s=3D0
>
> This one is interesting because we can see that the remote side first
> ACKed two of the three outstanding messages. Then a short time later
> it managed to ACK the last message.
>
> ...and just to show the queue being used quite often, here are two
> instances right in a row (it's not hard to see this happening):
>
> 8521.693559: send_q: {0xa0010708,0x1030001,0x0,0x0} tx_q_wr_ptr=3D5
> 8521.693649: send_q: {0xa0120708,0x10001,0x0,0x0} tx_q_wr_ptr=3D6
> 8521.693690: q_txdone: tx_q_rd_ptr=3D5 reqs_completed=3D2 outstanding_msg=
s=3D0
> 8521.693701: q_txdone: tx_q_rd_ptr=3D6 reqs_completed=3D1 outstanding_msg=
s=3D0
> 8521.693920: send_q: {0xa0030708,0x1,0x0,0x0} tx_q_wr_ptr=3D7
> 8521.693956: q_txdone: tx_q_rd_ptr=3D7 reqs_completed=3D1 outstanding_msg=
s=3D0
> 8521.694171: send_q: {0xa0040705,0x2,0x14,0x1} tx_q_wr_ptr=3D0
> 8521.694194: send_q: {0xa0150708,0x1000001,0x0,0x0} tx_q_wr_ptr=3D1
> 8521.694214: q_txdone: tx_q_rd_ptr=3D0 reqs_completed=3D2 outstanding_msg=
s=3D0
> 8521.694226: q_txdone: tx_q_rd_ptr=3D1 reqs_completed=3D1 outstanding_msg=
s=3D0
>
> ...and in case you want to see an even bigger use of the queue, here
> are 6 queued up at once:
>
> 9223.248560: send_q: {0xa0060403,0x3050600,0x0,0x0} tx_q_wr_ptr=3D7
> 9223.248598: q_txdone: tx_q_rd_ptr=3D7 reqs_completed=3D1 outstanding_msg=
s=3D0
> 9223.248824: send_q: {0xa007000b,0x1,0x418,0x7} tx_q_wr_ptr=3D0
> 9223.248960: send_q: {0xa008000b,0x1,0x18,0x7} tx_q_wr_ptr=3D1
> 9223.249289: send_q: {0xa0090008,0xa1800,0x0,0x0} tx_q_wr_ptr=3D2
> 9223.249489: send_q: {0xa00a0008,0x1803,0x0,0x0} tx_q_wr_ptr=3D3
> 9223.249612: send_q: {0xa00b0008,0xa1900,0x0,0x0} tx_q_wr_ptr=3D4
> 9223.250046: send_q: {0xa01c0403,0x3050600,0xffffffff,0x0} tx_q_wr_ptr=3D=
5
> 9223.250232: q_txdone: tx_q_rd_ptr=3D0 reqs_completed=3D6 outstanding_msg=
s=3D0
> 9223.250236: q_txdone: tx_q_rd_ptr=3D1 reqs_completed=3D5 outstanding_msg=
s=3D0
> 9223.250237: q_txdone: tx_q_rd_ptr=3D2 reqs_completed=3D4 outstanding_msg=
s=3D0
> 9223.250239: q_txdone: tx_q_rd_ptr=3D3 reqs_completed=3D3 outstanding_msg=
s=3D0
> 9223.250240: q_txdone: tx_q_rd_ptr=3D4 reqs_completed=3D2 outstanding_msg=
s=3D0
> 9223.250241: q_txdone: tx_q_rd_ptr=3D5 reqs_completed=3D1 outstanding_msg=
s=3D0
> 9223.250406: send_q: {0xa00d0008,0x1903,0x0,0x0} tx_q_wr_ptr=3D6
> 9223.250437: q_txdone: tx_q_rd_ptr=3D6 reqs_completed=3D1 outstanding_msg=
s=3D0
>
>
> This looks pretty clearly worth it. Have I convinced you? Is there
> other data you'd like to see?
>
OK, let's work with the assumption that it is really needed.  Though I
would still explore the option of lazy/debounced disabling of clocks
and other resources controlled by the remote host.

>
> > If you do have some real numbers and think it is worth it on your
> > platform, then maybe expose each doorbell/shm-slot as a generic
> > channel. clk_mailbox will request a generic channel, do the request
> > and free it. The same effect but without inventing a new api. I can
> > share a draft if you want, but I suggest let's not make things
> > complicated without proven benefit.
>
> FWIW, the downstream code in Pixel does what I think you're
> suggesting. I can confidently say that, while it doesn't require
> changes to the mailbox core, it is much more convoluted and
> complicated. It also bleeds into the device-tree representation, which
> doesn't feel great.
>
> Just to be concrete, I'll document how the downstream driver works. If
> this isn't what you were thinking, please correct me.
>
> Back to our simplified "clk_mailbox" driver. We'll say that our
> "clk_mailbox" driver talks over a single mailbox to the remote
> processor. Let's say each message is 4 words big. The message space is
> 32-words big. 32 / 4 =3D 8 which means this space is divided into 8
> queue slots. Downstream represents each of these queue slots as a
> generic channel. That means that, in the device tree, our
> "clk_mailbox" driver looks looks like this:
>
> mboxes =3D <&cpm_tx_mba 0>,
>          <&cpm_tx_mba 1>,
>          <&cpm_tx_mba 2>,
>          <&cpm_tx_mba 3>,
>          <&cpm_tx_mba 4>,
>          <&cpm_tx_mba 5>,
>          <&cpm_tx_mba 6>,
>          <&cpm_tx_mba 7>;
>
> Then the "clk_mailbox" driver is in charge of rotating through each of
> the channels. First it writes to channel 0, then it writes to channel
> 1, etc. This works with no changes to the core, but...
>
I was thinking something like   mboxes =3D <&cpm_tx_mba>
clk_mailbox simply asks for some channel, gets allocated the next free
slot. The mailbox controller driver keeps track of the channel-slot
map locally and is responsible for managing contiguous slots and
completing the tx upon receiving ack.

> I'm also a little confused about the resistance. I don't feel like the
> mailbox core change is that complicated. The diffstat shows 58
> insertions and 17 deletions. 14 of those added lines are comments.
> While we certainly don't want to add useless APIs, to me this truly
> seems like the correct way to add the functionality. It also doesn't
> seem absurd to me that some future mailbox controller out there will
> also support queuing like this.
>
It is not the diff stat but about inserting a flag in the api to
introduce special case behavior. It is like adding one person to the
party introduces N-1 handshakes - the has_queue flag doesn't play well
with other configurations and may allow future platforms to abuse
has_queue to implement hacks.

Regards
Jassi
