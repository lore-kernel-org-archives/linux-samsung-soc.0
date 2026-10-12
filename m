Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2292874FB;
	Mon, 12 Oct 2026 06:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786097; cv=none; b=IywZtc8Rj9pp9Hbawl8f/wolBPRqsvvCtC/ZVNqvhXGC6ldyRMQGw+wK0cxnZaFZ0cQgKxB/EnnpRLvuakOmM0tXHE69o6fByIJYWGbX+k/+y5iZ4tSemcsvxnfA+ikPMXDfNJWkUEfefg7Qy9w5HdGi53zQKW58bkbLU7xwqJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786097; c=relaxed/simple;
	bh=qu7tZQzj4fjTIobDivdvZ54+MNXeWBLYuvVyTlf38rA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7vWiWsW/OtRm/l0L2hhlo9aERFmUsJ8F6pCcz6TCt8/nhiO1WuDUOOqIOwiZysApYjvgH7X7oUpS+VIEEUzgkIJZtU8QqCsxNgrldz4TVKoWWYGQQQxevhR+FbetJsmBeksdxBXfWRECLbNKgkc6GGtBv93KN42Psdg/G+j8bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQyIGVRZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQyIGVRZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4D61F0089B;
	Mon, 12 Oct 2026 06:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791786096;
	bh=c5DUbNHbfdO2NvLPpm9JhksvV3MQmLBoMqotanmPHU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OQyIGVRZn9vqhuhSndfwp2Gq3htsPqYpG7dQEZuvmGihJ+mlreBMokPpZSatwgxM4
	 iDawDbeIy36rJuZOq30rk/m58c2eewSQTDT8ugyJfehQ2tb696/7Hr4Bya7O447k5m
	 MQ52mYcrKvxOj7qtXqwH4DpIIr+ofRXYtnEy6u3GXLePpBPIOaW7MphezlU1Gd7vBm
	 8YeODqif1ACa3S+RKloVlp+9IcxwHasRfbEeCII0qUWEz8G1tHSG05j5lDcP3BVtkK
	 WzPSw/+J8S3kg0fNRioSp1Wr3/zmoL5puqI0FThM39vuITvb9s/Z4xA89aavE70p0Z
	 itsyiiJGLfJ7Q==
Date: Mon, 12 Oct 2026 08:21:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, is.gandhi@samsung.com, 
	ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: Re: [PATCH v2 02/14] dt-bindings: clock: exynos8855: add top & peric
 clock definitions
Message-ID: <20261012-gleeful-stimulating-skunk-ae1db9@quoll>
References: <20261009120137.2801911-1-raghav.s@samsung.com>
 <CGME20261009114337epcas5p4493d8845a2ecd69331a415c1c7fee50c@epcas5p4.samsung.com>
 <20261009120137.2801911-3-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009120137.2801911-3-raghav.s@samsung.com>

On Fri, Oct 09, 2026 at 05:31:25PM +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_TOP & CMU_PERIC
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  .../clock/samsung,exynos8855-clock.yaml       | 115 ++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    | 206 ++++++++++++++++++
>  2 files changed, 321 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
>  create mode 100644 include/dt-bindings/clock/samsung,exynos8855.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

