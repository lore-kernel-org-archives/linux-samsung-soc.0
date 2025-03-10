Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41E5224AEB
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Mar 2025 09:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741598771; cv=none; b=D1HgGESgsIBQ6I2acLkf2R8UcDJBfinaQqMG54E61FqFkDzOqkSKvhTixhe/z2xYPOyoYDa8hbzuphgAsfOHFqPsO3S8RQEvUl8fPhvYR85JMc6LA5LRcs1vnib9SETjfJZ6CUa7UPt3xqSMjWPN4m76WG+JbxnDryeK86ZSI+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741598771; c=relaxed/simple;
	bh=aOyHK5kOgLtc2TGKL7MhAhtvR0ch2AVZcT+44SP+rpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gK8evQmmt/UzA1aev0AKoWR30PBiX/rTmIpaOzDz7aPpsedISZpJbm1fzgT2YR9f8GPS+4JOwnn2FxokmkFpPTZxPa3fg1GfJp375DY0HxwLvqZmYdNjC4deEeE7KEo9IJaLD6PCazsMimQNkjkiVhhj6g9H5DMHN2W8jHE7mgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vNSh+uea; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vNSh+uea"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1867974f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Mar 2025 02:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741598768; x=1742203568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGB61au9EEk11/47YvWNrV6VgtI7CN4so6SIXkNbToE=;
        b=vNSh+ueadt3j55ppcGnm2PbRZq1y4mmsm91hPcF0iN+KHYykecpZGHReSoJ9ymSBax
         w9oNp45hfukVgzcSjmG452fS+3IteclwW9Kzxyaj1XTJXb4Wi5pm+bfLWPvkGjYbvePM
         /gq1jvanDxGk0edHaNSTSZ64An2GnfW8hYuDC46SOa1fXBei2sP7ZybYXj3/ZiFmJ2L/
         28jQUd1GCwt6gFVNOvUIZl9uQBDDzK97K1l8NHQueMCbLym5VYNWeG0nmjaTeIdbWCwJ
         u6oW36h91ekrFrXiHh5PA4hERWIQaELbK90chwRFqnuSh8uSRAIT4GTw2JeLFpJnzK3j
         9M+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741598768; x=1742203568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGB61au9EEk11/47YvWNrV6VgtI7CN4so6SIXkNbToE=;
        b=FfAGt4JPWvgMF6oslmB79IuMUMaIl9pB12rrC8HCdchQUb6UJxA4mXoSZ06yNs/TiI
         siPu93FXyXtAJ4dX3Ywz6zki8jZETScbiHDeeTx3WXhOfk1WcuMGsa9wogHIw5pDTwLf
         crLx0rkmbLPnFOcYrC/MSFNouPZFcb2xSqWZWvtKPlAQcrgCLJd0PCgeyM+i/taxFBaV
         KGx4APoyAz6HuACez5Pjd2AQSbykCbAw8guWfUVmQD/SgKNJLE2IhhbZiSPL+1ejz5Dr
         Gkm7Sde6lRBItqI1pP/CBjbSWPvgzNrFmKAE8gTgalWoajmCWyWXefht6C8cBWqs0GkZ
         HJHg==
X-Forwarded-Encrypted: i=1; AJvYcCWVvnBA+xhOnbDvvwksWh8CiCpAa+q43544B6r+7Yba+xrT/sLoSCBedk3mhxYT8G9ITcVH7ymeUoxCu7uaY+lqjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza/aoYLiZmeifDMW4nYaraseD5bWB1imEXwMuuGClsLkUetvy+
	o4AFHMG13Gh38ptwYJI3fDdKJvnujdu/GHzuWg2gXbDhQ+5pVpTDKZdfnFgY2Bg=
X-Gm-Gg: ASbGncsFx77C5KXQQZRlxaTileTmtueKzI2SHru2d39P24FjfLW442mqGE225V/i6Zu
	9YkZMCjrntdVFc2Uek32nXIsKUC6X8Z8ulrfmFnoHOREPtQkdGsbl4gUc9ec57tK019EjMPsU88
	geY87lOOB/nusluwKWVdZARkACYt+AXAr9W88gAVmIZ2/s8/g8KwQyBygD3/3tj6JW8MlqNmnUN
	+PGBbYP32cAu9BaL5X0pC9n5nh+86PvS304M1pnD2hPEBPKBKdoaPlHwyMTVP9wnDkIZr0/afBe
	RT1C1D8j1yYJv3hPfCEfkhNT3g3ZDRURUIr6cZ+Cx48jsy17ywgcpg==
X-Google-Smtp-Source: AGHT+IHryabbGhXkC9Vb4Dl3n+sRYRJGNrbBaByC+g/CDOqA7aTuvCvu/OJK9Tr3atCxJvZm8QWu/g==
X-Received: by 2002:a5d:47c1:0:b0:390:f6aa:4e77 with SMTP id ffacd0b85a97d-39132d3a8f5mr8462588f8f.15.1741598768044;
        Mon, 10 Mar 2025 02:26:08 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e2f39sm14097826f8f.80.2025.03.10.02.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 02:26:07 -0700 (PDT)
Message-ID: <282d3519-8ea6-4a42-97e2-d4cb9ad80c96@linaro.org>
Date: Mon, 10 Mar 2025 09:26:06 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: Remove unneeded semicolon
To: Chen Ni <nichen@iscas.ac.cn>, jassisinghbrar@gmail.com, krzk@kernel.org,
 alim.akhtar@samsung.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250310082628.845544-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250310082628.845544-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/10/25 8:26 AM, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

thanks, Chen!

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
> index 20049f0ec5ff..2320649bf60c 100644
> --- a/drivers/mailbox/exynos-mailbox.c
> +++ b/drivers/mailbox/exynos-mailbox.c
> @@ -57,7 +57,7 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>  	if (msg->chan_type != EXYNOS_MBOX_CHAN_TYPE_DOORBELL) {
>  		dev_err(dev, "Unsupported channel type [%d]\n", msg->chan_type);
>  		return -EINVAL;
> -	};
> +	}
>  
>  	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
>  

