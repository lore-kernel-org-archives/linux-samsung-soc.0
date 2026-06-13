Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C4A34844C;
	Sat, 13 Jun 2026 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781344925; cv=none; b=eqDdmZ9TXxFhptfbozER1q+0tnCE1bDTYOOq+rPEwij2qg/T9pa37W5r2v+OXcGftY2boU34+VPO46Qhpd0f0Mw1BGIUh7EF1dYRt0dcSAmBKkIt4xUGH02688qZIuZJlx0idKqng7m/d3V1UpKLkBOsud1Xa03gmqiO/FUTJbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781344925; c=relaxed/simple;
	bh=NEysZ/0DkPd0piQVp3pbkXyZYXB1A1PGVxjA1JGEr80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIX4Lr+lomnNBBYM9wWZqZWG6RGli1J0Lh/VLAXxLeyjqQYc/4PjM5ygGiT+QsgU2bXw/fSnqCdiDK5VPUV9zJRrsImHLHQhiNj5WqLE/E1sgM61kvXVAkPdwI+thxekBVTucmKFVe1as7+5Z+zPTFWEYzpXQobPQIC1mYkzdCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KU2bo1eM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KU2bo1eM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1B51F000E9;
	Sat, 13 Jun 2026 10:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781344924;
	bh=NEysZ/0DkPd0piQVp3pbkXyZYXB1A1PGVxjA1JGEr80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KU2bo1eM0fpUY/PBLY4g2BPfUKFqpCvImfjVsrxfZDWtXke7DFuGz9lFbTA+CNYUs
	 vqqcwysVNVXExzw2+87SAeHl44IgIbBtE7HotGj901wuVU5ZJpMlPlyrjJVpyRaI5i
	 INtwMpleAmsLA9UrFrrlIvKQzjQPivvSlRYeABoyW5GxL50HKvJ1cD3jfwVbhdiUoH
	 LWLF7eYoABZOEhicCISpJ3aZpbOHJDpwTtAb4nT94aa1dgV78MaxjG32UWLjV3hYut
	 wRsXafN/UMsgIZlYv1OF0itr9wvB+eXnrR/XP1eLLvVReyZ603KZu5LtZoGXqTQ4yS
	 XqNNzw8LKLFAA==
Date: Sat, 13 Jun 2026 12:02:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: samsung: exynos990: Fix PERIS gate clock
 parents
Message-ID: <20260613-hasty-lynx-of-examination-2bd8c4@quoll>
References: <20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com>
 <20260613-exynos990-peris-fix-v2-v2-2-3dff7ade75b3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613-exynos990-peris-fix-v2-v2-2-3dff7ade75b3@gmail.com>

On Sat, Jun 13, 2026 at 12:19:52AM -0500, Denzeel Oliva wrote:
> Correct eight PERIS gate clock parents to match the hardware clock
> tree, reorder the GIC mux parents, and add the missing TMU_SUB_PCLK
> gate.

Separate commit. Fixing clock parents is something completely different
than adding new clock gate.

Best regards,
Krzysztof

