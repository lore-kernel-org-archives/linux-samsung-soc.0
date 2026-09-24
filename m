Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BED40A936;
	Thu, 24 Sep 2026 11:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248708; cv=none; b=lQjIk9rRiYqrM1BLw4qyqWzaZAxRal/I5OJVf/oeXPshePI6obmlFC/G1IBHo22gjFH5kLNDSAvYy2IvaAsKQ2+FhU9X0J21NQcAvtetNyUsKXTViLijBBQa5gWkjnXisvnc1MPSR7nxq96Dh+BwqM0eaRFBFJPQ9fEihH79W1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248708; c=relaxed/simple;
	bh=ZMMAM39BWNk7yMnZdN2azby1KqpgjDTo4lFsVmtZV58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=seEElpbKfcpGdqIiFw54CMRR9tBGHHJNwfhV/l+VVQckDWbJMlwL4EEa964ip91LhHu95nRMnsX13CiElrja05YZ9VOcXyPDeRueo20hVKuKnfMM9CAmvoxt9jftKoOO0tMkay3Lo90Mc/y7Ab/LGICEh+5aoUFiBksh/N5QRRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af404a00e4ccc4fdbbd66590.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:e4cc:c4fd:bbd6:6590])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B33E11C7465;
	Thu, 24 Sep 2026 13:18:25 +0200 (CEST)
Date: Thu, 24 Sep 2026 13:18:24 +0200
From: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: markuss.broks@gmail.com
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] IOMMU driver improvements for modern Exynos SysMMUs
Message-ID: <arUG8gG8Fx3es8Hj@8bytes.org>
References: <20260820-exynos-iommu-fixes-v1-0-6bbcd673bb15@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-exynos-iommu-fixes-v1-0-6bbcd673bb15@gmail.com>

On Thu, Aug 20, 2026 at 10:12:04PM +0300, Markuss Broks via B4 Relay wrote:
> Markuss Broks (4):
>       iommu/exynos: detect SysMMUs without BLOCK mode
>       iommu/exynos: fix the enable sequence for no-block SysMMUs
>       iommu/exynos: fix TLB invalidation for no-block SysMMUs
>       iommu/exynos: decode the v7 fault transaction info

Applied, thanks.
