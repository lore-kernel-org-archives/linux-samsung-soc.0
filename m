Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08032BE65E;
	Mon, 22 Sep 2025 15:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555588; cv=none; b=V9bWe/Iec5s5mMINAXOgCMVnXeHQT1byWetc6fDRYJiFzou8+sxDpga04HOEnK9nNSg6J0HxMnduDLYjNNZKuAKqgUId+C+W8Tv8TMMR/57CZ3tyC/7LUqgoHojgEI26eFLFynypKX6Ke1NPdVv7rDc3i5NZGcLYVG6I4NQQnlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555588; c=relaxed/simple;
	bh=qt/kA1T4RthN749DKajewkWwaLQT643I7MIDs/gIiDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlmU3w2phcUxFjWT8NC2/LIPjgHH/Hhl9XXrJCpzRTP97PxpVHj+Z/RM96AhZhvXBgEwyegJhUFsX5XDecumPduM6zmABcEZIOUegaaCOFxML34sF2TAKJNU9tpMBW+wpYDu5nZFhqngrcR+ddVYr+inYBaWT3Zjfo1uLgRXFu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hepOYmLK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hepOYmLK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AA6C4CEF0;
	Mon, 22 Sep 2025 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555587;
	bh=qt/kA1T4RthN749DKajewkWwaLQT643I7MIDs/gIiDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hepOYmLKgWTZe3sA+0k35M0JDFvGh1YEQQJvG9SdVSQBeGggS1L+vwe60eKpgRzp9
	 Ow51wtB7UOJH2aufzcHo8A+vt+3YhDitdTFZM/pOYMvxoX+/76eefa0UkLxqCFk71l
	 BstznjkApiY4iFQjX7uvQG0nPezJUs2CRSxPQ80Xm1sEe3kLppg3Dq6G9+B0roNUTj
	 R1Az3GTGwg1iViumE/Y6uzN9AbvgLOfVwgroLbc5umfFxGNwMgBAoLAyvCmCjV5UKR
	 73mwOTi7BhHrAaoDdO2FaaIbAqas0DI4mIdEzSG5WnC4rZu/tAAeUBdAcHRNLXkGIu
	 Xqvksm1yRYfUQ==
Date: Mon, 22 Sep 2025 10:39:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, linux-samsung-soc@vger.kernel.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: samsung,exynos-dwc3 add
 exynos8890 compatible
Message-ID: <175855558581.12939.8168520447983756833.robh@kernel.org>
References: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914141745.2627756-3-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914141745.2627756-3-ivo.ivanov.ivanov1@gmail.com>


On Sun, 14 Sep 2025 17:17:43 +0300, Ivaylo Ivanov wrote:
> Add a compatible for the exynos8890-dwusb3 node. It features the same
> clocks and regulators as exynos7, so reuse its compatible.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

