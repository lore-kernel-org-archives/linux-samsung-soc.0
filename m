Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCDF5A0EA
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706003699; cv=none; b=d8nIaLF8me3VMZQiiwMh5kin9dETkevBE7d5qAtymJCriIw720nBTCFW4zfXuklofB8CcLdP7vgARigDlu0G9ZNxuE6icjUuK+NU1puhWMGBnQOvGxAk9v85Gio6C8HoCtObYxRbpOCdclVOLw2KfMKllYlKl4Zy0q3JnkIi1bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706003699; c=relaxed/simple;
	bh=s9+X44rPvtMGKpTNWIFeGkpPDxkX8dmkzY3qoWw0MEg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JXDG9Onb/Jo2jvdrktU307JwFqdcRH18wjKIaeu4UdRh0Z2+/FqcNvMaS1V3q80/uV+cW0M3SCRYnO9+ougGn3N+aS9dQXAAXzCC/lNR6uPGPkb94X1WPVm1JruOl2xAYPTW2VV6rwRymewJbZE2yYJxQM1FgMsrFoFWKEj4VM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AS2hSVaF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AS2hSVaF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40eb033c192so9273445e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 01:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706003696; x=1706608496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Im8GtCvE7H26gkn/fdW7k+g4Cg7EiQCmiyIP3+igXQU=;
        b=AS2hSVaFOPuPZ7iRgo43bn97pX4mFEmUJyRDZzU1Sche6I6ZQ5ma/ABTD+cgxSz8Hz
         joTNvO1OcAkqQDGijJgqQ509dx4LFTuzevvIKjik/fuS+z0Eg/t69tO+uePlTwdkkz4Z
         dEKgXYic56E7Q5Dk6WWyf75kZB0+4xBUHLTfDd2/3iFOj+pfQw+d/LCreqhGiPoJsfU4
         sXQHbUbiPxHhJ6gjoVZtYGgDBzd7tnsAxDNk2YSqm6P+0JONO0/OYY0AQIUIXDDBMBv9
         5P9i772SvcqQIiD5RzBjuTVH2us2QwCv0VbfVMpq+GWzG+S28lulIk3NayWRmLWKCtfE
         XfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706003696; x=1706608496;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Im8GtCvE7H26gkn/fdW7k+g4Cg7EiQCmiyIP3+igXQU=;
        b=jzSeShiGAubUqqnGnEVVw7ANcjYdA56j976VwmgTznMR2PRmSfkHAQXPM08cv6rD7V
         8TKx7Cacb5qI4hWUASgtn9REEUx9S0OMLcgJZ+TH9ZMRrvpPA2v3AJcCshDp1wxFEBGK
         EMKAnCRGE/bkAKrIL8VM5K2hpLbDE9XtjFbulb/q0dNj+eniJmD32oj+sWidgAFjsSrH
         1l/SYFP79Eh1IMKYdZQVJcq1Hpr5qHWQQC+Dj8ipDoJa0bCtI6Cwg6Zn5tnFhbVxSLmm
         VYF3BGIYSPg4//oKwYws1DwRSdWcUpiWaqARzI9uw58atdb+DVSO7vWuP6mOxIdT7Wv4
         HGFw==
X-Gm-Message-State: AOJu0YwgoQspHKWRYT/80NDWTMGNPV9wwN1H533sHOWC4AY7pOCusjCg
	alc1Af1NlzECDroHEbsa0ft8kHNiNR9K4XrR5QT5KactnK/yTOxWGvTAX9o2lzqB9b984SHLB1F
	Z
X-Google-Smtp-Source: AGHT+IHw/B87/PaQqzMO5KRdBZBLAqtogyyjUnxTtDRW9gb+I3AZovHZMua5klsp86mAFZRTrAyj7A==
X-Received: by 2002:a05:600c:2183:b0:40d:1d1c:ffaa with SMTP id e3-20020a05600c218300b0040d1d1cffaamr335809wme.169.1706003695716;
        Tue, 23 Jan 2024 01:54:55 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id l34-20020a05600c1d2200b0040e89ade84bsm21649964wms.4.2024.01.23.01.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 01:54:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: mturquette@baylibre.com, sboyd@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
 Varada Pavani <v.pavani@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com, 
 aswani.reddy@samsung.com, pankaj.dubey@samsung.com
In-Reply-To: <20231219115834.65720-1-v.pavani@samsung.com>
References: <CGME20231219115856epcas5p371abeb4264f60309e597b90954e6d58c@epcas5p3.samsung.com>
 <20231219115834.65720-1-v.pavani@samsung.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: clock: Fix spelling mistake
 in 'tesla,fsd-clock.yaml'
Message-Id: <170600369366.35728.6701987973179299907.b4-ty@linaro.org>
Date: Tue, 23 Jan 2024 10:54:53 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Tue, 19 Dec 2023 17:28:33 +0530, Varada Pavani wrote:
> Fix typo 'inteernal' to 'internal' in 'Documentation/devicetree/
> bindings/clock/tesla,fsd-clock.yaml'.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: Fix spelling mistake in 'tesla,fsd-clock.yaml'
      https://git.kernel.org/krzk/linux/c/5b62ea0b85ea8e11945f862fd2eee16ac3a45d4b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

