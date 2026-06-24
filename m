Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80F2225413;
	Wed, 24 Jun 2026 07:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286329; cv=none; b=jhlV2KK0A8kzG6TMtmapI+m/eWR839HGGSgWfBOfr9GugjFRLthGCI8rOP04OrAowhZncLN84uOVN1Bi37MBWlAh24OPGlsdLo6UTPVikEPw5rE/kBbjs3ZFuanO7PF3o1/9ZzBsZEGzk37suONb8Gi7ehJ8lv9n//ParKQ4xE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286329; c=relaxed/simple;
	bh=FtQZIWp0q/zeCUvDzvaVfsov0+8rSgPY7mzahEwg/Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIaBP47jHn3gXOtaW5KcO42DqS9H5AToswM0SZGYij2K1XHnDNETbCHuuUSws2+D9K9g9Q/bNFrDy4ObEmfx/fUkV9tKSgha+6dF88Na0axeFrpaZy/xgB6q4HlC0wFkdbBKkVi/Dn72mmuK07tpGcB5w+r3aDBEzJA/wXvCMlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hr5jEiw0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hr5jEiw0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D571F000E9;
	Wed, 24 Jun 2026 07:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782286322;
	bh=mWviE1yMvHLhkB5BCuKaIarIxybmd6mECKtXviPVDVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hr5jEiw0IxQOcSzhu7R9Gc18bkc1txlnW6lTh5h9COJPIAI+cu9wR2ySRTHd5exfS
	 ODNGGEihd2k2221+eLgXQc8i/vjqrhFfvT8y9M6amgVKfhfHlk109lOfPPcl4NDMDD
	 ejrP8nBVjGIOvBdBF4vKnYVKf7Zr3lerFMLYKfVUXnNzSk3rZyohWk5cVLQaVG5AEC
	 M6ut9csUuCQTZTBhLo6qkpGtAW+bJfMwFJqebh4HcYAP4lXKQPc+IYCYhqWuE8yRZP
	 C1GlUdNvKQz5Xv4ipL0M54c2SakMn1JkwMcOtcpFvtO7N6yvu3a+kZBLEgAfFhxB6A
	 BZvo2Tveiw39A==
Date: Wed, 24 Jun 2026 09:31:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Barnabas Czeman <barnabas.czeman@mainlining.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: clock: Replace bouncing emails
Message-ID: <20260624-crafty-wildcat-of-protection-4f6cee@quoll>
References: <20260623073050.36262-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623073050.36262-2-krzysztof.kozlowski@oss.qualcomm.com>

On Tue, Jun 23, 2026 at 09:30:51AM +0200, Krzysztof Kozlowski wrote:
> Replace permanently bouncing email addresses (550 5.1.1 Recipient address
> rejected) of Adam Skladowski, Chanho Park, Anusha Rao and Sireesh
> Kodali.  There are no new messages from them via other email addresses,
> so drop them permanently.  Add Alim Akhtar to Samsung ExynosAutov9 SoC
> clocks, because he looks at other Samsung clock hardware and drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I missed here:
Acked-by: Alim Akhtar <alim.akhtar@samsung.com>

Best regards,
Krzysztof

