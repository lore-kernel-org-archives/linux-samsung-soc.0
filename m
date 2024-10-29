Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ED2192D87;
	Tue, 29 Oct 2024 15:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730217586; cv=none; b=bd1qTbJUYje2jRiEo+Py9+7P+76S3VFhmN0p1j25fwniiIz7GGYq50JscmtFzp+Wrt4uBUiUgRpC8a5FlHYMRDyV9genwgMp6KIYJCErVyyZL3pGWPllHfBtUTAsncI/9se8LVVtyK3omMZmAaKQHrf/ipHTg8yr6zehGzoRdbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730217586; c=relaxed/simple;
	bh=6fPqxfjDC4n+W8UuAUe/t5Vo3TBcVmQchvQHgB1qvsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlFISBZB+GW62jx7yrswgdekINGsXSTzveZCDJxxXmX0mPTsJ6kbdM2ML/T01lyXpf/zRKyT0IkM5KTL3oeixMaDI8we3/5aKBePOZ97R8SURiUm22fMegjY4SejVOXSl3L9rbfrz9ZtMUMjRumPOpNeKRJXUd0+13mtldGyUFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekbUWSM8; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekbUWSM8"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7180d9d0dcbso2535813a34.3;
        Tue, 29 Oct 2024 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730217583; x=1730822383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rU23DnpS7egSAjyGmotSTJgLzYO4Gk0aHvc/vBUkXk=;
        b=ekbUWSM8VlzXmF7ai+y9WaGdAZCNURei3poNs/X7HyswsH9RjGxp5CEjkLrQ7NR/Oh
         sTw2PGyDHvvLgJrUL9eaKAW7R7VdoUWJrFEeuje8S49WZCdfJzdoblNnVTsQQuG3u6PY
         Ukrs/gsAod331bSEFQdrAq5Xfn4CWG9MPO0e6PA44BxRhxsdT0PHh1Ag0/vjjcItZujo
         c/kxSbW+AUQFAZjiBSMr/aZ59iPjZ4WOqZYfQkLfemg+zqgmT2WCpl8HzpndXwF9AaJC
         MbjZQuq3gx9X0ZAKW8CGklfdvbOF2AJxt9ktmhNMSGNF0MjOOXpbjT/sNAmpZxs2r0br
         sg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730217583; x=1730822383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rU23DnpS7egSAjyGmotSTJgLzYO4Gk0aHvc/vBUkXk=;
        b=Mp2dUuKqF2DnxNnsTDwITwh/lsUI9uyXcAgRVPxMrh7KcR6BL4vU3Xqws8s7OmqS1b
         8YVoQSW4SQu2SWqJ20MFlaqtDhOoeSKuU99pkliApSkD5GEvGEIVsikCcNKix7vxb7hQ
         ujarA7+ypOtmYCZhzJY+RAzIJpxpDoBywg8g4K1KPwMcxE0o2sPpJZEq9+BODTiXEArA
         ipLfJEZcpNASinDj5v+hOh9FhZorX/g7nF0iFxzsn5ZcuhurjBi8RDSvRWzkqf/2s8Yw
         kXWc70rth807olXvVwbD1kgxs9BVh7jvBLTd5x9H6QTj/4xdY6A0IRjbaHr8WVIgoiuc
         wneA==
X-Forwarded-Encrypted: i=1; AJvYcCWkc52sUGBJaYbMMXeBn1cKjGHXT480R0GgnUChP0ImVWVytJ6AqAzddIb1N2pRkIa5H/z5r7oyhj24iOqK6OtK9rc=@vger.kernel.org, AJvYcCXAYNvZ0Pp4iqa2qf2rbia2p9eoXCskv0BncWIfXBh+qvPOkscHhP6+KA64tGzGJc7kQzxYyLJB1o6P3sg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyps3XvEcKfd/hZouALuCAlylBBwhxMuLaGPcZYblvI2zIR48gF
	Tz4+Uz49DY9PA4/SEZwsAfEaba5tHrlaBXjj4A5d0RwhzXStt+PT+Jlet5pyyPpTUE0IpHiAI5I
	aOHoMCwxMkPUw1DEhUVB0CTqD1J4=
