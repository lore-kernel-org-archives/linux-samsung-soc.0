Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kuDwZIAS"
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E63B2D61
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2023 13:36:05 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5c21e185df5so4335632a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2023 13:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701207365; x=1701812165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTVlLTZZmikOeFqoqYLREHBTF55+gG2wuAmC6HPrHN4=;
        b=kuDwZIASyagCsGZh2bDS2mH2gp0JyH33VXzAd9Rm35vw2Ra5iIGviyl+nJZvg7oHVg
         kN2ccJKravFu28T/akIlvY2W9+Ag1AETWWBSP6gg3B7HC8JRt4/THHUXANXZJYedS53R
         cx4MBxmEpR821F4t1/DmZzOyVAYbxxBQvKGwbwPI6B+YJQiShzoffkyHskkRlSSmp5PK
         alIirvakrTNByJ0sLqMwC5WOq2TmE27QQYpizSznyZ8+CKLvHRzWWoX3msnQWZR02JOZ
         0NlA+jrfoCTW6Y3ULy0bxebdmJYzOlxP+cCYWvPiGSUer2QtB9N2vCRqNSp2HvfHg+Gu
         bkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701207365; x=1701812165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTVlLTZZmikOeFqoqYLREHBTF55+gG2wuAmC6HPrHN4=;
        b=vKwZOdQWm/9GAz+xup56G0VdmaV3bx/nuvBqX74zjxo3CULyKWGI2sIHYML1hGRpzz
         o0DW+XVY7g2tE9uLYoaulZMzmCQ8p8R5WcFsA/kr1/CKtSH+fDLAaunKHc48d2Dn9pSK
         VoNKzgvMa3+eIvl4q1sGUDQOlsQtSv0zlCZVFzs4JWPDosOu03G0wL2rMunJXulPnK4t
         YcM0RLNcLVsm1pbNg1MK7z2tTOpNWD8v97zXpimhrKTcujGMkHq+cvDzBsynLzTtmivd
         kNKem5JgfJLwjvbMLBOvRQk2Ky5ouZUqoTMNbpDCn8BNW1cl5sNnWlOdaGVXHTgp43np
         YH5w==
X-Gm-Message-State: AOJu0YzcvRVY2tyZpg7BXVbuDjjdTvUw/G+eaoesHWuLvP2qK7J/o3XH
	OOP4aU//0RmbIGmDZQVx709zvJzjVlcgtVibpjXIHQ==
X-Google-Smtp-Source: AGHT+IHnu+R39CMW8bY/8u262kP5zKg3VQ/mjN6LJEe4dATUMhYEKF46M96JeCHr013bip0jw7vCgK8zjEoEnqa15VE=
X-Received: by 2002:a17:90b:390d:b0:285:da91:69a2 with SMTP id
 ob13-20020a17090b390d00b00285da9169a2mr7861663pjb.31.1701207364753; Tue, 28
 Nov 2023 13:36:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20231126091120epcas2p4a1320e3b0f9be8f8a0f575a322981d38@epcas2p4.samsung.com>
 <20231126094618.2545116-1-youngmin.nam@samsung.com> <bb738a6b-815d-4fad-b73f-559f1ba8cd68@linaro.org>
 <ZWU75VtJ/mXpMyQr@perf> <1fd55b36-0837-4bf7-9fde-e573d6cb214a@linaro.org>
In-Reply-To: <1fd55b36-0837-4bf7-9fde-e573d6cb214a@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 28 Nov 2023 15:35:53 -0600
Message-ID: <CAPLW+4n0SAOTb6wocY-WjkxgSFMbx+nVuqdaPcNYVDsbfg+EfA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: samsung: add irq_set_affinity() for non wake
 up external gpio interrupt
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 1:29=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/11/2023 02:01, Youngmin Nam wrote:
> > On Mon, Nov 27, 2023 at 10:54:56AM +0100, Krzysztof Kozlowski wrote:
> >> On 26/11/2023 10:46, Youngmin Nam wrote:
> >>> To support affinity setting for non wake up external gpio interrupt,
> >>> add irq_set_affinity callback using irq number from pinctrl driver da=
ta.
> >>>
> >>> Before this patch, changing the irq affinity of gpio interrupt is not=
 possible:
> >>>
> >>>     # cat /proc/irq/418/smp_affinity
> >>>     3ff
> >>>     # echo 00f > /proc/irq/418/smp_affinity
> >>
> >> Does this command succeed on your board?
> >>
> > Yes.
>
> Hm, fails all the time one mine.
>

I tried to test this patch on E850-96, and an attempt to write into
smp_affinity (for some GPIO irq) also fails for me:

    # echo f0 > smp_affinity
    -bash: echo: write error: Input/output error

When I add some pr_err() to exynos_irq_set_affinity(), I can't see
those printed in dmesg. So I guess exynos_irq_set_affinity() doesn't
get called at all. So the error probably happens before
.irq_set_affinity callback gets called.

Youngmin, can you please try and test this patch on E850-96? This
board is already supported in upstream kernel. For example you can use
"Volume Up" interrupt for the test, which is GPIO irq.

> >
> >>>     # cat /proc/irq/418/smp_affinity
> >>>     3ff
> >>>     # cat /proc/interrupts
> >>>                CPU0       CPU1       CPU2       CPU3    ...
> >>>     418:       3631          0          0          0    ...
> >>>
> >>> With this patch applied, it's possible to change irq affinity of gpio=
 interrupt:
> >>
> >> ...
> >>
> >> On which board did you test it?
> >>
> >>
> > I tested on S5E9945 ERD(Exynos Reference Development) board.
>
> There is no such board upstream. How can we reproduce this issue? I am
> afraid we cannot test neither the bug nor the fix.
>
> >
> >>> +   if (parent)
> >>> +           return parent->chip->irq_set_affinity(parent, dest, force=
);
> >>> +
> >>
> >> I think there is a  helper for it: irq_chip_set_affinity_parent().
> >>
> >>
> >
> > The irq_chip_set_affinity_parent() requires parent_data of irq_data.
>
> Hm, so now I wonder why do we not have parent_data...
>
> > But when I tested as below, exynos's irqd->parent_data was null.
> > So we should use irqchip's affinity function instead of the helper func=
tion.
> >
>
>
>
> Best regards,
> Krzysztof
>
