Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0173016FE;
	Wed, 12 Nov 2025 10:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762942932; cv=none; b=k6XVHywx9ETErmlpgii2CfNCBO2DQwusVJuXRXbv0izt71o/7Tcf1qzvEHb/lQW15TcGRBPFfyzGtFqBO5bY2w9US0YH9Cj3LXXQQu4iZuDmU/s6t+8UI/fV50/sHEo5Y+k3CoF0ZBBLKibUGbaqw7JfMtCju9Q+pcUPYvLUwfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762942932; c=relaxed/simple;
	bh=+2175vZc4EKhJz9VBbIMRTVf5NdYmltwIG7v98qXGz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEg+J7dLZrnKQMn7kZbV+pFNysnaODs+7jFflkw3NdHiZVGOHlJlmDzsKLAHPKNjedIoH6EgmBWU4IskH+yaabvQIEMnfSgnmGOidVy04SMLcWEvhfR8f6/logJhFBdQaFoLmxhUxmHxeTjfnUCsZaGyy37YGqkXfas97U+mIKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5F3grlF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5F3grlF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED06C2BCAF;
	Wed, 12 Nov 2025 10:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762942931;
	bh=+2175vZc4EKhJz9VBbIMRTVf5NdYmltwIG7v98qXGz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5F3grlF6DOyorR0A9eIRIkUfrB1U1cqjF4gMW/1GFIQC4ZUirmk8eDVe8bS93kU2
	 ZWFJG0JX3pQG53gvGNkucUnOakciQbBBc41Vbr7zMhFiGBSoU7lwfcddbQQfiLOnze
	 /aKgR09Pk72cvU0GgYuAzxIWAdi6MsyAY9/UVR8foTP+3yK3kBZ1nwSztwSwzQLJzZ
	 ajzQo/3mbGHXSjGjCWNe4Bn42T8qIqfenIdrweh2L1jFVR6YQZsqwFSN6VmRaV2qbx
	 u2YzXXl5hIv8jTbi4gb8RlTsOv3jNwqnJppKKbw/Gi8WMnPyhnsYDETTJUYcHz33Cc
	 bh1kkppT+xyEw==
Date: Wed, 12 Nov 2025 11:22:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org, kernel-team@android.com, willmcvicker@google.com, arnd@arndb.de
Subject: Re: [PATCH 1/2] dt-bindings: soc: samsung: exynos-pmu: remove syscon
 for google,gs101-pmu
Message-ID: <20251112-naughty-romantic-hamster-e213eb@kuoka>
References: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
 <20251103-remove-pmu-syscon-compat-v1-1-f2cb7f9ade6f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103-remove-pmu-syscon-compat-v1-1-f2cb7f9ade6f@linaro.org>

On Mon, Nov 03, 2025 at 08:03:10AM +0000, Peter Griffin wrote:
> Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> "syscon" compatible") it is possible to register a regmap without the
> syscon compatible in the node.
> 
> Update the bindings for google,gs101-pmu so that the syscon compatible is
> no longer required. As it isn't really correct to claim we are compatible with
> syscon (as a mmio regmap created by syscon will not work on gs101).
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index be1441193feeea1c12d0d5370168e9316c8dcf76..c5dd132a2b6948f8eda93e4a32ddd1b57a83fcc0 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -34,9 +34,10 @@ select:
>  properties:
>    compatible:
>      oneOf:
> +      - items:

I expect new version (see other comment), so also please change items
into enum and drop const from below. items is redundant for one entry in
compatible (by convention) and having it as enum already makes it ready
for growing the enumeration for future devices.

> +          - const: google,gs101-pmu

Best regards,
Krzysztof

