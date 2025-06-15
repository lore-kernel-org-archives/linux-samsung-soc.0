Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD1F262FE2;
	Sun, 15 Jun 2025 16:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006353; cv=none; b=SiZ+oDMopscSYSG2EhX77IPHIAQP7raPYmzdUYXKzLZ8gdp4IJqnOfjbwrG9DIkT24g9qRfr3WDeBApnP5/HLoMhb1ZNmPhsRc9JHxKYDABJ9GYa8t5EeimrIt5zbmFIOn+PSTVQVJBPiO8sFCriIvdHJEtF/37AvScJf1psZD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006353; c=relaxed/simple;
	bh=hlUg8IDM4zWJ1pd8HLJwa83NIf3lmTk+9Z3o2zQhvAs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ez7Cpp7H04r6O8P2g1UNs+uwSNx006PNE5N/b+e9Ok7aDiEADPIfPVb3h2JL9ZSTRq4+Y2RQyKca6Bx3seFo6f90HY4upWnCfEARMDhURcUN5dUOC1qn+V2j4v1BlpD2gw9fidgQekcFuVErkCGUSp64U5S1fCVaGkW6VmvzSJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WiZbC1zn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WiZbC1zn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B55C4CEE3;
	Sun, 15 Jun 2025 16:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006353;
	bh=hlUg8IDM4zWJ1pd8HLJwa83NIf3lmTk+9Z3o2zQhvAs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WiZbC1znAMaDa7K52Nf/TY/fIcOegC01bkKPxuTt1hRrTPqYpe+fbORTP3MB31HG8
	 2xeWMHxQnJPEvdVDyWn27XcTt90uaFQ9gpkDwme7sAQJp/E/lzSCZAnxpOMqeVMWoI
	 88Rymoyn+ljT+yYLn0oVR0N9yWqRDGuL9bmxu8nyhArOpyULYcEHnfcgrGhnHv32Pw
	 3Zr3hTAVEPSfA0NaCerqL6WkzeHMFkz88krMEU9/L8m96IbOY9Hixt9XMjbmgxmvT+
	 UlJky5RzitecvUvcPpxYUrQV5CQxWgFBIsO/wdrjgQrfKbHR1+cQVkGnJZ/diPYhbY
	 pUxRcyXcujTgA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
References: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
Subject: Re: [PATCH 0/2] Support for Exynos7870's MIPI PHY blocks
Message-Id: <175000634865.1180927.7761964733755731210.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:22:28 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 12 Jun 2025 20:39:28 +0530, Kaustabh Chakraborty wrote:
> This patch series adds support for Exynos7870's MIPI DSIM (for display)
> and CSIS (for camera) PHY blocks. It contains a single DSIM and three
> CSIS PHYs.
> 
> 

Applied, thanks!

[1/2] dt-bindings: phy: samsung,mipi-video-phy: document exynos7870 MIPI phy
      commit: 2ac5840594b2cc2b41116f708241a2a61d9108bd
[2/2] phy: exynos-mipi-video: introduce support for exynos7870
      commit: 543f5e314282c4c2e5114f88ddecc9aeaf0985e2

Best regards,
-- 
~Vinod


