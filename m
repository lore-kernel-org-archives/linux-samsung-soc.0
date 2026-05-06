Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF1A36B076
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 11:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778068548; cv=none; b=b/3N3tdGj/fcuhJCwVVzJ0mx8zz3xXqM60Ovss4BU5Y8on1GevJtUJsLdxEZoqA+gCb8VDZ7NINDBA1mrd2pFnBrj+p3bIkYmPwB8tqm09NeQWIw9huY3efMAj/03HpIU1VcSX+bTPFZfjiZcv+77im+1l6gNBayzMQoazziH/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778068548; c=relaxed/simple;
	bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/GurlWvW5IX0SlxdKszGsiBatAyuLD1mDL9z0ww6Z84Y+N5V5MvN/4zdKhn27beISkEvcYChFWTXux7aFCFq5DkBGyx/p2STZG9NCqT73c/d/wcdrVgk4FI+vVupE2p/ygp8vD5oFR2QbUJBm2OtgM0PPxM1sUAj/Ojt6+oK0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PPszSXkZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PPszSXkZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso66916535e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 04:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778068546; x=1778673346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
        b=PPszSXkZdHjtJzs5MjldOEAoC4JUfD38aaWzAyeJfgphJuos45Iqg4EN/pqYjtVqUD
         oI1ofk5IVEvTqETtL0HJdpD+9tSiK+uJ4H94UGgNta74tebyQ4pYNW9b9a5dlJd3WL/0
         0NHslSg0MSQ9EweYBd+kwNtAeIKQ5ZdvxMuE2/I5EZw2sSEBFV6PSvNoPbdpDri3E1Lr
         4HznolFdwh0UcIvaPARDWlM2/mC7lZ5cK6vlR6zIJK+oMPEOKGQpe5T5zuq8Xf1RLS7n
         3WCMaqrga2vkMos7Y8EQwSFoElxnoDOZ3R8QMP6X1qilw6RGJ2zHPK1izLTajWNvz5ym
         y8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778068546; x=1778673346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
        b=SIRYKNOznlq7ADb/YsasiyKJ9OIF/S+QuyQK6XaMDzZc+Cp/amOopy6F4sZsnmrf2d
         eQXoAhqoNrvEdihK2t2Guqs9cLHLwkQT6Ji+gCvnM6KfZtP6T+dZQgZMs3icFPYARkwF
         jeitRILiPL95akIKEIDZH1REHldbsedMgq1SDhgLx0kpBqbNul63+UDnua6W3iEI+29d
         8jS6FkWXIamF+z3fYBglOvBrwb9Bh1K3/N7YF0YpEeF/GSffNTVs5/pOr0RxZRVic9Pj
         xBtQRyAkGZQugpUfiT4lCYNeB+QkTTsS3BJLkWz2Wuyq+GV/lDL+bOSqArrjw7E11QjR
         +nWA==
X-Forwarded-Encrypted: i=1; AFNElJ8MB6Cycx4CWsLOaPnKkstpOCAcXU+Y8CjyP1ge5sLCb61ZSwMPtRdMw67UbHhzNQOmAUDNzfHxXLdyCRUAeKNk8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza/KU7Ie1tgDSTD3mUcdNAxUFfWFAy7+sUtFZ13S35S2ToSGpt
	eXY1GHcwp/XIFBrBZsc+1mDj0V44llsA2H4JC4UaeQvX3JOlPmlkJzsCMONJuE7HJBc=
X-Gm-Gg: AeBDietEDT0FhPdkndvutxQPuhH45pyBfKJluphzNmY4xQz63Kpcrh6o4OFW9cldAQJ
	kHlTkDgXm98WV3hEnYic5YhRUMf6ZvbHiMOqSGqNV7EoVs4ubZwFJfcbDk1E3XIFYwmgbjlz5LK
	xvvZ3asm1DCp9/N1oBld+k0QeYdYS6JKbSIPHDaYxvhRHmY29g2sSTJKOXl7sY7TJacXpyFOQIH
	IgyQR5mp2AG6+d/72utrPcNbTbxuC2KzdMWAlwVgi4lSIe/DRF98Ze9z6wEiANkFdBidhkC7aYe
	czNomFnwUanG8Tjy20gOfYogWXWKrfK74rtbBOuU+FtuZjD+bpk1VCmiykRGnqMu0K+K3fdJUSQ
	CNciCdc4ug1VpbzQDop8bKxfRWHtFfNQ4Ojeokf5AfPRGFzqB5JINncaCPNHmpFQ+7VKDrboQtB
	VakOi6fHpDFZQrYGTcInXV6Q+Q3ctVOqYGAoKTlazrOsk=
X-Received: by 2002:a05:600c:8b65:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-48e51f4e5fdmr60307745e9.28.1778068545639;
        Wed, 06 May 2026 04:55:45 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538d2878sm69999385e9.15.2026.05.06.04.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:55:45 -0700 (PDT)
Message-ID: <f094b0e2-3c45-42fe-9228-3a3eb2b90185@linaro.org>
Date: Wed, 6 May 2026 14:55:42 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/15] clk: samsung: acpm: use
 clk_determine_rate_noop()
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Juan Yescas <jyescas@google.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-10-f3f829fbacdf@redhat.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-10-f3f829fbacdf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
