Received: from mail-oo2-f15.google.com (mail-oo2-f15.google.com [74.125.231.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237FD3DAAAC
	for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Sep 2026 20:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789936206; cv=pass; b=hN8IzrkXsST99l3KU/agf/gGWa1ex+6fp1RpLvWfptcFrmjXjMRuUjE3yNMpEvqR9mWx1vhpe28EfoHOckM3in8F2pDcBqXrdsuMd23EIu+ZRY0W4ujirO9pJ6u3IestrhDjPFUFr35zhpQn9QYLDdPXLUh5x5GoxRHIBBCrxpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789936206; c=relaxed/simple;
	bh=UuxmOhA8ouqiNqWUp1uMWZH0rPNr5xGhrrIxVD6hrCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dntd6EwQR0XjFhluoI2eJyV+tXYZx4D5LIqAfjoupiYAjj1ucdKktHDodpB4wkJr4HyYb0dSRgJxJBQO1T2V0GeEl/vBRKmWwTIBDZ+HgccFoaZC7qY7kiH8245rHsc49qryfy1h+PcfSobAbsnujDEJa86zhSfXGTnha2Qokeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oIrL1bXH; arc=pass smtp.client-ip=74.125.231.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oIrL1bXH"
Received: by mail-oo2-f15.google.com with SMTP id 006d021491bc7-6b4bff33d18so976299eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Sep 2026 13:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789936204; cv=none;
        d=google.com; s=arc-20260327;
        b=Bdxj/66qNhgAvF9xRPbyaKuHZRV1by2tlfKedlqGfQK+CU1VJ0iP1qiIkSa8zlFLYt
         C5Kvw5GU/yZ5Oqc7/jZhfk2uIpgW1Q7TCzTouPQyXGrPKt3gr2EdtM6D0E3kNu3ozd6Y
         Rem5YwVhr78B8YtrYqX3bJuuiZXnar2PJ2RGkxjxinDw6M3wn+qVCtgsdes1CG7aqQ6n
         3uN2j8vPtMAH17bVtRKRpTXfdNJWwk9WAbKbNCq5HxPvRI4Cq8h/nLYuBkkxgJ1gtCol
         j0xMopWHPq1cZo6t+9i38+0ROSzb1uMSy3/wySFgDRoTpcJxB6UBm3/xTbkbENJUZ+L5
         JyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UuxmOhA8ouqiNqWUp1uMWZH0rPNr5xGhrrIxVD6hrCI=;
        fh=yqDc7CYNUryqC7udJSd4WeKpdeZqqOzgv6/5Rpu6t4k=;
        b=J5uqy8G7Pn1nsGkbp5w7JRA9+MDVB1V9cw4GJZXrSubVfAgzH09R040R3H+8FawXZ0
         ifVHZBo7ykSGYcDZTFM63FuTqLByFTXN6cGfQEAoRnlXAreye+OL7Pregr8+VPGLBfhV
         dH5r/G2EN7cDxZ2xKoLmFCFgKBY00TUlGtxAqukQoAZ9DSAa3Q0Xb05dcMHbFjn/GnOy
         qdAmy6Egt2Fie9J8GW3HdY7vDS/3RtNFl0z7WVXxbzs7SeHuOIJm3NtGAf4H/tWk4fcK
         xejWjigLEqGztbuRkq7BIA4E1QNP7ZvT47RCfWtBsoOoGR0D3TbUQrioQOChqc2l4gN+
         O/IA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789936204; x=1790541004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UuxmOhA8ouqiNqWUp1uMWZH0rPNr5xGhrrIxVD6hrCI=;
        b=oIrL1bXHKMX04aHiNGiJH/e56gXD+O12PcgLquwiWHhqeWaCqIFoyMf+LbU2lydj5w
         z832voGhgTjKZwbr+h4X37zf5jeYkjBeMsVLEiqMy2cwgf9LnA7rCH6t5JbYWGJ6/wzY
         yHjH8xyQ8msYvDt/+tkK8iEXRb2PfMaSt36F/fKRE+wS/oiYHBCW+oUItdyVMqauCY9u
         1w8iBL1vTsNdaluVS/yO8QFKV/nzOrGkcLd3WZfAJFMtxHmKqCUxcYXJwGPVOfRr9MZX
         ZQyfSkhdu2VLcO9lr3ErDG18hkXLGiUO+pLodJiHvT1+ra9iMwJHwbxkDgXS7RDpOE2+
         3l3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789936204; x=1790541004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UuxmOhA8ouqiNqWUp1uMWZH0rPNr5xGhrrIxVD6hrCI=;
        b=a7PNCuVQMDV24B4PBtFP9IPI0SaHZcjrDl9lVw19AIbG1CD4umlFTPv7LoBt2/5EHQ
         NZVcNqai1f4noZ9KOrjpuCGbxxaqxwD7JFrhpkgnVlgnP9KPjcnxz7BKHz10GFaxPrwT
         iFmLp/IwjMse2zMDryCbtmeNTLOAeqXBhISk6MP4S+9ckFDG8l0cO1JmcK+evb2TvkTD
         ODkPML2bmQjRcauZK4mI7fjv3kdpQJmOuvCBLCaBpmg/eQUDUPmAiF7C3TOB7LzQgsZq
         5wZq2T4WxgBLU4oCbUY3NQ1cRE4jofiJCMtaTazRvoUsweF0LGFKFeNiJKiSKOMBwsoO
         AzlQ==
X-Forwarded-Encrypted: i=1; AKwUvByrTaUwGwFlZJSh/YGvxAmobk1CvGwXvfsuxigZEkoKxFdLpO9p0VxLeBb/59Afg+yiOgyfveAOX74tGqL42eJdxg==@vger.kernel.org
X-Gm-Message-State: AFuF++mnbsuYlhLi8Wcd2NZOmbC1BpzljIWuOqP+k11ExuBNg2D4c/eM
	pkGINcjgqkYIXR0IsnbGr1VplftR5XYtepOJ/13AOadV7PNGe19bHXuAM/pEqs9pN8TU+bzmMBt
	65Y3f/mCy9daE9ritfByQhzA0EWk3Xrc=
X-Gm-Gg: AYBFou36LpzaNaKKiJr5Z0dKvMLYJLK+i3fPv+liMgiMvLEH4unCrsyHlJ3mqVzwZOj
	+KzBner6iZI8K4HLBLAsTjrAeuW9Oa9WrbCTCfoMOoSYZy9f+uofy8gbOdvw+CjTiXSnlFgkYIY
	NKLYGVOesxMKf/3umisnH8uv7v/c8TtPOrUmdFYLgfPqobLlYN7L67LL29cSdlhW2lvfC2cnCsI
	mPLklKoAOHMpvRkbqxKeTL5AdYaro3KkyZ9QfkpoHcm3oeCT/vHuKqHOPVLLtnBcAy1teOvjn3U
	7D2tU4v7Ql7bTJIOHj2Ipc1MrPRiEZtPrt4lBZ/cXL6QppPXvBI4I1k=
X-Received: by 2002:a4a:e90d:0:b0:6c1:c628:b0eb with SMTP id
 006d021491bc7-6ca9aa42453mr7714964eaf.25.1789936203936; Sun, 20 Sep 2026
 13:30:03 -0700 (PDT)
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
 <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com> <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
In-Reply-To: <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 20 Sep 2026 15:29:52 -0500
X-Gm-Features: AcwNN1X2qy6MS-yGKrhegqKCGov0t4f4n69tP_xaTdZNakOH5Wrlld7udUuHwIU
Message-ID: <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
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

On Sat, Sep 19, 2026 at 3:40=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:

>
> Imagine we have three clocks: They are: "clk_i2c1", "clk_i2c2", and
> "clk_spi". The "clk_i2c1" needs to be turned on when we're going to
> start an I2C transfer on I2C bus 1. "clk_i2c2" is the same but for the
> I2C bus 2. "clk_spi" needs to be turned on when we want to start a a
> SPI transfer.
>
clk_prepare() is allowed to sleep, so any path, that includes the
call, can not be expected to have low or even deterministic latency.


> In the i2c/spi drivers, we've got "clk_prepare(clk)" calls to turn on
> the clocks. The three clocks are operated independently by their
> respective users. An I2C or SPI transfer may take place at any time.
> The I2C and SPI drivers need to know for sure when the clock has
> finished enabling because as soon as the clk_prepare() calls return
> they will start transferring.
>
> All three clocks are backed by a single clock driver. We'll call it
> the "clk_mailbox" driver. The "clk_mailbox" driver takes the request
> to turn on the clock and encodes it as a mailbox message to a remote
> processor. Let's imagine that the mailbox message looks like a 2-word
> transfer. The first word contains a 0 or a 1 for enable/disable and
> the second word contains the ID of the clock: 0 for "clk_i2c1", 1 for
> "clk_i2c2", and 2 for "clk_i3c3".
>
> Now, imagine that we want to turn on all three clocks simultaneously.

Why? (not that it can't be done) I2C and SPI clients run independent
of each other.


> The "clk_mailbox" driver will see 3 calls to turn on the clocks and it
> needs to convert those to messages to send the remote processor. It
> will then call mbox_send_message() to queue those messages with the
> mailbox controller. In other words, we'll see these three calls happen
> nearly simultaneously:
>
> mbox_send_message(chan, &{0x1, 0x0});
> mbox_send_message(chan, &{0x1, 0x1});
> mbox_send_message(chan, &{0x1, 0x2});
>
> The LGA mailbox controller knows "txdone". That is, when the remote
> processor "acks" a message, the LGA mailbox controller can tell (and
> get an interrupt). This "ack" signals that the clock has finished
> enabling. This means that the "clk_mailbox" cannot run the state
> machine and it can't call "txdone" itself.
>
> Without my patches, when the above 3 mbox_send_message() calls are
> made, the first one will go straight to the LGA mailbox controller and
> the second two will be queued up. Once the "txdone" for the first
> message arrives, we'll queue the second message. Once the "txdone" for
> the second message arrives, we'll queue the third message. This means
> that the messages are not being processed simultaneously. The third
> clk_prepare() call will be processed much more slowly since it has to
> wait in line. If we had 10 clocks enabling at the same time, the 10th
> clock could have a pretty significant wait.
>
> With my patches, the LGA mailbox controller is given the second and
> third message even though the first message isn't done yet. The LGA
> mailbox controller can queue the second and third messages even though
> the txdone for the first message hasn't arrived yet. If things are
> fast enough, all three messages can be queued up before the remote
> processor has even started processing the first one. The remote
> processor can process all three messages concurrently and acknowledge
> all three at once. The LGA mailbox controller can get a single
> interrupt representing all three "txdone" ACKs and call "txdone" for
> all three messages simultaneously.
>
If your remote (host) can actually act on multiple requests parallely,
you need a way to map ACKs back onto the requests. Currently you
don't.
Looking at the goog_mba_handle_tx_interrupt() implementation, consider
the situation when 5 requests are submitted in the h/w fifo and 3 are
reported ACKed by the interrupt after some time.
You assume the three done are the first three -- which implies that
the remote handles requests in the order they arrive i.e, serially.
Otherwise, say, request-1 may be wrongly completed if the ACKs were
for requests 2, 3 & 4.
So it seems mostly an illusion of parallelism - remote is acting on
requests (or atleast sending ACKs) serially. We can keep the core
unchanged and the driver much simpler if we simply use the buffering
in the core.

Regards,
Jassi
