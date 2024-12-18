Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149D89461;
	Wed, 18 Dec 2024 19:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734549445; cv=none; b=m90fuvZEgVi3fWwYhkgzzmDFtsYlbURVsLns1vGPKvJ3j3m4TLtD4VvWk2PuedkNBmV4vnN6cPYsK3a030DsUZiNEmaX2WwTencCKrz5bl3MwdZixWYO1pPlt09ZH2SXqbL6U9TGMj+ti1VfG4SjEOrCOwtC744KG+epf35TK20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734549445; c=relaxed/simple;
	bh=MMgWmbqg6K+lSyt/F3/mvnVPj8/GqjrXyOQNEHr516c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWALN3l5KDu2c1iDRhRaW/0BGtoao6e/h3JtRg2wNioumxwQ1BYPxUcrakDmtfQ/Iu6VkoLgpeHu/jUScPC0xcwY799cVABECbQkuxRZquP+m7pAsI6TdZKX31aYD3JFkKw0G4Ckat7kDKZJZzMLiEzWfuGY0nAWJSCeLsPulBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZCO0kdc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZCO0kdc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D03C4CECD;
	Wed, 18 Dec 2024 19:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734549444;
	bh=MMgWmbqg6K+lSyt/F3/mvnVPj8/GqjrXyOQNEHr516c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZCO0kdcxw/9ayBBtj6A+YrvDLWywmSB2C6180mW9DTxuqcsu4OeNIsW8LSvURY1X
	 YtXAWomT/W9m5R2oB2N0mHq+2PUpyVVio0NwSIhErSVAKNusAP69lH8HSsDNlnwKdA
	 DMRdROeIsJw9fTpHO984NbJXYBRyteaSf2bwGzP8L2kIkXcng9oeQI600u1Gk7T59c
	 8DO3Kp3BFPhsuY2B35PunGtd91UzyPJECPT2LZ51/acwpOxrjOMxiyUVA0yT+4mFLq
	 zJbE0pGBQ7P/egJCub7l1JFOuApqlxL2/eYd1tOmy3JuAuShx/7/S5Qwn60O7v5aZy
	 xJFbWvpmcztMQ==
Date: Wed, 18 Dec 2024 13:17:23 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: devicetree@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>,
	linux-kernel@vger.kernel.org,
	Will McVicker <willmcvicker@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: add gs101-raven
Message-ID: <173454944244.2180961.12803549865520284851.robh@kernel.org>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
 <20241216-gs101-simplefb-v1-1-8ccad1830281@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216-gs101-simplefb-v1-1-8ccad1830281@linaro.org>


On Mon, 16 Dec 2024 13:06:26 +0000, André Draszik wrote:
> Raven is Google's code name for Pixel 6 Pro. Since there are
> differences compared to Pixel 6 (Oriole), we need to add a separate
> compatible for it.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/google.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

