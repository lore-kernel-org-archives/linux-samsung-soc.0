Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAA72066DE
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2026 04:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238982; cv=none; b=C4JD57AJBHIG5c82iHyfeQGKo8ZxcZYh2ek4O8YCw8tpNlAYDIB7b2jyfyKMOkqSI/6BRDjdl+zeCFzYAQTIxvEIfuBzb/GMC7p1ZBBF1R6TCkmvpn7AZrEypZV0iO0AKS2JlV6cjz4YdDDxXWH6fxJc1rq122NFjrot7zn3o6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238982; c=relaxed/simple;
	bh=VA9Uj7x6YGsbqAp1uyJCms8Kk+z1fYnFr3KjaEsulGc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=nvnesOkb0L6yav58DgJiA1k2/mNoJEIP84E1MVObGfRUb/in7bgRX+M6wPybGA7iPZ9XCy6+RrsSzLOjiyroxEgKKgAviWEH7gX6k+vXRW0PCsA9KpglyGm7SnBC+8xE29yWQduVKrwqTiki+1GeHJnNFLEJ3z/q0vZQQGZ5K74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mZAnisAq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mZAnisAq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so360167f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2026 21:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781238979; x=1781843779; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VA9Uj7x6YGsbqAp1uyJCms8Kk+z1fYnFr3KjaEsulGc=;
        b=mZAnisAquRpKj1MLUkQTJX5Nos22Gij72kMS8OTIcCM/GcvXMdoDJ7+g5w6bazUuCn
         AzTq2bcd66QzBkk2W2bJ25HxLH1tOt/hjejFIYm1bGX99+s2Zxib4s2pklpIhf2Ay5xG
         K9gjGCcrmFY5AkW1VMbxNt/4jTMZNdLdJfahPw4O5oXGnIBihbtq7UPrYOvadbKSv877
         /LQGAN1dS4iVu+QW2VYVtXek6hTeIsE/fjxwP68EdP3g+VBzPjz1GsRnUpK9JHgEWmON
         2MFsyMTHg4gpvD4P7WPiFzn+rsvuWngZus7Qm+8pIKFPuevjFnnpGq9seonT76eegcbE
         rIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781238979; x=1781843779;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VA9Uj7x6YGsbqAp1uyJCms8Kk+z1fYnFr3KjaEsulGc=;
        b=Z0bLMSLAI6MboRflwfIAn66y3U1VguofeNYJAmXVjNqa3wrXoYvv8Vj8D3wrrVT+Mv
         LuBoBKBWaQGazDUAVyOBzMKfJos57ZRApama4IfA9MctgjIU8VbA73sP2NKxsnmSR1Q4
         PJiCnUEQ/7pr/8/qAdaxe0SLA358ZoM3c4zU+K0OXABf3gQWmCME3UAY4EFx69CYQmKl
         VBhmJhMtIGTamwuj2fWG6fqkVsSFnRQ80MjhatlWUBD990f26xuOPGyPgxScxbOWYAnM
         6ivoOIaA+xgL4Uo74SURpOoMDNuALNDcF27VaK7pP2bdoi+DR9Smlk+ofQlRVgY0r4v7
         QrDA==
X-Forwarded-Encrypted: i=1; AFNElJ9CfgA9CbiA5O//7l9aMoT3ZmxjIwVfDysa1lYfrMLLmk9MQpg/nIussdI7TZzBVxwyhlZCmQnIft+sloGltGuhxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2EOCANpLaWP+JfJuhZJ+dN4rRQx1Z+EwyowQpfyWYNsWy1Z5W
	IEZEjXNW8ltkPpUCt3ylY7bnyvH49LJqBcJ5IhbQaMvY4AQp3YC7fcPnA4i+8H/4OAA=
X-Gm-Gg: Acq92OHgFT8lcvDCfcwBErpKFamzrY0FMG5ZMQkTnsMifzfxDa/fruuNIjEqhJmM7nK
	HWz7zHVYSY3sXejNQ9m85dX7W9j6p1Iy0s8KDiOOl+qQHCmx011DJjIEqddiwC3AC7KA9/4VIV/
	vMgTG4Yq9SlqY0CxI7er2M6V8Ebs36nXsT0rxK2YbLCrOe55722v3ic7UhfgUK+0bplC0Kb2xaH
	pEm2/bCesnh30tgdMBugNEJ7g7s1o/qVQyvo+ZtjEXPUBs8VgL1kkYZyoOGueaIRiK2Aek0iFoJ
	xl4EXFlWmtjqS10xDtu8BOQKcgFqt40SvFFKEQefzB0kWTv8cV9vOylfAoH0+Z5HwGk/zdOvSCA
	eCZ/XcHrIy58tqbMTcrKLVueY0wUGI31K9DNvIoDrcTlLljroJqL/SeFLmhlc7sJNNx5EOKtHI+
	PfChoRAHWp9Vb0lj/gFR+t72pE3HF8HNYM62muD+MfMa8SgHkg04Yt2PIwZqNFXSplrlz8A6Vst
	1/rbHxE0TMklg==
X-Received: by 2002:a05:6000:1847:b0:45e:ec18:f207 with SMTP id ffacd0b85a97d-4606db9a69bmr1554180f8f.25.1781238979313;
        Thu, 11 Jun 2026 21:36:19 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263945sm2067973f8f.8.2026.06.11.21.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 21:36:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 05:36:18 +0100
Message-Id: <DJ6SIPW6W26P.1UHJZ5UZQ5ZND@linaro.org>
Subject: Re: [PATCH 0/2] ACPM cpufreq with fast_switch support, fast path
 xfer in ACPM
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Viresh
 Kumar" <viresh.kumar@linaro.org>
Cc: "Sudeep Holla" <sudeep.holla@kernel.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
 <kernel-team@android.com>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260612-acpm-fast-xfer-v1-0-1aa6cd2268ba@linaro.org>
In-Reply-To: <20260612-acpm-fast-xfer-v1-0-1aa6cd2268ba@linaro.org>

On Fri Jun 12, 2026 at 5:34 AM BST, Alexey Klimov wrote:
> The series implements acpm_do_xfer_fast() that does as little
> as possible to make it usabe in atomic context to eventually

Sorry, I forgot to add RFC tags. This is RFC/work-in-progress
series.

Thanks,
Alexey

