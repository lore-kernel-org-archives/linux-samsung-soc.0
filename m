Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AC01E49E;
	Tue, 11 Jun 2024 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718112014; cv=none; b=pUtqI6y+E48EaD1G5Uzzvt4nmzbsjAngf/pw/upWTTAcZcpkTJRfAjmxr96HYeuvgJ8cZViwRrbcJmu6r1zG6CDe/tTsN8yhBmUGtdLjcHXSIrLHUXdgxzQ5EB1gOA/CQXWvjkd2h5z1doet08k/BlxsgKQxgh6ULQPLm747S5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718112014; c=relaxed/simple;
	bh=scYseydD4W86mLHD0NXDGiB61t/F+N3UuYzCRNJji34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOnXIREqUEEe7jhq5cGh3J1b2fE5ax7DGSgbeUxYuztJBXatbbJicWR1pAfMRoO5jJW9Hzj9ThNUFWTkQqUAdGcCWeanehHSe8aHxl7oMadHz3VbbNfvQSyrRhv/Q2rNeBTN6Dv5Xyg1OOkWHr6vcfwaZh2drGFMNbGkQu2Sv9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwJyvK17; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwJyvK17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718112014; x=1749648014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=scYseydD4W86mLHD0NXDGiB61t/F+N3UuYzCRNJji34=;
  b=bwJyvK17+Gd5T4QlDVTkPbhz8s/LSoxCHBTQucdXHzW7x7HVnE1AsLsc
   XpYb3yYh/UmNZjZqO3eBSDOonroClXQzKIypPOlJ1KzqHinoQr/EoRQVf
   08AhZzWEO62VGWfcriDlXS3jQLVUEDeB+R1fh0Nki7u0aqv+nMxayWQXS
   vPCiC9ngeF1PsjGO+2toGvWKyyHliVwjh+G7SDC/ofORP+0QHMaCJ/VJb
   wg03ZMhvyNUkVQknaBAeePyn5C2YkyRcDkON3zG1r7BT6PmH7TmvZ0du6
   RB5gVb6Jn6beWWtcQq/0KAsZNzfQ0FVhxdhmZUBd58/1sZOv+vRS1i6nj
   w==;
X-CSE-ConnectionGUID: nc6+Zm4cRd+Y9El4S4bEUg==
X-CSE-MsgGUID: Ti6hXySQROaAixZciQJPdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14661980"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="14661980"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 06:20:13 -0700
X-CSE-ConnectionGUID: yvfEdXfwTOGfTOhvmakTUQ==
X-CSE-MsgGUID: 1s2C84kRRhKD11GcAk+tbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="40022762"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 06:20:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sH1Py-0000000FXuW-0YY5;
	Tue, 11 Jun 2024 16:20:06 +0300
Date: Tue, 11 Jun 2024 16:20:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: Re: [PATCH v1 2/4] clk: rockchip: Switch to use kmemdup_array()
Message-ID: <ZmhPBccSC0Uc2fjQ@smile.fi.intel.com>
References: <20240606161028.2986587-1-andriy.shevchenko@linux.intel.com>
 <20240606161028.2986587-3-andriy.shevchenko@linux.intel.com>
 <8182279.JRmrKFJ9eK@diego>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8182279.JRmrKFJ9eK@diego>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jun 07, 2024 at 10:13:04AM +0200, Heiko Stübner wrote:
> Am Donnerstag, 6. Juni 2024, 18:09:32 CEST schrieb Andy Shevchenko:

...

> > -		cpuclk->rate_table = kmemdup(rates,
> > -					     sizeof(*rates) * nrates,
> > -					     GFP_KERNEL);
> > +		cpuclk->rate_table = kmemdup_array(rates, nrates, sizeof(*rates),
> > +						   GFP_KERNEL);
> 
> are you sure the param order is correct?
> 
> According to [0], it's (src, element_size, count, gfp), while above
> (and below) element_size and count seems switched in the
> kmemdup_array calls.

I'm glad you asked. The parameter order is going to be fixed [1].

> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/util.c#n149

[1]: 0ee14725471c ("mm/util: Swap kmemdup_array() arguments")

-- 
With Best Regards,
Andy Shevchenko


