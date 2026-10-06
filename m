Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FB1388E76
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Oct 2026 23:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791330468; cv=pass; b=XchlHtl1LM0bKkF8y88SczKu3qwwpClaWvcqKJoLV8KT4ceBDJ0CblJkSwdOV2c7vtyazV4s9K5F98Y3itM2KUO4eVz5MynmwISuQE+lFynF97HZvnvOwLrnUfq09DBg98e67ItP2fk0YFQmUl8RfIOYRUa/qvH0qNXwrmpTAak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791330468; c=relaxed/simple;
	bh=gexAZAM9D3qySWszn5uyjGHra9XjdPZHkujc4evGP1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKwT40CbFr3EYxeRzVo0zJkAvGTcwaTE1yz7eiz4TZnB/qkG1en9FIBCZlOqkRA83GgG3ojgh/ID1jnEHQmTVv/RWWPGpe6bIHZfgSXkBvQRwq4s9ku8REoNTkMDpZicIMmfIs7tV8kVG8hm+y/D6Fr/yuIhEp0xFepnF5+OrEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k5uSQHkJ; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5uSQHkJ"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ae8541a2f0so13383467b3.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Oct 2026 16:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791330466; cv=none;
        d=google.com; s=arc-20260327;
        b=MrTqXWCNu8Ip0kdsrAS+FD5Ek4J1FsnzWzcStv9GF1yYnw6aybl6aP3PjmQD9YCQbg
         rKKMBg+8PMK64ofOwUnQxTwAd3rCpWMe1I42SWeQ/9u2r/xY2iX2A8kwAumO0hNurg+D
         qCIa64RM8reg3xEhBgCzO49/ftjdq+u4ytJ978V0fVNQwNERPgvPGCfcArvHB5CsmJrh
         MH+Sz1Xqxiiw/Itdd1eU9lqq393xxV6+HmN4k4E5o/vQycLq0PCpyzb8zTkEBm5HSDCm
         p6ZzM54MQ1SODVuZcTK7jzmfkJMlqHQkFblTVJbdDNbxzCcCwp2V1fmW+NkbuMSCKa3o
         U0LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AACY6eEKMK9EhfCO/Rpu9ez/h9G33RdZtnEBeVV09lI=;
        fh=DbBKdsmaTNmFO0DTlLSlhuFoIEzqXXLZ3+/0mq0z3vU=;
        b=WyKj/TDPkEcNG51XPVwD9vyyixtIZDf5zNJ06s6pBdtZFcFyCvbdvNaYETMNZmNaj5
         ZlEKHMP7P4ymOI8Xv9VOZ53tgf/rQBH2QTNSOY+uZRJCQX0/EqfY00xyHIi16eRcf5h/
         63s0o+SBfBqGcZEtQK2pMV1T9wXt0TD6oMO3mM0eUAug48Hwf/UEO5ltSTHRYkgY+Cez
         H37HxBo4Wr6hnZhmEpqrLl0lAMzK+SfIs9HGPK7R7vzy3cW/uelvfTqKhXZMgWE3gSTh
         7n5kcHnyEs+CWJgXx39trk/ZYqxgvZa2uvXt1ksflw9PsxvGNl0D/dNZq30xImiMnmMg
         MMFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791330466; x=1791935266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AACY6eEKMK9EhfCO/Rpu9ez/h9G33RdZtnEBeVV09lI=;
        b=k5uSQHkJUU5uCBUJ2iMCeuQk6NXZ3sTuNH1HFWHUTegxMX0jy9NBHan909SUQ0+ulL
         Mg4ZB3qqs2+sFYz6Ql8v/Xs+/ZQFclh+EBoDt+F5dsheXmjl9/9npo92PCaDoDms8eTD
         esdlek1oi0tHoUibqyvwWKxfcY+dYxN6DzksCWOjtNKINrrnvU1ZmNlxDhob62hHROES
         zfPFKAquppldgh2dL0v+kI+jZkr/hRMMdFLJ/7lNyyeMR6LAzZ1guAywK2LukAlsmQD6
         8EfcBLPT1P+8/CMsC2bqv8PP6LOSYBjDkZ1wbGKJ3YT0sUlAfTiU7BuCMSSynAA6XFmh
         36CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791330466; x=1791935266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AACY6eEKMK9EhfCO/Rpu9ez/h9G33RdZtnEBeVV09lI=;
        b=vy6CCuGCrm7p9PP/w/jdez9oueCtrSb9Y/nSwrlSqp0vEYaKWNET02ZlR9ycXoAkxt
         74gejhaGopMfbeCUL5e+BedWxhe5eMAKqmvyA8qN0F8/LXMs8GdQaZsyBc8wee6BlXBZ
         eSyZe4JMo5aT0u/I+9f5wTyeOGvL6mTXxxxlz8DJpgSvSp7nv4LhARw4VCR9xa/jSjlx
         0EG0r9xJl/t8UqtFhCNrB5hew6HV74KaEkVPwPBHDetItmasKl38oXcMbOqNBEuDs+qh
         mgh2fqIkgFtRPzNJH4qFdN4YQsSHH2dWiFJQ8YidKwq+aZqlX5aGQTruvDWjE/Gy61D+
         ifvg==
