Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D99112B79
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 19:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711394257; cv=none; b=qmWArxC2sYzGGD93RvlnMwMMi3kIMKd7T8txGqSbd5Ed0lOoeRux7jlqAgPi4DNqdszrEWpGyvEsWzyFyYh2nQvxx5DHw8IJ8g2TRg2SPC3JfNa4zOEiX+esc2D8aXgul9KPVT9O7hijyKfzULPWoCCCAjUMEVVsj+wEtwlQid8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711394257; c=relaxed/simple;
	bh=VFPj3HVZ6MVkt0goamwLJPX7XBWyrk0b49py+lu/r+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P9vONY41FR4up6tZCbQ5oDIcvHdMtcsI0evN4TZN5vkS8n2f0ZjeUvNp8ZZqimiyyPmcBfGU72a++V6tjAo5rteQayKPIor++oc6b1YAZa+EDDPcOOuM0e4W+JyipKJoMZSkHGHcov2RaKHAMbQQABVSTytXyLH0q9+rbbkO7Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UBYI1UlI; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UBYI1UlI"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5684db9147dso5484526a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 12:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711394254; x=1711999054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HKXULsUGUCcHPAhnpI9UxJm+EL0fnuW+oMPpc0j9NRA=;
        b=UBYI1UlI56MmQkocohtJPPvk/8vdA25sC6zMEephnErVXsJ03jCroKuLjZEUUVmoT1
         NCpz00ta0VVMkxNZp1U1NFnLDcvh9yzhOZziuU+0HH4vKCyg/+3h7Ke6VOQ5ywMRaiol
         7fnN8iujDX60q8c8bOMv6Qst8Tfl378Qe4PCE4h+bOsuvYLhJuCS/Uwmzk8X64gkTfB7
         f8lg35PWzKZ/PvvMECKwt1dn2Ml/wGKqvfmJzjbwktX9dwzaSXBM2HiZKCdBvBqyyczk
         DJOJHHibeYaH9VvX0GfS4bRciWxUgs/ycA/iu0uBmAwufkWDQAYb9UrEXLORjK+fU9+w
         9kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711394254; x=1711999054;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKXULsUGUCcHPAhnpI9UxJm+EL0fnuW+oMPpc0j9NRA=;
        b=Z3BxeTguWgGScIv9z9Om3nnQV9DVX4LL46Qcr5weQaEHrHqJwISZLnzShjvizmupOh
         HSnGZKRQtmzClIyohX66WKY1l2yXyBYR5fKm6iuOtwqQcmdlEHzO4t5PZKTBeRHyM21R
         As6XtrULs1LqSoafs6kAvjX0EG5kH2L+x4SliGqjkUueR4hWJ6+OYrcBZEAVl5WEi7iS
         sL7ztIf9D7nmjZ2UcMs6Xmgm2jicVU6r7ZjwFrXLg1jjDHyCvRsdKWqL+ZqczcjSySIM
         uM30qtjCkErAFMGsWDB7XVn7FPJJ/gSluLd3i7++ya9qcXYeVKGG3hXRrcrq07+3RPPJ
         CmVw==
X-Forwarded-Encrypted: i=1; AJvYcCVoPLaf5endNfGwN3t3Sh/xynusGZc5Xk3OjJy/tW0Q20VO457kERUccKX0PddWeuTdt9QkthuxxTulkWc6aVal/4tHTO4Vk6RcEX1x2LNHsms=
X-Gm-Message-State: AOJu0Yw1RRhHxJmhabL/ETtQloIErjcZQa0zN2k85fOW+i+2fmRXHjPT
	Jar5WS1TfCxo6bS9vneir4lfHssaZNzOIMCvKGe4tmvsqO7WkK0qOpyoWxATDso=
X-Google-Smtp-Source: AGHT+IHh+nUZb5cNhU4CtDaGRh9sjtc+SuYqTIYmqwRB5iTfwmZF9azYewVcg4Wg2COdyX9ZQRR3rg==
X-Received: by 2002:a17:906:f90e:b0:a47:31c8:81f5 with SMTP id lc14-20020a170906f90e00b00a4731c881f5mr5209922ejb.47.1711394254275;
        Mon, 25 Mar 2024 12:17:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id kt16-20020a170906aad000b00a46025483c7sm3310532ejb.72.2024.03.25.12.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 12:17:33 -0700 (PDT)
Message-ID: <637a6390-6e38-49a4-abf5-b0d2b2a31093@linaro.org>
Date: Mon, 25 Mar 2024 20:17:31 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND][PATCH v2 4/4] soc: samsung: exynos-asv: Update Energy
 Model after adjusting voltage
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Cc: dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org,
 sboyd@kernel.org, nm@ti.com, linux-samsung-soc@vger.kernel.org,
 daniel.lezcano@linaro.org, rafael@kernel.org, viresh.kumar@linaro.org,
 alim.akhtar@samsung.com, m.szyprowski@samsung.com, mhiramat@kernel.org
References: <20240322110850.77086-1-lukasz.luba@arm.com>
 <20240322110850.77086-5-lukasz.luba@arm.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240322110850.77086-5-lukasz.luba@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/03/2024 12:08, Lukasz Luba wrote:
> When the voltage for OPPs is adjusted there is a need to also update
> Energy Model framework. The EM data contains power values which depend
> on voltage values. The EM structure is used for thermal (IPA governor)
> and in scheduler task placement (EAS) so it should reflect the real HW
> model as best as possible to operate properly.
> 
> Based on data on Exynos5422 ASV tables the maximum power difference might
> be ~29%. An Odroid-XU4 (with a random sample SoC in this chip lottery)
> showed power difference for some OPPs ~20%. Therefore, it's worth to
> update the EM.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  drivers/soc/samsung/exynos-asv.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

I assume there is dependency, even though cover letter did not mention
it, so:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

