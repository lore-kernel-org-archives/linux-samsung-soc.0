Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266D120DD72
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2025 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998123; cv=none; b=G13qs7NETFvXmLxmioVxQeZtTAExmKWT/itpkgzVvo6DYPZmUUrD2lOo21wcrydMh6zqGn09epJ+dtKYr2uDdrgdThZJEyugSgBW1pRAfEm24pTCi4cTeM2vgpxVuGIuuLem4+9Tjx+PrhkVOqPY9Z2U4KtxJsZe6Y4rOMIVoTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998123; c=relaxed/simple;
	bh=xKgIqILnPtnjS48N+Dxj/TVujiXB39GbV1nYOP1dghA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mOnTcA/biWhzjC4b2d2KfF/rFDuaC9h/jKj8GNqBfn6fY9RoxmUyh8TvDN5b2mL/WmPctwl3BETJtFLjImAPARNL0NqY04IsRPINxEdDvViWtAvJBxvrX85qMLWUkrvnviZ4nYlgkX6BTY5Q6Bv5w8BPYQOHk0c7BAThEsp1rpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cUzqbJ+R; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUzqbJ+R"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-440668acbf3so9397865e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Apr 2025 00:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745998119; x=1746602919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07WxlVOIaTyluGdh8BRRgEGy/WFU+aaBchjV13UhNQk=;
        b=cUzqbJ+RUnLOn5pWZDxsey/6sMW6jh/ev0MCeTH7TDSNtI7quDWtr3f3KVykftgO7I
         W1jpxxQwqi+3PCu5/humMD+EX3hIHQVa19FbMhdvplUlLeQFUeBRVggWx3qH1j/aK6Wh
         sDY77CoeXwXYlkEdi+atizs4RgXcBagYqXXCXmGvQd2G/2n2tO45TdlWVkMzCWvE2XOt
         y7nTvJLtg3Di0cJ+mVnQe/ympMrBrFIXKmKYlGhK1+BrXLFPeWUJP3QpM0xicTjUs19g
         dcG7bfmxl1woofo3hJSyc9bGcAP2H5kGYihhG3FmTErt5G0NP6GiCiHTnTC9PstzM94B
         m1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998119; x=1746602919;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07WxlVOIaTyluGdh8BRRgEGy/WFU+aaBchjV13UhNQk=;
        b=QvwoST6K/E0yT/f09/bs4VocaofWgUJzJfaET1dKF+h1vjzggKpNfDG7tlCBrxKpnt
         QfF+kc5rsI7sdegxGUnBwQqEPFeWWX7uZRuBJlRrKrdxQrBie/ALH5CMpjN28tqLG1E1
         9B1mp5T4GKg9jLlNa2njVY3WBE1+Tje1CalC8vMQAGr/k4OvLU3d4o6h7VKrwygE9jUc
         hQwPdh/OQD0CoG5w5pHHwbNWpTzzv/cu9vTuzcAtWZzoK7YOJKHk0FEAeCEiIcMsd9Ns
         4Oa15zzMA52lwY0PPQX3kdrOxhMNOtgr1geEZTjkmP0tWFRcFggWHaq0Sc3/gMrrtlZz
         wxbA==
X-Gm-Message-State: AOJu0YzCgn9JZ94X2jd8EGrUbrCmGN40R6qFtYd/gL/j13TTlV6Wp1co
	tTdojNgdSxnwR9cKnIsQOCLrMJ8MIvF8U6VQb81Ht8b6ikJ19I8qud7JLDrfo54=
X-Gm-Gg: ASbGnctxcq4wVTlhp6tT0cwIJIwcpdS0fg0KA6LEnb/B3MT5/hTN/Tsts6BG7lu5eFg
	5GQiQrBgJ1xkOXB4btQBF6mUouYKXM/tVBBfjsSkgCIrmbu79fP1iJo7vDViYM11/3wzB40wWIR
	bSaKpqL0UV5g6+H7X4A/6tyqE/2P1VC/uDk/iIz5WP2kHrlzaOpCRIPCfG7eYIGUoySlovbOJyw
	3WYWALalKCEXnAs7n0WURO3m/+hiY3jXRDoo8kX4ZT/IrYJDgDPkrZGLxw2sMFIN3wMnKcPt+QM
	R9XAPbnsn49Fjq7aLBO+veJn8t+WdMCA76Jn0BVj0gX3UNySWRu+aksEabM=
X-Google-Smtp-Source: AGHT+IH6V25XvncoZLZe0TycQ29EnlwaWMEky41C5N2edT8KzWHciHnrPjPlKJj3kIRZ+fXKOUOaNw==
X-Received: by 2002:a05:6000:2dc3:b0:3a0:7a00:61e9 with SMTP id ffacd0b85a97d-3a08ff35f51mr414041f8f.0.1745998119358;
        Wed, 30 Apr 2025 00:28:39 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4a6asm13905525e9.11.2025.04.30.00.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:28:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
 Shin Son <shin.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250428113517.426987-5-shin.son@samsung.com>
References: <20250428113517.426987-1-shin.son@samsung.com>
 <CGME20250428113601epcas2p11d09d84944957018da75aa548d3ecb2c@epcas2p1.samsung.com>
 <20250428113517.426987-5-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 4/4] arm64: dts: exynosautov920: add
 cpucl1/2 clock DT nodes
Message-Id: <174599811787.45412.1841327377938630305.b4-ty@linaro.org>
Date: Wed, 30 Apr 2025 09:28:37 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 28 Apr 2025 20:35:17 +0900, Shin Son wrote:
> Add cmu_cpucl1/2(CPU Cluster 1 and CPU Cluster 2) clocks
> for switch, cluster domains respectively.
> 
> 

Applied, thanks!

[4/4] arm64: dts: exynosautov920: add cpucl1/2 clock DT nodes
      https://git.kernel.org/krzk/linux/c/aa833db4b82205275f4a4c08554b3dde99dae0c7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

