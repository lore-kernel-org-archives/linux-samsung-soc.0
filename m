Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C9639890A;
	Mon, 12 Oct 2026 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821661; cv=none; b=MugyYpR6sG8q2yc/228HaC3sH+4RJDjxgbmYe3zOPUuagiNuhOVKEBFyxN2GYgv9VsHCOhTFDHZ58AjKKXA/Uht5oqBOqWdB7HcJAINh4/5DaAHTCHFnz+mq1g8nh5qhEl4y9nvfCc8TlNaSx6HzRrc1jUOE1G1SMvqGWNTu+jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821661; c=relaxed/simple;
	bh=g/nhI0UvP/sibaQAzukFq2a4drK6+P0e0L2iBIv4Y1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ceHU2tr+8bPaMvUH0eyqAD8o0YPtYerTM6cAk669ddTbF5oOK3rxIFWkJg/IEF+drb3lt2iFTtaznzCsDuibAWhXVJc6JsK1C6RbINTRWIhJrZx0jjaKjC/ssbL+Cb2H+WdX0+rbQ97nsGy1GA+6zzXjULIxZw7VuX6QspWTbMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axltw2Oz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axltw2Oz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAFB1F0089B;
	Mon, 12 Oct 2026 16:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791821659;
	bh=RFdw4NU0rqUdnwQkTW5jDTI2TrOvFLZe/E45ZXiDc1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=axltw2OzFfnLto8lDkWnN70zzds5Hzc+9r8r1oqBZPU0ch275Tc7K4iNf8MBEEkZ+
	 ccKwY4IhxJtI0GUnsHXL6WZTobF2ZU9UFuo7FXRWAlaJjzfapOPDVfIfhz5m4y9+R8
	 Qf8uGc5HAa78+rbJgPUVlFGwIkIPkv7vPFiN4gFLW5SDMHvGiKEKfLISv9bo9hVg5r
	 uXUdQCqyJ4mCVBiXIr6g7JW4FAhem74cvuUDquwunje2NHvvz9oODV5HL2aJal5YcO
	 Rpu6WZipcjdV8zbR02T2fZPbkqVDUAbsahyIVyCqeaH7j89Bj+E75itq6p1ohWeTKw
	 9MW1TYxMr74/g==
Date: Mon, 12 Oct 2026 21:44:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk@kernel.org, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, pritam.sutar@samsung.com, 
	andre.draszik@linaro.org, kernel@lvkasz.us, pengpeng@iscas.ac.cn, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, 
	h10.kim@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com, 
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com, 
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: Re: [PATCH v2] phy: exynos5-usbdrd: Use dynamic phy_cfg size to
 prevent OOB access
Message-ID: <as0G-bk_TKRToOkv@debian>
References: <CGME20260918103249epcas5p49c9b4bf6fd60c28f5f09f0b7b69828b6@epcas5p4.samsung.com>
 <20260918103147.2628614-1-selvarasu.g@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918103147.2628614-1-selvarasu.g@samsung.com>

On Fri, Sep 18, 2026 at 04:01:47PM +0530, Selvarasu Ganesan wrote:
> The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
> creating both UTMI and PIPE3 PHY instances regardless of the SoC
> capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
> and ExynosAutoV920) provide phy_cfg arrays containing only a single
> element.
> 
> On these SoCs, when the loop reaches index 1, the driver reads past the
> end of the rodata array, populating the second PHY instance with garbage
> data. Since the configuration structure contains critical function
> pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
> PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.
> 
> Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
> store the actual size of the phy_cfg array for each SoC. Update the
> probe loop and the xlate function to bound their access against this
> value instead of the hardcoded EXYNOS5_DRDPHYS_NUM.
> 
> Assisted-by: LLM
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> Tested-by: Łukasz Lebiedziński <kernel@lvkasz.us>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

Since this patch fixes an OOB issue, it should have a Fixes tag and the stable
list should be CCed for backporting.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
