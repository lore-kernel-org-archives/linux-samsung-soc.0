Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AA618B476
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 10:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728297527; cv=none; b=aE9QNJg5tf8ikhc1PXraBVtVJe+sLKv/C8i4CvI7zgnwmYZ7S/9siV5Y+fcaDQuxP3IcyGCkV2x7p0mDeL9kaKjMoBrBmaWexHy66r+2LKZuFgSrL+UA/7yZi+MSj8+7XKxNHwjmqJtEa4/KQQOGqkOrcOEOfBovJc0ftM7Hgto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728297527; c=relaxed/simple;
	bh=GNU+vrwJgJNb1iZtPYojM0bx3LyUZWj4S4Y7c6YgARs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=pRFs79Hucu+GdPHRuFz0X9POCoRL26XTYsjhmr8s4Zg8mPqTwLZLOPYZzGn6dgOToB5WeatTB/LlRmAj8KNJADL6ouqifdJ0XJUIeCzrwUB99KRRQnrQbBlrPDe/WvGgW56Un6eechl74yvIeBt4mMJhaJfqkyNXTfNGDjhiMng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=k9Wg0OXq; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="k9Wg0OXq"
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241007103842epoutp04ef50700b64870139e6b5346a3c2c6fbf~8JXC0gh0E0071800718epoutp04F
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 10:38:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241007103842epoutp04ef50700b64870139e6b5346a3c2c6fbf~8JXC0gh0E0071800718epoutp04F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728297523;
	bh=v4/6u8K6sBjv48Tz30keWOypL8e77IpeF76bvG6qJhw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=k9Wg0OXqCP3sVRAOSwx74caTaKUmDFvyMi1+NTl+vsfdVbRZCnfnwYYsN5OrdIHgc
	 XupN795ziRabCiin7kcq/dTsbqwb9A925ww/r/ONJs2jd2oTP2SWXRLbwOxr8pZLOe
	 6cMEfwLhQGyHG+pcJuR2R0CzPnLB6k+VvdQBhtJg=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241007103841epcas1p192eba855b1fdf30ac5dd56839d95dee0~8JXB0mbjK2252022520epcas1p1A;
	Mon,  7 Oct 2024 10:38:41 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.36.136]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4XMbGm4QcHz4x9Px; Mon,  7 Oct
	2024 10:38:40 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	14.55.09406.03AB3076; Mon,  7 Oct 2024 19:38:40 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241007103839epcas1p2aa0d26f8948bf8aba33d8f11e6c8f4e6~8JW-7A5MQ2238222382epcas1p2P;
	Mon,  7 Oct 2024 10:38:39 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241007103839epsmtrp11dbf16769e7621ea484f409e8216e997~8JW-6O-400549005490epsmtrp1K;
	Mon,  7 Oct 2024 10:38:39 +0000 (GMT)
X-AuditID: b6c32a35-83fff700000024be-79-6703ba309025
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	6C.90.18937.F2AB3076; Mon,  7 Oct 2024 19:38:39 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241007103839epsmtip15d1d23795062623ef1c5a345df50be94~8JW-nso660375003750epsmtip1Q;
	Mon,  7 Oct 2024 10:38:39 +0000 (GMT)
From: =?utf-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
	<inki.dae@samsung.com>
To: "'Kaustabh Chakraborty'" <kauschluss@disroot.org>, "'Seung-Woo Kim'"
	<sw0312.kim@samsung.com>, "'Kyungmin Park'" <kyungmin.park@samsung.com>,
	"'David Airlie'" <airlied@gmail.com>, "'Simona Vetter'" <simona@ffwll.ch>,
	"'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>, "'Maarten Lankhorst'"
	<maarten.lankhorst@linux.intel.com>, "'Maxime Ripard'" <mripard@kernel.org>,
	"'Thomas Zimmermann'" <tzimmermann@suse.de>, "'Rob Herring'"
	<robh@kernel.org>, "'Conor Dooley'" <conor@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
In-Reply-To: <20240919-exynosdrm-decon-v1-3-6c5861c1cb04@disroot.org>
Subject: RE: [PATCH 3/6] drm/exynos: exynos7_drm_decon: fix ideal_clk by
 converting it to Hz
