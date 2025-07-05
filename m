Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5E21A238F
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Jul 2025 08:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751705535; cv=none; b=Xt/WFKH27kNsCIAkDqMjZ2+o6yd6x6lfOd2amTolzzY8V4AhgHz7PhXvaIbhz9HZ6jIvBbSLEldbssQtRlRDnRjz7+WFGItDRCIyj3M8GslyCN8Nybbx+zyDde69TTiEIOXV5y5WJqGIgwRr+EjoMfPnX4Rl6YvIS7Vqf3S1bbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751705535; c=relaxed/simple;
	bh=AjKgpC4Io2DWBkbWPkG8zNoNDipMaCPIhaYJ1IqmYZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NcVoge5hk22mi5XvUmEp7tRkeZppO/avIpusg9O35dO7fwesSZ2q7Tz3pJkNi3c6w5zjMoR/Gll/IS1qZug6nWIzn7u9s8SeziYZ8Qyu8r2ofQTlfQAOsvSZy6cD0gFfXw+ne5wVJS1DcU6kZ6z+7nB1RrMfS5n0dfdXFg2AoPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vGqciymb; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vGqciymb"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso217172f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Jul 2025 01:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751705531; x=1752310331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YexH0/Cw2vK3u472+/AmEbOqyns3fkq80p4YuJEWCw=;
        b=vGqciymbkx9Hqq22cCDJhqaVtKc/vaX4yNHk0lzqa8wheiW0kKJ2prW1VcNpDhQr8h
         nUeBblQ0QV2Su3hc+d2L42DPlIye5CSLkeFoITOIV4YsluBT0YJSt0gaglwqH6X2f7jT
         OvBrtxxeq2ZkK4SCbL5AJZgCMOD8+FqFYvBpoB1wsu5JtbaJrjYcJJp/cwuGmCecrW5u
         JJjb6h8++1ZHPixXa+3PP6fDgBJJeV4VL62UcLpk0zi6MxVSNzzauMG9zPu22bpKa/aE
         /APw/j57tGQ06nVb7wCxDenjSg9qsyZ3frO+BNdU+LOGeFInqe+x2BhOilUeXdIai9Mg
         McRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751705531; x=1752310331;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YexH0/Cw2vK3u472+/AmEbOqyns3fkq80p4YuJEWCw=;
        b=PiENJ3DZ6YOsGpdS5Kh5EiGi5PS8eN+olkdGe4n3XcMV+XG09gjh3VEYQUFaGX7Qe8
         HI6yrjbG8TMoDdo+pGZ3PMxYqImvj77IdVqiXOZjuZILoeVXdOGd0WCucBSxQZBaY9an
         mV1ZX9EukyJtknrGEvpC8kTk2J5mEb3dT78cej1iqBB4ENOzNbmH1mZ/sLUPbFkNxyj+
         VrpdDshGAJFDOJFvO49HIuUVDsLxN/mJhvn1HPnky66WcRtQ7pAEGdNvrCRVmm/h+Mqo
         3JLqX3SAaXTYIFVpUjJVvmtPPsx+OfEP4UxlxMeJeCLlSxypm/ipAZJlCi+ld/leTupD
         JjMw==
X-Forwarded-Encrypted: i=1; AJvYcCUU5SELvD+y7w6PNOQDPlePl9qJZCLx3fL+DJ87T8M8AGAydWxDoM0u85jYGCBBD4b+O4fsuD1GSmlNs+ZQ/Oj/VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS+eG5GmPLkbn5iNxenPt3PbrFlRlZCi/fn16PvnnozzNnFowV
	FvMRa1A1bKR1rG/L9fgO5SPYBo9Iadyk/97SRp5ssBSLBCSYsfmAgcGr6caiueeNzn8=
X-Gm-Gg: ASbGncsQbWOIP5/LVwKJ2pVMtD/mEGDKwmMQuO8ffT1f/8VoQw92jMzjYkzEVRMoDnp
	55x6/W+kJM/JZekuMNdmAcXO6k/nrEtBVK2zX0g0caGogmdT7oxaImMjmOvln/N/RzvJ6JDKyxY
	tvwisQOJxJoDjbSbzZqRsyq19/JgYZcKwTHUnCst78blGNrD5Hlxt/Ud0Yu8EHMrxEYqd01X+pJ
	R/wiRNaVKsudnYtcMC6Y137a/J4I9F4ABVhP10NsTzU22Sc9DqEJ3Rh4tvDzexWLCXuOCdmI8o0
	7GuxbWyg0tMtraqV/8d51nAGfNc+2SmZYykmQrxR0bH8edY/BEwr3aDXpjqd8k9HaeANmIgHXvg
	7
X-Google-Smtp-Source: AGHT+IHKysufxmIYEaUhEZUWuBYxNVyIKb+YxnegutQsUA9aWiJMJC1+caAqnYzQR6tuQ9454ZDmhQ==
X-Received: by 2002:a05:6000:2281:b0:3a3:63d3:368e with SMTP id ffacd0b85a97d-3b4964c4845mr1539622f8f.0.1751705530869;
        Sat, 05 Jul 2025 01:52:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453b3542838sm83558635e9.1.2025.07.05.01.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 01:52:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
References: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix gs101 irq chip
Message-Id: <175170552946.13533.13306736962764996194.b4-ty@linaro.org>
Date: Sat, 05 Jul 2025 10:52:09 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 02 Jul 2025 13:15:24 +0100, Peter Griffin wrote:
> When adding the dedicated gs101_wkup_irq_chip struct to support the eint
> wakeup mask the .eint_con, eint_mask and .eint_pend fields were missed. The
> result is that irqs on gs101 for the buttons etc are broken.
> 
> 

Applied, thanks!

[1/1] pinctrl: samsung: Fix gs101 irq chip
      https://git.kernel.org/pinctrl/samsung/c/683d532dfc9657ab8aae25204f378352ed144646

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

