Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB8D41C7F;
	Tue, 11 Feb 2025 17:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739296119; cv=none; b=JlS9JzBi6NF6JSYhXsAHEV0WixrztZGTbmITsyPYIvC+Vj2gc9gOI/2Pc0X18o8RwuxgLmYRva5kgNyl4RGET031MbeKKNaNWDF5na2sLrgOm0Ua1k8o+NYfpMNmjN4QebtdH1qdfXHJzKFlS6GiipWKW7iUiF9G882S/Bg9BFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739296119; c=relaxed/simple;
	bh=Z8lWfXxYGhsMs8dAs2Wwm4xHfFeTOKBFHHc/bDiuT6k=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=EtfD2HgY9H92SFOoPLow814tV7yj39dWn9EpYVxdJKn0qzzkYx5apwoh7WfHXhRXzvHxLgPrAfWRd7z8zUy5MIAhsl95YkoyIekNw1+nyCBn6ZF2ok/xkiglXggtg3ec5bRdv2Z+PR849eQL0cUqj+TDNZnDq/0MiZJX7liRrbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=jVFyeOtM; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="jVFyeOtM"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9557725C4B;
	Tue, 11 Feb 2025 18:48:35 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3ydeW4wkoKu; Tue, 11 Feb 2025 18:48:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739296111; bh=Z8lWfXxYGhsMs8dAs2Wwm4xHfFeTOKBFHHc/bDiuT6k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jVFyeOtMDokw97k1t1QawSgEVgDg94c6AYdfNp+jiEPTBsNMz3S1wTHjXUHI19PDX
	 TEo4SERflwLXqeKpRjqLiLoLa3Q7/i/EkKiSBaqjTwG2mAHqctBKRefvWCjfq34Lp3
	 4KLgd6SJ01GbvFtqZrTHOU4PNqzAL7usAKoRH2lBapvnxEqT0ir7zrueYtjJUm5pvg
	 eFwcq9UGe1Dk7K9VRRTwVaDlgTI3zLrvz2YogYczVhi11QPiGZnvoOUBKDNYgEYiqi
	 J+3smDToYRaPYIPnrPAnm0CBvgoCzSKzsimhJyn9hLFDE4g690g4176IZgaxxxOUOk
	 /1ynOknIAOGhg==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 17:48:31 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH 4/4] phy: exynos5-usbdrd: add exynos7870 USBDRD support
In-Reply-To: <20250204-exynos7870-usbphy-v1-4-f30a9857efeb@disroot.org>
References: <20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org>
 <20250204-exynos7870-usbphy-v1-4-f30a9857efeb@disroot.org>
Message-ID: <ba9aee5d125cd9bd2eea02d283877b5a@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-02-03 20:40, Kaustabh Chakraborty wrote:
> From: Sergey Lisov <sleirsgoevy@gmail.com>
> 
> Implement support for Exynos7870 USB DRD on top of the existing
> exynos5-usbdrd driver.
> 
> Exynos7870 has a single USB 2.0 DRD PHY controller and no 3.0 PHYs. Thus,
> it only supports the UTMI interface.
> 
> Moreover, the PMU register offset for enabling the PHY controller is
> different for SoCs such as Exynos7870, where BIT(0) is for the 3.0 PHY and
> BIT(1) is for the 2.0 PHY. The phy_isol function for Exynos7870 uses the
> appropriate register offsets.
> 
> Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
> Co-developed-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c    | 260 ++++++++++++++++++++++++++++
>  include/linux/soc/samsung/exynos-regs-pmu.h |   2 +
>  2 files changed, 262 insertions(+)
> 

Please refrain from merging, wait for the next revision.
Thank you.
