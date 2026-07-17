Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB0F3E022E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jul 2026 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300284; cv=none; b=KWS2SODLm6CE8vz3xOj3pbLXoRND1Pws5Sh2s/MT20Ca4rJ9LftpK2jJcRw+wDtrTAOGJE0jrr7WF+4wT4ZItRK/ORlcDOTdu4neE+KNPCn9qgLf6Fp3Y39AfeD2Lkx271J4h/HYIgw3TjhvLAFlOteW5DnxyipuhPrjYlLu2d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300284; c=relaxed/simple;
	bh=4wdOZhbUC2lLYILq3FBks2qdDTOkHSWGe3c+v7X4vWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBZyVRqynkG+V/y+MrP4nbZaeVNbrH2KLhBH08r7Hm13nK9ecgmurAZU0mhPa+ptKyP8IEp19vZD4wLyvmT08BY0tdFCoiMPQqLf8cGZEc2aEjCpLUyVVAGZ4xQoidfrNj/GT4SQq3PecVVQlSDNMcfwIWRlE7euhLQQMpJVhx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vlaxr/16; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mJw2bHeC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vlaxr/16";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mJw2bHeC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784300280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0A8BB0sLhDX2GMrSItJ7YX8/WeoW4XqQhe8oDz08gM=;
	b=Vlaxr/166gpSToaNgm/yI5swax+spv3scAC+bxxd84JW7Awxy+O1lCjS6D+mGnSZS+3vj3
	4EnJu1gNB0uRUd1MMDQC+D0ZVS06HW/kcytAZtwF29nxiacB5rPd8KcQGAdVxWLqIZQ0Q8
	ygQ5utOCvSn+NEryQEOGD1+IXSbYfcs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-TvcL9zodNB6ikkUO8dk5EA-1; Fri, 17 Jul 2026 10:57:59 -0400
X-MC-Unique: TvcL9zodNB6ikkUO8dk5EA-1
X-Mimecast-MFC-AGG-ID: TvcL9zodNB6ikkUO8dk5EA_1784300279
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-904dac0f77fso139665986d6.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jul 2026 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784300279; x=1784905079; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0A8BB0sLhDX2GMrSItJ7YX8/WeoW4XqQhe8oDz08gM=;
        b=mJw2bHeCDqm21LdE8wOjY/r5Xzj/hYKcF8qsuLyWXt8N1hsjEnEIYx/6xxPG2Rrlju
         ovafdSslp7eLt+jOMdJ2N6Oxh+a65BKjcuPTTp9L/6CEGQDoPulqeCtH1rNPiS5mVFMR
         jop8zFeaBtQc0c2XPvXNv+pBESIQdjrbRjtKNUlSdN0QnX/3cIX8pQ18hk8gMzcFns8R
         MwtjZ3uABWuNFy6SSKYRnBXDDMSCup5hsxpQB/fTupWZ/48nackul+WqiRWsj45kL9Pr
         P2GTd43k6yR/3Mf023E4lHegpim0xE8Uq1fN4NbDKjOjktAR3dw0a2Um+CSdGW58s+Pq
         nMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300279; x=1784905079;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z0A8BB0sLhDX2GMrSItJ7YX8/WeoW4XqQhe8oDz08gM=;
        b=cT3DnGCqLzqD+0X+dmPu4UpM9DnPbumBlb+1upKH44ZfuD/L/wDbDQF15MBXJCHcV4
         u5AYxPigYsFTJMTQgLbQO8ntGLgiqwOALsY2vG4qoLRlyH70AN+8fENSWC6mmWCLings
         VCog3vKNP9z68Li6SX6EoCgHOVdfbi+OBjBLQDQsHBSmlGkLrTh3vn8xifdrDAiaWiua
         Ly/ikwBa5WcoakaMLQyqCmku3lSylJYxDjvfkMaN3X+cIeiiP5vyYVzi2rAT2HCA5ecp
         /sX0eVOHBcqJW9RYryEER2FuhksbyF1m250siFnagFVcZMr7M/9oWovBC6RKDaL7sC9c
         hJAw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/fClZqMUstBlIf35tTH7EftRUaPzbMViAEb+tOSw2kDMpkUKwtunMrHygHoxEV1Cm/ueFq1hHRE+yl8mBv7A6aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUPvsOjKfJ+lAJ6lSxRenfMQkUjl6P0Cf2z1UhF8tk+COHIIpn
	cm3BbFAKhglwLGft5zN6beixMTyNIFGYsRL5OWrLOWSMMETHSEcHny8RC6ZrfD0c3coTdz1wtZT
	VktJWbBSnIGuI7nE60LMcqeZG/EGIhHHgEabqM07VMh/f7+ZeTEFyp4+YfUauvGd9N6l3hYVo
X-Gm-Gg: AfdE7cksKl7vX1rPP93qKktd0zN5d1QCBl581SSS3NP9p4HvLtWsTRkDfKQbTDA3iaY
	uEq3nWFw8sVvlmXOfmoZ4PmavJM6isXTq+BjbNIAI+1UKqrNfsed3FJBIBCZP3AiSgTFRF9rZjj
	ZYT2sQMeioeUD8ohPuci6Q9Oi1l39tC2Oh+9lB4Nb6xwDisoIjRTrmQlyYYYQLr+jjGy9S00Fgu
	qpeQSjpO1KoFaDdMQL1eeCnVZ1XSOf2XgpKfPU5P+bIgD2V1vnZLVNyJYGqmvq2Wl6VsLKipPqO
	vP0LwEaYUKhBKDBLk41JcxHDAEvEVwWWUz7P2Uiohm++jHBPmPuC3uzkMRr8s0aRaZ48DhwGOa7
	jao8J0BF0QS6S76aI9DY4vXdHWDBmFbjXH3g=
X-Received: by 2002:a05:622a:909:b0:51c:99b:d668 with SMTP id d75a77b69052e-5213e28f16dmr27727211cf.49.1784300278419;
        Fri, 17 Jul 2026 07:57:58 -0700 (PDT)
X-Received: by 2002:a05:622a:909:b0:51c:99b:d668 with SMTP id d75a77b69052e-5213e28f16dmr27726851cf.49.1784300277915;
        Fri, 17 Jul 2026 07:57:57 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214cbb5f83sm13707371cf.8.2026.07.17.07.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:57:56 -0700 (PDT)
Date: Fri, 17 Jul 2026 10:57:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v1] clk: Use named initializers for platform_device_id
 arrays
Message-ID: <alpC8l8qPFL955ZB@redhat.com>
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
 <aln6H4A2QTO9w3Rq@monoceros>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aln6H4A2QTO9w3Rq@monoceros>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Uwe,

On Fri, Jul 17, 2026 at 11:51:17AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> On Thu, May 28, 2026 at 12:29:38PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> > Named initializers are better readable and more robust to changes of the
> > struct definition. This robustness is relevant for a planned change to
> > struct platform_device_id replacing .driver_data by an anonymous union.
> > 
> > While touching these arrays unify spacing and usage of commas.
> > 
> > Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> 
> This patch still applies to next-20260716 and still is complete (i.e. no
> new clk drivers appeared that require this type of adaption).
> 
> The patch sits in my queue for quite a while now, got positive feedback
> only and already missed one merge window.
> 
> Do you still have it on your radar?

I sent Stephen a pull on June 29th for stuff that I felt was missed during
the last merge window and I included 4 of your patches in that pull:

https://lore.kernel.org/linux-clk/akLzCVzbMbUsgDda@redhat.com/T/#u

I haven't heard from Stephen yet. There's 2-3 other pulls waiting as
well.

Brian

