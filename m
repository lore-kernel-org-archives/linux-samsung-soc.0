Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F8C1DFE4;
	Mon, 16 Sep 2024 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726496616; cv=none; b=KcHl+7pIZPdH7DhLz7C6ZocdvyShaI0ZknW2hMx+Gm1bP2Nn+SC9xGqxNx5zO0FR2Sh68tLnzfr5aUmE/3qf98Llz9BDAaT1/d0RXAEJSbBYOvuWl1WWtJIZ/QqKyQhu2CZZ4BLvFNXHMIQdUxW7bf8aDtgc1sUZ9xj2w2fJVWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726496616; c=relaxed/simple;
	bh=rncfJvsSfSSt8RDkEWkWrmkimwduocKkDHsjzj/BsMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2VoiJMWrLRvoGIqC3CamkYkxJafMQzXIdpqxBvzGbmhGTSaHvFkv5zznbnRwcVIslW/5VlaqEO50RuPZpXEf2gVAlWEKPgL+QETEvDEjGG0+homiruGRlQVjZ2BJonzlDcTQkrDRCbReAbFQhRq3OvkeFpcvj+OyQSGpdLDp9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImVuJKvv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImVuJKvv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7899DC4CECE;
	Mon, 16 Sep 2024 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726496616;
	bh=rncfJvsSfSSt8RDkEWkWrmkimwduocKkDHsjzj/BsMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ImVuJKvvq7DvhtQuXuf1HywMacLvbeDBpBKKAk+WXmrvtMlKsCOdrZ/4F3X5E7Gp/
	 aYtadYkFZv6sXxAQt1sWzeb0HZ6ooDtQK8Jfoxb9hDRQWgv3QVYeGbe9u5LVjPHrYB
	 NvxDCaOCO+lJjMQQ9uQQ5OpMTUQnzrSxERqXABT0eO0TnZV/XT5E9i3ssettIKHfsZ
	 4a1b4o6UaI5LnEmCxbCQpzxgqwqYDLE/oQwjIFb+7cdw9CFxgbua5WiOQNT3MrYXMQ
	 SHHpulD8ah8E3CyB8mut8LYuJPMPbxqkgYhg/URu5lADclB2OGdWr8jJEYPruXiFSQ
	 AxeZJHTEZfkfQ==
Date: Mon, 16 Sep 2024 16:23:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/10] dt-bindings: arm: samsung: Document dreamlte
 board binding
Message-ID: <qzlrtzpz3zvbue6fwlsdoxy7fbqlxtisvuphizr43yvoxxbjzs@r4pvuxrcahz4>
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
 <20240909110017.419960-10-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909110017.419960-10-ivo.ivanov.ivanov1@gmail.com>

On Mon, Sep 09, 2024 at 02:00:16PM +0300, Ivaylo Ivanov wrote:
> Add binding for the Samsung Galaxy S8 (SM-G950F) board, which is
> based on the Samsung Exynos8895 SoC.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Bindings are before users, so this patch should be before DTS patch.

Best regards,
Krzysztof

