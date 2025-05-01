Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E0179C0;
	Thu,  1 May 2025 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746090559; cv=none; b=pHDdpmSo9nNv+Z+iiwTvELfYGa48uKldKQiKdI1QEpj5zXiQmoR4lhzs1Cg8poQ5TPQ3ekGbq0u1AZJLiEe2I3TdNuBroH66pHhtdQ8o+l6MEOiTC8K1F3wgb00FSsgAKGxa6wiy6f2nKmGLZePa9PLpVYeDkjXOeJnVNjXb83w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746090559; c=relaxed/simple;
	bh=Ab2Fh2ilzC5IU7gqXpYNCm4x+QzBsCpAZEaO3S+BdKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxrxpmHXjK/xkXNH3X5ghYJtr5aNeqU1O658Wnh/zxqkdr0dob+29pYOsF8CNosP2h3niT1MBO+5C9/6WnaiWPMnVChV6C5N0ypWmn+o4lLa4b8rA7pWt6F3cvqv42An0pIMcIf4FH5TOtsabMATExrEy/0FOIce+REBcpVLSLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7nrNs3t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7nrNs3t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABDAC4CEE3;
	Thu,  1 May 2025 09:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746090558;
	bh=Ab2Fh2ilzC5IU7gqXpYNCm4x+QzBsCpAZEaO3S+BdKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7nrNs3tbpCki4FheEGOTdohY/wkrwSqL6TUMrwd6jLLdStbV/3RqErns4Qty6Db+
	 8ltaB7n1dTK76PYbri3Po9ZVUUWfxy7aVTcLD6pNP4nlsPJqrQf9+Uhvm4B/Y3yRS4
	 joDuG+WxWAMiMrYsYpPhGtYhljYOvfAEynKiWFU7RTBgkIThwIQBd34M10YkrPLib5
	 YDsy1DzajSoztuICNrtqPuSRT8HBbwV0Yrq10aKuV4jTQMM1aZBr9o18p7jRt6rA7F
	 1rp9oCXCbkfoj4UAZe+0blotSyTjenvL2BroaVTd11+IDgRjowDAd5PKrrb4AdvPI0
	 WJD0rkLb5QADQ==
Date: Thu, 1 May 2025 10:09:13 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] firmware: exynos-acpm: clients (PMIC, clocks, etc.)
 will become children
Message-ID: <20250501090913.GA3627101@google.com>
References: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
 <174530898122.9276.5071475909293812602.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174530898122.9276.5071475909293812602.b4-ty@linaro.org>

On Tue, 22 Apr 2025, Krzysztof Kozlowski wrote:

> 
> On Thu, 27 Mar 2025 12:54:26 +0000, André Draszik wrote:
> > ACPM clients (PMIC, clocks, etc.) will be modeled as children of the
> > ACPM interface.
> > 
> > This necessitates two changes in this driver:
> > * child platform_devices from device tree need to be populated here
> > * child drivers will need to be able to get the ACPM handle via a
> >   struct device_node, not via a DT property name
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] firmware: exynos-acpm: populate devices from device tree data
>       https://git.kernel.org/krzk/linux/c/636baba9489a634c956d6f02076af6bc1725c132
> [2/2] firmware: exynos-acpm: introduce devm_acpm_get_by_node()
>       https://git.kernel.org/krzk/linux/c/a8dc26a0ec43fd416ca781a8030807e65f71cfc5

Can this be made available for other subsystems to pull from please?

Without it MFD is currently broken.

Ref: https://lore.kernel.org/all/fd11ee67a3d51aef6305c477b140d911da0b2af4.camel@linaro.org/

-- 
Lee Jones [李琼斯]
