Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312329;
	b=3RZCHyZbkjMpwxeh46XHRv/YFQdfDd52xxXCRsy4zcz4R2i7jM4D9eUKSrpOGIc2WpWm
	 xdmbxzyHFf0dZELynPSOxxjyxVsrscKsrkLuU2AFxVglD6zfsbsJ2SG8ty3T8G9YGFCe1
	 wB7JzoA+fPLi4APhRP7hg8yR6ZHpullfq0CNKecyF2o8vvlfP94ChkJCUIzWeyGqTNVxk
	 NqtQZM7rCaf4xpXIIlUeR3om7euU2T3mYaKNqRDyX9LLvzxf3OSb0I8bdkmNLIh93nA3o
	 lSqaj7kf++IT/VhmjEEtuzR4Rsitl7QdvEJRjmyCfntQ3RsypqnpU6u+9SojCh4AKww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=I5T5peH0PUnCrtzemSjuLVp2+YwXJuyEpiqwvId8VNA=;
	b=3m883nlvZlku+3VCx1A9+8x05a4rkaKd6Sx0a8aCQSqDrKlDCkVvqjMzVzJtmATbq1z8
	 CWEVyyjF01e87RVLjlhDnOX9yboEqKntzjBgOkX9eY5GqTPqex05yG+J9sq3FG7P4vmUA
	 lpJKEX/pa/ctQ7Cn4XTNcwx/tUac4bPUa+6nnNJ+oItq0MvoBXaGeNShz5itKbdaVr2Zc
	 CbLqrnZ0wsaoxumf+XpILxqINFiyrD6e7yEezEggy+a0NLn7E5sU5kqzE0eb5X9E4ISOz
	 5vBk40F28a4G3fD/mnWHrX9uQ3zvE+9QvXrhopqr6M1lHEs8qrtc7i2NXQmcQb/BLzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZ43syDN;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB4F606A32A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Nov 2026 12:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AB4F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZ43syDN
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3acef9307c7so15208421fa.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Nov 2026 04:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794312326; x=1794917126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5T5peH0PUnCrtzemSjuLVp2+YwXJuyEpiqwvId8VNA=;
        b=eZ43syDN2nk04TvvWXBmfsqm56sABgP6OslmMZzl4XUYv1Kf8t+BjBWbvNlgK6V2g/
         7y1hf2vLh4S7d/qbNqFNN/T3URlge1l2qlVnKEofkynJ8lsH2D1Vl2+PzGCWLgb7Xk0a
         L8a+bpaUTqE09dXf9IalxUi/0gvMaEBWiijLQHoo/0rSuF+hd6NNkVp0OOnjrYkQ/Axw
         Qs8hP7MaS/jz9JN8y/9jxYqB3c4K/dy6FaaBSQAQwRbuTz14Hr/dynQx3fcFd1qBSB8j
         KKancvYE/5/oJ1Nn0OmK0X9rknhMAYZFuitGv6bP2IHL/Dz9SdZWhaU40bfFVc9okJgX
         u0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312326; x=1794917126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5T5peH0PUnCrtzemSjuLVp2+YwXJuyEpiqwvId8VNA=;
        b=pYVLy9OHWsqpqlISBndOq+qyzAavzXihz275E+AKGVhpGeAS8yR0bDcszJLLTDMm2e
         LaFEz96K7tMzLinexHF5YYSbT5eFYjQht8X3f7VBsv0afzNKBlfBQAtJsZTVKRfHWl1m
         Ir6KNHHmgOGDZS1c9shY2HRnbrhasFL1c/8QVFHzy7Bh35cCJQmSpQ493WDdzN0RIinv
         ubWiLR40aqZp0SS7CEV3skMjJu7BEtnarH9IpHaxbpVyVPlhJjdkFsxKf+Al5fy3mbbp
         SFy0lRpi52EVq7v6bw3XOLEtYgJMEzHAC7BumHCwQzJp7HIRmXp8nqqw/6OCnQjxjaX/
         Nrzg==
X-Forwarded-Encrypted: i=1; AL+hErEufMzflbUXB758V7f/ogRdsyYZYYydyIAmlg/x3GXh8QltD1jD4ZXamjhW0ii0OYSDoAfjtW3zmrJkteGi1pTiyQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/PMd9HH0xQKQB7cSHxAPB8L8AQQfEjATu64EPcBnPHjWhuBVYQ
	Dw4xBj+zUwQXk1wCKV7uKMjLUvksD9C9iRRn5mLORJmGappAa3aQOCQY
