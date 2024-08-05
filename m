Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AB114658F
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Aug 2024 07:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722841939; cv=none; b=r8Y+bLAQBlk5qJttnO7XPuTLtlfx3G5nVNv4iivD2zKnUExTAO9Iaok+R5nqJH3CzCo5bZ0a1x01DVRsYK86gkM57PEbfCQ6X3VzHdlELlPZD2bTPFtpfyBJ8RFFriYBZCvRWRO4+sSFEneLBXD7GgNSXR/cH3LkTrfJi4w3aYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722841939; c=relaxed/simple;
	bh=4ZP053oMmz+/X84NfsxYYXiElV8riFQvfYC2XCVBtq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=td4trnsmPGdW7WKau+1QYLXZcWZMykdVAaz/vXl1F5WXWzG1vFt/AjmbMS5jpNs4Hl9aTiumWh49mH7ReafFcn3GcIdsbwTin2w4DpWuN875xRWjgR5HM9t2pHodqZKmlHPPXBRrOwJCmkd758nwUtlBJR2lDgmbIwnPxS+5MHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F6PAh0qL; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F6PAh0qL"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ef2cb7d562so128098921fa.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Aug 2024 00:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722841936; x=1723446736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZP053oMmz+/X84NfsxYYXiElV8riFQvfYC2XCVBtq8=;
        b=F6PAh0qLfKee+Y3rTW845I1uCLHQ8Rat440mQtdrBlKbu1YgPXbeks7bBSIDeDewf3
         L5DTcEC8LVH3UI50m4+VgtxaVOm4ZwBWw2L0Dxy3nrc8yfypPVPXLMlCPOKQavBkFQ8F
         lditnSaREqLIOnKCTUdqc4YnptJaxCObsRyLX5pxr3BVJGrJvdQQ2KphuO7/O2RFPgl0
         FGtMUwWdJfw5cDcFLrMs7TXHs6P8844Logeo/VYGtJJsnIB8Ck7x7Nv7Gm0QV8W9+OTK
         WCtmYh5LPu77CoRPDoNnN+v5mij3ZVBFtZrx0e1VVhGbe7kogpEp90R4uYyWiPRs19lr
         W78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722841936; x=1723446736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZP053oMmz+/X84NfsxYYXiElV8riFQvfYC2XCVBtq8=;
        b=Vow3cWAvnhsg495GdO5pAyBjqGCdbvjhDD3/XXUrl0wSlUNBO0Uc8V59gVfrPbYDtu
         Ihj6fmhpPkgrNRKZFVcanzxmyZIzeqQGWXmBMwZAUZdGDxLW2AflVj19K9g03Wqng20s
         SeJoG5c+pYL+QChxoHfOWIk3sCb1N9KTRp8IlS5U/RuwGYc9nejojHJMdXhw8/gnwOhZ
         Atu6PSfksLDQq6f6okEV2D2FiCWy9h1O2ONo6IjXpDGw0YW8RXP5UwNx2KfrRlD+oe3t
         UBdMia0VD3JT+l+i4vjVKLPJYHWnChhGRNpTCHNIo5tTvFOsn1ZFShqaNS6IbBV3CJFz
         hvPA==
X-Forwarded-Encrypted: i=1; AJvYcCXc9iel0mknVuOvlHmIQQo+QyrVgc6Fb7pMRz+WIiLqZmlNuV9qike+zvKmIEEYTYQfFmm1oSr2pzTYEmPE6/LNIBpaPe22tcNkd6t4uvLvSBc=
X-Gm-Message-State: AOJu0Yy3I5nGyW2yQVCFi5Do0ECsCcPv7Y02GYQNd+Dz6xbtu9EtAV/N
	0QwaU1tClxSxuo5iIn1BXXL6iOn/gjjPWLe3ITgSgJX5UgRQHQOpwMSYDmvk76wRmEQeK/frcbo
	hdiHZ6PNiR4M8sjahm/pnkKXU0mXLm47QpQub2g==
X-Google-Smtp-Source: AGHT+IElD4u06pL2HqZSnzigcAhhzYjCaxNweUiYxJJqrtc3uoIYmMUVpFh1OipooKZyULCeycnfHLDZuNlVtaX4yQI=
X-Received: by 2002:a2e:9b88:0:b0:2ef:2c2e:598a with SMTP id
 38308e7fff4ca-2f15aa96971mr72869621fa.11.1722841935651; Mon, 05 Aug 2024
 00:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240708102520.26473-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240708102520.26473-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 09:12:04 +0200
Message-ID: <CACRpkdbaGtZgKFFjxGcerRi=sC_WU=-fnGt0D5u9pFTh85+kRQ@mail.gmail.com>
Subject: Re: [PATCH PULL] pinctrl: samsung: Use scope based of_node_put() cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 12:25=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Link: https://lore.kernel.org/r/20240504-pinctrl-cleanup-v2-20-26c5f2dc11=
81@nxp.com
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>
> Hi Linus,
>
> I got only this one in the queue, so sending directly.
>
> Best regards,
> Krzysztof

I missed this last merge window :(

Can you queue it for the next v6.12 cycle, or do you want me
to apply it still? Was thinking if there is more Exynos stuff coming
for v6.12 it's good to have it in your tree.

Yours,
Linus Walleij
