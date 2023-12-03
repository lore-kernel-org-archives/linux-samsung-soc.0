Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QxdzWdj2"
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ABF7D6
	for <linux-samsung-soc@vger.kernel.org>; Sun,  3 Dec 2023 13:21:26 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-58d7d58ab7fso2414263eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Dec 2023 13:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701638485; x=1702243285; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MBALP8YV0QZwaMwdd2KBWcj9Tq1p2Z16LRDLKvabBto=;
        b=QxdzWdj2Adq+1FMGv2/fas25Mr2HqQdqka2/V56PA84tqjM8ns0LpH+We5MkNCIiFD
         GEgtEtz4SdcDeBKq3EmCbft5zlmDS3ofH+iihci1Zzwlh3dCJ7RB4y2Vfk1iM+uiwra9
         M6kIqZDgf3su24XfuYvAnEJ4BbCkWLoar/6US4luXNY+3Ke0vZYB5gqxbzqZi+pWr5L1
         XVRaBYBiSro1MOUN/a04trw5OwjpXmp7GeZAXsXxaw9UqWciP7m9ZTgqb0CUwV29TrTO
         Ni9nxijSfPpwhoC0z2wLerj8X7ZFAptUZNWRAF2gqCerfC/GMb1kn39PVdUDMNH1HR9I
         f6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701638485; x=1702243285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBALP8YV0QZwaMwdd2KBWcj9Tq1p2Z16LRDLKvabBto=;
        b=Ji2/8tg8x0vL8J1/KtbE1nqWmwqLNA660VhNXOYrsA3hAA6Ns84yEDW4sFm5XETYS6
         aIV/AjhEwiPqz2mmdjoOAgar22NliTRH6WPjmIPAyCShoc9HDh50wmjDs7wRnyiTBV9r
         v4jitxoHQwkspNsba3dwgYnE7z2ls9Ob9k+QvtaceycXKj/qWNS7OQqAO/sqZWYYT7C8
         PsjkGIbNM1FV6VUJEtLVuJ/+5jdG6j6aLted0/dMiuqe5enGvcy/FrPVXp0Cd74X50gz
         bZOwE7zqO1i62mZf3pn2O/oMrPEZg5TFWHyn5ZYE1jhV0VJ1vyeHg/N6j4HWruiqghX7
         GBOg==
X-Gm-Message-State: AOJu0YwALi6eEF6RoJggc2xvCC2HxCUZEiOYAyVh/uisFNLWm3dtZ9Xm
	PplvMYspsCF5H7Utg0Ua91lRL35G2w5MEnUs0M3vcw==
X-Google-Smtp-Source: AGHT+IGtekMHkp852JA6RkiudAH5D96Q93RiRqk9YOj5heuqbhP+mmIk3wEQ0uwM4Ob7BzATccUT7+4SnMfM9Ymm5do=
X-Received: by 2002:a05:6358:1206:b0:170:8f0:c6c2 with SMTP id
 h6-20020a056358120600b0017008f0c6c2mr3905258rwi.21.1701638485268; Sun, 03 Dec
 2023 13:21:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-8-peter.griffin@linaro.org> <fedd4ec8-b4e6-472a-9bfd-063ea8b9658e@linaro.org>
In-Reply-To: <fedd4ec8-b4e6-472a-9bfd-063ea8b9658e@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 3 Dec 2023 21:21:14 +0000
Message-ID: <CADrjBPrqWKdhiL8TCcBC3ohLAwrAZiRwtA8Yg0q4gkrf9qrKqw@mail.gmail.com>
Subject: Re: [PATCH v5 07/20] dt-bindings: pinctrl: samsung: add
 gs101-wakeup-eint compatible
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

Thanks for the review.

On Sun, 3 Dec 2023 at 15:11, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/12/2023 17:09, Peter Griffin wrote:
> > gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
> > where more than one pin controller can do external wake-up interrupt.
> > So add a dedicated compatible for it.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> > index 2bafa867aea2..de2209f8ba00 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> > @@ -44,6 +44,7 @@ properties:
> >            - const: samsung,exynos7-wakeup-eint
> >        - items:
> >            - enum:
> > +              - google,gs101-wakeup-eint
> >                - samsung,exynosautov9-wakeup-eint
> >                - samsung,exynosautov920-wakeup-eint
> >            - const: samsung,exynos850-wakeup-eint
> > @@ -111,6 +112,7 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > +              - google,gs101-wakeup-eint
>
> Drop, not needed.

Will fix

Peter.
