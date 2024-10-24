Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5F714AA9;
	Thu, 24 Oct 2024 01:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729733237; cv=none; b=MeuA389n2P86Z8/ohFeOlQwLLm57XIMg2lEVNO+k0rVb1c6VVz9N9mILDSWr6exxkH7OuT1W0e0kf3982Ql6y+KEKDaHEtcx5l+B0VWZhLVuHpkj3g1YceEL6zCyBIXY3KDy4+PObDVStQ1abvjiKQUW9oAJ1DVKwu4n++ciOEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729733237; c=relaxed/simple;
	bh=bN3b7nwvoXaFetXIrTZFGaxha31ul00X4aMSB1SdAak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iR6Ut9f6OUlGMUWFnKjGXWpbI3rqt9l4CJwhtN3e34cEZ8dnZlKf8dcSoJ/ZT/0YL2ZAu2W9+NU1WV7TgFwT/EIozz6uIyYPhqp8zIVNQoJwvTzXCjHGfWcexe/rCHn6uaT0eopyUMO6NqKlKRc500hvh65iOl+UglvYVZ0vq/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAgeR4Dk; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAgeR4Dk"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-71811c7eb8dso222032a34.0;
        Wed, 23 Oct 2024 18:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729733234; x=1730338034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWSeC2gaqWVSkCq/dJZL6iYS2BxOmWNA+qA4J5Rf6QU=;
        b=TAgeR4Dkh6YKN0e+caBnCcWg6EUDO7gAorLXfjqxiHBgekVLrCXOxb7uXhdvW0DaQk
         0SqG938OW1oxDQaK8GkaJlEK2M60ah/KytYrImu0R7dV3cMDVbyah2lmS+m/NrKXn6PQ
         2S7VwfQxCa8dFHo+a351J2cMCf783vEVg15cSz8MjxvkauE4Uyk2c2LJV+KM3Irk8VTs
         iFPRx89TcvFkVWDh5JTar0yzG9JnPcCPWXLdGJHvHtXq60oL1DMHp2kg1L7amRvafd/I
         fRh37UZ/X1cx4GPYJQzRkP3PSSkV0etgozQz8WyVRNCGMGVKm41DFUEhkBf5zHht7en2
         VLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729733234; x=1730338034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWSeC2gaqWVSkCq/dJZL6iYS2BxOmWNA+qA4J5Rf6QU=;
        b=j/zrm0Z56vXep3gQBUHOvDTgKGHJl4IXrGCXUrHGFAKEi/40z46a3MQ+ICnbC9ZiFD
         lVwa8txG+L1L7mXYnhTpbHbFlE+6HCmOLVzTSaeO0TL8jb3jDMKubTQNUKA8jy4epko5
         68CnOtQMK3FfZXbLXngSIBXNifKaSu/MFHBOLsVtI2Kmb7T2yAL38RrXM5A+vxNwJbYV
         HxtmMeBUHCTlT3Sksk32BnSUU8MQgFNfmPFQiQX4FPwx+eWiL+CsZZO4rBw1K5sn5d3U
         GlQKAhPktCbeZsYzbic24QwKJqZYhluyontBZCpB08Jon5oe0n7jbOaWdObJ8ZSFKVzB
         klog==
X-Forwarded-Encrypted: i=1; AJvYcCV0KE5Zo7oKuMispfYaX0fBXLRhxJznobXpwxbqs9RbUTZuXDttJ+KJgiNK6YWbQEZ5cosj/nh/97KWf36e449xCAw=@vger.kernel.org, AJvYcCXbZZlCagECq2+VtBC0dM2+dzOaQTs+3yGz787OMvBk0Ukwq3pLqLjKeH+9ujOLb7cPL5VvE7TXz/wKexo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAxmdWtTcHghRTavJirpkQ5yOoK8vVISfBtzQrJec95Y9UGJlv
	jfLtrJIfBANCWyp6xsGaDPis9zGBnsxGONs/redUF/WFWoDkLNg1LropvRE+RwgKoMzNBbfCYZl
	CAOB0obZfDX13VPL1A25+7kk3sL0=
