Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CF123E330
	for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Sep 2026 23:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788910326; cv=pass; b=bB0VJ7O04JmOObqkfbNXCawLSsXQ0pAi5Mo9vR5yzvmYv9Gxzls4uJUKdqqSX34b1glw/Vm3VBNhIWWROmKDqHgHFmcf2yePzu6jsuqHcaSmPkgwbinADKEANrGmtWE1NOpLDNZ1AlxLyGutH1naQwp43Pn/Rt82/y3kLEy97/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788910326; c=relaxed/simple;
	bh=pLxPncky5zvsWZOTFKe5A+fK/mnU9up8jT15KYFF6dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O1N5j1M+l8IO9ViHMXpmYEHfG08pc6uw39YFJEUwsVhtQeWpgaeawX1FoAtNr+XMpn8tXyKnSvTpVBPFaYwAXb6GIw/vZKvjVaXNj0eF+RUZXu6kkZiHWbEg54IMc1uSZl5RD/Lm8yilMXRr/LSCSAm2+Q4Q0n4lw9YKxk5DcBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TQw3aIJ2; arc=pass smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TQw3aIJ2"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4a46a53abc9so4166864b6e.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Sep 2026 16:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788910323; cv=none;
        d=google.com; s=arc-20260327;
        b=HuvDxI4W2L+sMwejk2v3I5Uf0wlGJmdmw7ZDX84qqwtaGf3seR8W2CmNMJcbwI8ERK
         d7+SxxbLlOK1De6i4qxbELD0Lt9TUfKBEQ/410zmsawbt6re46P8udOybIZ2jkIzgFzK
         qmvUPOf3uULNUhVyE5ija20SXiGYJ2J5lHnf5N1KpgFZ0CovejSo+U+ZzWLNzpg8tHtF
         WeKkmV1vl31UX+omZuLUP69TPuUxt6rVxNYlgyHdP+CoI6TnlOK20D2rTZBZwIGPaTAp
         a9dcu/VO6ynJG9L89QYTNInCM8xoZ42ckE7ufrKc+W/x2nGcNTH/DTISaSzT+Hy9ZmxL
         hRTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7+3nLzSILAYs3qmpLkeoZcGFoXxWf/bBrMplbZ8qrRk=;
        fh=3Q1WaxRJ7ORKwbr5DXfakd+a+UePzDDl5sidorecRRA=;
        b=JVFJSmynET4yPRVZMkePMJiNJpOptxxpWr9+nzYPWouOvYuML7oZhkBvc6QAfMQ9Sv
         H640NTslhyeI46sNNi/1au2TrS/ArioZ7Eg+0PoNR9SlJTu7627oQZEGFay6cEBnw5c/
         a2uhd0yIAMiREDWRzc+e7K1j3YbTZKLUWl5/deKAO+bmFZXcuFPykFasmAx9ZAAxX8e8
         q7rc2IwvHaKuNbMbMyroK2mMOGxcfLGsUGp8sxNRwJwzna5v1tBpZTb2lfr4/7glbinX
         H9SJH9B+My5Nr7LTQU8t03jH8RrNUe6vJEwP32GyoiuX17yvohoP7QM4g+kApIPaC5B3
         kHnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788910323; x=1789515123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+3nLzSILAYs3qmpLkeoZcGFoXxWf/bBrMplbZ8qrRk=;
        b=TQw3aIJ2GQiXqCtRGlXmZqNBGNC5ojuHadlBGh80a5FD2j8d7ORLzQ4vJq1uDCx7TX
         qiddYpqX9RiRnAuDkktfmt8ZqmMnl3WMQR9MnU+PWyVmbJFx6bs3Daej2B9P44n/Ic8i
         ZKkU3XRcF4LCHl6KIUk0u8GjPP42YXNSyXyMeAZIB1t46LibkCQe4K/bRXiTO78YiaFO
         KBHYMhkPMzP3h+aJzTesLPvoCMtrD9bdtEhz5I68xANwOk7sI0knCwe+qacBL/QccJkp
         +Qhzh9nkmSmUcjTQfGlfSkhiuxOGyRQWcmwhUG67hAG3JvuEM7D37wK1uQUhtobVr39s
         oEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788910323; x=1789515123;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+3nLzSILAYs3qmpLkeoZcGFoXxWf/bBrMplbZ8qrRk=;
        b=EQg4U6f77REpFgvcLy5oqr8AIz5B+IhsnfDGBGG9kHfbpNaKivFFFSHj9fV22TiuVu
         h3czLUC//Bm8b81rg7PDIddHx4oOQvWOxHtN0WN86GhBZ9FvHEqHDKTBVuzzmyf846Ol
         Bji82+maXROhOruGD7LtzGuWfnwl5n2mfjNJz0/qeibysylRWCnU9h5FJjWVZBSLOlnq
         FtIT3/ZCc4syOTguZB5VJkggx55UZuKEzd5GyYoWsVLUjklq3V4XF7TUW0tK+jk8E5Mh
         BKd7V36T5M9ZnXPuRTcEhFfpVGe5WnxHfsda7dH75A+cUiUgRPtD61v7mrj4Ij/ttqf/
         1zdg==
