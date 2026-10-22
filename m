Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667509;
	b=T37mC1wyClSyd1cfAi2QZGHRI6ZSBe9dxGteMD9d8X3IiCtvLhyO42RVrYlX0Z3NQZ3H
	 3SCFNXJ7hYpPLuI+yTyRjxOtzyaPR/uGLtWwjRx36q15bVchi+qc2aC200cGSR0LGlir/
	 SPM0tn/83fjQu4otmBQ9SLjmn84lNx047kFeJu+/ck/5CiNHl02d0W7UGw6w4COaKFgb1
	 K9vl2ZSgz+hIkqGmmAlIjilnvQQtunX2eQ4NVWjgXS4QHPSwZqSKTIJGM9N8UnKD9gD0s
	 m1ju+GuW0JB77cnxSL8uu0uchjPsZGEgPmp7O5q431eNFPU82N/hOpBJBdcLBOUZkng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667509;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=vsa6iTKNUmWvs8sxmGkeNmkZFARnCBOsRh81xgEp4ZI=;
	b=kQNoCR6amq1heL3rn7c346e3sr7GoYcgEvQohYwWlm3Bvv9RVuwzxjmdT6WLk5dG2gGt
	 8ye2MzDygSzsbDfuQOYssBITARtW0qKPdGESIryVHTWlTHbb4NHvTOuFb6DCiITTrNrSJ
	 0atifwQZtXXtrek5b1pZDJHqZyBDNoBAm0oMHJiJtERi/YgVeewE7lPH0B1+I+n5DguR7
	 piI3YVwo7Ildv6YwB3hfn6HFBUNdWjWHJ+RGDAO9lFTnf68rTb7cVtKXiqq90mftIcxSX
	 sZtu5Kb1CC63JYNC+n/nUfKstCSucX5SA4LhITCBw399XxNCIk/TtEFxwCg7NuX0KAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IrUUD5Xg;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61304606A31D;
	Thu, 22 Oct 2026 11:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61304606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IrUUD5Xg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792667503; x=1824203503;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=qNlFDcEQenP85zNi1o7zqNU9K1Z6Ek4cKmafavrAjfA=;
  b=IrUUD5XgkBdJwYj8q46DoIbGlOrrbp0aVis4fqgXbQQcq6Cdx7QDTWjM
   8UEr1czMZLfMoE8iTWrFud/gHQMlqB8v9IUUgZSizGwwsgLQ3DaeIMI62
   xiHr+VRY+Oe5ykTn+QGZYVpDeSp+sWvQ60h4t/qk0qb0m0cO8/Q02Pd+n
   hFUMmO/sJbC9isPAnOAkoXWdBxLqdWe13BuWxdgnFQDUfYDxplo2yjY71
   3d4iDIrEDo4O6JzOYqDHjZmKFHADLVjqg46IeJGCERnPE8qBlwUcZmhp9
   er7IT/z5u3emhpja87yDuWylAlWKjRmdSUFa8WPxk2W8hVsPq6uUEf7gp
   Q==;
X-CSE-ConnectionGUID: FiheloSlTAuzbaU0hh0bWw==
X-CSE-MsgGUID: PZTtH10mS2eUAwPYs567EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1517390"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1517390"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 04:11:42 -0700
X-CSE-ConnectionGUID: Zq9IXJ3HSSCCWvo4b2f83g==
X-CSE-MsgGUID: gLECOAQiQdGQ+Fy6+680gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3698061"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 04:11:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/exynos: hdmi: free EDID on connector update failure
In-Reply-To: <CAKOB7-Y0GTen0gYm-m4ixg8RjHuqEHsNgRTM4s3SbLg5J=vM3Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261012064334.3193085-1-thnkslprpt@gmail.com>
 <e22eadd0ada0c8243cfdf7829580984fdf897498@intel.com>
 <CAKOB7-Y0GTen0gYm-m4ixg8RjHuqEHsNgRTM4s3SbLg5J=vM3Q@mail.gmail.com>
Date: Thu, 22 Oct 2026 14:11:35 +0300
Message-ID: <0b3c43bb7dddd657e4eb3ba79bb4a75c86313625@intel.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 20 Oct 2026, Avi Weiss <thnkslprpt@gmail.com> wrote:
> Hi Jani,
> This complicates the if (!drm_edid) a bit further down, so might not
> be worth it.
> What do you think? Leave it, or should I try to rework it?

Mmmh. Right, very few places actually check for
drm_edid_connector_update() return value, or do anything about it.


> Cheers,
> Avi
>
>
> On Mon, 19 Oct 2026 at 16:38, Jani Nikula <jani.nikula@intel.com> wrote:
>>
>> On Mon, 12 Oct 2026, Avi Weiss <thnkslprpt@gmail.com> wrote:
>> > If drm_edid_connector_update() fails, hdmi_get_modes() returns
>> > without freeing the EDID allocated by drm_edid_read_ddc(). It's
>> > an unlikely error path but nevertheless possible and should be
>> > cleaned up fully.
>> >
>> > Free the EDID before returning, while keeping the existing return
>> > value of 0.
>> >
>> > Fixes: f6e4f57fd90dc ("drm/exynos: hdmi: convert to struct drm_edid")
>> > Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
>> > ---
>> >  drivers/gpu/drm/exynos/exynos_hdmi.c | 4 +++-
>> >  1 file changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> > index d4fce39c2b61..386557a7f5e8 100644
>> > --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> > +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> > @@ -893,8 +893,10 @@ static int hdmi_get_modes(struct drm_connector *connector)
>> >       drm_edid = drm_edid_read_ddc(connector, hdata->ddc_adpt);
>> >
>> >       ret = drm_edid_connector_update(connector, drm_edid);
>>
>> You could just move the drm_edid_free() call here to avoid duplicating
>> it.
>>
>> > -     if (ret)
>> > +     if (ret) {
>> > +             drm_edid_free(drm_edid);
>> >               return 0;
>> > +     }
>> >
>> >       cec_notifier_set_phys_addr(hdata->notifier, info->source_physical_address);
>> >
>> >
>> > base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
>>
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
