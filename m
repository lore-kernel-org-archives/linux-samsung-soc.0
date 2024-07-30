Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5C118C90A;
	Tue, 30 Jul 2024 16:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355552; cv=none; b=aWR1N9Y8pGkG1ARQtTpqFYsoyYO+nwu0R1Uw7Z7iaUTDgsO/dnmGU5WmTpM+8zhDOFScBlD209/Pd7cj9rW0Fj9rbJDD9KFomw3xPsUWYRPJOHLmSQSJFKEVyyjtEIkkB3Biho778b7wyXzLr3kp+eo7qPBIrHUtUEN2s6qRAdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355552; c=relaxed/simple;
	bh=Qq4cIGCXDh2lCOJMlmk1OvfCfZco3YFbMj6QxF0SzfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ov21QdnvoXRD6NUpwOVzmIfHDbvx8uXedMCSnFym5CyG+LNA0ZJ318N7kKyQrDaV0DhV2U2L1oJ/gr1nBDDW+nNdzciOIQ8uFTYI9bNiWTPjyjucycM9jt/Vh4f73sNr9NtWLcqSeSacqOnRwshvJ6hHEYU3tOHgxEhh/IM3aqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6QCSg+4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6QCSg+4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428F9C32782;
	Tue, 30 Jul 2024 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722355551;
	bh=Qq4cIGCXDh2lCOJMlmk1OvfCfZco3YFbMj6QxF0SzfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c6QCSg+4x18p484wmRyrM41bdD+jhi04Xo/tbSIwnXSQ5uSXzlJsrANimx2yfguA0
	 ipXwB3I+9SJdpLh0LYQby/VUUyd4oegmM6PvhdFGd0Dl4fuvgmJlOqsszhv6AWv0MT
	 tu+/ADam5QAPGFoAbRazYiMb6cRoIRx2KoJMGeW8M15yVIxlQfi0Oh2lbR0Vw35h1i
	 UqIhrm/8DpsfH4X1dDr8MeDIfBTs3thpWxbpV0eAZqirjIyh9ulU2e/aO5PJY+Vz2h
	 wKnJ1pFRdIJMd1e9bqGeFiWc9GE4BdxNrvrnagiJgS4jgQ0neMtMYx/jiFTM445Uck
	 csph42jGamAJw==
Date: Tue, 30 Jul 2024 10:05:49 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	~postmarketos/upstreaming@lists.sr.ht, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/6] ASoC: dt-bindings: midas-audio: Declare required
 properties for GPIO jack det
Message-ID: <172235554875.1349313.9208770866983277057.robh@kernel.org>
References: <20240725-midas-audio-tab3-v2-0-dbc055c27879@gmail.com>
 <20240725-midas-audio-tab3-v2-1-dbc055c27879@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-midas-audio-tab3-v2-1-dbc055c27879@gmail.com>


On Thu, 25 Jul 2024 12:40:35 +0200, Artur Weber wrote:
> GPIO jack detection requires an IIO channel and the detection threshold
> to work. Explicitly declare the requirement in DT schema.
> 
> Fixes: 0a590ecc672a ("ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based headset jack detection")
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v2:
> - Use anyOf instead of oneOf in headset-detect-gpios/headset-key-gpios
>   if: statement
> ---
>  .../bindings/sound/samsung,midas-audio.yaml        | 29 +++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

