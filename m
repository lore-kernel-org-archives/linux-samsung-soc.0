Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C62318EE6;
	Mon, 29 Jun 2026 17:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782755213; cv=none; b=Q0ysDzH6jen9kxsF7+86nGzDnVvzZp04qzk/ToQnOKjn1c9QzizVakLya/30hnbSPjY8ekJMVyMOerZXA5gwhCOebx4uAhSz1nrsk8T/q7PTWhuEA6FJ0QKji9XUwPT3kAyDm5zlOz7bSUNoNhaZ+xNNDjpsfR5bjMDOT8TC0is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782755213; c=relaxed/simple;
	bh=Gqsw1pW7i6nGU1jNertuHP6roce2PEW69oDsk7J1LiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFDWFLc8UeWeNBjWEpEyArWACYJmjUQnTZvVEZ7TWyJ+iejmGQVn/nyR2fJr1HKCjTuUNA/g/SR4efT3vmBsgsxCTqoIbQ93RhcyhfyBT9qof/d5xqWWem24RciqZrRvoFzUm9YK4aj9Rso8P0RuqkfjZj6LjLikueyIYUB8+so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNHnYcSV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNHnYcSV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782755212; x=1814291212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gqsw1pW7i6nGU1jNertuHP6roce2PEW69oDsk7J1LiM=;
  b=aNHnYcSVCzEJV7NHAVDTc1AtJmamPmTDsXFTxrUQ7xuKT+750YHzZyd8
   xxt1h1SZPQrSxrc1J0+uf3OYleRH9GDc1ujiuHLpKoxbbUTBN5IEGPyNU
   c3PUb2DVEBT7ReB4OH0wcTPGLOpX59Xy0LPFk5A5mXfGYosW8SHt8WajK
   KMRgCV0Opi7iyUm4O/ZPByQo4Pvg7flIR0qX9sVt/8qeep4a81yqPMaZ8
   Y8r7it3bDsWqY2WwkyuCc34ityPzIsB0PSiaJUgKV1hivH08VBsLLvPeH
   8Z0vuXc4m8ra29GQZTyAZboiOAclE78c4LsCEwsQCIZfoBGdgHn81HTRE
   w==;
X-CSE-ConnectionGUID: +UVjVl90QISvNQWHddZfSg==
X-CSE-MsgGUID: gUiUADLbS8i35XErHT7yAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106253864"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="106253864"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 10:46:45 -0700
X-CSE-ConnectionGUID: 22+hkID1RIGeSqnEZMg/Dg==
X-CSE-MsgGUID: 86ddzfK/T5aItVVVW1CvSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="245671320"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 10:46:43 -0700
Date: Mon, 29 Jun 2026 20:46:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: camif-core: Drop unused include
Message-ID: <akKvgdXIj4EmKfxs@ashevche-desk.local>
References: <20260320215910.3236783-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320215910.3236783-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 20, 2026 at 10:59:10PM +0100, Andy Shevchenko wrote:
> This driver includes the legacy header <linux/gpio.h> but does
> not use any symbols from it. Drop the inclusion.

Can anybody take this, please?

-- 
With Best Regards,
Andy Shevchenko