X-Gm-Gg: AYBFou2Rd4sWV67Vvacl+jyrEbkiDAVjQoHWwnqQL+rwHGLi9S4PWBTmX2AcpFoDVNh
	Qfnqa/FZdzuvBxIaufstm3VN1I7h3Ak1qBU2PQcapnQMM4F2egC3Eb8MtnQksyGXHxVfh/l0MM6
	Fsy2ALLYKyfIknwB+gM4nH1y3HcL8iT9KlIEMPIUSIFQzOttSVTMzzWlYHeQTvOzSNT2NGrxf7A
	VqUGFxotP0GIF26NHH+OWD31e1QF4eXd+SuE0NDSfhiYfYCjTuqccd4boeaCGq6DN147FRv7fQn
	ipXSCgWUgHGvasiaXLelvdwsF685dJMQx5wy7p9MK78JxQX336ndYPmkNhFG3LwylnPYF3hMBE+
	Q1VALDPwZbs9O1R0WM/vElvMGQI6PyaWqr+xT2JaA6IA7uejo5RfgV6+SE89j3cLL0aLNTfGQex
	RcBxUUFCp/MfIsUg4Y4tFeSM/+6Ha6UH/TxdQFSUw0dNp69F69KPJvzLI27UhiV5J/gEivDeElU
	JxjJrU0kfi+UG6I9EWlhj/gkCjqoeZ8tMEMlSIldNbgtT/ttYfmIrFM4igM40gszSBu16iE2Gcw
	kvrO5annMJd0tTdETK0k+RwwB/tai1qOfm9A2/P9XOFKQxRLm5B34Ac=
X-Received: by 2002:a05:6512:1302:b0:5c0:4e3:a416 with SMTP id 2adb3069b0e04-5c156e375a3mr617826e87.1.1794312326336;
        Tue, 10 Nov 2026 04:05:26 -0800 (PST)
Received: from [10.127.122.226] ([5.195.0.150])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c159702ae0sm240512e87.20.2026.11.10.04.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:05:25 -0800 (PST)
Message-ID: <91a4fdf2-638c-442b-be29-59e05c8ba396@gmail.com>
Date: Tue, 10 Nov 2026 16:05:22 +0400
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix HS phy init count imbalance on
 Exynos2200
To: Soheyb <soheyb_boulaa@proton.me>, Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261109221522.2796426-1-soheyb_boulaa@proton.me>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20261109221522.2796426-1-soheyb_boulaa@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/26 02:15, Soheyb wrote:
> exynos2200_usbdrd_utmi_init() calls phy_init() on the high-speed phy,
> but exynos2200_usbdrd_phy_exit() never calls phy_exit() on it. The init
> count of the high-speed phy therefore never drops back to zero: after
> the first init, every later phy_init() of it returns early, and its
> clocks and supplies stay enabled across an exit of the UTMI phy.
>
> When the high-speed phy loses power while the controller is suspended,
> it is thus not set up again on resume, and the DWC3 core soft reset
> times out:
>
>    dwc3 11210000.usb: DWC3 controller soft reset failed
>
> Exit the high-speed phy when the UTMI phy exits, first, in the reverse
> order of the init.
>
> Fixes: cc52a697f87e ("phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Soheyb <soheyb_boulaa@proton.me>
> ---
> Tested on a Google Pixel 9 (Tensor G4) with an out-of-tree port that
> uses the Exynos2200 phy ops and powers the USB block off in system
> sleep: without this change the soft reset failed on the first resume;
> with it, USB came back after each of two system sleeps. Not tested on
> Exynos2200 hardware.
>
>   drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 087d552..0bee928 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1486,6 +1486,13 @@ static int exynos2200_usbdrd_phy_exit(struct phy *phy)
>   	u32 reg;
>   	int ret;
>   
> +	/*
> +	 * The UTMI init initializes the high-speed phy; exit it in turn, so
> +	 * that the next init sets it up again after it lost power.
> +	 */

I think the function is pretty self-explanatory, so could drop the
comment. Otherwise looks good to me, nice catch!

Acked-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Best regards,
Ivaylo

> +	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
> +		phy_exit(phy_drd->hs_phy);
> +
>   	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
>   	if (ret)
>   		return ret;

