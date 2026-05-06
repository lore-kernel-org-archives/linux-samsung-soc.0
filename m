Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092B44508E5
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 12:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071572; cv=none; b=bNtY5GS3kR/rPRqQdt2KhU6I/5WRjkZ/wN5VuiTs5WtN6QdBoHUSXWoRBnui9SGLx6qKK+53k+z7kYAMRRZlvMDYLlQ55B7Nn0IREmjFtLUU1Fri4ZFvbwZLvO4J08yNI4op/F3pXkhxmp6oBFfGa2Om2qsIWatmJ4XvVHKFvgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071572; c=relaxed/simple;
	bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZqJYe9Ac6UfI1Uh62xHBlE54Xa+2ZbqR9kuQPzsK4xWqlrWDdq0tgHr6rt6s5DVZF6gorydajz27lktkhrB/7+NBeb/1Gnjj63xsIel+Ht07deXE+zgqM3HbJ5YWMbxk/ULTjWdAwh5D4nhHz09lhIIIiFrrSMP52fCcQRzBL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fZ9huJ1p; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fZ9huJ1p"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso48084335e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 05:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778071563; x=1778676363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=fZ9huJ1p8OsWdOfl7FPFy8pcoQsquQPvPJOce+OFQS88Se+sss2lcGgF9eU1TMDzeo
         b0hyDWgTKFWSjTHAXB+QvDJFWymO5bJqHdeeLdsyirwKfWX0kKKGzjLeqYjm7/3Pv5xX
         KPKIYjL+I6EvEOo5xBst/mdqHLJdk8S9Z7kc8cboGGvfry3I9jXRf4iAKUc16gBYzWfq
         Yvt/77EAxcgrlBG7ydV7j6M32Csc+A4g64+ra1J/8kFSDDO4POix29yftigej2K0fhmf
         2v0dfxt6FT6k9cIP7Tqzn92rV/SUGeM5xJZwWzD7qOX1EyFSchLqPCnSSUacY5se/Uqt
         727A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071563; x=1778676363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=eM5Bx9wVdhTJGRe5W8QD4nfXyNA89Z7+PAXBXPZf1ReXfWornD5LJC81n21+9rW20A
         v67yN0IrdFfeqR+eruRmbpRrpXCqJeZInj4YEdlPPlzM0vRvo0MPXM5gqMnMzs1OKHHS
         XhH8phvyUm9jKRKwEC3nVbuH2xwFGafbnHzqH0CICjeB80cODI0cgd78knkKHZwycRhG
         pts9VwfwxtrON6vKqdbI1a1xFOxzuwxxm4NEIkwu0iJZvcPZKuMYk6co1P8qoct/5RUy
         r2ahSaoQBrA45pl1L4xwtWATFmx4DgnUjHztOkeuKXBJIeRyCr4C3c4VTuH/sW+pYE9v
         nxhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/amaafDKELmLKT4pP+MosNPaDetjGeODX25zQMr3z0y+RQipzLScUiwoOOCCKQkgCHz7RRE2uVYRZpfnI21sbt5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaz+IF/aGMnFFniic+TAra9VzB0A/9u1pcI6VYUQHr9nRtsa17
	H0dFIPfZxRpEFHJkTO9xZvF4HwDZMnz6cFiNypWC2P2sxNV3dAE2+isPALR+Smc/N6s=
X-Gm-Gg: AeBDiev6eBRren9/qlWFIOgN7KToFlc45kdrmF/n2blGLarXfbWNvNiDjQHWuUEdHxH
	s+C2N3PsWB3cB66w3fH7nbdTfUeIx1u/aWEcL4CMk5IjUy83g5OpGRd45fp8Egq9qhC5n8QTknD
	6ko2W+uR61xZ8X2g2MKDhe3/HzyG3/gnLDcvhLBq065eXOxyOAWfJnEiVWilC+OCV9H1XmonA0F
	fo4LQqXRL5KUcsHhvgC83UEgovKbbGcJ6Qjar2eggXHCWHuGkpoRXWsH+c0vgx263sOvuWno45X
	GN46vYNSCx/gnLx6rU08yYEWEvB/wcHq4oEBaShCidfs8R0IE7Y+3qA+L1uzpbKhtaBDq3/Xmn7
	J3znuBAJ9oWnWzeowmVexwl6AeHgcMUuR4qvImOmuOeiIuCIpO4E5Yv4I6EupzUDB/FH8aMJCbv
	ak/AoSWkeyMxkqvN8zwtERsx2CLwe+1koDA2XL+6KBZjA=
X-Received: by 2002:a05:600c:8218:b0:48a:6798:52e9 with SMTP id 5b1f17b1804b1-48e51dd386fmr64833155e9.0.1778071563011;
        Wed, 06 May 2026 05:46:03 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5382a327sm84332045e9.0.2026.05.06.05.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:46:02 -0700 (PDT)
Message-ID: <473925ee-ba57-44f4-8993-d953d29caa18@linaro.org>
Date: Wed, 6 May 2026 15:45:59 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: exynos850: mark APM I3C clocks as critical
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Juan Yescas <jyescas@google.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
