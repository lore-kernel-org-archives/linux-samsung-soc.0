Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C27219EB;
	Tue, 29 Apr 2025 08:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913685; cv=none; b=oJd9xVh6eQSOIMB/+o6zrRZZJEoyxVYaVi1UlBfV8qzlz2H0bopgUjKjQ9cG2xSCvQKdkYokwkP6nQz/aD3M8X+z59kjBol5rqhikN5Mj+06tsDeiV2uKdfBXA1uqBW1lG4r2iQVu3bHyVMDsP4i+PTqcgG5wsQmttHCpkrKdO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913685; c=relaxed/simple;
	bh=DZa3T3b4vAqSDABkH+cRjLnDd7YvrAb15Rd26zzgywA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olRq4Hw7TpPMl8t5ieOxdIsSb1uMmD8sb/bstDoBHxw8CxSzh5R1KmsVKZ6bUFgmlOPlVY1sDKduPBE+s9RIqQuGVOgrNlTGd9NxTNgTdqIeCkUwkRjOQaFayO6//7pSFccHwsLD1EJbDk+ZTX8IM19r4W3jYsJLtRPjwAEeVlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnsuiDp+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnsuiDp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D633AC4CEE3;
	Tue, 29 Apr 2025 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745913684;
	bh=DZa3T3b4vAqSDABkH+cRjLnDd7YvrAb15Rd26zzgywA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MnsuiDp+lzuDisqX3K/PeFS7IaRrr7kxMPv89NciMhfqgR51dtIs7h/hbgRH9XkbN
	 mfVXEqlceXIJCdR7bi7EqNjVNoJomSYS0myF8xFTrMRYY3uWBAOql+h4ipIC+KrEEz
	 2Xruxqob2qPJZIi2detPfIw4graWbTCquJFyE5/bh14/t1ACMSIt51HqV+gwnPFUq5
	 auYvlV52DSPGVZjjvybTDfqtsFkUG+EX4VqSssMst74qpx1LJUGs1FLsmLUKboBC1Y
	 RMDkEay4sBz5aPVl7Ui0uYqZ84pWzCZ6Y/QM474cqkqZvO07MX9pCfyH01RXKkMHld
	 ENvx79CA28eJQ==
Date: Tue, 29 Apr 2025 10:01:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: google: Add gs101-pmu-intr-gen
 binding documentation
Message-ID: <20250429-scrupulous-aquatic-toucanet-1aa9df@kuoka>
References: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
 <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-1-1bcc44fb1d55@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-1-1bcc44fb1d55@linaro.org>

On Tue, Apr 29, 2025 at 07:19:37AM GMT, Peter Griffin wrote:
> Add bindings documentation for the Power Management Unit (PMU) interrupt
> generator.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes since v2:
>  - Fix dtschema error "relative path/filename doesn't match actual path or filename" (Robs patch bot)
> ---
>  .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

