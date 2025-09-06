Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9AD1EF397;
	Sat,  6 Sep 2025 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757169613; cv=none; b=GfBgYOZ1wmNCGXKGlOAYlUGgEqdanp24Th/iZtboN8NNFouCQF4iH9dp7SkYoTAVO2czvnWVSSz3ztB0bMFHj1Ggz9GuD/pZT+6gNxNIPOZa0L/8Ao7F3z/10XiAIqJ6xfdlD4u+Tc56ZvBT7tR3XE/SiWbxpcoG0elDgUHUrNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757169613; c=relaxed/simple;
	bh=aVFgzYVH/l9q9RdvbtwCOPYFvId/k0YEg8x9uNgy7hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Afs5/y8sih6faQkHi/ilFO6j2dQlFACsqb58hyu+w1kVgOgtsyAbr8D7jyZntT9b0MxFDbAHPDIga6KG2iSOdbtQvh1c9eB5TTEbNmwToME2QfQnW3f34HUn8MzSH1jqJO3I18F2Yt40X25Vt7zsMAUMRWTeTTOgfeQbguJ8AoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=YZeaiJdt; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="YZeaiJdt"
Date: Sat, 6 Sep 2025 16:39:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1757169602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hdz1IXPxD69RvzVQVv1KLuhJWBeYqAlL5nvpy6TmTUw=;
	b=YZeaiJdtt8APk1CwKAYZ2d1Fj18ySlsQfFCdpCyJyJyKXHWASzHZ0O4LOoStxOMHDwqCMJ
	ZxQels++QzlNAWWm0vDyovdk/LSu8qdzPxaMbrv/Q0sReLLhsLX7AiIsuJbNmfLsXOT39d
	BO/Xv2J9D74BaDGE8P2stFjjVjhOAk8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: samsung: exynos5250: describe sromc bank
 memory map
Message-ID: <20250906143958.GA7600@l14.localdomain>
References: <20250904-smdk5250-sromc-v1-0-b360c6ab01c6@grimler.se>
 <20250904-smdk5250-sromc-v1-1-b360c6ab01c6@grimler.se>
 <4959ce59-84aa-40a5-aa07-f2dfa856d9b2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4959ce59-84aa-40a5-aa07-f2dfa856d9b2@kernel.org>
X-Migadu-Flow: FLOW_OUT

Hi Krzysztof,

On Sat, Sep 06, 2025 at 02:24:21PM +0200, Krzysztof Kozlowski wrote:
> On 04/09/2025 08:10, Henrik Grimler wrote:
> > According to public user manual for Exynos 5250 [1], the SROM
> > controller has 4 banks, at same addresses as for example Exynos
> > 5410. Describe the bank memory map of the SoC.
> > 
> > [1] https://web.archive.org/web/20130921194458/http://www.samsung.com/global/business/semiconductor/file/product/Exynos_5_Dual_User_Manaul_Public_REV100-0.pdf
> > 
> > Signed-off-by: Henrik Grimler <henrik@grimler.se>
> > ---
> >  arch/arm/boot/dts/samsung/exynos5250.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/samsung/exynos5250.dtsi b/arch/arm/boot/dts/samsung/exynos5250.dtsi
> > index b9e7c493881804647534b1d7395f6eb62a07fb92..741cc693f5d8f6b33772d7819c965c590571f305 100644
> > --- a/arch/arm/boot/dts/samsung/exynos5250.dtsi
> > +++ b/arch/arm/boot/dts/samsung/exynos5250.dtsi
> > @@ -1214,6 +1214,15 @@ &serial_3 {
> >  	dma-names = "rx", "tx";
> >  };
> >  
> > +&sromc {
> > +	#address-cells = <2>;
> > +	#size-cells = <1>;
> > +	ranges = <0 0 0x04000000 0x20000
> 
> 
> These should be separate tupples, so
> 
> <0 0 0x04000000 0x20000>,
> <....>,
> <....>,

Thanks, will send a v2 to fix it, and update exynos5410.dtsi, in a day
or two!

> Best regards,
> Krzysztof

Best regards,
Henrik Grimler
