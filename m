Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE584078CB
	for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Oct 2026 18:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792346669; cv=pass; b=JI1kbGVTE998Tw6n7NiIBb4zvSaRCfA4h9zm1a5KuPX1o0QJx1kEBMDq18+/c5IHZMZIzUugdMuUQ2rEqao4UIF7N+aAMz/yf5xqxNNcmzh5fWvwJNqwyxj2innl4zZudm2+fly8vuxQnnPfmJPjNbSXPCO3/Bi0+rciiuyp2tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792346669; c=relaxed/simple;
	bh=uSc5BfTvWQLr3mEx1fqMIkGXe5VzMAa7W88GOKZJAag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pSDxWo2K8aUZobUkQTBYTfTMUM+E8XMFYd7CLpJgQsA9sgcpkM4ojHT7o5Nbeb7X/z0D+M6XtQt8ZHMp4Cz7bFar3IM2ZHW732B9IjvjyHbPDji3ZiZBG+iIZ95Kmgf0bv2jhivQXVC44MBZXtSnakr7fkrt7D6fwUCb4tlaClo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BifnEZ5N; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BifnEZ5N"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-84751a20d87so371742a34.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Oct 2026 11:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792346667; cv=none;
        d=google.com; s=arc-20260327;
        b=qJUp6ZxMEYgq6bzmrYz11RT2dLnQngYwPHmhi7TEbT/t62Rhwd0c9/sOYnOQm9qUtU
         NNZrCgA2fBodx3l6nzFV1fl+9MWrKkDptIf9uQ3OBaCvm/yIGu1S1krZJcdOVfX90tij
         u7iUp1eosruRqRVV1IYTPmYnS8MrN9hB2EPB47D6r7J3Fg0QGZ01O59st+KD0/JXm+ii
         7QwNqmDZp0gAaaEAYD1NUlZzuTAU8MRE5C85z78WWj8aw1qF0f2ITfoIViMr8MmW3qm5
         vPE6uf/645wE6VPaybIhw+6tHvJEybjo8HP+pebzSKAp+e8zsqDvP2dy+wjyylqKTRU/
         R3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1mdbBwBWo2/ZQakn2PE2+HqsoPZdP41mPHeDVrW/vk0=;
        fh=P8FbD2v5rk5KMf8QlnDRlsxHQFX13c2Zg38SYa2blB4=;
        b=sNXAXhlT54CU7299BUpkh1uuKrPH/zJh30ykLnIWwny7Ee0YN0vf0a38U3eb/007HH
         dRLCXbOtI+0dkwtTl6b60hYV595XmPIM2tSMkimMcc0Osw6kKkwhiPCjov67kMVbT7X9
         X8h/us6WTogE+LTBok8ProWpq6c88DjKyBNZ+l6L0LVMIjn7cp96SXlR6ONrFSjh9J79
         czp+UNA/BcPK3Im3duuSIp49GzfZfh0ZdIQhPb6Ob91U+pzj4ZwMd2IursUc63Aun9hC
         5eqiq/xmK+5DAu7wT8HX5yWNETAI3D3ZvH/5oyAC/ihoBgqDdg0LmDovfkVHeM69IP1c
         Ddfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792346667; x=1792951467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1mdbBwBWo2/ZQakn2PE2+HqsoPZdP41mPHeDVrW/vk0=;
        b=BifnEZ5NoxCkRDLr4KLc2SEQf/iNG0++zy1cM8BqHbrFxeZzGASb445bDYzdkzSjAM
         oENsLzhOHsjOyP6nV7Sbw8YV0GUcIROG/0gkdiRM1BlUCqhimk7+l0y7xScpH3PqksoE
         Fl7LNpfXfkNQlEezeEoHDi4q4E885a0kGpiwKuTg51/fMSO2A/YIAJZaUqYgXxvOB3SM
         7KQLbTJZqcK5ieBA6No6xsxT5TvPm89DzTuUXDIfLKVNV/kWo1iDgccyEsPmSTRoE2mG
         gQA3v2W+wm9LM4HqWR2ydMiu7sFFjxWqrarXLzwDPWEV/iIXIT2kyjz/URei1R5oOnl8
         E5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792346667; x=1792951467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mdbBwBWo2/ZQakn2PE2+HqsoPZdP41mPHeDVrW/vk0=;
        b=wiJT9jtBvoPU7u363W3btr5CkC0wkTWMQKlmdKzxNJtZ52ND18rpfStzlFmJWTO9L5
         6PknwUWeq/D5tLCCAzd8THYRlU6CTl3Tbt152gXPlb96sCPq7bLfzbCmKsUr2oqvNuzt
         XWdeA1yTMBamzbg4R3r8+DtPzdVUQMNnFh/nkTjVdq0Q+6f4JS48F5GP29Fkn6mFqRav
         4nYt3hwftEC7VRZqRtzscttbVActh0138LP7/P81IOHl+bosbbfcTOjRlB5PGwAsox/w
         QhBGxzwr3L7Pvv3DgUbZF35p0ATACz+c0IK0WdZ4iO+QTnB8dXmK0AiwedE1w2latwQo
         Ui1g==
