Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A68E492514
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 15:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080640; cv=none; b=LIutlvKbZ9bTALOn8ZyNWq35B72tei63SVKkgQaJM2lY9XHrWyg+rr95KWsw+Ht+E5lYuZDF8mU2F9z/GbQ3vCs3RnZOzSm9n6yXeQVeQYKmsHvpIyHLDBhYK6bBYOA4Iy07g4MUdqDjSpYNvroUU0Er46M/nnNDL+6JIym4TKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080640; c=relaxed/simple;
	bh=CIHXvYkwT0jmkDtE417aEEPyKFHS+9YHa78p6P2MNXQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=a83W++IWxcClN9I/QBa6UnR29gnLDKFU0yGSZLltrsb1Uoc9Wvq35KI0w8CHVC1eKcml7aNnU+2VJCsIh5tH9qxd8KiJXJ/I2fLN1cjQ2Q4Mbc8aOzTdyBmdf8aHtZp876uR/uc60AuLMnUIl15x9oXzmwk/G7lLELMH1MvHiFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cr7AeDnq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cr7AeDnq"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891b0786beso43360775e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 08:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778080634; x=1778685434; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWneBoACYfMuiuSESr0/5daG1MHT/M5YTM3M8vS2pFA=;
        b=cr7AeDnqmkz/lL6GNhQX62OXzYXKqDOCq7Ej0QjJgFH0s7HGSRv6a5BnPjRw2aZf7X
         Q5UxAnSfeUpqWBIvvZn5w+ViBmUbUt1Tl26xnaIEy089lpMWa0/ewrV27PzSMjpB3AIH
         +sLUZhD/wFC+4IfexUCu+PDzcsAa+5rqBYM2FxSdW+DEGv/l4BqOM6kXxIVC8t3P2F9+
         zBUuVeb4xz2QP0khM5sOkcYCyxdCtTnIOm+nmq0J9XcUwxaSX+mdk8mijaz7CPOIJK7d
         c+G1O+pHq1qTmyvMbkG1hotAGe/BeRDLbsZlK501F1Qo+/zi0nz3nh7mTG4MGLRPImZR
         v2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080634; x=1778685434;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YWneBoACYfMuiuSESr0/5daG1MHT/M5YTM3M8vS2pFA=;
        b=dSPKD+knpNbDI3uKG/4Q1S/r7t/HHX+3SuvxCWPgXU84v9X0/PengMS/29utCoYgPj
         KRXBV9QkDysqjRPYuqutnopxZDzd/SugsGRcEm6AyVKO87Ssz507iPw5ESJUERGsI6/E
         CEv3vT2It13mNKl/oH0H8bl4nBkap3NXofyFPXwShI6WOqJuXIEl2ygtN2fA9iUMBqkT
         FB/OufHt+YIj0fNN99x7L39soUI5ITiKLf5ZmjsWRiIQ7xij8q12b0Wi2ulqo/E5NMsQ
         voXN3MMPfqqlQoqjA2qyisxwTNN1SZVOAnCwbvJz0UEAuqplOWWGxUiF0pusqoaxg6/3
         OdFA==
X-Forwarded-Encrypted: i=1; AFNElJ9I3bWxYGB4xAQQvm6Lp0hBX+ipIjvn7Fqwno9L09aaj6y1a3E1ESpUVrFsDBScIZ11UmcpGK4DKr3RMV+PK6yHQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCFNZDf3YQZnF/+Bia3ndbIaBmP0sJZw0hwB4x8tSn9bWWsIxr
	KGrxEeqQiNgYyFYNvBbzm+a1IRmr9mazXKkotglrDOlQo2mT+AkzuTGX0YvDJ0dAQus=
