Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1058F14B950
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Apr 2025 06:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744008404; cv=none; b=Olt21WIHVTvjKzADNt9VFaN+zMityRrKy9ztCq8I1vqUulOcUIt+v8A1k1gany7WgmdJUTOoRBFvtt6Is0kRdn+ZPgs/t6JaM5G0D2Z+BX4tBchjkU6A2yTjRo7YvPc5dxh6WXAeKiAvn4yiAeMWUwK+dBMDuSiRyurcvjsbP38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744008404; c=relaxed/simple;
	bh=QIQBNikOm9JQVuL2m9gPJaSBOUZpZSxyQALLn5fWLdg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gKmQbuGfJmkofAUgmkHd1BbH7+LG9DjRZ0p2ekF2wwOwQK1KIHENbbtFxCbZ86Ma3IsCIM5B2gszcVOuf7m/Crq+8QLp7etJJT9SRnIOgr8wIP+YWh2QxKxOQ4CB+fI8kh2ehGSl5PfU3XziIb4mCazXAA0Dhs1JCwJMS7e8Vfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SGxs1oDo; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SGxs1oDo"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39973c72e8cso440398f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Apr 2025 23:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744008401; x=1744613201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5u5FktG9IlugroLpcsECtmu752LY+bRbkT7BdZa6KAc=;
        b=SGxs1oDobn8d4axzhEnRMDpTuLsdRfpIfco69wNiXFiCi86DJS69/POirupHAxw2CH
         8MSGEy9oR7ORBEKpRu41AGyxPstfsHt7Jo59VAgOTV2OrnUh9BapfEMBsDPrQ6iNlVJK
         LI3OMxl1OoUgnKQMsMIyIZSuls+gwSnIx9yW1ycUt5i6w4enZKHRTg7/iMHPDcZIDB3+
         ps6DSHgdidPydMP6LxmzZuZoZVp/uukfAebiZstmhwbDkSsw7FjfVhf3Umn4eeF+syji
         gTO/KTRz22w2oASggXDj7t3o0qlespUhXNU4qdSOyiJZHktc7MxhKaFaOPC3BowdbggO
         n/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744008401; x=1744613201;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5u5FktG9IlugroLpcsECtmu752LY+bRbkT7BdZa6KAc=;
        b=AoiDYxL3Djyd1XiQLqEpWlyiStuRtmHxkKCQJ+VZmHiHJqWArDYc2PEHKEeXqY3Rcj
         ZG2ZcurFMI2BfNyQhh5mZkxBeLzDjwtRoqOu2kGxU/d71H5QaLvB7sYXxjigNAkNsvGr
         1Q8AkKVz98ZgRydtN3i7ZeGPbxnHaBV2TrLkwdxgORU1b75PuUJkFbI9pMGyUgHsS8Ww
         Lm3fmSqA/Kb3cU+fdVgm0lJONkdE9U0mVeOXvUfIUTYdCoqLsN0LAzBPT4oeFW6QQg50
         NgHy4d5iZ7lx+H7O6sccAk2CQNQaD7iUyTRMZQCH1400W5RYvAkmm+mnhh9NimNkDxca
         4tJw==
X-Forwarded-Encrypted: i=1; AJvYcCUzDH7GR7kI0augJGw7zc3Vo8HbI75v8rQDBklUznHKs63bldHyXy44GlaF308/iDiZilhbvS3wOywlOELvUq+A6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy0tTJDTsriri08P0qBE3gapsrcRHRD6fYzs5b59RjEP335+LP
	bq4z1dY7/P+h8D1Mo+xTCuhFZMqcvR3Wlv+Kj5OFvd3dC+9Syv5JCKgEEgDeVJw=
X-Gm-Gg: ASbGncslhwzwA+XuKyWW6+5IsXjLDgorbGH9O96RiWLgEgsRTbvhajz+yg0zIojIiHt
	pm8AtjnVsnVnc1jmKzLrfsiINkO5wy5Ois/9N3rNtZ2TLrt3zp33P5mgsnlQsY1+AUvyYMf/PJR
	indmLzdpCPthFplenqVC0/PPw046LAA6lt0gDh9Lb6gegbL57HkrOg4LnHKoIdyskOqCdUL3aSu
	Zywzsnhku4ST/zIlWrjqOUUFwDgDlVc/RzcbG+Y5m0WGZ442dB/tyN8V84A51mmpXCDPullDyuz
	94ngYVJrL7iO3rFXHEF/0DtQ2uw7BK85DjNDX/7nB7nqEPFxd/TIrH6o7sZ/6AQ=
X-Google-Smtp-Source: AGHT+IGqmlxqnNGM23w6BRI1UAXmI3OhloB05XrhhY8e+PLrXg++1wpTvBi0oPkEaf9kaYA6FPVh9Q==
X-Received: by 2002:a05:6000:1445:b0:39c:cc7:3d3b with SMTP id ffacd0b85a97d-39cb35aca60mr3056611f8f.8.1744008401279;
        Sun, 06 Apr 2025 23:46:41 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226a12sm11031276f8f.83.2025.04.06.23.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:46:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20250324-acpm-drained-rx-queue-v1-1-577774335151@linaro.org>
References: <20250324-acpm-drained-rx-queue-v1-1-577774335151@linaro.org>
Subject: Re: [PATCH] firmware: exynos-acpm: check saved RX before bailing
 out on empty RX queue
Message-Id: <174400839995.38188.1104536537739192922.b4-ty@linaro.org>
Date: Mon, 07 Apr 2025 08:46:39 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 24 Mar 2025 12:35:41 +0000, Tudor Ambarus wrote:
> When we're polling for responses and get a response that corresponds to
> another request, we save the RX data in order to drain the RX queue.
> 
> If the response for the current request is not found in the request's
> iteration of the queue, or if the queue is empty, we must check whether
> the RX data was saved by a previous request when it drained the RX queue.
> 
> [...]

Applied, thanks!

[1/1] firmware: exynos-acpm: check saved RX before bailing out on empty RX queue
      https://git.kernel.org/krzk/linux/c/2908ffa53f8ed487ab4285635c79d4911cced93c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

