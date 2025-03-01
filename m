Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A8623F37C;
	Sat,  1 Mar 2025 04:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740801639; cv=none; b=bubdL/QYnhUx7HmhEEP66T8i+KkMRE16ee75BDMuO2VnLH8QzulUMbDgqflW2WmbR7IxIUknvNML7iZBoSG9xaIfI0uipBQrvTqIIh4ym6Rq99Kh+ZhO/M0MXUpCPRaN+j39yBHDfE9Ec+wv0m4Q5TVCwUGg75ZkGmbPmE0t8cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740801639; c=relaxed/simple;
	bh=gES+/B8lkFtwldnFslAofLXHw2x8wMNSxzDj7F9SjQk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=GbftpIcszsoi/OQI0eEvxAvqtt2cpnZ9DPjApXxSvP0YTRMCS4MnD2nO9s/sqBllUbl9kusMED7CrwOFTKh32vHwEZAlAjywT3e5fE1LywRS/XOtlBa202b1/Wnqntiid9n5xkJx82E/TbLDl4IgWWDDwic013KxHkmmINEhDUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IS7EKFwF; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="IS7EKFwF"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5964F25C4F;
	Sat,  1 Mar 2025 05:00:36 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaIIIFkxqZ9H; Sat,  1 Mar 2025 05:00:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740801635; bh=gES+/B8lkFtwldnFslAofLXHw2x8wMNSxzDj7F9SjQk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IS7EKFwFlT01d5ScSbPJO/i4rajHNOoV7v1YPUJTpbAAaSrfLJX1gpq4MtQw3AWEH
	 HBUXSxVddzNjtS/NmlF5fwC56kwODlv5d0+iW/71vNU/UTZWJq1GTa8S0FcNN54mE8
	 /Geb/Cg32yWfkeP2h1x7MQsdZJBD/0Aeiqd2nFUlyKSJPIoXWoa9wheIwOPTp1Er/g
	 zWg5YeF4T+Qn6xB7bNUgoLzZYdwq1xjV1JPnPslh1CatoUvwpf+YBIDFHKIuRwb9Pl
	 bwy1nGuWBXdFk1Zrbw5z71CMg72gf72GqRUp6FF6wyetl+E1i01ISg/Igcm/YZTUzp
	 OoLIAyUyMKXRg==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 01 Mar 2025 04:00:35 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH v4 0/7] Add support for the Exynos7870 SoC, along with
 three devices
In-Reply-To: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
References: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
Message-ID: <f37fab8e85cf0c333dc9acc97c1733fd@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-02-28 19:46, Kaustabh Chakraborty wrote:
> Samsung Exynos 7870 (codename: Joshua) is an ARM-v8 system-on-chip that was
> announced in 2016. The chipset was found in several popular mid-range to
> low-end Samsung phones, released within 2016 to 2019.
> 
> This patch series aims to add support for Exynos 7870, starting with the
> most basic yet essential components such as CPU, GPU, clock controllers,
> PMIC, pin controllers, etc.
> 
> Moreover, the series also adds support for three Exynos 7870 devices via
> devicetree. The devices are:
>  * Samsung Galaxy J7 Prime	- released 2016, codename on7xelte
>  * Samsung Galaxy J6		- released 2018, codename j6lte
>  * Samsung Galaxy A2 Core	- released 2019, codename a2corelte
> 
> Additional features implemented in this series include:
>  * I2C	- touchscreen, IIO sensors, etc.
>  * UART	- bluetooth and serial debugging
>  * MMC	- eMMC, Wi-Fi SDIO, SDCard
>  * USB	- micro-USB 2.0 interface
> 
> Build dependencies are in these sub-series:
>  * bootmode	  	- https://lore.kernel.org/all/20250204-exynos7870-bootmode-v1-1-0f17b3033c2d@disroot.org/
>  * pmu-clocks		- https://lore.kernel.org/all/20250301-exynos7870-pmu-clocks-v4-0-0f3e73b10db7@disroot.org/

Find v5 of exynos7870-pmu-clocks here:
https://lore.kernel.org/all/20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org/
