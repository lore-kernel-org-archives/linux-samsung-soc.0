Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C7A223716
	for <linux-samsung-soc@vger.kernel.org>; Thu,  1 May 2025 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746100013; cv=none; b=q8L4/ddpG+abZv5i4WSP/fSRE+1bGtVwGbXOuuONjNl55HGj/pUGWNRDGbxBgXwyHxWPC68YcjKD2VAcyQKR+87oeU+xVvJBj7bCrAn0ojXcnbR9Uermc3f91/qFyQJintpevyGqd+DCwrGI9E0hAAsm+RSF62/lsj7cY9OMfzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746100013; c=relaxed/simple;
	bh=gA/dP/1fe3IU6fqje0YYjQwYu/yCBUq82rjIqFksv9Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TXBb3sLC1pQMQBSY2gXpuJwSTDuSmO83R/5TztWMkjEL28H8ouE/7F1QtDNN3LbMtnijNRqa0Wmie+AN9+E2INCz8ucMUyhzc171OA2Pf7+0zeVEtBM7CKd25U5r/eS31We9pDaY0aELLnaaFaGJxXlXWIvl0vFSHJHi+tOyUk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bQQ6DbDQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bQQ6DbDQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf861f936so1587375e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 May 2025 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746100010; x=1746704810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgwakmqHlp3M4BuHJh0II3nl/7c5y+mQeic4clcaFRg=;
        b=bQQ6DbDQf+nsD5kltspnf1v29oQwmfh3U606Il9WwhmAfMzmcpKWXzAW8Z9oQ7LHts
         FL7mzFrdMXtivjcIxaEoP32ZAjFt5HHIb5Wg0m/z9phKyFjJKQ/pCUWmIl5FZXQI7vFp
         uBk9pqZKOIys7MhftQ1EHMqs2+NG+SIHFyCHXVOy3R9LnxV9oNg2vrh2N4IlEtL+dLh3
         aJEw3m9lBzbtXJ3TKxSAOLRJ0vE+lbCQJH2uWdpvg/0tXLRbPEWjc5VA0vkwfzyS7x0c
         8H+G1xbCD8brcwrs4SdYUdn0KeLzy3RoAH5jT3T81G8fScytc2/VSpnn4gLhqHut/or/
         ajgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746100010; x=1746704810;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgwakmqHlp3M4BuHJh0II3nl/7c5y+mQeic4clcaFRg=;
        b=ffieLFu3o+fXwycErnMf59B5Nla8NH+0DozaIY43+VnETAGIORRVMsiWwsTfq4lVg0
         p28umboyr11UnsNMgjKUggkL7YvAsmWbuCFd6o57RBeGN0bGOhk24QnlIYvqL8Jj/Hsh
         uPzMOgN9kAJ4R8v8LnV9KxB8mbWfLmWkeZFB0W5K7EbA2dh8nsvGSgchkEa2nch6k+gl
         MJmIAzng/jQit3l020VWkpxb83hXb6knTvzFdPpwzpL23LTjYAM85LXj8xIxd+CWcbLC
         dQszX86PQ/09OIQkldTXMzGlDZLOzFo4+BTbNlU5+oZhfcpUFj5pFMJXx1eS+6l3ogvI
         2jQw==
X-Forwarded-Encrypted: i=1; AJvYcCW1oj3n49QpfszWJVM/wVNqhhySup2TXuJnK06Lw5FQ89namXzGMMDwcnGiCUr8QYD97KAqPM+PKvwclDK+bva4mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx0CPyw6NMAloLe3kaXYiD/D06+4kJdHMRXg+zj4In8k2p8qEg
	oVUAwRVcQB45C7sWmOLInUk4mHJDn4Y4y1mUEUNvd/dC8nU/qgNqxucHvMO7fs8=
X-Gm-Gg: ASbGnctAHnJTfVbA1vzRgtObByHjStzX12RDKrNoPJh3NvF9yK2GggmyUeiM4rF2QLc
	EQHxWx2v6rxm0gd7OcMb62mgKg66+ibD0rGQSE2Xo++aC2YKulVWmQogQYjNBU0jD++hdoe/VRl
	OaTbHFK73mRvnkwAXB/m8s1m7xzMgZf3G2dIVfGgbfstzzTL9oMg8diMNqlIL6WMfwKeJ2qVyzk
	GyvMCkiaOR9c/MoY5H6GtM47zkvRzV+4ZPTobRSO3QTx+VUh1oWdQlm84pbTelY7Vn8YmGpaZAk
	kjUnqVCQTTneyk+JwvrCdM4cLw7sF26SLqBl7wgp2VpsNJU+aCBvKn9oh58=
X-Google-Smtp-Source: AGHT+IE19/IV2sTGx5RIWEjQEneEcVM1DQ6fXDyvBd3U1JlBxsPULPZVr3GiI+mJAGk12V9wXMS3lA==
X-Received: by 2002:a05:600c:a281:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-441b76d51f5mr4498065e9.9.1746100010177;
        Thu, 01 May 2025 04:46:50 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af306bsm56097115e9.21.2025.05.01.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 04:46:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20250501-exynos7870-v7-0-bb579a27e5eb@disroot.org>
References: <20250501-exynos7870-v7-0-bb579a27e5eb@disroot.org>
Subject: Re: [PATCH v7 0/5] Add support for the Exynos7870 SoC, along with
 three devices
Message-Id: <174610000860.28558.16541132218843175138.b4-ty@linaro.org>
Date: Thu, 01 May 2025 13:46:48 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 01 May 2025 17:02:56 +0530, Kaustabh Chakraborty wrote:
> Samsung Exynos 7870 (codename: Joshua) is an ARM-v8 system-on-chip that was
> announced in 2016. The chipset was found in several popular mid-range to
> low-end Samsung phones, released within 2016 to 2019.
> 
> This patch series aims to add support for Exynos 7870, starting with the
> most basic yet essential components such as CPU, GPU, clock controllers,
> PMIC, pin controllers, etc.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: arm: samsung: add compatibles for exynos7870 devices
      https://git.kernel.org/krzk/linux/c/004bd8536cb9d56cfe2a13a6e05a4a1998455b71
[2/5] arm64: dts: exynos: add initial devicetree support for exynos7870
      https://git.kernel.org/krzk/linux/c/d6f3a7f91fdb84f286d943d89cf082f43fab239e
[3/5] arm64: dts: exynos: add initial support for Samsung Galaxy J7 Prime
      https://git.kernel.org/krzk/linux/c/61296c6b604df4409834eec0bd1115ddbaecb921
[4/5] arm64: dts: exynos: add initial support for Samsung Galaxy A2 Core
      https://git.kernel.org/krzk/linux/c/d5cbf26a5c8f57536fcb782c8985a83ca16dfc7d
[5/5] arm64: dts: exynos: add initial support for Samsung Galaxy J6
      https://git.kernel.org/krzk/linux/c/fc581fae50a2d9777a4056c07a62e5f0470b640f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

