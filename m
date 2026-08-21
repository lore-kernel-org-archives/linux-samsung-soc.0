Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5AF3B14AB;
	Fri, 21 Aug 2026 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298924; cv=none; b=HMzWNIRVdavEwhF0i/4VYmBcoRkCUwfSL5xickyOcVrAXopioSm3GjOw3+lOnC67bw6hEjM31jsJoZvuP5kMh0l0iPilPkRmF7sSvqD3cqkUZuMZ8dAuccxkl7VljMo3M8hTQDB8tbyHYMYul6C9QkQDlDd7V/7FiWJ+k/vGXL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298924; c=relaxed/simple;
	bh=Bq1GqyPqzcqeQIVdo1BpDKNc6rB6vLDWe+3lyfG5hfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evOy27eobK5tHnPFIrnH5gBUW6CVzBu6Tb8HRNYocWF1q7KocDKIUL+ESrEBo/U0O1caH5ittHDxUvKegDrdrsPZTuHeHDb8nBGqmhGZdPyZgTqTrAa99fxlHUsdygnOmuide5vdkwkoBohu7orGheQVRWQO33k+f9abZ+QNG5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9lrqwmT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9lrqwmT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D471F000E9;
	Fri, 21 Aug 2026 07:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787298922;
	bh=ggncsFl+P4gYhgD6NGF6aVdrd2Isxhm9KFLNVg0s6ZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j9lrqwmTCZ92FSDw0hL1RsBDQMIsVTp4wfsGe1iG7NqhFs8Yh8/jZUGXADUZmhCsK
	 PtqGLLSTRysk5QpnLjrPM84cqCL9dWRERHtS7bLAuc+RtSpGMBpr4UFlUrl54moj4k
	 dmx6MaNzoRmzmkr+3SV8T6+bcPkki49DajnFIuhUwIjPCNUSxd6srb1jHnz7O4fWxH
	 ll/xDflUUW181xC/QK29yf4hP0GC90ZMPLkKR2+KbUE3Fq0EMWghy3QO5UqyDBw4mL
	 8HPDRbCJ2hvtOPl5++OqjEYUNuvHlgZV5EmUd15OZyXobRa7mKwzSDz18bbfAOWsJZ
	 ySAZdCSmqCmww==
Date: Fri, 21 Aug 2026 09:55:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Aiden Isik <aidenisik+git@member.fsf.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add Exynos5515 SoC
Message-ID: <20260821-orthodox-lilac-alligator-80806c@quoll>
References: <20260818-for-next-lucky7-clock-v2-0-cda0cc80f158@member.fsf.org>
 <20260818-for-next-lucky7-clock-v2-1-cda0cc80f158@member.fsf.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818-for-next-lucky7-clock-v2-1-cda0cc80f158@member.fsf.org>

On Tue, Aug 18, 2026 at 10:58:35PM +0100, Aiden Isik wrote:
> Add devicetree documentation for the Exynos5515 SoC's CMUs.
> 
> Add device tree bindings for the following CMUs:
> - CMU_TOP
> - CMU_PERI
> - CMU_FSYS
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> ---
>  .../bindings/clock/samsung,exynos5515-cmu.yaml     | 145 ++++++++++++++++
>  include/dt-bindings/clock/samsung,exynos5515-cmu.h | 191 +++++++++++++++++++++
>  2 files changed, 336 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

