Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FF613A244;
	Tue, 13 Aug 2024 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723538277; cv=none; b=UotYX9DooCNSurL2HyjRerMX4RICQonFhwuiGbrz5UeezR99SlqUn0kPUkkO4F5eTfrx4aQw01Xms6Wl4jtFc9kwc9xc9zSUtc5xnOeWY+poVp8+nOhcgsJi9B+bo0q0jef9g9jlXciK2gVFBFqwe7v6FS5DFcwfR0ECaETSbYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723538277; c=relaxed/simple;
	bh=0zit28vkJLoveJCnlYRWpnW1iA4PdjPohhk+xYzQHsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elslGyqYsogEhzdVNWI4gnCm65YGWgEn/Yux4KN7PxtlcnJpFrEB/qL/d6mbgbi6R38XEQq0tgK7t//zg8nhJP0Gl2T0AQaSEFvFCQB9f/plI85nGiFLmbJN2ldeJgilLV9o+5JW+2cUzojjCBLHUrlTt34M307LFIfvOuGYhiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVt12rVZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVt12rVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723538276; x=1755074276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0zit28vkJLoveJCnlYRWpnW1iA4PdjPohhk+xYzQHsw=;
  b=AVt12rVZS7chSJiBlSnVIQn8D4bN7gN+fEqm0ftX0orELyYs2lk1ATrE
   NCX3TsXsYeSsIKn6ShZ2Cqu0sGYYaKTJpgEEP7eYXnlOA4ZSh0EASUHIl
   09ANYmBpUqo8+NOSu221szukoZtWtG4COLG8FJ/myHmn65AJaLzkD+oUc
   BojYXbEj5s9yszRIPvQPh6bNR4O0X2+/wM6/kXlxnACsTcdqxflND61SU
   9KKFSS4bFQU9eUbt5TpE1NwgF/wOFNrG2uA7BVaIkLtVqMq+825Vp8yyw
   fc9vj0k1nXOMn0AtJB/JnX1wqSbCKaT5O46pmed7rs5MH8zAQHJNw6Q07
   g==;
X-CSE-ConnectionGUID: BnLDNvT6QFiLc+KoJiNhxQ==
X-CSE-MsgGUID: irZw0gC/S2+jfN81oGUc5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21544192"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21544192"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 01:37:55 -0700
X-CSE-ConnectionGUID: NFUyk0GPR9WJTDrF79fqSg==
X-CSE-MsgGUID: qta44cKjSb2kZSSuYxwWPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="62986362"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 01:37:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdn2L-0000000Ef5r-0xTf;
	Tue, 13 Aug 2024 11:37:49 +0300
Date: Tue, 13 Aug 2024 11:37:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sam Protsenko <semen.protsenko@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: Re: [PATCH v1 0/4] clk: Switch to use kmemdup_array()
Message-ID: <ZrsbXMVy1Dsi4UZe@smile.fi.intel.com>
References: <20240606161028.2986587-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606161028.2986587-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 06, 2024 at 07:09:30PM +0300, Andy Shevchenko wrote:
> Replace open coded kmemdup_array(), which does an additional
> overflow check.

...

>   clk: mmp: Switch to use kmemdup_array()

>   clk: visconti: Switch to use kmemdup_array()

Any news for these two?

-- 
With Best Regards,
Andy Shevchenko


