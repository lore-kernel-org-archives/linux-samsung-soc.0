Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670C06A33F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 01:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733360902; cv=none; b=NrC6fXFom82Q257J6vrH5+L8MbPRLW1dUzde64n+mSWqJRhBXgkXWTwi/8+91TYyNqxmsZBblSMS9R6DWKnhQ9bIlNbRLk6J4KjjCaZv1wgcTc/D8AUaLx9L3u4r8jBOA7MRDNw+cGapLPSkpQoY+yDxNsR42MrAwPhHRnOIsq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733360902; c=relaxed/simple;
	bh=Igw5Gv0p/mebWCaIigY/B9OQv1AhAHonhauAbiRGLZM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=XcbdRngukT6SxE5+qlFP9dAhb6mVE6OP+4XTr75SMMbteb1vdmVmsQJytXTxsr9dkHq2EQepPlQJdJvXvpH7tODEf6PTY6ZVX5x8WdWDXtoDRC8H7K3xhl/mEkj55pVn5tDjOc84QmWS2FrzymW/Yfl20p0pyAwh2Wq+QLPomW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=h4qJToKg; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="h4qJToKg"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241205010816epoutp04ce5fc1d045e02d7afe9e47f8992c6423~OIo00I92T3142231422epoutp04n
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 01:08:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241205010816epoutp04ce5fc1d045e02d7afe9e47f8992c6423~OIo00I92T3142231422epoutp04n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733360896;
	bh=YhVkkhykF8V+VMNYVyZo7kab5J5PPxq7Kvz1Fr0GRcM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=h4qJToKgdEfRy6LdmVszjlgVJpqfANUKTlviOgMjNncRLbdFp9Szmcv7sXX1T3s/v
	 s5PS2EuRd7a1hOIo/qRB3eY9SN54QGIs4FBOvma2DNETUSmzJwLAfJBhcgMVXXqW1P
	 u+yXFlb8Vp731/pD/14II2YTwZV8mCSl6Zrzcl5w=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20241205010815epcas5p1c94cd6495ae9743792e12021bc99147b~OIo0RYwT11233112331epcas5p1x;
	Thu,  5 Dec 2024 01:08:15 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Y3bqL0sXcz4x9Q8; Thu,  5 Dec
	2024 01:08:14 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E5.63.20052.CFCF0576; Thu,  5 Dec 2024 10:08:12 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20241205010811epcas5p11d9ff08741bedccc9b0c919bb74d4c78~OIowqoa943092230922epcas5p1M;
	Thu,  5 Dec 2024 01:08:11 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241205010811epsmtrp23ea566f2f861aeda7d030bb21298386d~OIowpz7p50201702017epsmtrp26;
	Thu,  5 Dec 2024 01:08:11 +0000 (GMT)
X-AuditID: b6c32a49-3fffd70000004e54-7d-6750fcfc5ed8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	20.85.18729.BFCF0576; Thu,  5 Dec 2024 10:08:11 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241205010810epsmtip1e1ed17a39d5a905c339d24f4d11452b6~OIovZjV250608906089epsmtip1F;
	Thu,  5 Dec 2024 01:08:10 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Igor Belwon'" <igor.belwon@mentallysanemainliners.org>, "'Rob
	Herring'" <robh@kernel.org>, "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20241204145559.524932-2-igor.belwon@mentallysanemainliners.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: soc: samsung: exynos-pmu: Add
 exynos990-pmu compatible
