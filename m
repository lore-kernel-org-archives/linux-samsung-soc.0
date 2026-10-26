Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007902;
	b=GiljUGpWagykzSo8ruwbClpP/Ea4Te9h536WsSAGX/TJNs6/INuHzH+uD34DPdmzNQGL
	 iFHDaZjMyOaLADqpaS65+mUxWfkggw4EGXo0eKJCfQ+9KhJvvOSfbs7loHN9C2NG6gNpl
	 nx6DwG5oGiKG/z/TDhX15GLO59bQhagp2diQTObdNcxFQedH+S2WI1goz8U5Hx+MDoX+B
	 A71Bss/+3n1C2pkqE1OfizrQn1yVMKXNc9XUtngLUOfEv/6vmvNl/1wBa/ZTI7rl29AVM
	 Z+wp7XXprTXgaVAy5Ad0pLPMDKurTMclbE4ZVuwSw4kmY2+2XIMaWRRErnj5pR3nKkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007902;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KPo3Z5PTuahAgke8pWSVmA39AlUrhp+IqUhv7BZ+HAM=;
	b=eIjdWzMB1MqAXi5F7i/kGdZQabadJPv5FLNNafLtJnFVhp3eRMn6pFoJE6Hu2hOauh7X
	 6fJ9VjsOhqfVtx3+5s22UI6ScXj2MMPPG/XMcQdkHXh3Tc5qL1caGsqZOdUdFc6nYPdZG
	 C29wR5MQfHd/a6ShMvZhtb9yk8w2NkXbT1OZ2ZAgzzPWkcEbu70eReN6ZYJ1MV0bjdJzI
	 6gHUaDe6Wa+C9kFqee6ILOozNTIelVZkDy0iJa1FJjMMm8OUzDcIhwLEYRILZWaRIrgHS
	 9iDnoDw9pR3aK65QWbTNbPO/jcTwENE8uWzQwOyTCLp9Z6LsN5X3lboSBcEDCqlkBBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TPgKY+el;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE43606A32C;
	Mon, 26 Oct 2026 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TPgKY+el
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CB71F01829;
	Mon, 26 Oct 2026 09:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793007902;
	bh=KPo3Z5PTuahAgke8pWSVmA39AlUrhp+IqUhv7BZ+HAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TPgKY+elXAOknTgUvsWm6jQ99BFW07fiIm73EEE5yP7xvDahabri644vWSrLQiJxU
	 ykcc9p4H/hExcEo4/Z7VP8uJn8eGc7KsNboxBqX46xfhJeh42O0bJR1fHb02YC/ea4
	 EQTegq5bTATQv/sMGfTUY2WgRlhcgGPCOyWekKFhHOyVk5SQkdmOfIkIQh+UOYbOOT
	 kA+d1790nQIA5frnHoKLnxXZZFjcTu2p0rwcjj+NIhLQwgygLDew3QjBzoY6QVHDvU
	 UlKvdO4uadUs6414ZzrTWAehOfhFxart8mPFKf6UDmcP+HIAkv5AY/uoW7uuZOZxT3
	 6UnDFId/1Iajg==
Date: Mon, 26 Oct 2026 10:44:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com, 
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com, 
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller binding
Message-ID: <20261026-attractive-puma-of-merriment-0dfbe4@quoll>
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
 <CGME20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc@epcas5p1.samsung.com>
 <20261023131501.3157463-2-selvarasu.g@samsung.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023131501.3157463-2-selvarasu.g@samsung.com>

On Fri, Oct 23, 2026 at 06:45:00PM +0530, Selvarasu Ganesan wrote:
> Add the Samsung Exynos8855 DWC3 binding using a flattened node
> representation, where the DWC3 controller is directly addressable
> rather than nested as a child node of a glue layer.
> 
> This is the first Samsung Exynos binding using the flattened
> representation.

Ah and:
A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Best regards,
Krzysztof

