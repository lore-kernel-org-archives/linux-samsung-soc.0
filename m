Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9217527B4E4;
	Mon,  1 Sep 2025 21:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756762382; cv=none; b=IIeiDrE+fpOMWCxyj5/CbuYHMC5J8eQHx5fmTr6nD9PdzRyg9bgefbTjhwN4ANvzggM+CToNjxSXxui51TNnP+p9ZBbgEIxcheHDtXu9wqgUHGHS9MSzv15UzwafuyOlp5GPdHjuKD1YbUEiZO5iVcY15LsaO9iXrxMys3iDV24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756762382; c=relaxed/simple;
	bh=/mIouZW3eukRsCBlCEfrv5lA4/NnpjfEvBd3Y1zXg1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=al7yLROurSbyoNp2HjMcQ6lp1M5BhFvWd0ewdUgjzNuMBTe2dPxsgVz45UrGWiqUNNXTbd2Y/uGNiLc8EFUDJcOQepiNsQ73YjYxBooKUOH4wfGLH/rwLgkPaFdnlKe6Iz7xcYYCnjr9cdGkW5LGmgo3PYZV3Gq30pmWROfPKNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LF3k2jGC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LF3k2jGC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6264C4CEF0;
	Mon,  1 Sep 2025 21:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756762382;
	bh=/mIouZW3eukRsCBlCEfrv5lA4/NnpjfEvBd3Y1zXg1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LF3k2jGCGKtYMmpW+BfplhnUEjcgeJc/QBjueCTInMmnaYkLovRGpztSPG4hgXidS
	 2yoQrDwQwm4eQZp2ij4SqD0E6SmkeIDVodXsdL1sQt6JRRVq+PbrYfhbb2itW2eKPa
	 q7Jm8LgYNdo+sztySd7y8KAkLSpzZGEHWpK41eZSA2v18dNaAs8w72a+vB5OrLfkGO
	 ePi8tyfAfE9TrsN6Y1oG5jt6Y4modQi98ePJZwKstOJ8zrMAs/EW+J2pvQHT6HM/1M
	 QHwtQt75mB4t1ZXGDaQo4Xa0NLosXQxTZBmLRvICWEjgpBEKA7YVd4O6Le0PEXtwI3
	 UoWxCFEL8TVYA==
Date: Mon, 1 Sep 2025 16:33:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: exynos990: Add LHS_ACEL clock
 ID for HSI0 block
Message-ID: <175676238020.380265.9436129584616218710.robh@kernel.org>
References: <20250831-usb-v2-0-00b9c0559733@gmail.com>
 <20250831-usb-v2-1-00b9c0559733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831-usb-v2-1-00b9c0559733@gmail.com>


On Sun, 31 Aug 2025 12:13:14 +0000, Denzeel Oliva wrote:
> Add the missing LHS_ACEL clock ID for the HSI0 block. This clock is
> required for proper USB operation, as without it, USB connections fail
> with errors like device descriptor read timeouts and address response
> issues.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  include/dt-bindings/clock/samsung,exynos990.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

