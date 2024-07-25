Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066D215F407
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 07:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721891573; cv=none; b=tQapwg4exP7QeA/EBcSLiKpvCBAT7r3eAzmjg1l5EwSzFJbUNd/ITROX8wDdaDJ4qcr05i73zNH5eo1kh/88MSv4iBTlUHHsdTOGLGniK6ucZ9DiTAXa2Cf9lrLRWKLregIeRwwY4vmRCzHT8S7dRoweTjg4Ps2D5bQuPtmG2PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721891573; c=relaxed/simple;
	bh=I9GhVMHtEQAd/PZry3mtZn2JuhHPdCnVocgwCyxAvZ4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W7YonJrD2Vsq2l3wzJvwpClzP2F8mDYOMxK5pYkSrEv59iSTpYBcEwHQL45CQJwEwJyypxTEZTHxNckRJUv/UIX30D0QpSLMcztZUVzwbh2l6yrfyS4g9GBsS0cz+j62aRstvgse2UmNvDCciwR3Kh0FKsdX/cSmcRRWZiso4NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UNgtrKBn; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UNgtrKBn"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f01e9f53ebso7033681fa.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 00:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721891570; x=1722496370; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I9GhVMHtEQAd/PZry3mtZn2JuhHPdCnVocgwCyxAvZ4=;
        b=UNgtrKBnPrs6Izs5ovnVBo797/9bzz3Pc8oH4hIxeLuvn6sPGqH7z2phorVNOpSbLx
         HnHELIrAxx1G5mAYTv8EFZPFpvt3E/Qcrmur93MkeV046+cpTNti4gWq4uw6swd8UqcX
         6A6AEX9oF/BzlC2kNfpP7VrDdY0IW+p6BAbXRERr1QH3UAdJI83/E2UokfN6OdLsGhIU
         RGNgI2yc8dMA3o2hZYDhFcDgVKL+5kCc03YIu/AAguWppeRssiGiMnx7AvAD5L2F3hlw
         ZmKN0HEN2+BA92aPN+FydpNlSU/4SUOwtU+Lxoi6MEdsJ0JCDIqL2TPr+w449Y6iY7Mm
         PUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721891570; x=1722496370;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I9GhVMHtEQAd/PZry3mtZn2JuhHPdCnVocgwCyxAvZ4=;
        b=AweBlQTwoz4p3vzChXIQeWZ3QHTWLT7wvocJyZEYjQ1f1TONXwXH4iC+8Psa7J+JPB
         cD3cZOhdfENYolXOltxCzX673cqAvU6lMlY4z95xWbvUD1TpqNZ7Ga/gkekNJfpjg54k
         NQPimGJYNzaHNkjzBLHzzB3hAR1ziTVcPRjVHm6ttKR4XXwW/A+vtgwcXZ0fnzBPqtNy
         Jz45fWgEfd4vHyHR0TDdZ0ukDs3gtYsLRqupL4jrzLFw64EKAMLL2qUy5mqrl0Bcjqta
         XamwjcQn8+EBT3YBYKztBgF1awQ+NG37JH8ajmQFxwZ+wmWNSj0SVCQVQSf/ZOlF1q0U
         hEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNYrl9Hgg7Uvr1jkrGfCQdB49MIheWZLg+ryNabKu+m4teJiRORpt4+3bOAhPDiZxQhpGx7JEfKbCLc/oVGICVZ6ILSHNB4Mn9H1TaPxw1sQQ=
X-Gm-Message-State: AOJu0Yz5e/evWaOc4JrZYCnN420IEE21r0M28jsFZMQSCv60uwQHFpBs
	78pgdrBdYY5i4oSJkQXCZ4BUSq9/yjCQ9QGSwXlWKRs9NxqnAvojXG/uzfnATxA=
X-Google-Smtp-Source: AGHT+IGyST1xP/YQwi9yjbDnWa5HGoHBRLTrLXFIYMLRvfkbS8VTcKxJPoDoIMNQrcTLtj9FYE8Jyg==
X-Received: by 2002:a2e:9e52:0:b0:2ec:1810:e50a with SMTP id 38308e7fff4ca-2f039dbbacbmr13607411fa.32.1721891570198;
        Thu, 25 Jul 2024 00:12:50 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f1f52b8dsm61484085e9.1.2024.07.25.00.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 00:12:49 -0700 (PDT)
Message-ID: <298d204a7d9c8dce1f1a2f180b12bd3887ea4802.camel@linaro.org>
Subject: Re: [PATCH v4 0/2] gs101 oriole: UART clock fixes
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peter
 Griffin <peter.griffin@linaro.org>, Sam Protsenko
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 25 Jul 2024 08:12:48 +0100
In-Reply-To: <d17567eb0ad9a6082d55ca016771abbc.sboyd@kernel.org>
References: 
	<20240712-gs101-non-essential-clocks-2-v4-0-310aee0de46e@linaro.org>
	 <d17567eb0ad9a6082d55ca016771abbc.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Stephen,

On Thu, 2024-07-18 at 13:55 -0700, Stephen Boyd wrote:
> Quoting Andr=C3=A9 Draszik (2024-07-12 10:09:42)
> > Hi,
> >=20
> > This series fixes a long-standing issue in the gs101 clocking / uart
> > handling.
> >=20
> > We can now disable clocks that had previously been marked critical, and
> > still get a working earlycon.
> >=20
> > There is a preparatory patch, and then a patch to drop an incorrect clo=
ck
> > counting work-around. That 2nd patch is essentially the last remaining =
patch
> > [1] with all review comments addressed, from the series [2] that was se=
nt
> > earlier this year, see lore links below.
>=20
> Is there a binding update for the chosen node to have a clocks property?

I didn't think that was necessary (and no, I don't have a binding update at
the moment). It gets the clock associated with the serial port (of_stdout),
if any, and works off that.

Did I miss something?

Cheers,
Andre

