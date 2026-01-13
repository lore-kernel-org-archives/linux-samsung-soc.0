Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822363876C1
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 09:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295652; cv=none; b=UOMG6EbXB2FXO/LrGdpoxEkYtw8SvoNK0i3AlgTozK7V0hwbZiGFrJGzg9U/v8nxJWja21lqtlz2Bn4ZK6qhZzvWihb95AaAf2P3bsOg3YwS0cP4Xq40fQmBfkv/8wwK9gIEpdppKI3I4J7zO/cfyR++de4FVnwcfTmDIszFqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295652; c=relaxed/simple;
	bh=xqGpVB7r89YsbJUHXZJjT54kH83zTdXiwx5zs/NAmxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iVovdZHs411SIOhOtPGSmiFfTbtikB4kPfqMVtAjenad9BrYA48MvjgYhT8HZ44AakHR6w+SieXrtN70uv7r26JwONRlTAHW6wS0a3Qe1nTx4DVf3fJ0fIo4XRN8ajiQ9AM1/J4iwC38/C8xI7WdF/9K5mqOr1wS4wHP5eu36OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AHu5DkFt; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AHu5DkFt"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so12380438a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 01:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768295647; x=1768900447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn5NX0zVHIadFPbViV8yMvWD/kdQPjminzNjM4/y1Bk=;
        b=AHu5DkFtrB5y5doJltu1DuEV7iX0jCJ2eB3NoH3VI3UpLMgP79e+Dwn740++a5A8RQ
         d1o3my1h5U0p2BSQRW3PWeUcPaFidmWGeYDp6Rkroo4rZI5qCH5mb/8H9ZC6cE7P3Pme
         sUwo2AS4YlXe7eVM9QkJ+/qKTcjlBt5bEtF2T6KpBFbu+cAte+fwi/e9Z3zBVIagpJHq
         ptw+j1pwH2deF4XQknX5jcX+04Qu9qNJVPsybw85UPzcrAM+w75pBJ9FW/mtazH7IYlo
         ACxzjY1pTDtMFKSP3p9tavM+fG3Q5z+vXdpDp1nFRsfFsQ7ryv/qhwZheE3n8GzOv0lx
         idNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295647; x=1768900447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bn5NX0zVHIadFPbViV8yMvWD/kdQPjminzNjM4/y1Bk=;
        b=B2mFh6ISpnOf4XVRTWCbRHhMmci32r/l4xe8Xl1xw2jyBX/pFMxkGP+j9Ta77O7vBg
         KG3ktguyg0ZHuYxCAglqTYWrwYc8PaoWix++M/pVTJWpA3x6ccw3ExrlMN3ywFbogHCB
         c17C6VJk13BJXrAjuUZLTJ3xrWIhYNUeIkyKOUsR+lFK26dyDknEDvVRhDHmay8RD5Q3
         97m+bhYTnS+nVe6OQPn6Oin3jkXaCCnXg9qxeQLHJEDtKxcXzdUqD5jM3XQAOQ8UMXpp
         9B3X5D9lsA39dcqdcm65wIvvaxrohl9Sh5C2ciIn6L34eKCIfClSmhmbgXtgz6YUnraf
         Cvqg==
X-Forwarded-Encrypted: i=1; AJvYcCVvlkBxgiof9PXJqLuB/V6IbXt0dOHERy1XFlGy8AtS6mzY1euK5pgGyxgSoOrrkt3O/e36SRkLTbnbFgfV1PEvDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRwzfrAnSgr56WRXeI32b1fGf8Ec5N8qxnbN5NJcIENccI2r29
	D+/WlW+viDz0+j0IbNbNAA74aBIJTQ38Nd6IAl8XIvCfrZbHtLjFwdaHvwOBZAHHl5Zcz3Nbfsi
	idAk1SHE360icwm9LYJ6M/pd/jPrN6jx3Vi76yVu0tg==
X-Gm-Gg: AY/fxX5+VR4V2y0V+/BlzrycxI23NDBmvbxamD37IVYoX0Pv9CNE9tOP2kAuHiFb3F1
	Cvrg7i5jY2SpaY4s+qXUUjy/uu4xuCNByuudyCNNlp+Goql80NQA344Ho5cXtav3z1eYFfm11wN
	lcZsZP3Np6YVqm/aC8Ob3HtH0snGeX6fBSRID57S9nXHfO23VjAClVnJLTlSDnbAUXmuoG1yS3t
	zpRZ0URMvdezJXgXqQhRZCQXVJ+xY0vvK3oz3bX/H70evIVYpY09zlQV319gKEByJa0p8X51mdn
	ygJIgHp0Bed78r4tC+v9DLBOFwqktiSaYx2eIqQ=
X-Google-Smtp-Source: AGHT+IF/uMz8MYijvgNH6EAmeQTRc6aRXVQ6Ac2y4GTApWuNrbNhRowJgw1xPnWbWQMx4L4kzhRYmGW628wrmJp9buE=
X-Received: by 2002:a05:6402:524c:b0:647:9380:103c with SMTP id
 4fb4d7f45d1cf-65097df5672mr20320306a12.13.1768295646934; Tue, 13 Jan 2026
 01:14:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
 <20260112-dpu-clocks-v2-1-bd00903fdeb9@linaro.org> <ba585515010ab9a9b417d000ba744f8178ca9e24.camel@linaro.org>
In-Reply-To: <ba585515010ab9a9b417d000ba744f8178ca9e24.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 09:13:55 +0000
X-Gm-Features: AZwV_QjDqNTFOct4T-rP7w13f_DSbKkRMZMwlRNVBJ9q5uu_3B70MKV9_itceMo
Message-ID: <CADrjBPomC-QaL8aR4QsEPm+Uu5_QoWQZUomLMZt+09-ywH3wjA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: google,gs101-clock: fix
 alphanumeric ordering
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com, 
	Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
	Doug Anderson <dianders@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Mon, 12 Jan 2026 at 14:26, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> > Fix the places that don't have correct alphanumeric ordering. This will
> > make reasoning about where to add future entries more straightforward.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 6 ++=
+---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock=
.yaml b/Documentation/devicetree/bindings/clock/google,gs101-
> > clock.yaml
> > index 09e679c1a9def03d53b8b493929911ea902a1763..a8176687bb773ae90800b9c=
256bcccebfdef2e49 100644
> > --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > @@ -27,13 +27,13 @@ description: |
> >  properties:
> >    compatible:
> >      enum:
> > -      - google,gs101-cmu-top
> >        - google,gs101-cmu-apm
> > -      - google,gs101-cmu-misc
> >        - google,gs101-cmu-hsi0
> >        - google,gs101-cmu-hsi2
> > +      - google,gs101-cmu-misc
> >        - google,gs101-cmu-peric0
> >        - google,gs101-cmu-peric1
> > +      - google,gs101-cmu-top
>
> If we keep 'top' at the top as one outlier, it'd reflect that it is the
> top unit and all other CMUs are children of it.

Thanks for the review. I opted to just keep it alphanumeric so it's
(hopefully) obvious what all future ordering should be.

>
> >
> >    clocks:
> >      minItems: 1
> > @@ -70,8 +70,8 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > -              - google,gs101-cmu-top
> >                - google,gs101-cmu-apm
> > +              - google,gs101-cmu-top
>
> And here.
>
> Either way, I don't mind:
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

regards,

Peter
