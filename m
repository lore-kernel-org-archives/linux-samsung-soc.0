Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E665C20E004;
	Wed,  5 Feb 2025 08:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744399; cv=none; b=j1okqz0O8+Uk2irNCiHSnmMi2Ndz6tboXaDRTxri6yolR+YRDyBfle1f6e303bTz22yzuHi28RaV4mT20JTBR/7rYHEodBuFTVIWa0TGzpJ4G3g9kUNOAmKVbYvu206Lpkus+TNTZPPVoEjFEbG11zi0yJrtByQY6+m1TvcILNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744399; c=relaxed/simple;
	bh=pK/Yuxmu+3ccbZPkPzYHAu1DBC3OjHYAa3ToJgHOQK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXpXnJJH+mE2Os9i2L/omJlc2/76xwt9Mk34F8qpD15pCSfFxpQkUKZXU7i8tDjaeWJ5GbnwzXje7XpRskS4BRjjdhkiWklEHlJUevfI8yPjELX04yJCKDcYx4cWn1aPoj9J8rwXE0OTB5ac514s0xiK8DGgRkCkzP3RJOZu+dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lm1RlrCN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lm1RlrCN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04EA8C4CED1;
	Wed,  5 Feb 2025 08:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738744398;
	bh=pK/Yuxmu+3ccbZPkPzYHAu1DBC3OjHYAa3ToJgHOQK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lm1RlrCNUU9aAf/ClIK93hbINBNqtRbvkWq7I9RbyI4+roJANg5fSpDN9oxq6Akxc
	 opUeALgH02WkN1OezVEmU72jzYN1JM/YGRo0mCqmoSSKNkfvmQU+QBfKjDYuTmg6WU
	 115rtW+49NGZJhjeXKj3hyPU8zuUMV3+q9JN412+R69Uz/v4lPe6LPeX8i3JixIX+L
	 wzoWH3m4sYF70orqfvJe4nfq62VcSh+B1S+8zqd0yDuuY8tx1q5TGV+PxFdci+7w2D
	 XND/wymWeavtwFid5GlvLQ9V82I39It/ljEUOQTExlnSl5CZg2cAQmoj1ChFsFvRKs
	 XC1UWWbwcoADA==
Date: Wed, 5 Feb 2025 09:33:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Lee Jones <lee@kernel.org>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: mfd: samsung,s2mps11: add compatible
 for s2mpu05-pmic
Message-ID: <20250205-precise-cuttlefish-from-arcadia-c6d5ed@krzk-bin>
References: <20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org>
 <20250204-exynos7870-pmic-regulators-v1-2-05adad38102c@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-pmic-regulators-v1-2-05adad38102c@disroot.org>

On Tue, Feb 04, 2025 at 02:06:27AM +0530, Kaustabh Chakraborty wrote:
> S2MPU05 is a PMIC present in Samsung's Exynos7870 devices. It houses
> voltage regulators (21 LDOs and 5 BUCKs), and an RTC module. Add the
> compatible string "samsung,s2mpu05-pmic" to the PMIC documentation.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

