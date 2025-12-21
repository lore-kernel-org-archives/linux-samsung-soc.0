Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C862FBDED;
	Sun, 21 Dec 2025 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766325170; cv=none; b=KIbO6MtatkLLKDkcGAFLBbPo39bT9hUy+cEOdM9lGv+dUoSkJvSt9XEj6Kaf1DuafrYxZFFjd0Yi2R6m85QqZ21GE411VPsnbBCuQrLHzgrhAk8KVKg9Um17gAw8Cfd+uHdmgbOGkTcKd/D+E6CHgbJmKRmCuG8ZgYj5+My1J3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766325170; c=relaxed/simple;
	bh=2iOX+VikXxGI+1PhprdHaR31tkLCi6+pn/g3cPCvssM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZcGlld/2XC3Nukog2sIgzDwWORH5Qq4zn3CCSjU9WsTqT8cFbfp3Us4I7I4RJt8h6q3SXle/La3NKvbfombIsb3jYT/WmE1KXJqUwOEVFSwAY9Ss9xNkrTzMPkKY+XDM8QRQhKserIJ/uIaJkziDZv0Sqkuud2MA77Qp0rJQRew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vNiDm+7K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vNiDm+7K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085CCC4CEFB;
	Sun, 21 Dec 2025 13:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766325169;
	bh=2iOX+VikXxGI+1PhprdHaR31tkLCi6+pn/g3cPCvssM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vNiDm+7K5mClmHKCcz34ynTWcsqeGNcH1bEL3L4m7Mh5VJ2csTfbSEfs2xjjqRMYd
	 EDElZXdPz1Yd4fveF+Zj0zULCgNgbrWE8JkUOgH5iQWko16iTQ8q0oD7JFNskD9RqJ
	 OoelyRULKjGujf4jnGd9vj5JLv3nwsKFNTycifvwc47+ET/KmbBldmcfONgQPRCr5Z
	 w/u6740Chow9U8V9KLd7BjjVvCHc9yWd49AOh3LczipyEevSOUqINgiflqNM3hJ+Zl
	 wMbxyKJNlHZLyiht2+STeFTt7tKq150dtc0/imsbSDi8PGOlhqKrIc/Bh46xn9FWO4
	 iM6QGSClc2xcQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, sunyeal.hong@samsung.com, shin.son@samsung.com, 
 Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20251119114744.1914416-1-raghav.s@samsung.com>
References: <CGME20251119113922epcas5p1f9593dbc6cd51d9fa04613d9120eceef@epcas5p1.samsung.com>
 <20251119114744.1914416-1-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH 0/3] Add clock support for CMU_MFD
Message-Id: <176632516371.32657.3772424458194925472.b4-ty@kernel.org>
Date: Sun, 21 Dec 2025 14:52:43 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 19 Nov 2025 17:17:41 +0530, Raghav Sharma wrote:
> This series adds clock support for the CMU_MFD block.
> MFD stands for Multi-Format Decoder
> 
> Patch[1/3]: dt-bindings: clock: exynosautov920: add mfd clock definitions
>         - Adds DT binding for CMU_MFD and clock definitions
> 
> Patch[2/3]: clk: samsung: exynosautov920: add block mfd clock support
>         - Adds CMU_MFD clock driver support
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: exynosautov920: add CMU_MFD clock DT nodes
      https://git.kernel.org/krzk/linux/c/abc6930a3150003e1a436e906ffd1cafd679acfc

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

