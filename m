Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E14A15F330;
	Fri, 31 Jan 2025 13:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738330032; cv=none; b=EKZTxCjiITKd9JaT1TbnnEpyUi3FNrr8Y/4hcGSIFl1ENYXWw2VqgCXQ2DIVcsG8HqQCBJ/I6pGS7E0rDfoPjrrl3Trj7CPOabrCQ8Ecql5THVjVzlbEhilJTGTcJn9AJgNE/AGMi21sZFhXNthL+v5M9gg3VAmidSQo5+fUP8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738330032; c=relaxed/simple;
	bh=vhlcMfq2KQs3Cd+XPUFPS2xE8lGzDeuJ+nJ9wXQ3ay8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNDfuR+U08q5sA0MoNihNhHLX52aY7eWpwlszYfP88TetjzzgkpsxmazFhSuS9b+g/lrJCqPFXuQgK20qmBJsx54LWY/fRf/aPGmHICx7/Grusn3iuMTPRYLluOPZC7Xzfpyu4A+LYZUW9h4BkvTedMFIch23efBOg2imXi8Ips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B25EA497;
	Fri, 31 Jan 2025 05:27:33 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DE033F63F;
	Fri, 31 Jan 2025 05:27:06 -0800 (PST)
Date: Fri, 31 Jan 2025 13:27:03 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: "'Devang Tailor'" <dev.tailor@samsung.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<faraz.ata@samsung.com>
Subject: Re: [PATCH v2] arm64: dts: add cpu cache information to
 ExynosAuto-v920
Message-ID: <Z5zPpz6WAbPJX701@bogus>
References: <CGME20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344@epcas5p3.samsung.com>
 <20250108055012.1938530-1-dev.tailor@samsung.com>
 <006401db73d6$2af35fb0$80da1f10$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <006401db73d6$2af35fb0$80da1f10$@samsung.com>

On Fri, Jan 31, 2025 at 05:19:09PM +0530, Alim Akhtar wrote:
> Hi Devang
>
> >
> > Add CPU caches information to its dt nodes so that the same is available to
> > userspace via sysfs. This SoC has 64/64 KB I/D cache and 256KB of L2 cache for
> > each core, 2 MB of shared L3 cache for each quad cpu cluster and 1 MB of
> > shared L3 cache for the dual cpu cluster.
> >
> > Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
> >
> > ---
> > Changes in v2:
> > - Added L3 cache for all the three cpu clusters
> > - Corrected L2 cache numbering as a part of review comments from Krzysztof
> >   and updated as per cpus clusters.
> > - Link to v1: https://patchwork.kernel.org/project/linux-arm-
> > kernel/patch/20241231064350.523713-1-dev.tailor@samsung.com/
> > ---
> >  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 127
> > ++++++++++++++++++
> >  1 file changed, 127 insertions(+)
> >
> [snip]
>  > +		l3_cache_cl0: l3-cache0 {
> You can add one node for cl0 and cl1, say "l3_cache_cl0_cl1" and
> Remove the specific node for CL1, because both are same.
>

What do you mean by "both are same" ?
Do you mean both have exact same properties but are physically different
caches ? OR
Do you mean it is just one shared cache ?

If former, we still need distinct node to get the cacheinfo about
shareability correct. If this is about avoiding duplication of errors,
you can probably define some macro and avoid it, but we need 2 nodes in
the devicetree.

If latter, you suggestion is correct.

--
Regards,
Sudeep
