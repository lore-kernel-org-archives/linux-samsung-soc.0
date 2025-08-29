Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107C2322761;
	Fri, 29 Aug 2025 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756481208; cv=none; b=AUTGGK3ys6NMU8FokxCx0hkpUXUUlEr5IqQt+c7X1RY37ZO5vCs2Nvh9YIyw3h6pgIDUG0KJ5eq4bud0E7fhq1Xoc3MHoPRzKcM4+J9YphCZdHkRDwlKmemyrDSFK63g7/4Y8sB7ysDM/NrD1kS1fMYg4ayhyZsa/q/hItigsV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756481208; c=relaxed/simple;
	bh=8/whQ2AYGJljhj+H+joZZMEKLmK5unw1799A3xVGcIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c38Q1WsSqtUnQ8icyeK8+Xj4OMlho546l9nEgBS7gsX3dPfjDwxBcm+w31OZOCprTDye/F6fTXrhj9ELNAQasITjcQL6IzU294sRfXG8suG96iMvgorxsPhLYxMWL5V75zaQxTfnxVqEX9Cqn9LopVRNDsTtu94NLBkBde0pPY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfcwL2rt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfcwL2rt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71ABFC4CEF0;
	Fri, 29 Aug 2025 15:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756481207;
	bh=8/whQ2AYGJljhj+H+joZZMEKLmK5unw1799A3xVGcIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mfcwL2rt8JmlBQR3w0v8OzXYtdc7gDtGwxPSdcBWiH9yXWpruV9SaRuR3IWQVh1eu
	 AUpbDreOMtWR56T9K4ytAB8wq21sTZdZ0W811AF6EiEFJy9SbjBD0Afmkg/iwE/3uO
	 N8/d2wUMVVol4KMsCa6S4d7f0Qk881HBL3oU1hi1HLsm0dfMacgSKSXwvj60xzFBpl
	 zMcMD95kk9uqDtPJZhES+9J9ZIRpQjYQZ3TLGO38u56nPYe8rOcVmlis2E7CseUO3I
	 NfEkdSDKuwhTjm5Pfp11di3jb1AplQgjI3+ayKgm6XaHd29dyczmyLjsnf8cYK/+oG
	 24jaRn+OlYSkg==
Date: Fri, 29 Aug 2025 10:26:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>, linux-samsung-soc@vger.kernel.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: exynos990: Extend clocks IDs
Message-ID: <175648120535.809657.15013555721063898358.robh@kernel.org>
References: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
 <20250825-cmu-top-v4-2-71d783680529@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-cmu-top-v4-2-71d783680529@gmail.com>


On Mon, 25 Aug 2025 05:51:16 +0000, Denzeel Oliva wrote:
> Add missing clock definitions for DPU and CMUREF.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  include/dt-bindings/clock/samsung,exynos990.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

