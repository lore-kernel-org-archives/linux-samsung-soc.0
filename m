Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8301373;
	Thu,  7 Nov 2024 11:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977485; cv=none; b=iSXGjINEuqrcUnAavAQAF3yt26Yv0+aRKMYuglRRY9IKorysbT0SZx5qvXjVwr6GdvkxWicNYYB77HlNm2q8UFpRlWjNsNZJrACLWYfFUNm82Df1a3HywvCv2BlDEwg57yDn38TW5SUv5wzsdXclbzPOc1bYLDTWz05bCwToKa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977485; c=relaxed/simple;
	bh=SN9Z9tTftW7uA2bkhGxYG9pD4nR5jfCNfL9DniJw7R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nj8Y1jcgiloTvZgOcQE2wZ0ZOHGzod3GZhIwU3mUlPom7A0c1z4Wmb9HVVXSRBWsc7uggpm0K0ynUfkdM2GfDr+isI2yPR6ovFBm0S0t3Zx1rnStI7LQ293z4Po24G6x8sqPJxQ2HoQ3fkwJBhXwp2ARzIjUj3pQbAz8rMDl70c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nam3vrux; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nam3vrux"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CE21C4CED2;
	Thu,  7 Nov 2024 11:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730977485;
	bh=SN9Z9tTftW7uA2bkhGxYG9pD4nR5jfCNfL9DniJw7R8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nam3vrux0MA9w/zLBkn6wgOgOEcN2Wuz9kB8N7v83C5AMg2ogJ1Ph3rYCVbcdclMu
	 Oa9Bgtkt+yD0wehl//0x5C+bOxFw7r0sg9ynxVHR2er9qeOmeyN5VR5wLIAY39Lzkh
	 oNwwyH9ZupJ24D3EX4jIYUb+1gv/LZsTqxSsDIubsGpAX2lF/uyl3UwUvD75wc/Xw8
	 xqa92083KrbX4JJ3mETjgoAiQkD2sl4lesd4uLHnO13yRVmy219G0VHjI8xkH0PHGO
	 GVIofg1xa/XVE1EqR8IVYptmRcwkXT3cHxBHdybA6itIRzcuvfmnIm32wA/BgDj4lZ
	 ObA4olwc8LFJQ==
Date: Thu, 7 Nov 2024 12:04:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sowon Na <sowon.na@samsung.com>
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
	alim.akhtar@samsung.com, kishon@kernel.org, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY bindings
Message-ID: <jntmy3qlkz3nycfxdm7z2css2di6yqj4lyhtfwdkgyzhxk346z@xlyc233askxt>
References: <20241107041509.824457-1-sowon.na@samsung.com>
 <CGME20241107041511epcas2p285a5b52a6784e509977a1574f7c9ee4a@epcas2p2.samsung.com>
 <20241107041509.824457-3-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107041509.824457-3-sowon.na@samsung.com>

On Thu, Nov 07, 2024 at 01:15:03PM +0900, Sowon Na wrote:
> Add samsung,exynosautov920-ufs-phy compatible for ExynosAuto v920 SoC.
> 
> Signed-off-by: Sowon Na <sowon.na@samsung.com>
> ---
>  Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