X-Forwarded-Encrypted: i=1; AKwUvBxBi39rKxwU+gr34n2wS02TNy8Ic1aHIRqh8RTXbaHdkz/qA0MCjHn/xP7UvQ7bSyvYABl4anEECWofAyOEcdYl/w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJM7vwMC5jX0GEjqLHAvUsSyK3HOp8e9AxiLTFEn7uGci+k40wm
	X7vkK+aBUvKym34Gt+x0jpUZqCmgUyLV/dm1FXaseiynw5D7k2mHZCuJMnXtr5W1QwjKh4rEnnR
	maY3ADH6Uo8xkyKxWRyJIAP4+XPDpJsYiCrUeclvYGQ==
X-Gm-Gg: AYBFou2hyWAAQ5TBQarVnOp1N8WK1unPH0S6/TxOeOHMZXa7Wq11yiU3XUE+gGvGo3S
	LrcY8luO4/yAWJyYe4FaJsw1fBZ0o9wWiNyNBAaAipwCYH/Wa/CQWk9/1OlACyfzmJUJ2IMh9V0
	nV9lYyHyWjoCro2BPyZOSnzzHDjyWmbED5X3PyqTegdQyQ5ZSE2MVU+lZV24BXYmqCWfVFoFTza
	QlOWFrxemEJusPs+8knKrdQnUdMjBziB7zpy11Dbpw5VJxjEA3U0R/lBUq3N4W8lqyv1EwXkCDi
	mW2mlbQyvx5ljuw0QBwapKrb4FnpJgQZ1lPeExoqrmSzWslv5LcVbHNW3+UU1IyLPQsl0S1UqEh
	k8F5CwNICG86MnA==
X-Received: by 2002:a05:690c:47c9:b0:8ae:91b3:f0a2 with SMTP id
 00721157ae682-8b05b01c13dmr5311187b3.20.1791330465608; Tue, 06 Oct 2026
 16:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-1-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-1-473a69fc8a3d@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 6 Oct 2026 18:47:33 -0500
X-Gm-Features: AclHuK8biRi6brKVjnQsgRrEOJZ8txDP9zLFZXlunl0eP3sSkOkiUAUTUCWs2z8
Message-ID: <CAPLW+4m57BbhsuVaJb382af6b9Ek-raHoftEO9m8z62Z=DEzkQ@mail.gmail.com>
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

