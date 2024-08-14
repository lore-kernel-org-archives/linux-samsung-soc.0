Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D400A1B142A;
	Wed, 14 Aug 2024 12:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723640163; cv=none; b=ubqQSsAWZCWS8HASZ0lox/mYjfA03exZLpoWsYgt0ThI+IceeT+jLa3H+sVvtRm50lW/+Aj3WlOgjqzhTU/Cu632AbMk1Uxnm9ZyoV550M6g6qabMRzDfzk9vQfwwDoub9ODIiQZk0kzNbBFW+V6QdnPPXfeomScCL34mL+RE+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723640163; c=relaxed/simple;
	bh=KqRnxgjYWajhIUPo+HXdCS6BLSaBY1bMw/iNKPudTQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryoumwCHzqlQlvOV8FRqaqiLPKce7TxF0HeAJY20XA2eJgxnQRk8rlQfZZDfWZL/GHl2b5yGxAdujixAukELN725u6rNI0GV+vQ5Q4bmqd19gSj11E9XtsZHX8xiWX6y6wstHVCucopyENEB9Hf7ll0Nh7gVYIEFq1zOXQqRBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnBOg54u; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnBOg54u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723640162; x=1755176162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KqRnxgjYWajhIUPo+HXdCS6BLSaBY1bMw/iNKPudTQQ=;
  b=cnBOg54uwLey30CadE8aeK0eUDsb7EKBPDBE0B3MyRDNBThPynL405RB
   r1O6VS/zhp47Wbsx5tPsAAUB6Aoi7+LfSYEsUb63ypo7eHIHXsIf9Df3I
   zvB4f2kThFICOt3PM6i3f731RKup+QgxNo2M6IhQb7I9sALRAJ/EO7lzO
   BGrdYs5yv1pSwnUHYGZpMQqnHDiPSrSJTdTL/XYJpWug93ZArR0rpgB4B
   DCthZ3uZo/Su4EFWyeOro+VT+usAA3TKuhDM6kBVO5hnuwEMA0dxg5cbD
   jBNn+G43So9A6ltxWuSKxh5xWrqTdC9hxiJOffagnELUNGnIdzUJ9Vtzz
   A==;
X-CSE-ConnectionGUID: zx0Xf6E4TniMFBuk7+Y9Lw==
X-CSE-MsgGUID: 0XMSJg7VTpSvk53xq5RXpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21725300"
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; 
   d="scan'208";a="21725300"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 05:56:00 -0700
X-CSE-ConnectionGUID: jLMItZHBQeaIFjD2BpAPlg==
X-CSE-MsgGUID: k3SJaDUqS9ql6Jm0wEayyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; 
   d="scan'208";a="58969860"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 05:55:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1seDXd-0000000FBQD-1z8u;
	Wed, 14 Aug 2024 15:55:53 +0300
Date: Wed, 14 Aug 2024 15:55:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: Re: [PATCH v1 0/4] clk: Switch to use kmemdup_array()
Message-ID: <ZrypWaon4yIdzyx1@smile.fi.intel.com>
References: <20240606161028.2986587-1-andriy.shevchenko@linux.intel.com>
 <ZrsbXMVy1Dsi4UZe@smile.fi.intel.com>
 <2478bc8a787d07cd3e412b6ee4400669.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2478bc8a787d07cd3e412b6ee4400669.sboyd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Aug 13, 2024 at 05:01:50PM -0700, Stephen Boyd wrote:
> Quoting Andy Shevchenko (2024-08-13 01:37:48)
> > On Thu, Jun 06, 2024 at 07:09:30PM +0300, Andy Shevchenko wrote:

...

> > >   clk: mmp: Switch to use kmemdup_array()
> > 
> > >   clk: visconti: Switch to use kmemdup_array()
> 
> I have them all as "changes requested" so please resend.

Done (Message-Id: 20240814125513.2637955-1-andriy.shevchenko@linux.intel.com).

-- 
With Best Regards,
Andy Shevchenko


