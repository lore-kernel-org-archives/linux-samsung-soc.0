Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE9A25B088
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2026 00:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791332852; cv=pass; b=A7gy7nPuNNo9QzxtU4RR0dG3A51+kE1JIXsfJcZSOCFIYVvrEaLxJXljvxvpSTfecUEd5OLa3i6sn9PWvrbdLrXjku7BlyIglBwTPGtPWzpCD/jUG+dGHoI0yU7LRLdLVkrMo969y/Nj+6jRm4cHOvCRAo3+lsHpE4DD/4j/Erc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791332852; c=relaxed/simple;
	bh=Iyuwm3dHCbREroT6zoAZHUTDwbJXCt9kSli+dnbxdL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7HxPSitrSWsxqxcU79HESWhIb9863TQPJ3mzkHY5xPcSA7gF/e3szFR33RP8PTlIz9kM+XxXZAmmtFkDp6+zYQCfcSN2w04cGMy/i86lMe86iSrX5a9kSb3T2WlH0+buxeSeSxRLoZvsGirmlrxUs5tWrA9LMg/LRlA7MbHMuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RWyA3keN; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RWyA3keN"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ac9d666d4eso35546877b3.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Oct 2026 17:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791332848; cv=none;
        d=google.com; s=arc-20260327;
        b=fPQgXzJYZ+J4M0oSB1VJvSTXJyoJPToXYJT46kbrWzLwWx2+w13mjcyzN9eDcSVg2i
         j3e5NUvEtU3ZPzJlCYazLJN7KAsjcXTH42/P06RfSfUnCOSpdBI06JPVXkRkrljS06yt
         xohKnDC03CGCcpI62FEqMja6J6xMxbtmHb/wV0e9AgNK8i6Mue/Hwgi22eecHMlAUjFA
         BsXjMtzPaJCMR6bp/4gYnCkcfDTRWV7fxYQqCJxPNodb6a07SqcAQscM1zjaN37KNCjF
         wM2gCH6jrrY/YpFtmJRRReVlCUcnIcFlu+LnSbQsSlFyYltY7FodcqwV3lCeM73JxHgx
         ZScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ndf5Tbs3jY61Y12tfz+GmUhm79/15f4MrnX2K4zKs/s=;
        fh=fQ6zjcH5HihEJ4DfqIvhNwZ6t3E1kV1wQwcUSMXOiIA=;
        b=N0mpRhaeAzgX+YfHUlc2tckF/raJ+sVdug6PmmWW9NFhg1TOtiZXULyjrATpzXh7Yx
         nnQqcLmFzDevqqKfqlLNdWl+pB8VMGj3LX2Nk25c2wt6l+pAgK/fSSYvHd3/Rii3Fw7G
         EllpQnH8WMKWWc5xQFJDlcES4AwXNmq85TjqadV0f2dgoazInJleJG6K1zB9D7WV6YbG
         ItwXnjh1buG/nM9P07+R+p/zAcUpTmjjquTcFlYrxRIXjVyindvHOvBmroRhGaoyfM2G
         UIjYcQET/ravurEHT0a3qAtMnhY5PawdqzGeDqyfqC3L/6R3VjsK0kOa6X51UYdjKFMS
         NwWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791332848; x=1791937648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ndf5Tbs3jY61Y12tfz+GmUhm79/15f4MrnX2K4zKs/s=;
        b=RWyA3keNYcFZ0fLg6GNdljYNcmn4EIZyqsEJkXNLxb3U6VIWZTTSzT/ori3qQF4Wcg
         neFyVcZ6IuTgbpxON+9IJLplHtzila2+LpVhgAZ11pZLL7yGcVhnaekgp7FHVo4iLz7i
         FdJU0ZQ2J544jgtgy9TVGygU1YOoBGK2RFDelHSFcZmbf146Le92btzZWR0bKv7PpPH3
         I0ro5biYBNDZZo1S5j8zftTmJM5zQ8JsNF7DKwMfYsxX0Zt9f9wdCSboV6FDYdA23mVR
         xfrtxIECsJspouA4735WNm5yu2MAER/jAfzmkRxi6eue3ddI4FkwQI0QOYSJD8KgG56E
         /NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791332848; x=1791937648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndf5Tbs3jY61Y12tfz+GmUhm79/15f4MrnX2K4zKs/s=;
        b=YMUysHHPGLrt89sEHsed20J12PUC2vKxI7ssP4B02ANyRWrnikDCo6KaZfiyMiAF78
         +Dr1NAGYaLMk6v7Y123HhPWbPsVp4KkcdA/LcIW3DZm47BTxSQw3qEbpFGhWrN5nC6F0
         6F5FfpmNYd4b2nRnEo20S1EtjsfxD271UNoyiD8dUqMm+q7DPiqCl7W5Jta11G7xKFTj
         skDHwpXK3IueufES4QHaweaFXUA5ZOC9C+8K5yuHF2VjevzYfA0It0Kn89LerM2DIF0E
         uh77U6kdNWPmfa5tmJy81oBDlzCqXSl4Re1eUtr4IKBqrD/dotaawXUoS5VLgh8ivjYN
         0GWQ==
