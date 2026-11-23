Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455308;
	b=d3FckXMT+yybB7ZLhN11sD5snVbEEnqVjqUk7uqPbH5kZvJlct9+ov0dvb4ctRqgQ0eC
	 eNZxJ7JwDbQWMzRvHsYhP2BTXkcgYUphbqxVmXmrrUnUbnESxCj642qDOwB9fmn0WJNpV
	 s3yoyDaPUBmaEkrKw6bgzWaVqUiNo1bqqXSJBVd7ql9luDscp5Gk+f36J1WuAp2BZoQNe
	 qWwbFVF4DH2MnHhKbAmndx65pzo+Tr8rVvrBnGQYwQa2sjIiR2WyeHtapCyuOdKN2K+h8
	 QHFoq3ZIfUzBYfYMt/mdqySsGYKq+HXYk+tkjuAWmocuRqx0SySgghwhWZeAzA/OhFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=bipnXXOP6GEac7VhzrWgQysb5XbdawIYcGpzXVL1ASg=;
	b=CNkq+prUkI8Z1PdD6QwZH+Ynv7s/IByRUtuiDBWMI4lqpN+LQLGDQRrlxF1nPb0CvDM9
	 QKrKdNKper6ubJPW2jamilBwo5aC/FudevkN31MdyM1gp45O2U1y+8d9dYc7GhMMUr1iK
	 IMRb9AvdvWlZV2T4NnlKP9Y8DwICXPC2h3xRXzQ10+MplR4+VOt0OHwESEFQ4qeCsiWrN
	 3QxjcDNlWk4JwMsBMEZvI4ZlMrX4I2cI12LSPJbV9zBwiDV4y2iVEIgWikoC2Itbcz+5m
	 ka5IdKpzqsiae+m9i0OGv+nE9hB2BYqL8aNVn8vQomX488WICZdhp2Zg8atJVG59jNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fH6SuyH+;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DEA606A31E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 17:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26DEA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fH6SuyH+
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so32913585e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 09:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795455306; x=1796060106; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bipnXXOP6GEac7VhzrWgQysb5XbdawIYcGpzXVL1ASg=;
        b=fH6SuyH+GAwKxjbaDzVOjRZqrGQU9AGITxGNf7rkedt03na7jbquWkibUTZecf8WT4
         iFKaebptewviIItuq+30wSBqYaSc3NDBD2/nBrJ5bYIWO1KTBgtyYFZBK833MFEI6vER
         pchYm3ZY11joBAOjjZNLD0+KFUYKgvN4MkRgnDA5iN/usm4fcFLLissoQpPs9Vy0PQD/
         yh9Jo1rHlbH0iLAzc/aaIk7GP02n7g8+izEw0TwI35iMm/wNLOweqqhgUHt0xD/LvMlo
         Nz2l2a/telv3TzE+NOO/6DmZMgH9qKJL5gLsslQIFFrVpdobd/KYe0LyZWGGgGw5CXry
         Qk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455306; x=1796060106;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bipnXXOP6GEac7VhzrWgQysb5XbdawIYcGpzXVL1ASg=;
        b=VtF7u3BvfX24ZmgPq5mPvu2kwiI0T5dLOVL3BdgwlXRUOUcyUch/WAqgJzTCvIH5Tx
         3qkRKNgfdDapbeoqQ1mcOPBoUehM2AhMvehFUf1UzWIpB+8j72BBSLw3YNJAs/yvDv+k
         yNZrcYqE6JypV7t0jGmLpDm/CG0MlA3Lbh8md6rcUk0hZZRzUuqqZHhHaaU1Xoc5eVhD
         CXLEBmFNtp777p1HGFlSLlGOA9ml6BEnAN8+cB++MUIxj2xuWxl9fqR/yu3UEcW8+xou
         2Mp9JeWU18Y3sIEwuXqrv17h8wD6NAIBwxdkgEVmezXppXEy7Nq6L/a/RU79smdUpXdk
         RVWw==
X-Forwarded-Encrypted: i=1; AL+hErE3YflU4oi9PaUkhZ/Nl4Uv9npNPDhXYzqLFIXEKyq/wNkfhOsdzGfpah5Quap/ADCn0cxHFv712OuWJf8Fbj7s3g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9qcKGCEbYuWSBUZk1prcn+5gLLfoT5AP7GLCeQh7oefhzldSoX
	9N7e2MaUGPCMtg5g5AM+00eU8uNvxdaSkx/WPa3fS8puM4mYfY6vL7zWRQnWQ/diQHw=
X-Gm-Gg: AZFdTZeeajqKkWo5DqM7wRdr+1X8s9WJCrh3h+kPg5R9Tm+k2uj2Au1toVkd3mql+2h
	6owwCXifegs0LyBVNm/K5JCmljAdSZuouxHiznT0Z0DeK1BRTCsX1uiIMePFJrE5giQpp0k6B2L
	yslNB1sUXknWob6nLYqWZoyWy+eaLdKSCkteJpXTn0lxOPcIuQhMRCSo0vJmTQO5RcbqLVdB8Uz
	rXqLUwZIRDhYkWPm5/SbpvukO0y0sqnEjCYK8BlVUZkZdnLlD8DiNlzx0quBskcm0tIyKsLVYoO
	+80mK9RErQ84HBzR7El2nWAwW9eb5fb2jBJokn21H3vdjM9RxAIdocAz5xJBI9rx19vGGjCIOm2
	MYBvYGkaKNy2kC9X5o8RISDSjrpaf0NKQltbpfKI9UQpWUxEotHQRRdx6enBuUMGjFAZlI+k463
	3LYVLP+JV6fczIovMFxk13PPWaQ4Wa7j3TS8o3Z90cRt/qHQGuuogslLVbcnICjVvmI0v9056Li
	XhPF/ClTWPoQ4UkvfIbeIbIjDhz02qSlQA5199W00V+UJtoqBxmdy4hh3xqX+Ys0UME6ucK14z8
	+kiJlDFHg6Pb5ycGEvJplMChZjY1E2nvRlN2Eei0vL4RFWxp34Eu25Q6JikfNiRuK4cb12mVldZ
	XDxToS0rpXas9Znkh81U=
X-Received: by 2002:a05:600c:820c:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4bb887876c0mr279140365e9.0.1795455306378;
        Mon, 23 Nov 2026 09:35:06 -0800 (PST)
Received: from localhost ([2a00:2381:fd67:101:aee4:8c07:a9a3:c706])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm291142275e9.0.2026.11.23.09.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:35:05 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 17:35:04 +0000
Message-Id: <DN2RSBZYE9CU.1T1IA1OH8S0UC@linaro.org>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>, "Jonathan Cameron"
 <jic23@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] iio: adc: exynos_adc: add Exynos850 support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
 <20261001-exynos850_adc-v1-2-791b3516bb9d@linaro.org>
 <ar9elr1_tuFhJi1r@ashevche-desk.local>
In-Reply-To: <ar9elr1_tuFhJi1r@ashevche-desk.local>

On Fri Oct 2, 2026 at 8:34 AM BST, Andy Shevchenko wrote:
> On Thu, Oct 01, 2026 at 04:09:13AM +0100, Alexey Klimov wrote:
>> Abstract the read_value() operation in driver data exynos_adc_data to
>> support SoC-dependent data register read callbacks.
>> Add the exynos850_adc_data struct that describes Exynos850 ADC ops.
>> It also requires its own hardware initialization and exit routines.
>> Add them as well.
>
> Split this to at least two patches:
> - add .read_value() callback and switch existing users
> - add new user

Thanks! Sure, will do.

Best regards,
Alexey

