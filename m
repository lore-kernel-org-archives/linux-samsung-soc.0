Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1553A33EB10
	for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Oct 2026 09:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624158; cv=none; b=r+IgEiU0PUT/HGl3sNihGtsyCH8yvhvhOUHTgJ587n8mB15NZIp5OcAqif2nHuwHSzNb0/doBCQo3QCqQ7N/Le8t4M0jCIhgIbp5W0FhEWBn1hDHuLpl/lrvBk8CHfxPgz9pfFZT0rZIsF66rqHTFrufvmNJX9YZw/EjhYALY2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624158; c=relaxed/simple;
	bh=26f9vS9ZqT4zzaBLJMhopaILCcL/YIkV08ebrTJF/vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nskdxpjFfd0Obr/2jHaizgQwyf7hxPPzIs80KtgfjE7ZOdci2/or10bnptsXQ/aAb4dlgUd/NUgFKzBQKhKklktbQ+xcOJEEkaxMM6nJiSYvBXQ1WZTXgSJnsKh7kZ61iQN0y8GMqZ+1RMe+zSetABcPRGHAZbgRF+qr3x3yUtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=adh9z48A; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="adh9z48A"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c263415982eso70331066b.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Oct 2026 02:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791624155; x=1792228955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7T5vK42CKAAeKGAbtMXBKyH6AjLD+rScPsMFR15QqdY=;
        b=adh9z48AdKRoKIILFQfaD8hxP4PZcOMyZn3OrtpznTM7pTL3f0TzrgoixlwtqMjHwi
         gG5PwsydHbtfQpKHnG3jh4RVAQ/MfJxLopGz65xXnBAnVHUzEBG7tUOsjbh7AMuxPfWX
         XWMzJWJDSXRjaDfCseWIQn0tMSARct/ci7PQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791624155; x=1792228955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7T5vK42CKAAeKGAbtMXBKyH6AjLD+rScPsMFR15QqdY=;
        b=G6xKIgus1za8MzA8wew8Gk6uBkzLzZxN+pFRr0ST+T08pdcJjpJNUCBbXMA1BJaDLp
         3/kMP5mae58s7DcL29H/nRQNNNERI7bPQYMJszTtis85UkRfdPZFRfYyvRvvuBzXqcv2
         yxL/l7na+IGUBtE/jqtTvAdz914aytDekThHcm1zBrXRpvVWxhcG55uN7c+bJS7Sdcot
         foLY5Y7UpEv/EFqDMJsxCnW29soEkJGtTG31ZsvGZr6ZrJU9BCtecPH0DSTM+kS1ct+7
         qvS8TpeQzNyhm65z2n45GgxNTNlOOHoTMmHit0mbonLgnWOlLeFThKYFpNcpoqQA/xQ6
         gqgw==
X-Forwarded-Encrypted: i=1; AKwUvBzVQCM275YBlLCT+hf74fFp4I4XY30dwBfPrSB5wd4hJY7oJo0M84e1wl0No2sQCosFtP7UgijDUJBRlgg6j2OxQQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLv515OGVbXOTYPVINqgGydjtxYmmaNZRqffYT4gK54865G2i/P
	wdn2dn2p4LZo0rY2H2l8yzUsGTtCI1Wt3bfvhXQByS928pfxT6ASzOAw/oM4KE4RLp6sPj3YVwn
	/tG0=
X-Gm-Gg: AYBFou1roQAI1aLS3bOaEejqbsma8kDrJ+F/KrHxCIHVZnT8OFKV1N+egJT94jJNT+S
	n6uCyPisZMbYGEEl++/MNIMUuHUxVS3okkLSIFl4VnzX2RvFSk2GqlAwiFO2iwZam+Ly483g91W
	pxbGVP3TjyS4vhuZlvYnil3etohvVxvqiA4Jkcd+abhgP+ibWj5ka+X0dVg7n+tsFzusurwO5Oy
	cLIjldv7ePcrxG8bq2TIgSML7xAJEwq9OuGMZSeYW3fsEjPNZMsa5oHXlSgL573XySFBwlgPM8i
	oZlA8Xii8/7RScbsPTeb8Slh1ePMGtBtWVyOFt9goiNSOlgl8yy04UcQBZBeJTfznSPwy6uXj5v
	D5BMNHjWF/tlqp+RJcfZiUhRsA7KnH7WwJr6OdDlIo3JcqdsL1ykK1au0kH3TH6ZAVqSoa1g4M6
	Gk3ZwIX4EDUfgENP0j9VF5W4BTboPPzfBbg26lFmBeeBt3kshjUyOoEz8fEXpFlolL+Ia8SaQrH
	oWfhyz+ced42kASrQBCw4eJ5smaf5i7f4RxvwM=
X-Received: by 2002:a17:907:7249:b0:c25:2e93:289e with SMTP id a640c23a62f3a-c31a9fa16a5mr447580266b.16.1791624155115;
        Sat, 10 Oct 2026 02:22:35 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae52a7sm221680566b.83.2026.10.10.02.22.34
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 02:22:34 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afe8d3980aso584428a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Oct 2026 02:22:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycxSSGmg3sLGMVgJNptWH2JXoqnzGzX34saUXT4V8gRS9JMyULAg/oYvI0GquO+/iRgw0bY/K0ISJJThULaWx0jQ==@vger.kernel.org
X-Received: by 2002:a05:600c:19c8:b0:4a1:7bae:d80a with SMTP id
 5b1f17b1804b1-4a18e47ad49mr89287935e9.9.1791623808250; Sat, 10 Oct 2026
 02:16:48 -0700 (PDT)
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
 <CABb+yY0yaXZX7=0L8Tt5P4u-GTX=unmgBMePoNTVQ5BHKzLM3g@mail.gmail.com>
