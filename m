Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E791F225793;
	Mon,  7 Jul 2025 18:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751912364; cv=none; b=M67HhSvBjf7fyYi7LC6UsWtRmo/Zrdhk7gI3vteeU5kGUqZgbEWkcReeg/GqpUXuh++Ns3+McbDK13gNjQkt0qWh4/9TadnH8Dh8lXNq3mmQUr+oN910oA+j5jim4mKim65z7RIPsqBy3II0WBDnl7Bn4KSREy+0tXuoDnYiIBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751912364; c=relaxed/simple;
	bh=p/dxjs15L0a5Sz3tQHqcixRBIuA7PAMaCm/nWUbvrek=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=pHt6zeHHfZ0weD4hi4WxRlGNoB0qpggMPNbEWE46GmMKMWUzL3F1egsvLANilweXFKuwbDT55XgIL+gRR3rPD6VtRda2Buts+bltHtNcYK6vTSls2jCLhTB0alF7IcbZHrznTlBLOM0jpGGKORJ/OtcTgv46dZEtpdS/2ADN7Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=T00pbbO+; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="T00pbbO+"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2AF6F2594D;
	Mon,  7 Jul 2025 20:19:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOWxhEcrvivp; Mon,  7 Jul 2025 20:19:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751912352; bh=p/dxjs15L0a5Sz3tQHqcixRBIuA7PAMaCm/nWUbvrek=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=T00pbbO+jCdvdkvIOoT6jI7hss0OLTm99ZQjqyKP0L63hGzaxERsjIaztPSoaoORF
	 1bJYYaStDXrDm/zv9bRXZce5ftZbkx23l4AEXDtrOymMtJhsbUjhm38jaX7O5wrPM2
	 /UpYZ1axzfYs7RRBc2kG7fJ6FkyUHqIVB+8dCpzrkEKBmrWH5psxF0s206xVOUjuKE
	 fKwMdeNUIththWg4Ux0gZLKiAL0HNGC3sy8lJPqFR1K2EtfxHzfAz4r3Tq2vG/tb9c
	 qQiwDnl2UnKi8Px8Hgcz9jWGx/gAP771HIfkKehg+zgY26YirynXh2y9IOan+DWhKH
	 vES+3MNw0y1yQ==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 07 Jul 2025 18:19:12 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: exynos-mipi-video: allow skipping absent PHYs
In-Reply-To: <ff887aaf-966a-41ff-a905-f791820136fd@kernel.org>
References: <20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org>
 <20250627-exynos7870-mipi-phy-fix-v1-2-2eefab8b50df@disroot.org>
 <ff887aaf-966a-41ff-a905-f791820136fd@kernel.org>
Message-ID: <2153e31b0b15d2b5b630aa4c387dc4b3@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-05 08:35, Krzysztof Kozlowski wrote:
> On 26/06/2025 22:01, Kaustabh Chakraborty wrote:
>> 
>>  struct mipi_phy_device_desc {
>> -	int num_phys;
>>  	int num_regmaps;
>>  	const char *regmap_names[EXYNOS_MIPI_REGMAPS_NUM];
>>  	struct exynos_mipi_phy_desc {
>> +		bool present;
>>  		enum exynos_mipi_phy_id	coupled_phy_id;
>>  		u32 enable_val;
>>  		unsigned int enable_reg;
>> @@ -54,10 +54,9 @@ struct mipi_phy_device_desc {
>>  static const struct mipi_phy_device_desc s5pv210_mipi_phy = {
>>  	.num_regmaps = 1,
>>  	.regmap_names = {"syscon"},
>> -	.num_phys = 4,
>>  	.phys = {
>> -		{
>> -			/* EXYNOS_MIPI_PHY_ID_CSIS0 */
>> +		[EXYNOS_MIPI_PHY_ID_CSIS0] = {
> 
> 
> This should be a separate change... but overall I don't like existing
> idea and I think your change is a reason to fix actual code style 
> issue:
> 
> It is expected that each variant will define static const array and 
> then
> you assign in:
> 
> static const struct mipi_phy_device_desc exynos5420_mipi_phy = {
> 	.phys = exynos5420_mipi_phys_data
> }
> 
> which means:
> 1. You don't waste space for unused entries (now you always allocate 5
> entries, even if you have one phy)
> 2. You can count them easily - ARRAY_SIZE
> 3. Index in the array won't the the phy ID, so you need a separate ID
> member for that
> 4. You do not need this odd 'present' field, because really code which
> is not initalized should mean 'not present' and it should be never
> needed to initialize additionally to indicate 'yes, I do exist' beyond
> basic initializations.

Weird, I don't know why had I even developed this patch. The 'issue' it
fixes isn't even an issue. Oversight, I'll drop it I guess...

> 
> Best regards,
> Krzysztof
