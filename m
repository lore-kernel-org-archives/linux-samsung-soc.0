Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DCB6A00B
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Apr 2024 20:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712694663; cv=none; b=pRPoT1VEReFXeKKNlBgzecI7JVwHAlZpPlNvoQaZkLR0ZtyE+LmRP6WLHN7xiu+MJHCQz6IMzgBBtWjq2Zih0jBB3/GEN/3u9BB/WSiPe1pSsr5ggn2PuuAA2zXSHX4u1+QySHy6lCrlTSEw72f2vk+peRiCE0PIkT9RhsFHaTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712694663; c=relaxed/simple;
	bh=Yn5lQMyWsSX4w51FOqsIFz6BBmT05CJopuX+ysL6CcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brBPtJb3rSpVyo/zgvAgXFJ4R8WO3M1gmSyBaAkxuzBagtEmnZ7JJKU8KdUeiAUBsWjgEy3zJO3IqNgzf509xDd2iH52ryTtiDvFSh2W2EsvPN9XdQfu/VHmmfOqiNNK0QLKDVmRgV7oirSFNd+tOvoSprCI37+whoL0ly1iP3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CTAanvus; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CTAanvus"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e062f3a47bso7055ad.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2024 13:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712694661; x=1713299461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z81f+s7l+/sD/O4M1th1Ei9VKKDjA495zju8Z/WH8ss=;
        b=CTAanvusFvHOPgm+qgLtSzS73eBnQKRscb8pG7Nps+kY5nirbrvAxDDodpmvIehonU
         bhR4vhb8zR2dRPI207uFf48pf/RUKMZdUKZHEK2eCdSDchS8EHZ+F/lb0dFye1wWuSrL
         iwcbPL0uAKL8PK5R3C6EVFiMMUrpBRVOVzWkDXwV9Rci2Bhf8Bu+bgUzN6DPnaeek0rC
         7qzQ0blMTVoGIcbjFDGITI6wFoLKfpxKrEQ2lTcGcRm5dPEjU7Rs+chaNDZgeEUyBXt3
         hkMPTtHBlBgGZ8ygPLpGGbYrrYMeclIbA9F8hF37XHmQjrNYMf2BumMShIXRITaXG48w
         YPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712694661; x=1713299461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z81f+s7l+/sD/O4M1th1Ei9VKKDjA495zju8Z/WH8ss=;
        b=kBj0LuyZipwu7OVsCSBWbbTwzRqErTJEmL0NlixjVa23V+hXw+1Gx5vcq+koZbYx4T
         pr/D4iQ4nqkgQ6o4tdVjr56uaDVC0XOymY38+n9cOPkfBZH57Zu6cb8aPWSJz704VdPL
         J3mV2A09+XzZI9j0TinHP+N+SWyk5rt2v1ZA7POI3n5jsdBcR62/U91lgJFvxrPucPzm
         s5h/1+oGXUWECtP344BRy/eEIaqCmZw3C6h8QTxUHgVdRKtOil19BRJzFy2Kd/tD2jpl
         ZzQrpJbmMZTxFPAvIsXeYW+3wq51sE9sh2ihRiKxhSxtI2YYrfCKVysjGQIY62JLHBjt
         47+A==
X-Forwarded-Encrypted: i=1; AJvYcCW+YGenA8gtHVZRYgRKc9I6HDrhxyPCXaBcYfguGgyCRHQ06OZeBwBEkvjw24Xw6qYOA+ED8Q06K+rqdyA9GUJ48fdQZmlsCZOJwdieWQ8pYg8=
X-Gm-Message-State: AOJu0YwugJgXdSFTutsUKHPlekPp7WRH9/CGyV02vH9gyKb1AlNquc+k
	Z7LEM1WcDNswQOnM7dPMm4SFS8Cm9cfMg3I762JrPHYBjbzlF91IkZ1EdGiUSw==
X-Google-Smtp-Source: AGHT+IGofJ0FRNLk0LpXknrDyp7g83W59LBbnXT2y0rqsdR+bsPBjGeybgw55IXdE9IT7Wgz9305lQ==
X-Received: by 2002:a17:902:ec87:b0:1e2:a5ce:8dd0 with SMTP id x7-20020a170902ec8700b001e2a5ce8dd0mr53730plg.10.1712694660951;
        Tue, 09 Apr 2024 13:31:00 -0700 (PDT)
Received: from google.com (201.215.168.34.bc.googleusercontent.com. [34.168.215.201])
        by smtp.gmail.com with ESMTPSA id u21-20020aa78495000000b006e580678dfbsm8698540pfn.193.2024.04.09.13.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 13:31:00 -0700 (PDT)
Date: Tue, 9 Apr 2024 13:30:57 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	kishon@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
	bvanassche@acm.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com,
	chanho61.park@samsung.com, ebiggers@kernel.org,
	linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, saravanak@google.com
Subject: Re: [PATCH 12/17] scsi: ufs: host: ufs-exynos: Add
 EXYNOS_UFS_OPT_UFSPR_SECURE option
Message-ID: <ZhWlgcTJ-4KeQqmP@google.com>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
 <20240404122559.898930-13-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404122559.898930-13-peter.griffin@linaro.org>

On 04/04/2024, Peter Griffin wrote:
> This option is intended to be set on platforms whose ufspr
> registers are only accessible via smc call (such as gs101).
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Tested-by: Will McVicker <willmcvicker@google.com>

I tested this patch series on a Pixel 6 device. I was able to successfully
mount two of the Android ext4 partitions -- efs and metadata.

  root@google-gs:~# mount | grep /dev/sda
  /dev/sda5 on /mnt/efs type ext4 (rw,relatime)
  /dev/sda8 on /mnt/metadata type ext4 (rw,relatime)

Regards,
Will
