Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EE92E719B
	for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jul 2026 22:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783291245; cv=none; b=kGwwWD0hlXpslFh79R8wyv8qjWMAT0Lf7rQ756p7juEr+fkhocPwx8dWI5pPS5NBtNN13RMxcx2oiCl58vk11BWA5d9DlRJmj/0WpcKX0hrVWUd6gXaJLwQOjlCZ2kUND++nKyJBg88qBvjkYYLTuInJ+y+cvwYsm+jfqOZFgEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783291245; c=relaxed/simple;
	bh=o6tKcjSGL3hmAoOfrQ72FhjNH6OcQ99PKzW3pQ6hb58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rzHlte4CccfTPczWh/pyJnY44JlR9Mc8gnDfvmVXKqsSuL/AbfaDpqTtWDfPFx1nZykLJMyeC6cUcWON3VEogMMrpW4hcOxsMdrTGA5T7HTZ/qrz2e5/kJV4kl0NdvOpi1IMj9vcozFjZkGBbt3aMGsl4EElqUs3/V0pdqRb7cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZzyVtOT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZzyVtOT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so21524055e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jul 2026 15:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783291243; x=1783896043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=veU2IZXpTiLRV+FUCeAbLnHfRb1mcReExg9kWOUDBqA=;
        b=IZzyVtOTFcv7PRBDHD9/w92l8TEWp9nBHTccefnzhmj9va1ldhieCIOA4T5vb27jRC
         0VeUky/pI8uCWNc817jEiSCSARdtbltKuTVdAPevc9pJMqZE82DnCmGDG2zIWOkED+3M
         33CT7zxRAOsUYKwLUJ4XSVBOHIPK9QqUctQRp0UmLSudRhuwPDl9+Kknt1CBUUl2J446
         4LiIhHZt7mMZJs5ivy7SMxRpoiiBmNXNU6W2cnCx05ADuomxMSstPwPoSaj5qpPIflBq
         sZSbcILeHpQu8bzaNzM+SWcLClgqrj6AIN9yTh/cY84Mf5UXEqirx5JU2HFRlys7g1xz
         xBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291243; x=1783896043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=veU2IZXpTiLRV+FUCeAbLnHfRb1mcReExg9kWOUDBqA=;
        b=Jvnxof1Q88IBwunD2uQKnIYq0LtMVqpj/uLVeP1m3M1lWi0Hc86EVAC8YASdu5laoX
         8esfFQ/n+JcVDnMrFKfS/UJM4B1bp8kpWTakl3gW4pMwZE+8xKuu+conn2S5PApXxzP/
         UmIqcfD/cIWJnPJm9oEWpsmLs52YXpSFY6dc4DEqFXkuzuqCIjjQv20uf7GXgiTIbQf5
         /qTALE8vaf54c7LQFNwub9Y8cx+iPV8xGtS6/VZZVjqihSWFUNG8tQfWHjcFL1upZN3C
         V7Z2NiKFRCtlOhkFl6u4dsczf5j6g5QE7jvopgCYI2X/7mjgiOdAk1hP1pMhrhdY620r
         0LpA==
X-Gm-Message-State: AOJu0Yx3jtJ3z5hxfYHTjnChJLaic5ljt2rwbZQxMauu20Eq39da1qSx
	sxS2ajmcq032TUsB/Wm1aVm6UICmrtfhViudCETh61CX5bNua1XmOtNn
X-Gm-Gg: AfdE7cnMlpBK7/ZsgJbvubGePGnwJZB/nB+0ke/1JXT5bK/ub88XAyeBrybIp3WfEZg
	QHoZ1OpoMSGT4AsFQQXaxoAJUBpY3r2XmYvy3zoe52tXxDGQD+DDhjMt2HXlE4hzBDNFilch011
	5cZDL6+HFXcCrSKahKqPnm8BGAslZt8hyxBLCDgJobLSigfD6DyMSrkZ1g5e7yE1EvA4tVAME5H
	74LyEbXqzTxkebfxX8xpC6G4KFIerD+aHG/oTpz9JNgB0IYick2ditkQRX3DOY4GhC2GOSM4361
	xv8JTpOS5Q2d/1k4h6lOTmQie3MPd2ckJLG5zZ5QTbZFVnIjp8DoxgPJR8g2tnVCMRzergoFfQs
	036QireGCGrvgTtvnkWQJ+wdxYryAJ962h7B+XDIqVvE0dEg2dSPXUrDIZhj7WDN9Q3+ULT+qqj
	//BSrhM34ZWWBtMWxcUGzkNN8Zpvc/zaS0ByvMmcrk6Bufb7iKSwjLNN815sE=
X-Received: by 2002:a05:600c:314f:b0:493:cfd2:cd06 with SMTP id 5b1f17b1804b1-493d11cef20mr85595145e9.6.1783291242828;
        Sun, 05 Jul 2026 15:40:42 -0700 (PDT)
Received: from [192.168.1.109] (87-126-128-216.ip.btc-net.bg. [87.126.128.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef1807asm289906045e9.1.2026.07.05.15.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 15:40:41 -0700 (PDT)
Message-ID: <4df9f388-2dc7-47b6-afc0-7a0cc6d15ca3@gmail.com>
Date: Mon, 6 Jul 2026 01:40:40 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
To: Alim Akhtar <alim.akhtar@samsung.com>, krzk@kernel.org,
 peter.griffin@linaro.org, robh@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 hajun.sung@samsung.com
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
 <CGME20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d@epcas5p1.samsung.com>
 <20260627171228.2687857-2-alim.akhtar@samsung.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20260627171228.2687857-2-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/27/26 20:12, Alim Akhtar wrote:
> Add Samsung Exynos8855 smdk board to documentation
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 753b3ba1b607..273464400477 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -235,6 +235,12 @@ properties:
>                - winlink,e850-96                 # WinLink E850-96
>            - const: samsung,exynos850
>  
> +      - description: Exynos8855 based boards
> +        items:
> +          - enum:
> +              - samsung,exynos8855-smdk         # Samsung SMDK
> +          - const: samsung,exynos8855

Is there any particular reason for using "exynos8855" rather than the commercial
name - exynos1580? We've already established using the latter naming scheme as a
convention (e.g. exynos3830 -> exynos850, exynos9830 -> exynos990) rather than
the development model numbers, so I don't think breaking that will help anyone
with the already painful model number confusion.

Best regards,
Ivaylo

> +
>        - description: Exynos8895 based boards
>          items:
>            - enum:

