Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC4C39B4B9
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 03:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702001; cv=none; b=pD24G1v+kNNtdhHB5ShSYk4ygrnv1DpDgHBhaf7jGHYWhMF2MfFpVNUqMQIKKdiDtv+hK7jiTJnqDanuohngppUw4CcqPS74AwnnFeUvQGqcVkldj1qui7RC0h9lMoky58ensG1r6BdlteVKSpxjUqQX8NbkG7x7UsrK8VstBag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702001; c=relaxed/simple;
	bh=FVLb/9tqKLCgDSW4Yyg9YW80snztJMnzKO2aSwSdmXw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=JP91xOLJj2Vbvw3tIJ527gErKlsliEMuTLoV6PYlJOp0wRVjgrxyF8e8+n8mSTXxT7s7QJHT2/uDAcdmXjdg0zzFfnKY5eUQkYrwlOp9CB+7TB9hAKlLsx7Ju3qxMX77LFzNKMO/ABR/jgKXLVxYipQluI9dzkf2ixJoqHPR2t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EQxAx70B; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EQxAx70B"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260918031915epoutp036e53324a3beda3f2d77e5206d339e4c2~WTBUjdLiC1425514255epoutp03D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 03:19:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260918031915epoutp036e53324a3beda3f2d77e5206d339e4c2~WTBUjdLiC1425514255epoutp03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789701555;
	bh=HKnmLzLUgthxmMsJgAHHDg791TGmTKkEbBQOle2AQa4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=EQxAx70BgAMbeQjPN03QPSCdtTJoMWBCiuQaiXLyqB8k2WTR2AJJnHSoUtWNxDFMl
	 X17swJE/eybHVt50yrWC1p1554LLztXK0LD64x9yq58S6lZJyiDrSPlbcB7dYyxgaV
	 7e8vTEZO+kKR/OzyFRJ6B0HDF2EyLHZ3OzLc1flQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260918031914epcas5p4317137185eac02f3cbd6d83eac1a8a07~WTBT4RTGW0273202732epcas5p4D;
	Fri, 18 Sep 2026 03:19:14 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hmHsY6F4Mz2SSKY; Fri, 18 Sep
	2026 03:19:13 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260918031913epcas5p48cf1033745bf88d80a3b0c355cf76310~WTBSQ-IGk0273202732epcas5p4-;
	Fri, 18 Sep 2026 03:19:13 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260918031910epsmtip13eff1b3e2ad0dd2db9ce3ea5448d3bb8~WTBPgtuoX2962729627epsmtip19;
	Fri, 18 Sep 2026 03:19:10 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Selvarasu Ganesan'" <selvarasu.g@samsung.com>, <krzk@kernel.org>,
	<peter.griffin@linaro.org>, <gregkh@linuxfoundation.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <mani@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Cc: <jh0801.jung@samsung.com>, <h10.kim@samsung.com>,
	<dh10.jung@samsung.com>, <akash.m5@samsung.com>, <hongpooh.kim@samsung.com>,
	<eomji.oh@samsung.com>, <shijie.cai@samsung.com>,
	<muhammed.ali@samsung.com>, <thiagu.r@samsung.com>
In-Reply-To: <20260916122229.2604003-2-selvarasu.g@samsung.com>
Subject: RE: [PATCH v2 1/3] MAINTAINERS: add Samsung USB DT binding to
 ARM/SAMSUNG entry
Date: Fri, 18 Sep 2026 08:49:08 +0530
Message-ID: <058201dd471c$7a543be0$6efcb3a0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGcfDqIrCW7OKewQ35ZfbAvR1onfQLSUTwAAgT4kRu3LoX/AA==
Content-Language: en-us
X-CMS-MailID: 20260918031913epcas5p48cf1033745bf88d80a3b0c355cf76310
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142@epcas5p3.samsung.com>
	<20260916122229.2604003-2-selvarasu.g@samsung.com>



> -----Original Message-----
> From: Selvarasu Ganesan <selvarasu.g@samsung.com>
> Sent: Wednesday, September 16, 2026 5:52 PM
> To: krzk@kernel.org; peter.griffin@linaro.org; alim.akhtar@samsung.com;
> gregkh@linuxfoundation.org; robh@kernel.org; conor+dt@kernel.org;
> Thinh.Nguyen@synopsys.com; mani@kernel.org;
> selvarasu.g@samsung.com; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: jh0801.jung@samsung.com; h10.kim@samsung.com;
> dh10.jung@samsung.com; akash.m5@samsung.com;
> hongpooh.kim@samsung.com; eomji.oh@samsung.com;
> shijie.cai@samsung.com; muhammed.ali@samsung.com;
> thiagu.r@samsung.com
> Subject: [PATCH v2 1/3] MAINTAINERS: add Samsung USB DT binding to
> ARM/SAMSUNG entry
> 
> Add the Samsung USB devicetree binding file path under the existing
> ARM/Samsung SoC maintainership.
> 
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a53620839407..87a1ab24a375 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3576,6 +3576,7 @@ F:
> 	Documentation/devicetree/bindings/arm/samsung/
>  F:	Documentation/devicetree/bindings/hwinfo/samsung,*
>  F:	Documentation/devicetree/bindings/power/pd-samsung.yaml
>  F:	Documentation/devicetree/bindings/soc/samsung/
> +F:	Documentation/devicetree/bindings/usb/samsung,*
>  F:	arch/arm/boot/dts/samsung/
>  F:	arch/arm/mach-exynos*/
>  F:	arch/arm/mach-s3c/
> --
> 2.17.1


