Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6340A1D45F2;
	Thu, 17 Oct 2024 12:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729168363; cv=none; b=e8qf5e5oR2EHuiwz63IB5XVvz2q3NU1Km18u3EXCbHOyo5biFFKoq2ctE/c/twYP3EZXETZxrmniLjrgVLyIUtPq5brANyau8TplKrXc2jsiDhpKtrPMZ9tMHK5LKOEeIRNnIXhoIpO0RT5qezUiZH4dAWLGRHtI9zA3HqJmrDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729168363; c=relaxed/simple;
	bh=MmyhBPsP7B+6alUpYyICBc30T8TUU8WROQq2/A+3FNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7X+Zf26Nr/p+dLk+qUbZaIo/k2/TQUqLkYidr+z7po7hlNM4FtXBXibvWUwqwIV2VI6snQaGO28ZDEcvCIFrJ7IYoRKHB8us+2BQ1zQOdNlIiIUbhaTGApnEJlo3Q5Tw3LvFxSdEhP8rHQM5cCMO7cL7nSXg3H2fL0POC3bB4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPi2UEvM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPi2UEvM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EB1C4CEC3;
	Thu, 17 Oct 2024 12:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729168363;
	bh=MmyhBPsP7B+6alUpYyICBc30T8TUU8WROQq2/A+3FNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPi2UEvMqb0/ynZUDJIHHD9oAbOmsP4g5VFQslhCB2IXZKdlhN18w4et2EpEFqUhF
	 4peAeTabZNv3/VD7yiojC+RgVoHOwvqnt3oa7FTQjP6kC+9HWAa4QLTloUYgGljSWP
	 OCFYKmE7FOYD28OWoI4O2V3yBgfK7axRKzqzvYnR+68PGCKSYbfwAN5TGHzJj9cRTn
	 PxvjSpudzfuFNHPozL1UVSFCrqZPOpHP/hDWJQZ5ZO4hvcTUc9d4dfAEBJo7AYBJ56
	 eIs8ODhNAQamkfIlScKD5upub//qchQs/boqoYExo6Oiwo8Uwzs0hQjk5RCvDNjfJE
	 FDsjTZkhzcMEw==
Date: Thu, 17 Oct 2024 18:02:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: kishon@kernel.org, krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, kernel-team@android.com,
	willmcvicker@google.com, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] phy: Add UFS phy hibernate modes
Message-ID: <ZxED5/HdlBLWqesE@vaman>
References: <20241002201555.3332138-1-peter.griffin@linaro.org>
 <20241002201555.3332138-2-peter.griffin@linaro.org>
 <ZwN/d8l7Mk6x2GHP@vaman>
 <CADrjBPrRrwEyg0p+6kfVoZGbPdvW6K3fa9paUoLyg_bHHScgHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPrRrwEyg0p+6kfVoZGbPdvW6K3fa9paUoLyg_bHHScgHg@mail.gmail.com>

On 08-10-24, 11:30, Peter Griffin wrote:

> > > +     PHY_MODE_DP,
> > > +     PHY_MODE_UFS_HIBERN8_ENTER,
> > > +     PHY_MODE_UFS_HIBERN8_EXIT,
> >
> > I am not sure I like this. why should this be the model? Phy drivers
> > should listen to pm events and handle this in pm_suspend/resume calls,
> > why do we need this special mode here...
> 
> There are a couple of reasons I added it here:
> 
> 1) Whilst link hibern8 mode can be used as part of runtime PM and
> system PM, it is also used outside of those contexts by ufshcd.c. The
> host controller can enable UFSHCD_CAP_HIBERN8_WITH_CLK_GATING (which
> will be the case for gs101 / Pixel 6) and the UFS clocks are gated and
> link put into hibern8 mode for periods of inactivity. When that
> happens the rest of the system isn't entering any sort of sleep state.
> 
> 2) From looking at the existing code upstream ufs-qcom.c and
> phy-qcom-qmp-ufs.c look to have similar requirements in that it needs
> to program a set of specific register values depending on the UFS
> gear. To achieve that they added PHY_MODE_UFS_HS_B and
> PHY_MODE_UFS_HS_A modes here and then use phy_set_mode_ext() API in
> ufs_qcom_power_up_sequence() to signal to the phy driver the UFS gear,
> which is then used to choose which set of values to program to the
> phy.
> 
> The two new UFS phy modes added here for hibern8 are for a very
> similar purpose (to choose a bunch of register values to program), so
> I considered it consistent with what was already being done upstream
> to signal between UFS host drivers and UFS phy drivers. Arguably I
> guess we could have one "mode" PHY_MODE_UFS_HIBERN8 and use the
> submode parameter to indicate whether we are entering (1) or exiting
> (0) from it. I wasn't really sure what the rules/guidelines for the
> submode parameter were though.

Yes but not exactly. The HIBERN8_ENTER|EXIT sound like PM events rather
than a PHY mode. If this is resultant from inactivity, then we should
hook this up to runtime pm ?

-- 
~Vinod
