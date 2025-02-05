Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4082A25A647;
	Wed,  5 Feb 2025 08:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744473; cv=none; b=nGSHrIKlR7gC2Mk7AE330jeISIMZfCTliD1+9fbcMPGM3PvEG2+hiDoAv3Nh8yp9DzOnAPgH8BThO9NguGMR2DJoHIWEdvO41TrO8sIzlizoPWXEwFaJLQSb/zbKd9I2CimvDYy8zQrjzcMF2aqHGtWVP519azr1ie1zdr4mzr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744473; c=relaxed/simple;
	bh=INq9zi8p0Z+Z9sXFIchV0HcG9jQWOvnnBWOvf2spgOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdpcW+8trt9mzzvr9/ew7uGjIyhISQVy3TDZdK60vZJe5dil8U5lDR716Jbc7+CIZeAXVgg2Wowfc/L5hiWq1jB32/05+4+OD8BQoRyfxEdvpwXGXjIyWZlceRUYtAGQtOj9yc9bko1uUOWpTg2BjuORIg+FMMOb7ltwf2WZSqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0PeRDM0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0PeRDM0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7BEC4CED1;
	Wed,  5 Feb 2025 08:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738744472;
	bh=INq9zi8p0Z+Z9sXFIchV0HcG9jQWOvnnBWOvf2spgOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B0PeRDM0KAvk4eVy8T79UgmCYPEfjo61Iu0CPfIc5tmRLJDTwu3tW59bYwollJUsM
	 f1sl42p/+4sp3QQWn2EKPjdC1AUvTsmrl0v11Nm6rZgf50fuAw0Nq34OxH9X+V11nN
	 2aBmKqQjcQKce5I5qM+P0fzrnUGSvMVhDerpMK6UmyQobGhgZOJxW0CxhKzR+7Zwg1
	 G4GZz/eB6iOxvStclQ1JSaZ6VLarXunYwYFOuhcduW+n36fhxvzTyDj+fsQsRITBqL
	 wO3VRjAIL7CO+NLUDSTWzH6uTMwuytJl2vEnUobeE8wWIy5MVA+iZCrIlFVIr0WfTu
	 UCxsyQCmV1yCA==
Date: Wed, 5 Feb 2025 09:34:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Lee Jones <lee@kernel.org>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] mfd: sec: add support for S2MPU05 PMIC
Message-ID: <20250205-loutish-flawless-deer-dbaeac@krzk-bin>
References: <20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org>
 <20250204-exynos7870-pmic-regulators-v1-3-05adad38102c@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-pmic-regulators-v1-3-05adad38102c@disroot.org>

On Tue, Feb 04, 2025 at 02:06:28AM +0530, Kaustabh Chakraborty wrote:
> From: Sergey Lisov <sleirsgoevy@gmail.com>
> 
> Add support for Samsung's S2MPU05 PMIC. It's the primary PMIC used by
> Exynos7870 devices. It houses regulators (21 LDOs and 5 BUCKs) and a RTC
> clock device.
> 
> Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/mfd/sec-core.c              |  12 +++
>  drivers/mfd/sec-irq.c               |  85 ++++++++++++++++++++
>  include/linux/mfd/samsung/core.h    |   1 +
>  include/linux/mfd/samsung/irq.h     |  44 +++++++++++
>  include/linux/mfd/samsung/s2mpu05.h | 152 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 294 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

