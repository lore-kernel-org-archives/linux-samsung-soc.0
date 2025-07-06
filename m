Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00471ACECE;
	Sun,  6 Jul 2025 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751794948; cv=none; b=TMjPyl9K1vrHradRBIpzHRDN+wv2Yzh2Sv4rHFjXqNwXWaeLPMrg3hzNwqMYRjCz23wwyCe7X0NOGovdfqbW+9G1ohTNehee6p2kCBciw4UfTsZ+soIswOZ+G497/f8E1I8B561bawgVrjupATyQPh2RZwzL67ZtZTo3tihnOd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751794948; c=relaxed/simple;
	bh=o8BGQC3EzZGSOI3FyUhUCrX+ZNPQ+odHc8p2fXNTVV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xi6DXUWDC0Pg9cdYPzmIUTSrNxv8VQyaa3p1p3quagy/l6J0eje9EPQ2X+iSjD0h7ZxGUn6WIfbIm/nvi0zilAn+D18ASKq8qeRCiiamjarbzgYupDbqAHItHAQZLHw6RWSyeJOu6QCtc2mx8kY3B47yOK3uw4t5ys6hcUy7P8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cosgfw7O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cosgfw7O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D50C4CEED;
	Sun,  6 Jul 2025 09:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751794947;
	bh=o8BGQC3EzZGSOI3FyUhUCrX+ZNPQ+odHc8p2fXNTVV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cosgfw7OD5N9f1YO5bJbOa83XZ4JMVkSbkguRs80O69y3GGteo9tWkzcOirgCf7Em
	 jkHuJ4elK4UKgwYJZIv9c85KZ17eqtqhc9TNi4vWVaUQWZYIIhG0Loz1g3KBUm0r0O
	 4vPLvs/9gvUO1VX6/VAgfPHg8s9cbX2x7CC5YdRpSArBEKj/cs74U3cnpMguV6UCmh
	 lTo+rJn9VR8CYCAFBKlrAeUBGGQOSTMF3NuxpgnHj9ql8aslnrrdcOGKpE5hrAcqh/
	 ISo2Gp0Xu00Qxl2xozTcFBcvYOqzniK78rehprmr7yQzEY6nkxxczLXTQTovjhBsEq
	 zycQmYuci/gnQ==
Date: Sun, 6 Jul 2025 11:42:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, neil.armstrong@linaro.org, 
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, 
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com, 
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v4 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo HS phy
Message-ID: <20250706-grouse-of-pastoral-bloom-7d79b0@krzk-bin>
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
 <CGME20250701120002epcas5p2c4d728d599a819057bcc40b724881276@epcas5p2.samsung.com>
 <20250701120706.2219355-4-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701120706.2219355-4-pritam.sutar@samsung.com>

On Tue, Jul 01, 2025 at 05:37:03PM +0530, Pritam Manohar Sutar wrote:
> This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards

What is "this"? You add here HS PHY, so HS is 3.1?

If this is the same phy, why are you adding another compatible?

Best regards,
Krzysztof