X-Google-Smtp-Source: AGHT+IERBCIjWGhhcVKREljzLSYfi+HNM9xg8h0I65CKvlaMOL3JWXyGQU2rMzDTE79TCRpZWYY5nypteKTDbli7Uvo=
X-Received: by 2002:a05:6830:350a:b0:718:1793:ecd8 with SMTP id
 46e09a7af769-7184b45037fmr3937174a34.30.1729733234617; Wed, 23 Oct 2024
 18:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-2-tudor.ambarus@linaro.org> <CABb+yY0_NSLAs-mP=vHeNsfKRcS2hcFWmWfcvsr=nFcXQOi5uA@mail.gmail.com>
 <a7274a6e-1da3-47f2-8725-b0c534bf6608@linaro.org> <1df84f83-40d7-4719-a9f9-dfa10d25c667@linaro.org>
 <CABb+yY0H4cATB9Gz2EitnR6R179aKDzR1N87fz7Hq9Hm-_8Rmw@mail.gmail.com> <779fc372-a4d9-4425-a580-2173a0f6a945@linaro.org>
In-Reply-To: <779fc372-a4d9-4425-a580-2173a0f6a945@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 23 Oct 2024 20:27:03 -0500
Message-ID: <CABb+yY0bhjRYLwyo-t6djttP2bq_irX+Rad71wDX++nQV69cAw@mail.gmail.com>
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

Hi Tudor,

On Tue, Oct 22, 2024 at 8:27=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Hi, Jassi,
>
> On 10/21/24 5:32 PM, Jassi Brar wrote:
> >> On 10/18/24 8:49 AM, Tudor Ambarus wrote:
> >
> >> The active request is considered completed when TX completes. But it s=
eems
> >> that TX is not in direct relation with RX,
> >
> > TX and RX are assumed independent operations (which they are).
> > TX is sending a message/request to the remote successfully. 'Success'
> > can be indicated by any of the three methods  TXDONE_BY_{POLLING, IRQ,
> > ACK}.
> > You seem to assume it should always be an ACK where we receive an
> > acknowledgment/response packet, which is not the case.
>
> My controller driver indeed ties TX to RX and considers the request
> completed when the RX completes.
>
Does your controller require RX or the protocol? I suspect the latter.
Anyway, the former is also supported by TXDONE_BY_ACK already.

> >
> >> Is there a specific driver that I can look at in order to understand t=
he
> >> case where RX is not tied to TX?
> >
> >  Many...
> >  * The remote end owns sensors and can asynchronously send, say
> > thermal, notifications to Linux.
> >  * On some platform the RX may be asynchronous, that is sent later
> > with some identifying tag of the past TX.
> >  * Just reverse the roles of local and remote - remote sends us a
> > request (RX for us) and we are supposed to send a response (TX).
>
> I was hoping for a name of a driver, but I guess I can find them out
> eventually.
>
Do these usecases seem impossible to you? Many users are not upstream
that we care
about as long as we are not making some corrective change.


> >
> >> Also, if you think there's a better way to enable controllers to manag=
e
> >> their hardware queues, please say.
> >>
> > Tying RX to TX has nothing to do with hardware queues. There can be a
>
> Right, I agree.
>
> > hardware queue and the protocol can still be
> > "local-to-remote-broadcast".
> >
> > While I don't think we need the "Rx is in relation to some past Tx"
> > api, I am open to ideas to better utilize h/w queues.
> >
> > The h/w TX queue/fifo may hold, say, 8 messages while the controller
> > transmits them to the remote. Currently it is implemented by
> > .last_tx_done() returning true as long as fifo is not full.
> > The other option, to have more than one TX in-flight, only complicates
> > the mailbox api without fetching any real benefits because the
> > protocol would still need to handle cases like Tx was successful but
> > the remote rejected the request or the Rx failed on the h/w fifo
> > (there could be rx-fifo too, right). Is where I am at right now.
> >
> No worries, I'm confident we'll reach a conclusion.
>
> It's true I implemented just my use case, but that doesn't mean that the
> "request" approach can't be extended for current users.
>
Sorry, I am not sure we should make the api dance around your usecase.
If your usecase is not currently handled, please let me know. We can
discuss that.

Thanks.
