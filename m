Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E776233712
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Apr 2025 09:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574189; cv=none; b=j/m74o8XiqR5s2kS7yMlrJ6yIXH9fwYMp5/pdzw+zH46wkvKucB8QvKC9ORbxrolBxgJfFEB8n/gBzPuY/fWK5fF6Gajn0i9l7FIPQzJsdMqXuJ6ZIDlwmV6qBFCKiO72EDdVAHLOkUm783Z6J2I2sf/jddpWLuXglPpw09bRp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574189; c=relaxed/simple;
	bh=N+kCgI7u3QRQyEc36DEg7P9HhLeM6WQ1Qz/8t42K2fs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SDcipzyliFH48RQZRBoDUyWpj8h2DKxax4QbamgMVkDy5k/xLQ3wDgnBmqkAXIpMhIA9Bww7Bonjm1G1quDL6thigxh70U+ybgv5MHxifJ75qHTjuLleonzo5DSVFW34zUjnlQ15w4y3PI7dki1/pmLZh6QIBIMuJhZmWeugyM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pLwfznpJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pLwfznpJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso1266255e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Apr 2025 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745574185; x=1746178985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JNZR4HYw3LEusKe1YuO93jYjF39HJIbe/sxTu0RO9o=;
        b=pLwfznpJgeUBXPM7FYv/2FNpPNTyNSQ19k03y+JbaiooF29m9Il2yNht86vOJNVCfK
         l/T29xuUZ4esGZoGOoYWEsskqSuHWikXZ9zvs0kqPno6C1t1TSOnTYVhnx40emGEBOVd
         KvONf8a+cuTF8YVUbe4FpQ6VjIu2XbbALDVKr5ZgdnCGqKvONlM/sL/ZE2Vzq0my0oeA
         z3RV8frmRA5qIfZNKeKqCGH3mb4oO6ftcL5VcVB8a75nWF5erFPDQLZ0Fe6Qvx1HUzdT
         aB4bnHBQuTkIKp4JXAq9nEdR5GwkIC4DPMnqmj2SAQ/4zTzdQDy6GJqSd7VBV8Ucprmq
         s0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574185; x=1746178985;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JNZR4HYw3LEusKe1YuO93jYjF39HJIbe/sxTu0RO9o=;
        b=IREMoaLe2LNfop4Uvca4iOH7iFM+qbRdfOHOl2e9/AJ/wlGIuXsn4qB6768rEGqgav
         F2CXIDJ3vkWN8I07q5uBGBVz02ctupJ+6vaqcH/Uvcstay3ckHRztjasmGzl4Da7LGI+
         Ao9DhAg7FRX/QzhRriggapgP6q9kAxbi1qAQesJ4xniXW4bgwuq3rNaVu4Vzv3QEfN+G
         i81VRIKquOuJFa/S56isW6rpWvXrqq1l31wMG5GUf2pA4ewnyUxvX2mWEuGkaHZjKH3h
         QB7JPan1JA1d6165QTqg27kg/MfxOdzUVmlvJIiVD+L3NkkI2UAzirhWb1LHt6n+MoNu
         zGRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1dDK7AJn+zTXrJSmNRQ775PhT+iLzYw2Sd0K7eubGAw3EoiwKaIV7FZQTIrynPAj5mbYUOodQmo+m2j7fyyrOrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS4uZU2Os+Np/dkBecvqA/bjRF6JOFXVPPjwnGdwzI4Qzsxs8m
	1ImGf6oKD1UEx6P4T2IrqKssCyT/FC6RvUrAE9MXKLE/FDyhUM+YVgnq9D+3Fs4=
X-Gm-Gg: ASbGncsD14GUNRC6BLb1j0CD3238imwOXelg4EdCD8C251P7ZALwOcjUIJhTOeLgEmI
	58UEdlFLGh6ws0+bhjSyOHAgIKo9LZ0U+c89hUBW/72ack+s4rMz5s/iOnZP25umM3c008KPjX0
	iNRf9+oCBpzWuldgTPdzOLtbspY6LC2WlXAFVpvDZmO2EMKUrDUUrXKQXVZmlN17LZHJcv9p7MV
	e6Yn0+vAnYVQCdnpAudDcgMxmuVysnjf1tw9GGcGIqmhG6B1K7bnyCZJ4cj0cshr7k0BLUtNPAy
	SMUDctQJe/vLW1oNmOxQBA+OuRWcxbSIyZVNdgxrYMsSi0D2WK8IsaoKDDD4nZYQvhPnOQ==
X-Google-Smtp-Source: AGHT+IHwjCg2l2T8eQ2xx7s1I6SBtEwT1v0ZPwhP4gH8i9QmjjIyMGHi0pgA/ILdNqanVVT9KFG0TA==
X-Received: by 2002:a05:600c:a016:b0:43d:77c5:9c0e with SMTP id 5b1f17b1804b1-440a65b9f31mr5514995e9.1.1745574184616;
        Fri, 25 Apr 2025 02:43:04 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8909sm19441395e9.2.2025.04.25.02.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:43:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250424084655.105011-1-krzysztof.kozlowski@linaro.org>
References: <20250424084655.105011-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: samsung: sp5v210-aries: Align wifi node name
 with bindings
Message-Id: <174557418347.69534.14818406256257839510.b4-ty@linaro.org>
Date: Fri, 25 Apr 2025 11:43:03 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 24 Apr 2025 10:46:55 +0200, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>   s5pv210-fascinate4g.dtb: wlan@1: $nodename:0: 'wlan@1' does not match '^wifi(@.*)?$'
> 
> 

Applied, thanks!

[1/1] ARM: dts: samsung: sp5v210-aries: Align wifi node name with bindings
      https://git.kernel.org/krzk/linux/c/e0d7c81b15e8694ebf9f1976084435728b8936ab

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

