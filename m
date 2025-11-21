Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA37A28689F;
	Fri, 21 Nov 2025 10:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763720678; cv=none; b=Q6eqXPJD6B/1AIHakULIZU5yVl0AohmQBJ3+e3hHah3S6Sa0KJ52/IJY5yCGpj9zxAZI1MjJNe5n649sMPxGUuoAiGLoNGdnGSLqQGKbTB3JlciTYFFp4Gv/wIsFbfsR/kTjNPMEGgr+yokJSBU3IMB3496bhlr4KU7lrNPm+Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763720678; c=relaxed/simple;
	bh=HizJuIeoODBpLxDfWhYPkJL8kWROViz2yXrYNsMsOZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oURuJuDNzQTIw838SmD0jRFOchgrqm8pSTyV4TFw4CzI7sctpukq//V5E8HaGi4q4M9UKVz7iP8k2hiNzu/54NFn2I6nsfJenvk8lWLsrEFcCXO5XCPIYfm3f/P+I3qtYZ3wAK/yevpFFFSIJg8dg2Y+CSg5R5+sGW0vpbhk6cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENU7nhgQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENU7nhgQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A35C4CEF1;
	Fri, 21 Nov 2025 10:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763720678;
	bh=HizJuIeoODBpLxDfWhYPkJL8kWROViz2yXrYNsMsOZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ENU7nhgQJ0Xamb6jBuOiemY0Bw1AJxP1R15NYtKp5A36cygl4NMApg9nBioHh8leE
	 NReMNTh22emL56uJrYwaQkSsB7IYXQb2NF3XqbXXdTzu8339j3daFqLuuDY9zyyAyy
	 u51V3HzZDCr9Dd+RHM9Rfo3F7US/BeTOoqeLuHO7TL/gkqZDN4MEFAj0TEQTI4VMqQ
	 Q5ZGhvIj2qOoD81XZa4Q2CnqjMk/S+FpgQgunoKNvHLv3oRoxa/rotQbkuwUCDtuMf
	 qySx6QD2GGLwD0annoDrtNAfEIndIk1Y9Y/wPGsW0NNsGYM7cRwVWbQQsvvDbMddoN
	 O/1cO9Bn7T2TA==
Date: Fri, 21 Nov 2025 15:54:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	kauschluss@disroot.org, johan@kernel.org,
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v9 4/6] phy: exynos5-usbdrd: support HS combo phy for
 ExynosAutov920
Message-ID: <aSA94s_g0yVno3sS@vaman>
References: <20251010070912.3758334-1-pritam.sutar@samsung.com>
 <CGME20251010070057epcas5p31b6ee42004594b2b2fb414494180753c@epcas5p3.samsung.com>
 <20251010070912.3758334-5-pritam.sutar@samsung.com>
 <aR9DtJuwpzoq6spx@vaman>
 <00ef01dc5abd$b8aac3b0$2a004b10$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00ef01dc5abd$b8aac3b0$2a004b10$@samsung.com>

On 21-11-25, 13:36, Pritam Manohar Sutar wrote:
> Hi Vinod,
> 
> > -----Original Message-----
> > From: Vinod Koul <vkoul@kernel.org>
> > Sent: 20 November 2025 10:07 PM
> > To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> > Cc: kishon@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> > conor+dt@kernel.org; alim.akhtar@samsung.com; andre.draszik@linaro.org;
> > peter.griffin@linaro.org; kauschluss@disroot.org; johan@kernel.org;
> > ivo.ivanov.ivanov1@gmail.com; m.szyprowski@samsung.com;
> > s.nawrocki@samsung.com; linux-phy@lists.infradead.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
> > rosa.pila@samsung.com; dev.tailor@samsung.com;
> > faraz.ata@samsung.com; muhammed.ali@samsung.com;
> > selvarasu.g@samsung.com
> > Subject: Re: [PATCH v9 4/6] phy: exynos5-usbdrd: support HS combo phy for
> > ExynosAutov920
> > 
> > On 10-10-25, 12:39, Pritam Manohar Sutar wrote:
> > > Support UTMI+ combo phy for this SoC which is somewhat simmilar to
> >                                                         ^^^^^^^^ typo
> > 
> > > what the existing Exynos850 support does. The difference is that some
> > > register offsets and bit fields are defferent from Exynos850.
> >                                            ^^^^^^^^ again
> 
> Thank for the review and sorry for the typo and can you please
> confirm if updated commit message is fine, mentioned as below?
> 
> "
>     phy: exynos5-usbdrd: support HS combo phy for ExynosAutov920
> 
>     Support UTMI+ combo phy for this SoC, which is somewhat similar to
>     what the existing Exynos850 supports. The difference is that some
>     register offsets and bit fields are different from Exynos850.
> 
>     Add required change in phy driver to support combo HS phy for this SoC.
> "

better :-)
-- 
~Vinod
