Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687494A207C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143726; cv=none; b=Avi8Cm6NqHghyVjHwlLe62aI1vPgyw2lw2sW6qzycScwGgQotN56J9tQovl/oHVS2kyxtOrEZhwsHAq5i5GAeAx/I8LyOaJ8fe5ZkydT1gzVimtNa6MQZGt+MVzKxhBc/38j+MMl9nhGJNKGdjpATT2D5mi6O1oyRLsQuFMelE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143726; c=relaxed/simple;
	bh=GxfLvy1lNLqnB7cOHn1e+wG0w1lu+LJsHvlm3Jjb4j0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Awplz5IGkUK0KnX0V/1Trc1rnRiEj+6/rP+jZ4XWz2EDnhS5utUkiBHQk3byoP1uiv3bav9OUYFTxvmGJEo/qa4Mzmif9JxmMNQrC/tbidS88LxxzdbjGX89l7KUs1uzUl0tiS5b/M2MZosRpdfDQ+6uP71MnQFb7KpCRIw6EV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZwQ0qhGa; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZwQ0qhGa"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-486955ae01eso1128977f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789143722; x=1789748522; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2u8iyN3q0EUKLYr5pleadR3LYPKgReYhURZxG75dAWM=;
        b=ZwQ0qhGaV6/PT65RDyP2g6qHmcWxAiCLfwzjGYgsaASBEHR8L8x5HdunFDG5OZbNpB
         78yGcMELWwm7PB6xD8CsIzzDKlaUZUYTXeT3VLBsaab0am0mlb+PR65D7IuaVSgETA2u
         jOKpYVLsfO+ZD0hHUpj8AD+FpElOyIVAoZJKmeLqN8qTuIYDvMeAdbcuD9yC1ILYMbyB
         G5dMJwLhJ26rumxuZwI+wh9Y8kiyFk4Pmc8R5mTbI1c4bMHGfCDYXC1Ni8uxObLxE48S
         vGX+cyHIrZEwSs0QXKqy6s+IxOst3rkYnR4DQlcFWrLZnM5+xa6sHjkMTcPW/QSncVN6
         Ociw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143722; x=1789748522;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2u8iyN3q0EUKLYr5pleadR3LYPKgReYhURZxG75dAWM=;
        b=GsAEM1eheGzu6OJ3MB7+BXjyrVFpcbr4+uZxy57s3ggwIcXnR/0AnfDcYsmQE1QYGY
         /Lhfpc0uHikKIkUXygIqrd3rfaT66gajghzpVfTnT5NzHQLHUHGoXBWBNdEOOwxuOILa
         rUNQuP2o3JwFgzMrRCG6HAv3jNM5JktaPuuw9cpSZoim6dxpNdwBh8fqhAfoxqIc4a+t
         1a6WjQXa8BmTsHXopy1NKOGoke7/UbzhMqscVZb6YIq+lM2WAJ6xXUOOOy/IIZWzXzi0
         6rXIugU3NUKJuFByhe3j6H5HncSXHEm2S21U08mNb9BoxA6WjawcOcgXdb3wvGQ2gkJu
         /xzw==
X-Forwarded-Encrypted: i=1; AKwUvBywMQl7UPP+8FhWLFXdnEWy1TqZwjNGriBQ1nWRiqqJ1tU1/yKDMphLrC6Ii61RisP3NH4qhTZ9tbLnM0+2Q/9MAQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lNyJb2L9//rxGjXQR1X1oEGAHknWxyE8pedaIzJHGNBTgBrFU7
	kuPfDMKezLGW/Fr9CBzYLRV+cVd1LY16oiBsvCTiDfxm4F3j2vpRlr+ArA3oNb4gH/A4p8J7vqv
	6V+FX
X-Gm-Gg: AYBFou3tu5MYCprnlSbASzzK/0c06F1mmaDmbe+BQfmE6bPwDfv+Q3l1h/cwLN7n/x1
	pHeTkkKyfDwBBOSQapJdGbk4dmuIDHP0xy3N8D7qIq3AmWwNjShslv7JLCkaHWpFZRhvkv03ptn
	O7JxZjs4+kSl581AfZZ0yGtQfGcTnAaPQj+fOJb31ovffgFVKZH1SUuusUscq0mRINGWZxrAtow
	c7aPwD7CWLA21bF6/4DAz1FPG0XO4vU9xC9cEicOur+DEuZP/bNlcGUeTBD/gdoQ3W+/6SPBb/b
	XJWwAc+40ewH1Wv+06foEJNuAsrJGIpN0uspNasqNxrJVcKrPpGjYeC5zwBAZvT+Lw/Q6rmQpsY
	n9za6+1H8JaJaM0bY3Oz8qu8vhdVAVek+Hbyx9Q+m/nU0tSnlh4jLP97DvKwjkPhd+ia8rdv7jg
	O9o6EpSCGKoZ1dvhflJZJyTYSz5NaXoOrZu9UDxBWRGw4NKcrvfGW+G+oRCfzjmXnCdVISZp7JI
	HSf4flfuglYK/j3Wj2d/UodywtIshtsfRUbl5U9/sf1/SmFvb/59IBsSY3oZNRnHSi6j1Ax
X-Received: by 2002:a05:600d:6414:10b0:49c:fc6c:be16 with SMTP id 5b1f17b1804b1-49e619c64cfmr43100325e9.28.1789143722456;
        Fri, 11 Sep 2026 09:22:02 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm75330195e9.2.2026.09.11.09.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 09:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 17:22:01 +0100
Message-Id: <DLCMIMOI4D23.1YB1F2148RZE4@linaro.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Peter Griffin" <peter.griffin@linaro.org>,
 "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: exynos850: Add acpm SRAM node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
 <20260727-exynos850_sram-v3-2-8627a49188ec@linaro.org>
 <CAPLW+4kBHV=pcK1WyEerQ=yg-_XcR+FMXe1W7OmrMX3hxcXo_Q@mail.gmail.com>
In-Reply-To: <CAPLW+4kBHV=pcK1WyEerQ=yg-_XcR+FMXe1W7OmrMX3hxcXo_Q@mail.gmail.com>

On Fri Sep 11, 2026 at 1:28 AM BST, Sam Protsenko wrote:
> On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@lina=
ro.org> wrote:
>>
>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>> information and configuration data. Add the SRAM node.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index 3881f573ec08..0b614caa411c 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -163,6 +163,11 @@ soc: soc@0 {
>>                 #size-cells =3D <1>;
>>                 ranges =3D <0x0 0x0 0x0 0x20000000>;
>>
>> +               apm_sram: sram@2039000 {
>> +                       compatible =3D "samsung,exynos850-acpm-sram";
>> +                       reg =3D <0x2039000 0x40000>;
>
> Why it's 0x40000? I checked the TRM, and it says iRAM APM area is from
> 0x02039000 to 0x02069000, which is 0x30000 (192 KiB). The downstream
> kernel (v4.14) also say the APM SRAM size is 0x30000.

Good catch. That's my bad.

Thanks,
Alexey

