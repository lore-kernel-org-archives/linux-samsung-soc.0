Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C735D42DA49
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 13:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605066; cv=pass; b=B4RlG0Pa7CSx+SaiKrNGEa/Pu9Nz69ICbrqCvjSN4Ke2H9jNHqGFAa0xWiUnLUPIDCs5BTJtNt2He+UkR6Sxa8L/3cOokV8RL0x5KywETxWBjkYzR2XSKVPAk11KcrIhq8s2epAcDm6tNGMiTAmS4TGoQ1dbvcZzvH9ww0o+KOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605066; c=relaxed/simple;
	bh=SihmFjkWEiEO0qH8JlrA4KwYnVS+DiBZnDYthOxMe8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTtbG5M37xPptYMv+QSU2rceKwmrSkv6IrP9s/fBsOQv7Bf4V3jA920NKwtPdReaTIorWPKfTGEoo+G9htx+LSCOqZQ+u80eIckXCoIm4H0iM07sZMRtHblVHEyhZriuPLc8zAOkbqDZ+nlUwDewyB4MGFDgumSz8QQqsBqhrSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nk0eJQ6E; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nk0eJQ6E"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-698ab9aae16so3501528a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2026 06:51:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783605063; cv=none;
        d=google.com; s=arc-20260327;
        b=GCFuZZ3YP+W7a3adJcz3FbWAZ0X6whVBmY++wz4+pIF1h85peFoqbZ49JRq5tUd3jB
         4o4f/Dfv8+4PFcFujyv84pzYPh2y2SQgvlZeJ/8glk5hz4+qHiRvR1NiVQ4nTw4CYsRf
         HYRC4IAO0O55iLcq6IIGKK+L+vEwcRr0YKcpeK54J3RlFp/RZ1Ozcu6C9/tYRm0r4DkQ
         qqy1rvXPCfi6Hmtx6Lar502ULckH/ymMa1xlGkBlRRU7V6ALvdGJtLqZt0U+KvubTlSQ
         dsomhTHmeNaYvUU84an1VZVH4EwmWH/C9TOsAi5vVrVg0thTCi/fxMdz40mEaV2fYjPQ
         3Ydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ybzojlHD40xTUq3ZfqVQQgO/h3HFfouo+/UtgZR9PKs=;
        fh=udAcUbXGBBalWA2oflKzN96n0W/JsEkoRDC7piLXkfc=;
        b=lODBTi3unO7f85a/vW13+xMaw8RJpvUrWsMBlQ6E+s5BbjkGEm5hWVyl/Q3O5yOTkv
         yR0Wo/Q51nFF34ojG51bmuiS/AoTtwcduhH7tgpUKFT7rA5/NGke62ATTXvfeosU77jD
         1FaUtneDkxacLsN/V0Z6BNkzDaVjSHbdgPfcMrJGvsUhFKncrakrtLAFfm+ncy49X1kg
         pUnhrxEAjjrZzMby/4ZrUmKt7MTp+D5vdFp7SCtJN/Iqqlq8d98dDIYAh0jMq8+CHasB
         VNdo97ug1aKWSWSv3Ey0d+fIm4cFczM/SqJzMauH9v33UP0ESogi2+IjSybbxD0YrLkL
         GFPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783605063; x=1784209863; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybzojlHD40xTUq3ZfqVQQgO/h3HFfouo+/UtgZR9PKs=;
        b=Nk0eJQ6EVuL7xN8ec8R2tlT/Bmc2hTLUuQS12j1Xyv2G3Obd6YLe9lTp8O5nmBuo4e
         CxGCwyObkmt9MvOA+Hm29UDNJx1YxvUIadDmS9BedKhkkeLroUdKjUK/9aVV3PYTXSK2
         KPrl4yjs81nErQFG364M9kBGcGRm5cK91ZorCQT52iKnL//HuCURDlYmGx7kBB14D21K
         4lUQgLgfK4a4rSUVl4xFtvGVAzNSADXgBy6+NRRXSOnuA2xdaBIrXpYC3IAoWPcLbNOO
         5sO2IFT6KJM+wpdT9LVEDnje1fMoxRX68s9SB3BVattd5AQD4B//ZCrg9CrJtIX7tVLK
         PE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783605063; x=1784209863;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ybzojlHD40xTUq3ZfqVQQgO/h3HFfouo+/UtgZR9PKs=;
        b=XzSdmzjGz1hQXNokTWZFWwxDPBofARwNnzgXlF9TdAl39eEBAJPS9iXCeJgnKSj0k0
         Hu1jW9MegZvUP3ol2J9lSVqULoHloe7JNac+XxIVvW5kqKV3xlA6KAsKir1JaE1xIv+e
         xXR2EWxORDdB7zg6MfzMjjxacGiKWaiMSDkixlvGB8sfBTMa4ianb95ZQu0+xPffn+1L
         G7W4KlzVzXJPD07mTz9OJD67takRcqRBCf67jxTpltAqtvaRkzxmf8JfHXWX9nL3KvB2
         xbZMl1xOkfD5IQwiGWS6hYZU+hu3g3qzBtORI8WNZXu5NY1BmY9542GoCZxVimcUaTPC
         99pA==
