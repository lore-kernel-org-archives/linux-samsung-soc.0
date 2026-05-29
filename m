Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112D63A872D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 07:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780039632; cv=none; b=OEk/y+n/FNfg3GFcLbadbJzP1AB8TlodKW9oeoIXnBaVWxTFWEENhRVjSM7mlbyfvQar2JW0OgYHyn/KTfANo/+tbbK45Vztbs0JKjjlK9CPOSyVWQKOfZnfl9Zlhr7+UYuRzh9shbXYm/jKKwGc6sZmtH2eTI6m2jOZcj/T2uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780039632; c=relaxed/simple;
	bh=EfKOI1MhNdNCtFTETqtogGkGBGw70Ri4WZ28lvlLvrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sAu7yz3C+YD6CGh2TQ4esy/SOwnOjCQlEu9g2DYZyXnpUQJCXJRCAr7OZ3inIkNC5Ldiy/WaLda4+HC2/owG7ZwW/7MNS5FgXkp3ygze9u0iyCT19wnaGZmPHK0vnHRDU9M1uKsXwLNajgKMJ77tBXJLqdRrCnw2jBMxKzL5VXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5BhlVk5; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5BhlVk5"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa50ea5661so1136724e87.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 May 2026 00:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780039628; x=1780644428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oelNQunsqm6lRn+BaGSQ+cqWJ81wjwxd4/AhjqK6NKM=;
        b=n5BhlVk5zhWeWuh3R2o/C02pta6AC0QnOmOKnaco/8gpMqpsRtLF4N2SjudetqFfYW
         AQsaYYeskjQ2SaksKSeGMof9EgBSHoMPk22xYzDvvzqpHBL9Be0XWzL0WokSmWdqnA1v
         Oe6WSBsmkfOQgMg9sgf4Z0sIqu7ErTZAX9NAEUndzGdYVuu1xXTvInOA+aoci1zWYttp
         x40nRVGP94AtKYZ+V3ZKjzjKl5bIykpYHpr8h+1hSVXRy3SkxIwpnn9B3/J0SDX6vSKk
         MGifpWy+cuov0t4+pQCHoLVH6BxiTHVrsGpezwbAk3oQtPa5Ei8JVzcMKSn64/6ECp+5
         RnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780039628; x=1780644428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oelNQunsqm6lRn+BaGSQ+cqWJ81wjwxd4/AhjqK6NKM=;
        b=eraLWR0I9GApRyYNxY0RsZZrx1Z1okAFAFS46ApmFYoLNUy/r9AUqbNzHsK4mUqkgs
         HNWCz4WSUlzwZ3Vr3U4JDADx5HOqi9sRJ85Pp9o+ce2K5oOAF5gwRuNqlbzLaK2eykMc
         wIRF5v5ayByfLF9N5XzokXLRZLGD+9x7hD2Qhp/qzyCGME28jtgbfbiQ0qf7ucjTxx39
         +5B8dUVpLwoBAxj2X/Ucm3eXAJvF4dRFXn4JVhFcOZKzCkva2YDRBnr569fh/jiAkU1D
         a36tcNpihjLvdgLY3ahbRj8JTh6rYFKvElSkfkZUZ5Mmh1ZHu97f7WQJ29O6c+gE2U/X
         J0hw==
X-Forwarded-Encrypted: i=1; AFNElJ9yqDH7GdXcqJwCAVgveFf9q7vJ2biG13fkNWiPiPGt2oxGOMHZsTDWTD9JCI5ef93ZGqGDryCzmVdArciNCr7UPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxsqx1StfwUSfmlJeuNgBw0a+mrPd5bcuzxPq41ckwMG55rSGB
	l3BToDb/R1dcR/Y4H1BNMAa5Ke7XlbZkC2EEA6IXb407Fc7UkynCKo5s
X-Gm-Gg: Acq92OH6iERLxhWG9280Gy3cO8mO9Hx6JId5yf1Y8LFS61skp8zPRDw/Tz9PklERxT6
	9bl6f6CIx5thffYkljHinSO4Ek3W74dQoj3QbERwddTSC4oWgvss3poEDkr93lZn+l9o8dmqfmL
	uWrvQavcEVNMe728BnSEpo27K7TGT4mB5XrHc++PWT+ty2lANmmMx0S9SGbE8YTR99TdS8ScAZJ
	lNvnQdpP7rrl9TOyYD5t8ZYBjvq5BJLsxTT5VCPm2A08z8fjKXuo+iMQmK+VUg1YP2+RqUsyB+p
	Mq9aIrpVTnk3R+C1azQkpNpDatAJGhd6MOJm5t4qp3HQfL6R3VX3Nkowsy0dSs7JsSeTZFTN7R9
	Wru0Ib03zxP/RIsJXiJzCmL+CFsIHtYSk2NhRuT5GuY6YixwklNq0pw6FWDHj4AXhQtSMVLOypb
	so3OV+FeXuDElY4tfWt2LpOCXb0f0sy4wHnB7RE3ugp3gTfi9ECjlATg==
X-Received: by 2002:a05:6512:3b1e:b0:5a8:950f:e92e with SMTP id 2adb3069b0e04-5aa594b1691mr463708e87.23.1780039627984;
        Fri, 29 May 2026 00:27:07 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b7921bfsm90535e87.70.2026.05.29.00.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 00:27:07 -0700 (PDT)
Message-ID: <2045debf-e518-4a7a-9509-e305cad4bd11@gmail.com>
Date: Fri, 29 May 2026 10:27:05 +0300
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
Cc: Brian Masney <bmasney@redhat.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/05/2026 13:29, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
> 
> While touching these arrays unify spacing and usage of commas.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

-- 
---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
