Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987FE37CD59
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 21:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631303; cv=none; b=SHVKYMc8XCQ8hNrIEyS/Tj8a2t8KnNROJfkk8bj+tUXQQeuU5Z6jd1tW+oolBEppKs75Rq41ZiZwekZ3A/cdAUfsDO4/cPkcuF3UAQPg9H2aphvFr9V89a6gbibaV752RffvE7Osnk5RfWvEEirCgYUXtpCRQoi3h4CUJxeKY5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631303; c=relaxed/simple;
	bh=cUrLPKJjgy3ZOSpGyKl+54PttfAnoO5dJ/JZfZKuxY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OirvBV0OOUYWn29V8R6+V2IqhVupE/0K8+HN+uy1SSIFA64bhlY9zfCI+sDNtM2nTHH/OUnhCPXVseDHGvTdQvQG1SNX/EQ5rADu2uShO9z4SJc14buqwzjaOD5fXg/w2xsDDniLDgSc7tvigpT4a8mq3cVJE/chh0YSeUtxBZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VY+OlWq2; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VY+OlWq2"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2c996fd607so21867066b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 14:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790631300; x=1791236100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qMXZhXOkxtrjP55SDYES5mqvZlQYPy+Z9IGMIJjgKbE=;
        b=VY+OlWq2RKa1fMdpAOMyAWZ1+YS1uakglv313X7LDTpXvtHVuZAeUPP0xCK60ef+xc
         MZFmXi0yFVDR3WAd0Vcc33SNizOUE93swlzf0P9IQb03loKKJDNS0ui8KVWMFwzUVQmw
         4hFHo4Uv6sQlPl+d35W8ae2TKV20GDMVCzxlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790631300; x=1791236100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMXZhXOkxtrjP55SDYES5mqvZlQYPy+Z9IGMIJjgKbE=;
        b=hVRsBk3kbRjnEq53XVfn7B9+WUlS2CRpUKyoX/kjin+XCA3LYEq6JGrPY0pYLI8wXh
         yc2X7cq9XlCkm1hq5RzEYgaOtz4Yad7U1+MkqEcZVmvmVGI3g/mcu0i19ArdjxAo8mHM
         8LemlEkR+LkrGJlBovsK3coVwmCUXg4ivco7jbjmtnc8nwjjFEhMLdVy8oxK3wcnmZhC
         Jv32e/RSejXu57CCGkexjJ4VnE7qlB3uxU/UG9Vy6ZR/jxscfwlgStEC5eFs5oq+ffPp
         cFGzqdLlDPe7Hh26aOrJyszr578sYoHykz9ZjKTOeG76pJoUhceiro5ydTBhktGAh0lq
         jujg==
X-Forwarded-Encrypted: i=1; AKwUvBwalo6H/GHrgouPK4kIlO7alWNHnBifKjchr8ZnF5ILj53r4wxklg7ogcTvBxPGmOkIGse3b2Zb5fn9G/ALRuA0dQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mItcxfIaYN/uKwCxtdQTr9CFXclZwjRxxdu8uyPohC81eDl9Az
	kJBngv2hXaac4VfYvuwR9sRm/nF+rTYbszLfkygQa97Z9dskD8b9LQ1VEqW6WEkYM7kW0wVsezq
	Q8S0=
X-Gm-Gg: AYBFou0OY5CQnFMdOSXCHFPSeYIwB4QlN1Cz2k05eBoi0aTOajZNRq4W0aEgwUI4atQ
	4i4bBFofIW6n6Ww5uM13yHI5NXsQC7HepUsARkT0kp+ZA0NCYl+n3I+8zH7RclQSSaOPtZ8aYmW
	73Nd1a7zfZ+9mkh1WClepExP3aENdng+1Iik+qBA3UFH53eIjrc3eTBRyuKUixetqBSFplxaE2O
	x1ywY3+1zu8d1N5Z00RRgN1QSSF3O2/Wy+JAhfJuzNUHO8xKby0qtxE81d3Xb7Zw6quGkEHaYEh
	A7Fv/mRB7iQMW89/BqhLwKzv30jOmx+7f9pQY0CMTEk8KduoCxX/VYS+UJrCaX9O9dzV20XftdQ
	097wl4uMFyKbQlfkEcsgBG4r6Tqhyol4zQ/5br9Jl2nL0r/TZOFW4STQpe3Sc8WW8DlTknAbnDd
	LFt3vAaFjEnwf0Q45460ag9TF9qhDdBNHqbPdVrWYg5f8U7ETxlD3SLyAA1n17X2GfJQpO2ay6u
	M4ZtqoqzdzMix0QkHEXJSwSKxYPKYIwVhYw7A==
