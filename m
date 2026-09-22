Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B71280CD5
	for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Sep 2026 16:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092896; cv=none; b=Yc3Ss/mkePsqmjZTzzKCzARGvZhFk7KZZby4oLkOyNtd+5r34Xt9AWBmzgUuAVwHAnXHOo2pMNYbAZmxfi4WjXcurc57GPFHH+H0hd25m5Y+42n4nFQ9K+afCOEKdFwtLLulw6gilwyKGkn85am1trMhLfHrNnFBI2Xn4KrdqXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092896; c=relaxed/simple;
	bh=oDUI9K4i6Hsvd0l2k00UtldUQ3IBCZSvk4sLz5OcGco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfymtYiNvZqua7GRW4IH95wMw6ZICWh3U6aMvyF4u1E24wcgYe5X29l75hajJWRTcwdSclY0+elJrxMxiVmkdYB3UlaU2PFTAiFrCo/ycorsZD8LB5DFQIXKMc+vtmgvfE6jfdMtyUy/eUUqC9GA9TopiwP+ZVUQ5bOtZTsEs2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YuYa0/kL; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YuYa0/kL"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so4133473e87.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Sep 2026 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790092892; x=1790697692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WNz/wDlgUriHqoN/KacvxVQ0rGGEt6RX29bmdR2Unq4=;
        b=YuYa0/kLcPYMBIgKBL5E3Z3lm6GEg4TQZCbijEofIz4yzNzK9A7Q3wcdYiX3AQcujs
         t6wyJwJwu63RiPNviQnkK8HWzUHnRViXztTAaJ8f0Le4J8iAE3NayPf9bEqYYooToE8w
         o9w1mwVZfXkDeWEBENYT8ggl0cU3v0GLm+v8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092892; x=1790697692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNz/wDlgUriHqoN/KacvxVQ0rGGEt6RX29bmdR2Unq4=;
        b=zFKjTend4Xrtk+7k5mIyhEDMCb9HntXncbmpeO6JEONpisYKmqdEWC9a4vP871FXKH
         8Ff3fG/CHfzKHhIxeL6MGBvro3BF8PLsntJz0LxVt+ekO2JuUUhz+V0y+16UC1+KzXAe
         CLj21nXom/BuW8XQSqZLgZnL9S2lQdIhuWuHXNmPLbjAbZYTrcvuXtYV6FSbvooO0xy5
         lj2QjpWjU4e71PmU6GFzpPoGUbdWOb/maxifoDGkBmR8w8jobZPUTRK8ebYVGDP6mPVo
         iCnweFe1tPa5xSrXmNLneB0JNukMInOAl/cC2lkJZbKohdXsS8fCTLQA2sIVkKgeZfnL
         QU9g==
X-Forwarded-Encrypted: i=1; AKwUvByB3F04axPbUlFGwDHpI5WKk4GC7CW+avPyx5fv+vxyadg5J5MINXyMsJXQtON9hCKZTkuUQwIlJJcyi+EcEMVulA==@vger.kernel.org
X-Gm-Message-State: AFuF++mDwxesrGPrYHDqKIwEVYFEETgy+Z0q54+d0lW9gDSiEp5HLKUl
	L6WBYvyEz8eW82a8CGw6/eyD6jk5CPmDfCq1jwaPBi9WrkA0o8AvC6DgFzzDnWXPmsI41kmhzRr
	zTrg=
X-Gm-Gg: AYBFou2VHdGNNncwFaTt7FfTe1V9IaBxK22BemmcpRi/k8f+xZyg5Lt4cBbUpxhElhb
	EBHX/0Xj4ER9Lf3WWolLLNHrjQSkK1VnJr1IAiRMhostzgvocUiqd0XbbI9WxNrwlpqos8473wK
	DBuB2J2xzR83Wx18thEI6tE5gwcH1JXawjTzXb/7WRAM4wud+Aa/pwUqqsseUQXWCEHz9gfwBDf
	Esti+nTyLrxPztTfrFrhidm1LljXqA+DDmG2FNUk8jjiX9Flu0Dy4W2RDfGdyj20QsVnHAort85
	OY59utGNNGlev5r7BweU+9yaeH40i/+ZtwYKGMnNnvZSbJ53oaJS14USe1Pa6+RwpxnmYmPwxx1
	Lpekdwo0nCNe/fL2zTtSrHdoo3Lq++lO64Iem4jOjoBpS5WjaS3ps6LS26VOAFYYWZu1hBOSITg
	KefR7Ftmi6dgV0ex+1P6lPB8Kj/d/h8YZjfn/Fq0CW8+yYkh+TxEVo14ZXzH9SbM9NJxxZISzic
	/2VVuOzfcKSRv65V8vNvhRM2+r8WcdVYnLVg6o=
X-Received: by 2002:a05:6512:3ba2:b0:5b4:ef51:8cfa with SMTP id 2adb3069b0e04-5b8c17efde1mr4269672e87.8.1790092892006;
        Tue, 22 Sep 2026 09:01:32 -0700 (PDT)
Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com. [74.125.229.205])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f5063d5sm265671fa.21.2026.09.22.09.01.25
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:01:27 -0700 (PDT)
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so4133347e87.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Sep 2026 09:01:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzI7UsdsYwashpcb/1sdaGQrPxPrHPHwACLCvANCaWQrnVnCWXXw1n7n5i2fhOFyQ/TEnMrs4ZNB65Y/nRbHWe0+w==@vger.kernel.org
X-Received: by 2002:a05:6512:33c6:b0:5b8:bc5e:b577 with SMTP id
 2adb3069b0e04-5b8c18524cfmr4607284e87.47.1790092884382; Tue, 22 Sep 2026
 09:01:24 -0700 (PDT)
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
 <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com> <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
