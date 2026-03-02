Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F180426D1E
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Mar 2026 17:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471277; cv=none; b=G7m3XEza6ei9fDQrthBjc8TLr65o1GQdT8Om4nN5MW/lBf8ObzjQMReOZUE91/NGqTBA/2TrJ0HOr9CcZhoqh4q10ZeKBbM4KeBxHi8he1+x+8R6Pr+LE87S8eBDkC3Iqt+UrqdkloVoW0g89Xf3koJtOlcsEiYEi+OGDIjokko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471277; c=relaxed/simple;
	bh=jIGPOc+FfJQxokBbUZuUkvPWYl6Uf9OBDLQ/zpqAsZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqxpDgQp8Evg5IogtvaL+LhBksirCyXXNDG3SC9U3XmXVIHflM9xvgrfLEsJrsoAqik6aTVpEDXRINzcSIRdgFShgpyKyu2QEUMvW9h6ZqY3X9qPOK5S6ch6DcIUkicDoVPtGabpjontCZAXovVZd2wsTFoiR3gzeX/BaLGoHBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VXfqtRbq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QFYSZKES; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VXfqtRbq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QFYSZKES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772471271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=43O843P9nsrXz3Z3fOd7BhVl+4E27iRL9ozt9KlrMRI=;
	b=VXfqtRbqOm8hWXHAFrTuof6e0+6XnQ9k6qpxj2zSpxtjAjW9SmnFIxCP1im+lArpGvYULH
	RykjDLbLXoRq/x81MwifuOOs5pAbtCadykCL8Djp80o/F8zJ4lQL5cKQmvrEiYP37XZzEz
	Zk9888kXjP7Ny2AYWxdUYpekHvWjSK4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-33rYchBZMpepG8tylerG_w-1; Mon, 02 Mar 2026 12:07:49 -0500
X-MC-Unique: 33rYchBZMpepG8tylerG_w-1
X-Mimecast-MFC-AGG-ID: 33rYchBZMpepG8tylerG_w_1772471269
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506a936d7afso567120131cf.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Mar 2026 09:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772471269; x=1773076069; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43O843P9nsrXz3Z3fOd7BhVl+4E27iRL9ozt9KlrMRI=;
        b=QFYSZKESjuCGaPhZMGFd9ygJhuL4JJeScdUf7nFtPj7Z5vgFbNYrprqBUTsO1NbjZi
         jbh9eUxsY57p2LRDSZXXaa9J8rmGHYgskf8rBFWTMKDVn8cogLmswyol86cmhKSojMC8
         1DCpjorD/RK3CTXmtv3zmfO2tLitJ6v3ENnbPePt8rEWfhNuiUbbeeBNKHw9KGrXgTX1
         Pzk/2J6uXaXDspWRqxMMMqNP1KVg0kyXS00DvA7WHJ3wJe0c/957aSwc6Al5WdTPN8cQ
         FsnYa6IDilfAs0dbQqBWkv4br/oSBHfrfpCwksyqw+wpnQN0GiDPzeeJJ8y+w6yBb1aS
         DnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772471269; x=1773076069;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=43O843P9nsrXz3Z3fOd7BhVl+4E27iRL9ozt9KlrMRI=;
        b=K31o7Hbh9K6tYgwbjfBFpzYoc7S9YtjSgZVrZ5C45inVpjTkpRwHi8kHvzSkWxrMR2
         vd6dVxKiWfNT6JwBMP11RC49eStp7ZnPz3d61m2zMSMnpfwYmpZLzGgJ9cmPNi8zJ0mK
         l4gnYAXMg8YfbTFdm13eNT9nDo/XRsYMuXyutrADfZAnVY525Wa3/dpMSsTEVlFpROQb
         WdGWkVA+O+TqiYaUtZVvqCBHC31Uu5usUOl2E9ZL1SU0SO7DbFzLsyXh0BxhMr+C43a8
         Qneni3ssnUutIZ/CbrtEHWV6foH/3VkeQSg//XW3y/+B5VPBRKyN00/HtmyuGCjOTHM7
         GpNA==
X-Forwarded-Encrypted: i=1; AJvYcCXJUCw/ghTKipJ3H5LNr9Mn1lelJ8RceVq+6/pEkV6wObL5N0a1TvSJF2fZImqqkqODa8jGQtFPaXs1exQxVoLYzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiROGC1MVIieWHCJr21kXf3D/HaHgAoYseq24ms+nFKwKPqdZ+
	6OqzpRVK5mC33DmVVcxbbbKsNMh1ZUqv4A+9Mtonj26/awzuTqlJxIouAioKKZpbBj3q4heLBAo
	tkbW43PFis8IdBgr4iUHYg5fV6A23yRIaVqrJtdYuEOYrzVm01UHbITROWgB1nTY4g3YR4eqC
X-Gm-Gg: ATEYQzz/WoFsv/DuqghUzK/EGeZqfyRUE4CgF8U4pqqFGmTxx8ziY9pQtEU9EekMuc0
	sYzO3VfxVgicZ5MBlBm7yybQazA2uovrlkxWsxoWjr0HfZYyLdR0QaO/pQXpMLl41voOH9gyF+P
	08ProNu3WeStkDcHQBlcjzX9RMntgKa+8lApts2WPDR40icYVadR5hxWr8zmSJDG5E4EIARbLWL
	/Jk4YniSwzR7VQFGg24xxeVD8jtzgwhAXyYpp9Z2fjyKAhraB2VGYlWqfl5PAqpG7qn71fqLsFD
	rP9W5xJUxU1lH7Ente4jCLB3V3urOr8dP901U3qTOpXIGlGXxtDWD+X802UdDtwlgW2qa7p6Lds
	opeOzHrrJHqQZTv2skww6uGBnCdl3ZYywIcDPxuzXDev19j5767g7K43X
X-Received: by 2002:ac8:5a91:0:b0:501:13f2:e706 with SMTP id d75a77b69052e-50752a280c5mr143149191cf.73.1772471269424;
        Mon, 02 Mar 2026 09:07:49 -0800 (PST)
X-Received: by 2002:ac8:5a91:0:b0:501:13f2:e706 with SMTP id d75a77b69052e-50752a280c5mr143148821cf.73.1772471268983;
        Mon, 02 Mar 2026 09:07:48 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744ab3d88sm117087601cf.21.2026.03.02.09.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:07:48 -0800 (PST)
Date: Mon, 2 Mar 2026 12:07:46 -0500
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
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] clk: samsung: pll: Fix possible truncation in
 a9fraco recalc rate
Message-ID: <aaXD4mlP6814aBfU@redhat.com>
References: <20260226205445.336839-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226205445.336839-3-krzysztof.kozlowski@oss.qualcomm.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Feb 26, 2026 at 09:54:46PM +0100, Krzysztof Kozlowski wrote:
> samsung_a9fraco_recalc_rate(), unlike other functions in the unit, is
> the first case dividing u64 by u64, thus it should rather use div64_u64
> to avoid possible truncation.  Note that the original code did not
> use remainder.
> 
> This fixes Coccinelle warning:
> 
>   clk-pll.c:1489:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202602250053.wEU1hlpY-lkp@intel.com/
> Fixes: f051dc5bc8e7 ("clk: samsung: Add clock PLL support for ARTPEC-9 SoC")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