Date: Mon, 7 Oct 2024 19:38:39 +0900
Message-ID: <000001db18a5$125e9320$371bb960$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFhWZRKEoYF0bFiO1qJqvKMjjKGhgJZvOb/AnBb7xizSEWWUA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta1AbZRT1y242CxrZBMRvGC24RWdgCmQbSBcHkKkVt9oqiJXqD+kO7IRn
	ErMBaTvSBwxTUg1S6pQCpaGlgNFBCjQ8BGqhQhGB0gfBTqtBxRGbtGiKw0PFhMXKv3PuPXfO
	Pd8DR+R2LADP1Bg4vYbNITFv1DoQEh6m6EbUCsfXT9FXbGdEtL3WitGffmLB6NOXx8T0jfn7
	GP3XP+MYPT7eIqFHDzskdOtPk2L6encNRleO94nout8voHRJaYOYXunplNDV9y5K6MqKWYxu
	d5SL42XMcHObiOn904wyXVV3JEyrpRRjaoeTmB+ODomYtvoDjKndApi2kf2Mq3VDovc72TEZ
	HJvO6YM4TZo2PVOjjiVfTU59MTVKpaDCqGh6CxmkYXO5WHLbjsSwhMwcdxwyKJ/NyXOXElme
	JyPiYvTaPAMXlKHlDbEkp0vP0UXpwnk2l8/TqMM1nOF5SqHYHOUW7snOmPh+BugGfAp6RrIP
	gkqpEXjhkIiE1ppjIiPwxuVEJ4AnyiaBQP4A8P7ygughMV72yISRFodrrdEF4LRVaMiJWQBH
	zcEejBFqOGu8jnpEfsQJFD4YGUI8BCHaAbzzox3zqLyIl6C92Ip4sC/xLjy6Mi3xYJQIhi3O
	YtSDpUQ0nLw2JRGwDA6f/Hm1jhCBsMNZgwgrBcHFmQaxEeBut62wr1csSPxgdWnJqi8kVnD4
	5TnHWoRtcLB7RixgX/jbULtEwAFwtqxEIgxUAHjb1oQKpBLAgUUbEFRKePFchcjjhhAh8Ivu
	CMHtcXhv/sPVJSAhhUdK5IKahIMTU2uTEF6tL8cECQNN9oSPwTNV65JVrUtWtS5C1f9eZoBa
	gD+n43PVHE/pqIe3nabNbQWrTz00qhOUO+fC+4EIB/0A4gjpJ939OVDLpens3n2cXpuqz8vh
	+H4Q5T7rciTgiTSt+69oDKlUZLQiUrVZGUlTKop8UvrtjXxOTqhZA5fNcTpO/9+cCPcKOChS
	XZufq2haWpqjSm+az+9d1PT+nXJIeguGnupQbV/u8Qk5fang/UHLo5fqX5kmZ+7KXb6umK1l
	jrv4vg+6Gvb0+IxWDrxXtKnbFXEmc+N25Gnl1cDcX276J5omzm/Z/cLJ+NuumMHJvre5QGp0
	yXug+ILC+ZoR9ztuarXcMkxYawOdPh8RR4qCZUkbXXFfYb+2kFmNhc1ioulYb51pOcHEwsVC
	NHL/6/l1Y43HxzYl22ZevvJcyqlgWapMXadMMmPBb20o6+yT1T6YQBbGk7I65qsP+D/m4ufe
	nM0q+qZop5/yLB839dnhCNuuN+KbDy2eLbV/t/xs466VpIWORwrFKQXJJMpnsFQooufZfwGz
	VFBMcwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsWy7bCSnK7+LuZ0g9en9C1OXF/EZPFg3jY2
	i5VTV7FZzD9yjtXiytf3bBZ//p1nszh/fgO7xdmmN+wWmx5fY7W4vGsOm8WM8/uYLBZ+3Mpi
	0da5jNXi/54d7Baz3+1nt5gx+SWbxZY3E1kdBD1OrtvM5LH32wIWj52z7rJ7bFrVyeYx72Sg
	x/3u40wem5fUe/RtWcXosfl0tcfnTXIBXFFcNimpOZllqUX6dglcGRfvPWUsOMxfsed0dgPj
	DN4uRk4OCQETiQ1vPjN1MXJxCAlsZ5RoabnJ3sXIAZSQkNiylQPCFJY4fLgYpFxI4DmjxKlu
	ZZAwm0CqxOvVdSCdIgLzWSSeTtrGBuIwC+xglDjatJUZYuZ5Rok9Dz4yg3RzCrhKPGjZBmYL
	C8RI/L06HcxmEVCR2PC2hQXE5hWwlLh26QY7hC0ocXLmE7A4s4C2xNObT6FseYntb+cwQzyg
	IPHz6TJWkItEBJwk9u1lhSgRkZjd2cY8gVF4FpJJs5BMmoVk0iwkLQsYWVYxiqYWFOem5yYX
	GOoVJ+YWl+al6yXn525iBEe0VtAOxmXr/+odYmTiYDzEKMHBrCTCG7GGMV2INyWxsiq1KD++
	qDQntfgQozQHi5I4r3JOZ4qQQHpiSWp2ampBahFMlomDU6qByTlYikfm+0wX4wtxfn69E/JW
	/TZdVsEWOPO+6dvbPf0e5a2HWUQPVOi45Lw7HGrQc4Ol2thKiev6yrvpN2qkDi56urow+MD9
	H5Wytj1JLzxm+l08fsmE08UocberAK9O+MK++eyCrvc7dB+dWmsxy+PUyYM7HUJXLhV6xnYu
	QjW8L0jz2/ldwue8Ajf5fJ+bfb71hbnw1FZPNasP+V+TDp+aqdkmYlwV9ebviRfB7R0Nf2Yx
	L/t2SF9q4/+1jQv3vE3Ldprlr2lt9aE2Lntaje9pvhOTqr5xPQwTv6+u4nKnevulcjanPxtu
	3E/PnV/fUqIuVpPtfslJWtfzckfx12Vbn6YturQoydlBJOSzEktxRqKhFnNRcSIADIPioVcD
	AAA=
