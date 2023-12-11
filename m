Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GLWdKz+4"
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0DBBEB
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2023 01:18:04 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-677fba00a49so33949396d6.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2023 01:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702286284; x=1702891084; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/z0fIrgey0ax47ogB/tuo0R84muzHuQ+ydDig5s54Lc=;
        b=GLWdKz+4fg8mPDx1ELnuojeEe2T/1XyB36ZvIENuMsR3fCl7ln+rr+pUXcPb2VFVbW
         sPIw76ndiczt/NSqQ6/l81FNJwxsmSQbIzbgsnGG8kdAZndJRpYXnKH/S1Ej99Yu6koY
         gPYg/BB8EdJL/2JP1yMVLRaRulrNnBlK95L1XMF8SDIdVaQgYQ4I6TScanJ3XCzTsD6M
         Jgh39J/dsNCzJ7FmG8n7AwVvvQmP1igOzbuEvsKCkXtXO9ydm1bsBxyJ6SaD+Re4u7ac
         wnwNX6eyjiVT55sw6buh6HQWTPf5k1QiXf4vxFLAXcSkDHdpnzyCoNVYfX6xlPptDYMB
         SuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702286284; x=1702891084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/z0fIrgey0ax47ogB/tuo0R84muzHuQ+ydDig5s54Lc=;
        b=lUXhEmOhTkVWnqSSF1o/bGQKx0wT0trGjoM6xHYL15n3Ix32X/g5BI2zE2B6imA7xl
         wnUUvNyOda/hVlc5ejGtwQexOmneRMa09+b2fihnBswBIdqEgN4LQNfnbeW7pdKcqr5B
         7wGRatWN/JKvaj/IaUFr5SIex+qYDPDehkzCfifnX+ruetxeAzpQT6+Tl9Fo7JhXp1H7
         1VxGONbExy7X7HFaa+bLJ9+SPvbnBgp7OXYc5P7ud288Vc+z2zkPsbZ3nT+0kLsm1vLN
         8i7d+3R1YMWOzmmPM4okRfbyOpKba4jL6B7emaxLniIRSnQmBQzDm8I+ulJlrO/jcpuo
         zBmA==
X-Gm-Message-State: AOJu0Yx0IU8ZrZHPAbvEY/xqQ86Rufoxv3kTksox8a7xhse5n3Wvbmfx
	TEjB8JYyj/FmJgnZHSI8YsxaGyvwLF8KohpKTxxzsw==
X-Google-Smtp-Source: AGHT+IF2FD/yZWTaJspuz2ZkGnHtLmu9yc29fMOCKmFWdGSQxO5eLtwgHWeyaAYDFzw+Ks+VHIEsnPYl7wNEw90Fzik=
X-Received: by 2002:ad4:5dec:0:b0:67a:568e:5b10 with SMTP id
 jn12-20020ad45dec000000b0067a568e5b10mr7473425qvb.20.1702286284034; Mon, 11
 Dec 2023 01:18:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-4-peter.griffin@linaro.org> <c2244932-cb2f-423a-bbe6-9ab2b08b9d63@linaro.org>
In-Reply-To: <c2244932-cb2f-423a-bbe6-9ab2b08b9d63@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 11 Dec 2023 09:17:53 +0000
Message-ID: <CADrjBPpd5mT6SZyPEgxFGy18pr5Gypcwv7aoG4R978d__Pk3LA@mail.gmail.com>
Subject: Re: [PATCH v6 03/20] dt-bindings: soc: google: exynos-sysreg: add
 dedicated SYSREG compatibles to GS101
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

On Sun, 10 Dec 2023 at 13:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2023 00:30, Peter Griffin wrote:
> > GS101 has three different SYSREG controllers, add dedicated
> > compatibles for them to the documentation.
> >
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > index 2de4301a467d..127f4ffde76a 100644
> > --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > @@ -22,6 +22,12 @@ properties:
> >                - tesla,fsd-fsys1-sysreg
> >                - tesla,fsd-peric-sysreg
> >            - const: syscon
> > +      - items:
> > +          - enum:
> > +              - google,gs101-apm-sysreg
> > +              - google,gs101-peric0-sysreg
> > +              - google,gs101-peric1-sysreg
>
> This should be part of the first enum. No need for new list for every
> new SoC. I'll fix it while applying.

Noted, thanks!

Peter
