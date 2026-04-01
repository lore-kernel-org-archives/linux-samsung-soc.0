Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E7235DA77
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Apr 2026 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060220; cv=pass; b=C9f0eeKRn4zlpPp/9CDODWVpBUYqpnmwhVtocfuW9DEpDRZ58Cba/Gty32EHqGdUcFPrIe5eoHReQ0jr+nSl9LiPETd+OC3BOfPu7iMZ9tlWlScskRwvApC2VWXrxZuWTO+9cOugLUrBd6psfVLbsV9dRLO1BYZ2q8PXoT+NLjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060220; c=relaxed/simple;
	bh=a/No3osBtbawF2T+IZ92AuftGjU7MOdhwCol+iFX+ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKMowcQPlAoig8KHOEijJ8MMVJnCpCmkMOE28VBCvSQ7KGJAEwtlc1M/+CH4PQ3pRjKD4/2ptbOW9U2MVdRcMgUrUQe28ZoKeyRVS6YTcE0pWsf1kvIgBJ++XvbhtimBgRw9iIT5I9ox2AK+vQaPpNxUDbaCWudp+4oHPKlOAp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IjpvaFkm; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IjpvaFkm"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-65006c99d38so9379021d50.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Apr 2026 09:16:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775060218; cv=none;
        d=google.com; s=arc-20240605;
        b=SVrBe5smXgqgVSQmZlRWHKQj/GMfrlq0470li9kr5/AYD44feReX2bgxmwDGaa6Qti
         BJdsSqcXDaO8mlbesRZ49Tqg5GgzZruzhTWsXq1Y4cWZ1+WejWCgqm/mwZpEli1rWK5E
         Qc9iJJDzB+9rqJIAj+2aFPLkujXFaTdWDy2LUbBHtbYKlVAiW/oolTLuC807xnZHN3Mt
         X9q1v4glUGlr6zxSywvrF4TR7xNmQ+pfv2Gcf+wH2CXk7HTv/6owrKTypnQqZdsMUlYh
         OegihN4XxHiKd4WNquX/GdzUDSGmqQGiz0ZnjamhWJkns3VCcfpPuuZtakFfPApNRqHP
         j/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0avH1+SOLHp/H4tdAtDn9dqoZRCCz/pmxrxGL/52XWY=;
        fh=bMFDI8WnioU8Ljynxj/R050spMkgPXAkGJ1s2aBpFOU=;
        b=DOsc098lrPBUm7PyI+Ihj9epVvjjBHfLqJez/jbz14qyr8JsY61JlsX/hpFD7qaXvK
         zmoVYcybxxfiA6wQ4yAaXLDfJu8Lpu3IH810JpKxRK1IvfxMw0DAlVizNTGziXFJKPRX
         T9SL3XS4DElpTTbgqTFbcSZhMiFD4naGaLk+MOA/YbsXlYbyz9qvtIgSvlwMonipqP6Q
         oEUz9+EjTJwn3TwfKILngVcd5RoB6damDsTvRTnzGa/nP3qatT44IoDYGupka5Fyf9EH
         AqX9NG+rLpfDKiuOhIZqzq60ETESvGkn8s1tCkIJjKB4eXnCVkEP7DR7hM2iElVjI9Xt
         iBKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775060218; x=1775665018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0avH1+SOLHp/H4tdAtDn9dqoZRCCz/pmxrxGL/52XWY=;
        b=IjpvaFkmeMl/HsUTgxMHafFnnYEnoKxrnwhKd4HaHm+pUXM8mmbg/aJJWYfbaJN8M0
         jIDzT2c6/OKxFb0jVfwxF9S4kMxo2fw5mJ2W2sR3MtL9nvF1nJaWZutdDavCnmceACBu
         VVpFCnrKh5NgI93QGFegvKsgMCUgaNKjy16+9jwJiyA9UMQi+NXYNguVRPGfXcu9Uafn
         VENWmmvwkhoBMHbKBgQ1hhj2x9RNdppgTQQzyk1CgD74LGR/kszWC5qVb5nVGYAmIkRV
         spXbIf2izDbaQaxRV0cvrOiFP7s9rr3w04oOQTOGb6dSYtBb05S0HY0lnBPxukjS8+w7
         CYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060218; x=1775665018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0avH1+SOLHp/H4tdAtDn9dqoZRCCz/pmxrxGL/52XWY=;
        b=QDdEQxCZtQyK+t5T8flVzaikNXejhVYlDV2C7Do095zpFMZq1oLMcMG+epBOem3X3m
         YV5OIRvb0Z13uXNPkvurhh6OX0uy8b1AujSKFCRNhyBC9j01t+VET4xYUObYpRbMLkKk
         XsxRgMt9MzoRlaHPjn0AnTOYkibpAoJ2z8pA+7xBpzrE0wRS0j9oUtqpg8Xh0FsIa/Cf
         d/+ZCtbZK1LdkBBvJOmQN3gtEoKBfDCSZC7qhI5EU6HP5n/VAc2g2CQOVYTrv+cv6S0w
         MUh0M8MbIQSnq7Jh6iV1LBpqG19eK4yLqRj38GX5VX1rJMUd+Tze9BgyI6iQlOLs6xdG
         Z1DA==
