Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DC2231A50
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jan 2025 07:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736753134; cv=none; b=DnfGLbOt7X/YM0+n/6pVmlQ+oxOebal0pz02pip6RCqTWmgwGUnjav/ZG0exBlGckgL5yQG4zWXILDjtHcIp/8iUkyXhEpYIWPqkMgKNdXjiPvJaxahTRwQcoLWqKp9q55mDqw+uQ8GkFuQQW9YGm5hLPKxME4FSny84WZgj4+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736753134; c=relaxed/simple;
	bh=vLxK9kCiNhRmeVJOrScPwyT3tOezqgo0CjNRyjzBxkg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=VxBv0TARZLlOko5q1RmqcTYRDsbA0lGNlSgI4sC2Zx8EUVrxuQ5e0P9bUVcm8hjCKf27aO8+r7jnRK7IDeHK5L7uX7FElF/QZQpZ1gQHmVGZgqd3Rz3s8pogvvrz8Gkw4/UutR6h99wLwoiFc5432LSFap4qH48T0BNz/+35Yqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Mbui2LO6; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Mbui2LO6"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250113072523epoutp0309b21045ad65224fc3c42a4eafcd775e~aL8O2PQp41426614266epoutp03V
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jan 2025 07:25:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250113072523epoutp0309b21045ad65224fc3c42a4eafcd775e~aL8O2PQp41426614266epoutp03V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1736753123;
	bh=WkCWYHTQGDIwmO+j3qhFei4FrNp6GwwlquFou5+NMYI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Mbui2LO6mI0xHUNvTs/aHBUSr/sXvYOJsXh9Y7dfqSDRuCNIuXwmQGEZeKB1YFuk0
	 Vrokb1NUiSPOtWbK6EbbPKlGNb0wKYv5gxjAlClU3+aGlqBa8/5pLJ1p8ItGU7iXdo
	 BAuEQw7uf/9ONmfHMWSixummX76yqRdTqSdL4th8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20250113072523epcas2p1306db34a76855979540454bb3943a1c8~aL8OZPx173015930159epcas2p1a;
	Mon, 13 Jan 2025 07:25:23 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.98]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4YWkLV4btgz4x9Q9; Mon, 13 Jan
	2025 07:25:22 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	40.89.32010.1EFB4876; Mon, 13 Jan 2025 16:25:21 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250113072521epcas2p3407e7a18e7a17f6e9c35b3dda27d813c~aL8MfiA8I1253612536epcas2p3l;
	Mon, 13 Jan 2025 07:25:21 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250113072521epsmtrp2c3f9c0f5e22a23be68b856f7f050c5ee~aL8MeyIqN1851618516epsmtrp2M;
	Mon, 13 Jan 2025 07:25:21 +0000 (GMT)