On Mon, Sep 28, 2026 at 9:11=E2=80=AFPM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> The Exynos850 SoC incorporates an APM co-processor. Communication with th=
is
> hardware block is done using the ACPM protocol, which handles IPC message=
s
> for clocks, power, thermal management and PMIC control. In this
> architecture, the ACPM firmware running on the APM acts as the central
> supervisor or arbiter for shared system resources, handling requests from
> clients or agents such as an OSPM. In this design, the OSPM is one of
> several clients or agents communicating with APM.
>
> Dedicated compatible string is required for the Exynos850 because
> its firmware utilizes a different initialisation data base offset
> (0x7000) compared to the existing GS101 implementation (0xa000).
>
> Additionally, the ACPM firmware implementation on Exynos850 does not cove=
r
> all clock management operations (such as clock rate reads over ACPM IPC).
> To allow the OSPM to resolve rates for these ACPM clock IDs or sometimes
> called domains, add 'clocks' and 'clock-names' properties to reference th=
e
> underlying physical clocks.
>
> Add the "samsung,exynos850-acpm-ipc" compatible string, binding defines f=
or
> Exynos850 ACPM clock IDs, clock property constraints, and disallow GS101-
> specific PMIC child nodes for Exynos850.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 56 ++++++++++++++++=
+++++-
>  include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 ++++++++
>  2 files changed, 76 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm=
-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ip=
c.yaml
> index e68f9c3ca5e2..0eaa9c881f6f 100644
> --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> @@ -22,7 +22,9 @@ description: |
>
>  properties:
>    compatible:
> -    const: google,gs101-acpm-ipc
> +    enum:
> +      - google,gs101-acpm-ipc
> +      - samsung,exynos850-acpm-ipc
>
>    "#clock-cells":
>      const: 1
> @@ -33,6 +35,20 @@ properties:
>        appropriately with the clock scaling. The argument is the ID of th=
e
>        clock contained by the firmware messages.
>
> +  clocks:
> +    minItems: 1
> +    maxItems: 9
> +    description:
> +      List of the underlying clocks associated with each ACPM clock doma=
in.
> +      This property relates to ACPM firmware variants where not all cloc=
k
> +      operations are implemented.
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 9
> +    description:
> +      Names of the ACPM clock domains corresponding to entries in 'clock=
s'.
> +
>    mboxes:
>      maxItems: 1
>
> @@ -77,6 +93,44 @@ required:
>    - mboxes
>    - shmem
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: google,gs101-acpm-ipc
> +    then:
> +      properties:
> +        clocks: false
> +        clock-names: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos850-acpm-ipc
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            enum:
> +              - mif
> +              - int
> +              - cpucl0
> +              - cpucl1
> +              - g3d
> +              - aud
> +              - cam
> +              - disp
> +              - cp
> +          uniqueItems: true
> +        pmic: false
> +        pmic-1: false
> +        pmic-2: false
> +      required:
> +        - clocks
> +        - clock-names
> +
>  additionalProperties: false
>
>  examples:
> diff --git a/include/dt-bindings/clock/samsung,exynos850-acpm.h b/include=
/dt-bindings/clock/samsung,exynos850-acpm.h
> new file mode 100644
> index 000000000000..87fc6ccc1d99
> --- /dev/null
> +++ b/include/dt-bindings/clock/samsung,exynos850-acpm.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright 2026 Linaro Ltd.
> + *
> + * Device Tree binding constants for Exynos850 ACPM clock controller.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
> +#define _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
> +
> +#define EXYNOS850_CLK_ACPM_DVFS_MIF                    0
> +#define EXYNOS850_CLK_ACPM_DVFS_INT                    1
> +#define EXYNOS850_CLK_ACPM_DVFS_CPUCL0                 2
> +#define EXYNOS850_CLK_ACPM_DVFS_CPUCL1                 3
> +#define EXYNOS850_CLK_ACPM_DVFS_G3D                    4
> +#define EXYNOS850_CLK_ACPM_DVFS_AUD                    5
> +#define EXYNOS850_CLK_ACPM_DVFS_CAM                    6
> +#define EXYNOS850_CLK_ACPM_DVFS_DISP                   7
> +#define EXYNOS850_CLK_ACPM_DVFS_CP                     8
> +
> +#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H */
>
> --
> 2.51.0
>
