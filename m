Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA541586E6
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Feb 2024 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706782599; cv=none; b=AVV9ZHHWHFHelC0lV5ZyzDXmNzQtukb+OMVfMd7/mgpla2OiXgV/M58cdxUUht3S3WuTcHPluR5p7p4Paf8Cn/B5PYd0e6a7Gqxec+9DQMBGtvMGx4MVq1vwwwJk/HrhQKwayULp0zWRxGySz9v9Pdz7AFWhwoSfW7wbGYaycmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706782599; c=relaxed/simple;
	bh=mw4oPzJQ++DU/wQ2rMB0bz9c1MaDOQvv7yGm4EgXNG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QQKhhoLFX6sLvK62L8vT9n8bZYZ4IckX+6qUROnUeD81cGkkQjZNSUoKCwrLBPRM/3GrTaM30C64h1zXVFlTHMGla7mivRUiz6ihCptT62bbcFPqH6qc9KTKJsito6Mg6QEEw1PE2wLDuPtGqnwRCHtY10x1lxg3Wq5BS3ZVDuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HdfTkIRl; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HdfTkIRl"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55a9008c185so1264890a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Feb 2024 02:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706782595; x=1707387395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mw4oPzJQ++DU/wQ2rMB0bz9c1MaDOQvv7yGm4EgXNG8=;
        b=HdfTkIRlQ//fdEetEJb44xtBPUOStUZce80Ztb0/tqyPbxZKWITXX2nMrt3CXRYxs+
         HzWUnm6on5cFV+rK9Ycb4DzMI+D0Tti+L1hRMjsfHR07hoGp/LnrZxBwCs7kPs5fJURR
         q1WU+ddKB+6xhq6Jm2fexcfnfuEdW3/q6FtVcnAbxiPaRCp/7DctzUAUpjiwOydSUmtG
         107btmSMWzPfjIWHXWq2hZKMqtEAeRguIdX7lYBKdKEHIM3jS9y10x4/5CEmB0v8Jd2S
         Wo0R+QcqY3xlz7+REPPYNb/9f4N7NlixcK0i0qVvkZ0zu4b0vXX/7F2ykE782MPB3yQM
         2VgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706782595; x=1707387395;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mw4oPzJQ++DU/wQ2rMB0bz9c1MaDOQvv7yGm4EgXNG8=;
        b=O2KW59ughm/OEqp15rk1LGtn4QgTT54AhP7zPZ/kmezR4NDgsyC5QyQNI5TkMHeeW1
         mu5EQH/E3kydf4+omtGyJSvqO0BGsttMQIgPlAIVs0SeAipZMGBYGWkIP9ZaX80+oCak
         Y97EEGU6VtwrCtSYX14Wnyk2u613jaWRo3CN29563+44QrcIFIqyixoiWd6HolBiEL8d
         wKCnwB5G3VpdZAUdVlX2mWYp9K6C4ExSkHot19Rjxr2CvgOlddr0BLRfSRTI67E9fY2S
         C+zbi62WasjK/LxvLIG7Pj8hMLFAla49nAj+2XkwjqyZ8CgtVWgyzQluBp/pzvh6koij
         H3ag==
X-Gm-Message-State: AOJu0YxlIImvNW5waFcL4IpG+Ea6w/ZhMymQEldohBQavT9uI50oT1Oh
	Np9xe50m4uF7A/8J6Upb8Vc+oIm3cj3YoNopw1hPOqhkqysn1mA/0In4IqXR1Ek=
X-Google-Smtp-Source: AGHT+IHO/rsGSVRpfJeQJhlOHSuGs76jSTvJGqyVP4S5Kquwd6WHuQII3L1oeoygquoCF2opwwYP7Q==
X-Received: by 2002:aa7:cf92:0:b0:55f:2be:1af0 with SMTP id z18-20020aa7cf92000000b0055f02be1af0mr7189469edx.16.1706782595578;
        Thu, 01 Feb 2024 02:16:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXUuswTcH8ZIlRr+OKWjTKr/4pDuMWqaiUkLo1owb4nw98mL/PrMCMnzXJhlmeB+6C1P3VOYk/M16IOlanfy0lmvjCvOV+yow2f0LtL3vwZ3NpmVJRyaenbLjN4zn1L0UabCR0Z3vxvCaqiNo/rP8qGdW346Jfb8E7yW4sOBLqJSNW+NPmGfsY0CD1ALr/dy0GsGnxfgenGUkOjl4v4Xi9z69mhXvNEVDHPzpt95SCFFn+OoVaGq0y5rVKRYgYokdvMSBbAUWMfLJ7lnpYXsL43Opxb36e1SQ1IGwd/Mx1Xt2eXkegStR5IhQDwThHzTEpOW30rY1bQ0yy2IBUEokYGfjrNK8eHgWxG518FqtjmD+/wuPXRGhShW8eWl/17nwfsq3zi0XhjcQXx3cThtfaPZZBozajxUJakDqsjd6oHxx+wGhLhq9qN4Dwo4EyxUUX4EFporW1rDvuypxVNWEJTerkLl51qvQVOSPyej40MKLXN9ruvwhoHCcsJnrHDs7UP6hz3f5o1uEzPrNyfLzbDY6hoch49iE8Sq0ddVRujewhgdtHlki7tSF3QWBkGyzafugg+mUZZv1+j+rRxrT9QTZjDNA9XfdX391b/qRrwnETbkefwBtx3m3E10goXFa6unQvOjNQhILuBsBnq8e+5XS93WFfznM6Nsf+Khe3YmZHKXDGr4A==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id da18-20020a056402177200b0055efaddeafdsm4105773edb.86.2024.02.01.02.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 02:16:35 -0800 (PST)
Message-ID: <54cbf305-8cad-495a-a805-94a249bdefcf@linaro.org>
Date: Thu, 1 Feb 2024 11:16:32 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm64: dts: exynos: gs101: fix usi8 default mode
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com,
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20240130093812.1746512-1-andre.draszik@linaro.org>
 <20240130093812.1746512-3-andre.draszik@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240130093812.1746512-3-andre.draszik@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/01/2024 10:36, André Draszik wrote:
> While commit 6d44d1a1fb62 ("arm64: dts: exynos: gs101: define USI8 with
> I2C configuration") states that the USI8 CONFIG is 0 at reset, the boot
> loader has configured it by the time Linux runs and it has a different
> value at this stage.

This issue was pointed during review:
https://lore.kernel.org/all/CAPLW+4=U9DBmwgxyWz3cy=V-Ui7s2Z9um4xbEuyax1o=0zB_NA@mail.gmail.com/

Yet you posted new version of patchset not implementing this, just to do
it week later as new patch.

Sorry guys, it seems you need much more time to accept and go through
review, I will use two weeks delay time for applying GS patches.

Now, for the patch, we don't do it for any other nodes which have 0 as
reset value and we do not know what bootloader does there. Bootloader
also can change.

This is a required property, therefore please explain me how, really
how, this can happen:

" we should
set it to none here so as to ensure things don't work by accident"

NAK

Best regards,
Krzysztof

