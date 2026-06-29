Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB1835A393
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jun 2026 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729456; cv=pass; b=OL32dmGXluvvudtQb6jm54ih2BaPXchovHd7c2vqAAOWQtexaQ6+CTpn3rBe9rAZ5XahJ6FrGCNzyktCkjFj6aK3RGaFqhQdPtp003a4MDM03ib35ewX+nIIADcshXGaGpMDELSou/bYnHDXtpO7TZ1Q2wKcKtswXZiMttMbS5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729456; c=relaxed/simple;
	bh=FDg0Cl/yIbEJs1iZUcaKBc5BZgkQJeT1BjRjBz2+49s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lxg+XU93qZosBrM9pBCTzKILMl+fRLe2zu5PStgG0AOhcBz269LfeZNvluOl8ybShLs6EZ42//XAKaN+Z3/ukjpivQhidlOy52fDSzTTSPeI7WqgFk0MsIfzTF7/BqtHRdyGhhzDRynaXd/FSDaTdroIiUByssTmw65E4Byvifs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNLt9r9x; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNLt9r9x"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-697edb1bf6eso4591552a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jun 2026 03:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782729453; cv=none;
        d=google.com; s=arc-20260327;
        b=E967ngtnemUoGI1jSOYdkSatvyLnwuY+14AE8q9y1cYy0xIHiWzNFRtRvE8pQyfuTS
         YjBONekN4yjarnJJiowCoVUzw/oTpKJqpuWbSyuZ3N1CNgm8Xchtzmm5I4Erls+RRRfi
         OulpEXU09ixb5MT7eteLYqRwIH08FIF2EkDqFIxAIeN3gpFMcU3q9IIK+9ZxYCApSoie
         sb0s07PdUXqYO0alQlvz0Oceu4854B+QIegscKdQFd02TWKCoMHqpJLZumMV5I1ziKdj
         5ZtE2OFy0KILb0uQtp5uvGYZwkHqQy0fZojUsyFeXXts0Petq295yaQ5gToJtlniH0oy
         hMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3WQCCc/cF9ZMS+U/vA37gGpk3ADooCOs8aFr7FRgnAg=;
        fh=U57IkMfpxq6Pi4bdrC3nnDJ0e+SVZ2wkFdkINzIWVpM=;
        b=ish8HjTYRg99fhx2NdffiXCNDgAu+jfzGGDrI9c1oveFCyPGfM6DqF4Z/LWm77ozeu
         mcP+C9kDCP3HnCmiiU44BjpOBRWdEefNr20F4HWcijaRGID8WV40fL4nu1sDsbVmXbF2
         +t5gtUGjHRuML0jz+0Y/TtY+G+iZOMY21e+MCed3AaAo1E1lvFCy4TYU+fWHnXtrnRUt
         Yrs33ST0JHYTfqqMg+KmGFulEHSOPrWh2H+N5K3iYifqt8pzLePCXECXzGVpxzk5HxG3
         wOsf3j6hKRlOPNx/ZdUhZvbDSsAz5aMlJzdUQTVSmmGfEnFGleqAaiAC3ahnAfGvXs+Z
         7eQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782729453; x=1783334253; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3WQCCc/cF9ZMS+U/vA37gGpk3ADooCOs8aFr7FRgnAg=;
        b=yNLt9r9xtmlcY4hQOxUHk6RH3pxvfxn2ARq3N0PeKfYTGDUFyE8d3aLdwswytFWgGi
         4IxnsS6oh8tyJzF++FIwCHYYTeb3esPrdfYhuzq0WxfI5vxjk4qo9TA4yoxkBMWJ/vol
         UcwWSFQ5alScG44B0rHsJPpA19v9IMVF6xqIxDx1WsORJM21NU4WibuxemOnXFW8TxLs
         VYkNnnF+Jwm2NbG6em9jjmwhjhyngoTEXTWB99oTD/z6MW9Rni5ToGKxBKNNaI01wwk8
         pIXE0ZiSck51LUf4FPhkCsOKNK3trxngGlwd6MAkkwil7bys5yHRdH7MhFIIv8FnsyTg
         OZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729453; x=1783334253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WQCCc/cF9ZMS+U/vA37gGpk3ADooCOs8aFr7FRgnAg=;
        b=GxZhs/0q2IObyCs9E2RnAiwrlJ4bzJBmkrM7wFqUDBhi6no6JLykpKKufrLt2lJuWO
         FsAAfVw/y9S3xqtYRGN+wX+RCPdWwWqqgQYVrid+rMl7QhAEO1iBYoModlR2Mhcr9YKv
         AK8/ItCori3I2MefkT31oMsr+8tO55NKQoOK5AxR6LtV9m+jofGY3dFI5EZRWrQZ2Xzc
         EYM+CxPGaJ5XIlJL89wK6BTg5FvAlz72u889+f+reT1C5dDClc+j2hQzJ9KQoHznA5jB
         HuLwfI2EPvPYfy7KU7GLsXv8q52yCviE/RVBbViU6OXN7WmqMr70fZgq+L2bYIwj3aFS
         dLVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUYiWHS1qIN8PBt9WQfHJFIwJMuiiA++kZLdX0PQAM9AsoX3QdwqJ7doCA/xYBAFZi3ot/A/F5ZmRs+tHirBQmiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyCXOEeeB54m4lSq/e5Onz75N/yJFvLCXsVhyDdmB2PxomVkJi
	wufEB1orJBLkeJ7tsff+HGUJTrkZFW1HhoA5OChnm1o+VMEzNnZSGsrecRBuQjLOpOEckrnBcaH
	2Hmx6sM+0l5WXx5FGlnOEcslp9G6oVWHezzylTkE4HQ==
