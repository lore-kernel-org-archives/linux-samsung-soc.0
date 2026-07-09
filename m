Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F6928000F;
	Thu,  9 Jul 2026 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603192; cv=none; b=fFLeOFX0rCs/5K/lAwSdAVI7Alr0u24io0VtLbGaA2Rp4M1eABXaFAkjs+lvS8rckuK8/xyCl7EutNBk6BsVLzPo7fouLFIm7ekBv9Yt8j/2Bninr11rII1iKj2JySTYsCaSagq9QQSd3pGLJ0x0BWM9VvdLgSNdAr4Dl7qJidk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603192; c=relaxed/simple;
	bh=2Mo4RM80sDPxpafrL7jOSW6LXyEzpyEo3CSc/UIXnds=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E91yzGDIhKjatnfid5dPUIgG6PjUqx5tHP/8m0Fh0BBwgz32Q0Siqi/asT3hYxB6T2lFhvbhcrj11VslR8LLUgQyotR359IImFkwlgI/jnsolJTx21mKMmOprkDvyOBh4pmTUx20vtgNRhGI8jTkzU5Saix+Ih4sSQfD9exXs5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6X+tF0/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6X+tF0/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42E71F000E9;
	Thu,  9 Jul 2026 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783603191;
	bh=0WLCVQsvZMqqfH/K0AWHWpcFwi5Xbu/MV1fA5PKOgWg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=h6X+tF0/BBXN9PxosE6RenLIymvAa2EGxIlzh1woWhTzEctYLSPkemOfJ9CWorfeR
	 AZzYt6qHNhmxv1+BaxzXyqzNRnivFLnnfvE8tlFi/dbBDUyWf077az9me2KXY+f6OO
	 ODh0JtzhXeaB0KZMSsry32HIdUc9lSY7vENI3ihNHUeAvMxbDIZBjRTu/Wj1aKNOwE
	 XZ5Um8r9lPbPNzH4j4w4IGzT0sDi3gCvpvFlxWpFCruprK1TCAhIMTT4dxeUNiQxMD
	 6BEpicdMfq0Oj/JsA4aQe2OQP4wJU1PrvXnUq10bYG+Ry+iVUDOOJEDhuUCKIj4YyR
	 4xhAF5vIT9Smw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: samsung: exynos-pmu: Restrict
 children with unevaluatedProperties
Message-Id: <178360318738.284535.1868657789892551663.b4-ty@b4>
Date: Thu, 09 Jul 2026 15:19:47 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 01 Jul 2026 12:57:32 +0200, Krzysztof Kozlowski wrote:
> Each schema for a child node should end with either additionalProperties
> or unevaluatedProperties, so add missing one making the schema tighter.
> Defining 'type: object' is on the other hand not necessary when other
> schema is referenced.

Applied, thanks!

[1/2] dt-bindings: samsung: exynos-pmu: Restrict children with unevaluatedProperties
      https://git.kernel.org/krzk/linux/c/3527091de0feb27e437bce175048b54be835221b
[2/2] dt-bindings: samsung: exynos-pmu: Narrow allowed reboot modes
      https://git.kernel.org/krzk/linux/c/e131ca83dabc8bfb8c1d455d02bf2d7a7bc1198a

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

