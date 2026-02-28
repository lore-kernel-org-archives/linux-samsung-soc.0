Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1704932B9B1;
	Sat, 28 Feb 2026 14:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772289814; cv=none; b=Nqq1Mb6u5YQYwIPuMI2VBNL4TjNewF6BUjNBzZPT+andczBynq54uHZEpOcxIv6mwFUdML5Ix/9TavSkUzYYwcqyjWPhuVycHneXns51PxYjhXc9uPafauqWE/JI/Gx3ykca3wmBPlJ3hNlWjYGPH5tOmiLQR+1Y3UCZ1lPSVxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772289814; c=relaxed/simple;
	bh=DxlsWt8JrSJgLLW+czcpjK+QrBU8SMywKLQVpxZEYNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VqqjJF/ed4nvLO+kS8Fsr926SDmCvqjsiA+RWhYDcPhX/MnEC/5FGrzWRDv5XBkBCpkUEZQlKtpojKn/obR7nMhtQxiS9exCH0VcpiLzOCtBnuTYLxdyCi1wmYpEkGGi7fpNvAUAGV3+wCAqzCJwey0jp9OO/EwL2AS3spMLMuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zi43zS/h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zi43zS/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2236C19421;
	Sat, 28 Feb 2026 14:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772289813;
	bh=DxlsWt8JrSJgLLW+czcpjK+QrBU8SMywKLQVpxZEYNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zi43zS/heJJsjx8xD5CvT1NRMRViVtJGHmPcYbdsLKPOkA4kgvPuBIc6eHi3FYHNu
	 tKU1DY2o72t7cdJ85/8qLCfrTPKsjc2I0w0IqLRHk+Of69MnALJWE1nzCmnkz8fXPy
	 sEuAnCesSKNISU0tLU9aGVEIQaVldt+UahGx/Sj+7Sd78a4q27SyezNs/cdxpQ4u9r
	 uwOU1+GOmCXPRXR4M4U7QKn4Tw5bYAiJ/vzYE/rFaacKlsJ+0CrmDbncafKhc7e/NU
	 sXr1UkDQvz+RBz1TzBTlmnCP5ENZlloBy1Omt9vThLGReYdukXtQhY5IolHn4X07Wt
	 tB29snDc15nsQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	sunyeal.hong@samsung.com,
	shin.son@samsung.com,
	Raghav Sharma <raghav.s@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	chandan.vn@samsung.com,
	dev.tailor@samsung.com,
	karthik.sun@samsung.com
Subject: Re: (subset) [PATCH 1/3] dt-bindings: clock: exynosautov920: add G3D clock definitions
Date: Sat, 28 Feb 2026 15:43:21 +0100
Message-ID: <177228975881.54431.6677380218613505033.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202103555.2089376-2-raghav.s@samsung.com>
References: <20260202103555.2089376-1-raghav.s@samsung.com> <CGME20260202101954epcas5p27735b03488efceba5d7f970931905ec5@epcas5p2.samsung.com> <20260202103555.2089376-2-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=359; i=krzk@kernel.org; h=from:subject:message-id; bh=BJphhyUvycG85ma5KiuFViDXgyFJrR33M1MzhR+Y77M=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpov8J8SkbXScdOWTrVFJmnCLf50v3D3l/X2Fku d5SPKzffhGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaL/CQAKCRDBN2bmhouD 10CoD/wLDDrPPVk8HYtoavOY2eDXT/oFhSPX6oi2KVGzlzFii8DoOQ3XddBN0UpoaLGYxx1Xz7g w3DLym2bRUJBHma0SrdsRgTUdj1jhYXfv24T0iyuehPfvtVrbT+Iat3cDSBaZ2bMlP5b3So93/W GpXeXRGBjLpbP2ei/bZiLFMl1xDpmXyCZdaAcaQQlqzErlXLMRNKoUZvYhgorPedAVA9xFJqxra yjUzhC5lNXAoCf8VYWW7m/M4+qvUqRjtKt2w4L0f7fsd4DEYMLESLCszLsNGLM4vCoAtBpiBRdx kED9HDXv2iOMHlO9qXKqKDId20D8VnOgyN+KJbokks4a/MiZo92D87jrSQ3mv2FJy2ZK4Dj32HU QPLTNnyrebFcAq51Tj0PY4eEwaFAtwSPXLF9tT9hNPXtgeuwX12ie0e/ZannXGpzDMPMtoMIR1T GSwB2bUaiWSAFp8NPVFHcqkH3V5WRqMt+1J61isK3rqz2wEY/cEjibWiNjAG4aGVAEoqd58YAHG Mv/LWEtTKPL652h07w5C8gVtMRlX84bXD3HJK6H8EUVfQkoKzfm2paxXYB4J5lRVsEYhwHJ9mih NLkQoj/eyepRBNNa85ILYbKTziaFcetm1od5QuOn8KQqT5UFCUXTkiipEm5VDeiGXfYW2fAYHit Y9R1xJHBqpWHa1A==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Mon, 02 Feb 2026 16:05:53 +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_G3D
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: exynosautov920: add G3D clock definitions
      https://git.kernel.org/krzk/linux/c/6e5913328102f818303b01e854df37fa9f251a47

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
