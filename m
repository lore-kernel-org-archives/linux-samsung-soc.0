Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571C6329361;
	Tue, 13 Jan 2026 21:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768340221; cv=none; b=aEtkJx8mMEUb3EQC7nHbjzDtfFyna4JBKuSG+Ybj9a1GNmjz26IqAetflczkU0Qo8RiZV/oM+i6aIua5Q35fPELxoQ9rYF+OdjCeR6ozGIzuC2JtmBU8ppkxL80tZjsi8ma2ZL3yBY03/tglqhHlXSYIe8J9YTiT6pljSuuZzfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768340221; c=relaxed/simple;
	bh=XU4w/j4+oTl8JFHiK9oRl1AHI0R90v0EuhBItjD2d04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpXnZZAJE5S5mlruhE0d1AwiRVCBLKuWkkAF/bt6axCL9z/DwhfKyvhN45fIkpnoHbQVdDu5KzzsOqQKpFFaW40tBbCvISKVNEhyc/RBEBFyf47hzSyHX4FJO4y6BdxlQC6XA1YBQ4pLhHm7SeCO4oAZ9O4b18FMOiK5L6ToZHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyxiyHom; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyxiyHom"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02BCC116C6;
	Tue, 13 Jan 2026 21:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768340221;
	bh=XU4w/j4+oTl8JFHiK9oRl1AHI0R90v0EuhBItjD2d04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EyxiyHomBr+sAPePMMZvDs0bX8l4EDroeL6W0KKCjd23hUnuoilujK0x0+CtmdicS
	 KvsbsjYXh4abeUoGdfSTrIkffVPmPHvxFwsKZshR5CtuJl7lBmh/EPEQx1qx53Fl53
	 rt0GWp9a89Wb77qmIJahmfVOLKVfvR+51khFvp3QJB+B1O3FqeUcWWskGZ+Gz6vxDZ
	 gvCAl/gjxPMhIafj0lD6n0paAUDf3MepKhLfvcmsV8HkoYT4wgxu2c2zRMLCpGD5xX
	 9W6DRnjeL0xoEQnpLUX3KrnRBHwqeMLLmib5cLgSmN0AQkr609REbaQrpTb7VTUJxn
	 QISNqnUPY34Fg==
Date: Tue, 13 Jan 2026 15:37:00 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	kernel-team@android.com,
	Michael Turquette <mturquette@baylibre.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Juan Yescas <jyescas@google.com>,
	Doug Anderson <dianders@google.com>,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: google,gs101-clock: Add DPU
 clock management unit
Message-ID: <176834021822.198212.10109654358382228131.robh@kernel.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
 <20260113-dpu-clocks-v3-2-cb85424f2c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-dpu-clocks-v3-2-cb85424f2c72@linaro.org>


On Tue, 13 Jan 2026 10:58:59 +0000, Peter Griffin wrote:
> Add dt schema documentation and clock IDs for the Display Process Unit
> (DPU) clock management unit (CMU). This CMU feeds IPs such as image scaler,
> enhancer and compressor.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v3
>  - alphanumeric in gs101.h header (Andre)
> Changes in v2
>  - alphanumeric placement (Krzysztof)
> ---
>  .../bindings/clock/google,gs101-clock.yaml         | 19 ++++++++++++
>  include/dt-bindings/clock/google,gs101.h           | 36 ++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

