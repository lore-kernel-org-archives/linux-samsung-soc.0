Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3CA8F7D;
	Tue, 24 Dec 2024 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735052377; cv=none; b=uaxeFW1TkaU/0PVWiXGp5Nr1ElYQxlCHGnkC4O2bTMUyzl6YUPsP3Vhc4uhcmr4GqP5RiIjVQkhE3x0O40IbSNoewUQTUGl5KhTG40WTSwkdG/DM7I9K+41Z3GkZvxpJ9ziCSXJXofJr8GTsqkyoMICT/mvJmSnXvy66eZak6S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735052377; c=relaxed/simple;
	bh=qT5ChtlIrgcs45op1LpL0bwVYygr34H/qJ53ad3vQnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7glK0G87YWxvGQOI+wy6KFawxCWX0fxRFWfRaTND4PL6PeqrGIQAU7TDZW0yY7hMbTbYQe3E/1UuM2d5UsCAv7IXLWEub1f9UWnVJLBSewK6UnyDd/wE5N9+jWrD3SzuAy86PRkU47j6FCnpCBqXgdtrmA58od5AObFI9G9XvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXozPK10; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXozPK10"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0389DC4CED0;
	Tue, 24 Dec 2024 14:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735052376;
	bh=qT5ChtlIrgcs45op1LpL0bwVYygr34H/qJ53ad3vQnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXozPK10Tc9hmBtlkhWeDnWqy22gFeOr2+SmEs52Y+fg616zsOd1VL61Mrr3vBjQ5
	 AbnO8QW3q1IO0XZ7AZwJ483gujScysvJfGYLI2+I+sbPNLzsHl+pKFojAGsIq8uyO3
	 k+nvSqc9LJZLDy5BSnaVhXXE2MKezyGnRZl5zKIb1Teh3F26EGt7DnCs14AeU/sMzW
	 U/12vG0G/UsNNDIeNmif1UPA2jxbk/PrAepbiKY6G4s01qW4cIDC5oPKcE6EkOeXf0
	 85aYyKPlCVHl7pKjcSpdo1TvueRMzXtz1V5RtsoWymnCjt1dn1sz612EIJ5yzi8h4L
	 0WzGRZnEs9qTg==
Date: Tue, 24 Dec 2024 20:29:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?B?64KY7IaM7JuQL1NPV09O?= NA <sowon.na@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	kishon@kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
	'Alim Akhtar' <alim.akhtar@samsung.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY
 bindings
Message-ID: <Z2rMVCxo6Kk7vpF0@vaman>
References: <20241118021009.2858849-1-sowon.na@samsung.com>
 <CGME20241118021011epcas2p21593217ccf58afddad5ce36f510e7cb6@epcas2p2.samsung.com>
 <20241118021009.2858849-2-sowon.na@samsung.com>
 <000001db3a42$c5a79b70$50f6d250$@samsung.com>
 <001401db50ec$a31703a0$e9450ae0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001401db50ec$a31703a0$e9450ae0$@samsung.com>

On 18-12-24, 10:32, 나소원/SOWON NA wrote:
> Hi Krzysztof,
> 
> > -----Original Message-----
> > From: 나소원/SOWON NA <sowon.na@samsung.com>
> > Sent: Tuesday, November 19, 2024 3:36 PM
> > To: 'Alim Akhtar' <alim.akhtar@samsung.com>
> > Cc: 'robh@kernel.org' <robh@kernel.org>; 'krzk@kernel.org'
> > <krzk@kernel.org>; 'conor+dt@kernel.org' <conor+dt@kernel.org>;
> > 'vkoul@kernel.org' <vkoul@kernel.org>; 'kishon@kernel.org'
> > <kishon@kernel.org>; 'krzk+dt@kernel.org' <krzk+dt@kernel.org>; 'linux-
> > kernel@vger.kernel.org' <linux-kernel@vger.kernel.org>;
> > 'devicetree@vger.kernel.org' <devicetree@vger.kernel.org>; 'linux-samsung-
> > soc@vger.kernel.org' <linux-samsung-soc@vger.kernel.org>; 'Krzysztof
> > Kozlowski' <krzysztof.kozlowski@linaro.org>
> > Subject: RE: [PATCH v3 1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY
> > bindings
> > 
> > Hi Alim,
> > 
> > On 11/19/24 2:21 PM, Alim Akhtar wrote:
> > > -----Original Message-----
> > > From: Alim Akhtar <alim.akhtar@samsung.com>
> > > Sent: Tuesday, November 19, 2024 2:21 PM
> > > To: 'Sowon Na' <sowon.na@samsung.com>; robh@kernel.org;
> > > krzk@kernel.org;
> > > conor+dt@kernel.org; vkoul@kernel.org; kishon@kernel.org
> > > Cc: krzk+dt@kernel.org; linux-kernel@vger.kernel.org;
> > > devicetree@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> > > 'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>
> > > Subject: RE: [PATCH v3 1/3] dt-bindings: phy: Add ExynosAutov920 UFS
> > > PHY bindings
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Sowon Na <sowon.na@samsung.com>
> > > > Sent: Monday, November 18, 2024 7:40 AM
> > > > To: robh@kernel.org; krzk@kernel.org; conor+dt@kernel.org;
> > > > vkoul@kernel.org; alim.akhtar@samsung.com; kishon@kernel.org
> > > > Cc: krzk+dt@kernel.org; linux-kernel@vger.kernel.org;
> > > > devicetree@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> > > > sowon.na@samsung.com; Krzysztof Kozlowski
> > > > <krzysztof.kozlowski@linaro.org>
> > > > Subject: [PATCH v3 1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY
> > > > bindings
> > > >
> > > > Add samsung,exynosautov920-ufs-phy compatible for ExynosAuto v920 SoC.
> > > >
> > > > Signed-off-by: Sowon Na <sowon.na@samsung.com>
> > > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > ---
> > > I am not sure how we can help you, you are keep missing to collect all
> > > the tags
> > > https://lkml.org/lkml/2024/11/7/617
> > >
> > Really sorry for missing tags. I append it immediately, and will not miss
> > anymore.
> > Your review helps me a lot and makes my patch better. I applied all your
> > reviews to my patches.
> > 
> > Thank you a lot once again for your help.
> > 
> 
> I missed including the "Reviewed-by" tag in the patch set I sent.
> Could you please let me know if you'd prefer me to send a v4 with the
> tag included, or if you're able to apply it with the missing tag?

Please wrap your replies in 80chars

Yes pls add and post v4

> 
> Thank you for your understanding, and I apologize for the oversight.
> 
> Best regards,
> Sowon.
> 
> 

-- 
~Vinod
