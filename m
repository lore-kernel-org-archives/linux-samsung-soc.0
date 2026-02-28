Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F36532695A;
	Sat, 28 Feb 2026 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772289818; cv=none; b=KHiRIj0cuhwpwqpcPA67zwzTJS5Rw4uQyHBbAFurqCpOTkWxhbwRR2d7mTSlvrFtgpwC57+R6nwkxlSls34AmxbGwWR0YI1ZkXFzL4HdWUrwNG4FK4Fb5lHU6a+ivjLqiKk7O5rNW/ZinLMFWbTSvpLyeKJNgQoayw5+7RMYAFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772289818; c=relaxed/simple;
	bh=CfsfHc2IZvizVqWXqW65hOnIoVPxOt9iivCaVzIk/Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LVTLXDfPTKO6zPFOan6PVe1Itwf9iDIcshvqWQtT1iiyUYoZXpaSlhOzizbkvMs4QVesDo219EZCTjVo+aHOKLpnzWuy4dYj3W/4gGdGgXW6R+jn7c6Elki5tcTA9PIktpqORiQeIX1AwHHFYsDAZ7Nzmxszjr1DLc39W6+mn3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+MolcBB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+MolcBB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3396CC19424;
	Sat, 28 Feb 2026 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772289818;
	bh=CfsfHc2IZvizVqWXqW65hOnIoVPxOt9iivCaVzIk/Mo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m+MolcBByd47Ey7eT4TjLfGewAgb47Al4Ru5uuvyAruYPN0bqQq+kKCrKljfm6gs/
	 kC+0DBIplXr7nrlYU5WFk+IPQZ98y73BCLdbUVjt4cx9KOfctQtVjcRgzPnW6py2rs
	 iVKEzuDd9YmD94q6HHQWeFTg4x6SKJDgC2aUPHdQqwZXzJ7d2pkgMwE81ywZoV+LWr
	 bhSEbiMd7hmsoFtRfYiVZPitrDdRRGkYo6WvnELY+GGyt7w4eN6qvywVeTZd9xYKCo
	 yTnwjRcVfIRSu38IUd3RN5mDTntkILKawTVmKLZlslXZyfl4xls5suhd+Oo9TnFuU+
	 L5zdka5GkPY7w==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	sunyeal.hong@samsung.com,
	shin.son@samsung.com,
	Raghav Sharma <raghav.s@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	chandan.vn@samsung.com,
	dev.tailor@samsung.com,
	karthik.sun@samsung.com
Subject: Re: (subset) [PATCH 2/3] clk: samsung: exynosautov920: add block G3D clock support
Date: Sat, 28 Feb 2026 15:43:22 +0100
Message-ID: <177228975881.54431.9547973271595973650.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202103555.2089376-3-raghav.s@samsung.com>
References: <20260202103555.2089376-1-raghav.s@samsung.com> <CGME20260202101957epcas5p224b18e84c561e542c39096b2bd7f29a7@epcas5p2.samsung.com> <20260202103555.2089376-3-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=570; i=krzk@kernel.org; h=from:subject:message-id; bh=M3/w8Kjaa5+4q1BF5CF5iRHUViQIxQUsXUslcUtgoRs=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpov8MKoFI6cn9WQaNzBpeerXBWEmeDuz0Frz2a bysmdIAUL+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaL/DAAKCRDBN2bmhouD 13dAD/sEl5lanhP3VthwFPk4bqJxrtZ+Cr9iyE3xQ+CvyagHWK+vu0GVWAqOK6h/hDeIzHjgQ1h O9LuN85PTNVa5DCPVy2BOm4hqNuhf1+jbptO9UslNExVYnMA7Ob6XSpmwvPBOkVWrbMHa48GoSs D3StuQdBSTvMv06FPesw45CJF7izooDuB7RHZMrnVJzyauKKr4Cte3UHZSBY+BsrEPUwp3mC6c5 eekGhTIT5kixVFMgMO8iH6igL9lgrrIv4zBuCiDhyxbat2Lxa2YgwY/owl3sEW741BbqVq6Qg0i biBPGeMjJwjxXquKIPY5VqgIW4elkUfw0RJGIPi5HlvOnqRl9PfKMqdHbIQcbLJQpLuQTENKKdP 0CC7AeKPcAkRVfwcANFLNIRB4LIW4/twRf19M/7KZoc/tmDGegJWooK7gXLCXou7xrCGL5qwy4r 0tHAK/U0UuvNfsMAKPiFK41ekWvSHEHjVa/wnxA7CKCCHXW9NPzwnloNUuXQZkC56s/3JIvQ7uR r1XvORtJkzi7VZnxOfmEHg1x6GwrVBElehHs9YolwHJQFv8z7P78L+vzo6YUpvep7F+9Hw5167m JvWO1KiLSTps2NCqQ6B2yl4WhvPndquM6zlPuPFw2DinfvFyN3sDMnW7I464hXudxX8sFuD+LiT rpXGjsnuPnWcaOA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Mon, 02 Feb 2026 16:05:54 +0530, Raghav Sharma wrote:
> Add support for CMU_G3D which provides clocks to G3D block, and
> register the required compatible and cmu_info for the same.
> 
> 

You have checkpatch warnings:
CHECK: Alignment should match open parenthesis

You should fix them before my scripts or my CI sees them.

Applied, thanks!

[2/3] clk: samsung: exynosautov920: add block G3D clock support
      https://git.kernel.org/krzk/linux/c/5e5f3286d66712fb49264da20e3d89534754d707

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