X-Gm-Gg: AfdE7ckQPjlKccfVwti0FtnhwjWRMrtezkEc41Tsaepi2Ni6W5rY5/5jZWb3crW8gGX
	S74hYEY+Mp0GKYszklzxPp/MMFTY6w+fC4dG37/DrYb3J8olJsNyS2QJyuOFda3qQH9oMiobbLG
	O8SUYfuZBzdljwkbYSeo5TX9niJ70pow43Gfe61/nUJTz4mTklzUR4n+ZhmiZruS8avx1ORZ/9T
	r1YTfTn7eiKWmtGN/J1fh70tCCIhlmTZ1ZV27fp2S4vVv/CmeRyl2HL9UON2UCgy2LptOi4DGKP
	kZExZJqrJ6MDXmsCkaT2trUo+WUo8A==
X-Received: by 2002:a05:6402:430f:b0:698:3f58:9290 with SMTP id
 4fb4d7f45d1cf-6983f5898b7mr3425467a12.20.1782729452868; Mon, 29 Jun 2026
 03:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com> <20260613-exynos990-peris-fix-v3-v3-1-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-1-2b230db78ae4@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jun 2026 11:37:21 +0100
X-Gm-Features: AVVi8Cd_KzL4j8x2t75zH4aE58eWi5dZrC_hXca-XTNOV6txB2qHwNYu_bbkjxY
Message-ID: <CADrjBPoa7pTyfANuWznzeoLm7oWdWGcJbGxW4hmuSWo-R30SJg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: exynos990: Add CLK_GOUT_PERIS_TMU_SUB_PCLK
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com> wrote:
>
> Add the missing TMU_SUB_PCLK clock ID for the Exynos990 PERIS CMU.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  include/dt-bindings/clock/samsung,exynos990.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
> index 47540307cb52..c06f591d9d90 100644
> --- a/include/dt-bindings/clock/samsung,exynos990.h
> +++ b/include/dt-bindings/clock/samsung,exynos990.h
> @@ -434,5 +434,6 @@
>  #define CLK_GOUT_PERIS_TMU_TOP_PCLK            17
>  #define CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK     18
>  #define CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK      19
> +#define CLK_GOUT_PERIS_TMU_SUB_PCLK            20
>
>  #endif
>
> --
> 2.54.0
>
