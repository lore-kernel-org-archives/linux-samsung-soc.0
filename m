Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/CiEJ6Z"
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E3F126
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2023 01:24:35 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-462e70f1c20so1196773137.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2023 01:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702286674; x=1702891474; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ioYDubYP3iKfHKMHSy5gra3AJi2J9HK+LXY7uK+G2MA=;
        b=W/CiEJ6Zrane0oOjE//4FGj+YzLPdrKB2GGEh0/4qccXwnJPHTc2FRUqAZ9euJ8Vzz
         PsymlVpHxUW0Jg+3GeXkEYPaIO9cN5k7ebupTeRd67qS8LRJ0ayHcYNUqncJqkP9NRgU
         c4RMyWxrbOBFiJV+e2Zo2IJZocsJgFB/ioo4DQhqoEEmEPmDU/twikraVG553CPIeQQa
         ZhWIvzOfZPEXnxbfRNfAKhvn8N5sJxwrCXDrZjtVenGE0DYFMj7gz2PmfcbCzcuz7uoZ
         zTNp/zaZgfl2ZrxAya4f1llynoJgQ7yAzDqiKaRRoBjJT4QxeaEi/Vguc+rHSYYbwHIA
         0JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702286674; x=1702891474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioYDubYP3iKfHKMHSy5gra3AJi2J9HK+LXY7uK+G2MA=;
        b=lu0n7KiLAsirHUVo4Bmgg3AXcQ9c2uhAAWsqJ2971UxLagBY0CH6dFJae8OTbKBoVL
         v6zhuDdP/mgy+GkK/lLOFHJ+9usAWi12U2yhuTZurB31QU8g737Ta9mqrI909fiC4Jj8
         uR9uwDcOPLA+JlCCff+Rp+IL+txcyllKsRj8QdkfxB78NTAbg2T/jjnUDI+ul9ct8185
         uC/Vpao9v1hV9I1Wio9OypPYyKzXKIwavkMj3Nv+L6H5mfpQxRspLLjoanHqLidDukpc
         mhgQpDcjSO9D1aGUCaKiA46//GLNgQfW9EgbgplHlfsOkQ6rC++7NY/Kdi41fNWTYTkU
         TrsQ==
X-Gm-Message-State: AOJu0YwiB2JoJmfanX0KXKzizRJlVXwIGjasH2C2cbJE60Lxgi6xrZ45
	VcwyNW3/+tuCteU1X8h6nmT/ETPA4cO9ZqQTUY8+jA==
X-Google-Smtp-Source: AGHT+IFmqVBB1S6PPILmZng6sUl4gnE7B/ENtukMPc8F2U+pjJRlhmvt8Xvk382O4/Rc8AUY2sPYgeEL53IrvFfBTZs=
X-Received: by 2002:a05:6102:3e90:b0:464:82c0:7ed9 with SMTP id
 m16-20020a0561023e9000b0046482c07ed9mr2131634vsv.20.1702286674338; Mon, 11
 Dec 2023 01:24:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-5-peter.griffin@linaro.org> <e70d516d-db24-4d79-bbd8-bb5b497a4391@linaro.org>
In-Reply-To: <e70d516d-db24-4d79-bbd8-bb5b497a4391@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 11 Dec 2023 09:24:22 +0000
Message-ID: <CADrjBPrhO42-7TY0iNuRcyWj_YUwpNMWROY_6waLoVtmp7uwrg@mail.gmail.com>
Subject: Re: [PATCH v6 04/20] dt-bindings: watchdog: Document Google gs101
 watchdog bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Sun, 10 Dec 2023 at 14:23, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2023 00:30, Peter Griffin wrote:
> > Add the "google,gs101-wdt" compatible to the dt-schema documentation.
> >
> > gs101 SoC has two CPU clusters and each cluster has its own dedicated
> > watchdog timer (similar to exynos850 and exynosautov9 SoCs).
> >
> > These WDT instances are controlled using different bits in PMU
> > registers.
> >
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../devicetree/bindings/watchdog/samsung-wdt.yaml         | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > index 8fb6656ba0c2..57468c2c5ece 100644
> > --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > @@ -17,6 +17,7 @@ description: |+
> >  properties:
> >    compatible:
> >      enum:
> > +      - google,gs101-wdt                      # for Google gs101
>
> I think you did not rebase on linux-next. The hunk differs.

It was re-based off 'next-20231130'. I will re-base off the current
day's linux-next for v7.

Thanks,

Peter.
