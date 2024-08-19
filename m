Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533C614AD02;
	Mon, 19 Aug 2024 17:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087603; cv=none; b=k797gdUmx78d6nSoaCHRgP95BxHKIbb1e+CiCOWC4hEg17WjHsey8puyB405aASsBhu/2Tu40PxBnOdib5LqyAO1l0WM3+3pbk7UaQJiHigQglrZqABKAEtzDdoLs/1ChpVNwEsIH5nwz6blGCfeT9sK5pvHuZKnhafQNmOl+ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087603; c=relaxed/simple;
	bh=0AQJYAlIXcbZMvtZ4xKtLvaW0+JduxMJ8a48jn1+XLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kmj1XshAaH6vgfFXunbMLcQea3PctuMVUdxQOP0D/aTLMQwIPDk/guChn3Q8ObomPZlGgz8TrSFv6XndY5NUHX9WLzjaW2+N2NiyqHVpRe3lNkeIlS5wy40lptbZkPAzcTKxcb3DmInRCyPTbZKGllCNlZ4VM1UulxWgLZaMEHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QD+Lw64I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QD+Lw64I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DD5C32782;
	Mon, 19 Aug 2024 17:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087602;
	bh=0AQJYAlIXcbZMvtZ4xKtLvaW0+JduxMJ8a48jn1+XLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QD+Lw64IyUoJp6VBICF09TH2b0GfXpIJcA28OD1nPRIXiis7QIG8CdNTXNM34eY8A
	 ry5tK+jYjdOpyJaUVEmc3aP+vtiI1DHyvH6RwbK5OfdLTlZdMQvOOCyCXFoMS7FW3c
	 JTJ+TinmjOGib22X1WtzSmapoaArITU5r2rRnaFrUjhk2zpKECOwv3X00erfUFRapw
	 l8sQ5ot/gNdAnj3n2+8/twPy7fVIX3+SImNW7Ra+LDNKxVBBuBknK4ra+1SYpxTAla
	 7BF7hOfNduMyoTs8mi9WmcOpK4foSRHweCDKObYCLJyCa0i9uvVkorG8iFk5BcbWpy
	 qjmLaCnuAEoeQ==
Date: Mon, 19 Aug 2024 11:13:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: samsung: exynos-usi: add missing constraints
Message-ID: <172408760022.1695969.194946037824659519.robh@kernel.org>
References: <20240818172804.121666-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818172804.121666-1-krzysztof.kozlowski@linaro.org>


On Sun, 18 Aug 2024 19:28:04 +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for reg, clocks and clock-names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/soc/samsung/exynos-usi.yaml          | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

