Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6411F2DC76D;
	Thu,  1 May 2025 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746086618; cv=none; b=TcQeMOib+THqI27MrkZOMjfwRwmVluvGs+27ES1IrvpYTm38ni9X903njHmlgTVozQ5LsDhJdlbhR8CfADPZ/fk1ApZ19nAnjuiHtvr3OLbML1npBRZU4QpAftzoEuUv3dvqMNjjboPMrAlhYpc/NTnl9UcMHZFEAbTlUYB0eWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746086618; c=relaxed/simple;
	bh=CapM8cFQ+34osfR/nGJn+yrSPaGS7Fi3qUNlij2E3TU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=gW3GHAmPQhzl9dBbx9ZSrJfviXTpHpJAAsjnnc2OMBr3Jm93V+1rvJsezAt2cTKP+GWBpWcJ8mXytBemHp4dKOjy0yj7YoQGfpUldBH7X6r97ScZnjcHibgZ4i03wpOXv+/Mt9yUdxjbHLgcxxVS60sZSva4FGHnWNRhIC/MOz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=TPMOVxPp; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="TPMOVxPp"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5D21B25CCA;
	Thu,  1 May 2025 10:03:32 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nN5rKr4dkGB7; Thu,  1 May 2025 10:03:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746086611; bh=CapM8cFQ+34osfR/nGJn+yrSPaGS7Fi3qUNlij2E3TU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TPMOVxPpnvJbac+WIRnf5SfCs7yLNJnJUK/nnthIjQNNa/4XOsyTvx032ly3BLwhO
	 fXaXxSNf13jkS4M9YE+mDvAAYKCGp9mR7qK8/cQ71m5eNSmmIpFfGZDjerYbo5DwNf
	 6Pu9oPhPyl0R8H4YBiU6p5LOsjAQrbSvd6F9hSV9IvFzBW8DPnDakpfsnd/BqVu9Ka
	 8v+gMXaKuzLVeIaubS/8rfnU0goHq3/8BeGJDtdbSMmXAdSg7eHIR93jQ0WbrKGYUF
	 CSpbi0vXckfih6HRa1sykUZMkvqtCJzx0EHctVaJAvxqQszfcMQADD777SVAYs8nYH
	 nVAt/l5RRGgAw==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 01 May 2025 08:03:31 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, Ivaylo Ivanov
 <ivo.ivanov.ivanov1@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6 0/5] Add support for the Exynos7870 SoC, along with
 three devices
In-Reply-To: <9362d6b4-890a-4364-8e51-71ad6fc1e107@kernel.org>
References: <20250414-exynos7870-v6-0-039bd5385411@disroot.org>
 <9362d6b4-890a-4364-8e51-71ad6fc1e107@kernel.org>
Message-ID: <ef733cebf014ef3dff1a0d780d289784@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-04-16 07:15, Krzysztof Kozlowski wrote:
> On 13/04/2025 20:58, Kaustabh Chakraborty wrote:
>> Samsung Exynos 7870 (codename: Joshua) is an ARM-v8 system-on-chip that was
>> announced in 2016. The chipset was found in several popular mid-range to
>> low-end Samsung phones, released within 2016 to 2019.
>> 
>> This patch series aims to add support for Exynos 7870, starting with the
>> most basic yet essential components such as CPU, GPU, clock controllers,
>> PMIC, pin controllers, etc.
>> 
>> Moreover, the series also adds support for three Exynos 7870 devices via
>> devicetree. The devices are:
>>  * Samsung Galaxy J7 Prime	- released 2016, codename on7xelte
>>  * Samsung Galaxy J6		- released 2018, codename j6lte
>>  * Samsung Galaxy A2 Core	- released 2019, codename a2corelte
>> 
>> Additional features implemented in this series include:
>>  * I2C	- touchscreen, IIO sensors, etc.
>>  * UART	- bluetooth and serial debugging
>>  * MMC	- eMMC, Wi-Fi SDIO, SDCard
>>  * USB	- micro-USB 2.0 interface
>> 
>> Build dependencies are in these sub-series:
>>  * pmu-clocks		A https://lore.kernel.org/all/20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org/
> 
> So this patchset waits? Ping me or resend when your dependencies are
> merged. If resending then of course explain why and update dependencies
> list.

Hi, all dependencies are now available in next. I believe you should
be able to merge it now.

Thanks a lot!

> 
> Best regards,
> Krzysztof
