Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GRHEUKQ3"
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F232198D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2023 09:04:23 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a03a9009572so785405866b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2023 09:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701191061; x=1701795861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsuqKKUCV3ERuWqdVBH/QhrklJFAIa7lTkzZdelGo+w=;
        b=GRHEUKQ3HKq8B1xLPxkTrfj5kycX5fDKCmv/GQpegWc4NNQy9FIf3ac3/Aug+IfhCv
         3DJ0FGHDxVnciZ4WpyiX4DJmK6YS7O0ZUdCQ0WXQV7Vr1dZYCYHjrVd6ZtigETJhFcC6
         TIcELl46ZHgl01I0i439+V+mia9KP3vQyMwL2ffbJminIxPIirWU+YNqg0wWn2NkMCu5
         5uBiqWB8vJJPp1NaOiH+TymM8SJQk85AdZPGdPqR9E0ledMy32AcU2EYWfQf86FN6VA4
         yu1JnmEeKzBb+BDpLeV+0t+9ufg3WLlvnsYB6iPnwSKb6XWxRzNSkNobR7yjbzb0J0HP
         1vrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701191061; x=1701795861;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsuqKKUCV3ERuWqdVBH/QhrklJFAIa7lTkzZdelGo+w=;
        b=azOL8uMXd8po66xsAp9/D5GLqNQ/GEQzeDHo+SInWviULHUscI7KhYkazULpVZGnKc
         ESjEas4Hlm6yWA252ASf6CTJnGzBTEqudjIf32yshwUaKRCwN1eIe+YUbT4qcq00W5xU
         RxpEEZcSoWs64xNyLX94givMvv+SIKO5aUuryzyf0Na5f/EjShEtQqX1K6Z2krUB/lhI
         iXJ+j8WPsdkpawnchMSN3jJJE+AKX1fDMCguKyCKcSsTFKkZUKAJDssb3BIHpOW9rnSP
         aYNgzAG0VW9GPnsRiJ6jOx2aPScqsgBPIiFxdeLCskp1+eAIthmELJdXlKsG/ak3VkQy
         jcOQ==
X-Gm-Message-State: AOJu0YzgxAZKc/4qnYG+vXc1HVRmRoCREqadn0W9c1a3an+9oNlttKJt
	FUKhG5+qxMhjldzACJZxlHrraQ==
X-Google-Smtp-Source: AGHT+IGzoL1RR+ul70VKPFVpN6V1s4oY1AymwO7rVCHGRAOkPNFqwK1jEasMirZhuxVCLUha/OnTlg==
X-Received: by 2002:a17:907:c708:b0:9b2:d78c:afe9 with SMTP id ty8-20020a170907c70800b009b2d78cafe9mr15197613ejc.49.1701191061522;
        Tue, 28 Nov 2023 09:04:21 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id j27-20020a170906255b00b009e5db336137sm7004481ejb.196.2023.11.28.09.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 09:04:21 -0800 (PST)
Message-ID: <200838f8-c35c-498c-97fa-80cb6e5177ec@linaro.org>
Date: Tue, 28 Nov 2023 18:04:19 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/16] drm/exynos: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Inki Dae <daeinki@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, kernel@pengutronix.de,
 Alim Akhtar <alim.akhtar@samsung.com>, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
 <20231102165640.3307820-26-u.kleine-koenig@pengutronix.de>
 <CAAQKjZOnVSaO6QHpSo_i=WgTaawTq0UFtzwTw8kQ5iHN4qiAtQ@mail.gmail.com>
 <20231108075454.3aivzrbvtr4en22e@pengutronix.de>
 <20231128165505.wm4xs4ktycswthkt@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231128165505.wm4xs4ktycswthkt@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/11/2023 17:55, Uwe Kleine-König wrote:
> Hello Inki,
> 
> On Wed, Nov 08, 2023 at 08:54:54AM +0100, Uwe Kleine-König wrote:
>> Hello Inki,
>>
>> On Wed, Nov 08, 2023 at 01:16:18PM +0900, Inki Dae wrote:
>>> Sorry for late. There was a merge conflict so I fixed it manually and
>>> merged. And seems your patch description is duplicated so dropped
>>> duplicated one.
>>
>> Ah. I have a template that generates one patch per driver. I guess this
>> is the result of using squash instead of fixup while putting all exynos
>> changes into a single patch.
> 
> This patch didn't make it into next yet even though it's included in
> your exynos-drm-next branch at
> https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git.
> 
> Is this on purpose?

Not exactly on purpose but the problem is drm-exynos tree is not in the
next.

Reminds me my talk from Plumbers this year. :)  Slides are here and
serve as reference:
https://lpc.events/event/17/contributions/1498/

Best regards,
Krzysztof

