Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34044466B5D
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078075; cv=none; b=HrU/2UcpXLXfI6lTVk4nHyreJ/qdYE7zEvwGOzur94/quYA9hRmnU3skTHxgdHtrGF/WpG498GdRKeNCp7rAQ1SZTj3/iR1FWsUZcc65Oj6RpfwowYQzC0Hd2QjfBmDVQxseQT1jR7sLki0gDyWSxLtctSJTtq/d7Mk/38GnFco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078075; c=relaxed/simple;
	bh=pk0SQXMIBv323itTlK6HI/JmGOOs4oiVdYUA/gYIil0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDknRv9sin6a3XGVM6vNlXUDEuBoAr+9rbFbIaB8fbS31o/Fq0r6B//zDMmdioJCBEgxlxDG6J8pSE7i9RNDX7IOiYSJ/DXTV8mselosJgmjcMvOoluaDGBFBz/HmAQB+8JRznnd1yMNifeIGgeLr1PzGhOicUAvPipOBhgDTgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U5OMQ8WL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e3aFkl/o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U5OMQ8WL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e3aFkl/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778078073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WcZHEpBYmvivsHWsr27bIi5qRmMv5umj0vIx0hIYymo=;
	b=U5OMQ8WLxmuinOWSC1+a+TMasheNHZPolxFlg5QdyZk/JnaNq+3U0fwbRuS49jGZt/FRng
	lIVkKGq2IDsaxnEEVhrq2FERiaGYw88RVIcgELwEp0ks34j3eThwr+O/p+3kQtZ4RRNTcm
	RSs8cO/Z39h5COVYdQJoBw2lT2BatbU=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-CpAqFXeVOyGjWZwGDPNkYw-1; Wed, 06 May 2026 10:34:32 -0400
X-MC-Unique: CpAqFXeVOyGjWZwGDPNkYw-1
X-Mimecast-MFC-AGG-ID: CpAqFXeVOyGjWZwGDPNkYw_1778078071
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7bdd1ef8648so36277437b3.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 07:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778078071; x=1778682871; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcZHEpBYmvivsHWsr27bIi5qRmMv5umj0vIx0hIYymo=;
        b=e3aFkl/oG839JZehdYHQ3RHqBzLCbMYoH5x2o6MyH5hmJGv+TYsYNc4lTL3feydZLF
         8+uSyuH3uwUPO0UyGPwy8eWYJ2oUGzR0gXFd7NoBgCEvHLVoPLHjD/RlF0Ct+LBsJDBy
         jMAZftaic/ruH9Xjr73KB73Mjixtmhp4RRWzGeA/G4xTpWPzEaB2Jjd9e+6AW6TkytjG
         ZkyqmIoTP1KO2++ZbF7LsFLQzgjW+XJI1pDKS5ubbuv4qgW7ZfJVAoNx6cxUfnjBtHc5
         /HW237rpRCLPf6ewpGP1BWz+yVHSdkwpgs5LNN8nmUvfLkwppMJkWRAdVM+vnL2EBn2F
         vOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078071; x=1778682871;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WcZHEpBYmvivsHWsr27bIi5qRmMv5umj0vIx0hIYymo=;
        b=bWw8y94y0P+ZJSe1zO3FVlzSfFJRjxZIzvYZpxCya/cToT+RrOrakTryAoLhMgsoMB
         WAT/v+u7MMUX4rLpoLQKkqCpCMthUr9XawVhg2POvV3FXwF0e4eqnEwSuBrGd+BIHmfB
         oXIxViGu2Vg2kDjITUonOUuW0JCVB27PDPPNtUHnz9T08FnssadX6zKB8T9Fdqpc7B34
         gB1lsKHJk3eZzJJDzusoxHerxloFSXj+bOselgmq0aWl3PwA5L+f0OsSAixmp8PROHBF
         CAAQ+u53sf+QjqdPrJ8MvoQHX8gX0EUoJcP+t3WF7wY8rn11l4hIOU6q3iHG6MEfPnPW
         536A==
X-Forwarded-Encrypted: i=1; AFNElJ/L8uf1so7TwT5UcOsFAYGOMQckWB9Q5w9pHA2GgwzYpfocf66HAd/tVZ1GE+jH8uF5/YJBNjPpd2nhNf1o+hN4LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzylZQK/YFqyxIDqQD+eGINQ/qc7WIIH6MHH041BOxMZOy/M65N
	IsssG4smJ3jTQOy57g3OJviEPLMa04IL8hT9RBq5vNEesQD/8obbIac/BPhWD4PmZ/J/iwkmIgJ
	lmN467f3tR2xAVOq3FLyQx/BiZoSZWkvvq4Z4CgOhiU0NqO2C4IitIR8eVJjnUM1jQcJd3ahD
X-Gm-Gg: AeBDiet01wgOIjicdKxicmHkRcl04GKGi+EhejimnrOppJFkiaIG0M5Ujt8Psp/eDdV
	gpxsFHwWS6fEH5asavxk2et33fhbK7qNuNc0cniaaj3PXfpMagaomRapjy5uHX4gnuylc+MYVhQ
	WeHX0czrf8AAz4Syk3O8VtFlatt7dE6Hiuc4fjk3npNfqStYRPXtU6U2agWf/MKu0Hq0by4P7Kt
	RvmlYcuwmuJT9MY6mMtCCXho5gm0sntNvTh2DFuIiaPB4ldczkzo73zXUXWakEQaXR9Fn1b4FTV
	eLp2akY7RKUGZK0tmUI3Yjkm0nxvtxJAA+a8WigWlxv9RhgPKpSKx+8u6ttFVUCQS8vx7iMOywi
	6lok42JWU8thcFfiFy5yQXipKkSzie9oumGPB5CMjQg1+Swlh6WQWKhuR/i5eSxfjygM=
X-Received: by 2002:a05:690c:4b87:b0:79f:7972:f89a with SMTP id 00721157ae682-7bdf5e7fc11mr45200177b3.28.1778078071200;
        Wed, 06 May 2026 07:34:31 -0700 (PDT)
X-Received: by 2002:a05:690c:4b87:b0:79f:7972:f89a with SMTP id 00721157ae682-7bdf5e7fc11mr45199337b3.28.1778078070442;
        Wed, 06 May 2026 07:34:30 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b5391e344fsm201219216d6.12.2026.05.06.07.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 07:34:29 -0700 (PDT)
Date: Wed, 6 May 2026 10:34:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 10/15] clk: samsung: acpm: use
 clk_determine_rate_noop()
Message-ID: <aftRc6JOTHAKbt4C@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-10-f3f829fbacdf@redhat.com>
 <abd89f01-f079-4ffb-9719-575ea5e30add@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abd89f01-f079-4ffb-9719-575ea5e30add@kernel.org>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Krzysztof,

On Wed, May 06, 2026 at 03:47:33PM +0200, Krzysztof Kozlowski wrote:
> On 06/05/2026 02:49, Brian Masney wrote:
> > Drop the driver-specific empty determine_rate() function and use the new
> > shared clk_determine_rate_noop() helper.
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> ...
> 
> If a tag was not added on purpose, please state in the patch changelog
> or cover letter why and what changed.
> </form letter>
> 
> Last part is important.

Sorry I didn't mention that I dropped the existing tags on the cover letter.
I felt that it changed enough in this version that I didn't feel
comfortable preserving the existing tags. The overall change is very simple,
but I didn't want to misrepresent the new work was reviewed by folks.

Brian

