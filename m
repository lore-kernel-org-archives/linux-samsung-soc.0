Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459565;
	b=nPGWQR7acNHuTDEAWYFUzbFsT/lHy/xpSyPDaS53yq7JFLwG2dot83PZhqGvsxXdhFi6
	 UuuIL6TRvLO7EyxlpH978qyIotMwAHHSWF134RSNauY++2JfN/2vhjWkdD+ZnU38zHCEd
	 nFxSDoBQwC/UEHAdq486swdXfCz4p/kQ9ASCQ7QULpDowTkbjsFXogslhoQEeFYhIgebh
	 eCtxJ9ZbjiX+J9/4qxIh6xZksjqGUzdUd51AKz5w0CNu6V+xBFb3/J86aBZGB3OAH8rLt
	 chR3lWa89nM3VTlEMnxsTk1zX9zv0j7n2H8pfXpwLR2gDjO+wU2yI9wuBrAiwAUSuqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TDPMkG1SQgnWSwQUqpWJz4GemlxwNldPDN0SoLdOdWA=;
	b=JOXvVV95kHBgy0EHexkd7UmwFumY7mo/CMUecdQHl4lyVyiJW7hBdPzaX3TB9k5vizh4
	 kS3oyFmdZF6kBZE4iski0ZlToRCJLzgxT+mqeGvS6NHbMJ+GKc8QA6TvQSIfzwQcvY88s
	 eeQCojc2Otj3Bfi8OSYQqOEtlb/k8KDtssEFBERld9yN2m3ZaSOKddEwkCSsjvMUHOTba
	 CGdQC0tdZBzer54dnDBP9We2ycIE2AGHTuIOBUt2s/xZL0vYPvqb5hpblbb/WUcfzkK8N
	 qQK8rF5haGmMzifef8guaxiD9WmGgLINx3I9E0h7PXzUUawwRPzdY96sLX3UBGTwBRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dtUKGBhT;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4527B606A31A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 01:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4527B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dtUKGBhT
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso1328757a91.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2026 18:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792459564; x=1793064364; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TDPMkG1SQgnWSwQUqpWJz4GemlxwNldPDN0SoLdOdWA=;
        b=dtUKGBhTi4pj2sO++DHt5X+7Sx+F3pK5XAmnYA/olV3k80cy4IDnn+ykEnmQkRvSIG
         DhRDPrRav/PXW8OqhjimAI4udO+ElQn5Vhh8Q0NIgYrjvTr4cBcTieqRhlgGp5ACYGzZ
         rfsT/Mns7cRkdieikIXgem5Hr+dWNuv88t/hqtujOTRULVBaxmqBVW7aR1OVlbGo0CnA
         54dKgRbAm4CYiUYR45AjsbmZsYE9GQ+/HDlQruDkegX7lzvdJC/sRauGrm5I4LpZyFug
         xKTqtc5sJNY+z2UJAZrfRCOWLWx+bn/CVvWjNjfILZ54VNStNOzjj925t2tmMh6pZqg1
         JOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459564; x=1793064364;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TDPMkG1SQgnWSwQUqpWJz4GemlxwNldPDN0SoLdOdWA=;
        b=s1vLlR3zwbZgSn9WTf5VLDeLDsEVwCAATfc7d403b5Rm1Ax20o2TTsdZ4fyPpximQA
         XqsfiYDBFQHRR9Wp+YnVq+M/b8pI/xDzxt/OZp2PoNqmszTkWOzUFTWqf+Ci5jqPSFFm
         v8ge0AY1EGC/Lbd7BZ0WfgkYnI6tap6IgTb4aNaJvW0lGB+TulZ/Y07lqATG+W9+3XaS
         D+ZagC1wnva7Nu7wqbV/9oZysPESqTaLVG4q8c9LRTZlEclMilpaHLnDaUQmqYeh/u+s
         a8RFnCjGzYvdPDLsUbAnKIXhj854arUnWvO0AstxMYDpV2Z9b6/DDa0W/DJRa37qSrvQ
         PUAg==
X-Forwarded-Encrypted: i=1; AKwUvBxois2iTGSwl8OQPCYf67qtTvlshtfd2vvZS59IJIYAAn5cKgdsDIAaDFMjoUHDlDDqrJ7mPVAKxkDa/zo3KWzb2Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJMH3y9DtlZ7rr9FDjL04fv6DVu+VvysM5fZ9Euva3Qa7L/i06T
	GOCUE5Hfj3vOj80jpMJs5EyC1wHfLqD6uiO/+AkOcGLu7iPTfWsGudqh
X-Gm-Gg: AYBFou1/0hU9ykwshNJiLtFIXLixf4o2XUSi9NiTufjXV2omitAFIyXYVtgcWHODhVv
	TsUYCue2p27Joe6w3J151JgJIdS6qzUDlyB+zUjzRWvaFI2aG15kFhEjaM9r6WGONH3Hq4LU1/e
	Eox9CfvxQXfKocw8aUnmOdMY/+K29QTK3c+qFrQQ8R6Xl0UhbBMzXtW9mI+BYADPrCBJK6TMFUz
	cHocO9rJU6OX+BfIlPSMRl0XUKIRUZ+nPTZuq1jYpSe29hdbjgJzdiO4J/u5txY2HjwU+fM3qCj
	gc+otpdaUlBQ1jbItOfW9wvHVHpUp6z08gqT7am02Im1cmJzAP5Ay9chUTiA1w4YWdJI1GIKOty
	MyHNdIeoPldqRfCma6uc4UdMAqdtEtaFtBj5EUWJCMd+Se/PiAK33lqP89/akG8M4Kd3thAA3Zl
	UipR8ZbVwgzo8uz9qsAL45xmiEU4yT/4CdJvVx5VCbyp1YazU83YwADipsMShAeWTAtk08oGeoS
	OpolhnC5rESnnef8A7yKDSVU8OkfK3wvYKsGZj8LpLthSiZ7siN+lSZN+vt6KVPhuxVrw==
X-Received: by 2002:a17:90b:57c7:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3aceed9ff39mr7771161a91.29.1792459564582;
        Mon, 19 Oct 2026 18:26:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5df655b1sm1647321a91.17.2026.10.19.18.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:26:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:26:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	hajun.sung@samsung.com, wim@linux-watchdog.org
Subject: Re: [PATCH v3 2/2] watchdog: s3c2410_wdt: Add support for Exynos8855
 SoC
Message-ID: <38b3759c-b564-4826-bae3-5f0eda7ed20c@roeck-us.net>
References: <20261006161700.2185432-1-alim.akhtar@samsung.com>
 <CGME20261006155900epcas5p1b842116272ea9d75c815ebb11303cfa5@epcas5p1.samsung.com>
 <20261006161700.2185432-2-alim.akhtar@samsung.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006161700.2185432-2-alim.akhtar@samsung.com>

On Tue, Oct 06, 2026 at 09:47:00PM +0530, Alim Akhtar wrote:
> Watchdog IP on this SoC is similar to Exynos850/ExynosAutov{9/920}.
> This does not have CNT_EN_WDT bit in PMU and offset of RST_STAT is
> different then the previously support SoC.
> Reuse the offset as much as possible from already supported SoCs
> 
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

Applied.

This missed the start of the commit window, so queued for v7.5.
Sorry for the delay.

Guenter