X-Forwarded-Encrypted: i=1; AJvYcCUw6i4dRioncYzBONZVLrCfY2IdSRi4jk2VeBHT1IVr7ViXNpQVh+tdDc8CV/OyuOoOcZ/kP6NB+6r0+/6aY95Yjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzORAtvs3UHRxGcoWrDB8aodiHEPBxFeMi0lF27W4AbHSDceLRC
	5uAtkCni51Rz4Yw0EG92qOaGWvGuwQVMsgLr/rRNIRQkoNqtJ9dTjTnpXITd1XbDkjpOppFB1JP
	6X8gf5EwtC2g2UbxpZfiADo/NMD1A96aql4QUz1nLTQ==
X-Gm-Gg: ATEYQzw+fEAxWix1L7XbvWQbghWQxD+taxHDmYLRHhO5ApnGPUjHDEEZuU9OTzndWHr
	Qs3WzaYDK3nPwwNGrM0Je9ZJ4D3DLvhXoJ6NX1VA/wgpVuunrO9WBW8WtS3E7rMZ4uDJ41nTLnM
	Bns1tWgplfwLqQeRG2KhB73qwWHwZO1xyrPIzFRrkJlsBVOisDhrhS/f4CZp/9EWKSxUjB2YRYj
	mv7zsekmd1wJ2374MAdjDni9n1Hlt594PK3ooXVZAvmn7cPWOSpweUB92Jh/R+JSykvZ3kFFGKj
	s/fybgZsZkjKyo3Dv60KP/mygVx4uNlpIteI/XUAmg==
X-Received: by 2002:a53:c608:0:b0:650:1247:fe35 with SMTP id
 956f58d0204a3-6502fe7c6famr3104408d50.58.1775060218141; Wed, 01 Apr 2026
 09:16:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-6-c5a760a3e259@linaro.org> <f73173b4-f44a-4d01-abec-3366b6561332@kernel.org>
In-Reply-To: <f73173b4-f44a-4d01-abec-3366b6561332@kernel.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 1 Apr 2026 11:16:40 -0500
X-Gm-Features: AQROBzDBnBQJcHuyu8ZHm384f9vOKocl3AGoLecw69PFxAPUA79-AuH9D6PxvHg
Message-ID: <CAPLW+4=H_UkjwY2RJFPD9ekJh05MyuhKrymeuUYC4dX1WzF0wg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] MAINTAINERS: add exynos850-pmu.c to Exynos850 entry
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Wed, Apr 1, 2026 at 9:28=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 01/04/2026 06:51, Alexey Klimov wrote:
> > Update Exynos850 entry to include new file
> > drivers/soc/samsung/exynos850-pmu.c. Add myself as M
> > there.
> >
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
> >  MAINTAINERS | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e14e6f874e05..4b28e92b4d9b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -23601,6 +23601,7 @@ F:    include/dt-bindings/clock/samsung,exynos2=
200-cmu.h
> >
> >  SAMSUNG EXYNOS850 SoC SUPPORT
> >  M:   Sam Protsenko <semen.protsenko@linaro.org>
> > +M:   Alexey Klimov <alexey.klimov@linaro.org>
>
> I am surprised to see this because I did not find many reviews from your
> side before.
>

It was me who advised Alexey to add himself on the list, as he's doing
a lot of Exynos850 related work nowadays, and we expect him to
continue doing that. If you think it's too early, let's get back to
this once there are more patches submitted under his name.

Thanks!

> Please first engage in reviewing of this platform, before assigning
> yourself as a maintainer.
>
> Best regards,
> Krzysztof
