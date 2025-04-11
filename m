Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567336F30F;
	Fri, 11 Apr 2025 14:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380508; cv=none; b=hCEvyKvkujyqSqCaXef+JIQDturYBLPhwVPygFtY1h7LPX/NAjYqCaN//juL599zI2LEW3l9XDtqI9MlExCkUUrINtASA01l3yAsM+9kBpvzNlJ0i9xh5dQUarlykkHm1dQkmED5PFpN90KsqNIHZ6yz+QkKTGf6MEAc+s+HzyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380508; c=relaxed/simple;
	bh=nX4DIF7APuUGgpi+dZMGrR759kRdWLm5IwHTBTnZ7RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMG9SwHQ9zS4VQLAsYpe0CcnRPp0mzyWqaBBQaCTJTe66q4I/5DAV/Egt9b/Epr0owkzKK20d6pWfO4IPj9lIawApT3i205DIS3IUt6ALQawa398cbGj6/yjfW5zizIvw7Os/x3cFUq7rTvWW53M2ROD++jdmguAqrp53flwIzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBQ+xdRx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBQ+xdRx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFFCC4CEE2;
	Fri, 11 Apr 2025 14:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744380507;
	bh=nX4DIF7APuUGgpi+dZMGrR759kRdWLm5IwHTBTnZ7RU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBQ+xdRxaUn4XSDExJwykf3BFFD6Qlfpa3CFVwRdFM6TTnqPMuea3fZE0FmT7AYfi
	 bGkZy0iJCwbJ6JVJRq6ibhfYCvfghtDe+1D6zH0UyPTya1i7Z8Dd2MesZuo5lm47G5
	 JpbojT0p392yV/vLSfM154vKVdz+ztKAVRP/qwreaGwftZzj8A9w96vGpBduPRBr5P
	 zeTUiJAWiTFq0tzSH+ZeWt9WGTG4MpAdrwmDLEPntO1Bu7uapknv4KlArPY51j4Mmf
	 at5QSa9W6okkRTHJFK/NFUTBHIDUdxOz6IRZGVbmy8xcyXwmU1OzswkprUAjjsM7kz
	 hCDYkWFq7a0kg==
Date: Fri, 11 Apr 2025 09:08:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: samsung: document g0s board
 binding
Message-ID: <174438050588.3113760.16761182166000834243.robh@kernel.org>
References: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321145556.1436201-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321145556.1436201-2-ivo.ivanov.ivanov1@gmail.com>


On Fri, 21 Mar 2025 16:55:53 +0200, Ivaylo Ivanov wrote:
> Add binding for the Samsung Galaxy S22+ (SM-S906B) board, codenamed G0S,
> which is based on the Samsung Exynos2200 SoC.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