X-Forwarded-Encrypted: i=1; AHgh+RpsN1/o2tjUKuzFzZB5ohmjb8V1K1sS8D/IOUq+VtXr2u7ZwlXWgcTq3StnB0oDPkspYm8GWyuPAHmkqz/55FzwPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF5gWp0OvThDqgfhDMtCA3NYDbtmPWkh0/PjG+L/Aew9hCVTkf
	AaQR9pdxArsHmrXsBfXKkThMZOGDU1H3pJ09assDfLXmehK3HN5gVUdshMCQ9bFvnjqkT7hwKWX
	hr/TBZZhYvNpvpWLnmcqlSRvMTy96fXFRz+RjgbNNAA==
X-Gm-Gg: AfdE7ck9FxrIsM1khnBxqLlX/DDcBoncm9W8Pj5wgFV91hUmFT5JLOuEVxSYYpGSnCL
	4C2F+bOFoiTb0de0BaLQjB1TxuhIAmNxUEn5rL5RzUK7H/8LjSqu3DgPgltdWyG9iYAu29qYk7R
	YICYIZaSyhN+2VMfR7IeDTnUu02z1z/qWpwGEvKX2BtIfCJ4rJVclBo0Aflw4P0F3V14ux1+++p
	7y5nYULTdJaK724b6VIKXVSoCtjbzJDoEqUbDsd+3DEXZeKyc5/ZSyGkr2qNfCUw0aeE6t3noI4
	d2NJRCaWpFvUeOBC+Wi+BF11jNEnXyM=
X-Received: by 2002:a05:6402:428a:b0:698:5610:76e5 with SMTP id
 4fb4d7f45d1cf-69ab445ea87mr3046587a12.6.1783605063166; Thu, 09 Jul 2026
 06:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165426epcas5p205bd4b60c6f1dba68f4f1125ad29745d@epcas5p2.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-7-alim.akhtar@samsung.com>
In-Reply-To: <20260627171228.2687857-7-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 14:50:50 +0100
X-Gm-Features: AUfX_mzbOQE90wbcU5W8GA5XzSbsGokNAuCSRvh_hJojsQkyE6XqvwM4U1XHkcA
Message-ID: <CADrjBPrPi_x-ppDtQAMHC4akqhzpT7i66Dz86uCzopdbW88MBA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Jun 2026 at 17:54, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add maintainers entry for the Samsung Exynos8855 SoC based platforms
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1705eb823dd0..f6d9e03d3370 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23996,6 +23996,13 @@ F:     arch/arm64/boot/dts/exynos/exynos850*
>  F:     drivers/clk/samsung/clk-exynos850.c
>  F:     include/dt-bindings/clock/exynos850.h
>
> +SAMSUNG EXYNOS8855 SoC SUPPORT
> +M:     Alim Akhtar <alim.akhtar@samsung.com>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:     linux-samsung-soc@vger.kernel.org
> +S:     Maintained
> +F:     arch/arm64/boot/dts/exynos/exynos8855*
> +
>  SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
>  M:     Tudor Ambarus <tudor.ambarus@linaro.org>
>  L:     linux-kernel@vger.kernel.org
> --
> 2.34.1
>
