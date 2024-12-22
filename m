Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B8416EB54;
	Sun, 22 Dec 2024 08:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734857286; cv=none; b=KXdpYu1RCqoJLQmVNjpDTHm8hZDLODnedMu7kZPfQMIl7xr8LQZNElDiMpAoPZ1N2oYlUo4Y5+LSktJpSn/YFab2SWD3eVWxMJaciRnO2VwM3jy0A0CB3pxffYwp102HXRFy16sUwwjFw5EVAqiBLQzVWhw3tx+b6p0bmNA5eS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734857286; c=relaxed/simple;
	bh=QiorQma68E6gCuJ+xks+0bz4YOMbtbMbQiLIWs8dXkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcxLydaTh0XvxaiwBEgSai2fhQ7yaocPatWLp/FfBytMV5lUDl7FDNEk9ShUy8HaMgVKSJkVH7wEuezGbRNmMd4pqoF7D2nUwWsD97oXLS5CkGxEHcBwfA86FhtMrYBNfA4WSPhhDqFghIcm1vw65OlIZnaQQwumkf3KRgz8nxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByUiXJ0e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByUiXJ0e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69CBEC4CECD;
	Sun, 22 Dec 2024 08:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734857285;
	bh=QiorQma68E6gCuJ+xks+0bz4YOMbtbMbQiLIWs8dXkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ByUiXJ0eCep3AWjx57Q4i43W/YdXCykCwND9QYUzphczBPvD8AheXgC7yZWLSj+Rc
	 ZI6Oyrc0//YGJ2U4cJSocRmt6n0vA8aw2oOFu9JkGdawpoEQu7IN22gT4J76LhDQTY
	 cX7KO37xFtOoe+ZzKCR/JPydrj41vd63A0uycz6gQruIVuuvbqGD+We50hMkIPq+9M
	 jhDRwIYeYL9WvUG+2Fq/Qv07KeJIMVaV41hpHuLVqkmUNvL3DU+2ntdhyM3+IEQNC2
	 b+rW3pfwqzslOANOwqGJQ1BtAsOo0otn3O18oEpQJN9/EXMbzAfz4qF/gwkDZp0MeN
	 Qg7ZWxHhVys3Q==
Date: Sun, 22 Dec 2024 09:48:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com, peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
Subject: Re: [PATCH v5 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
Message-ID: <edoc2enbb4ch3r7nb5b5jykm6f7aqbktqnj5ytke2b5fa5bcgv@ceinrartc3gn>
References: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
 <20241220-gs101-acpm-v5-1-4f26b7fb3f5f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220-gs101-acpm-v5-1-4f26b7fb3f5f@linaro.org>

On Fri, Dec 20, 2024 at 02:32:51PM +0000, Tudor Ambarus wrote:
> Add bindings for the Samsung Exynos ACPM mailbox protocol.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

