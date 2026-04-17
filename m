Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22DB17A2EA
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Apr 2026 13:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431182; cv=none; b=IqzW21WQ4RtNhYqQ8bWDwbNpZNUnhtMDr+zys6AtQ4eSLhreOCV5aC9k/I+OmQLWDQ43xrWXPrNNX4ZrVgb6xF3qyTi54Kj6BogZUvy8X2EP36tvuIlGN+t4Rplgu+vfEEE1IaEQXs8cxPcWufdY708gLQa56Abch/07ERhIYfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431182; c=relaxed/simple;
	bh=ArPcEjtZ9SivxH550C9rk73iUbB8go/eI9x6T8uYRDs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UtDUZeHMXGVlzK2pqVezbnaF+bZdd99Ctc2i+J2mjzqGfhuQEuyFqT8F6WdjjdfS0muJrVqlS+kr6ODcICyJOkgtiu14ozBThaGbmX9m3ybDWN+3MhG0sEFz0sHmGdiCsPffBwK2VQT6018oBgMu9+s3xgpnqJEydsEBREA2xSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oNM71OER; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oNM71OER"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d75312379so1148760f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Apr 2026 06:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776431179; x=1777035979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ArPcEjtZ9SivxH550C9rk73iUbB8go/eI9x6T8uYRDs=;
        b=oNM71OERX4KhOiKjcbBD4pV5dVL4SdouB5WISWYHk2dYkwPSUdV2Z3e6ZG+ovXx8b6
         MHkjHw8UkV1KqhC8MbkxqC9+0N2npozrkyh6sHDm+TaC+AVkB8nWEMqVB+K2O6eLJR1T
         tJPl2exDX4Tr9/Py12mOxNLtG69wJy6cOdLx+lFqmuQL2jjQ1YnJOH3qCQmuiMTDuuok
         AHoDhBCOU9MLdpAE5mYL4RQxzu1nn4tj9XK/cwa0Ky95afRGLKtle/e3bViA6X203luN
         tiktKkPVFbjw+osnIgutB5VtoEoyOFqnpKPmDyfBZekI2NeC44StG/SdC77P/g9runqt
         nlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776431179; x=1777035979;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ArPcEjtZ9SivxH550C9rk73iUbB8go/eI9x6T8uYRDs=;
        b=rooAGzwOtFI0U/oH4jFYw7BjG3U0xhYYhN1vljQU49JzCpniYP+COixp5qCQUktXKX
         Icj/NbitOauwB60TGkfjG5UrmjhFQfZj/UgF6GyVx7Nu/Ue3uHNK02iW/xaOoWlTq3BG
         ItNfIjxbmhcvmh4PQn87kH6FczNDwdFtA1WiYaQLowFpGrkzF2aaefxzI+xuU32PkWd6
         +iCghjaZdoEpE/iVWJSAz5W8fRUGxlQMZl5VaY7213lz8JlKmlbWGQtwRs1A4iSK8NVF
         xoCiLTvnyL1KTX1ncf5/8Q1VbwWB77Sa3Tsv54pBohxaLiADM4MYuzABKGDs5kMQGK+e
         K1BQ==
X-Forwarded-Encrypted: i=1; AFNElJ93uNeHw224AlvxXEIRpPLIfxXeVTfyY2xdctD0dCLxT2fTXE13p5A49MPTxpHmQn5yCIgCttDxm9b1ypFU/dkAUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfKa68hnJXpnmIfTZtssSqVTHoTkOk/JoqmOczScLuh6rqjQ+u
	XtphYEjhS8lNv65mwgs2xKmG8Xaf/I/vN2TwNuAoHdgr3/nnBrDx0gYkwemu11RbWyA=
X-Gm-Gg: AeBDiev2KsXmHs1Wq21SAIUtS/hg6pJohbsQdak0aUTnftgRu6fZLt6h8x0vUhrYDCm
	FMPMWwTL1kod325A4pNbPv74Q0PnM/fG71OnvLPXrdpmwq7DsOudSgGo3u01yk67dxzVLc/aY6K
	X9Ywns1Ea2DJD/e4APygJDh8OeWCSHkp4Jr5GQaCBMY9Q5JgCzUdGymgkm19xK2KfLUYVvSYGca
	f7DwGDrI7/uynb6+kqnS1YnGqI5yQryYxVgfbXk6zJQKi0oJu3c1sJj7NtpR71iNMH4xSSoFXYu
	ce7qfdR6rfJFusalqeCmsPXv0AMCMKJPn8QGrp3HxaBeOpA1yKEJqv8d0b/REu7LLRvivnF73NI
	O9rbmq3Q0W839/qi1Z7FJBY4aPXOCIZmi23IKDEToFyZNOCwpiyeu6kUeaBJNGdZfxVHrtFDF5w
	+KqUYbcxWPOymiR6EPMfK2yDR87S/DNIphzPX/e4ys4g==
X-Received: by 2002:a05:6000:210d:b0:43f:df55:fe5e with SMTP id ffacd0b85a97d-43fe3de41demr2740203f8f.0.1776431179277;
        Fri, 17 Apr 2026 06:06:19 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc09b1sm4687367f8f.9.2026.04.17.06.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 06:06:17 -0700 (PDT)
Message-ID: <976440e5-f433-424f-8ff6-c7553799f1d1@linaro.org>
Date: Fri, 17 Apr 2026 16:06:14 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] thermal: samsung: Add support for Google GS101 TMU
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>, daniel.lezcano@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
 <DHNUUPQPD5DR.18P18VV0LNTI8@linaro.org>
 <63087cad-a8d1-4ff0-870a-6e1a738ff8b8@linaro.org>
Content-Language: en-US
In-Reply-To: <63087cad-a8d1-4ff0-870a-6e1a738ff8b8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/9/26 3:22 PM, Tudor Ambarus wrote:
> No, it's more than that. When I talked with Daniel about this driver, he
> suggested I shall really focus on using the .set_trips callback instead of
> .set_trip_temp. I'm not sure if it's possible given the static nature of
> the ACPM interface. So it needs a bit of investigation, which I couldn't
> do lately.

FYI, I switched to .set_trips and testing went fine. I'll recheck the
review feedback and resubmit.

Cheers,
ta