X-CMS-MailID: 20241007103839epcas1p2aa0d26f8948bf8aba33d8f11e6c8f4e6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240919151145epcas1p3b3a76512b87498e976db249906a4f5bc
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
	<CGME20240919151145epcas1p3b3a76512b87498e976db249906a4f5bc@epcas1p3.samsung.com>
	<20240919-exynosdrm-decon-v1-3-6c5861c1cb04@disroot.org>



> -----Original Message-----
> From: Kaustabh Chakraborty <kauschluss@disroot.org>
> Sent: Friday, September 20, 2024 12:11 AM
> To: Inki Dae <inki.dae@samsung.com>; Seung-Woo Kim
> <sw0312.kim@samsung.com>; Kyungmin Park <kyungmin.park@samsung.com>; David
> Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Krzysztof
> Kozlowski <krzk@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>;
> Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; Rob Herring
> <robh@kernel.org>; Conor Dooley <conor@kernel.org>
> Cc: dri-devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org;
> linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; Kaustabh Chakraborty <kauschluss@disroot.org>
> Subject: [PATCH 3/6] drm/exynos: exynos7_drm_decon: fix ideal_clk by
> converting it to Hz
> 
> The clkdiv values are incorrect as ideal_clk is in kHz and the clock
> rate of vclk is in Hz. Multiply 1000 to ideal_clk to bring it to Hz.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> index 2c4ee87ae6ec..4e4ced50ff15 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -137,7 +137,7 @@ static void decon_ctx_remove(struct decon_context *ctx)
>  static u32 decon_calc_clkdiv(struct decon_context *ctx,
>  		const struct drm_display_mode *mode)
>  {
> -	unsigned long ideal_clk = mode->clock;
> +	unsigned long ideal_clk = mode->clock * 1000;

Right. ideal_clk should be fixed with Hz.

Thanks,
Inki Dae

>  	u32 clkdiv;
> 
>  	/* Find the clock divider value that gets us closest to ideal_clk
> */
> 
> --
> 2.46.1