X-Received: by 2002:a17:906:6a1f:b0:c2b:ca98:872c with SMTP id a640c23a62f3a-c2df4c2808cmr41860866b.20.1790631299568;
        Mon, 28 Sep 2026 14:34:59 -0700 (PDT)
Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com. [74.125.225.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757ade3sm537859666b.29.2026.09.28.14.34.55
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 14:34:57 -0700 (PDT)
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af0707d41so143597f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Sep 2026 14:34:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxbaLNpOx1k4Gr0hr5FTK3Oic2RQbZL0pf5FgpAzCVkyRWjJjERfmSY+eJrXve2Q+1H2sv+ADGTJnxavkAjaG1xvg==@vger.kernel.org
X-Received: by 2002:a05:6000:1788:b0:486:e60f:a4e3 with SMTP id
 ffacd0b85a97d-48af1a8f107mr814148f8f.1.1790631294826; Mon, 28 Sep 2026
 14:34:54 -0700 (PDT)
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
 <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
 <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
 <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com> <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com>
In-Reply-To: <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Sep 2026 14:34:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
X-Gm-Features: AclHuK-jZYMHfBS5WdwcZpWCPaLhVSXzZ0R6bURtHTy1RcWpghu0fszYS6_LsfU
Message-ID: <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 22, 2026 at 5:23=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> So I think clk_mailbox can acquire all 8 channels during probe and
> maintain a list of idle channels from which it picks one and uses it
> for an incoming clk_prepare(). If all channels are busy, the
> clk_prepare() will sleep/block on a wait-queue which is nudged by
> tx_done of a transfer after the channel is added back to the idle
> list.

Sorry for the delay in responding. I wanted to prototype the change
and needed time to look at it.

So I think the crux of your current suggestion is that we have a
non-idempotent "fw_xlate" function, right? We call it multiple times
with the same arguments and it returns a different channel each time?
In my prototype, it looked like this:

```C
static struct mbox_chan *goog_mba_fw_xlate(struct mbox_controller *mbox,
                                      const struct fwnode_reference_args *s=
p)
{
  int i;

  if (sp->nargs)
    return ERR_PTR(-EINVAL);

  for (i =3D 0; i < mbox->num_chans; i++) {
    if (!mbox->chans[i].cl)
      return &mbox->chans[i];
  }

  return ERR_PTR(-EBUSY);
}
```

Then the client loops around and requests the same channel over and
over again until it gets -EBUSY? Like:

```C
for (i =3D 0; i < FIFO_MAX; i++) {
  client
  chan[i] =3D mbox_request_channel(client[i], TX_CHAN);
  if (IS_ERR(chan[i]) && PTR_ERR(chan[i]) =3D=3D -EBUSY)
    break;
}
fifo_depth =3D i;
```

I _guess_ that works, but it still feels like a bit of a hack to me.
You said you were worried about people abusing the "has_queue" API.
The above feels like it's abusing the "fw_xlate" API, turning it from
something that is normally a "lookup" into an allocator function.

+Rob, Saravana, and devicetree@vger.kernel.org. DT folks: is the above
something that looks right to you?


I researched whether other upstream drivers use of_xlate() /
fw_xlate() as an "allocator" like this. I did find "exynos-mailbox,"
which appears to be doing something similar. However, upon deeper
digging it seems like "exynos-mailbox" isn't using this dynamic
allocation for any compelling reason. It looks like, really,
"exynos-mailbox" should just be returning one channel. The client
(exynos-acpm) could just use the same channel for everything since:
* It actually gets the _real_ channel ID out of the data.
* It doesn't care about txdone.
* All it does is ring a doorbell and there's no queueing.


In any case, if using fw_xlate() as an allocator is truly the only way
to proceed, I'll finish my prototype and send a v2, but I'm still
skeptical that this is better than just adding queuing into the core.
Speaking of which, I actually want to go back to something you said
earlier. I asked a bit about this but I don't think I saw a response
(sorry if I missed it!):

> It is not the diff stat but about inserting a flag in the api to
> introduce special case behavior. It is like adding one person to the
> party introduces N-1 handshakes - the has_queue flag doesn't play well
> with other configurations and may allow future platforms to abuse
> has_queue to implement hacks.

Can you elaborate more on this?

1. How does "has_queue" not play well with other configurations?
Everything should behave the same if "has_queue" isn't set, right? Are
you saying that it will make the code too hard to understand, or
something?

2. How does this allow future programs to abuse "has_queue"? Won't
they need to submit mailbox controllers to the mailbox subsystem,
meaning they'll have to go through you? If someone is using
"has_queue" to do a hack, can't you just NAK them?


One other thing that my prototype turned up: If I do the "fw_xlate()
as an allocator" solution, I believe I need to change the DT bindings
by adding a "tx-payload-size" attribute, or I need to jump through a
pile of awkward hoops. The reason is that I suddenly need to know the
number of FIFO entries much earlier. The v1 of my patch simply figured
out the "tx-payload-size" based on the first message sent, but now we
need it earlier.

While that's maybe not the end of the world, it's always unfortunate
when we have to change the DT bindings to accommodate the software
design.

-Doug
