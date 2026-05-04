Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E410831A56D
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 May 2026 20:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927701; cv=none; b=IesPX6pGS/5KFDVaKGG+A/YtI6IVwmvmCrjvOffgX8lOgfSK9SlhnRwMpMk4/jfjsJ5O3MBmov48wvpf7l3eQxo4sBf9PAqS+H6KhFAJMwjyb8WrILeYxSn12h/lV/s9MU5+XeDuqs3TEIH00jLztKTdWGuVv8423eqnC68nlLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927701; c=relaxed/simple;
	bh=lHRbQRvhCefu2MS7D67kLrFGL6wNRu/ft9VmKJYEsRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EvaC5kBJvjBxU9n9lt97fcb14qAPXIdWzc6cubBtrFYxvLkDmjjppnO6NrZVmhiMovtUx8PRXouifEKO4Jc5yEmhGL6RMTdeGRUiPK54E0G1LktsAXE5IEk5OjxqYFfjr01UiV5InIzSvtK7BSXpC593RfvXfbXBLNreb8tdAz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LW7YusUO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LW7YusUO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so43442405e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2026 13:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777927698; x=1778532498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jF8Q6RoPGmOljbJrevjIunF771/iJgvq5ngDUmVs95E=;
        b=LW7YusUOcrdFOeB1dfN2yI679/4Oz2ya60WlDz3z3axJrQ1llIgcf6HbBlZTfE7Q83
         AUEGaOuYQLtf+GzbulfPRyunCLxnKF2Xbt51xtKNHJsuCAzcuJ5ZuZGTlT2XSj5bMIvp
         IsOQPPGBgKz+qxD0eI2aSYj082dUL93qx52ixpgLL8HI8DVOrf24pk0VoCxjQN08XVKq
         jj6rwJmroSiDEakwSwOT5aeO35f+L3q7ZEub6zlzXuatFq+UTTXgH24KVXTNz1kcLNr0
         kE8EPLaiWkvPDWEQ+AaaiLzs8ZbwOtopLn11ytCw7+Dci7EUklIm79THY1Satn93B/m/
         kSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777927698; x=1778532498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jF8Q6RoPGmOljbJrevjIunF771/iJgvq5ngDUmVs95E=;
        b=CU4uwSfOY7Ucsym3bDAerz2Omp4BSI0AAcOwaw0a9KoVA0EAmfaR6LYYiWcG4JIto8
         jUhttHNrgiuVU0C4Xf3qBgqK5WmPy/82RtPLOA2WOnt503V+qzQxvkbkxuM/99LSTHCQ
         Aiinkfgem8PuVfxgvJzIXZqfZV7iPGMR++zxs0KdPmuHd7rmwGGiSZrjkNhlMyPVl1kr
         vx0JnxUmWMuWfpS0uxY+mBLwedpZY18UH1ZsNpQmUJQws/pDiOzmqfw4U7WpK2pb+bdB
         pcD6DXLxf3pgK86v0jQT6QeRcIYOYZB+eP8hH7VxlM1uDfW6mBhwSxsYDj2C5AAxKEpo
         WTeg==
X-Forwarded-Encrypted: i=1; AFNElJ8Tug3ztfynsQRrXR4bWt9mfWq996CuKooLIn9H3K43NMWjeHU9uiPldfZwEhQFzM2Ci57LUf3mlf5PSPuhq7YM6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLzkMrFbs7lvybot+9YP9sHGGpquW5/GjVhaHcgbJGYlyQP/Lq
	wj+TvVruSPkcSRFXrzTfzGdQa24zCGHAKFvHK1Xt9qETmydazu+IWLC9
X-Gm-Gg: AeBDieuZ1e/ZhLGmdzB/924GNiZpNuzKKq8RJOoTOX26Hrf4dqlC7HTltyo5scRoa9a
	xrNTdcVOeqBB8p9vJAIF1XF2ZsPmn9m/nw3pnw1bqy8BfM/ozyd7GC2K4mjs710Odx9/u8655YK
	thhd+vmIBuWrgD+ysJ/ck0MNN1JtPCseDi9zKxmgwgysxWj8P3GMpUj773oHHVMRDDCUQ9fypbk
	Rzcw6M+HAjk4f0ir7EYF0g1urqVSyewAU6mP6GZHCybgTQp4RGyM9mnMgY8YJ8yiG86giI/omSf
	6h0HwZFPRV+w6fdm2++IPU3fDrV2hXg08/Cvd8Q1SCgq75AmLPQhvpor7hSfV9izNKf3zhmu5U6
	DXz/tEyzMXR1JGzhKLX2y3Me5FfE7acvDx1xpkmL9UQxEQnQLIvSgdsblakpuhOER97BZB5F52c
	Ir/7WNj3TKQn9bzsAtBCbFhyRO7GyrnMjOiw9sYrDQ2bwhhD4QrWY/lBhv+O1GEbBjTVZst0xKk
	mtYihsVZCqUSdXNnEVY
X-Received: by 2002:a05:6000:2586:b0:43d:7b7b:ab76 with SMTP id ffacd0b85a97d-45003fc719dmr750576f8f.10.1777927698004;
        Mon, 04 May 2026 13:48:18 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:f99c:d6cf:27e6:2b03? ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4502865baddsm38791f8f.3.2026.05.04.13.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 13:48:17 -0700 (PDT)
Message-ID: <05dd01f4-186b-4358-b90c-36dde16036c7@gmail.com>
Date: Mon, 4 May 2026 22:47:47 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/exynos: remove bridge when component_add fails
To: Osama Abdelkader <osama.abdelkader@gmail.com>, luca.ceresoli@bootlin.com,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260423200622.325076-1-osama.abdelkader@gmail.com>
 <20260423200622.325076-2-osama.abdelkader@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20260423200622.325076-2-osama.abdelkader@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/23/26 22:06, Osama Abdelkader wrote:
> Use devm_drm_bridge_add() so the bridge is released if probe fails after
> registration, and drop the manual drm_bridge_remove() in remove().
> 
> Check the return value of devm_drm_bridge_add().
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> Fixes: 576d72fbfb45 ("drm/exynos: mic: add a bridge at probe")
> Cc: stable@vger.kernel.org
> ---
> v3: add Fixes and Cc tags
> v2: devm_drm_bridge_add instead of drm_bridge_add + goto remove_bridge
> ---

Hi,

Reviewed-by: Raphaël Gallais-Pou <rgallaispou@gmail.com>

Best regards,
Raphaël
