Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1048031327F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 May 2026 23:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778196891; cv=none; b=tb7IXpF6w5YMFPaCvP9a9UjOJQrXu6PXlRrEwjraLiMhqUoG8B5j0ZH8nDIaFE0B0E/k3SNPQRfaL8fBiv97J7vJfuvs7FhpTlmiUexwiC5IINohjDiKRA60DexA9R15gXHxH5xGaDxR+e2KdE3+f1GtckRm8b2MwVbLJXqXIHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778196891; c=relaxed/simple;
	bh=U0seoVi4n3qqjK+J09RdgSIJmaaFquCQiKFxG++i0kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6TxFOQT7Cg4lhPQN5M/hdg7YahEy6lekqbOv8xXeCn0Y2+OzfNhpz4cl1JvIxQJFZusrO/k5IIBh7hZhDhvBok1WvljrL6hI8z3wnBLWIdYgedDlnHleiZZ1cLuNfe6TTHHWFi8bXw0pXenClOXJnMQkXbtW4Ctk8Lw18m7xhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GSeW8c2k; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GTWkKz2I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GSeW8c2k";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GTWkKz2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778196888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qSM6UscZWrZrRnJYPP1LWeuyeD/23NQG6vtPlp735gM=;
	b=GSeW8c2kkNbn12j/3E9+NV13pGDvhH6WA8QSpvK1UFqoMld4uyBsJOw2xAM8bsM4WVTSwj
	ni6rxEBGSIOMDJElAq3uSA30A0nsfykmNVlNFq/mHlBAiArj0auytUSJ8PUSifEqr5kygj
	aErXFr0JPG2DEzd4HeiYVGTtVN6LW64=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-3KgP7zRLMB6QgQ0C5PsA_g-1; Thu, 07 May 2026 19:34:47 -0400
X-MC-Unique: 3KgP7zRLMB6QgQ0C5PsA_g-1
X-Mimecast-MFC-AGG-ID: 3KgP7zRLMB6QgQ0C5PsA_g_1778196887
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8e8c47a3so33756781cf.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 May 2026 16:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778196887; x=1778801687; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSM6UscZWrZrRnJYPP1LWeuyeD/23NQG6vtPlp735gM=;
        b=GTWkKz2I+WHWPQrRB/BNFRvlUfK2ZLfquaTXRdbCRIhmMHDdHE5yyHOV89iT8EbJmD
         cgqFIlfRJFaI17AUrf6Rd5T/VClEMPfR0JwFvemtDTNvVxuaeVGQvNo3emolZJgTpUJH
         Y1l84faJ41DkGiypIQTNSC5C9VQ9BjNDtCYFzYrxlAqijH/lY7wPy9Q8Gu2v41Co7jjG
         jpF1n+PcifxRhJ10mP7HdSvxMIMOrcVe3DxiTy6oNOWqAcB9IDiZPC2bEa9z1gOW+A1A
         o/nEvCd9hH9KyIv1A0bAGVT8DKHzLpnQgWn4H/6IUUsDgmNbPcFzTnS4nq4ULX9v7w0+
         k2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778196887; x=1778801687;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qSM6UscZWrZrRnJYPP1LWeuyeD/23NQG6vtPlp735gM=;
        b=NEMtCXz2vGGIw7kzbxQO5PpeMfI1HZ3spd56femsbZdc530vtSmV2OpEl6HSkQtids
         V5CtKGRKKoFusuDPawObNPCzCVXVeyxlRH/9fxXHsGAuE0N8TK/HQ6lvwPnPS7F9QRJ1
         JLY8eBIbvyKCCPe+J6j7yWga5uuzc7XVzp0Swg+0gTB8q6hmEOfVlFp7ygHNQSUeTzNT
         4P8qUf4PUXuxsNP4jyGDAUZn5IWkLQeTdILYb3/LeiiQZMl4pGZNFNUqiczAlH/L00tr
         iRrdhxi1j3+f4oerTBB/Q2xAkNH3TTLJwFu4z5V3JowBomlsYrK2Bp9/xuXcSdCIghAa
         3/Gg==
X-Forwarded-Encrypted: i=1; AFNElJ9Gx3qLKzyxU1b3MhiKCQ1VrAj/cDNTgdhIzSsXdG2dmz/ijnXNkzp7OArleU2OaUnaJ0LKT+IOaF+17+zFVYXlAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFQUggEYyyjabDnVHNmRfAqx/D54zqmo5+qPx/VGnSGZ3eAQqc
	CWatPMugKSjueraD4qrBeXBiJuTrdnrt4ZCwkaj9/0+a82yjnPAJd4G9n1y2qffEuyRsweC0dIL
	aXRbUZ8X/uvmec/Vr1X433ALOu2FnuggO/fdX1LeAOivaBNNPJZw7HCdfB4y+pMpU74DjEJm0
