Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC621A2C32;
	Tue, 13 Aug 2024 17:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723571543; cv=none; b=cY68dWpOHmWzcUn0QvXxhLLNh5Cp+Fvg3xA0u33QslN6aluqpIk4PJrESho2e9TnqfgDcYbYBucgQVI8fVATEObNCVNBrXVmNMIvVkpt8U9BGK/JnDZeimlSPF9PCi7yDqmjRvBQ8rb9QE1/cQnUJkJVKcyeUGFhwOkRhA69S68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723571543; c=relaxed/simple;
	bh=Oe5z5LkDIr2zVx0oWyh7rj3ht1SfvfAh2izgbldWFJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LK0QyxO3qjHw60JnQapmqQPgAexVV5SxEU32SE+RcDq8NOwE60ApqNHNLRPNdAC16CMPaRP7iEZ5x8sZT9mdqjw5AjXxyapA1llty3tdxBEZURVREYFYMpEj3sB49AXOD8tU7G5iKV7W05SOqQk6a6JaxHTFTKvr39mllNtvVbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmO5sP31; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmO5sP31"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD02C32782;
	Tue, 13 Aug 2024 17:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723571542;
	bh=Oe5z5LkDIr2zVx0oWyh7rj3ht1SfvfAh2izgbldWFJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmO5sP310srVktWcq5qdqGt4LsagoqbjejOIBrQWXqwVHPMAkx31EYWeQ4/7dKYO5
	 0mrr3jxfHQwdEZhCPAfycenpgJs3IYaLRB8Ex4/oagdpKG4EkmY5MXoZbT4ruYwnoY
	 yPlBWeYDT8r3xhaLZrHaDVzbTYKll7tW098BhyixzzBwYjO75VJhgtpb23OGjCNXpw
	 OOk+15f9fTgXv6K8r4aUKG2Vjo6eVJ+LZuAcLyK0rbNHT6JbqGfdVfcT6rkaJsgRmh
	 94ocvDyNJ4DSF2/Ni5Zi7hox759giOQE7cH0NWl3FCLp79qyqOXjlwAthM3S/AH7RU
	 jj2v+uHVlE7jw==
Date: Tue, 13 Aug 2024 11:52:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: devicetree@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 06/10] dt-bindings: pinctrl: samsung: add
 exynos8895-wakeup-eint compatible
Message-ID: <172357153964.1414843.13183785127047787978.robh@kernel.org>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
 <20240807090858.356366-7-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807090858.356366-7-ivo.ivanov.ivanov1@gmail.com>


On Wed, 07 Aug 2024 12:08:54 +0300, Ivaylo Ivanov wrote:
> Add a dedicated compatible for exynos8895.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

