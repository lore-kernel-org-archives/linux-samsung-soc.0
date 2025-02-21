Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA3F205AC6;
	Fri, 21 Feb 2025 09:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130841; cv=none; b=Na7ySGeJd6J+ovUE8YDOViIBX/hW7aHmYWtgnwzEZGIenjFm3vt8O+LUCdLeVnmKIo7YKqgH0PgLqkM6Bl31M6fq1gAJB3LHGl5j530PoNMbchKL5z0ff6yVNTNXfX+EgAqdttyfRu+f++sTr1AnT82zPD5u0v82C1AQd6e0c1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130841; c=relaxed/simple;
	bh=ATXQuhcsU1yRD4J9xK/fW6XCIpw54vLXsQ7cbzLGCDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHJgOUrfWHpAUEAI3LrT3nxqJyUtMGMkwk/fgCDAWBvPgpEM9PMNQpLEwwlWZwmZ4CRupXiVUID/DelsVcmKv6Ziw1qhmFzfItdXHYYAIpSex8V5Vh4wMwDgOhy406L2vDF93Y7HO+RIdpBJRLPTuilWw10R/BWvkRAbSV+DVCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gstzdaJD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gstzdaJD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B503AC4CED6;
	Fri, 21 Feb 2025 09:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740130841;
	bh=ATXQuhcsU1yRD4J9xK/fW6XCIpw54vLXsQ7cbzLGCDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gstzdaJDHFaz8EX/LddhLXI1wdgZpBxj5pUIAuDJrI0nej4P6ecZonO1bHnvfEx/2
	 b4zXWuRN+CVxu01lEH+lI1tMgyYVf9K5Und7+DMtIE68SfpAM0ui9PJWYF2GCidtrn
	 GWI4sb057Gdejb9Yadk8ENx1uinX/2nn8eLWfQgN3BXYcRtgF4Pz+p+VbrrlEh5Xw2
	 zoS9ffu28SIlQxOcGUfcTWZl3DHvW+Zwehy5IUlmkqJig0goJMkYvk4lmyA7VsbVE5
	 7d9aaz8d6NzpToDhANs41odryQmDhsZEoUTrmsXxA+FnQFZUy7uSwxgw6re/kTinjO
	 KzLGhUAGAdEPw==
Date: Fri, 21 Feb 2025 10:40:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos7870-chipid compatible
Message-ID: <20250221-independent-oxpecker-of-piety-4fb305@krzk-bin>
References: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
 <20250219-exynos7870-v3-1-e384fb610cad@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-v3-1-e384fb610cad@disroot.org>

On Wed, Feb 19, 2025 at 12:33:11AM +0530, Kaustabh Chakraborty wrote:
> Document the compatible string "samsung,exynos7870-chipid". The
> registers are entirely compatible with "samsung,exynos4210-chipid".

A bit odd (exynos7885 is compatible with 850), but I guess you really
checked that.

Best regards,
Krzysztof

