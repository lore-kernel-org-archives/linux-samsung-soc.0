Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6E5245032
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Feb 2025 10:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391922; cv=none; b=G2LwVpJCcEF4vuT+oj6MKhd44zpcWXJmbFZiLT3zL6vEsc4e3YVX254e9+rXjb3SQmvRkse5wAUWJRRhlUffpMuowxPxtyzgGpw0hfeeDGKZwYbGNtiZyiWBNMS4BJy5I0MfeKDbjY5v2QLW71t3niDwThDyI6cU6s7+lODeGTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391922; c=relaxed/simple;
	bh=fKXxxp8mVUx99PTCuJ9lTvEvjgM846KcN6TPo4R/fBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbHrMgizASGUYe4NFt6Qr16Te//41WNtelcyB8whb/hfWXr2hXc+u51tQxG6NVD8+GYX67Xeq62T6zTB7uWG40FP/yatPg2KnuIT3wKJwo516EZznfa2yHWp8mPNM6IGe4qABAso2FxGrEQEmvf/25qdl6k/pLEnaFZ4iRLurRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c30knrbo; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c30knrbo"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e050b1491eso9081489a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Feb 2025 02:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740391918; x=1740996718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CU8WACFROSgTLo9Ox03v99I3iVcvKceQqegZUMUwxvk=;
        b=c30knrbovl3LBy7d2vKl26KV58/0RgFZW4EkY+B1DWzfBl7ME2Edr/dHTXtYikfdxK
         yzWpg/oBlkywJGY5kaSLpi05rGfM5Q7zFslmflLb14NcoYDkYyno72qm2qZc5OPnhS8P
         qgNXKXwC5Yny/w8CYqdx+zWzUh92DPQHJOhktShNgeaqj+CtYc7okbURNPR9kWy6YEVa
         Qr5qUyZkN1X24XCGhvhSo6gcGk5kqawU+3TI2iVs0FXtrAEY6t1/fPugH0DQtLW3xIYd
         /3kdrWCifI12DGZpTuRYZJuNavfygRQlCuJazK4L4gh7GIT20Hz83tJQRmSUbLsJ0m9d
         j5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740391918; x=1740996718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU8WACFROSgTLo9Ox03v99I3iVcvKceQqegZUMUwxvk=;
        b=PVAVnoc8HsXt+L8B09h8Es9ISpTZuqH6DTmT1YKFiSxA1mdq/sJ2MQfmn1qRn4LGN2
         s57+3g2C1AuqbRRTbsnPvGUmq8x4T7F0Vghpokh26EzjbCIvIwSoyWlfxSJpHw4QHJ9l
         SdsnozxHNmliJf7zNHbo4sthP7k2jgRZU1p597j+bpYZ6D0ecD9wuJWoYg2OSCu1djqt
         mgmWA/bSb+W6vY9DVunsiR1gVx67Z2AiV5LWfmUgSABzMrkOr+AmbLKwA+AVOSnyOLye
         4eiXGZuMMeT5Ise/pTJfrmFwRDQDvRoxyyu6Xq+ikc71Wlu9ON1EBvhKtf8ay52djycF
         +DqA==
X-Forwarded-Encrypted: i=1; AJvYcCUp6XWXikRF2W0UB1F0hBSbyUa4W/QySpchBFsOeOB+mAMObY1+Z/CZOTj0NdumrB5/he6XHM4bc144ml6tOwpCiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2rM6e7QjY1x4/WEZ0YTvJgPOuOPeAjzCrkxFQ/Xeeev8cAvEq
	M6GfQg+GhcGVzXHVO9g7zJIervkZYI/Ot4SVG2ay0Io3V+iAwhMQ6CrHpKs7r+A=
X-Gm-Gg: ASbGncvgVL4AEBUMemfp+CnYal8fQUy4y0cogbDGULK5bTZW/oGayGCAg5X3RUNR/jZ
	e4iysP+gSry/xRD0bONxv09tj4aeLvxA0jl5BTJChiLVMob3cH9M6pm445AHrZ1T5drMvwbvzIa
	m/TngvVJo1DJRIRqiFypDfBXG5vgU6T27qxnUj6Q6dtaORTlL8vgCONZxP4s+IIUksDLUv9MrwE
	jc2NpTa4kIRooWgjnX74qNPu3Pkwp/gnsv4L5TBGZ5IYOaHCgjD6lrbgTAGF1bpDtx/ZDCxRuPE
	nqOOxgVNlD5w6aaZxr14pEk=
X-Google-Smtp-Source: AGHT+IFBYGv39ku/WXgGCB6eZU2Nhkmme9NrVcRsypJZXftUwbVR6qfXWzvvkzePYp6cqUbaZIeE6g==
X-Received: by 2002:a05:6402:524b:b0:5de:50b4:b71f with SMTP id 4fb4d7f45d1cf-5e0a12baa86mr13103989a12.12.1740391918073;
        Mon, 24 Feb 2025 02:11:58 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece2709b4sm17963793a12.57.2025.02.24.02.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:11:56 -0800 (PST)
Date: Mon, 24 Feb 2025 12:11:55 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
Message-ID: <Z7xF66TctF2wuoGj@linaro.org>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>

On 25-02-23 14:22:24, Ivaylo Ivanov wrote:
> Some platforms initialize their eUSB2 to USB repeater in the previous
> stage bootloader and leave it in a working state for linux. Make the
> repeater optional in order to allow for reusing that state until
> proper repeater drivers are introduced.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index 4e5914a76..dcc69c00a 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -461,7 +461,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, ret,
>  				     "failed to get regulator supplies\n");
>  
> -	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
> +	phy->repeater = devm_of_phy_optional_get(dev, np, 0);

Maybe make it optional based on compatible or something?

>  	if (IS_ERR(phy->repeater))
>  		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>  				     "failed to get repeater\n");
> -- 
> 2.43.0
> 
