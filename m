Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB3F341649
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 14:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474474; cv=none; b=WfuFbGb/Z/PMjtE/tk/s0Pq/hjXGZ1wLvIym6VjXHAYNplSv1jSor0lVWHJ4fryAlZcYfhOC65HcYPFdugBpvVUV3Dq61iCXTVwws0vBeM7+VsZcR7J2pCJ9xzf00pzezcjKua2LwQGKuvE0sDtqDtiXPKrKPlqP0ZhBsy6aCjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474474; c=relaxed/simple;
	bh=c37Cf/9bjBOxdwmowi+zlvWmHXcs2B9uOXkYp2h8vG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4L0fJCPQuvFyI99WjCwCc/2YpOJ7c+0wtQluaQQ563l2uuEoErY61dMcLxwBM6JIEvwqbNTMvJC6rhJEQ2jXgj3ABf5zIKPPHHsfE+U94xY/fZyh05bycDhb+1S0UJd8tBzQa9RWWmo2t4usiOsixcHLrB1Tpqn4OGBCxryB1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HCOf4zLG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HCOf4zLG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso20676125e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 06:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474471; x=1764079271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUQiNM1iR2tDzAghTzR3NUuXi2I+iCz3M8l6XyCorP4=;
        b=HCOf4zLG6B3ILdR0MA4/LAZMiXEpWKuhYC/8TV1uHsOASbaaC0lbctY1yX5mMp1PL5
         atPslXo8lBADxxUJn6+Uk86tskV/X4Nvh8WO66e8mT4c9lB8x6SulvkkcJmpuKRriEaM
         hAH1VUQDjgVppa+MKsr8IuswwlFZ0pTCeWE9Ij20lfjgQaN3Sv5KuR9f9marTDoz/+Y7
         iXeES35xz1Okec+82IaRuZG9E8EEhB/sUASyXRILwCpQQsmlm1FgssxihkG00Vq5th8F
         jlXxfJFfNs7+Q9TIrr84MaRCUoUrX0Q3v0lrCJsNu3NKFXLOgOJiJRUJug3eKWxtRYOe
         ZYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474471; x=1764079271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUQiNM1iR2tDzAghTzR3NUuXi2I+iCz3M8l6XyCorP4=;
        b=a9Xe4YmZEMXCiH2amyX0qyeicE+bWamCRWKRfv9xmVZL4x4BHuNlJ0bqqWvXgUFAxc
         cZKVTb0GKJsXqAAUtgIeWvdSOhfgKfRGZ1Bku+jJlxO78sEigq8pPNptRKSi7zB6gsg8
         91rbrKhIee3xLmlu5NTYwa0QrAJpQNI/tMppZCF62SesLQmT2YOvl5A1ny9/7blR1KKz
         49pG6qzdFNyA5akAV2EngCx4fIhKBFcZz7mL58gKnB5QFiye3C4MI4Ad6cshE++fDFHP
         87DX96NQzaljXb6vaHQ9uejdhzs5hW7lwzHg87sxWk7fmjIWrVYpDsF6cHKu64djwx1r
         I3Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWiScTIdcwNeCHpU6NIH5rm0klnDK7JAPeBleR4NZZ2hxzy6rehBQ70zV1rPot07AVu9AEwgQg4hgTC0/FtbNcZcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6p39/2Hyp/EhwiDsY/4RD7SfHKw6l+jzNOcC46n+Zlo0tERcI
	EtLwDRlMcgFzjJDMp2sXWSQ1L4EZv6FyC8wrKBK3GCYJ5HgYLNAs8fkoixVEiXZe9HY=
X-Gm-Gg: ASbGncuY7cqVeaI3OLTjkaUDSQC6xHAARqQKdwmZ0rr1wfXdZ9N7Xi2O95pdhdHOQtD
	BQ9W8wtxK4sJt0iOY0XwolS+etYqFZCvU/ZaDSLsx7hTnbW9ZTqX3c+FTlyiw+GdG88URpRHtZp
	mqKdscVAlT2ssJVOKsCgh3ZBY37nRLsRGIXx+rAPCfInYg6IKWGIq1eA+seWEm7wuPVqCBYimai
	mWFa1Ngo7lzBwNVS2LXEcm7aaLpQvKGxBTeUBhtfGNsKo957XXxg3MRAdoCbxFjCfczizOq/RRF
	paQ4v1WtUSPKlCTAtzMPG3+NXYSPD2M/9vRyvS/Ok9wh35DmemEXfTrw9hklh6KbFqcGMG2t+w1
	bGL5jUzQlz2WaRX05v08vH8Czp1QqOq0cy7PKYbWJHpfimky7dep70gS9UAfYbvGiCq4qbm7l/Y
	MA7FJPP2yeOoLjnopiSAuH62NqXWk=
X-Google-Smtp-Source: AGHT+IFV7jGZZLi+9VlgcvikNoydlmxYBSoOTOe6Mj5xjf+0oslhVnUW95h+9A6e60q9KlZeiWFBjw==
X-Received: by 2002:a05:600c:8b22:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-4778fe553a5mr150619835e9.7.1763474470556;
        Tue, 18 Nov 2025 06:01:10 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42c97745f79sm18177019f8f.23.2025.11.18.06.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:01:10 -0800 (PST)
Message-ID: <729cddf3-a21b-4503-b9c8-d3b5708243e9@linaro.org>
Date: Tue, 18 Nov 2025 16:01:08 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] soc: samsung: exynos-chipid: trivial updates to
 simplify code
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com
References: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/12/25 10:48 AM, Tudor Ambarus wrote:
> Trivial patches to simplify code done while handling the GS101 chipid
> support. Compile tested only.
> 

These trivial patches are superseded by the following patch set:
https://lore.kernel.org/linux-samsung-soc/20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org/T/#t

Please consider reviewing the replacement set instead. Thanks!
ta
