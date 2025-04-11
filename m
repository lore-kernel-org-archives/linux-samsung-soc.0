Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D2E29C320;
	Fri, 11 Apr 2025 22:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744409374; cv=none; b=F9dFHrYXmGOxLCR8t/HqQ5HnBWf0k+4qzL01HaqMpiaj7YYkjpGeudhIhmiWdGzoMRMpzKXgHabcvZ7p1l6ftDgT/UMQMwQdqgf+K3QDjG1IjR7r34rQg3fxKEBrFXdtoLxqFZyCWGrM0HK8c7pCl4glZRQbKAOAYW9koKy801o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744409374; c=relaxed/simple;
	bh=Byg3i0eZbtP/In/Aj0I+oKXhsMDzcEgDbY0YIhV8r+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4HNrEn9YD4S+03Jb4h353BC3VmNfcyP663pzVOlStBvK6THljn+aweVYQhYTOpvr6bDBWza0bSKXgtHa11LKCWpcp5GEn6kEjqmANFGKc5YOYgvyXsyAdx9nzl3SSs/es7Ht3TqZMqROO6s8hMiJeNCwwzxP4rcRwit8DmoO5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMFYkL0L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMFYkL0L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0520C4CEE2;
	Fri, 11 Apr 2025 22:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744409374;
	bh=Byg3i0eZbtP/In/Aj0I+oKXhsMDzcEgDbY0YIhV8r+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMFYkL0LKvNK2w+z2sZ1p17BsWfbfIfkxr3WtJ54QZLpoyUcqmM++BWYpI9nEo9Hv
	 FE9As9Fw8klcPXx2SMIZwzsRbAA4FtnAwAdgU0WLl6fyKqPMhXgrrNSYFMfLGI5eN4
	 l9Mhkc52q7OrnkwcpMam3+H/MwjVrocEI3izuRROpbnluXojnFFxy2cY01oVv7xx/g
	 pcxb3muTrFI2XLQ/qfdkDn6BAN6FbEeD7y9uLdsPhgR0s1NrG+Iv/XP5ZN/rcbcweo
	 XOrTle2e7I8vpaWqUuGJRZxw4xOsnhzOQBVzheg/plohI74an5fFtxlBxGX9VNUPV8
	 QzfI5ptEFaN6A==
Date: Fri, 11 Apr 2025 17:09:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH RESEND v5 1/5] dt-bindings: arm: samsung: add compatibles
 for exynos7870 devices
Message-ID: <174440935531.1983.12373348885945734243.robh@kernel.org>
References: <20250411-exynos7870-v5-0-fa297a7ce41a@disroot.org>
 <20250411-exynos7870-v5-1-fa297a7ce41a@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411-exynos7870-v5-1-fa297a7ce41a@disroot.org>


On Fri, 11 Apr 2025 22:32:15 +0530, Kaustabh Chakraborty wrote:
> Document the compatible string for Exynos7870 - "samsung,exynos7870".
> 
> The following devices are also added:
>  - Galaxy A2 Core       ("samsung,a2corelte")
>  - Galaxy J6            ("samsung,j6lte")
>  - Galaxy J7 Prime      ("samsung,on7xelte")
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

