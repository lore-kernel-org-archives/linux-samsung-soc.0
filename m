Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5712156967
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jul 2024 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720522289; cv=none; b=bpS9KVp4jt2exAVMvlTove9gH8Lkre5vjJUOHx0jyLxnxfaM7/Vr/2v02a0hbZfrmb/TDiUoXfe9Gyu81BPFk/ePSXV3I5Ujsu9BpuFOijajL9qu4EbdNLFxaEMaPRw4AN7c/a7P0by8h1LE0CpNI6H7EdJBpbvaeqwKTLB6Oag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720522289; c=relaxed/simple;
	bh=GuE84+tYe3IliZz36W/xwOvWAw5aen9f9pO/jTu9YLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EzpYgqxXfAJI32ELiF8iY/bfgqTmmWYFsNFvs54qgLJVBoCX1SWoJPRgLlZioiUlut0IlaQnJtd03yvtRMqNmFzGH0gIoJ4slhOOSFtOBekbfy2OycOBEete5EnQ88Q0yDD1USEMgR32QVIx8kAM8qrbJsBJ9ntv3tFjjRI5Bis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZid57NG; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZid57NG"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-25cba5eea69so2433487fac.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jul 2024 03:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720522286; x=1721127086; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ne6sGKGQF4GM9jaPTveT7Fc90CaEuMuRCImmXptQf6Y=;
        b=KZid57NGukekwIq+9YW7ovSClgvK3OT5wht0YGeLtLx6issn2BPNVKA9xWfqya3Q4D
         rgrpdVUYupPbXsRQKFg2NaXugCsUps1748fntbGScIdOfZ15uvJ5Euqd4UtPVQ7yAUUY
         fjG95ovi6Q0xR5807E7E0kr3k48JR/wihioYOzF83ahwNXcc1OEwMjglQkvns7fNdSRp
         JCDaSRSkXEo1i4ly9PEOaZf+BHZoDgqPtGmbwqpOQ8WHtygCA8Z1Op3KmvADVJyx2eDC
         LSycppoCDueVOLW48W7qUbmnhLISHmwsqMKQ5G6aksqXlhaaTZbfkBpG8l941JaMmZsK
         6fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720522286; x=1721127086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ne6sGKGQF4GM9jaPTveT7Fc90CaEuMuRCImmXptQf6Y=;
        b=Ab13ojDoN2v7h9OK5Yo91Fxq5DyEHNn3S0b826pRrqepBzXPIoHNBEr2TTq9xu8yJ+
         Kzg285wm2XxF2yjdVxKXWmq1DaUJc4icfFYtxBCV0ssb5FS/Ju0q6UrVsM65b94NJEc6
         Lp1arde8FmddgS7vzIKvKu4bOT8jan2F0XqaE3vEeDiwDR5nMdDbUGYzSIc0kzIwVM6n
         Q+ClR0BvH00FTVV7bUvNhALUrviA+XTUKU1fMg7bN1LSanrSDyqI7fAasrVJwHuK1RID
         tLHzLbN4ePHdpbHCjVItCQFp0RWHDN1+LlcdM2lvVEtOdvF38hod/rVk3Oh/HPl5TYIc
         rZUA==
X-Forwarded-Encrypted: i=1; AJvYcCX19hY7lze0PnE/syF0wXiYdwWFHh+0Fnnk2VN+BumWE1/gQdMlFbvmpgybqunZAhbPbkejxt/+2KCAVyYh95HWpbfoOaLKK8UzYDseBNhyO50=
X-Gm-Message-State: AOJu0YzqNHd3yxKJMXGj3bxQklTxCIXeLNXWg3Mm+W9ttL6+hO2bWqTz
	mlUz4RLxTi7dS5FHDEjXH6B8dbC2QdHYeyRz60UME7qMQASGPvEp6/kfMEq0vkZxkRY0dImbSei
	zkB6a4gJ1HquSdTKZmZITxuRpHogRhaeTpf31Tg==
X-Google-Smtp-Source: AGHT+IG+y2y1lYDjW0w074p6b32KN/SNBfuH66xZOYYfG/aQ33OHnDDWnfHU1jSQkLv7VHnBWB5U5y0xOdhTHcklAQw=
X-Received: by 2002:a05:6870:ec87:b0:254:ccac:134d with SMTP id
 586e51a60fabf-25eae7575dcmr1763592fac.2.1720522285808; Tue, 09 Jul 2024
 03:51:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
In-Reply-To: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 9 Jul 2024 11:51:14 +0100
Message-ID: <CADrjBPq13+k6LM=Xs3Eof9jXJwOHmcMoJUXAR18aHfp7fEeLcw@mail.gmail.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix error code in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jul 2024 at 18:04, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Return negative -ENOMEM instead of positive ENOMEM.
>
> Fixes: 497ddafe915e ("phy: exynos5-usbdrd: convert Vbus supplies to regulator_bulk")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>
