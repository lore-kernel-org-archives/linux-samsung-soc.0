Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F31913D89D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 06:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732687750; cv=none; b=O+IStPyxwwYx/+IyoAecTuwEPqyAB+fYvywaCWEtm+PBC7ea/SPKMu1M8+03pQXxoRDjBPgQVRXl/2R0owjbPjBFI20jIHA9rNP7UnpGMiU85yako6RFBnw8zpeet3IvxnjsrXW3Pbt2lQCmpYdsyWVOFn3pGBzQvKKmqUSQLuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732687750; c=relaxed/simple;
	bh=bYkDd2FDNQhF6n7/ktLHR3Dlk+Dr0HT6E2QUUA+lxXw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=szMIHey7T198x0iPXu8ejRdnQXXeTFZLmzsjwS9RqeeW6C9Jlz7IigCiqqVEBlGyg+jrldmeE3dK2Y2/ulZN8U73RGj/xDwu03heCaaa9rObONAj6Uh0mXNO/XndBkPEVBO1aonZviReI1mxIMsonIqRmGHuSdARJ4FyWQrZCs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=A0x+544n; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="A0x+544n"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241127060905epoutp011da4ed4ef6fbc670b03e6367282a2d4b~LvlL41Jf-0628906289epoutp01j
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 06:09:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241127060905epoutp011da4ed4ef6fbc670b03e6367282a2d4b~LvlL41Jf-0628906289epoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1732687745;
	bh=ciGwo/b6Fo4IMrQIxYgYlTRHL77X9o02RKYiwTR6jxY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=A0x+544ni1/hJDIV9U1+cMuguKvekjMO4Q92rNLJZo48eSqR4ge3rEA+j/MCcYRbb
	 DkhWwaEbX/lDlx9xLpwt8MDQ9Lz5t6ruTq62/Sfv4a/4MxbqrpTUM0VmnBSSaKEtXq
	 ZZ8StHJUepxR3Dk/UrahVfe20UtdDDzz5K0MfPnY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241127060904epcas2p1e27d0114f8b112c19954c7680a0880e0~LvlLZPbMo1426114261epcas2p1-;
	Wed, 27 Nov 2024 06:09:04 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.88]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Xypt75xK5z4x9Q1; Wed, 27 Nov
	2024 06:09:03 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	95.E9.22938.F77B6476; Wed, 27 Nov 2024 15:09:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20241127060902epcas2p3477f29bef1164a4a48e6eee885aee505~LvlJToIYN2048020480epcas2p3-;
	Wed, 27 Nov 2024 06:09:02 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241127060902epsmtrp1a1d87017cf655b1e0411c550e217f242~LvlJSvI3h0303103031epsmtrp1z;
	Wed, 27 Nov 2024 06:09:02 +0000 (GMT)