X-Gm-Gg: AeBDieux2lrQF/A1wioOeDnzqel5W/yw3PFe1LuouMGqYZv9rmp1DmG3uv5sfq/qsVb
	utkZRKbPd3vtfgh4THCjrQ5ESiWYWjRDWze/9HktncgkEDvzVmmjsiryde+zoEuUb7i4VYObMPf
	sC2s2+Wcs4vFnIBuWUY6/JrdH19gY8b9rT2Ws8D7jYVYp89EHwfX/VD3Q82P8PFa6my2H0dSqGL
	7UElYgNGLYJqwMeUIb5psh0hB/P+h5cQ4kE6AMdBiqhJH6716WFbNnwtCt/pPpj6btin7KRyBv/
	xFAoFH1SJBVKMXJi/T8+2vxwA/LF94dHBgkxXhklnAqDWEC21S6FKaSpONtzjJmBX56+5LycOoK
	ItHUOpCAf+nCywnSkbZeefa3APwz+ftYG16s7NWoIcUFMtNJRGfRyP4E0JKPCY7DtW41bbCmmPB
	GM4gSWCWrQB4HvZgS12EQxD8lCTAfIxpqwTFJBzSJl1Q7nKfrjk8Z6Y3bluq1fNtcJOQmW0gU+M
	YN/XljfYMd7NjCyyM5FedjP/HuE
X-Received: by 2002:a05:600c:c094:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-48e51e1a7c4mr49435305e9.9.1778080633868;
        Wed, 06 May 2026 08:17:13 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:da69:ce01:65af:7871])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53895effsm51990165e9.3.2026.05.06.08.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:17:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 May 2026 16:17:12 +0100
Message-Id: <DIBOZA3G83XE.13MZJF4AJQAOU@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <peter.griffin@linaro.org>,
 <andre.draszik@linaro.org>, <jyescas@google.com>,
 <kernel-team@android.com>, <stable@vger.kernel.org>, "Titouan Ameline"
 <titouan.ameline@gmail.com>
Subject: Re: [PATCH v5 1/7] firmware: samsung: acpm: Fix cross-thread RX
 length corruption
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org> <20260505-acpm-fixes-sashiko-reports-v5-1-43b5ee7f1674@linaro.org>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-1-43b5ee7f1674@linaro.org>

On Tue May 5, 2026 at 2:12 PM BST, Tudor Ambarus wrote:
> Sashiko identified a cross-thread RX length corruption bug when
> reviewing the thermal addition to ACPM [1].
>
> When multiple threads concurrently send IPC requests, the ACPM polling
> mechanism can encounter responses belonging to other threads. To drain
> the queue, the driver saves these concurrent responses into an internal
> cache (`rx_data->cmd`) to be retrieved later by the owning thread.
>
> Previously, the driver incorrectly used `xfer->rxcnt` (the expected
> receive length of the *current* polling thread) when copying data for
> *other* threads into this cache. If the threads expected responses of
> different lengths, this resulted in buffer underflows (leading to reads
> of uninitialized memory) or potential buffer overflows.
>
> Fix this by replacing the boolean `response` flag in
> `struct acpm_rx_data` with `rxcnt`, caching the exact expected receive
> length for each specific transaction during transfer preparation. Use
> this cached length when saving concurrent responses.
>
> Consequently, ensure that `xfer->rxcnt` is explicitly zeroed in driver
> helpers (e.g., `acpm_dvfs_set_xfer`) for fire-and-forget messages to
> prevent uninitialized stack garbage from being interpreted as a massive
> expected receive length.
>
> Cc: stable@vger.kernel.org
> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> Reported-by: Titouan Ameline <titouan.ameline@gmail.com>

As far as I can see, the name in this tag should be
Titouan Ameline de Cadeville.

> Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b2=
6%40linaro.org [1]
> Closes: https://lore.kernel.org/r/20260426210255.73674-1-titouan.ameline@=
gmail.com/
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/firmware/samsung/exynos-acpm-dvfs.c |  3 +++
>  drivers/firmware/samsung/exynos-acpm.c      | 15 ++++++++-------
>  2 files changed, 11 insertions(+), 7 deletions(-)

[..]

Best regards,
Alexey