X-AuditID: b6c32a4d-acffa70000007d0a-8f-6784bfe12425
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A0.1D.18729.1EFB4876; Mon, 13 Jan 2025 16:25:21 +0900 (KST)
Received: from KORCO078619 (unknown [12.36.160.53]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250113072521epsmtip1d8fbb6808b7317e71d0cf1dd30a9ac68~aL8MUSgbZ1685816858epsmtip1s;
	Mon, 13 Jan 2025 07:25:21 +0000 (GMT)
From: =?utf-8?B?64KY7IaM7JuQL1NPV09OIE5B?= <sowon.na@samsung.com>
To: <vkoul@kernel.org>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<robh@kernel.org>, <krzk@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <kishon@kernel.org>
In-Reply-To: <20241226031142.1764652-1-sowon.na@samsung.com>
Subject: RE: [PATCH v4 0/3] Support ExynosAutov920 ufs phy driver
Date: Mon, 13 Jan 2025 16:25:20 +0900
Message-ID: <000001db658c$4dce63c0$e96b2b40$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH4Gf4Ht2pT+J2pScYPrVRUV1+UogJvt6+kssdl10A=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPJsWRmVeSWpSXmKPExsWy7bCmhe7D/S3pBv8v6Fg8mLeNzWLN3nNM
	FvOPnGO1ONr6n9ni5ax7bBbnz29gt7i8aw6bxYzz+5gs/u/ZwW6x884JZgcuj02rOtk8+ras
	YvT4vEkugDkq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DX
	LTMH6BYlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToF5gV5xYm5xaV66Xl5qiZWh
	gYGRKVBhQnbGnI/fmQsmCVTMvsrWwPiFp4uRk0NCwETiytQlLF2MXBxCAnsYJfpX32SDcD4x
	SmzdMQXK+cYocensXyaYlu8LtrJDJPYySnQ1bWKEcF4wSvw5fJcVpIpNwFGi7cEiFhBbREBM
	4t+7h2BFzALvGCXmve1mB0lwCthInGibydzFyMEhDNQw7QsXSJhFQFXiwNXbYL28ApYSK+bs
	YISwBSVOznwCFmcWkJfY/nYOM8RFChI/ny5jhdhlJfFh4Wd2iBoRidmdbcwgeyUEtnBIzP2z
	jxWiwUVi/fTzbBC2sMSr41vYIWwpic/v9kLF8yXWP7wLZVdI3D30nwXCtpdYdOYnO8jNzAKa
	Eut36YOYEgLKEkduQZ3GJ9Fx+C87RJhXoqNNCKJRSaLj/BxoGEpIrHoxmW0Co9IsJI/NQvLY
	LCQPzELYtYCRZRWjVGpBcW56arJRgaFuXmo5PL6T83M3MYJTqpbvDsbX6//qHWJk4mA8xCjB
	wawkwvtGsDFdiDclsbIqtSg/vqg0J7X4EKMpMLgnMkuJJucDk3peSbyhiaWBiZmZobmRqYG5
	kjhv9Y6WdCGB9MSS1OzU1ILUIpg+Jg5OqQamwsS7GdKHNl9Xs9Fc/P7TKS2nO3ZL3Tb9v/jw
	9WvmBZfzvy7ik7m3//ql1uLQn1e4FglfSq+Ykln6ysM/24ZH5/3LuLO2Sl4Hn8wKTnC7uaQs
	Mp/3jrbcMT410fdpDWcjjHg5IzokH0UpPQjtnJvYaZ6uX7/kjulnkReWPAxmms22Ml+Ohu45
	ExSaUHt708H8bx7iWicrpxmvqI6Ts/9+OnPxbKmNksUabCdLeXh+RJcen1KS9zh873bxbuuO
	n20rdztKGa488J8/rfnXbo6DrPVn4kIPKMa12NdxHXLdHjLhSrIf68klYdJGp34/ks0raDhm
	nKx5vTbhulxOyKlZRYsVS5ey3bZr2tgTLaHEUpyRaKjFXFScCABnbrd1MgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsWy7bCSnO7D/S3pBuueiVg8mLeNzWLN3nNM
	FvOPnGO1ONr6n9ni5ax7bBbnz29gt7i8aw6bxYzz+5gs/u/ZwW6x884JZgcuj02rOtk8+ras
	YvT4vEkugDmKyyYlNSezLLVI3y6BK2POx+/MBZMEKmZfZWtg/MLTxcjJISFgIvF9wVb2LkYu
	DiGB3YwSi25uYYJISEh8e7MHyhaWuN9yhBWi6BmjxLUX/xlBEmwCjhJtDxaxgNgiAmIS/949
	ZAQpYhb4wSjxef8kNoiOXkaJ7/NXglVxCthInGibydzFyMEhDNQ97QsXSJhFQFXiwNXbYCW8
	ApYSK+bsYISwBSVOznwCFmcW0JZ4evMplC0vsf3tHGaI6xQkfj5dxgpxhJXEh4Wf2SFqRCRm
	d7ZB1ZhKrPw8kxXmm7sPXrJPYBSdhWTFLCQrZiFZMQvJqAWMLKsYJVMLinPTc4sNCwzzUsv1
	ihNzi0vz0vWS83M3MYIjUUtzB+P2VR/0DjEycTAeYpTgYFYS4X0j2JguxJuSWFmVWpQfX1Sa
	k1p8iFGag0VJnFf8RW+KkEB6YklqdmpqQWoRTJaJg1OqgcnszJ/Khvkbs4/EKP35WdQ5Zf2d
	Z4sPskRWiS+zEt6zsMjjmPdr/mNvO4UkfmTOZ3isX5pvm+Dn8d70fZjVrbncOa1ODbxz1OZp
	1+5VOCm8wvF8xdzppYFpFhsfFIfs52mTjDp4a/Pj7XcriqdfPdbQv/COgba4fLjTdS0FnzvP
	1K1cmlcvW1HlyG0e1O6bxit0c2bQj7ulH48l7//Cw3257ta3jmVJslf/TkrJdZf55CM0m/Vs
	+fnvSwQ37vLawPzXjKfDSKx9j/H7P3dmnBaXrfvmLxtr/vBA9OxJm/JFv3S+X96m6du7xC1f
	g5Xhg/Vc2fqXK/n9rC43dFrly745sv+g9XGVMkm3yzsKDymxFGckGmoxFxUnAgAgX5O4MwMA
	AA==
X-CMS-MailID: 20250113072521epcas2p3407e7a18e7a17f6e9c35b3dda27d813c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241226031145epcas2p4fa41b44749a7f675364437856d01a4c6
References: <CGME20241226031145epcas2p4fa41b44749a7f675364437856d01a4c6@epcas2p4.samsung.com>
	<20241226031142.1764652-1-sowon.na@samsung.com>

Hi Vinod,

> -----Original Message-----
> From: Sowon Na <sowon.na@samsung.com>
> Sent: Thursday, December 26, 2024 12:12 PM
> To: robh@kernel.org; krzk@kernel.org; conor+dt@kernel.org;
> vkoul@kernel.org; alim.akhtar@samsung.com; kishon@kernel.org
> Cc: krzk+dt@kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> sowon.na@samsung.com
> Subject: [PATCH v4 0/3] Support ExynosAutov920 ufs phy driver
> 
> This patchset introduces ExynosAuto v920 SoC ufs phy driver as Generic PHY
> driver framework.
> 
> Changes from v3:
> - Use lower case for all addresses
> - Add empty line between macro and function
> 
> Changes from v2:
> - simplify function name from samsung_exynosautov920_ufs_phy_wait_cdr_lock
>   to exynosautov920_ufs_phy_wait_cdr_lock
> - return immediately after getting the CDR lock
> - add comment for wait CDR lock
> 
> Changes from v1:
> - use exynosautov920 instead of exynosauto to specify
> - remove obvious comment
> - change soc name as ExynosAutov920 to keep consistent
> - use macros instead of magic numbers
> - specify function name
> - add error handling for CDR lock failure
> 
> 
> Sowon Na (3):
>   dt-bindings: phy: Add ExynosAutov920 UFS PHY bindings
>   phy: samsung-ufs: support ExynosAutov920 ufs phy driver
>   arm64: dts: exynosautov920: add ufs phy for ExynosAutov920 SoC
> 
>  .../bindings/phy/samsung,ufs-phy.yaml         |   1 +
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi |  11 ++
>  drivers/phy/samsung/Makefile                  |   1 +
>  drivers/phy/samsung/phy-exynosautov920-ufs.c  | 168 ++++++++++++++++++
>  drivers/phy/samsung/phy-samsung-ufs.c         |   9 +-
>  drivers/phy/samsung/phy-samsung-ufs.h         |   4 +
>  6 files changed, 191 insertions(+), 3 deletions(-)  create mode 100644
> drivers/phy/samsung/phy-exynosautov920-ufs.c
> 
> --
> 2.45.2
> 

I can't see these patches in -next yet, 
do let me know if anything is missing to be addressed from myside.

Best regards,
Sowon Na.