In-Reply-To: <CABb+yY0yaXZX7=0L8Tt5P4u-GTX=unmgBMePoNTVQ5BHKzLM3g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 10 Oct 2026 02:16:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WUw70BjakAWsbtJ-qnGGXB7vo8x7G939_jeyGKagVWyg@mail.gmail.com>
X-Gm-Features: AclHuK_QaW90rrHDoR3w9K6oMhgGdn--oULAhnah8n8uC4OdTYJMsL3yEKTzFlM
Message-ID: <CAD=FV=WUw70BjakAWsbtJ-qnGGXB7vo8x7G939_jeyGKagVWyg@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Jassi Brar <jassisinghbrar@gmail.com>
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

Hi,

On Fri, Oct 9, 2026 at 8:43=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>
> Hi Doug,
>
> On Fri, Oct 9, 2026 at 3:42=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> > > >
> > > >   for (i =3D 0; i < mbox->num_chans; i++) {
> > > >     if (!mbox->chans[i].cl)
> > > >       return &mbox->chans[i];
> > > >   }
> > > >
> > > >   return ERR_PTR(-EBUSY);
> > > > }
> > > > ```
> > > >
> > > > Then the client loops around and requests the same channel over and
> > > > over again until it gets -EBUSY? Like:
> > > >
> > > > ```C
> > > > for (i =3D 0; i < FIFO_MAX; i++) {
> > > >   client
> > > >   chan[i] =3D mbox_request_channel(client[i], TX_CHAN);
> > > >   if (IS_ERR(chan[i]) && PTR_ERR(chan[i]) =3D=3D -EBUSY)
> > > >     break;
> > > > }
> > > > fifo_depth =3D i;
> > > > ```
> > > >
> > > > I _guess_ that works, but it still feels like a bit of a hack to me=
.
> > > > You said you were worried about people abusing the "has_queue" API.
> > > > The above feels like it's abusing the "fw_xlate" API, turning it fr=
om
> > > > something that is normally a "lookup" into an allocator function.
> > > >
> > > > +Rob, Saravana, and devicetree@vger.kernel.org. DT folks: is the ab=
ove
> > > > something that looks right to you?
> > >
> > > There is no allocation in your xlate code above, so this is not that
> > > terrible as we talked on LPC.
> > >
> > > >
> > > >
> > > > I researched whether other upstream drivers use of_xlate() /
> > > > fw_xlate() as an "allocator" like this. I did find "exynos-mailbox,=
"
> > > > which appears to be doing something similar. However, upon deeper
> > > > digging it seems like "exynos-mailbox" isn't using this dynamic
> > > > allocation for any compelling reason. It looks like, really,
> > > > "exynos-mailbox" should just be returning one channel. The client
> > > > (exynos-acpm) could just use the same channel for everything since:
> > > > * It actually gets the _real_ channel ID out of the data.
> > > > * It doesn't care about txdone.
> > > > * All it does is ring a doorbell and there's no queueing.
> > > >
> > > >
> > > > In any case, if using fw_xlate() as an allocator is truly the only =
way
> > > > to proceed, I'll finish my prototype and send a v2, but I'm still
> > >
> > > Why fw_xlate() would be an allocator? Can you extend your code to sho=
w that?
> > >
> > > I think doing any allocation in xlate() is calls is fundamentally wro=
ng.
> > > These should not modify the state of the device, so no allocations, n=
o
> > > device_link_add() etc.
> >
> > It's not _calling_ an allocator, it _is_ an allocator. It is walking
> > through the array of channels and returning the first free one. Then
> > that free channel is "allocated" to the client.
> >
> You mean _assigned_.
> Allocation means when there are some resources reserved that must be
> released at some point later .... which is what the mailbox controller
> driver does in probe() and remove().
> In xlate() the platform just decides which channel to assign to the
> incoming request -- some platforms take the hint from device-tree,
> your platform has flexibility and can simply assign the first free
> found.

In this case, mbox_request_channel() plus the fw_xlate() seem to me to
act like an allocator. There is a pool of channels and each call
allocates one. mbox_release_channel() releases the channel. This is in
contrast to normal cases where fw_xlate() always returns the same
channel. Sure, I guess in that case it still "allocates" that one
slot, but that feels more like someone requesting/reserving a channel
rather than allocating the next free channel.

...but I guess the root of the problem is that it just seems
unexpected to me that fw_xlate() is taking the same input "fw_node"
and then is returning different mailboxes.

If this is what everyone wants then I agree that it can work. I just
want to confirm since it doesn't feel very clean to me.


> I will try to explain in detail your questions in your last post, but
> I am still not convinced you need to modify the api.

Sure, anything you can do to clarify is appreciated! I'd love to be
able to send a v2 and move forward, but I don't want to do so while
things are still unresolved.

-Doug
