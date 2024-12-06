Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400741C1F19;
	Fri,  6 Dec 2024 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733490448; cv=none; b=kOu5blf/AZzZzNZw9Dre3WeCjefDsWGLCKksZnlM/qJbT4BRsIyWfCq5prNdK/mWeJWsGSVk4FwPGeTF/VpuEPzN1P166d4z2LNE59/Z+PfSjr8iOK0jaDnXgNwM6jkqGuCXLAWpfc4J/rPPEx2+zh2UrcloQNA+Q6MJqOZdzy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733490448; c=relaxed/simple;
	bh=+MOizm4Hi8EsvmrUseTAmqGt2xqTmOXTLu/gHyRBzzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6vIwthYPFTWi1/1R0Ueo89+aD1b9w7N4ERfCCOg6GSybP1BV8Wz3j78JnbkbJ2sg1RwJuzNJlmYXJMKvu5O9nmtarPNnfh+Jr32302I9t9aVBcLusSAiP7GmMEbT0z2NdYhGHO7gUuz454kDXd2LuPVZKuI/3et5bejBrxOVVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mU+H7rdr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mU+H7rdr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070F7C4CED2;
	Fri,  6 Dec 2024 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733490447;
	bh=+MOizm4Hi8EsvmrUseTAmqGt2xqTmOXTLu/gHyRBzzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mU+H7rdrruunhHauD8KabWFkDgYtiRl5h8hqJ3eeUBdjW66fE1mm0d3YAyQLvBGR6
	 ILXSzv7P5kFnVokBWaz8X3ThUYPtj1xh5GPQZ1U+FC8freyFfR40+Zzrl7CXU2oayg
	 1bRTwTJXbnLJjUoV7T/Wle3GPJBydDsMEK633JPUKlrdEY1lzgdeIxD0s3eDjsQF80
	 bUZRhdY9GScL1UDO1Ci38EX9CB00vjinBR6n8QUyqEAHIVy/etb5baRuaVyFOlSfvA
	 iy0mzywF09QEW9qrbpmmfCxO4o10TwgO9TB7RLgC0Kn3GYt+C6yl5rvC88/J8qXCeT
	 aNXedLzEaEPKQ==
Date: Fri, 6 Dec 2024 14:07:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v4 0/4] Add minimal Samsung Galaxy S20 Series board,
 SM-G981B and SM-G980F support
Message-ID: <dpby4tvamvsk6437kngv4d6diq6pqh5fquptwy7p5325e6hb3j@ot6eaurn4bun>
References: <20241203080327.4751-1-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203080327.4751-1-umer.uddin@mentallysanemainliners.org>

On Tue, Dec 03, 2024 at 08:03:22AM +0000, Umer Uddin wrote:
> Hi folks,
> 
> This series adds initial support for the Samsung Galaxy S20 Series and also
> initial board support for the Samsung Galaxy S20 5G (SM-G981B)
> codenamed x1s.
> 
> The S20 Series feature a lot of similarities in their configuration
> and internally Samsung named the common devicetrees in their
> downstream kernel 'hubble', please note hubble excludes the
> S20 FE series and Note20 series. To accomodate this, I've
> now named the device tree common's matching the codenames
> (x1s-common).
> The device trees have been tested with dtbs_check W=1
> and results in no warnings.
> 
> This initial bringup consists of:
>  * pinctrl
>  * gpio-keys
>  * simple-framebuffer
> 
> This is enough to reach a shell in an initramfs. More platform support
> will be added in the future.
> 
> Just like SM-N981B, the preferred way to boot the upstream kernel is
> by using a shim bootloader, called uniLoader [1], which works around
> some issues with the stock, non-replacable Samsung S-LK bootloader.
> For example, the stock bootloader leaves the decon trigger control
> unset, which causes the framebuffer not to refresh.
> 
> Device functionality depends on the patch series from Igor Belwon:
> "Add minimal Exynos990 SoC and SM-N981B support"
> 
> [1] https://github.com/ivoszbg/uniLoader
> 
> Changes in v4:
>  - Rebase from krzk's kernel tree to accomodate
>    for the merge of r8s
>  - Rename exynos990-hubble-common.dtsi
>    to exynos990-x1s-common.dtsi


What else happened here?

b4 diff '20241203080327.4751-2-umer.uddin@mentallysanemainliners.org'
Checking for older revisions
Grabbing search results from lore.kernel.org
  Added from v3: 9 patches
---
Analyzing 29 messages in the thread
WARNING: duplicate messages found at index 3
   Subject 1: arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
   Subject 2: arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 4
   Subject 1: arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
   Subject 2: arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
   Subject 1: dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
   Subject 2: dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 2
   Subject 1: arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series boards (hubble)
   Subject 2: dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
  2 is not a reply... assume additional patch
Preparing fake-am for v3: dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
ERROR: v3 series incomplete; unable to create a fake-am range

Working with these series is a pain.

Best regards,
Krzysztof

