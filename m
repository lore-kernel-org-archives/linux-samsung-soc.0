Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF931D7999
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Nov 2024 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883338; cv=none; b=uWeLWyGJpmxKUd1q2TYw2WdxeeEL40n75ItozRBe126MamBGfcVsxIarMMzcgyZM3k8lEUBMrDbsgmiDyzmFOmiWA0FwsG7Rs3kGv5g+0/gpnVgRrVGlvc7fQh8x+fOe+fEMd1h4ZdcH4YzxnmL0V1/4nkLhKMKouwoCO57vv7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883338; c=relaxed/simple;
	bh=RPeOW6JjcWWwZ1S1ebv6CPfR3HHN34D3uavDPO5es/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tBylZYr79HMedcHD7k0oOYfBw60cKMHQYYWKsI8Xt+l7hmaI/OddnjZd6rhXfksdR+QA24oUMb8vx570i8Pqzk/sfazS5ACJ5i2phOI/Dm9y3S74gzn8vA6/h6kGE/C7Nypj0LiNIrY10AnwFjPNvB3meWeF0VV6oplhiTPyOTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zc3Jx98i; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zc3Jx98i"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-431481433bdso57142765e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Nov 2024 00:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730883335; x=1731488135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=67sx1Y1wKCzoPTnnl2N8Wzyq6odgyZJqwZygVCBaBO0=;
        b=zc3Jx98iqbcKxGwFfQhlwRib/WmC/XVyV0TGoxI1VuJmxbRt4ZE6S9YZ/Py9k64J1p
         MJVEJvjCnNHrFSobmfoQZccgHczmdi3sArMQnnyY+jd5vdSgxITcKMOcYjqUC4EDCx+8
         GROZYXNtzVIWtlnapzApDheS0VtNustaWsX+jv2b7iaw129bvEe6sqBMfx5pChvOm8IW
         UYyIBM6CcBQvKf9uHkLwL/WJeuTuqbL0RWv+zDDyGJ5sqVllWbj+14MF2KwSLfonKBXU
         Ys5AnSrcXWcVfyQ8EePPsQnz7kM/v5MYfbWRR3y5UKNpCSCrAJ8fUAh3YKpgk8XHpjV1
         ji2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883335; x=1731488135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67sx1Y1wKCzoPTnnl2N8Wzyq6odgyZJqwZygVCBaBO0=;
        b=RBNHPQAvbNJmJLaJRfhldduf3pV0wdKSB+cxQW6rswGu1S6DtD9swpHIEFSgZREu37
         obpKuONymmAkxl9HZfAd3cK0C9Qym+l8hgkRjjvQZRL36ZoKQ/Zdjd8UhqOktgUZ4JtM
         rNvft5Ecm5xNVNIfi1AR5SJ2eFOzkuEG7ajg94T/xEh5u8AplDr+Q7SZbYi+AZGUajnW
         P0ENFgsH5FfkjHFk8/eMdOuu5NZ/1movf6cRM489PcGlOZ48/4f+kpea2x3OadK4V1Gc
         CXYOnAefPSjDs1+iZex/mrXIktzUjmRl8/R1rVszdMEyaOIVjHlJY6bmXufu4G6NVYzT
         RqyA==
X-Forwarded-Encrypted: i=1; AJvYcCUhYp11BJUTmHRURyXOxd6Uf6wuFf2PwjW4ttmdYOW1a2VosYsv3LfvMLW7aE2P4Nz9ZDB7e/v6VUJAjPdrVK7iDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR7tNzSHtYT1nQclf1KPYgR4lczp3J9dkr17hflDVYg72elMLp
	TvD5YnR5F/lBtGmwexJYpHknPWkzboJykKBseOhMFEutTN+OqmpLnjMdrEF4LXA=
X-Google-Smtp-Source: AGHT+IEH+sSIkQjUc7ZZPWiLbJDj+c7I7tp0kJoxZGOA4QqPNBDd118edSTVTyW2RiryWuzndVYKDQ==
X-Received: by 2002:a05:600c:3b9b:b0:431:5f1c:8359 with SMTP id 5b1f17b1804b1-4327b701504mr179285345e9.15.1730883334825;
        Wed, 06 Nov 2024 00:55:34 -0800 (PST)
Received: from [172.16.22.254] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6ae58dsm14384805e9.2.2024.11.06.00.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 00:55:34 -0800 (PST)
Message-ID: <69aa0936-272c-444e-bc10-cfd9e6f85453@linaro.org>
Date: Wed, 6 Nov 2024 08:55:33 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] media: videobuf2-core: release all planes first in
 __prepare_dmabuf()
To: Tomasz Figa <tfiga@chromium.org>
Cc: Yunke Cao <yunkec@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 kernel-team@android.com, William McVicker <willmcvicker@google.com>,
 linux-samsung-soc@vger.kernel.org
References: <20240814020643.2229637-1-yunkec@chromium.org>
 <20240814020643.2229637-3-yunkec@chromium.org>
 <ee2f1ece-30fc-44e7-bf36-1c6c8f04301d@linaro.org>
 <CAAFQd5Dpd-TdGwTRSmoqHd4xCsSQuPuL_V11nGXrZvS9x2G=2Q@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAAFQd5Dpd-TdGwTRSmoqHd4xCsSQuPuL_V11nGXrZvS9x2G=2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Tomasz,

On 11/5/24 5:24 AM, Tomasz Figa wrote:
> I think it should be fine to just move the following parts outside of
> this if block and then call the buf_init op conditionally if
> (reacquired), like it was in the old code.
> 
> Would you mind sending a fix patch (with a Fixes: tag)?

Not at all, thanks for the suggestion. Will test and send it today.

Thanks,
ta
