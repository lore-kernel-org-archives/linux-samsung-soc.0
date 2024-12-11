Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCA418BC3F;
	Wed, 11 Dec 2024 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733932035; cv=none; b=RVppL0Ka4Rv8lk3kU5G5YB6uU6REmntTOOqfPmzEzfLJdFlOF/x6MksD7XMGr4ArGohdsZJqYQ/DdX5WD6vjpz6y4xMp0M2L++4+grBYvS1YItv6rdSguQzixBlelpFd+wSvUUCxWtXXkPibYqvApo77av1O/TANVY7fLG6YHfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733932035; c=relaxed/simple;
	bh=qsPmqbckC0QLNUpCrEGTyFuyNNsWpyK6tx/uRzgBwzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZuJNHy2wubYLhyX/6Wk4qwL209QU1JcE6uuPpLX/k01uQQ9l43PTXKwBS1GD7+tltu5GGbuu/+LBo+qZQ+JV8u+HsPFIkBX7FlbXua2Bhijo2aTLXQCb5z/ka9luuFOc8cdNV0JY/i8s/vBpJMtC6i0w/ORotdbh6rInfS8EdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8zqfTpr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8zqfTpr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC786C4CED2;
	Wed, 11 Dec 2024 15:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733932035;
	bh=qsPmqbckC0QLNUpCrEGTyFuyNNsWpyK6tx/uRzgBwzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y8zqfTprkNTe1s93rc5PaCRN99PLuwqz02R0j6clNhKwEiZz7moxd1G7TSOF/sxLn
	 tqx2PB3FNZHno/X1jtiFVA9FKqXfw+qKjYyws/jH/RGBzrLRBh0oefYfkc00uEzAOM
	 cFH2GMIVQOedciLDQgsrRsgmTWPz4Wv7cjNxdiiao9zs/P343SngRRKTfPCsYeQaU+
	 DcvC3zVRTIUjMWWIwIXhAig6mIbzd967tMnYkdWOXutBqmRdCIkComwQXRj+ewu6Go
	 qtDp66bq4Z9WueQU3wTQdatO6ox7zea5ZP7ffhNMlg/aRxx+RuK+Fi9v898oL907Kj
	 70mmTbcE3KZNQ==
Date: Wed, 11 Dec 2024 09:47:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Roy Luo <royluo@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	devicetree@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	kernel-team@android.com, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: phy: samsung,usb3-drd-phy: gs101:
 require Type-C properties
Message-ID: <173393203254.3086087.14024716233496700566.robh@kernel.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-2-f5961268b149@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-2-f5961268b149@linaro.org>


On Fri, 06 Dec 2024 16:31:02 +0000, André Draszik wrote:
> orientation-switch is the standard declaration to inform the Type-C mux
> layer that a remote-endpoint is capable of processing orientation
> change messages.
> 
> The USB PHY on gs101 needs to be configured based on the orientation of
> the connector. For that the DTS needs a link between the phy's port and
> a TCPCi, and we'll need to inform the phy driver that it should handle
> the orientation (register a handler).
> 
> Update the schema to enforce that by requiring the orientation-switch
> and port properties on gs101 (only). We disallow orientation-switch on
> all other supported platforms, since other versions of this phy (or its
> system integration) don't currently support or even need it.
> 
> Even though this new required gs101 property is an ABI break, the
> intention for the driver is to behave as before if it's missing
> (meaning for gs101 it will work in SS mode in one orientation only).
> Other platforms are not affected.
> 
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> ---
> v3:
> * update as per Rob's suggestion (I hope :-)
> 
> v2:
> * squash original patches #2 and #3
> * actually disallow orientation-switch on !gs101 (not just optional) (Conor)
> * update commit message to clarify that the intention for the driver is
>   to work with old and new DTS (Conor)
> * collect tags
> 
> foo
> ---
>  Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

