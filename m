Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621636;
	b=xcN4b2vpwDNw1/O5XFeB1KGxyORxiLLhW2dC+oPlD0TzX1kF445f97CxF1qocupyNgbY
	 UC7VYPmNX/hS5R5BnW2ZIAx/kL+K8cszPfMR7Y12PwBE2tucQw+wlyjnskCBbM80Gb+xV
	 X5kuIjzFpgW0eY+2WyCAkdx4FcUhuyyZgeYBJ0fCUdiofYH6xc4jWNzsqP12D4fwqjfBZ
	 +ifS8vAIkL45IOQFvet2CssQoLizmEtriX+KffVoEyGLopn6ZRHWHnomBFK80+m4Mv0aI
	 OLi61DEK65QltFfJbdnkc1wx9+KcQpLvoatAy6FkgzA0xGtXVL/ZSwcWyqkvDLiytDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621636;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=fXi/ODkkDcS7yB3qAtaA6Va6+pHO+yh02Tn0NReGjdg=;
	b=De69Dbjfvdfv31n4T3Ny/sWYAhSsXWK75Zcqfiw14aBO74tMRNAD3+Ayk2BEOF5rmAs2
	 NPKvQfgNH9pZXsgZj0qmTyffPMpim4aWgmMelGHAwp+42Ox65/29GOmfac1vsmo8fPg3K
	 FibXV00S1P76AbiNUsOL4+ObSxKSZ7iM0bDj9v05Mh5FZeLIPUIsvQtR60GpPIRgOFVmI
	 l4dFJkoyqmkD4HBQzMdn2gbJfKWXmRAgDSYWZ0s+OMoL5CxXivBLxJzB/Y00XqaE/m/A0
	 xh1fm83m0Fbcf7s9LACOAVcHiwJL1w91JqeLSg7v/vmRCE7UUpz+Lr0zPqpsvcFupwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AVLU3fxs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A67606A31E;
	Wed, 25 Nov 2026 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AVLU3fxs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABD31F000CF;
	Wed, 25 Nov 2026 15:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621636;
	bh=fXi/ODkkDcS7yB3qAtaA6Va6+pHO+yh02Tn0NReGjdg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AVLU3fxs7ziGskU4JNYWdlQtxTmX128cAa6+2hAlx4TdKTG6DpejbExUU/e/f/mKl
	 c56wa48HrXsN1eBo78dwYI2aG/X/gryyefEWRFNhtrdKFewwrR9RqOrsPxY6uaR25H
	 cJS/h2bkpoI1npa6t1zhZ6F/gqgcdbZhrrjyKd98lUgxpUEFgUWYlXKFYP+/9DVvfZ
	 5fjWH3zBTer+CfZcpxFKJai2JGnZUeGQJ9hgFV1RvQAq2VJ9rgR/Yt47mZ8rXmp7sC
	 s+1BpjyNR1g8Q7mVlMkgSmQq5DrE9oCEDcQv2uvYEKkD7CqK/28gTJQsF1eYJB3d0E
	 rnWIb3oAb/gqA==
Message-ID: <758f7d59-21fb-4441-977b-1ad90e227441@kernel.org>
Date: Wed, 25 Nov 2026 16:47:10 +0100
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] usb: dwc3: Allow glue drivers to override all
 dwc3_properties
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Li
 <Frank.Li@nxp.com>, Janne Grunau <j@jannau.net>,
 Peter Griffin <peter.griffin@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Neal Gompa
 <neal@gompa.dev>, "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Fabio Estevam <festevam@gmail.com>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
 <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24.11.26 23:59, Thinh Nguyen wrote:
> struct dwc3_properties holds all glue-overridable properties, but glue
> drivers can only set needs_full_reinit and gsbuscfg0_reqinfo.
> 
> Replace the properties value in struct dwc3_probe_data with a
> fixup_properties() hook. The core calls it after reading the DT
> properties, so glue drivers can set properties that DT does not
> provide, or override DT values, including clearing them, to correct
> broken SoC settings. Convert imx and ls1028a to the hook.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---

Acked-by: Sven Peter <sven@kernel.org>


Sven