X-Forwarded-Encrypted: i=1; AKwUvBx+yjahkot2NO78xLOfqv8d5tENvHY6D3vvDUoM2gDBbWIcS7HRHsXsPIgK5NKP8hrlU08gr9PwWbx0B5TgGoSpYA==@vger.kernel.org
X-Gm-Message-State: AFuF++kkROPCUvRqy2rFoa5MlKjD1CHbAAp1R1Wc3AxHUZByMNOwm0sh
	Y4Ylhn+BkAi7JTps8mXputgIh/Clq9KEW7QwXU58m0ySTUlLMrYPLekBcHI9/VPFxxBk1vd7xON
	9BoxTyXgKwVjfxeh32787oi8JTBKud3zefg70NiepFcYvwL95IlAsbbsAoAo=
X-Gm-Gg: AYBFou1FIrGqwMQ3ruGmIu2i7bFHAh8MtxFnalv6X8xVq7dfWkwDmSet+JY/F8P0NAd
	SdjJTF6iXGSkpNJVamkkjz1uug98nWkcjlb4fMWrii3t5M6cWMOR7lPeWpyIY4arloTvYeV41nf
	y003mEoPsSmmltAR8oQksVveD3JMOenc0m61v92MpKOvHeCfV9uDQMQF3U8cRBoz2Z/IfBivblw
	WtlGI7XtLMmF5Prnj3aa/NL8a6XWhfxJUh4EczFbWXmAhayNe6T1G/xP8lCUYBPVCRkG+Gqnp2h
	nDyaLWYKTYSTkjsbSeXBlV/9ZZOUtWVvCO/wlXtvz9MM0IonSrBO+IJZKCg9NszDO0W6ODD7Ald
	jCv/eMet3mWI=
X-Received: by 2002:a05:6820:4b85:b0:6b8:319b:9e1f with SMTP id
 006d021491bc7-6b8319b9e9cmr15317381eaf.5.1788910322806; Tue, 08 Sep 2026
 16:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710172946.15633-2-rdbabiera@google.com> <ao3d2TlIRqxbz4WP@google.com>
In-Reply-To: <ao3d2TlIRqxbz4WP@google.com>
From: RD Babiera <rdbabiera@google.com>
Date: Tue, 8 Sep 2026 16:31:51 -0700
X-Gm-Features: AcwNN1Xw1Y5ryO3wQ35hV6_NmfuyHI7Zbl4nz0Z-Sqsiz6v2x3IDE9LAtXts248
Message-ID: <CALzBnUF14HuRhAObW+HXbaWYpPYzqG_Tt0rrm1nF2OW1T1OSqg@mail.gmail.com>
Subject: Re: [PATCH v6] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
To: Neill Kapron <nkapron@google.com>
Cc: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de, neil.armstrong@linaro.org, 
	badhri@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neill, thanks for taking a look. Sorry for the delay here, the feedback
arrived right before I had left for vacation so I wanted to make sure I had
proper time to look at it:

On Tue, Aug 25, 2026 at 11:24=E2=80=AFAM Neill Kapron <nkapron@google.com> =
wrote:

> Do we really need a 2.5s timeout?

2.5s is actually the hardware default for this transaction, which I agree i=
s
unnecessarily long=E2=80=94I set it here for correctness. We use software p=
olling
instead of the hardware interrupt, and in the product's lifetime 100ms is
more than enough time for the ACK signal to arrive. I'll update the next
patch version to use this value. I'll also program
TCA_CTRLSYNCMODE_CFG1.xa_timeout_val to match the SW
poll timeout so we don't let the operation hang on the PHY when SW
finishes its poll.

> The dev_* calls throughout this patch should have trailing newline
> characters.

Thanks for the heads-up, I will add them.

> > +
> > +     pm_runtime_put_autosuspend(gphy->dev);
>
> Here you are using the _autosuspend variant, but autosuspend is never
> configured in probe(). Should this be changed to the plain
> pm_runtime_put(), or actually enable autosuspend in the probe function?
>
> > +
> > +     return ret;
> >  }

That's fair, I'll commit to pm_runtime_put() here given we don't implement
suspend/resume on the PHY itself.

> I think prior to this we should add a check if phy_state is
> COMBO_PHY_IDLE, return an error and change this check to phy_state =3D=3D
> COMBO_PHY_INIT_DONE to make sure we are explicit in our state handling
> to prevent issues with any potential refactoring.

Makes sense to me, this will also allow power_on to only run once in the
PHY init/exit lifetime as well.

Best,
RD
