Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E03E1624E9;
	Mon, 22 Sep 2025 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758560024; cv=none; b=G6zeMN8g+YItUK0K7usQKyXE9NOYaiPARDEG7MhGj3ZVNknqVfGSm+P5IhJoRC4U/SWbexFqwKJuj4nXXzVeRWSt9mPaPVRBZwaq0kEsvSvvZzV6CQaxdYF2t/pjPqvEgXmJDU4x/jm0xQOgVAMiorJLWc5wbKaORyVuOyswHi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758560024; c=relaxed/simple;
	bh=66YVdEIz0WO5xOUAZXPuRtDVfvF4ZqtngHDQvIbb4OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDMr2xiA+G2M7/Gqf9WzuaRS21f7fNJsHSppcjLbQRJvtA0X8ZYUpmnd/cvTaaobxRLeRHuxKgOJKHASmrnuOuehJQ2A5H2bSLNoey51sJzQt8xPqh39rJWV07qvE7v9Ak5X+U27pFJvL8Nhj4F9X1uza9aScy75jWIH7sanCC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haa/u39e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haa/u39e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB29C4CEF0;
	Mon, 22 Sep 2025 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758560023;
	bh=66YVdEIz0WO5xOUAZXPuRtDVfvF4ZqtngHDQvIbb4OU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=haa/u39eq5BLyx3UoZBQ1gg9wuP69x6DUj/rxEJE/qhGf9Fd0u5Te+KW89NvfVKBm
	 7xfdjvF2tQCp+A3hO+2oeuDpGnIsney4VEfDVvrSa2vy31p4IX9TzZnbXuTV1LMwU8
	 BeB7Eui+Noq6w7m/Qe1QZ1So3r3Tq+uGNJeMxhonPX7gduqIJRicoArwpC5BMarFk8
	 20D+1Xfc30GxQ62VETnvK4LqIUJHYja/WxJ6u7Px4dEEmrEjM+PAN9ghH0UrzdMFYs
	 YBUWsacp8SM86DyL5V89hpaoBGl8k9lmxjpu7vY3nWcJD2CwporgGCX+IRe0PkPxf4
	 k5WmcfOv5NrnQ==
Date: Mon, 22 Sep 2025 11:53:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, jesper.nilsson@axis.com,
	s.nawrocki@samsung.com, hgkim05@coasia.com, krzk+dt@kernel.org,
	bread@coasia.com, shradha.t@samsung.com, mingyoungbo@coasia.com,
	cw00.choi@samsung.com, krzk@kernel.org,
	linux-kernel@vger.kernel.org, jspark@coasia.com,
	linux-arm-kernel@axis.com, linux-clk@vger.kernel.org,
	limjh0823@coasia.com, smn1196@coasia.com, lightwise@coasia.com,
	devicetree@vger.kernel.org, gwk1013@coasia.com, pjsin865@coasia.com,
	lars.persson@axis.com, sboyd@kernel.org, alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, swathi.ks@samsung.com,
	conor+dt@kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add ARTPEC-9 clock controller
Message-ID: <175856002216.463169.9530978340977850859.robh@kernel.org>
References: <20250917085005.89819-1-ravi.patel@samsung.com>
 <CGME20250917085025epcas5p229b9eba48bd93a1f059b3cc4656145bc@epcas5p2.samsung.com>
 <20250917085005.89819-2-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917085005.89819-2-ravi.patel@samsung.com>


On Wed, 17 Sep 2025 14:19:58 +0530, Ravi Patel wrote:
> From: GyoungBo Min <mingyoungbo@coasia.com>
> 
> Add dt-schema for Axis ARTPEC-9 SoC clock controller.
> 
> The Clock Management Unit (CMU) has a top-level block CMU_CMU
> which generates clocks for other blocks.
> 
> Add device-tree binding definitions for following CMU blocks:
> - CMU_CMU
> - CMU_BUS
> - CMU_CORE
> - CMU_CPUCL
> - CMU_FSYS0
> - CMU_FSYS1
> - CMU_IMEM
> - CMU_PERI
> 
> Signed-off-by: GyoungBo Min <mingyoungbo@coasia.com>
> Reviewed-by: Kyunghwan Kim <kenkim@coasia.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> ---
>  .../bindings/clock/axis,artpec9-clock.yaml    | 232 ++++++++++++++++++
>  include/dt-bindings/clock/axis,artpec9-clk.h  | 195 +++++++++++++++
>  2 files changed, 427 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec9-clock.yaml
>  create mode 100644 include/dt-bindings/clock/axis,artpec9-clk.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