X-Forwarded-Encrypted: i=1; AKwUvByhugl2ZAYBkTOU0pYZ7T4pvMViguiytE25VgyqEwis1vqX3xxF7U953Y49QDt0aNONACx5uIKRnd4/kZRtkfoa1Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKgKCraZcwJJ7dWZs3m3qggJEiz7uSATrpf3YUfXYwCaMLRypkN
	deydrMlU+DYTt+KuKd7j7KfXK9NAscWHfESYERxHVkKZacgdN+6J5/VkTj+Q0rnooMZr3F6F7Q7
	fxTa2SkD1LiR7TYdYTDSCCiPvictPIx5OVxd9eRdx9Q==
X-Gm-Gg: AYBFou2HwlLOuh8gPccJMFyLggp+DSrvn1P4JeANG4/cG6qzvyuonTsyFyW/TstB3P3
	az0v/I12wgxvGaB0j9ayNbbS9QOdHTDfrqgCfigCTWuRukqSEO3IqT//1aQ/sKAZCZhGgw5zspZ
	pyepE0dUfXEDoe3/VUWzxV6z1DO5/AvBSnJZyAAtaElYwfyYEpR1rltQsEbH8cz3aU4TLk7CuEX
	R0pDU5HD8l7BpmE77gX+BA2YWUYk+u9QFD3XFWkO5s76uqeD5SvKmqVGQd/b2qeNcnhSB03lLza
	imydcAme4r7M3XJTJNQCNCRJkTtdHMVHSrW2jvhjw0rtwFNWsDhwlDs1BIHi1++qqLYdRFSNRvO
	sY6LEDvBBa3JaVg==
X-Received: by 2002:a05:690c:a798:b0:8a8:4cd6:b366 with SMTP id
 00721157ae682-8b05b0baadfmr4463097b3.34.1791332847977; Tue, 06 Oct 2026
 17:27:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-1-473a69fc8a3d@linaro.org> <CAPLW+4m57BbhsuVaJb382af6b9Ek-raHoftEO9m8z62Z=DEzkQ@mail.gmail.com>
In-Reply-To: <CAPLW+4m57BbhsuVaJb382af6b9Ek-raHoftEO9m8z62Z=DEzkQ@mail.gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 6 Oct 2026 19:27:16 -0500
X-Gm-Features: AclHuK-gTMHxeLVbqLEEqthoe_YhAWKRzmo3ENLwqbF0WuTbIQb_K4cpIVT21tE
Message-ID: <CAPLW+4=gpnHSSdZ1SWaYz4L_U12vo-OTwUvEYCt=SOSexJw+Gg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 6:47=E2=80=AFPM Sam Protsenko <semen.protsenko@linar=
o.org> wrote:
>
> On Mon, Sep 28, 2026 at 9:11=E2=80=AFPM Alexey Klimov <alexey.klimov@lina=
ro.org> wrote:
> >
> > The Exynos850 SoC incorporates an APM co-processor. Communication with =
this
> > hardware block is done using the ACPM protocol, which handles IPC messa=
ges
> > for clocks, power, thermal management and PMIC control. In this
> > architecture, the ACPM firmware running on the APM acts as the central
> > supervisor or arbiter for shared system resources, handling requests fr=
om
> > clients or agents such as an OSPM. In this design, the OSPM is one of
> > several clients or agents communicating with APM.
> >
> > Dedicated compatible string is required for the Exynos850 because
> > its firmware utilizes a different initialisation data base offset
> > (0x7000) compared to the existing GS101 implementation (0xa000).
> >
> > Additionally, the ACPM firmware implementation on Exynos850 does not co=
ver
> > all clock management operations (such as clock rate reads over ACPM IPC=
).
> > To allow the OSPM to resolve rates for these ACPM clock IDs or sometime=
s
> > called domains, add 'clocks' and 'clock-names' properties to reference =
the
> > underlying physical clocks.
> >
> > Add the "samsung,exynos850-acpm-ipc" compatible string, binding defines=
 for
