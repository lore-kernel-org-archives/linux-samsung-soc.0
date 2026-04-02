Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2A0310655
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Apr 2026 13:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775138235; cv=none; b=Zp0ZY5MkUrTLlB2vAB/4lLt2gpWGyFKxmgahYhomgt0AgiMPgWScKUesMQY677oqrmyEKDL9uM/QjCo6c1da13WODJygCrH3P06GygJoqOMTcrUKZ0mJoR6WNLRQFr59KUn7xN2P8vC5JPjrPaN39hWL9H6B3KkRlqULXFeuV8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775138235; c=relaxed/simple;
	bh=FW6ux+5Npv72H+2EYDVr7T1TV5Jv3vXfaDQl4sqmvUM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=MT/aX0kkxIyJHwhBceN3+3DEqqunKZH8F/u/HTvb6+2dKjk9ZgtDDBtXCvlpr4QTrD8vkz9EteA3NbpyweKU5fw9xHO/xRkgo4ZihLMovmKZf8GupMOLPBlghCMi0ivivW5Xo5MEGvfqqveXglwxT0fi5svWO2Dk/Z0bcVAYjL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wOLUQV9h; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wOLUQV9h"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso8207285e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Apr 2026 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775138233; x=1775743033; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlqXtAWJ1GByy64qGazEk71FC5c2hQMAqngLM9hJtdA=;
        b=wOLUQV9hNeSqlDvI8/v7gcHCkJWi/Q7V/JdagLubvKDwKLyy8H8CjOFGzIP//tdjJH
         Oi1c9rPzs9W5dJOFN0U5AyTFt9lsVg232obxLjrIErcdYn2KpauetjjciO7hu8l40DaQ
         ZfjFXdaSMjDcp6/NQdeI4GG83o6oVE0c6TxRUCi5I+fKy/BzRy0mzDj6pbBiFoJePTB3
         35DdoVIeec5S9A8IKNUP3wvsds/Trqbir1VUj834INQ4VF3tTo6FlKh1n4Bo6oMhCIWu
         RQMD4of5pds0ofS00SQhwdOiZ0IUhfzuvsmzNi/YbTxW9Yj9NJv8sdFElkjBdhcD1/E5
         tD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775138233; x=1775743033;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HlqXtAWJ1GByy64qGazEk71FC5c2hQMAqngLM9hJtdA=;
        b=EWNdoc0FVwaFvPZeKQ585JCQEIKRz9Wc7nNnj3G9HsR/7KZ8dZ58jjZq3guQs3cyj7
         0buFMzbXvxhwT3s7OveKexoekYunVrLTj3221OImMLJE8v8dcfK1oKIJq3Ud9TUK/y3l
         u363AdLKJBsjnKOIEYP1kbZjrSitk1obmdwW+KFLTWumhEgdmIAHq4aKenS9uFXg19BZ
         LklTythS0aeUZHljTBu+1w1wqBbzWzur8GiDJ6CoPJg7VssVk3hRwqpd1clJdDcFiBsY
         aYVHhxTEA+eKh70zDfkq2pR26ebEhU86Bzomb8XgcU1L8HR/0Hxf+0UE9a6YNmcuKf0p
         sFlA==
X-Gm-Message-State: AOJu0YwTG+hgodSE61CKdtMqo/vN0O16h8uyDXsOoNMFeWXiwNsPuFgp
	fP4CVxYuU0V3/oNySFVKKfB6Cle4e/6Y0QouFzOfRrRJjFgVpe7vVdaAQUMxNpun1OA=
X-Gm-Gg: ATEYQzyy78/X+yck7UVEg0/Sho32oCY42XTa/jg0DRnUXMFImq5xu/YrfsNpYRtY+X5
	0sP8U3QSOLW/Jj+FGZKS4By4ev7wOW1mn8hEe39nPF3fGtaEPEgaKSGR+VYT8fJB8CkOonhCdHp
	k0QJgaQKObJ+rRcF0+8uIphQk0yMtiSwlq7n8DPwIuDl+ZnvbGhCelgE8CPXzx6InM2f1OO9aUg
	X7xuflOvjsOxvm8WftYHvO2vYa/04eHaG6COvtgw/4GKCmjA2xOOWlqEwqPGjeXauAxZNZ92pVn
	86X6YhVrRNXJG3iIGVhCGP+oFV0IvLTQujSYjpMFBoZrJcps+uNxB5oXCNZmpZNIBoH/Muchjz6
	sOGKC80ITXM1XCevzyMRlv/CRdtS6UmF/MSwEJX/2pCByuy9NXoi6G9KhOmE+itbBpF9pnoy5ug
	CnbYpDCAHJ/wcoOUl1CWHPnsBEpE7POWJ4zIQ5xnKD3+0bn7OsuNwVHYbDPmwT3h4PJ1paTqLcU
	tPaKoSTHmtN63F9
X-Received: by 2002:a05:600c:8488:b0:486:f4d2:eac6 with SMTP id 5b1f17b1804b1-488835682c8mr136632325e9.13.1775138232539;
        Thu, 02 Apr 2026 06:57:12 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:a0c1:4037:aafe:5dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5253sm7388752f8f.9.2026.04.02.06.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 06:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 14:57:11 +0100
Message-Id: <DHIPZHI8BC0M.1GLYIDLUP5SF5@linaro.org>
Subject: Re: [PATCH v2 6/7] MAINTAINERS: add exynos850-pmu.c to Exynos850
 entry
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-6-c5a760a3e259@linaro.org>
 <f73173b4-f44a-4d01-abec-3366b6561332@kernel.org>
 <CAPLW+4=H_UkjwY2RJFPD9ekJh05MyuhKrymeuUYC4dX1WzF0wg@mail.gmail.com>
In-Reply-To: <CAPLW+4=H_UkjwY2RJFPD9ekJh05MyuhKrymeuUYC4dX1WzF0wg@mail.gmail.com>

On Wed Apr 1, 2026 at 5:16 PM BST, Sam Protsenko wrote:
> Hi Krzysztof,
>
> On Wed, Apr 1, 2026 at 9:28=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>>
>> On 01/04/2026 06:51, Alexey Klimov wrote:
>> > Update Exynos850 entry to include new file
>> > drivers/soc/samsung/exynos850-pmu.c. Add myself as M
>> > there.
>> >
>> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> > ---
>> >  MAINTAINERS | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/MAINTAINERS b/MAINTAINERS
>> > index e14e6f874e05..4b28e92b4d9b 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -23601,6 +23601,7 @@ F:    include/dt-bindings/clock/samsung,exynos=
2200-cmu.h
>> >
>> >  SAMSUNG EXYNOS850 SoC SUPPORT
>> >  M:   Sam Protsenko <semen.protsenko@linaro.org>
>> > +M:   Alexey Klimov <alexey.klimov@linaro.org>
>>
>> I am surprised to see this because I did not find many reviews from your
>> side before.
>>
>
> It was me who advised Alexey to add himself on the list, as he's doing
> a lot of Exynos850 related work nowadays, and we expect him to
> continue doing that. If you think it's too early, let's get back to
> this once there are more patches submitted under his name.
>
> Thanks!
>
>> Please first engage in reviewing of this platform, before assigning
>> yourself as a maintainer.

Okay, so it was done after Sam's advice. I can do one of these options:
- drop this patch;
- move it into separate entry in maintainers file;
- something else, please suggest.

I don't fancy having loose files (first option).

Best regards,
Alexey.