In-Reply-To: <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Sep 2026 09:01:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
X-Gm-Features: AclHuK9ya1QMn_ceGlLKarlnG-Ztmeo8rReIvHR5PtOBYGFh5F04B9XoOov-3rs
Message-ID: <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
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

On Mon, Sep 21, 2026 at 5:11=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> > > If you do have some real numbers and think it is worth it on your
> > > platform, then maybe expose each doorbell/shm-slot as a generic
> > > channel. clk_mailbox will request a generic channel, do the request
> > > and free it. The same effect but without inventing a new api. I can
> > > share a draft if you want, but I suggest let's not make things
> > > complicated without proven benefit.
> >
> > FWIW, the downstream code in Pixel does what I think you're
> > suggesting. I can confidently say that, while it doesn't require
> > changes to the mailbox core, it is much more convoluted and
> > complicated. It also bleeds into the device-tree representation, which
> > doesn't feel great.
> >
> > Just to be concrete, I'll document how the downstream driver works. If
> > this isn't what you were thinking, please correct me.
> >
> > Back to our simplified "clk_mailbox" driver. We'll say that our
> > "clk_mailbox" driver talks over a single mailbox to the remote
> > processor. Let's say each message is 4 words big. The message space is
> > 32-words big. 32 / 4 =3D 8 which means this space is divided into 8
> > queue slots. Downstream represents each of these queue slots as a
> > generic channel. That means that, in the device tree, our
> > "clk_mailbox" driver looks looks like this:
> >
> > mboxes =3D <&cpm_tx_mba 0>,
> >          <&cpm_tx_mba 1>,
> >          <&cpm_tx_mba 2>,
> >          <&cpm_tx_mba 3>,
> >          <&cpm_tx_mba 4>,
> >          <&cpm_tx_mba 5>,
> >          <&cpm_tx_mba 6>,
> >          <&cpm_tx_mba 7>;
> >
> > Then the "clk_mailbox" driver is in charge of rotating through each of
> > the channels. First it writes to channel 0, then it writes to channel
> > 1, etc. This works with no changes to the core, but...
> >
> I was thinking something like   mboxes =3D <&cpm_tx_mba>
> clk_mailbox simply asks for some channel, gets allocated the next free
> slot. The mailbox controller driver keeps track of the channel-slot
> map locally and is responsible for managing contiguous slots and
> completing the tx upon receiving ack.

Hmmm. OK, so I guess you're saying that every time "clk_mailbox" wants
to send a message, it calls mbox_request_channel(). It always requests
the same channel over and over again, but underneath the mailbox's
fw_xlate() function returns the next distinct channel? Then once
"clk_mailbox" sees the tx_done then it calls mbox_free_channel()? I
guess it would need to fork the mbox_free_channel() into a delayed
work function since mbox_free_channel() requires grabbing a mutex and
tx_done() is called from atomic context. It would be up to
"clk_mailbox" to ensure that it used the interface properly: always
send the message on the next allocated mailbox, always free the
channels in order, etc. Also, "clk_mailbox" would still need to
implement its own queue to handle the case where there were no more
free channels.

One thing that is important is that "clk_mailbox" needs to know when
"tx_done". If we didn't need that, everything would be vastly simpler:
just allocate the channel, send the message, and free it right away.

Did I understand your suggestion correctly this time, or am I still
not getting it?

Assuming I understood correctly, my thoughts would be:
1. At least this doesn't bleed into the device tree, which is great.
2. I'm a little worried about all the overhead involved in constantly
requesting / freeing channels. Maybe it's not as bad as I fear, but
those functions don't seem intended for constant calls. Even if the
overhead isn't that bad, the extra overhead needed to fork the free
call to delayed work doesn't seem great.
3. It feels like trying to manage this from "clk_mailbox" is going to
be a bunch of complicated code, including managing our own queue since
we still can't use the mailbox core's queue.

Overall, it feels like an bunch of awkward code. It feels like a hack
that a downstream kernel module would do simply because they didn't
want to improve the mailbox core...


> > I'm also a little confused about the resistance. I don't feel like the
> > mailbox core change is that complicated. The diffstat shows 58
> > insertions and 17 deletions. 14 of those added lines are comments.
> > While we certainly don't want to add useless APIs, to me this truly
> > seems like the correct way to add the functionality. It also doesn't
> > seem absurd to me that some future mailbox controller out there will
> > also support queuing like this.
> >
> It is not the diff stat but about inserting a flag in the api to
> introduce special case behavior. It is like adding one person to the
> party introduces N-1 handshakes -

Sure, it's new core code for a single client. ...but some client has
to be the first. The idea of a mailbox controller being able to queue
data doesn't feel like an absurd feature that nobody would ever need
again. Heck, once the core supports the feature it seems like someone
out there will figure out how to make their existing hardware work in
"queue-mode" and improve its performance.


> the has_queue flag doesn't play well
> with other configurations and may allow future platforms to abuse
> has_queue to implement hacks.

I don't really understand this part. Can you give any examples? How
does "has_queue" not play well with other configurations? You mean the
fact that my code right now only works with "MBOX_TXDONE_BY_IRQ"? I
don't think relaxing that would be very hard. ...and sure, people will
implement hacks no matter what API you give them (the "allocate a new
channel for each message" might qualify as one such hack?), but it
doesn't feel like "has_queue" is especially prone to abuse, is it?

-Doug
