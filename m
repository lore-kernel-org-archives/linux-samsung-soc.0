Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCE72D8385
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Mar 2026 17:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471288; cv=none; b=gXQxmb3OQeOkuWLvuZr07sTTg77OJYG8FLCO7hwC2+vjF7Z6UkCjwM03t0b3sd3FdN2JrfchjNzIWYS4sulJ9ntGPr0M937ixLia4Pks9q4tkiund+0vKFZz8v136Aa6GA9pqQQLTfTHbNXIz91JjaSYIbax2GrSHNg6KYDxY3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471288; c=relaxed/simple;
	bh=EE7A7r52l/m10LhtXfpLL33RfDMVWAzlQYs9t7L0ma8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpcwSxhFAU6MlLKgI7yWGpHS1q5gbInBG3QMDntVv5kEro0AkpqLNLLWsxO/c3cW9mkT1qwXq+QWh/ZaaYNR+DGX+HkLRLU0Zuk1m4bN3VkoLrB6FA1hjJI8TvmIoiB+I31Ucz1PTEgC/Abis7cm02R40y9DuOHSgtjz21unO10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YnHFPXGJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IdiwRi16; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YnHFPXGJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IdiwRi16"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772471286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g6brGvw3JACE3nh9BUDtId9Pcx2DeTaNYx1CllHdzjc=;
	b=YnHFPXGJDU9yof+QT6OuSyX10HcSxdrswfe0Z/fs7JGmoAUEQNYKMyI/oRU7VxT/qg0Jqq
	LSvnopkFXWOjPhR0PA3oVNuuUw3+ddCauwcId2ksiomU/8agDx9h/rVCN8jcSRfcNWtfgo
	0SbT1JFI4G1uHz94j0te9tmsFyDvNKE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-8Svvdy9iO5qpXiOZI_5svw-1; Mon, 02 Mar 2026 12:08:05 -0500
X-MC-Unique: 8Svvdy9iO5qpXiOZI_5svw-1
X-Mimecast-MFC-AGG-ID: 8Svvdy9iO5qpXiOZI_5svw_1772471285
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb403842b6so4094469385a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Mar 2026 09:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772471285; x=1773076085; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6brGvw3JACE3nh9BUDtId9Pcx2DeTaNYx1CllHdzjc=;
        b=IdiwRi16INKvOFz3Nn39xb3Z3VZ1ugkBwTLGTunzH9lpImcuvPDdOA64U/E6JyR+hL
         P2x5jrFnPtkUdagjBmPyVHXxIJ6qAHA053/zPTN5mHvGfuKlRpGPkSAfLdq1wfi+4vbg
         JjTkNLKp9Gx4sj5Ybqpc7OUOOknGfze8gnk200Iyl5tzsCEZ/AWr7mxLPgHxhsTzZ93G
         l6IFsNPRp0Hp9eLJlDOxcKru3VYFQvROqanD79k//dQBEzzIpEThig/2Z32QKQXgcL9c
         tUwKQbcXT1oo33kMNREzffiQxgSHPyJiPY7M52+6tOhh919W8sZsTBDcUzv8eiwf+0Xx
         Q3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772471285; x=1773076085;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g6brGvw3JACE3nh9BUDtId9Pcx2DeTaNYx1CllHdzjc=;
        b=dDVrNGldYWjnJLYkHXMab5j/QfW5xCW2bwY2gHIIYwbxh6RgmeYleOgi/2+CDzGFpg
         IGHpbxrO3tXoFxyRqnZjEYv/RDpVOEKzCe3tf0DZNhERwqtRMr/JxRdRevXg87m+50a5
         TKISMjUiHVlnqXEgnQILRmYM/ti3RQ+IJBsNwLRHtHBIOjMfUJwLFGrUkAS2cPXg6ktL
         drdadatsJdzXSIQ304DFSgMZJBBMz/aG7s3qXuAyDtubEXmyl+6qj0orCZRFdhsOiSlK
         dWzERx/jEuOn/0miRuTam31gFdd0Gy6KLjCCcjjnFUiobgGYTL+ruGMg9F7nY8pRHhY3
         FfGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/Q1yYkHV9eTJVfohPwsuf1uHgJrhq3w1wJ1HLarh6Oa5vKM82Ca/uX55pp0Y8iexu+vqlTMo5kTKevF0NDgI20A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG/liTCvFh4O5URiv8z4lLMv0tShdAOgUynnGTfIhwtsSVFPUK
	iNX/ZqfDAoDbfC9ffyiLSVh06cK9kQVR3gQ7w5QNZlFEv/HXp5UitYG1UG4bZ1hHnQWZpbU9kXR
	1ycIQc1rp3gJbES11lphFZWc3Q2ayZgLILLYfbjLVXSkueqyuxiTAfZ8Fyy0yM21ejy/shVSW
X-Gm-Gg: ATEYQzz1rk2cwlctNs9dDY4AEOpuNKSTWRiU6PvgQNpdUD2UyvPzz7Y0hX/bBaYFJVQ
	xNDTIjMEf8s46ASrRSknfmxvCvri0rhUVtDY1vRV4BJS0TZuMuA7SaZhi9+fLknvhlV/JykgTlI
	UwCM5e0jHvox53uvAgRmmxXfwr5D7vLcOwnfHyRA1Ud04+lIOy5Tn3ilWia8qrnPCTa+7vRrWFi
	AkCjeGnrIBIEuz+fHfUP5aXHBciPYeAOo9xBxhclRjwIcbWiBJugMXNFN9UaanOVlk5xnknTByl
	gvAJxsd1k3mdncRHSc1XH+ze3EjoNuBwSj5EtKLNm3/xL6ohHkPG7rRwLOO0LCcR3iPCRljFQZ0
	IyECIniL72SBebF1uhDLCabBXAQwLvhti8dUlKX0MKRiXlRJmmrKV9H3b
X-Received: by 2002:a05:620a:444e:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cbc8f40abdmr1511585485a.70.1772471284569;
        Mon, 02 Mar 2026 09:08:04 -0800 (PST)
X-Received: by 2002:a05:620a:444e:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cbc8f40abdmr1511579585a.70.1772471284069;
        Mon, 02 Mar 2026 09:08:04 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf65921bsm1178674185a.1.2026.03.02.09.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:08:03 -0800 (PST)
Date: Mon, 2 Mar 2026 12:08:02 -0500
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	Kyunghwan Kim <kenkim@coasia.com>,
	Ravi Patel <ravi.patel@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: samsung: Use %pe format to simplify
Message-ID: <aaXD8h4cuG8I3Bh2@redhat.com>
References: <20260226205445.336839-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260226205445.336839-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226205445.336839-4-krzysztof.kozlowski@oss.qualcomm.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Feb 26, 2026 at 09:54:47PM +0100, Krzysztof Kozlowski wrote:
> Make code printing pointer error value a bit simpler and fix coccinelle
> suggestion:
> 
>   clk.c:363:16-23: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

