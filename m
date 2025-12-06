Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0332A3B8D6E;
	Sat,  6 Dec 2025 10:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765018064; cv=none; b=g/oFCzWXawgSlXkqQMeWvvyhxDETuGNVMgdrxIroo/yShx15EE64BEzBokad0xqt47sVPGkdkDSzi0/pIbDQhIzzWy12gaLs6rc2U5uEBUmBs6berQxjhd89RKNde+uMbJXCImbtBqkVLdmwfvs5BKToBnfYLD+GvvgZN3/Yb/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765018064; c=relaxed/simple;
	bh=z/x/1pDOX2OLLC4hlVDnfT3qQtrpkFmTIq0Yt5Ja2Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fkly95yfh3oH6oxc3/waKJU8gUtj0hXONWTwLooqw+5SVBZIaaZVtB+dPKbCGSG7KqvWUOVDXRyc3MJN1LIjJka3IIEOlTE/qLDSPe5naKrRUGJt2JgAsjE0jpyqhor8aX4scng4mW+2EiQhtrlG/LFNJsJA4u6ww/7/BP3dA7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bc8UGQCb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bc8UGQCb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A011C4CEF5;
	Sat,  6 Dec 2025 10:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765018063;
	bh=z/x/1pDOX2OLLC4hlVDnfT3qQtrpkFmTIq0Yt5Ja2Es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bc8UGQCbBHA7FUoVdDqKDZQOmK0kA4G0RYShfN6nlWKgwbLBxtUmd27DI39yCyNSd
	 6cBuAeUMuSBUMhZ+OV5J0ILJYR9VU9hNIUpOANtnMKBPei5ARc8138D8MGf2y3Fcw8
	 QzihVaQkz6TSjCPxQIRPyYkh7DZvJfMNXb82NTVSzXjTCaaSyAjrI6b9X0vGFc8Vxt
	 tF5iekf8K8um9uSxYKj83Ix2r7afDBAh66KC2U4UFj67QDCfZ0y4Jj09/1EiTVvuHE
	 LfA6maXU7JMQIEoY9kG3l7IKdf0Bkv5pBpW88Pzd+S3L6IgrwD77pqQYPcqM3ibFJZ
	 IsI5vPdm57rvg==
Date: Sat, 6 Dec 2025 11:47:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
Message-ID: <20251206-perky-tentacled-lori-bc71d9@quoll>
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-1-9f158b18f979@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251205-controller-v9-1-9f158b18f979@google.com>

On Fri, Dec 05, 2025 at 02:26:37AM +0000, Roy Luo wrote:
> Document the device tree bindings for the DWC3 USB controller found in
> Google Tensor SoCs, starting with the G5 generation (codename: laguna).
> 
> The Tensor G5 silicon represents a complete architectural departure from
> previous generations (like gs101), including entirely new clock/reset
> schemes, top-level wrapper and register interface. Consequently,
> existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitating
> this new device tree binding.
> 
> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
> Dual-Role Device single port with hibernation support.
> 
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  .../devicetree/bindings/usb/google,lga-dwc3.yaml   | 140 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 141 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

