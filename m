Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090872;
	b=L+UCSSgtBksCXhT7Z+Mum3zS++Ja2HTEMU60OObohQJzqIScMrYIdnzYkOXJSECLkguV
	 l6aWMp+Zh40ppQP5ViIOOuR3udmC30VUFWsTJHiN69MEeE10XPPlSxSPtLbv+1q4bp8Zg
	 QfGH4GmCDGio2v1+8kJFxZv3SoK173MK3gVN57rd8ZaBVhL/Pw63VrZn8Vi7kR+2MKoGE
	 BUzJ5rVk5agoQIUSW9GTrisGbduYMnB3wx8YPj2+E7f4AAen8FntDSiAP9wxv1zFuHRtX
	 mkV6BEO1qq3/kis7PNy7n0rPpCiRvQARTyoKA67kF4fS3tN4AbBQBXY3C8DopiHpv1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2f21doTHFGdxnjZqkn9v66hcP4nTVSER8CO0mMlnHRo=;
	b=OaojNubSG5S3S4maxytU2xC3GVBgXt9QhCn1TV/BFECauxpl9qDv5siepAufQUn3GLyM
	 OoirkP8EgkcCsMuk6UzS/U4qDKDjAmvjGy7fgxRVhQ4/h45e5mXDbDHJ+YlUozmA4HUmw
	 cwk7Sv2vmnGOb29pkYz+XgJnW/kMMN1/p4+P8K7/9Dhb2Oq0LWXq6zpDXRxVHOzYpup6X
	 nSJMaRKhAuotUM9n+dEOXi0ocNt+ULRy3/wqYGAHSpFgz5uavdBqsCK+PGGiJv4VVzWFp
	 vDMUQCv2fMnqFzKWExRIY7i1ynq7nKGXZl3+fRu82rP01KawvYWE7Wgm+gCBScUOkLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GIV4PbqH;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EE3606A325
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2026 12:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05EE3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GIV4PbqH
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so20860085e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2026 04:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795090870; x=1795695670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2f21doTHFGdxnjZqkn9v66hcP4nTVSER8CO0mMlnHRo=;
        b=GIV4PbqHeGq4Gk/jo/EQNtTLPSTM4Fp7k84fqaHnbhCmEIzbs7mOqsfNB37GnNmQ62
         wn0+WlNIGQX5dUs/FapjFwGJ4grnw+WpaT9y8IBQQRuKT4LV+g1Y9xGisErJlNKtkftc
         tOJT9skopUObYECZQwswNuvQMSwgh3OQ1+SYEr98CS8/j+ST2RtOOKSm7WIgFZG1Bb/a
         W7LnplNGH3Cm+sW+u5uw5RSzvER+pbE9UDAEquN/wCe9s6AOz5YKGOEsDfHM1owkTiZE
         mB2n/VmUYqGbkuaKKkHAIpyvz1m5WRNti0LYA60sTZxRMg2cRjFuAgxgP+K6rBnLy8EI
         ObzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090870; x=1795695670;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2f21doTHFGdxnjZqkn9v66hcP4nTVSER8CO0mMlnHRo=;
        b=X1ieX0w+a9XFllpqazhXxGTAcxlHnvnCzjEFqqB8TMg9NkSnzBVgpgFWb4RTEZFKGl
         wUdVSfsfDzgx+JUvEIqUNQFI+4MsbFT7ZPBJz6237Jm/oCY8tfej4T0UhS05/clNrts+
         r4+m4om6WDyGXl/hCKm+vnU4pDU0tx6EjxWDLbbWDZ67MrqaGoYgPEEW+uAORrA2Io+N
         B8cmM6uxTcH8fKjTlVEcg7jwWlbOTwK+GbbVSvAzyKOaqGjG3acPLQ2z87z8CdV0LNrw
         j7CeDxQq5bmgrvF0HCPt2NJfSViS7WkYwUwFiFjmkSbJHg3CqdD1Txw4USUEGVV6jmIn
         z4+A==
X-Forwarded-Encrypted: i=1; AL+hErFCku2xSuxafkSM5d6CSDIzKX2dkbSnUL4hjyd6trO9E+rubOpeTzmrMwjGZzJdduoIinSsZO9II5B4eePcAmWQ0w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+M20c4/MWbKBcydWclnm3KDbiYj5/xKDlFTYRh0T6CuYch6Egk
	cvWbuBQ+xSDNQ/QXW5Qp5F16VKQMMWSIDC129zQdiEMMJVmfEuMP9CT+l7jyutvIzks=
X-Gm-Gg: AYBFou17wR2g7FZ4uh8zPk88dX65QDpUIh0q3+/R6bBv5APoZh4OzrqkVZN+MxtuK4+
	PAt8UGa9R9r3Hp8qAg8uIpUT50Pf/trpuqq/V17qwaJjhxa0h9ZLZlf+wL72NrSlyJsMjUoBHg5
	JXUgGHVJc+czumsSMLgarZ3MkjbRRZnNJZxXd0wEZOE4svf1p91CllPLGk5fP+0SGI4+qzx0zM9
	mE7+6J27NIBPQXdQ+62u0j8KW5VlF5gMkiuQ6caEiRhkC4DvikP4oa3pVk5Sf1EIu68oiErMKZx
	SaYFnAUSLhJ//tgoy/CY2CcQTrgzW9dt/Yl1L2K90Vsc+McLx6BkGmTtguaAl6n1jy43FSDfV8Z
	YYIy9vSl5e3KoRsWjxLUFhXl5CknTPLvEIw+a1KU6PB9ElwA4Z8h6uFF7jH1VgGwtFJZLvY4Lrf
	A6A6uM7CVpJ2ZLsIN92VhKAP/PcEw5EDqBhCG6fq1m/2ow/ivjAhN4L14MCzs6UkLQCILB6olk8
	c792XZwstBvVsad9d5AIDXQTsuRhlIXGKDf5isbKXS+EASYjkQYoQ7SbcfVLKS/0SdRv3dFhSoY
	ELZ0rKuisqGkegNUZ9xDsFXjI9qeGh8H4KEDbWKk
X-Received: by 2002:a05:600c:4e45:b0:4bb:6814:738c with SMTP id 5b1f17b1804b1-4bb7da267bamr102371215e9.22.1795090870232;
        Thu, 19 Nov 2026 04:21:10 -0800 (PST)
Received: from [192.168.0.252] ([79.115.63.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e4df2bsm31124375e9.3.2026.11.19.04.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 04:21:09 -0800 (PST)
Message-ID: <274849ed-4090-407b-bc3c-57caa029ef0b@linaro.org>
Date: Thu, 19 Nov 2026 14:21:08 +0200
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] thermal: samsung: acpm-tmu: add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mateusz Majewski <m.majewski2@samsung.com>,
 Thomas Turner <tturner@lineageos.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
 <20261118-acpm-tmu-e850-support-v2-3-19848c0d97e5@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261118-acpm-tmu-e850-support-v2-3-19848c0d97e5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/18/26 3:51 PM, Alexey Klimov wrote:

I'll review this after you address sashiko's feedback,
don't wait for me.

Cheers,
ta