X-Gm-Gg: AeBDieuIypnAQviaAGNHHHBU5s1n8CcAXaT2LWZfDEDPmb0lSQ3fdk0DU5q5Uh+XCbu
	eDdAeggkUPPBhpMmvzmnRJhlwef/DWQHNDfdQcmX257noSchv+ULEbLhNvTATxm641Td7wU2ZSa
	gS6svaNNzELmqkyOVNKlC8l+wDYKLnK9aEA82e6Py9FoAdqSonQuAPkjLJ3Wh0d22PT9I0zg9I0
	Tt5WSti53TYmwXm9kziHwS2Exp5w0XBBxthBh5Ew/P89xzs/aZBhe7wgTvJKok0apRFR/fe5plF
	wuFw1X9VahUG1gJaoRYjcLm5wUq+hVqJNoTPYmt/SpyEfQ2s2WzB6pyAdpXjXCnxS1REjyTabB6
	/xHSH/vfCaeLuvNZcjK4Sq23iYU00fEJkjRJ6GJQmdYy3glKDnDetAcY3
X-Received: by 2002:a05:622a:a14:b0:50d:aae1:7070 with SMTP id d75a77b69052e-51461fb1ad5mr157914871cf.48.1778196887223;
        Thu, 07 May 2026 16:34:47 -0700 (PDT)
X-Received: by 2002:a05:622a:a14:b0:50d:aae1:7070 with SMTP id d75a77b69052e-51461fb1ad5mr157914391cf.48.1778196886751;
        Thu, 07 May 2026 16:34:46 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e83dd35sm1697181cf.29.2026.05.07.16.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 16:34:45 -0700 (PDT)
Date: Thu, 7 May 2026 19:34:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"open list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv2 1/3] clk: samsung: use kzalloc_flex
Message-ID: <af0hkVm0TQPTAiPd@redhat.com>
References: <20260506233833.178357-1-rosenp@gmail.com>
 <20260506233833.178357-2-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506233833.178357-2-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Rosen,

On Wed, May 06, 2026 at 04:38:31PM -0700, Rosen Penev wrote:
> Simplify allocation by using kzalloc_flex with a flexible array member
> to combine allocations. samsung_clk_alloc_reg_dump is no longer needed
> for this struct but is needed elsewhere.
> 
> Add __counted_by for extra runtime analysis. Move counting variable
> assignment after kzalloc_flex which does the same with GCC 15 and above.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/samsung/clk.c | 11 ++++++-----
>  drivers/clk/samsung/clk.h |  2 +-
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 91e5cdbc79d7..2895c77534ae 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -430,21 +430,22 @@ void samsung_clk_extended_sleep_init(void __iomem *reg_base,
>  			unsigned long nr_rsuspend)
>  {
>  	struct samsung_clock_reg_cache *reg_cache;
> +	int i;
>  
> -	reg_cache = kzalloc_obj(struct samsung_clock_reg_cache);
> +	reg_cache = kzalloc_flex(*reg_cache, rdump, nr_rdump);
>  	if (!reg_cache)
>  		panic("could not allocate register reg_cache.\n");
> -	reg_cache->rdump = samsung_clk_alloc_reg_dump(rdump, nr_rdump);

samsung_clk_alloc_reg_dump() is used in three other places. Is it
possible to convert those 3 places in a similar fashion so that this
function can be dropped?

>  
> -	if (!reg_cache->rdump)
> -		panic("could not allocate register dump storage.\n");
> +	reg_cache->rd_num = nr_rdump;
> +
> +	for (i = 0; i < nr_rdump; ++i)
> +		reg_cache->rdump[i].offset = rdump[i];
>  
>  	if (list_empty(&clock_reg_cache_list))
>  		register_syscore(&samsung_clk_syscore);
>  
>  	reg_cache->reg_base = reg_base;
>  	reg_cache->sysreg = sysreg;
> -	reg_cache->rd_num = nr_rdump;
>  	reg_cache->rsuspend = rsuspend;
>  	reg_cache->rsuspend_num = nr_rsuspend;
>  	list_add_tail(&reg_cache->node, &clock_reg_cache_list);
> diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
> index b1192ca03db5..098f27a6290d 100644
> --- a/drivers/clk/samsung/clk.h
> +++ b/drivers/clk/samsung/clk.h
> @@ -324,10 +324,10 @@ struct samsung_clock_reg_cache {
>  	struct list_head node;
>  	void __iomem *reg_base;
>  	struct regmap *sysreg;
> -	struct samsung_clk_reg_dump *rdump;
>  	unsigned int rd_num;
>  	const struct samsung_clk_reg_dump *rsuspend;
>  	unsigned int rsuspend_num;
> +	struct samsung_clk_reg_dump rdump[] __counted_by(rd_num);

Personally I think the rd_num should be above rdump so that they are
together.

Brian