Date: Thu, 5 Dec 2024 06:38:09 +0530
Message-ID: <0f2401db46b2$2753d4d0$75fb7e70$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGGNHhzN/gxjLnIJKtzBVvnrIc1QgI9EESvAdNXXoqzYHgBEA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNJsWRmVeSWpSXmKPExsWy7bCmhu6fPwHpBn2rpC3W7D3HZDH/yDlW
	i2v7Z7FYvJx1j81i0+NrrBaXd81hs5hxfh+Txf89O9gdODw2repk89i8pN7j4fZDbB6fN8kF
	sERl22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYAXaGk
	UJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAp0CtOzC0uzUvXy0stsTI0MDAyBSpM
	yM7417SZpWAub8XbvX3sDYw3uboYOTkkBEwknh67y9zFyMUhJLCbUeLopfNMEM4nRon1L+ax
	gVQJCXxjlDi2yRam48mTVkaIor2MEnNWTWSHcF4wSmxdd5cVpIpNQFdix+I2NpCEiMBORokN
	O+eDzWUW6AdyvrwAq+IU8JV4eH4JO4gtLJAoMX31MSYQm0VARWL3z5ksIDavgKXE575zjBC2
	oMTJmU/A4swC8hLb385hhrhJQeLn02VgM0UEnCSefLwEVSMu8fLoEbDzJASmckg0PrvJCtHg
	IrH22WN2CFtY4tXxLVC2lMTnd3vZIOxsieMXZ0HZFRLdrR+hauwldj66CbSAA2iBpsT6XfoQ
	u/gken8/YQIJSwjwSnS0CUFUq0o0v7vKAmFLS0zs7oa6wEPi8/cPzBMYFWch+WwWks9mIflg
	FsKyBYwsqxglUwuKc9NTi00LDPNSy+Exnpyfu4kRnEq1PHcw3n3wQe8QIxMH4yFGCQ5mJRHe
	IO2AdCHelMTKqtSi/Pii0pzU4kOMpsDgnsgsJZqcD0zmeSXxhiaWBiZmZmYmlsZmhkrivK9b
	56YICaQnlqRmp6YWpBbB9DFxcEo1MC33Vju62EYuMTNox4q8BCZ3Dh+uQ3/2THO7zJ789Lj3
	tekbLv+/Ff6avTP9mNf3TaILv8tWNx3ZK5PsxXF9ptpp/WD7Nxw5ajZR4pxSrUbTrKtSFTLf
	72ZUZHNxfPxezVss3vgWN0vU56xLyX5aRVsZ4lbJyggnqLJ5RPLc7p4y5erlHCVfttl6U6RO
	heeXxNxde1Ar/Yybt25n9mmGaem1HPrcN+0WSbF1z25afPO12mpe96fvI9NSs2cdOzbxTMb8
	57v6s4s3ZSs+Wen4R0GCUefy8dcRixe0i9xVtilnevahR6n5SVjF6+9f9eKesf2P2L2atUdT
	vUVddHKikuTenFflZ/Zszp8yIXyKEktxRqKhFnNRcSIA61RwPi4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmkeLIzCtJLcpLzFFi42LZdlhJTvf3n4B0g4Z3RhZr9p5jsph/5Byr
	xbX9s1gsXs66x2ax6fE1VovLu+awWcw4v4/J4v+eHewOHB6bVnWyeWxeUu/xcPshNo/Pm+QC
	WKK4bFJSczLLUov07RK4Mv41bWYpmMtb8XZvH3sD402uLkZODgkBE4knT1oZuxi5OIQEdjNK
	rPj8mREiIS1xfeMEdghbWGLlv+fsEEXPGCVO/7zJCpJgE9CV2LG4jQ0kIQLS/f3nE1YQh1lg
	MpBzYC0TRMt9RonP6xeDzeIU8JV4eH4JmC0sEC8xefIasH0sAioSu3/OZAGxeQUsJT73nWOE
	sAUlTs58AhTnAJqqJ9G2ESzMLCAvsf3tHGaI8xQkfj5dBnaRiICTxJOPl1ggasQlXh49wj6B
	UXgWkkmzECbNQjJpFpKOBYwsqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxguNJS3MH
	4/ZVH/QOMTJxMB5ilOBgVhLhDdIOSBfiTUmsrEotyo8vKs1JLT7EKM3BoiTOK/6iN0VIID2x
	JDU7NbUgtQgmy8TBKdXAtOh9uFdF8PTFIip3ur2mLPVNunQsxs4g7IiJVvSq9Mdf2hZFb5eK
	Tki3yNnssEfvhM+vpO5V1Qc95NZt/7Dn9D2RTfmPF3D9DmFnLGeUWP1v0tSl3+SOfv7klunB
	6WG358UDa9H32198umx2O+vgzqXZchVMJTF2jR5Xmpbcu+6q4BW+//7N/xJXLzwXM87o+/3U
	r21vkswvg5DZDVxxhwVzr8/YKD6vU8HaqaOXd0ekaQ9H0ZKyA/u4jiz7r7ggbLpXQPCBoit8
	ze2nWrO17/B5Ntf8+CKnK/dDdu7s5+titnoyPONex7WukU+6qYhdtmuy+OUgY6+gTcczVz3e
	tdywxFD9wa+efXHbAguklFiKMxINtZiLihMBRg6KshYDAAA=
X-CMS-MailID: 20241205010811epcas5p11d9ff08741bedccc9b0c919bb74d4c78
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241204145947epcas5p3f4fc2a6d35669293b339a31d85daef1c
References: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
	<CGME20241204145947epcas5p3f4fc2a6d35669293b339a31d85daef1c@epcas5p3.samsung.com>
	<20241204145559.524932-2-igor.belwon@mentallysanemainliners.org>

Hi Igor

> -----Original Message-----
> From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> Sent: Wednesday, December 4, 2024 8:26 PM
> To: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Alim Akhtar
> <alim.akhtar@samsung.com>
> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
linux-
> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH v2 1/2] dt-bindings: soc: samsung: exynos-pmu: Add
> exynos990-pmu compatible
> 
> Add a dt-binding compatible for the Exynos990 PMU. It's compatible with
the
> Exynos7 PMU design. It handles system reboot, as well as other system
> control registers (i.e registers for the USB PHY).
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-
> pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-
> pmu.yaml
> index 6cdfe7e059a3..8e6d051d8c97 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -55,6 +55,7 @@ properties:
>                - samsung,exynos7885-pmu
>                - samsung,exynos8895-pmu
>                - samsung,exynos9810-pmu
> +              - samsung,exynos990-pmu
>                - samsung,exynosautov9-pmu
>                - samsung,exynosautov920-pmu
>                - tesla,fsd-pmu
> --
> 2.45.2


