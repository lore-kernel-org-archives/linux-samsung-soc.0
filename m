Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022A53115AF
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 20:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407992; cv=none; b=qwfK/cjhuWPzDrIgPVYDE2kl40x1VyiSqLF9LfWLbfz/qatnaLe0vVx7nPuqvV3ZVPPbIgpkb9BQwBioXbJpg0HyN0nq5iANegA0QGYfgBC714iMr/U/hHJQEbi5439zGfxM6qv5yTYwG5u7oLTRkwDi3TTawb8YkLssZbcQRRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407992; c=relaxed/simple;
	bh=bikCYCChr7YkCUSK+pLWX18yTfLp9aN20MtL2K2GstY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XbbChX5yjBr90aPePqg0d+mV61t4qndEEfK1pNQaUR3iNAd561s9wZK99cJzEAzzaeelNOYI3+F0PwPVdHPZTRIBpvSQkQQ7I8kv0AvINh52DenoVLYptO4cvKRwzKppNgvBTh5dPpCrpjynkYkwpWKjYrn9fEX4i4xzdCRWW0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UZ7Uy8nI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UZ7Uy8nI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso124575255e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 13:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777407989; x=1778012789; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2z5CJStQaZH5C1yDNgwonipIcrAGaww4SYiAIYI8F8=;
        b=UZ7Uy8nI2+NOm8dpnjNNSb11MMuUBVTWQorG96Z9b22UBZwbnwkPAlHmmG85il8AD9
         Sw/7FzGb5F4wzlj8+Y3OyDOM4ppwwpIirs7Kj3J+v8VNDqbrfgsGVQF1EvygTCYRou3L
         /Mk49+Yniu2XxoFd6+lkgHP2oXe0dukmmxcS6r03r6O20G0jXHVP0+omwb7zryAdhZej
         J1FNxtA4O8j7148p3VYhlRRKwwiJuk9NLnFv4JZ5f0nS9wYYNlDucsZZA4HmU9veB9Bq
         WmYG3AlKNL5FdweLUdqaLopCeDszF0c/l50xoXhP0Ci557j7xiRsUfwhi2wOcotYdI6y
         yCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777407989; x=1778012789;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U2z5CJStQaZH5C1yDNgwonipIcrAGaww4SYiAIYI8F8=;
        b=pxAlH5kiz4ttQ3dF7QfHI/YvbxWCnsqDwMH/tl20JQftQ2zqWK02v0sXP4VmusoTXL
         2HRcxCRkkfoMQsIxAOvasSn2n2YA6hTukmGWEA50Bgn0+wsALvKNbC2yCMZP3Y59oaHv
         JTTML+kDf+2JcHQJoXEfOhGUt4xMoYXgXR4zMRff4m8PhCQ6gARVr0FsEWfR00ApyuMD
         n5aFyQ6V7KU/AORhdUxlrA+QTceUlGGon66GyTsImsPlus5hdNP4teRYwMjlBCBSi5zf
         hUG7mYw/7nBHaGB96FQNkguwcEvy1Y2KAf6juOoYUWbTmuzyepIi1r8NFyg4cC7pnih+
         /Mtg==
X-Forwarded-Encrypted: i=1; AFNElJ99WgR+DfrgV7x+CK/kDfoY+lR8QB+2a3pxf6I6l/NdJOD0v1cy1+4svrM12JHZPUxTicy2ouxu770iPYXp20188A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg4aa6yhSLVZ3jhEitZJXDf/gOvgnXv0G7cb37Pp7GERYhHurr
	mg2UfO1UHXIIp5fGwvisuTsQeUI2aP6uS1ljoacw83BH0PuFdl0Vpoqf8gdzu5jiGXw=
X-Gm-Gg: AeBDievPok6cF2vZRFrDu23F5TXmLVN3qhKm4LE36OwoFNNYaqKc6e/RmV3GavDd+7/
	uhuo7HG/Fx7PytD0fheEMvIUNruxwt09ZhnKNgufPZoQgt1djsSPXf1OWrPV/ZsyqmVjcHdMNdr
	sP7CMkTHc0EYO75KHuJ5HhqVCFaGBaY06fO12gV/NQRuFqnQB5Oq0H5m/Ya+uRoxi3qzZvT3B3f
	us4ICN3/Pt49TMzZHyilxxSSgWEN2EyJBrV+4aA7tS70k3Auzab4xJ2edsBM/f8yRIFIeKY0hXX
	NTh3f/e6+NYXr9JpkODLzs5Ru5e8ZfoBEoCjbWBnNgO24qDkWIw8BP05yNUg8Ito6El4zVP45lB
	AYKvBWoepg5PwgA+ZdwMVqBSDWZosv8WCeB/AtR0779s6c3HX4etzFAbwWgw2mDCbbZZnP/9CPM
	j+pMr0HsD9yZKoT6hajMtMqzhAmqZA7BH3dEXCRTXcT6mDV3QxDcMug4QOjUKq8GZMeA9JVLPZa
	O5SOZoPklnuimx6nRpXvE4e
X-Received: by 2002:a05:600c:4f0c:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-48a77ae5386mr75966715e9.5.1777407989369;
        Tue, 28 Apr 2026 13:26:29 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc11fcbsm10511235e9.3.2026.04.28.13.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:26:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 21:26:27 +0100
Message-Id: <DI52JP9JH6AH.3I5OKWOZ56MIU@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jassi Brar"
 <jassisinghbrar@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850
 mailbox
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
 <a02a693e-b06e-43bf-ac5f-8253f298c83d@linaro.org>
 <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>
In-Reply-To: <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>

On Wed Apr 8, 2026 at 2:08 PM BST, Alexey Klimov wrote:

[...]

> On Thu Apr 2, 2026 at 9:42 AM BST, Tudor Ambarus wrote:
>>>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>>> @@ -57,7 +104,8 @@ static int exynos_mbox_send_data(struct mbox_chan *c=
han, void *data)
>>>  		return -EINVAL;
>>>  	}
>>> =20
>>> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
>>> +	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
>>> +	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);
>>
>> Use FIELD_PREP from <linux/bitfield.h> please. You will use a mask inste=
ad of
>> a shift.
>>
>> I would rename irq_doorbell_offset to intgr. It aligns with the register=
 name
>> from the datasheet. You won't need to prepend _offset to the name, we al=
ready
>> see it's an offset when doing the writel().
>
> Sure. Thanks. Let's use FIELD_PREP.

+       /* Ring the doorbell */
+       writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
+              exynos_mbox->regs + exynos_mbox->data->intgr);

FIELD_PREP() wants a mask as a compile-time constant. Unless you want me to
add switch/case for different SoCs or I misunderstood something I don't see
how this is gonna fly.

Best regards,
Alexey

