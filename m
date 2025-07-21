Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72002286D50
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 08:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753085889; cv=none; b=hBbgSczeEAfwWnaF7yrR4AqBuJNYRK1HbbtabOJ6qwleAfFmiGhkLEXSvYGTR+7pm+HOKSRQ3vVaftIl/DpERJOTin1TgTCJXySdoKRb8TnT8cGbyDHewWr6l2KgRhGimZGAo1eJ+9xbq5Y5d7R44HKBysEPyXSvriPP58+KoY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753085889; c=relaxed/simple;
	bh=4Ta0TLua0Rtt1YKOLIaPtKpMij5Yc4Q/7c3JdU81KHs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iwvbh8r968XMJWiC407jSvF6UA80zuOkp/BVWlWmcNbKRwdg9nGGmUgcsX2GzUkDHBLRGHcGEHHqy3XoQz8HAz2VVTubUScE100Ngg0nOx5EPOnmQL+rSOHp/TZ72DOpiYBjlDgbw/YaHsawhLwQzChKtZmBoa82mLljL6FWoGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FbRMkQGM; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FbRMkQGM"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae3521a124cso82160266b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753085886; x=1753690686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPXELs5NvkX+PM7JY9uaPhAOXWpOOKXEuN/iIGPovgU=;
        b=FbRMkQGM7VBrdpBGUvflQlloc2rn2yfEABtKdB10zr93jtXOcAs5tP/pvf3P1mN9sU
         gm+7QIUOgZy7SX5TefXxuketzpL5qpyCKEDJvgTyd3DDHda8cC+j/nd/EhdcI1isWvBd
         YeS+2uk/0sKbQNCLEEOOxnPEg1nBspW3dYRA3vPvBgAJ+n8Vri1oF0xWOsFb9xhGnuc2
         HUV5RpmUV67As/ylhg9tSxBMw0oVbG3eaRveR2BaAYWQlraSKa6rkqh4HcBgfbReI7dc
         MNbDsTA45X9hJ+PAe7p+hvQdQPLqEbArMJyk9JsxZiSk0trT1NkY+/lmnedel8zenInC
         NIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753085886; x=1753690686;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPXELs5NvkX+PM7JY9uaPhAOXWpOOKXEuN/iIGPovgU=;
        b=omU2DGmXHeFTOMYGIRE+aOht2EENyCgqqUQmiH6uA/AWnZCLpRQ0VgDKRRY9CUVC/j
         BgXylmSfNCqYAi/m4tvElhw11aYuBjUbPxXb7Y7oJXJnmkRNdNfhynHEEMVdePZYvqLn
         TlDzcbzTBR7IeOu4mafes2V+DurX41YJqZL80Av+zfT7AM9/HfzlLIYj/mcg+cD0qkNF
         rus+c3v4q5kxuPjQC5XyP0qzEmwKyTgCeifhIFHm+FbVuDTXGfJhYWmZIRQj3uOTLtnC
         hSY1AdrePwXLeAW/bzVb+IEZHlatJtjKSO9CYs36yxu0ujQegpRXo/WdX+xsmjIbEcSk
         VAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw8UGo/kqsvfzy/s5BjhYYFjcrUwukMqjZ1M4837/V2w8bCjmkbtql/8R80nZGqY/16Nl6ZxVZjPR4Dp2D86riMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfzKhkbiqS4OJVvlu/AmmKK9IjbwX9tM3hgVIGnUHNP00GLza6
	f4c9nrDTSERFccg2Vqysc9vE0J4UHyw3WC0DEZdsUs/WPZynvounDxJBl14vfSAgNAQ=
X-Gm-Gg: ASbGncusea8pOS8hseSQxmXkqq1gDKXbxxffiSrFs2EbeaDcBOELDFMtroZbQPCVAfo
	jVaapXvM92pjUGlPNWlxMh7/hhAqRN5P5KO+xVqjbnziMvxqo7toldAGuXhauWd0tf2lUeXCQUl
	S3J8fNcPjjgp18VVRkJQQsON3AyrsThLpe2CLyUzcnJFB0mtd6GQLJfXeAzQfw2LouWN9Pz9oGv
	cbkiaxX7wTCWwb4CUo3KYeSRqRU+zIFzBYsUOs4YP0pKcAYfF+gJfiyRnEGVgwl1jlbEWjbYQQV
	quug7BqxDLe+tcFC2jMlXBUjG54R60Prb6IqRRPjGvhSgTjh+2q587VXi0AZLOHMgNnUXVzk4xK
	DQqOwMgzzn/WVRq5VcZpKA4LPsked988wotUStyYid+KvpuaQ
X-Google-Smtp-Source: AGHT+IEwTbfpXXMQ3S49s4PgHyCV/u6H0Q8oR8adAG+0t/NE/c8sQ0/0zI+RNG/o7SXdvdd/cnUXsg==
X-Received: by 2002:a17:907:7f20:b0:ad8:a282:1c2f with SMTP id a640c23a62f3a-ae9c9b2153cmr688926866b.12.1753085885643;
        Mon, 21 Jul 2025 01:18:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d524asm633642366b.45.2025.07.21.01.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 01:18:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, sudeep.holla@arm.com
In-Reply-To: <20250717-gs101-cpuidle-v7-1-33d51770114b@linaro.org>
References: <20250717-gs101-cpuidle-v7-1-33d51770114b@linaro.org>
Subject: Re: [PATCH v7] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Message-Id: <175308588382.28993.16370211179082448125.b4-ty@linaro.org>
Date: Mon, 21 Jul 2025 10:18:03 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 17 Jul 2025 17:22:36 +0100, Peter Griffin wrote:
> Register cpu pm notifiers for gs101 which call the
> gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> C2 hint. This hint is required to actually enter the C2 idle state in
> addition to the PSCI calls due to limitations in the el3mon/ACPM firmware.
> 
> A couple of corner cases are handled, namely when the system is rebooting
> or suspending we ignore the request. Additionally the request is ignored if
> the CPU is in CPU hot plug. Some common code is refactored so that it can
> be called from both the CPU hot plug callbacks and CPU PM notifier taking
> into account that CPU PM notifiers are called with IRQs disabled whereas
> CPU hotplug callbacks are not.
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

