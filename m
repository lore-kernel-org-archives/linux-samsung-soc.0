Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615753C5DDB
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964914; cv=none; b=P7JGubmxhv0kI4Rytf8hk3gDdDTBlG57ieA7AoAIarKAoBOTJV3VQ5D37APMS61cJvNHSOesMTwAc0VXN3PHp+mEgVeRfaEPEEbbnX3NZGUdFjXqDjW1qC786balpbCwj276Hen1BKU5ZSIRNz3TGA8u2nZWe321Nv4KfH4sdmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964914; c=relaxed/simple;
	bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SOsPMyX2sygGEVexcNhUnhNyPi2h/6OZq5nR5ZJuXSt2dMSamso2vpn9U1QFpkkgKwlQU9ko4G2jz7X3VTflUwgJ0zOh6oldl4RweYpmwy4ub1c7WLOOcFu/f+sGmoSSbwXugi6UPTtQZ800LS5VwAfbpMhvPl2FtkN/1nQuib4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMcdwc8m; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMcdwc8m"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso109446145e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 03:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779964912; x=1780569712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=HMcdwc8maOZHY59zqrew6I6AEx8MAPycUDCXaAMnRQBU7ni0iSRSxV0He3YhlcLb/l
         GNae1x97frGoFW7TN02zbiyLBbp47m5JFwnCHItM7mXGhFj1iBxxqKL1NL6RyBB4Kp5O
         f+DtYNB/I+3XnXuT7GR4LTdvu6xZM8RCBBKvxL4bjK0JOHnCTLsW/lOSrd+OJoIdEZIA
         GJYJZJNLZ1sluT3f1QHEDI+hCByK+HxFbZQWChLYcrPmY8ow4T0z98P/Mu3gOIb1kUme
         /1JIFcSea9/55H47jwQgxs+WpouxPAgFPSeyF/EDw3NeGy1f7/Dh8RTVnP8Zlzrw4FlU
         q/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964912; x=1780569712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=PHPNiXGQ285UD7n0b9Sc0MFgqjsNPyufY3g/6HT7Hi4cdYJhtqy+a1XE9TRdE+wqt/
         YHokLyv1eKI0ffXN7NG0KlkvEOsuZb2ee8Do7BDjUDeG294WoUO2CmKhMrUbaWVfJDR3
         oH63STTNLcZJp5nBUPWbi7XZeWZIms9STN87fFXEymSRj1KfShDcbFV0+RPvdzFF5OJx
         V+vGtzsvGI0Gzrh9j8Mg90HK8kw1vmrwF3FsQGEyWoehrPbStp8xMZ3ZBrYB4f0/hccL
         aliGNyQQk99ZAsObJs5hzqUTFtW1EpkKCMHGCC7TIk8/Y3je96eCWNVQjxQd+b1azFyR
         ZLBA==
X-Forwarded-Encrypted: i=1; AFNElJ9BSPGypJg8dZrpn6Uz7F66SH+QxakveTTo92Dj3+P1lEMAyug2vzejAEo6xX0FFnV87yW2wKWheKdE6++gZ5SZhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBmvhZGWJ/Fg3N6m1NfsPFoXlig5aLXIw7W40STyWTkFv5j+4e
	SG8XqhEfs3JWZSkqb2rWoJiv8pIC9T0SHYArohXjBhuNVWLdp6sTybB9w0SNEhSsAb0=
X-Gm-Gg: Acq92OFJVFad073aBJQAnRKVpOQ+kAkPbXiG4Y5/7BSfOtmJsoEBs+8YcTlAmdbJG8a
	clDyy6rMsWC0MW1dSNUnP2d6wXsjzClz/5+NguDuLInFu85yoS5Dg5Gk0D88Pm8VjoAuI//eerT
	RdiqhY6cuvn8nGdBWaqRkDTzkvGkkWPXdWGGg5ncvAWCR2yjPNL8co3jlEGgCCxn9O17p09r8UA
	GOCUAYh8ZShnDGDpWH8wbpO/xZ4VcyhZdpAgQFLj0gUccSOSoYgsFJPZYYgtFZl9xDVqU/GPohA
	SAOQaJqfwFNeUGaBC/hco9ME0oBLgYEsqfP2BRAxcfT5QykVISPjLsS/sZ5YRrefeiabvu7yrMZ
	bjSMVuzZRPS8rF4bAi1gkQJNWCejC4QRLWi0yMKSEpQy6g7qLazjkvRI+JxhiRGrrEUN15MPa+A
	h52JsAS96Y2nVU87ZsXu/8RBbw6gw7r0qbI2lfeDR699vfcrqeSRMp
X-Received: by 2002:a05:600c:81c5:b0:48a:75b9:b0bc with SMTP id 5b1f17b1804b1-490428e6ab6mr404500895e9.29.1779964911807;
        Thu, 28 May 2026 03:41:51 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909235f8c3sm31076365e9.2.2026.05.28.03.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 03:41:51 -0700 (PDT)
Message-ID: <66423f14-b34a-4cfc-9bf6-0bd1da4a8d1a@linaro.org>
Date: Thu, 28 May 2026 13:41:50 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] clk: Use named initializers for platform_device_id
 arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
 Brian Masney <bmasney@redhat.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