> > Exynos850 ACPM clock IDs, clock property constraints, and disallow GS10=
1-
> > specific PMIC child nodes for Exynos850.
> >
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>

By the way, we discussed earlier the reason for ACPM clocks:

    "PMIC might be controlled by different masters (cores), e.g. when
Linux is asleep and doesn't control PMIC via CPU, audio co-processor
can still be up playing audio, thus it needs to control PMIC via ACPM,
which in turn means some clocks have to be controlled over ACPM, so
that power supervisor (APM) can decide how to handle/arbiter those
requests from different IP-cores."

FWIW, I think it may be valuable to have this explanation added either
in the bindings doc or in the commit message. Otherwise one might
question why this whole ACPM thing is needed at all, as we already can
control those clocks via the regular clock driver. It's just a
thought, and can be done in a separate patch later.

> >  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 56 ++++++++++++++=
+++++++-
> >  include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 ++++++++
> >  2 files changed, 76 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-ac=
pm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-=
ipc.yaml
> > index e68f9c3ca5e2..0eaa9c881f6f 100644
> > --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.=
yaml
> > +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.=
yaml
> > @@ -22,7 +22,9 @@ description: |
> >
> >  properties:
> >    compatible:
> > -    const: google,gs101-acpm-ipc
> > +    enum:
> > +      - google,gs101-acpm-ipc
> > +      - samsung,exynos850-acpm-ipc
> >
> >    "#clock-cells":
> >      const: 1
> > @@ -33,6 +35,20 @@ properties:
> >        appropriately with the clock scaling. The argument is the ID of =
the
> >        clock contained by the firmware messages.
> >
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 9
> > +    description:
> > +      List of the underlying clocks associated with each ACPM clock do=
main.
> > +      This property relates to ACPM firmware variants where not all cl=
ock
> > +      operations are implemented.
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 9
> > +    description:
> > +      Names of the ACPM clock domains corresponding to entries in 'clo=
cks'.
> > +
> >    mboxes:
> >      maxItems: 1
> >
> > @@ -77,6 +93,44 @@ required:
> >    - mboxes
> >    - shmem
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: google,gs101-acpm-ipc
> > +    then:
> > +      properties:
> > +        clocks: false
> > +        clock-names: false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynos850-acpm-ipc
> > +    then:
> > +      properties:
> > +        clock-names:
> > +          items:
> > +            enum:
> > +              - mif
> > +              - int
> > +              - cpucl0
> > +              - cpucl1
> > +              - g3d
> > +              - aud
> > +              - cam
> > +              - disp
> > +              - cp
> > +          uniqueItems: true
> > +        pmic: false
> > +        pmic-1: false
> > +        pmic-2: false
> > +      required:
> > +        - clocks
> > +        - clock-names
> > +
> >  additionalProperties: false
> >
> >  examples:
> > diff --git a/include/dt-bindings/clock/samsung,exynos850-acpm.h b/inclu=
de/dt-bindings/clock/samsung,exynos850-acpm.h
> > new file mode 100644
> > index 000000000000..87fc6ccc1d99
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/samsung,exynos850-acpm.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Copyright 2026 Linaro Ltd.
> > + *
> > + * Device Tree binding constants for Exynos850 ACPM clock controller.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
> > +#define _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
> > +
> > +#define EXYNOS850_CLK_ACPM_DVFS_MIF                    0
> > +#define EXYNOS850_CLK_ACPM_DVFS_INT                    1
> > +#define EXYNOS850_CLK_ACPM_DVFS_CPUCL0                 2
> > +#define EXYNOS850_CLK_ACPM_DVFS_CPUCL1                 3
> > +#define EXYNOS850_CLK_ACPM_DVFS_G3D                    4
> > +#define EXYNOS850_CLK_ACPM_DVFS_AUD                    5
> > +#define EXYNOS850_CLK_ACPM_DVFS_CAM                    6
> > +#define EXYNOS850_CLK_ACPM_DVFS_DISP                   7
> > +#define EXYNOS850_CLK_ACPM_DVFS_CP                     8
> > +
> > +#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H */
> >
> > --
> > 2.51.0
> >