X-Google-Smtp-Source: AGHT+IGrFikjWleemKqitIlf+M4yGGhL6cvYtCx7nBR0Dx05kZCRYNyMQCXsbwX2qBk2pQ45VX137daajj0x5aYk36w=
X-Received: by 2002:a05:6830:412a:b0:70c:9c66:af53 with SMTP id
 46e09a7af769-718682c9593mr12658822a34.25.1730217582632; Tue, 29 Oct 2024
 08:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-2-tudor.ambarus@linaro.org> <CABb+yY0_NSLAs-mP=vHeNsfKRcS2hcFWmWfcvsr=nFcXQOi5uA@mail.gmail.com>
 <a7274a6e-1da3-47f2-8725-b0c534bf6608@linaro.org> <1df84f83-40d7-4719-a9f9-dfa10d25c667@linaro.org>
 <CABb+yY0H4cATB9Gz2EitnR6R179aKDzR1N87fz7Hq9Hm-_8Rmw@mail.gmail.com>
 <779fc372-a4d9-4425-a580-2173a0f6a945@linaro.org> <CABb+yY0bhjRYLwyo-t6djttP2bq_irX+Rad71wDX++nQV69cAw@mail.gmail.com>
 <a2065dc8-10da-42e9-b093-b0b541ca2305@linaro.org>
In-Reply-To: <a2065dc8-10da-42e9-b093-b0b541ca2305@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 29 Oct 2024 10:59:31 -0500
Message-ID: <CABb+yY3W3Cv7a6wZhvJe80xn5sp1Y_A_nbY_=cj0U4Z1YC61vw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mailbox: add async request mechanism to empower
 controllers w/ hw queues
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, mst@redhat.com, 
	javierm@redhat.com, tzimmermann@suse.de, bartosz.golaszewski@linaro.org, 
	luzmaximilian@gmail.com, sudeep.holla@arm.com, conor.dooley@microchip.com, 
	bjorn@rivosinc.com, ulf.hansson@linaro.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	marcan@marcan.st, neal@gompa.dev, alyssa@rosenzweig.io, broonie@kernel.org, 
	andre.draszik@linaro.org, willmcvicker@google.com, peter.griffin@linaro.org, 
	kernel-team@android.com, vincent.guittot@linaro.org, 
	daniel.lezcano@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 5:45=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
>
>
> On 10/24/24 2:27 AM, Jassi Brar wrote:
> > Hi Tudor,
> >
>
> Hi, Jassi!
>
> I appreciate that you respond quickly on my emails, thanks!
>
> > On Tue, Oct 22, 2024 at 8:27=E2=80=AFAM Tudor Ambarus <tudor.ambarus@li=
naro.org> wrote:
> >>
> >> Hi, Jassi,
> >>
> >> On 10/21/24 5:32 PM, Jassi Brar wrote:
> >>>> On 10/18/24 8:49 AM, Tudor Ambarus wrote:
> >>>
> >>>> The active request is considered completed when TX completes. But it=
 seems
> >>>> that TX is not in direct relation with RX,
> >>>
> >>> TX and RX are assumed independent operations (which they are).
> >>> TX is sending a message/request to the remote successfully. 'Success'
> >>> can be indicated by any of the three methods  TXDONE_BY_{POLLING, IRQ=
,
> >>> ACK}.
> >>> You seem to assume it should always be an ACK where we receive an
> >>> acknowledgment/response packet, which is not the case.
> >>
> >> My controller driver indeed ties TX to RX and considers the request
> >> completed when the RX completes.
> >>
> > Does your controller require RX or the protocol? I suspect the latter.
>
> The response from remote always happens for the acpm protocol. Same for
> the plain (no acpm or SRAM involved) mailbox controller that I see in
> downstream.
>
> While the response from remote always happens, the RX data is optional.
> Clients can choose whether they want the data from the RX ring or not
> (see `struct exynos_acpm_rx_data`).
>
> For each message that is sent on the TX ring, it is expected that the
> remote consumes it. The remote gets the message from the TX queue,
> advances the rear index of the TX ring, processes the request, writes
> the response message (if any) on the linux RX ring and advances the
> front index of the linux RX ring.
>
> > Anyway, the former is also supported by TXDONE_BY_ACK already.
>
> If we want to focus on when TX is done and really be strict about it,
> then for my case TX can be considered done when the remote consumes it.
> I need to poll and check when the linux TX ring rear index is moved by
> the remote. Other option is to poll the IRQ status register of the
> remote to see when the request was consumed. So maybe TXDONE_BY_POLL is
> more accurate?
> TX can also be considered done after what we write to TX ring hits the
> endpoint-SRAM, thus neither of these flags needed.
>
> As a side nodeto IRQs, the acpm protocol allows channels to work either
> in polling or in IRQ mode. I expect in the future we'll need to specify
> the done method per channel and not per controller. IRQs are not used in
> the downstream, thus I didn't touch them in this proposal.
>
> >
> >>>
> >>>> Is there a specific driver that I can look at in order to understand=
 the