X-AuditID: b6c32a43-0b1e27000000599a-fa-6746b77f51c2
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	88.29.18949.E77B6476; Wed, 27 Nov 2024 15:09:02 +0900 (KST)
Received: from KORCO078619 (unknown [10.229.8.183]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241127060902epsmtip141bd0d0f165d1fa9bc875fcfc1758418~LvlI_nc_40262902629epsmtip1P;
	Wed, 27 Nov 2024 06:09:02 +0000 (GMT)
From: =?UTF-8?B?64KY7IaM7JuQL1NPV09OIE5B?= <sowon.na@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>, <robh@kernel.org>,
	<krzk@kernel.org>, <conor+dt@kernel.org>, <vkoul@kernel.org>,
	<kishon@kernel.org>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <000101db4076$ac6b18a0$054149e0$@samsung.com>
Subject: RE: [PATCH v3 3/3] arm64: dts: exynosautov920: add ufs phy for
 ExynosAutov920 SoC
Date: Wed, 27 Nov 2024 15:09:01 +0900
Message-ID: <005801db4092$db115270$9133f750$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKN54LK9wdlweRKh/1XLNX4aAwNFgK+n1kYAa5oYP4BvfZb/rEz/krQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmqW79drd0g42b9CwezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLfYeecEswOXx6ZVnWwefVtW
	MXp83iQXwByVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6Dr
	lpkDdIuSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8C8QK84Mbe4NC9dLy+1xMrQ
	wMDIFKgwITtjW3d9wUXhiq/Pj7E3MDYKdDFyckgImEisnbGGGcQWEtjBKLF4JkcXIxeQ/YlR
	YtGH6YwQzjdGiV8PtzB1MXKAdSw4yA8R38soMe33EqjuF4wSLY9iQWw2AUeJldP+MoHYIgLT
	GSX2L7EC6WUWqJXY32kCEuYUsJLov/mQFcQWFoiRON7QxwhiswioSpxfep0RpJxXwFJi055S
	kDCvgKDEyZlPWEBsZgF5ie1v5zBD3K8g8fPpMlaITW4SrY09zBA1IhKzO9uYQc6UENjBIbFp
	wkt2iAYXiR93elggbGGJV8e3QMWlJF72t0HZ+RLrH95lg7ArJO4e+g9Vby+x6MxPdohXNCXW
	79KHhIiyxJFbUKfxSXQc/ssOEeaV6GgTgmhUkug4P4cJwpaQWPViMtsERqVZSB6bheSxWUge
	mIWwawEjyypGsdSC4tz01GSjAkN4NCfn525iBCdQLecdjFfm/9M7xMjEwXiIUYKDWUmEl0/c
	OV2INyWxsiq1KD++qDQntfgQoykwpCcyS4km5wNTeF5JvKGJpYGJmZmhuZGpgbmSOO+91rkp
	QgLpiSWp2ampBalFMH1MHJxSDUw7uA8nln80ZH5+RGqX7utZTxoe8r+buJfHTXVn1G2mB4eZ
	Lm5csrj9/MriR4r+8/4tLQzrddj2L6CaZ/dFL4FNC/VEuDvWBqbPWnitfEawWVDwrn9X3PY1
	uZY5mmhNt1m7wpOd/ca6TfHPZK9zyh8TDZs/T7dUMobpfvrDK/Hhgko31Y5acfQ1Gtt/T16/
	YXqzWO2X1spfs96/Xx1xuduxZ4+YbwaH0etTm8ryfp1T/HW1rkfM4uo5ps0rq62fGhi+e9cu
	rN3RraClsCOCX2eSn6pA+JO3NrVb9kaY7zA70vY0adLvxs8v05fN0eh88NTD6IcgW/euhfH/
	Yh9HhJ+1cWLxLE//8vpzWmKaQYMSS3FGoqEWc1FxIgCcAFm6KQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsWy7bCSnG7ddrd0g3MLxCwezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLfYeecEswOXx6ZVnWwefVtW
	MXp83iQXwBzFZZOSmpNZllqkb5fAlbGtu77gonDF1+fH2BsYGwW6GDk4JARMJBYc5O9i5OIQ
	EtjNKLG2vZGti5ETKC4h8e3NHiYIW1jifssRVoiiZ4wSR3qvsYMk2AQcJVZO+8sEkhARmMso
	MefWQWaQBLNAI6PExQ42iI7XjBKHmn6AJTgFrCT6bz5kBbGFBaIkuv/sBlvHIqAqcX7pdUaQ
	k3gFLCU27SkFCfMKCEqcnPmEBWKmtkTvw1ZGCFteYvvbOcwQ1ylI/Hy6jBXm0lfHt7BD2KYS
	b/93gsVFBNwkWht7oG4TkZjd2cY8gVF0FpIVs5CsmIVkxSwkLQsYWVYxSqYWFOem5xYbFhjl
	pZbrFSfmFpfmpesl5+duYgTHoZbWDsY9qz7oHWJk4mA8xCjBwawkwssn7pwuxJuSWFmVWpQf
	X1Sak1p8iFGag0VJnPfb694UIYH0xJLU7NTUgtQimCwTB6dUA9NWU7VnpXtiXx0OjFofG3rC
	z3UDA1P2dqfc7jbRugm6pz84zZkgzfEx/OTxdIt5Fisqp2ssv2e+NfHV7GdM8T+vnzB52C0j
	of7isuvze3+VTU4I2U9evHFeROdTuQ/On2SU/ijM8st4NOV99teHC7nN+F7497Vn/UpULskW
	e/pYwOy+ziwz/j1RFeU7Xr/8qND91f5V7MeEt/mF1v9ntk3f5LCUz45Z7dOd5XZzz8xqrK7O
	78pnleJbuW1D1hnx6X8lnN5vVODdfo5R4m6M8u5oZq9nZcsaiw59Z/7+/VayyeMZEsxRPqlS
	x9fwvXvzwD9j6ZsXZxXqlfpmr3zz9TPbQUOV1cu+ln0x8py53KJPiaU4I9FQi7moOBEAJ76n
	ADIDAAA=
X-CMS-MailID: 20241127060902epcas2p3477f29bef1164a4a48e6eee885aee505
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241118021011epcas2p3db133a3cffb13fba8ce3c973d8ffff65
References: <20241118021009.2858849-1-sowon.na@samsung.com>
	<CGME20241118021011epcas2p3db133a3cffb13fba8ce3c973d8ffff65@epcas2p3.samsung.com>
	<20241118021009.2858849-4-sowon.na@samsung.com>
	<000101db4076$ac6b18a0$054149e0$@samsung.com>

Hi Alim,

> -----Original Message-----
> From: Alim Akhtar <alim.akhtar@samsung.com>
> Sent: Wednesday, November 27, 2024 11:47 AM
> To: 'Sowon Na' <sowon.na@samsung.com>; robh@kernel.org; krzk@kernel.org;
> conor+dt@kernel.org; vkoul@kernel.org; kishon@kernel.org
> Cc: krzk+dt@kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-samsung-soc@vger.kernel.org
> Subject: RE: [PATCH v3 3/3] arm64: dts: exynosautov920: add ufs phy for
> ExynosAutov920 SoC
> 
> 
> 
> > -----Original Message-----
> > From: Sowon Na <sowon.na@samsung.com>
> > Sent: Monday, November 18, 2024 7:40 AM
> > To: robh@kernel.org; krzk@kernel.org; conor+dt@kernel.org;
> > vkoul@kernel.org; alim.akhtar@samsung.com; kishon@kernel.org
> > Cc: krzk+dt@kernel.org; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> > sowon.na@samsung.com
> > Subject: [PATCH v3 3/3] arm64: dts: exynosautov920: add ufs phy for
> > ExynosAutov920 SoC
> >
> > Add UFS Phy for ExynosAutov920
> >
> > Like ExynosAutov9, this also uses fixed-rate clock nodes until clock
> > driver has been supported. The clock nodes are initialized on
> > bootloader stage thus we don't need to control them so far.
> >
> > Signed-off-by: Sowon Na <sowon.na@samsung.com>
> > ---
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> 
> Are you planning to send UFS HCI patches as well?

Yes, I will send UFS HCI patches for ExynosAutov920 after phy patches.
Really thank you for your reviews.

> 
> >  arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > index c759134c909e..505ba04722de 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > @@ -361,6 +361,17 @@ pinctrl_aud: pinctrl@1a460000 {
> >  			compatible = "samsung,exynosautov920-pinctrl";
> >  			reg = <0x1a460000 0x10000>;
> >  		};
> > +
> > +		ufs_0_phy: phy@16e04000 {
> > +			compatible = "samsung,exynosautov920-ufs-phy";
> > +			reg = <0x16e04000 0x4000>;
> > +			reg-names = "phy-pma";
> > +			clocks = <&xtcxo>;
> > +			clock-names = "ref_clk";
> > +			samsung,pmu-syscon = <&pmu_system_controller>;
> > +			#phy-cells = <0>;
> > +			status = "disabled";
> > +		};
> >  	};
> >
> >  	timer {
> > --
> > 2.45.2
> 


