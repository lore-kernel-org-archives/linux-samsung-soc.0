Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A506225416;
	Fri, 29 Aug 2025 16:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756486305; cv=none; b=Uwus0XWSs+IIRZP7h0x2g2LvbSevzr61cvWlkkUVbsaFCPbK+j93woM6sY9KBO/BAUJiCK8u0xGz+pIjx2irosCgKn3ADxmAiuMN204c3JgApaAnxlQacixjAKhSB9mAUW9jb1k+fwMCQoFGqtYP6/B2dN/u+GoZEPjIvOjsWts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756486305; c=relaxed/simple;
	bh=03rk891EXzQgLlR+ox/B8qZcUcPShMCfgw1IOgKY9fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXN/Su8f4Yx46B4h22we3zA8gEuIKlOUGd1vSVQtuf8NYPD72ikv3Pg2IvJAPReSMQ7SyW8vgpauWGYnnx4MgSpl8BOHvta/723q9R4L/ph9enQHIttAfYyX0Z2y9r06U62Av8UZzg5OPjlyhUdmHIU+sdLmHGTdnfsAFDZsH0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcfMFq2A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcfMFq2A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FA5C4CEF0;
	Fri, 29 Aug 2025 16:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756486305;
	bh=03rk891EXzQgLlR+ox/B8qZcUcPShMCfgw1IOgKY9fY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rcfMFq2AC6QTawhxyDXciuX1Yxluc5AxBWNNeSo99EqnpfVKb32GzxpbzDqpvMcLr
	 Jf93jPIOVlZEW/cwlqG+TAJ5+OaW8DlF/hL/KF8WF8BKA1UCZoqNoPB9BvtAM242oz
	 Pzy8iEx4MUbMj97dgJ/WdNu9NfTX4mXIV4uzvYXj6a1yLqslGDBq6yhhWYET62Y8NK
	 3c0lY04UQU0KUDEW1PIRxT/pTierHIiOafwW+nhLfidYeZ5gM29DAkkjYytpmbn1hv
	 OCSgLghKAOHbT1tNaHgwP7pNbj9b2V6QEXkbXgfthvDKccBnRBYp5OEo7Oymp3QCfg
	 4biL16bGUS6XA==
Date: Fri, 29 Aug 2025 11:51:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	linux-clk@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>, willmcvicker@google.com,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@android.com,
	Stephen Boyd <sboyd@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: firmware: google,gs101-acpm-ipc: add
 #clock-cells
Message-ID: <175648630368.1002473.16179265827004487782.robh@kernel.org>
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
 <20250827-acpm-clk-v2-1-de5c86b49b64@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-acpm-clk-v2-1-de5c86b49b64@linaro.org>


On Wed, 27 Aug 2025 12:42:11 +0000, Tudor Ambarus wrote:
> The firmware exposes clocks that can be controlled via the
> Alive Clock and Power Manager (ACPM) interface.
> 
> Make the ACPM node a clock provider by adding the mandatory
> "#clock-cells" property, which allows devices to reference its
> clock outputs.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/firmware/google,gs101-acpm-ipc.yaml          | 11 +++++++++++
>  include/dt-bindings/clock/google,gs101.h                  | 15 +++++++++++++++
>  2 files changed, 26 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