> >>>> case where RX is not tied to TX?
> >>>
> >>>  Many...
> >>>  * The remote end owns sensors and can asynchronously send, say
> >>> thermal, notifications to Linux.
> >>>  * On some platform the RX may be asynchronous, that is sent later
> >>> with some identifying tag of the past TX.
> >>>  * Just reverse the roles of local and remote - remote sends us a
> >>> request (RX for us) and we are supposed to send a response (TX).
> >>
> >> I was hoping for a name of a driver, but I guess I can find them out
> >> eventually.
> >>
> > Do these usecases seem impossible to you? Many users are not upstream
>
> They seem fine, I just wanted to see the implementation and decide
> whether the request approach can be applied to them or not. I think it ca=
n.
>
> > that we care
> > about as long as we are not making some corrective change.>
> >
> >>>
> >>>> Also, if you think there's a better way to enable controllers to man=
age
> >>>> their hardware queues, please say.
> >>>>
> >>> Tying RX to TX has nothing to do with hardware queues. There can be a
> >>
> >> Right, I agree.
> >>
> >>> hardware queue and the protocol can still be
> >>> "local-to-remote-broadcast".
> >>>
> >>> While I don't think we need the "Rx is in relation to some past Tx"
> >>> api, I am open to ideas to better utilize h/w queues.
> >>>
> >>> The h/w TX queue/fifo may hold, say, 8 messages while the controller
> >>> transmits them to the remote. Currently it is implemented by
> >>> .last_tx_done() returning true as long as fifo is not full.
> >>> The other option, to have more than one TX in-flight, only complicate=
s
> >>> the mailbox api without fetching any real benefits because the
> >>> protocol would still need to handle cases like Tx was successful but
> >>> the remote rejected the request or the Rx failed on the h/w fifo
> >>> (there could be rx-fifo too, right). Is where I am at right now.
> >>>
> >> No worries, I'm confident we'll reach a conclusion.
> >>
> >> It's true I implemented just my use case, but that doesn't mean that t=
he
> >> "request" approach can't be extended for current users.
> >>
> > Sorry, I am not sure we should make the api dance around your usecase.
>
> No worries, it's fine to disagree.
>
> > If your usecase is not currently handled, please let me know. We can
> > discuss that.
>
> It's not handled. I have a list of requirements I have to fulfill which
> are not covered by the mailbox core:
>
> 1/ allow multiple TX in-flight. We need to let the controller handle its
> hardware queue, otherwise the hardware queue has no sense at all.
>
As I said this one is currently handled by assuming TX-done by
depositing in the h/w queue/fifo.
You will have the same perf as with your attempt to have "multiple
in-flight" while neither of these approaches handles in-flight
failures. We can discuss this.

> 2/ allow to tie a TX to a RX. I need to know to what TX the response
> corresponds to.
> 3/ allow multiple clients to the same channel. ACPM allows this. Support
> would have come as an extra patch.
>
These are nothing new. A few other platforms too have shared channels
and that is implemented above the mailbox.

> 4/ allow polling and IRQ channels for the same mailbox controller (not
> urgent).
>
It is very easy to populate them as separate controllers.

> I guess that we agree that in order to allow multiple TX in-flight we
> need a completion struct per message/request and not per channel. But we
> disagree on the ability to tie a TX to a RX.
>
> How can I move forward with this?
>
As I already explained, to tie RX to a TX is very protocol specific
and should be done in the layer above the mailbox api.

Thanks.
