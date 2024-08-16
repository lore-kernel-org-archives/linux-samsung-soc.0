Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F0512C478;
	Fri, 16 Aug 2024 22:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723847728; cv=none; b=I46aRp1qlIWMWSax30xd3Y4IWOu9ls4u2WcmVuZhP9ZrWht+V+SgH2r0DtSt68b68+D/INywRX7kNLsMU6Jcz+i+92gH98WNIyCKzVeU/UUwgevOfOBb2jbXgRsNmudPfy73DmCRogOIG8HsjM31fPujcNVfeR21R+rXJhUsNiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723847728; c=relaxed/simple;
	bh=ZpURkNGLjZcch2KIiqIa70/RNtpmwkxMErm8qyGuQFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8ipEl0bG62nxIp7gPFPnaqWxb6RXqA8f3/fhgqWv1qSUt3KXqz3vfKE8Vt5H2tVroDAKFS3RnveGF9sVoIQI5l1i23dNJyjZF5sz1ouveP4ZmdRLOx4dVqN3WzU15fjLnJjEye6ZPGflrkA5kKqPXiSdGkEP62NMAVctzi3iIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYi38Wfl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYi38Wfl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF39C32782;
	Fri, 16 Aug 2024 22:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723847727;
	bh=ZpURkNGLjZcch2KIiqIa70/RNtpmwkxMErm8qyGuQFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYi38Wfl/U2v6Jbjh7y172hdiSELq5TqjuQoewoMF17UnTS/swFCZ2dA+QseFMNqD
	 9sXeXhaAKtbBJ6bjy0PtSJIzLnrvTJXQl1dUbFe6tPb7Tka+W4aOuUtOAbtubY8arW
	 dM302WQdKBgBR6QHFObHb07z/FxZPtmuGANmKzkkHflAsIlJS6oAuxFlX/9qQlTXpq
	 0gYfLp9yG8phFst452Xj9kEeH6+c+KtPB0Hxg+7cyvB186aeJ/Sq8Z9Uo/0e7EGfEX
	 bfkVvRUpeskCUpedUXUKIpnZ1vFfN7yzZW3IWP9LJ4/BjYf0E3HvRpxhh2TOuYwrjM
	 MwOikIp/NU10Q==
Date: Fri, 16 Aug 2024 16:35:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH RESEND v2 1/6] ASoC: dt-bindings: midas-audio: Declare
 required properties for GPIO jack det
Message-ID: <172384771813.2392611.5123924124525265715.robh@kernel.org>
References: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
 <20240816-midas-audio-tab3-v2-1-48ee7f2293b3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816-midas-audio-tab3-v2-1-48ee7f2293b3@gmail.com>


On Fri, 16 Aug 2024 09:50:58 +0200, Artur Weber wrote:
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