X-Forwarded-Encrypted: i=1; AKwUvBxssh+qdGLzoqoruNI24LVVe4MRpsqCU9Ch98cRZV7af5F/AUCodyWxoAR0Fe+mjfvGJkDYcGzlN43hLpNxg39l3w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJHzjWMaLMV42xusfISyybPB0fLZn3sz/9kSQ1u/DkXx1wLMgDC
	U/KCLZ9nbKCM6N0qewvfFjU6SkngRmLdBhWIWpLtxXBLliRwPKPBuIXoBicxoPN9iDuNBrU/yNT
	I2Gr1mLFvaJHUNVBEY1zyPUaAgG0B2q8=
X-Gm-Gg: AYBFou1P4sHYOLEi4wuVuy141sZJi0wXhgCLVQtAQsyAQkdhcDiqYdJTNr41+3QTIUK
	cTzDpom6UPY3gHenaq8NLrY1VMgVVmJh69NnZZ1A2T2Gq91s0esK7PnIv0swTEqKDKRE2YEx87O
	q1lA6xANEZ4ETKZZ67yz6j/tGu9avKKX7hE+MRQDPe1jNDZjk4Ed5FB6ZKktpnRmDUqKDPr1cYF
	2D3OZ/QTPl+udbZ+HzZghp0rikvS4DBoYNCUo3a8nR0EmEHh40Tfh7Zx9kW8olxzwlO+0DibYS6
	kVIcXawx7UKht11GjP/zp58JMwotKn1F2YFf1m0xSEhCx3JE+tE2RFY=
X-Received: by 2002:a05:6808:c16a:b0:4e8:f158:504 with SMTP id
 5614622812f47-53ccfcb3732mr4440447b6e.44.1792346666667; Sun, 18 Oct 2026
 11:04:26 -0700 (PDT)
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
 <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
 <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com> <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
In-Reply-To: <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Oct 2026 13:04:14 -0500
X-Gm-Features: AclHuK9jkljhKuhIJglKVeLMSVOb6YPON2UjWK6R6JPfulmpbIc-vcVZcLxOoks
Message-ID: <CABb+yY2FHBxNMnvVkJ=tmeRF--Y4t_L5A=FvXks8SCzwwARvyw@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 4:41=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:

> > It is not the diff stat but about inserting a flag in the api to
> > introduce special case behavior. It is like adding one person to the
> > party introduces N-1 handshakes - the has_queue flag doesn't play well
> > with other configurations and may allow future platforms to abuse
> > has_queue to implement hacks.
>
> Can you elaborate more on this?
>
> 1. How does "has_queue" not play well with other configurations?
> Everything should behave the same if "has_queue" isn't set, right? Are
> you saying that it will make the code too hard to understand, or
> something?
>
has_queue doesn't fit with all tx-done-by poll/ack/irq in
blocking/non-blocking modes. And we can't say that flag is for only
one specific setup.  I can imagine people (poor LLMs) concocting weird
designs because that's what fits their first implementation attempt...
just because that flag is available.  And then people vehemently
defend their first implementation.


> 2. How does this allow future programs to abuse "has_queue"? Won't
> they need to submit mailbox controllers to the mailbox subsystem,
> meaning they'll have to go through you? If someone is using
> "has_queue" to do a hack, can't you just NAK them?
>
It is difficult to fight platform specific changes because people
can/do say "their special platform doesn't work that way". It is much
better to reduce the abuse surface area.

> ...but I guess the root of the problem is that it just seems
> unexpected to me that fw_xlate() is taking the same input "fw_node"
> and then is returning different mailboxes.

Why is that unexpected? xlate() doesn't have to consume any hint if
all channels are identical. Another obvious example is a controller
with just one channel.
I think you should go ahead with the v2.

Regards,
Jassi
