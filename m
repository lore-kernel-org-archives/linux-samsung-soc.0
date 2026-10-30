Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793376338;
	b=OKghpKP/8FFRLeFRmXOYS4x003vSe8NTU4gkNtEB3Grx8skbaB7z5Lf+KRV+JtxZxE0+
	 k3KZYC9zdwCC5fLurKpc2XRJSIpLhstCM3wr3UokQUUZJsVx2VWRrRhDFFEbwH0jX+aGD
	 6yw6zosNNLX7ow0c7DabNfYdiRQWlRXaRjfVjxFDJIjwxlbbFmRff4iPKuurxHsvskV4T
	 QiZO9A03rVdU6pXNZY0AoXn39ige7uTXk2wfJft0buouYifZP5+b6rlsM2yg1Kb7z3ke+
	 9WpxZ64uRmeD7T+rIkdHbmaBrV0CO871dwvbHi2kKEfZntrHaKqIKwtYtWRRXjEhC8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376338;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uZAzQD3NCDsQzqPuFgmDjjdCBahkZSM5RmkMZCYlJFY=;
	b=bF9xGNbnsQWRODGMrpR+P0M0eTb7uMmhk90KskPB+ndp/FcyVR+mdRXlror4EpTLIPQ8
	 oec/ALoLCKSkpZrqN+k0co2wkPH8OhwYSY+M2zH1tA5lOX3m9fidz8K+UTt0zz2r6IvFz
	 TNfJ41SxuNrTaY94w2V2WYhNQ2b+QH7RlFGXUoKFEVINLYBa7SXndM6kaYsPlUOwQZPyV
	 xSFbtkrYmZoBPh/6gLks64O58QHo0JLrMRES4P4pnN1Cx9E+6O1D9sLW/ZGi7SLQR8Qvk
	 mGpPLIvtEVNjqxxRKXAm4MsZaNDH+8d3QpUwh4K3KCcxFrF1hgL5LKII2GInK+ds0mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ys2DVtay;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB423606A324;
	Fri, 30 Oct 2026 16:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ys2DVtay
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1411F00A16;
	Fri, 30 Oct 2026 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793376337;
	bh=uZAzQD3NCDsQzqPuFgmDjjdCBahkZSM5RmkMZCYlJFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ys2DVtaykIf8upzP0HOwFZBGfM5HSojAz3l5DKgLslNcPrc/7pNLi7vNFgzr7i1Jm
	 5ROTY6NM1BIgESdijMBa/EapHHZTPw/ECqrYPsH4QN+rZKvMvOZMlOS4SIO4rkNQjI
	 re1J83gjGakCLNjCg8HIIWV75jROwz2EhT8Lxk6kQkOFx0zsSrtrOSVwqjp7fyTHwz
	 cX0xoOA3ITXuwSELry4Ev+e3u+T9sgblWOZkmIs3+5ScjfXpNlXazGMAIuppUwXTdk
	 5IWWdFTx89M4oMiXCquasqA5593n/wQLX2W5KouPT7VECh1V4RSwxHF5bVWuOuCWtD
	 DWKEpPo8vlTbQ==
Date: Fri, 30 Oct 2026 11:05:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: samsung: Add compatible for
 Exynos5515
Message-ID: <179337633410.249047.14547696442462866080.robh@kernel.org>
References: <20261020-for-next-lucky7-pinctrl-v2-0-b6b0e6065452@member.fsf.org>
 <20261020-for-next-lucky7-pinctrl-v2-1-b6b0e6065452@member.fsf.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-for-next-lucky7-pinctrl-v2-1-b6b0e6065452@member.fsf.org>


On Tue, 20 Oct 2026 01:02:34 +0100, Aiden Isik wrote:
> Document the Exynos5515 pinctrl compatible string.
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

