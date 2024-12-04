Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC0318C03B;
	Wed,  4 Dec 2024 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733301656; cv=none; b=ojQ2p0Lu8hRskbQEufKcGPEHjC6KED+ykrTP1RzdEZLSBoUkYX9CmlplQY1D2OmOPHRovoOPR+9msLYD/dpissuYOYoZM2JrdsaG4JZouJ4Ef5V2mv/ovmEwcHcd/RUb6FX9Yn06MAFdQwJgugdy7BeP2OaPqnmymLthxZFm/aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733301656; c=relaxed/simple;
	bh=fkfoj+pgudhA38FUwobh2PpIVHPT/yT4qHHxT/fMCn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jx8fRflhw3DcHxGJKHfXh5bAMZ97UBeaiK7DEAapnN8XmoZjZ/HfM5mDYrV06C3h64MRN5FGd/z4ZcIMJKsiQgjccoHHk4Pj82tTXXalax9ZgqYPfTyqrOAUrfZnfuN7OBZPA3Ca9tF6JCIWmodZ9ue7VAnaasbjJJT8I7Q8X+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxPkaIPw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxPkaIPw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F90C4CED1;
	Wed,  4 Dec 2024 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733301655;
	bh=fkfoj+pgudhA38FUwobh2PpIVHPT/yT4qHHxT/fMCn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxPkaIPw2wQ9SXnEsHBeUpencemRB/jkmhd+lpvcgVcCEe9ZXfhmDOclwJf4yltMF
	 yQv7XefvKEyGWfVhft4IBsxsRzMw2CMCArXfEN3fuKpmkbBGfZwN31AugbVG8eMHGL
	 mG+XoOtFfwgXxoNRujsi8k0uuPoGA40GekrPcm6TQJuh7puaTIOqYxo89rXwW/losJ
	 VlfwYjRgu5hT7WJ1rRyxMmALVHkQUOr4+oRwbZkKj/6gP70DTxcQG8ijgEyRz4TPc1
	 GZrsvJKT/ufxVMvNrS//ksP5rxQzZJg1FVHLDYZREvD233Aie5/d+73WrKwg0WCdII
	 1qGerqiUblLDQ==
Date: Wed, 4 Dec 2024 09:40:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: soc: samsung: exynos-pmu: Add
 exynos990-pmu compatible
Message-ID: <yqdtp6gllg4x5a4sysmgvgyd4y6z6h6ly556bzbuafkkaba3e5@pgnuhlbx7e2j>
References: <20241203211344.515431-1-igor.belwon@mentallysanemainliners.org>
 <20241203211344.515431-2-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203211344.515431-2-igor.belwon@mentallysanemainliners.org>

On Tue, Dec 03, 2024 at 10:13:43PM +0100, Igor Belwon wrote:
> Add a dt-binding compatible for the exynos990-pmu.

s/exynos990-pmu/Exynos990 PMU (and here goes explanation of PMU). You
just copied subject and basically copied patch contents which is
obvious. Instead say something useful about hardware, e.g.
is it different or is it compatible with anything?

Best regards,
Krzysztof

