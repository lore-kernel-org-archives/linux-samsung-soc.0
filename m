Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846C217C9AC;
	Fri, 18 Oct 2024 06:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729232966; cv=none; b=fFyMnGNZnoRG3OxZMd1ze0qwj2Am01cZ8d8RO0eHOM1JrnrpX5V+PMYWfvvINA+83zjOg7f35c5MGsg7ujW+vlUX5kMkW87cGHHR8P4heiiP2XbFxglUUHRnz4RNZ54WTK9+bdq5cpyNPaRv6iLv3iczohHV4n8rdAfOJM22zKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729232966; c=relaxed/simple;
	bh=1jCZB5uI7KIP/9tnwE/MmVN2WDZIoNWeu3AIC+yZBV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aczcQDCZF9N3Qaih0MUNZ/Z9bDsnAbvC5Tvs3wgXqQAYFqnN8qPlUt54uAZxeZkOQe+6LDa3BnhEoHJyGXw+oNpoi181aGowIAHBhKv+SXkQjMH8g079UaPXuI3+lvB7tNJfbA8azcNNPfTkqNVJFPiCFOLboIaeVWOlTZtoKbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BV3rC6PR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BV3rC6PR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F9FC4CEC3;
	Fri, 18 Oct 2024 06:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729232966;
	bh=1jCZB5uI7KIP/9tnwE/MmVN2WDZIoNWeu3AIC+yZBV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BV3rC6PR0lBO+YkcpoI2nbnGM3i4eFvu/UgbzPOP4amqpokpL7iqvAOKYrTJQOiJt
	 pOjxWELBFcTHXRQszFra84ezlT0anI93X+DTEUiGX7HleCiNCBdo5OVMCI7tnAAIkz
	 c/8Xja03J3wOZWvnEv4KdDCs/J3TTEbseH6mpET0wqgRsetfahMdIDVM3R+qAQ7vnk
	 g58/xwXTP5ELeJ1vm0Qk50tixRoFLT6AEkChIX3Ox9zX4xxiJqdvLbdoIQAx241J29
	 OknzoobZPX24ciICgjvupyCCLSg+M1YOfVHirlCbNv7XU86OEChtqs6CFeYns+ZRMe
	 ia1mn9YSplDnw==
Date: Fri, 18 Oct 2024 08:29:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: samsung: samsung-boards: Add
 bindings for SM-G981B and SM-G980F board
Message-ID: <2jlqwsolekrxydey2q2bowhrtldhsl56r4ijb5rmjiitskclpe@utspiaq5ffyk>
References: <20241017164328.17077-1-umer.uddin@mentallysanemainliners.org>
 <20241017164328.17077-2-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017164328.17077-2-umer.uddin@mentallysanemainliners.org>

On Thu, Oct 17, 2024 at 05:43:24PM +0100, Umer Uddin wrote:
> Add devicetree bindings for Samsung Galaxy S20 5G
> and Samsung Galaxy S20 board.
> 
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index d25a17e69..70a915240 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -234,6 +234,8 @@ properties:
>          items:
>            - enum:
>                - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
> +              - samsung,x1s                     # Samsung Galaxy S20 5G (SM-G981B)
> +	      - samsung,x1slte			# Samsung Galaxy S20 (SM-G980F)

It does not look like you tested the bindings, at least after quick
look. Please run 'make dt_binding_check' (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

Best regards,
Krzysztof

