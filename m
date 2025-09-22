Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C154027B340;
	Mon, 22 Sep 2025 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555672; cv=none; b=CBaLF6SLdBRPEXyySi2senbi9qHEDDLDKLPDCu4ytC+8OgntD+aIHGv9ov7bs3NoFGsBR7vKsizJgs2csBZ4ALPrzUhTGje2Ljmk4fq75H6dwmcUqBYfU70sVtxuSOrIxmr8Fo696FIn6mkI6naSH3enbqv2nUMHVxNAcE7JRPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555672; c=relaxed/simple;
	bh=NjOxxgw2G2HtP4z+tFDKo3O2KiZzVADLJNb1vGrq+zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIxxQEJ1ld2lGWzwYmm0Q41ALJrwEp8W9HRxBh8H1afY6+IdrVLrko9xiYXeZsigPuH3bBHCsFn2v2A6+iAH9nVKTYQt+k5u4HitMEpswWn0J/xpFQ9eY7PSMABRgSHjA0QDPqFuMa/tJy+vCFz/ihxNwTmEPNlF4CxM8dItJx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VA2s+MDP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VA2s+MDP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27802C4CEF0;
	Mon, 22 Sep 2025 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555672;
	bh=NjOxxgw2G2HtP4z+tFDKo3O2KiZzVADLJNb1vGrq+zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VA2s+MDPsMa5SPyJHe17nMnOt1oqosfBHM2Zc/RjmVhCT+8m7O9M/44hd6Uym2dtK
	 xsrVfRYPjd7ETzCCuujgOcZY62Ei5RkUfXID33hB51OaEaQd/U2xigL+re67jqY5g/
	 GLMI4kDmC8YRrB5n3iy9XokE8t808gGMguGw6li+ktkarZQV7sODbVge0nEcS6h4sy
	 mCNgZDr7807xW+HxT0Z0VlH2OEszwlP1WT5XrzQi/LFJ/2yVwRWWbtpdN9ZqnTwLPv
	 BsXhziJ7B/DECiizElwS3BHXOx7BGMu+NAuN5aj0VRXpim4cM0TG3Y4+Jc+zl9+3Wr
	 t4CxkqVKK13CA==
Date: Mon, 22 Sep 2025 10:41:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: samsung: document herolte board
 binding
Message-ID: <175855567004.25808.182745298436415730.robh@kernel.org>
References: <20250914150321.2632019-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914150321.2632019-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914150321.2632019-2-ivo.ivanov.ivanov1@gmail.com>


On Sun, 14 Sep 2025 18:03:19 +0300, Ivaylo Ivanov wrote:
> Add binding for the Samsung Galaxy S7 (SM-G930F) board, codenamed
> herolte, which is based on the Samsung exynos8890 SoC.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

