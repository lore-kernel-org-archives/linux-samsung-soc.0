Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5871F9F58;
	Fri,  3 Jan 2025 19:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735931333; cv=none; b=RzfbuV59R5AC0/DLZEZCuAnICfx4kuEAYFId8OgT28HNQzb+fEWn/h1paVuIx75JPOhX9I0afu5Sa3NBOffkTRUrjeJQC+exaGAoOThe5EbN5Tdk32GI+JtYCmhbyxzL/CxRB83+UsRdtUWH5eRjAHS/4+L7gKyRQZDTPMqyqKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735931333; c=relaxed/simple;
	bh=v5wF+YQohzZ0mdJx4XQP5J0oRgHYezO5srl/b5e8OME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjuiWL3jVOED0+ARSdG4Wza76yPl3/Y8WfLRI/27JcZpiF6ce345PS14skuAuDY83+1vlbx5TqUqtsmGJ6084lluj79x5bs1SVeE2jYFFER+WGSui2omnBD0/Fm4Lt7fFqlzyYFLraBHkZcie9uIa0nDOhw9a/s1ojZskQnAaWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYpYrA82; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYpYrA82"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2A3C4CED2;
	Fri,  3 Jan 2025 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735931332;
	bh=v5wF+YQohzZ0mdJx4XQP5J0oRgHYezO5srl/b5e8OME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WYpYrA82uwU6Y8B/cQeF7Y5cZEwRwY0Rbw4uhWQQvihYQ1pAlLDe9f9ZNfqCm2uxe
	 6iiM1kn5EORrc4E/Ef6cvSWgw4WncDBNiPPEGe36jEFWnK8dKS7GDDKTmYGt7BfO4h
	 myx8EEElrri/EC+u3Tm41q0rbDxKoosy2G/0BNQGow0tkvDKH57p3KR+nyEVden4WK
	 fy8YCz0IWVgS2/RqWz2EXBwpHlPVFjbEKIkblX37Mh26yo+yRzjo49PLRtDOKW2Wvo
	 bUI76+a4aJxIycdU4II6L+0mUMuLYDO6BTB1ns/MmORKfWIp2vFJPLVD0hywaf1pNk
	 mojrMIy/RiWSA==
Date: Fri, 3 Jan 2025 13:08:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH] dt-bindings: samsung: exynos-usi: Restrict possible
 samsung,mode values
Message-ID: <173593132982.2620574.29762646865027511.robh@kernel.org>
References: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>


On Fri, 03 Jan 2025 09:25:49 +0100, Krzysztof Kozlowski wrote:
> "samsung,mode" property defines the desired mode of the serial engine
> (e.g. I2C or SPI) and only few values are allowed/used by Linux driver.
> 
> Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

